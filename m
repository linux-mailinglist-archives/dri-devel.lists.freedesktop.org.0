Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DAF3CA219
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 18:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01A16E885;
	Thu, 15 Jul 2021 16:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3F76E885;
 Thu, 15 Jul 2021 16:15:56 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id x10so7086923ion.9;
 Thu, 15 Jul 2021 09:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jUDmLjLx44inn7GkSdcgZZrpwVMC3pPvjJgP4EG0irE=;
 b=g/WaJ0LjP3w9o3DTGud9Gn5CUMGG2HbzB/ZliIwfsvT5Lj8xpsNqj1O8Xt1yhhx7dE
 wkjzODbvmaLGufobXpY0MxXiIGT3qbvnaZMS1DSs4uTkEaDlpL8ACJwDEFFht0ZO3655
 jMVAKtob8I0fNoL6S7+9PHQ0Hypp2g3QO738pqQJ+BvPszUx8zJgo0gKX2h+B7OpIiYj
 ZFX10FtrUfq4NLq2U7nxhztmgscbxeGKwvjXfwVA5Og32+xpb5upj+rjjj4v7Bqs9tpB
 P9j3EL2ZY1xLYbGp3HfvJt+tGY8Ykrf4AjExlxR+gGZ0VnHZyE2ND5FttlqGXOz8B2Vp
 uWXg==
X-Gm-Message-State: AOAM530OFFrwOpDFEGRUp/dsf9iPDi6IdGZzOWsMvXwm51GeT2UEDNlS
 A/7qWZmwW5qkKu88cp0QLQ==
X-Google-Smtp-Source: ABdhPJzgSNDzEpajPwyYVdmwZNKLRk/Ow3I2k8uXERDje9G99WLFAKwYa0KNhqKw17f9dLvNj3eHBw==
X-Received: by 2002:a5d:858b:: with SMTP id f11mr3781911ioj.156.1626365755913; 
 Thu, 15 Jul 2021 09:15:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id d5sm3321100ilf.55.2021.07.15.09.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 09:15:54 -0700 (PDT)
Received: (nullmailer pid 1176275 invoked by uid 1000);
 Thu, 15 Jul 2021 16:15:53 -0000
Date: Thu, 15 Jul 2021 10:15:53 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: display: msm: dsi-controller-main:
 restore assigned-clocks
Message-ID: <20210715161553.GA1176219@robh.at.kernel.org>
References: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
 <20210709210729.953114-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709210729.953114-2-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 10 Jul 2021 00:07:22 +0300, Dmitry Baryshkov wrote:
> Restore the assgined-clocks and assigned-clock-parents properties that
> were lost during the txt -> YAML conversion.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml        | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
