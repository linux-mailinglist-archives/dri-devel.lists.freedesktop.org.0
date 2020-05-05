Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B911C6309
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 23:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1E56E430;
	Tue,  5 May 2020 21:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F2A6E430
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 21:25:40 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id p139so899087vkd.7
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 14:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SD6x55Qhc8P/MQPIZ2l6eEcYMnu118KHZyq+VyyY6KU=;
 b=fvA9b4tWrD/H0GLbXPEs6tOAK8UDJwvrvOiaBXGDoleVtHqp6BYMLM+ltfgx/p5gGm
 LwoaRBfPSkzoqh3TIhzjxtbDYblUMcqBZBysucb+19H1nqGwdJsX/IL9K9qBxJ5AZJo2
 DsCRTaiymbtLV9sjkfLLVI0ujcE7nd8j8d/m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SD6x55Qhc8P/MQPIZ2l6eEcYMnu118KHZyq+VyyY6KU=;
 b=mjVQV5lZmrkqflz52L10C21+wa6Zw/RpR6KeHQLHwb0VlgPHe6vI/5MxxILkogyHW1
 Jo/1eJu9zOFP3NYeUCkdt57jpv9Oeh+GJ+QdaqLkA+hSAk4wrVThIDpY6P0MixZSWxKX
 AvDU7v7FmQ37fRlKGIHmSzTWVBMjOdC9GT9YODjLSv0kAR6NxEVpzUITFG8rFfoI7eyA
 kgX4XO+EYFNrMntK/vdSes3CGH7j++6cG+LIwEYi8UIG7mD0U6pKzLlrF8n2gfzTooH9
 jid9cnK3Kkq/dxXu8fFU4pq6h69gmjXB84gukjZadaKvNVrNAuwoJQgzTT4VRoJ7kSkL
 Mjog==
X-Gm-Message-State: AGi0Puaj9j7eQGHGkjogT5WVoiOf807BRFdWJOECEfHpCeodQrNYNqfY
 mgI7ETVCSHTqVTxmNZGTPaMgInXP5z8=
X-Google-Smtp-Source: APiQypK35UZdGpqkgpErSuNE+Nczww+2XdLQE93nwWpj3mwrDlaOZa+RJW+YJcA5tIqwVN2fGVLqwg==
X-Received: by 2002:ac5:c810:: with SMTP id y16mr4265849vkl.49.1588713939637; 
 Tue, 05 May 2020 14:25:39 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47])
 by smtp.gmail.com with ESMTPSA id a18sm1708059vsq.7.2020.05.05.14.25.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2020 14:25:38 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id 1so153781vsl.9
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 14:25:38 -0700 (PDT)
X-Received: by 2002:a67:c40c:: with SMTP id c12mr4978460vsk.106.1588713937569; 
 Tue, 05 May 2020 14:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200504213624.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
 <20200505082436.GD9658@pendragon.ideasonboard.com>
 <CAD=FV=WjUpwu5204K8yHzqsJv4vQX5S5CArH1Kj_kqjhZzTc9A@mail.gmail.com>
 <20200505210609.GA6094@pendragon.ideasonboard.com>
 <CAD=FV=UnGOYh8JX2=fEAqPN7wqANc0QevTirNO-WUDYMPqXcrg@mail.gmail.com>
 <20200505212055.GA17960@ravnborg.org>
In-Reply-To: <20200505212055.GA17960@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 May 2020 14:25:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Viwon0KV297H55Cv0XTaf5p2JFnzjc97m1srpbbmVMnQ@mail.gmail.com>
Message-ID: <CAD=FV=Viwon0KV297H55Cv0XTaf5p2JFnzjc97m1srpbbmVMnQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement lane reordering +
 polarity
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 5, 2020 at 2:21 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Dough.
>
> > >
> > > If we don't want to test that, I would at least document it in the DT
> > > bindings. It will be a good occasion to switch the bindings to YAML ;-)
> >
> > Interesting that you bring this up.  Conversion to yaml is sitting
> > waiting to land (or additional review comments):
> >
> > https://lore.kernel.org/r/20200430124442.v4.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid/
>
> Whole series is on my TODO list.
> But it needs a few hours so do not expect anything until the weekend.

No problem.  I know how hard it is to find time for big chunks like
this.  I'll hope for something next week.  :-)

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
