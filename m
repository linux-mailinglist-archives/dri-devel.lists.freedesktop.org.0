Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2DC289F47
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 10:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AE86E11E;
	Sat, 10 Oct 2020 08:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DC66E11E
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 08:20:51 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t21so11789525eds.6
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 01:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eLmaaj3iKZVEqsQAFIpav43sO2/Ep3xsAfBHMAnXMEg=;
 b=J3mvLbuw9M6Ei3FzSEvMNI6uCQSjYoFGv3bXb3QNX/1PUyTROZdwO9cwH3IWaRz3vG
 fNqdySg7c8UpmiEQ/o00/YOnt55AxUkwAsYYPxsWcZwaCzpuXlt2xWSatrv6sHLHxAdl
 w7C2xCnDXNu/x33SJgAunie+lcuakXtrSsJdd2ON2cYniuRBmVQ0eumoJ3pdRcU+bQzc
 BQav4599GyCKpIOFF8c0c4Aggnl1lepxArWachdxIE/hWseNANA4wX0VM0BhCrhbK1SO
 KPDZb0NtO6gkGP5SCKCaflqQr/pcr+jf7PdSsjFAfMeIE7k6QsaacKK/n7SAz1H+q2qn
 09AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eLmaaj3iKZVEqsQAFIpav43sO2/Ep3xsAfBHMAnXMEg=;
 b=piYO/6W9y2K4HP2ex2UBvD5rFnulhsUR0CIDnOQ8GsQr17QMqUWtNulcjZKYxx75qi
 OgT4CIlc5rJCIZBpNEMWWV9XIGr+vR2ZL2YqcFnTJ3EHvNDtPHoSqESMFcJcUnjOcblO
 ko9VQD95DSoOghEGz+kdSP8SEfoFFBOIoUYH2LZ7dX0dyZLT/m+dEO2xJNqX/KBTd9Sy
 yTbaSMK7Y4+xq5gWe0pr2GGcEBwHkjfzXc0dEXr8d40o8oRMqiVAA80U5wXL0xmFJnVq
 OP9CUDozLbQ2o1nKrB0JKJUP1JZsMK9yOm1AUyxiYs2l0Pit8Cj8slwGhaR2nacxhYUc
 RTvQ==
X-Gm-Message-State: AOAM531HfV8WzUV+RtxMlhNrEwHLG7QkLP8rAjCNwON8rEC9b3z/cNdB
 SqFmj0leJGrRbvMxAjM6oG14EwFf4R8ROUDKb+msjw==
X-Google-Smtp-Source: ABdhPJz8WPgoUtyDToLR4Ug+AK9eDkG5mFeVAAytYzM7URqMvaypVfT/M644VVOT0/iTsiUgUFERE3wkJeWjDT6gm0o=
X-Received: by 2002:a50:fd83:: with SMTP id o3mr3433840edt.17.1602318049859;
 Sat, 10 Oct 2020 01:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <1602244675-8785-1-git-send-email-kuhanh.murugasen.krishnan@intel.com>
 <1602244675-8785-2-git-send-email-kuhanh.murugasen.krishnan@intel.com>
 <20201009221516.GR438822@phenom.ffwll.local>
In-Reply-To: <20201009221516.GR438822@phenom.ffwll.local>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 10 Oct 2020 05:20:38 -0300
Message-ID: <CAAEAJfAv5P52aXf9DAm5_7zZhT=J4MmFrda6VQnhwKdbEtPmtg@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] drm: Add Keem Bay VPU codec DRM
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: mgross@linux.intel.com, Jonas Karlman <jonas@kwiboo.se>,
 Greg KH <gregkh@linuxfoundation.org>,
 Adrian Ratiu <adrian.ratiu@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tomasz Figa <tfiga@chromium.org>,
 kuhanh.murugasen.krishnan@intel.com,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello everyone,

(Adding some Hantro developers)

On Fri, 9 Oct 2020 at 19:15, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Oct 09, 2020 at 07:57:52PM +0800, kuhanh.murugasen.krishnan@intel.com wrote:
> > From: "Murugasen Krishnan, Kuhanh" <kuhanh.murugasen.krishnan@intel.com>
> >
> > This is a new DRM media codec driver for Intel's Keem Bay SOC which
> > integrates the Verisilicon's Hantro Video Processor Unit (VPU) IP.
> > The SoC couples an ARM Cortex A53 CPU with an Intel Movidius VPU.
> >
> > Hantro VPU IP is a series of video decoder and encoder semiconductor IP cores,
> > which can be flexibly configured for video surveillance, multimedia consumer
> > products, Internet of Things, cloud service products, data centers, aerial
> > photography and recorders, thereby providing video transcoding and multi-channel
> > HD video encoding and decoding.
> >
> > Hantro VPU IP consists of Hantro VC8000D for decoder and Hantro VC8000E for encoder.
> >

Before you guys even start reviewing or discussing this: good news everyone!
Verisilicon Hantro VPU support is in mainline since a few releases now.

How about you run a quick "git grep hantro -- drivers/" and see for
yourself :-) ?

Spoiler alert: we currently support G1 core, supporting MPEG-2, H.264, VP8
and some post-processor features.

We are working on G2 for HEVC and VP9, and we have patches ready
for VC8000D for H264.

Given the VPU is stateless, it requires quite a bit of work on the
application side.
There are implementations in GStreamer (see v4l2codecs plugin), Chromium,
and Ffmpeg.

Given all the stateless codec drivers depend on the stateless controls APIs,
and given this API is still marked as experimental/unstable, the drivers
are in staging. Other than this, these drivers are just as good as any,
and have been shipped for quite some time now.

I expect to move them out of staging soon, just as soon as we clean and
stabilize this control API.

I will be happy to review patches adding Keem Bay support,
to be honest, unsure what that implies, but we'll see.

Thanks,
Ezequiel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
