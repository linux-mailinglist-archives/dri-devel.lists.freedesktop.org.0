Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C385E30CF52
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 23:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA106E9B4;
	Tue,  2 Feb 2021 22:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0A66E9B5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 22:49:00 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id a31so7657120uae.11
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 14:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I0wefJGrPjsFXChEmUYOdBAFKdEXy2ySL5g44yz/32A=;
 b=Hepmxg6omyBiqQo78d8DTl0PY21kJIvLn8JyaRLwonCRwy3kduENUjFCBJ3Tlo1mkh
 uZj2CMHu3Pd7WFhOAXn/EV7Yn121nVoGVVJhTZG7MLFrfXE4tIiKuxKaogMw7zDuQj5C
 Elmm37W9vb8bwRC+A+UEG9m07FmzUe1hUi5sKrxiZRjC4xXIgIf4g0QSgk4rKlFW3E7g
 sddSojULoIoGLmXgmZGRd4Hvj7I45HwfnfhIZRCVTCF0/X8q1Ll7mry+bpBntdQXBprz
 FpmmE9RwLhMW9mjm0cHYAHg8q/Z+llyslpTQ043l9JoRATbPvuDENrvSwRwJEJVr3FPL
 vVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I0wefJGrPjsFXChEmUYOdBAFKdEXy2ySL5g44yz/32A=;
 b=hO9hwwIgkMLpRGbSQQkZOoX1Q0u57wOUS2EvAeRCZeBvNWoXlyHTxsEM6HTg2HHI4s
 g8DXau6s63zz2qyzaop8EichSRk2ZKshCxV+VdqtOuL0gBZvXay828Eu8QUqqtwuEUE2
 hkoRBdIbFMH5rB69D79eqSRYTHzFISnhHC1Ki7GcDegVxkULXfl6Hre6XBmJNsy5vaz6
 DcPUZtqUs9zIM/Ecj2WJ7tWVgk2fcqyz4fV/6YwwtN4k7ymw//FP7ZZQLyGYqDuDRRwM
 vuBQRxOahELn9gugov3Mji4wyTcNL1o2aRk7E0VSc49/EeJbCLwSJfzVUS3yXFVd6K3k
 c+Mw==
X-Gm-Message-State: AOAM530qclAeGWUdGALijVivxiJCRl/gbziDg4KI0GVUb96s+tngUhQZ
 KXQbyeYflgcOrdbJmc/JKjprUpKZgNQgI9R4jqQ6uZ+fEVd9+Q==
X-Google-Smtp-Source: ABdhPJxjy+n0BbCb6LqrxGGuNNwWtOoOluHrjxN7TpBuMufwt2OTyAt51FiuOI/aoOVWajkwTx1VLH/gn3BT9ZFFxSY=
X-Received: by 2002:ab0:3048:: with SMTP id x8mr307221ual.46.1612306139338;
 Tue, 02 Feb 2021 14:48:59 -0800 (PST)
MIME-Version: 1.0
References: <20201210103553.1ae238d2@eldfell>
 <1607591574-949-1-git-send-email-jpark37@lagfreegames.com>
 <1607591574-949-2-git-send-email-jpark37@lagfreegames.com>
 <CABjik9eM1JGy42WgSpqVjxakjHMSr_sxpAPAHT5rrMSZ0Kwakg@mail.gmail.com>
 <CACvgo52y219pp=oD3FPT46YmVYhSwa3BfaQEoq6rj7KwqZE1NA@mail.gmail.com>
 <CABjik9fQkkfmVZKLoVi8VAHYNOkUMaoFSYHxEGP6qKZvMh9VJA@mail.gmail.com>
In-Reply-To: <CABjik9fQkkfmVZKLoVi8VAHYNOkUMaoFSYHxEGP6qKZvMh9VJA@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Feb 2021 22:48:48 +0000
Message-ID: <CACvgo51OWzPmuQyKxKr5EnFpS9FV74-6QZw-fYjFyihpWKF2DQ@mail.gmail.com>
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
To: James Park <james.park@lagfreegames.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi james,

On Tue, 2 Feb 2021 at 18:15, James Park <james.park@lagfreegames.com> wrote:
>
> I'm not sure what your suggestion is. Move which #ifdef block where?
>
Fair enough. Just sent out a patch which demonstrates what I have in mind.

Thanks
Emil

P.S. Please try to avoid top-posting and HTML emails in public discussions.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
