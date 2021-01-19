Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEEE2FBC86
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 17:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650F389B70;
	Tue, 19 Jan 2021 16:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A1A89B70
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 16:34:58 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id n11so22641847lji.5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 08:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GJElMsXpd7GFpNrD75KD9UhSl7TfALCBZbvVWC/uQuk=;
 b=lJ1nsiqbSYvGY+KRv2BhZEjowGdlIzAA/AETzty3vPUXDKv4wlPjy1cQJITvgVMMBg
 bEXR5PQnzyN9j7AxiUbx1q6qjw0xzsxW8hJ6GxAZygVXlWboHrB+vlVdJGeeC8CjkUL+
 EkzWM1pJ4cO+v+USaVWp3ip4um8v5NEsT7oA4S8etqarH5TQRkwuhs7EkgSJSlp/TO98
 +ToskTK0Uveife1NGzAKXPKHjBcC+gQnrN4M4shKZMuE3lsWaHXPTLTizgx0UYRIOVgP
 vLpjDCdViOh5eTumoFCA1wmvGrOQqtGoU7kualsSo515PZtZC6/bqbCNvMzijKHu2kIs
 UokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GJElMsXpd7GFpNrD75KD9UhSl7TfALCBZbvVWC/uQuk=;
 b=fmxBcPaBmH3cuPnQnXiNuV2kfYFYq8jonZqHtbiWWezv58rm0/pZU7E6un245UGoNp
 vxmvkLoXQYEdkONtNec0g8YQrBFC/Epg1+ATVMtX0nnAlxd4uuMXmpnpiTPuSKLVbrrl
 Bzl3LIR39FPercKUrLaVKdCf7sEqUmTPsTDOATMT4IyMBj32BBvXCFM6DXnc1tOOjwoY
 fEEkRaE/mw6VlRdq72OFOWA+47+OQh+vFht3POkA0xRWYPn0vYg/TVqeyn0jfRAvdnRt
 gLFJ9qehgcxKjcMQpNzbH4dBSCZINQULBXerW3bght3jX9dxdYzRV5eDnBHaQfNS1jKk
 dJaQ==
X-Gm-Message-State: AOAM531UHPdr5wvojrZMMwN/rRjDRX3LUSUfbnSaZzndvZEo1wuudZaJ
 XXe4QUT5hVbDMpQqcNLjPLCl3j/kqRn3OhXxCcZSVQv2vMcLBQ==
X-Google-Smtp-Source: ABdhPJyb/GXShMJu4ujimFKEBOgqdNoAmp6XH9ybFe7Bo7gp6a9lz4BsgvsFETwBsBdBojPOxCt/UgCNlK2p77e32TI=
X-Received: by 2002:a2e:8416:: with SMTP id z22mr2252703ljg.347.1611074096394; 
 Tue, 19 Jan 2021 08:34:56 -0800 (PST)
MIME-Version: 1.0
References: <20210119140830.6654-1-p.zabel@pengutronix.de>
In-Reply-To: <20210119140830.6654-1-p.zabel@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 19 Jan 2021 13:34:44 -0300
Message-ID: <CAOMZO5CsU7-GOkkbV+5Bqf4eoDYKDjm5amOQN4LMYAdBP8nXUA@mail.gmail.com>
Subject: Re: [PATCH] drm/imx: ipuv3-plane: do not advertise YUV formats on
 planes without CSC
To: Philipp Zabel <p.zabel@pengutronix.de>
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
Cc: Sascha Hauer <kernel@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Phillip,

On Tue, Jan 19, 2021 at 11:08 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> Only planes that are displayed via the Display Processor (DP) path
> support color space conversion. Limit formats on planes that are
> shown via the direct Display Controller (DC) path to RGB.
>
> Reported-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

With the IPU workaround you sent yesterday, I am able to play video
with the correct colors.

If I don't apply that patch and only apply this one, then the
Gstreamer pipeline does not start:

# gst-launch-1.0 filesrc -v location=/media/clip.mp4 ! qtdemux !
h264parse ! v4l2h264dec ! video/x-raw,format=NV12  !  kmssink
Setting pipeline to PAUSED ...
[   14.836438] msm msm: [drm:adreno_request_fw] loaded
qcom/yamato_pm4.fw from new location
[   14.847716] msm msm: [drm:adreno_request_fw] loaded
qcom/yamato_pfp.fw from new location
[   16.103923] random: crng init done
Pipeline is PREROLLING ...
/GstPipeline:pipeline0/GstKMSSink:kmssink0: display-width = 1024
/GstPipeline:pipeline0/GstKMSSink:kmssink0: display-height = 576
WARNING: from element /GstPipeline:pipeline0/GstQTDemux:qtdemux0:
Delayed linking failed.
Additional debug info:
gst/parse/grammar.y(540): gst_parse_no_more_pads ():
/GstPipeline:pipeline0/GstQTDemux:qtdemux0:
failed delayed linking some pad of GstQTDemux named qtdemux0 to some
pad of GstH264Parse named h264parse0
ERROR: from element /GstPipeline:pipeline0/GstQTDemux:qtdemux0:
Internal data stream error.
Additional debug info:
../gst/isomp4/qtdemux.c(6545): gst_qtdemux_loop ():
/GstPipeline:pipeline0/GstQTDemux:qtdemux0:
streaming stopped, reason not-linked (-1)
ERROR: pipeline doesn't want to preroll.
Setting pipeline to NULL ...
Freeing pipeline ...

Any ideas?

Thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
