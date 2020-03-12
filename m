Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701D8183449
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 16:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702306EAE6;
	Thu, 12 Mar 2020 15:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8900B6EAE5;
 Thu, 12 Mar 2020 15:17:18 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id p125so5795465oif.10;
 Thu, 12 Mar 2020 08:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Jzpwe77Abgtv1XYYx0fhdTAjqfD6Awmd08c56L163dU=;
 b=RcpIQdjr9RrDalFY55suHIkVeaxcyfauDBfOnCLLNH2PxRRhcIkrd4SwscJT+JZkIr
 mOSUrCSe2AXuCF//mqfbS/HoFxC3CxfmHKM+fk2HiaE2oF58dWPSLmbRR8UykWvW8fSQ
 gejPAvBeHZtNV5zMwH2QaaukxOORlU+TtzkCHspJstMarikNEJMvlRI+jnKD+OuBbcoS
 TMd0w8+6bfYyz8hPj95WRzdUAmkFW00LqMbNvXrcfw0tNda7uc4y7Sn3yNp1zMQyvdyK
 c0bBJYSLkm/TNJIjH8fCkoo0YSnkc0dqFGSsTLgXL06AnIaQSc4Vf1IB4d+H9ewFqLly
 UFKg==
X-Gm-Message-State: ANhLgQ3hq1MArcxSKwIW8xj14QPyv354ZXeDYMm51bKtpf/DNrK/AThB
 4tkhwqjmRuu/Wi1i5O814Q==
X-Google-Smtp-Source: ADFU+vsdmoOYjMIj0gWOrimsXEvO/w7aUb1U+jTQ6bLux3L7/gaZQojIdHDA7NxmCJ5EzsCb3gNUbQ==
X-Received: by 2002:aca:5c46:: with SMTP id q67mr3034917oib.75.1584026237750; 
 Thu, 12 Mar 2020 08:17:17 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j5sm18380490otl.71.2020.03.12.08.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 08:17:17 -0700 (PDT)
Received: (nullmailer pid 7330 invoked by uid 1000);
 Thu, 12 Mar 2020 15:17:16 -0000
Date: Thu, 12 Mar 2020 10:17:16 -0500
From: Rob Herring <robh@kernel.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: display: add visionox rm69299 panel
 variant
Message-ID: <20200312151716.GA7045@bogus>
References: <20200311085807.21984-1-harigovi@codeaurora.org>
 <20200311085807.21984-2-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311085807.21984-2-harigovi@codeaurora.org>
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Harigovindan P <harigovi@codeaurora.org>, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Mar 2020 14:28:06 +0530, Harigovindan P wrote:
> Add bindings for visionox rm69299 panel.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v2:
> 	- Removed unwanted properties from description.
> 	- Creating source files without execute permissions(Rob Herring).
> Changes in v3:
> 	- Changing txt file into yaml
> Changes in v4:
> 	- Updating license identifier.
> 	- Moving yaml file inside panel directory.
> 	- Removing pinctrl entries.
> 	- Adding documentation for reset-gpios.
> Changes in v5:
> 	- No changes. Updated 2/2 Patch.
> Changes in v6:
> 	- Removing patternProperties.
> 	- Added " |" after description.
> 	- Setting port and reset-gpios to true.
> 	- Removing @ae94000 for dsi node.
> 
>  .../display/panel/visionox,rm69299.yaml       | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/visionox,rm69299.example.dt.yaml: panel@0: 'reg' is a required property

See https://patchwork.ozlabs.org/patch/1252722
Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
