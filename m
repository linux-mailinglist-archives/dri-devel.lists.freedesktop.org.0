Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A68CC390556
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 17:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF636EA56;
	Tue, 25 May 2021 15:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FCD6EA56
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 15:25:40 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 ne24-20020a17090b3758b029015f2dafecb0so12202630pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 08:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jL+DBxWN5edIJOrVtHSuYvmFZqk3JNDdtDmQJkkStO8=;
 b=ADsWXFPQuNNtwHEJoJyXj5LyZS40qB6RUp/8KdRTz+SQQiOqa8lPfdkQHPDPKrCTkC
 57WkUmg43+E1w/Tv4GssLcUeeQ3ruJGpOVJIzWiVkVd+vOJFeCdy+S76xch1GFZGW1Vk
 HZnJvLO+oME00P5s5Ljv09YiSEXvjrcjGTTQv+80Cpn2zh9zZCIpTLdVPdWfy14un5zK
 6qrdGICT2DDsaTi+9xvggt6WpE8VwTWY9y389K6wcE2VjFJQ2nAw+om9OChuhy1NIkQ1
 4ETtFDx7gN8gP4PNo49FXBG5sEs6QVNWagv1L8oI/nJhoDVDkGuNOwg6nO039jt/ne0S
 mANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jL+DBxWN5edIJOrVtHSuYvmFZqk3JNDdtDmQJkkStO8=;
 b=QquTa5/xUAvOV/hCPH7NaQfNZLi3CKnD+6B/6tSL7wjbXCh0BsO7Hf91VfpPn8e58Z
 KR5NqtsRtlEfb2VmqIKOtVd5xQM18v9qRpkSecSw39+SCEVDOsytAS472beZLgXQ9U8q
 VUvdDLZlBHoE0skDpAG3c2j5K2JK63209tsJLpKkkhBaIMoMEZapHF8POifaqX9R3khP
 cAU5Scf/vXVJMAy6f6MVHjRBvr+wcz0qtmIjiA3zgVsTLmcXDinNT59zaoPxmJgj/Mxi
 wiMwNkXc8ztFh3XLnxaso1XMPWkFx9kXh911Pqb3KgjgsXBXL9srjgaYYxkHjj06a1eJ
 p5FQ==
X-Gm-Message-State: AOAM533Ric3T1u5msefeI4ZWYSvPGyR++srt4KKNhMS2Mieb2RSu7iBy
 KXvd1yUJi/Tx/lEPOm09+YA=
X-Google-Smtp-Source: ABdhPJys9nI4J83yBrIv1q0rF+gkI0iY2Ixso6WRntsxUf21NpnE4gjcHDdIeLCDFoCqGYe/yhkc0Q==
X-Received: by 2002:a17:90a:9486:: with SMTP id
 s6mr5455853pjo.192.1621956340125; 
 Tue, 25 May 2021 08:25:40 -0700 (PDT)
Received: from [192.168.1.67] (99-44-17-11.lightspeed.irvnca.sbcglobal.net.
 [99.44.17.11])
 by smtp.gmail.com with ESMTPSA id w15sm2311678pjy.1.2021.05.25.08.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 08:25:39 -0700 (PDT)
Subject: Re: [PATCH v2 12/12] ARM: dts: bcm2711: Tune DMA parameters for HDMI
 audio
To: Maxime Ripard <maxime@cerno.tech>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liam Girdwood
 <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-13-maxime@cerno.tech>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <fa063d1b-c23c-c29c-f9b4-c77be4626fd5@gmail.com>
Date: Tue, 25 May 2021 08:25:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210525132354.297468-13-maxime@cerno.tech>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>, linux-doc@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/25/2021 6:23 AM, Maxime Ripard wrote:
> From: Dom Cobley <popcornmix@gmail.com>
> 
> Enable NO_WAIT_RESP, DMA_WIDE_SOURCE, DMA_WIDE_DEST, and bump the DMA
> panic and AXI priorities to avoid any DMA transfer error with HBR audio
> (8 channel, 192Hz).
> 
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  arch/arm/boot/dts/bcm2711.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
> index 720beec54d61..9d1dde973680 100644
> --- a/arch/arm/boot/dts/bcm2711.dtsi
> +++ b/arch/arm/boot/dts/bcm2711.dtsi
> @@ -344,7 +344,7 @@ hdmi0: hdmi@7ef00700 {
>  			interrupt-names = "cec-tx", "cec-rx", "cec-low",
>  					  "wakeup", "hpd-connected", "hpd-removed";
>  			ddc = <&ddc0>;
> -			dmas = <&dma 10>;
> +			dmas = <&dma (10 | (1 << 27) | (1 << 24)| (15 << 20) | (10 << 16))>;

This uses DT as a configuration language rather than a description here,
but this is most certainly an established practice that the bcm283-dma.c
supports, with no validation of the various arguments.. great.

Is there at least an option to move the meaning of this bitfields into
include/dt-bindings/dma/bcm2835-dma.h or something like that?
-- 
Florian
