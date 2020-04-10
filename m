Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1E41A493E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 19:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E419D6ED27;
	Fri, 10 Apr 2020 17:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B9A6ED27
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 17:38:32 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id k133so1245509oih.12
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 10:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SVZM/9+cxIIYxaSpzImNtMZgxC5SVNGqgXnXXLqgFro=;
 b=g39N/TAmjPPaitHpyB300M8h2Jt/ynGLJHQdjdlPWHZPv6BKyCeyYiguHm8lBE4Yjn
 Eq9WM6remi4ALK3a5cAksHhe7BLC+vEM/XOi0xrwJJYsqtqTpp/u7kclS0NLnJn1Di4E
 4FG3reQdpi0Hxk242g1kCwSIdjxpQf/UN8ovABTub4B0O4eeEjuFpYzQO3l9lMlEv103
 EEKoxa8H9GZ09q27kLiPkdXSy0Od3vJhKQVoiSwZJc2W9dDIOiSo8WkyjpDVeQNABNzy
 fQnOYKmNN6HGrkwK0MmP/txqDQXvn00SoH7GazMsSJ0sZZC2zcIHczL3v3aR26vUT+M8
 sVSA==
X-Gm-Message-State: AGi0PubOmTsbKkK3L5FfaZe98Hp9CuX5aSdcs2PFpCk3fFOVSiMzwV3c
 e2NaAQTE0EFc00Doi48IrOptBcw=
X-Google-Smtp-Source: APiQypI+b7DCb+ABbjOA1szD7WQQUkOuZmJZ5KdJmbNteEdSvFES+4ZpnMHRZhRpriWAWYsHkfug6Q==
X-Received: by 2002:aca:df45:: with SMTP id w66mr4029244oig.76.1586540311262; 
 Fri, 10 Apr 2020 10:38:31 -0700 (PDT)
Received: from rob-hp-laptop (ip-99-203-29-27.pools.spcsdns.net.
 [99.203.29.27])
 by smtp.gmail.com with ESMTPSA id s127sm1546012oig.23.2020.04.10.10.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 10:38:30 -0700 (PDT)
Received: (nullmailer pid 4826 invoked by uid 1000);
 Fri, 10 Apr 2020 17:09:29 -0000
Date: Fri, 10 Apr 2020 12:09:29 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 05/22] dt-bindings: host1x: Document new interconnect
 properties
Message-ID: <20200410170929.GA1498@bogus>
References: <20200330010904.27643-1-digetx@gmail.com>
 <20200330010904.27643-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330010904.27643-6-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 04:08:47AM +0300, Dmitry Osipenko wrote:
> Most of Host1x devices have at least one memory client. These clients
> are directly connected to the memory controller. The new interconnect
> properties represent the memory client's connection to the memory
> controller.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.txt   | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> index 9999255ac5b6..d92d4e814d77 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> @@ -20,6 +20,10 @@ Required properties:
>  - reset-names: Must include the following entries:
>    - host1x
>  
> +Each host1x client module having to perform DMA through the Memory Controller
> +should have the interconnect endpoints set to the Memory Client and External
> +Memory respectively.
> +
>  The host1x top-level node defines a number of children, each representing one
>  of the following host1x client modules:
>  
> @@ -36,6 +40,12 @@ of the following host1x client modules:
>    - reset-names: Must include the following entries:
>      - mpe
>  
> +  Optional properties:
> +  - interconnects: Must contain entry for the MPE memory clients.
> +  - interconnect-names: Must include name of the interconnect path for each
> +    interconnect entry. Consult TRM documentation for information about
> +    available memory clients.

Is the TRM public? Perhaps refer to the header.

