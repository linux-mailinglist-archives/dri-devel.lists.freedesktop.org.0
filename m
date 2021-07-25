Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314303D4F35
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 19:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFDE6E1E0;
	Sun, 25 Jul 2021 17:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75326E1E0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 17:43:24 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id h14so11135105lfv.7
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 10:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5+D46j5lBWVqZZafHydjsuoYe7p3LfoumSXDxyV8rTk=;
 b=nARozgr3CDuWsezzhSjnLxSN0n108QYqLoG9OVavEpfnlBMpC7a8wd1tm1oqvz3rUv
 I9MDcktUYKQg7ygTY4RCmwJUGt7hkLQDgLg9zmxDtoBah38/xOOaV9Xg5cz4qe7tX4nY
 L5cbRTPHcV5WbUPjG0SrFzbbePODIbrRI5SjWyHakI1/KZWX1TIPy7yCtnRIOcf95tKX
 1/+4gHxulRNml8WmcunYHyPnZu/xH2h7SYNkUljYQKC7Y2b09SdcpTwrkohSOAnQOAfW
 k2x2mLtUOcNS5Ppqt/gSam1cpDulZG5bCRC6vnqBn05CbSSgzikjHYbfzRP1N4n/0D2Q
 hlag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5+D46j5lBWVqZZafHydjsuoYe7p3LfoumSXDxyV8rTk=;
 b=ihpS4kZD4JDkYzZXLLuJTK9Or07OVcqS5ge8/ILV36kGvsqkyGIYUIQK/lb5bEHayN
 bVe5zrCI8hNAl7R78Rv7RT8eQoJZ2GlsOfQQJKDh96/Bjyjxe8TbFPbPLZ5hdTVEyOSB
 1yMUkNXqZQqulqfSgfFFpdQ7g40tLFIP9LlNo8EluXeezV2KQIOD1lEtfNNKXTLbHE3J
 9ScGNed6McnjFu9yNvL/cinr6j4Oo8vclOOdqPZUpfEtICIJ7rrXsrZ1+zN5XZc/XUX2
 OyKUiYTbX1kQFLyUduRCIruIkI6kSA4GuCuB5YSXEqp/5cbVhTycjkfFycDTjdMXxGVp
 YuuA==
X-Gm-Message-State: AOAM532lpxHkAtdrjgUnO/T5xb/rUsXHL6KdUOeNxx2SIeIrnBYbhf3J
 dqree4x6TuHQS+e2iHDmrPcu4fu8eZTiTweQ9cM=
X-Google-Smtp-Source: ABdhPJxTS4f1hWJSAhFCUrUHn59AlR2zIlzrsCYVbpIzT2OJFOG/+rDxtC3OZ5FAMgWMt9S2IsoB0A3F7i4yJ9tdbK4=
X-Received: by 2002:a19:4341:: with SMTP id m1mr9806465lfj.443.1627235003144; 
 Sun, 25 Jul 2021 10:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210725172822.890363-1-jagan@amarulasolutions.com>
In-Reply-To: <20210725172822.890363-1-jagan@amarulasolutions.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 25 Jul 2021 14:43:12 -0300
Message-ID: <CAOMZO5DNmwgGgvx1EekBqm+e1h3oCTZU2ATOvFom8BJjRiAzKQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: panel-simple: Fix proper bpc for
 ytc700tlag_05_201c
To: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On Sun, Jul 25, 2021 at 2:28 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> ytc700tlag_05_201c panel support 8 bpc not 6 bpc as per
> recent testing in i.MX8MM platform.
>
> Fix it.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

What about adding a Fixes tag?
