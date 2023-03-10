Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0F56B3FF8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 14:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597F210E00C;
	Fri, 10 Mar 2023 13:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F5E10E00C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 13:10:39 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id by13so4597669vsb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 05:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1678453839;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XRMoetSL0GHSwwwj1wmBm5ewQyEkCtGxZJc7KzxBJQA=;
 b=MwOZKGFtH8HzvN9rnmgSWskUPxTw1Li4VxYVMFJS+z13XHFjmGpHEsy3xPcwo8jc9O
 JiXxCfDNG6OPaMvfzTdjIteAhCBVHzY8Mly7EnysV0dQ0y1n6Ut0vbL4Itn5q5QM/ttK
 XLH7faBJYzGcWc3ZczgiX+T90MHuDTErOjYuXXITmzzz3RsP8JaKKWXJNbXW2IBG7cr+
 JGwdNL2hKh4yNautD6AbloLQzSG3rZs2Yj0haihhcdsRT7OaLgTu1mHqftXfAUdOlr9F
 26D/ssBkYNygvHhwlgLGrmP5EpvrBIsoGJbZIKIRh1FLiS0Q55jmalJKNHeiXAlZ7NpG
 lrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678453839;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XRMoetSL0GHSwwwj1wmBm5ewQyEkCtGxZJc7KzxBJQA=;
 b=0vD7ASscxFDbBPKcAOJsUZ+OIgHJBjEqa0bJqXU9MqxZhhZYSvRvJADhY36rsz1a/Q
 UfWdhT6O3xrwyqim3A5OnxEVZCA3l0j55XTKCANguZKVKSdMLiUe7+wgkiFY3ykQ9po5
 oMsCe7D0I1n16H/T2paEt+65jFaSYqhq+PIpNWU5PoOcQTAgFQVzzlYRIoSDBO5Imelz
 xnzHKAHD+0nox+6v1Wjo2Uij/aqkyhPn0ZkHGxXsXnhgRtxACdKUlIPbXQik4oLidUT1
 846RyOXB28xR3uAlxzzHYoAQoHgkt2R5mYtgRDKp9FUavO4hxx7tkipp09zKRN8ZNFGI
 dhwg==
X-Gm-Message-State: AO0yUKUZLLfdpzw3M6x5v+b6Ob8wVNHGlXsKuyo/b24lQaHdamiWopeA
 2J/jB8ykH/joqdm7V0ICCUHOjtgDq5hNDqy5k4ny5A==
X-Google-Smtp-Source: AK7set/+EV+1um63/AijBNO5SKa12d6eEMjF9aMJmSeY6zSahpTdY+CD/KkOHW/wOpqKeo/V4NJOMTgQYUpSBHZ4puw=
X-Received: by 2002:a05:6102:302f:b0:414:4ef2:b607 with SMTP id
 v15-20020a056102302f00b004144ef2b607mr17114657vsa.6.1678453838984; Fri, 10
 Mar 2023 05:10:38 -0800 (PST)
MIME-Version: 1.0
References: <7d216faea9647d328651460167bc27f6@rmail.be>
 <f9499ac65afe3d23079c5bca5e3c40bd@rmail.be>
 <CAPY8ntAGvQdSVt7meb2ddz+UejxpKPvmAcgYUyPWR2+R3e=wRg@mail.gmail.com>
 <20230308123540.zqqe4mnhzumvnjfk@houat>
 <004db85e5114674bfc432043376bcd00@rmail.be>
 <4862350fa507612e03bb6a73977db178@rmail.be>
 <CAPY8ntB6WaCF4H2Bk7Zq9cCE-iR8fMFq-vDULH_rp_+O4xp+EA@mail.gmail.com>
 <2835cfc754ebc29561bcb053cadcd528@rmail.be>
 <993a86eaeab527f847f66d93ea514598@rmail.be>
In-Reply-To: <993a86eaeab527f847f66d93ea514598@rmail.be>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 10 Mar 2023 13:10:22 +0000
Message-ID: <CAPY8ntD_DV+LGii-WFs9_pjn5HK8safOw-Mvb5i2rD4MXcpVcw@mail.gmail.com>
Subject: Re: [regression] RPI4B drm vc4: no crtc or sizes since 5.17 (works in
 5.16; and still broken in at least 6.1)
To: AL13N <alien@rmail.be>
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
Cc: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Mar 2023 at 12:59, AL13N <alien@rmail.be> wrote:
>
>
> I donno if this is related or not, but since 6.1 has v3d, i'm assuming
> the opengl compositor will be faster and not draw too much cpu?
>
> I did try youtube video, but that on 1080p fullscreen, takes all the CPU
> and seems to have dropped frames still?

Does your browser actually use sensible EGL calls to pass dmabufs
around the system? Chromium with Ozone sort of does, but that's about
it.
It's another thing that is implemented in Raspberry Pi OS.

> does rpi4B actually have video decoding hardware?

I've already referred you to https://github.com/lategoodbye/rpi-zero/issues/43
> VCHIQ codecs - Unknown

It is present in our vendor kernel, but not upstreamed. You've chosen
to run mainline.

> and is this related to
> drm? because netflix did not work at all, which requires drm, but is
> this a different a different drm than this driver?

Digital Rights Management != Direct Rendering Manager.

Netflix on an unsecured platform will only work through something like
Widevine for software decode.

  Dave
