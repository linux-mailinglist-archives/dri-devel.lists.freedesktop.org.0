Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B864D9B6E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 13:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF2610E3F1;
	Tue, 15 Mar 2022 12:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EB410E3F1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 12:43:30 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2db2add4516so200382277b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 05:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zM7PG/RdRHw9f6iBibZ0hDNw+hF+S/2aL5rwx9V5Hc4=;
 b=nR1qrXaPmooiwTywf1pOo2XV8jI1aj+ALhV1WYrZn8Bzit9fW9AkhOG0+z7MOxAjh1
 iqTMLE8f8HzEoR35CgDLZzU0x1YPDlaLtonEqs9Iy91kn52Z/+eCH6IkbFQPKpsL45/t
 ihJl/3hcliojHC4Bba1/Y7IsjIJX9NCsJ/zUG5GKDT/Wcn7YD0Uwgq2a0kK4ye807Bc5
 78oVtw5/voG4BakSHOOLW+RH2YpWTZMd21BFkVgioDCwuQq/aj2Wu9gsTzuO67FFaNIu
 VT9DNke3Hl0zWtAQr554hmchGXyzYveuj+5IJd0+2DUzQ8gqm4qCnQ4KtLqSAJuenwaI
 eFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zM7PG/RdRHw9f6iBibZ0hDNw+hF+S/2aL5rwx9V5Hc4=;
 b=R5g+k/QgQBYkDshP5ZVlPVJda+nhlNZXr8SInzM2w6ij+Xo5aqAqyIBSIP4NaF2rkT
 5KBftGURMma4AjFfZtSvDSwXoAUyBpVvattCvkKtPDteLzxelSn0DA7EnwHTY21uyTJX
 oGaeL3x6SsXTaypqTCOfhONtFRJYBE4ppw7IQ1YsSrc7y1Gg5pRmEEj/kGVAgIK1WNZX
 ozdpbDd6PyAW+mCg2nUeLXO0PeQRYxBFNtVErTk7ROFpchXMTYSah0KeCOvU6eJsoNKO
 eNvOhvi6jBRZX+1f6ih7xxVbX4zeVjd3Th3kGTWlmCXbOdDJSFcdyfLJQuLj5m8V/2D1
 oWLw==
X-Gm-Message-State: AOAM533NAd/Ch0WuUD4XW6um/8xkW+ttUZ1Oktg+WZwRQp6693HTL5tF
 xudS6UQGLtKAYjZyWS55prnXdvLYG/4avDKKEFnSTg==
X-Google-Smtp-Source: ABdhPJyazqAxW0/G7WqBT80tfyS+1LBtCC3BjhRKfI/GlPsN1UNW//Fy3MNB2ipKA2wpPQtmC2JXOlJLZOMZ75di+uk=
X-Received: by 2002:a81:1182:0:b0:2dc:4e58:da41 with SMTP id
 124-20020a811182000000b002dc4e58da41mr24091863ywr.268.1647348209540; Tue, 15
 Mar 2022 05:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220311083323.887372-1-s.hauer@pengutronix.de>
 <20220311083323.887372-23-s.hauer@pengutronix.de>
 <9ec29d9b-8197-98fb-c612-5c842e4212c4@rock-chips.com>
In-Reply-To: <9ec29d9b-8197-98fb-c612-5c842e4212c4@rock-chips.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 15 Mar 2022 12:43:18 +0000
Message-ID: <CAPj87rM4StzGMqPfK=j5p0-mY2=ENZnZWx9QDL_jo8SzNTXWTQ@mail.gmail.com>
Subject: Re: [PATCH v8 22/24] drm: rockchip: Add VOP2 driver
To: Andy Yan <andy.yan@rock-chips.com>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Tue, 15 Mar 2022 at 06:46, Andy Yan <andy.yan@rock-chips.com> wrote:
> On 3/11/22 16:33, Sascha Hauer wrote:
> > The driver is tested with HDMI and MIPI-DSI display on a RK3568-EVB
> > board. Overlay support is tested with the modetest utility. AFBC support
> > on the cluster windows is tested with weston-simple-dmabuf-egl on
> > weston using the (yet to be upstreamed) panfrost driver support.
>
> Do we need some modification to test AFBC by weston-simple-dma-egl ?
>
> I have a buildroot system with weston-10.0.9 and mesa 21.3.5.
>
> After launch weston, I run weston-simple-dmabuf-egl, but from the output
>
> of sys/kernel/debug/dri/0/state, the weston is still use Smart0-win0,
> which is
>
> a non-AFBC window.
>
> Do i need to modify the vop2 driver to set one Cluster window as primary
> plane?

Are you using the open-source Panfrost driver, or the proprietary Arm
DDK? The DDK was previously using some non-standard modifier tokens
which have since been corrected upstream.

You can see from running `weston-debug drm-backend` (if you start
Weston with `--debug`) the output as it tries to put client surfaces
on to overlay planes, and why it can or cannot.

For Weston's own composited output (used when it cannot place client
surfaces on to planes), it will just use whatever the KMS driver
declares as the primary plane. Weston does not have any logic to say
'oh, this plane is AFBC and AFBC is better, so I will use this as my
primary plane': we just follow what the kernel tells us.

Cheers,
Daniel
