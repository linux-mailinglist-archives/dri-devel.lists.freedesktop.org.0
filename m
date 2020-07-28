Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 435A6230B6C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 15:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624216E2B8;
	Tue, 28 Jul 2020 13:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951FC6E2B8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 13:26:23 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y3so18290385wrl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 06:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v/s3jq9NJ73fEE3PqAt09ZsxAzz0EYmQoxyJ22ptWsE=;
 b=AMNAOQuHuu9Kq4fDu9l86Z+9ICzEZfJEibVLB529V+O1SpWFHMlJ2zLBtF+rO+y7TG
 Q+wZFwzJLVUo8NsOAhuvJbfWElzNvmspMdU+oCiHJKEmskHEEe2yRp80MyOy3BJGX7/P
 5G7J2GCI1EiCkBgjlsbKARbl8zb+EbhhKFO1lUaznDnlpxOe05I5ejiSQ08hPLfhy8Cc
 djkj9X3+p1ECObpBykTuNlRS0OjjvH4VrX6Mo3X4oLB0NSHwm334lJN/fHNRczPkHqRY
 WQ9K4Pql1wqS8SnhzjwOrh9KUf9xlJyx9GlC7iyIuXrgQG3G22OshAjviDbHhl7ZAi1l
 phyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v/s3jq9NJ73fEE3PqAt09ZsxAzz0EYmQoxyJ22ptWsE=;
 b=tQivf8JhCaEInOjNqCKYIU7Cq9PlbESOVIvkL/xQtc2tz95c4RK3DEGsoTXTjhDh/7
 QN+vcrySBFFWGU8ebJ5rnxdHDF6Bgw5W9TQRRMyC4movxL3xzhPqpceYY2p4PrwD9VRC
 7yXyThywXJwqnNq+b//WUcAqfYyIv6bfKMFZ6AlKGefJ2N7t76wmc5km8FyVUf+oshi6
 RYLSdtxFbAVd2ueKgwyzic6ZtNRYBf2RAZB73MobKitPL3RqyPJapTqOSFOUlBgqGyu8
 7kVukAYkFJPRoNUAZZCAVSoFppI4l6Ef7ZO4e1b2PMwAKs795nWuO7n3Ry5XsgIdk8XP
 AS1A==
X-Gm-Message-State: AOAM532PF6AF7wuIlzps5FsCXELu7w5dD83N7rN9+UvPTI7k7vh40yST
 wpxJBfHU2TqgddydxKEXccEL6Wysem5JwgjJKMwhww==
X-Google-Smtp-Source: ABdhPJySDbUjGGpOV5SM3Kmte7QuRaaRGIKl/L3Uz8KmoBnA6/EJ6CU8RhtGbCStzLkpgHgzCXMHVaU7WDEXY/mHy54=
X-Received: by 2002:a5d:6681:: with SMTP id l1mr23870585wru.47.1595942782329; 
 Tue, 28 Jul 2020 06:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <cdbba354ffc234d6c03978671f99e129748ff48f.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <cdbba354ffc234d6c03978671f99e129748ff48f.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 14:26:06 +0100
Message-ID: <CAPY8ntC1tR+Y+FsHX85B3KT1VHu_eLQS=72CUwYgg9yYbjUgVg@mail.gmail.com>
Subject: Re: [PATCH v4 60/78] drm/vc4: hdmi: Remove unused CEC_CLOCK_DIV define
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 8 Jul 2020 at 18:44, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The CEC_CLOCK_DIV define is not used anywhere in the driver, let's remove
> it.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 86e21de6c578..a01562a49bf0 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -55,7 +55,6 @@
>
>  #define HSM_CLOCK_FREQ 163682864
>  #define CEC_CLOCK_FREQ 40000
> -#define CEC_CLOCK_DIV  (HSM_CLOCK_FREQ / CEC_CLOCK_FREQ)
>
>  static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
>  {
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
