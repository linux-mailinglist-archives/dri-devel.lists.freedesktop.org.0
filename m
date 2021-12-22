Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D95247D640
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 19:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F4A10E149;
	Wed, 22 Dec 2021 18:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E1B10E149;
 Wed, 22 Dec 2021 18:07:45 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id de30so3165904qkb.0;
 Wed, 22 Dec 2021 10:07:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PZT+442yryoIyAnTgfkKE3INejgOanJ0gZBKWAWh5S0=;
 b=qogANROEU8BXBJwBnZzCidYcVMHzKXTMzHdiEruRrPQhcmJBVmbFyQ2WBeGLAEkFLP
 mQEey/ZoQ5IcbzcpiN6sxK0Gd3vVUu30NHuSQk2wrZfEC9E9qoLjNN07UEAEpyJloFA4
 5ClvsCOJ0JPtqhNJZyTmOEHrcBpYEuKq510XGZeSP8HUnczS+d9/PO4k+Wy0NFElx9C3
 16uP7nwkAB7FnbkX1SsnfILTnr5LR3N7b7FkYhSaUZd9FvNiNy8rFhKnw1vI5UGqzghj
 Ojt1yg99nkAMm2PSHCPSRaAyMyiu29nRP0gilrwAdc00YkVDAu6UhkhaWja5sJeAgV9x
 X+dg==
X-Gm-Message-State: AOAM531bQPUDvgB8dzcdggca78qs/3CKEiOFVFc9ZNX26T3epUpagB6X
 wAY/QjiU5TiGy2PwkQimwQ==
X-Google-Smtp-Source: ABdhPJyJC96os9VsgB6XT66xXHqKpdFgHISt8Maa/ibE4MzoOiNuO46peBDi0wJyk+XRb+grY1slKA==
X-Received: by 2002:a05:620a:f0e:: with SMTP id
 v14mr2825574qkl.365.1640196464048; 
 Wed, 22 Dec 2021 10:07:44 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id de13sm2455085qkb.81.2021.12.22.10.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 10:07:43 -0800 (PST)
Received: (nullmailer pid 2429602 invoked by uid 1000);
 Wed, 22 Dec 2021 18:07:41 -0000
Date: Wed, 22 Dec 2021 14:07:41 -0400
From: Rob Herring <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] dt-bindings: msm: disp: remove bus from dpu bindings
Message-ID: <YcNpbeN2Hjs+ipWv@robh.at.kernel.org>
References: <20211220184220.86328-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220184220.86328-1-david@ixit.cz>
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
Cc: Sean Paul <sean@poorly.run>, Krishna Manikandan <mkrishn@codeaurora.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org,
 ~okias/devicetree@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Dec 2021 19:42:20 +0100, David Heidelberg wrote:
> Driver and dts has been already adjusted and bus moved out of dpu, let's
> update also dt-bindings.
> 
> Fixes warnings as:
> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml: mdss
> @ae00000: clock-names: ['iface', 'core'] is too short
>         From schema: Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> 
> Ref: https://lore.kernel.org/all/20210803101657.1072358-1-dmitry.baryshkov@linaro.org/
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/display/msm/dpu-sdm845.yaml          | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Applied, thanks!
