Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6062E3BE621
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 12:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3497E6E088;
	Wed,  7 Jul 2021 10:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0596E866
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 10:05:31 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d12so1764041wre.13
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jul 2021 03:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/mQjTUejd8tKQk4eMfEXIf/oxOvq8b1A8Sr0VU0Mh/Q=;
 b=ObJEC61b1E5vsl9TsWe5s3mQlBCBlqjY5MqGVbzt7B2QPfhj78AWN3wmGMV+5wxjQK
 Frvg3Ab6P0epviGe5PrQP++qIC+CuyFTsVrG2wwRp+bJkDVfJhfIRJpJHSo2csJjL0zg
 cnBr1e20lFwGxJQ30wA6h/9+nXuQkAKHq83mATuybkkZlZCdnQboz1RBa+kJPpe/M7D/
 3Df5/tSEzCapSVRX8XM/+buF0BDKTKNUF8diFi816hcDI/aT0Rdabs63tV7DdbY+1Vs7
 tS687FLdxxMlf1aDERj2I7e6cVHX3YhOZYZM58JsDokLMTeO20PkuyWWhy8TvCIsTp8Q
 9bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/mQjTUejd8tKQk4eMfEXIf/oxOvq8b1A8Sr0VU0Mh/Q=;
 b=k26j2x49y15cKAUEbgxFyW65ij9Ufk169nj/1GrnoKhznB1G1qw8w6MGKsubqBHKsz
 qlKCKI1xAypYekJ9JapKw5ckWIrerZy4j9HjeUCfml8zH6H/kFiQtD+u5ofthhZx1Lxy
 dTshM2tqcClh7Jv27FCIVZxvZje3ZV7Qs1CMu0WnH9XzzOsDfq2yijfFlWPsSx1lue2e
 5jcvcSssIjQ3jHF8Sbf2RIMzjoChagfSbf+OiYQiSu/2nCUpsexhyuhXrn3Mx1zA4tA2
 azCuSeKBX39rZfDCFvt+hqpcGji5v4uKM+cYVbB38GLBo6APgntkBM1+mXcC9tFz5xSs
 Lugg==
X-Gm-Message-State: AOAM5314jYXr/9n3G7tmmznmY35ehTX6BZYZFMnnqkaWVBk+CYgGbe/d
 HF5Sy0WCqbTta9vORGjDYJQ92wPhBvN7iioSHOY5yQ==
X-Google-Smtp-Source: ABdhPJyoGU+U7VV9amLbAiDK7jQ7puXvDjYhvDYuqDNFRAxvGTw+HyKSC3cBjBZ2Ffwer6j7Uf+9hDRVBN3QEya3cqs=
X-Received: by 2002:a5d:548a:: with SMTP id h10mr26540467wrv.273.1625652330348; 
 Wed, 07 Jul 2021 03:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210707095112.1469670-1-maxime@cerno.tech>
In-Reply-To: <20210707095112.1469670-1-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 7 Jul 2021 11:05:12 +0100
Message-ID: <CAPY8ntD-fi1Zm5eDQd4JR9qOcwfQukkEbMQvYaOgdhOHcQMUDw@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/vc4: hdmi: Interrupt fixes
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, Tim Gover <tim.gover@raspberrypi.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans Verkuil <hans.verkuil@cisco.com>, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, bcm-kernel-feedback-list@broadcom.com,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 7 Jul 2021 at 10:51, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> Those are three fixes for race conditions we currently have in the vc4 HDMI
> driver with regard to the interrupts handling.
>
> The first two are fixing an issue where the handler will be removed by devm
> after the resources it uses have been free'd already.
>
> The last one is there to deal with an interrupt coming in the window between
> the end of the driver's bind and the  DRM device registration.
>
> Let me know what you think,
> Maxime

For the series
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Maxime Ripard (3):
>   drm/vc4: hdmi: Drop devm interrupt handler for CEC interrupts
>   drm/vc4: hdmi: Drop devm interrupt handler for hotplug interrupts
>   drm/vc4: hdmi: Only call into DRM framework if registered
>
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 92 +++++++++++++++++++++++-----------
>  1 file changed, 62 insertions(+), 30 deletions(-)
>
> --
> 2.31.1
>
