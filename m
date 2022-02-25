Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF0B4C428C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 11:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489E310E88E;
	Fri, 25 Feb 2022 10:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A8910E80C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 10:40:37 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id j24so6851071oii.11
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 02:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=XmHgx7i/9vNrhvW/myAVOgnrCLxN2TVncbf1coqXilo=;
 b=JShMinXGneeNUXr6MBtvLnsdFzLyYYPtsUCiR1SgKcXep3GIi8/lspMh7qpTsNS+4P
 IQU+sI8epCbEo+wm4GebX17uOpKZdhmwAdbT807V0RgLDlEvibQSQWM7XdjGnZCNmPIa
 6hKDByDP3wolEPSOkSdLIyX3nQsPCK5Vfy5L+waT20TTaKawHhkeTmNSPEte2FmrceFe
 v+6xcrbAgcBLra+7OTyLfY9V1z4JRO1vrdf5TwzAdbXW5ZbXl+1QiUYQJ4nnqrmbgfhV
 rKN3RIc45tWwJoHgB8Zony4h91g7IoWebGN/osaLBTHRi4zLm2FgRV7TzjbfNPcVFxB6
 LA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=XmHgx7i/9vNrhvW/myAVOgnrCLxN2TVncbf1coqXilo=;
 b=p0lZB1ubRfzj+IF4Xeo6Fb7T09h+B4drZzhAY8WiRzikGJHYXwQygv2uAYniQA45gZ
 /nGVkEzrrolsHmQLR3HzN2YgpYf6s7547ffDXp0wL8w0aS2vfdh6bw0YKtVqDnez7zfP
 GtvvbGqQGiTe34sva8Fwmt+e7IHVYeIlp9muRHIRVxrMLjnCqSLQJhN/e5C8wmejpaMP
 B/Lj8KwW2xrJdkxnG9YdnwNZn1gk+KZYbs/io7aN5QBG/YEeGNft/dmu8burRR5uTnr5
 V6jWuo7JZJBQqagiZ68CKmQ6mcaczGMPqN//m2p9xZnP6lCC6io7lZsI9t6UWvXmB8SW
 EXpA==
X-Gm-Message-State: AOAM531LhFrWfBcFZnGnABxTZK16BSSDTcxvuICkH4OncDL542HaHNZo
 4Mp7JD580R4PfTq6+nHrgnL1dhPvk5/OhJ99FmiDzQ==
X-Google-Smtp-Source: ABdhPJx9aAd/x8lOBAlC3AOKrKYl71PZj1ZJrbUXQn++GPnT4jD/17UUadhTANVxEvJPL5JqOpZ6gLbTAqxp4YOXaXo=
X-Received: by 2002:a05:6808:114e:b0:2d5:4101:844e with SMTP id
 u14-20020a056808114e00b002d54101844emr1162908oiu.169.1645785637242; Fri, 25
 Feb 2022 02:40:37 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 02:40:36 -0800
MIME-Version: 1.0
In-Reply-To: <1c791b60-935c-1e8e-dd1b-4b18fc273c1b@collabora.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-5-granquet@baylibre.com>
 <1c791b60-935c-1e8e-dd1b-4b18fc273c1b@collabora.com>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Fri, 25 Feb 2022 02:40:36 -0800
Message-ID: <CABnWg9uoDNbA6ZYGdEgkyySBW0pfY1+3Zrnh51XjadNU8_+U9A@mail.gmail.com>
Subject: Re: [PATCH v8 04/19] video/hdmi: Add audio_infoframe packing for DP
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@linux.ie, 
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com, 
 maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, mripard@kernel.org, 
 p.zabel@pengutronix.de, robh+dt@kernel.org, tzimmermann@suse.de, 
 vkoul@kernel.org
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting AngeloGioacchino Del Regno (2022-02-22 16:16:48)
> Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> >
> > Similar to HDMI, DP uses audio infoframes as well which are structured
> > very similar to the HDMI ones.
> >
> > This patch adds a helper function to pack the HDMI audio infoframe for
> > DP, called hdmi_audio_infoframe_pack_for_dp().
> > hdmi_audio_infoframe_pack_only() is split into two parts. One of them
> > packs the payload only and can be used for HDMI and DP.
> >
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>
> Hello Guillaume,
>
> I've just noticed that this patch will not apply against the latest linux-next,
> as the include/drm/drm_dp_helper.h header was moved to
> include/drm/dp/drm_dp_helper.h
>
> Can you please rebase for v9?
>
> Thanks,
> Angelo
>

I'm sorry, I'm a bit of a noob, I rebased this series against 5.17-rc4 ...
I'll rebase v9 against linux-next.

Thx,
Guillaume.

> > ---
> >   drivers/video/hdmi.c        | 83 ++++++++++++++++++++++++++++---------
> >   include/drm/drm_dp_helper.h |  2 +
> >   include/linux/hdmi.h        |  7 +++-
> >   3 files changed, 72 insertions(+), 20 deletions(-)
> >
