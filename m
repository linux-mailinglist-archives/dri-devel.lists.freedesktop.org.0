Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F60D7D538C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 16:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3148210E3C6;
	Tue, 24 Oct 2023 14:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E1B10E3C7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 14:00:37 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-5841bdf1b81so2460382eaf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 07:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698156037; x=1698760837;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4H3TWjIQjf85zyBxIKv34+QRRIwX3a8rnrmF0O3dKsg=;
 b=vCKBA5Z88IUN5U28A66MGY1zdne8x4161kseDM4AkftwVvoJNPg+0uMZGvNkwPlyhP
 MTTee22vd8nDCNTC0+Pi+9Owa657vlaGbAhkaRS7XR4PnE7JrrPBHwau8Io9hD9ODgEH
 JkSGQOaiJQvMygBwfrBeAZtxdwiJWrNor60F4ow/DBdYgy8m/0Pmxb33gYxqVIXahbHE
 4tkW9J0VcPEHMTnLtZugtwUttAf38ZmFYBItWCBPt0lMYaQWWIje85ViSzR1EQSljPQ1
 iF2iNSNdGrSdjvrnqtEIKvJyhu0o1DLMKqkFMueMkqg0RhBvdlMgDtHyu9JmJA1myMEk
 FK2A==
X-Gm-Message-State: AOJu0YyJKHhUj6Yqr5HNp5epwU1k2+8GDMXcHVyX3GWtdOxXq00Q7UJf
 QFBkxHGxFuouNTjUEtIRKq3bjpOFsA==
X-Google-Smtp-Source: AGHT+IH90mhjSMFC6luigjMC7lPfefuM1k+Kx6QDH0HCVGUzuacnelhYBUjr/MSrx7O9d++RvMeWuw==
X-Received: by 2002:a4a:d6c5:0:b0:57b:8ff1:f482 with SMTP id
 j5-20020a4ad6c5000000b0057b8ff1f482mr12021472oot.0.1698156035973; 
 Tue, 24 Oct 2023 07:00:35 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w6-20020a9d6746000000b006ce33ba6474sm1865133otm.4.2023.10.24.07.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 07:00:34 -0700 (PDT)
Received: (nullmailer pid 3550335 invoked by uid 1000);
 Tue, 24 Oct 2023 14:00:33 -0000
Date: Tue, 24 Oct 2023 09:00:33 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 0/6] imx6q related DT binding fixes
Message-ID: <20231024140033.GA3544257-robh@kernel.org>
References: <20230810144451.1459985-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810144451.1459985-1-alexander.stein@ew.tq-group.com>
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 04:44:45PM +0200, Alexander Stein wrote:
> Hi everyone,
> 
> while working on i.MX6Q based board (arch/arm/boot/dts/nxp/imx/imx6q-mba6a.dts)
> I noticed several warnings on dtbs_check. The first 5 patches should be pretty
> much straight forward.
> I'm not 100% sure on the sixth patch, as it might be affected by incorrect
> compatible lists. Please refer to the note in that patch.
> I'm also no sure whether thse patches warrent a Fixes tag, so I only added that
> for patch 3. All of these patches are independent and can be picked up
> individually.
> 
> Best regards,
> Alexander
> 
> Alexander Stein (6):
>   dt-bindings: trivial-devices: Remove national,lm75
>   dt-bindings: imx-thermal: Add #thermal-sensor-cells property
>   dt-bindings: display: imx: hdmi: Allow 'reg' and 'interrupts'
>   dt-bindings: net: microchip: Allow nvmem-cell usage
>   dt-bindings: timer: add imx7d compatible
>   dt-bindings: timer: fsl,imxgpt: Add optional osc_per clock

I noticed this is the top warning for 32-bit i.MX[1] and found this. 
Looks like 5 and 6 never got applied, so I've applied them.

Rob

[1] https://gitlab.com/robherring/linux-dt/-/jobs/5361483372/artifacts/external_file/platform-warnings.log
