Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B34D444439
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 16:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B9E7362B;
	Wed,  3 Nov 2021 15:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0035273628
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 15:04:12 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id t38so2591585pfg.12
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 08:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iRvWtzwg/X+s+PVSCDVSgb8j+VJEj6TNe4P8gzkbf1E=;
 b=bHso6gi1DV1CF5WZ9TAs3H1Xlxf1WMMoI+tP6FGXAHPjJeiGAN+EnsdUBTiNl8eDZU
 kuKR39LqXDa8RpGyzqZjIzz/U1fQX5ZpAsjl7SbJTLnVE2m9pnhAiQrWmjrv3TWj1PiY
 GJdYf3hDaE134sx2ZFosOX2o30t5fh09v1GgMUXPS7JTxiGIHWaQ3VrvpSu114plf20a
 a4TtC6+WV825bmrzQOq3/5y+sRmHEnWzg2DaUPq5gGprf1Hdonvz4lAYa0Qr0x/JlaJR
 cxWG+R7Qy8CAw9XI/4goKMajav8EfIWyaTx1WVQapGyn/zEs2Rhj4Hpr5vzr0AogThnc
 xaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iRvWtzwg/X+s+PVSCDVSgb8j+VJEj6TNe4P8gzkbf1E=;
 b=4bdBHGu5tK5ujMK5SlZQrGX5n4CktqaFtj/+8TKFrl3J15m1z0L1RvwLgptAeOfMbx
 oIKcQH8kSIMuI/vQvp4d8e56yOgKTOrtHeCKSIpYGTDBcjCOrUzsU1ILJmF1+tN6bPnD
 +ah/doeQW3FhiBoYtVtBvvzHftwt+1mGXsAn87V6FwH8lT+M8xRX5ZUO8x4w+xxIkGjG
 s2RH/0r7snEe9nUR2GnMoxeQ6CA+SdEFQmDkYHc3PGUtk/65B2Xzvn2ik4FDBhpHqJKg
 D1922jkPmZoRmXz0nBgxBJE95mMXUUkA2EEbCFCYUF9oQRMU8LnZfFskJejLZ3Eu0P66
 F4LQ==
X-Gm-Message-State: AOAM532tyXu2QWARGsz5Q0ZgBgbLQXWZ8M6lwqw+hoea7+QkK9WnsnBl
 YCeZWZ6TyKbtxBIj8mHPnlbpG+PU+NLnfGq0b2xGsw==
X-Google-Smtp-Source: ABdhPJy38kv5yu9QkI0Sc1dz3CnMHn3IkSiqnB7JWHoxSzZxmxMosM6+HZrXEOIfa5D3aPYkHr/k2LSt1kVITbbIoRM=
X-Received: by 2002:aa7:88c4:0:b0:481:22c7:3d57 with SMTP id
 k4-20020aa788c4000000b0048122c73d57mr13744491pff.1.1635951852566; Wed, 03 Nov
 2021 08:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <7dc405471da4771641d2942960d364a588bb4395.1628161369.git.xji@analogixsemi.com>
 <20211018030529.2055255-1-xji@analogixsemi.com> <20211103142003.GW2794@kadam>
In-Reply-To: <20211103142003.GW2794@kadam>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 3 Nov 2021 16:04:00 +0100
Message-ID: <CAG3jFysp-Gs_Zk2PooTpqig1ns5pi+FKASMy=FW1V7oecdNGig@mail.gmail.com>
Subject: Re: [PATCH v11 4/4] drm/bridge: anx7625: add HDMI audio function
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: devel@driverdev.osuosl.org, drinkcat@google.com, jonas@kwiboo.se,
 airlied@linux.ie, zhenli@analogixsemi.com, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 anarsoul@gmail.com, a.hajda@samsung.com, boris.brezillon@collabora.com,
 duwe@lst.de, span@analogixsemi.com, hsinyi@chromium.org,
 m.szyprowski@samsung.com, sam@ravnborg.org, Xin Ji <xji@analogixsemi.com>,
 bliang@analogixsemi.com, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Xin,

This series does not apply on drm-misc-next. Please fix this and
resend. Make sure that checkpatch --strict passes as well.

On Wed, 3 Nov 2021 at 15:20, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This is a super awkward way to resend a patch series.  Next time, just
> start a new thread and put [PATCH RESEND] in the subject.
>
> I am sorry that no one responded to your thread.  :/
>
> regards,
> dan carpenter