> +
>  - vi: video input
>  
>    Required properties:
> @@ -49,6 +59,12 @@ of the following host1x client modules:
>    - reset-names: Must include the following entries:
>      - vi
>  
> +  Optional properties:
> +  - interconnects: Must contain entry for the VI memory clients.
> +  - interconnect-names: Must include name of the interconnect path for each
> +    interconnect entry. Consult TRM documentation for information about
> +    available memory clients.
> +
>  - epp: encoder pre-processor
>  
>    Required properties:
> @@ -62,6 +78,12 @@ of the following host1x client modules:
>    - reset-names: Must include the following entries:
>      - epp
>  
> +  Optional properties:
> +  - interconnects: Must contain entry for the EPP memory clients.
> +  - interconnect-names: Must include name of the interconnect path for each
> +    interconnect entry. Consult TRM documentation for information about
> +    available memory clients.
> +
>  - isp: image signal processor
>  
>    Required properties:
> @@ -75,6 +97,12 @@ of the following host1x client modules:
>    - reset-names: Must include the following entries:
>      - isp
>  
> +  Optional properties:
> +  - interconnects: Must contain entry for the ISP memory clients.
> +  - interconnect-names: Must include name of the interconnect path for each
> +    interconnect entry. Consult TRM documentation for information about
> +    available memory clients.
> +
>  - gr2d: 2D graphics engine
>  
>    Required properties:
> @@ -88,6 +116,12 @@ of the following host1x client modules:
>    - reset-names: Must include the following entries:
>      - 2d
>  
> +  Optional properties:
> +  - interconnects: Must contain entry for the GR2D memory clients.
> +  - interconnect-names: Must include name of the interconnect path for each
> +    interconnect entry. Consult TRM documentation for information about
> +    available memory clients.
> +
>  - gr3d: 3D graphics engine
>  
>    Required properties:
> @@ -106,6 +140,12 @@ of the following host1x client modules:
>      - 3d
>      - 3d2 (Only required on SoCs with two 3D clocks)
>  
> +  Optional properties:
> +  - interconnects: Must contain entry for the GR3D memory clients.
> +  - interconnect-names: Must include name of the interconnect path for each
> +    interconnect entry. Consult TRM documentation for information about
> +    available memory clients.
> +
>  - dc: display controller
>  
>    Required properties:
> @@ -133,6 +173,10 @@ of the following host1x client modules:
>    - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
>    - nvidia,edid: supplies a binary EDID blob
>    - nvidia,panel: phandle of a display panel
> +  - interconnects: Must contain entry for the DC memory clients.
> +  - interconnect-names: Must include name of the interconnect path for each
> +    interconnect entry. Consult TRM documentation for information about
> +    available memory clients.
>  
>  - hdmi: High Definition Multimedia Interface
>  
> @@ -281,6 +325,12 @@ of the following host1x client modules:
>    - reset-names: Must include the following entries:
>      - vic
>  
> +  Optional properties:
> +  - interconnects: Must contain entry for the VIC memory clients.
> +  - interconnect-names: Must include name of the interconnect path for each
> +    interconnect entry. Consult TRM documentation for information about
> +    available memory clients.
> +
>  Example:
>  
>  / {
> @@ -363,6 +413,15 @@ Example:
>  			resets = <&tegra_car 27>;
>  			reset-names = "dc";
>  
> +			interconnects = <&mc TEGRA20_MC_DISPLAY0A &emc>,
> +					<&mc TEGRA20_MC_DISPLAY0B &emc>,
> +					<&mc TEGRA20_MC_DISPLAY0C &emc>,
> +					<&mc TEGRA20_MC_DISPLAY1B &emc>;
> +			interconnect-names = "display0a",
> +					     "display0b",
> +					     "display0c",
> +					     "display1b";
> +
>  			rgb {
>  				status = "disabled";
>  			};
> @@ -378,6 +437,15 @@ Example:
>  			resets = <&tegra_car 26>;
>  			reset-names = "dc";
>  
> +			interconnects = <&mc TEGRA20_MC_DISPLAY0AB &emc>,
> +					<&mc TEGRA20_MC_DISPLAY0BB &emc>,
> +					<&mc TEGRA20_MC_DISPLAY0CB &emc>,
> +					<&mc TEGRA20_MC_DISPLAY1BB &emc>;
> +			interconnect-names = "display0a",
> +					     "display0b",
> +					     "display0c",
> +					     "display1b";
> +
>  			rgb {
>  				status = "disabled";
>  			};
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
