Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1526529A728
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 10:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6756EB2C;
	Tue, 27 Oct 2020 09:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE776EB2C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:02:17 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id t20so587311edr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 02:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yy8mpli12VbJ5JLskCF8LxLYU5O/pRr6aZZScegInuc=;
 b=o0iT4oJQ4MqULUh5gs1PAQVYXpHfBm84tiyL1/b1G9YRBNPfRB+1WQxtxnA/n4dIXy
 brMwgI4AHvMcUVzOJv7wKAJQtv/UEZnUDU2ZZnaMXGK7i2feey8JyDIAId36KmWDn6Kt
 PeLtDueHieA/hg4Ysojk3zmrI3p4cIAMlFcbBV5KD9Kqp/221l9JO5Wdoa40izeGyY3f
 WUsT4EIk+M1dd29lSlvmn3vYLsNSifxgN6tt7VMlt8QQboXw7d3YV0TmuFUFeLsZEqKE
 IIZSD/feBSlOdk5tSRPiAcFZv4nMQJhkuc2GybE9WSN240l/Gm1ljYqdy81H1Ap1a219
 3aEQ==
X-Gm-Message-State: AOAM531HkGfue5n1o3D+OAO8u3AGvgbHzCyFzDIMIzohyp1RmrLmzEwl
 khor4/lu1fhHHg9UzpEhww0=
X-Google-Smtp-Source: ABdhPJyQzsFsuzcSltesuym9LKHSYVZWlMr0dq392E04psYkjmxzcSL6mq0PR1/lxApk19ZIsIN9OA==
X-Received: by 2002:a50:eb0a:: with SMTP id y10mr1183592edp.342.1603789336363; 
 Tue, 27 Oct 2020 02:02:16 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id q3sm525786edv.17.2020.10.27.02.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 02:02:15 -0700 (PDT)
Date: Tue, 27 Oct 2020 10:02:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 08/52] dt-bindings: memory: tegra20: emc: Document
 mfd-simple compatible and statistics sub-device
Message-ID: <20201027090212.GG4244@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-9-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-9-digetx@gmail.com>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 01:16:51AM +0300, Dmitry Osipenko wrote:
> External Memory Controller can gather various hardware statistics that
> are intended to be used for debugging purposes and for dynamic frequency
> scaling of memory bus.
> 
> Document the new mfd-simple compatible and EMC statistics sub-device.
> The subdev contains EMC DFS OPP table and interconnect paths to be used
> for dynamic scaling of system's memory bandwidth based on EMC utilization
> statistics.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/nvidia,tegra20-emc.txt | 43 +++++++++++++++++--
>  1 file changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> index 8d09b228ac42..382aabcd6952 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> @@ -4,7 +4,7 @@ Properties:
>  - name : Should be emc
>  - #address-cells : Should be 1
>  - #size-cells : Should be 0
> -- compatible : Should contain "nvidia,tegra20-emc".
> +- compatible : Should contain "nvidia,tegra20-emc" and "simple-mfd".

Changing a compatible match is another break of ABI, unless it is not
really required. It's unclear to me from the contents of the patch.

>  - reg : Offset and length of the register set for the device
>  - nvidia,use-ram-code : If present, the sub-nodes will be addressed
>    and chosen using the ramcode board selector. If omitted, only one
> @@ -17,7 +17,8 @@ Properties:
>  - core-supply: Phandle of voltage regulator of the SoC "core" power domain.
>  - operating-points-v2: See ../bindings/opp/opp.txt for details.
>  
> -Child device nodes describe the memory settings for different configurations and clock rates.
> +Child device nodes describe the memory settings for different configurations and clock rates,
> +as well as EMC activity statistics collection sub-device.
>  
>  Example:
>  
> @@ -31,17 +32,34 @@ Example:
>  		...
>  	};
>  
> +	emc_bw_dfs_opp_table: emc_opp_table1 {

Hyphens for node name.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
