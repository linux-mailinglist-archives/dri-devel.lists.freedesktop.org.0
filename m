Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8C21FD783
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 23:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F376E1A4;
	Wed, 17 Jun 2020 21:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61466E1A4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 21:37:29 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id o5so4675022iow.8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 14:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eDqg9gDgvVSfPZzqiBmC+Ly0PCsBuRi5ihRQMpFBE8U=;
 b=nzt5qiQ+hNttZxn2YtOTwBzwVyaswA/8v5xDPwJqCQhG5dH/bfjOwFRAglV/d6v0E/
 cuEL1KMwp6C4tquH8tfemqYtiYIJoc4LiK+P5aUYVtXY29cD7L2rOC3NEZkq2I5c6VBR
 jt9I+FvRv/mYLJprI22dawHF256B9UJLyU4bVqFs3lmMXvHAo4PYk0zWDadLPYBVvzFv
 P7hfUZyKOiHKtsInbyPtGcjKLmOw7CWSzt+YNzaW6ASvPrhraR7NC36QlJUJXO/rNQC3
 KhivBY/k9Mu6CQ84FUJJ4FbedH88fW9AMDi6wwxqH9betTj5Wt69clammbf0TlaP4wKu
 e/VQ==
X-Gm-Message-State: AOAM533DrJSxrcLSwF1YmNk9rdc4aw5P4eJ63yT72CRN5rj60dsKHaqZ
 2GHPx8qhWaNbtKTgQwC4754u2/uFNw==
X-Google-Smtp-Source: ABdhPJx9QQcoVumUNEnF3FgFX3xUdRgc7f0svAxUDzJFTb5OqnUWg/b7lDrd5jMkkInGDWqQ6v+G+Q==
X-Received: by 2002:a05:6602:809:: with SMTP id
 z9mr1553086iow.79.1592429848645; 
 Wed, 17 Jun 2020 14:37:28 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id r19sm608186ioj.12.2020.06.17.14.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 14:37:27 -0700 (PDT)
Received: (nullmailer pid 2869525 invoked by uid 1000);
 Wed, 17 Jun 2020 21:37:26 -0000
Date: Wed, 17 Jun 2020 15:37:26 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 22/37] dt-bindings: host1x: Document new interconnect
 properties
Message-ID: <20200617213726.GA2837398@bogus>
References: <20200609131404.17523-1-digetx@gmail.com>
 <20200609131404.17523-23-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200609131404.17523-23-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>,
 Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 dri-devel@lists.freedesktop.org, Georgi Djakov <georgi.djakov@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 09, 2020 at 04:13:49PM +0300, Dmitry Osipenko wrote:
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
> index 47319214b5f6..ab4fbee7bccf 100644
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
> +    available memory clients, see MEMORY CONTROLLER section.
> +
>  - vi: video input
>  
>    Required properties:
> @@ -65,6 +75,12 @@ of the following host1x client modules:
>        - power-domains: Must include sor powergate node as csicil is in
>          SOR partition.
>  
> +  Optional properties:
> +  - interconnects: Must contain entry for the VI memory clients.
> +  - interconnect-names: Must include name of the interconnect path for each
> +    interconnect entry. Consult TRM documentation for information about
> +    available memory clients, see MEMORY CONTROLLER section.
> +
>  - epp: encoder pre-processor
>  
>    Required properties:
> @@ -78,6 +94,12 @@ of the following host1x client modules:
>    - reset-names: Must include the following entries:
>      - epp
>  
> +  Optional properties:
> +  - interconnects: Must contain entry for the EPP memory clients.
> +  - interconnect-names: Must include name of the interconnect path for each
> +    interconnect entry. Consult TRM documentation for information about
> +    available memory clients, see MEMORY CONTROLLER section.
> +
>  - isp: image signal processor
>  
>    Required properties:
> @@ -91,6 +113,12 @@ of the following host1x client modules:
>    - reset-names: Must include the following entries:
>      - isp
>  
> +  Optional properties:
> +  - interconnects: Must contain entry for the ISP memory clients.
> +  - interconnect-names: Must include name of the interconnect path for each
> +    interconnect entry. Consult TRM documentation for information about
> +    available memory clients, see MEMORY CONTROLLER section.
> +
>  - gr2d: 2D graphics engine
>  
>    Required properties:
> @@ -104,6 +132,12 @@ of the following host1x client modules:
>    - reset-names: Must include the following entries:
>      - 2d
>  
> +  Optional properties:
> +  - interconnects: Must contain entry for the GR2D memory clients.
> +  - interconnect-names: Must include name of the interconnect path for each
> +    interconnect entry. Consult TRM documentation for information about
> +    available memory clients, see MEMORY CONTROLLER section.
> +
>  - gr3d: 3D graphics engine
>  
>    Required properties:
> @@ -122,6 +156,12 @@ of the following host1x client modules:
>      - 3d
>      - 3d2 (Only required on SoCs with two 3D clocks)
>  
> +  Optional properties:
> +  - interconnects: Must contain entry for the GR3D memory clients.
> +  - interconnect-names: Must include name of the interconnect path for each
> +    interconnect entry. Consult TRM documentation for information about
> +    available memory clients, see MEMORY CONTROLLER section.
> +
>  - dc: display controller
>  
>    Required properties:
> @@ -149,6 +189,10 @@ of the following host1x client modules:
>    - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
>    - nvidia,edid: supplies a binary EDID blob
>    - nvidia,panel: phandle of a display panel
> +  - interconnects: Must contain entry for the DC memory clients.
> +  - interconnect-names: Must include name of the interconnect path for each
> +    interconnect entry. Consult TRM documentation for information about
> +    available memory clients, see MEMORY CONTROLLER section.
>  
>  - hdmi: High Definition Multimedia Interface
>  
> @@ -297,6 +341,12 @@ of the following host1x client modules:
>    - reset-names: Must include the following entries:
>      - vic
>  
> +  Optional properties:
> +  - interconnects: Must contain entry for the VIC memory clients.
> +  - interconnect-names: Must include name of the interconnect path for each
> +    interconnect entry. Consult TRM documentation for information about
> +    available memory clients, see MEMORY CONTROLLER section.
> +
>  Example:
>  
>  / {
> @@ -410,6 +460,15 @@ Example:
>  			resets = <&tegra_car 27>;
>  			reset-names = "dc";
>  
> +			interconnects = <&mc TEGRA20_MC_DISPLAY0A &emc>,
> +					<&mc TEGRA20_MC_DISPLAY0B &emc>,
> +					<&mc TEGRA20_MC_DISPLAY0C &emc>,
> +					<&mc TEGRA20_MC_DISPLAY1B &emc>;

This looks odd or wrong. Each entry has 2 phandles? 

> +			interconnect-names = "display0a",
> +					     "display0b",
> +					     "display0c",
> +					     "display1b";
> +
>  			rgb {
>  				status = "disabled";
>  			};
> @@ -425,6 +484,15 @@ Example:
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
> 2.26.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
