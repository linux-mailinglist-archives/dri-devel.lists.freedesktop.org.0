Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51763DAC5D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 22:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D866EE4A;
	Thu, 29 Jul 2021 20:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02246EE49;
 Thu, 29 Jul 2021 20:02:43 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id a13so8674974iol.5;
 Thu, 29 Jul 2021 13:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+ZUld8oYLswfBWaIIa32GlcaW9W895It5HVoem+LqtM=;
 b=FLpUZUMNAcwqMPLL15vu6e4TZ0D+3mQD5bW5PVmfBTxw8LZwnrwojYnrDU//VRfSVW
 AdJpTu+uflCTs6bUv3/wSxPRWghmIk5hBs5aN33rWJ0lCxipImUDphB3EKlTDP08/mWD
 5t2TR79Zi9Rw/4ggPVJ639OPE4L4L9mhPr7uROpU6OCFuuvDkrhJHu3za/HSR32lrZDN
 v2jnPRw1cmBSRmUFo4OVycmt3VZzdBs+U8IWHCxUY5r0SfUuGAGEEvor4UJTs4Utr/AS
 dQFIec9e8u9M2qXohtz/wDuri6bgVt0shyF9Id2UyhRErOJxGfCdgjmK8EK38OoEbKEC
 uPpA==
X-Gm-Message-State: AOAM530YYErHmEAqTkNsInFhxq5JuxxTPqT4uKwlixaYUMyjEgOzJvmR
 pWl0eo0bZfer1VJjfXD7BA==
X-Google-Smtp-Source: ABdhPJwXGjqesgbLpbEWDhh9lhRa/zWJ2SmHm6nEdm4oeM1BtsFJR67KpTPyneSwhx3+1ej/e8im8A==
X-Received: by 2002:a05:6638:3048:: with SMTP id
 u8mr5810285jak.91.1627588962983; 
 Thu, 29 Jul 2021 13:02:42 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id r16sm2378280iln.30.2021.07.29.13.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 13:02:42 -0700 (PDT)
Received: (nullmailer pid 789374 invoked by uid 1000);
 Thu, 29 Jul 2021 20:02:40 -0000
Date: Thu, 29 Jul 2021 14:02:40 -0600
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/5] dt-bindings: msm/dp: Change reg definition
Message-ID: <YQMJYEZOi7wjExay@robh.at.kernel.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
 <20210722024227.3313096-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722024227.3313096-2-bjorn.andersson@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Jul 2021 19:42:23 -0700, Bjorn Andersson wrote:
> reg was defined as one region covering the entire DP block, but the
> memory map is actually split in 4 regions and obviously the size of
> these regions differs between platforms.
> 
> Switch the reg to require that all four regions are specified instead.
> It is expected that the implementation will handle existing DTBs, even
> though the schema defines the new layout.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/display/msm/dp-controller.yaml           | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
