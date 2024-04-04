Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6061289873C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 14:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA8C10FD8A;
	Thu,  4 Apr 2024 12:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XF5UEcDM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DFD10FD8A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 12:23:37 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-516c11b6af9so1281300e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 05:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712233415; x=1712838215; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eujsqnNsTdlCsaVOb8FrGI1iNYwUxOE+TZxCC6aPEM8=;
 b=XF5UEcDMPrk10UUZMY6qcIH2Qad3LFmCa2BjAC1rLo6eq3EPT+yPLVSeYsfg4yeMz0
 jQn2YLOXNA4VG2zknIQlTItyNyDH/V9rKAMiG80RkLU+ls99Huo0+1Bkz5a1BFAjmbR8
 F5IAmhlz2GBHRjM/wuA15LIam9FZlKeqLtQR4HKHpIS3GBwNTK4Hep7OlgQXg3x56UBu
 DylLfMHcZj2EIQRnEaPB3JdrvFpYVQOz22HtvrK0U9utcToSNEYJTNtQq48EiB6xSfN0
 +j2+Hz1LtEqeruGwMBPCvSlALUzHQjrYanXVAjl9NA+tmzzjP7+1hcIwF1prTG/jKqw3
 ZUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712233415; x=1712838215;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eujsqnNsTdlCsaVOb8FrGI1iNYwUxOE+TZxCC6aPEM8=;
 b=ONEpkVpmc/hvrj6e0nXgBFjyLDpCs/kxotVnUsgj4SikH1EVPSEmf485FOZzW/4TiM
 HIBwRmfU0EJRxe5E8sPgsPkM+WRYEJIDApSLFNbXh2y4GlC+0tD+jDWPk90OrzindZre
 OPhTk7yg98nHPJ1AEayx7us03OxBEFCTJEyKGY+8B3cYZPp/xJBElQOAEC0H1IKeD3EK
 Ol0ae7GnXVdG/0h6pyySQp4AkN6yF0YqgauSLFIaiuVCw53fzFSr34QVhl2junF8ocLJ
 4KegubPiRodxMlpfkhoShHXQmhtbbR2xNYmMBTZOgKepsGlAeomNWn+24PpeZrun/THX
 BBZA==
X-Gm-Message-State: AOJu0Yxq5I52gk+WxaG1qC0+utj5Dv+5NG6pVMEPeoa6umBaMTAf94c+
 0NMWZHNhq9ayxgh66qH+P74SfyE+ET5WO50wl9GmiaCdQfMbRnclAsPS27TY8v0=
X-Google-Smtp-Source: AGHT+IEiC6EifV89yJAb4FjYrCRe0v7lrBhjNcstTawf24NoAdVUVeIn0D+h1SFdO92LrKIFue+53Q==
X-Received: by 2002:a05:6512:3711:b0:516:a148:2f5 with SMTP id
 z17-20020a056512371100b00516a14802f5mr1453656lfr.40.1712233415518; 
 Thu, 04 Apr 2024 05:23:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a194314000000b00516c5204f13sm229240lfa.208.2024.04.04.05.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 05:23:35 -0700 (PDT)
Date: Thu, 4 Apr 2024 15:23:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, aford@beaconembedded.com, 
 laurent.pinchart@ideasonboard.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] drm/bridge: adv7511: Allow IRQ to share GPIO pins
Message-ID: <s463qfxdzpc5udfb6mmlvosc6d42uo752ue7cnpf4rhg3psdaf@kkrjbncbbezl>
References: <20240305004859.201085-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305004859.201085-1-aford173@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 04, 2024 at 06:48:57PM -0600, Adam Ford wrote:
> The IRQ registration currently assumes that the GPIO is dedicated
> to it, but that may not necessarily be the case. If the board has
> another device sharing the GPIO, it won't be registered and the
> hot-plug detect fails to function.
> 
> Currently, the handler reads two registers and blindly
> assumes one of them caused the interrupt and returns IRQ_HANDLED
> unless there is an error. In order to properly do this, the IRQ
> handler needs to check if it needs to handle the IRQ and return
> IRQ_NONE if there is nothing to handle.  With the check added
> and the return code properly indicating whether or not it there
> was an IRQ, the IRQF_SHARED can be set to share a GPIO IRQ.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V2:  Add check to see if there is IRQ data to handle
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
