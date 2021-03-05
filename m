Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A4132F574
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 22:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CB86EC73;
	Fri,  5 Mar 2021 21:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E247C6EC71;
 Fri,  5 Mar 2021 21:46:19 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id i21so4136367oii.2;
 Fri, 05 Mar 2021 13:46:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3aXASnehLpAnhE7ybXqztlUJbmoibh1p17DxUSvDDCI=;
 b=Hd1T1eOW6OKn0swv1tcDLQ2zxdO/xAh2avQsIqzUamFppow1Ohhe/xLYpd3oWy9Pzf
 gug6apaG1KprxIpfvh+Vn9Gs8YE5KO8W14mpG2vET/LyH2pGhGbKwYbeyuE21jdyX6sU
 XnruwyK9MtE+9TT1AFhdPjWNdxhvEW5vNmWsflp6I+LdbU+kpKQrBcDbdEGo8GRRgXQX
 iJqU9sjSbAORPs8qnyyixk4Uf69Nxs5+R1eO5JEMPw+C3MVjVSL3FRv8vPANBoBzWYCu
 y8E0ng8jR/kmgDqeP95POTbjy+CEuVYtZf8kUvosmpQ0PkhPvVjSGPRukieMP33Ibmg/
 KABg==
X-Gm-Message-State: AOAM531w5+0RTXtxSOYx5CyYhlvvwFAXl24EoOM/zDqXxxXyQVtgPLxN
 rFBPrcgHz04C1X8PRBwXww==
X-Google-Smtp-Source: ABdhPJycvVIc1/tf9vzPn8sweFi9jbD9stgDWfMUX+S5uKGI6UR/oPm+RtWtikPpVZbl6ISl77TOUg==
X-Received: by 2002:aca:6289:: with SMTP id w131mr8562283oib.69.1614980779246; 
 Fri, 05 Mar 2021 13:46:19 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y194sm805855ooa.19.2021.03.05.13.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 13:46:18 -0800 (PST)
Received: (nullmailer pid 701367 invoked by uid 1000);
 Fri, 05 Mar 2021 21:46:17 -0000
Date: Fri, 5 Mar 2021 15:46:17 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v3 1/2] drm/msm: add compatibles for sm8150/sm8250 display
Message-ID: <20210305214617.GA701315@robh.at.kernel.org>
References: <20210215162607.21360-1-jonathan@marek.ca>
 <20210215162607.21360-2-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210215162607.21360-2-jonathan@marek.ca>
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
Cc: Sean Paul <sean@poorly.run>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>, tongtiangen <tongtiangen@huawei.com>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Feb 2021 11:26:04 -0500, Jonathan Marek wrote:
> The driver already has support for sm8150/sm8250, but the compatibles were
> never added.
> 
> Also inverse the non-mdp4 condition in add_display_components() to avoid
> having to check every new compatible in the condition.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c               | 2 ++
>  drivers/gpu/drm/msm/msm_drv.c                         | 6 +++---
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
