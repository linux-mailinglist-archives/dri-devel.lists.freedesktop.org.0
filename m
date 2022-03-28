Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BE24E97EC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 15:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C450610EA3C;
	Mon, 28 Mar 2022 13:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D7D10EA20
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 13:21:18 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id t5so12615651pfg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 06:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5c3917MAZUYc8aYNOkJjQUYFUTHwIYAfPcFsBEaVqNw=;
 b=r39mJhBONAyJ7iXYcHhktyYbkv/FPoZd74/kg4pgnTyGP1heoE7mTSS62HxWYxqLm4
 PuXMXRdxhhUPQgQDEKXSTDKbCERIm4ZxXgMFSGHxPwq7rEmRd9kjNCbu4ZDixvhilV6w
 v7W70+Mv6ParbmAjsbbGsb/VYLI5oIHC3oCg2tQ6awPFhRo5EDLR5YqsOm9KVXQzwjBa
 eoC/H/OtOefp9xkaXUJ81Hjr+2imn9dVDM5MEf0XlnRX/GUs6ZJOroYAWgl09x6vwwmY
 rSRL7wd4/o3bYrmaSkTnqSR6MV/SQGq88Hrx+DT1s/9/8Ge1VJ8k8golO2cYUQMzpRGC
 NVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5c3917MAZUYc8aYNOkJjQUYFUTHwIYAfPcFsBEaVqNw=;
 b=S1Kui3oZ/GBOQ9QZVhhxNT4erjWhNfrISByXzljetqgiGxGQzu06JK7kli8uAZW3Vd
 jMfy3pU9kWswYycJRAsjGQ9Tc1+xwwD+C2tj5LEIIjc/5/Lzy7opu5Y61tLiPyw0kp8K
 o0CldeY8boPm/YbfaekkC2xaUhlUI9iyGzFD5I5sT9zbgTB3yXVcqRKDiOnLqOiLpR2G
 yYDAvsfjw4PHMcGkfPIG2XVc/V7KRVZY4SB4IQSdfG8N2Eb6IWFxaTFmB4Vd/he47xuI
 cRam1pDcDQyjk6MAM3Wd0X1T/LEhKW/RZ7+JJ2i9I+v59n/IcMAirZxWv/a0/q+6aibM
 gMLg==
X-Gm-Message-State: AOAM533apjhEiX5J8GubkO9jT8usbm7e3GDPUBhuAbJJc43gdtNQJt9D
 kVpsVTnzr7OtoEfirZ6It9QEpiJCI4GRQBYHhb5cWw==
X-Google-Smtp-Source: ABdhPJyfHIEgcq0z1XfEkx7RvUBOUzGmsXb6PCpzATZyq9pUeZ2izW3H71PqV4LgpviFa/P7cR8EnzqtvU9/vZhAiCg=
X-Received: by 2002:a05:6a00:1741:b0:4fa:f5bc:30bd with SMTP id
 j1-20020a056a00174100b004faf5bc30bdmr20188685pfc.0.1648473678172; Mon, 28 Mar
 2022 06:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220322080213.1487134-1-xji@analogixsemi.com>
 <CAJMQK-j+PhB6dZBuKG3NtW94oT0bVkp9G1bXhmyZLgYOmTCgog@mail.gmail.com>
 <20220322085208.GA1487511@anxtwsw-Precision-3640-Tower>
 <CAGXv+5Gddu8VU7xjX-r2=u85i7Ut=_6JpQV6py52OyzEkpezTg@mail.gmail.com>
 <20220322101342.GA1493353@anxtwsw-Precision-3640-Tower>
 <CAG3jFytYcLP_1JJzoTU8YcwXp8==EpPdad5z02ROu8HtuaqfzQ@mail.gmail.com>
 <20220325062912.GA1527766@anxtwsw-Precision-3640-Tower>
In-Reply-To: <20220325062912.GA1527766@anxtwsw-Precision-3640-Tower>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 28 Mar 2022 15:21:06 +0200
Message-ID: <CAG3jFysrg6opHQpqdy9aDSQWFkwyGfZYG9PStTaApkS=euk1Ag@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: anx7625: Set downstream sink into normal
 status
To: Xin Ji <xji@analogixsemi.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, qwen@analogixsemi.com,
 Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 treapking@chromium.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 pihsun@chromium.org, Hsin-Yi Wang <hsinyi@chromium.org>, tzungbi@google.com,
 bliang@analogixsemi.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Mar 2022 at 07:29, Xin Ji <xji@analogixsemi.com> wrote:
>
> On Thu, Mar 24, 2022 at 01:07:56PM +0100, Robert Foss wrote:
> > > > > > The driver uses DRM_DEV_* for logs. Can we use this?
> > > > > Hi Hsin-Yi, as comment in drm/drm_print.h:
> > > > > "NOTE: this is deprecated in favor of drm_dbg". DRM bridge driver not
> > > > > use DRM_DEV_* any more. I'll send a patch to replace all of DRM_DEV_*
> > > > > later.
> > > >
> > > > drm_dbg is better than dev_dbg though. With the former, you still get the
> > > > option to control it with the drm.debug module parameter, unlike the latter
> > > > which normally gets compiled out.
> > > >
> > > > Please use drm_dbg*.
> > > >
> > > > ChenYu
> > >
> > > Hi ChenYu, the parameter of drm_dbg is "drm", if use drm_dbg, it will
> > > change more code, I'll consider to upstream new patch to replace all of
> > > them later.
> > >
> >
> > Alright, since the driver already uses these logging functions, let's
> > apply this patch and fix the logging function this driver uses in a
> > separate series.
> >
> > Xin: Can you submit a patch/series that converts this driver to use
> > drm_dbg* functions instead?
> Hi Robert Foss, OK, I'll submit patch after this patch get merged.
> Thanks,

Applied to drm-misc-next.

Rob.
