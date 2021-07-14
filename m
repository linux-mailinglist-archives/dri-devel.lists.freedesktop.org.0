Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ED93C8A19
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 19:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8EB6E454;
	Wed, 14 Jul 2021 17:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D636E44F;
 Wed, 14 Jul 2021 17:51:34 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id l5so3190074iok.7;
 Wed, 14 Jul 2021 10:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2gRDlQp1MuAFlJu92QnqeuWzzqqzSrOhJUVuS7wmyLA=;
 b=Rj1l0RpPsMQd6Lv3+oVW0CR059xkp1C85/K8R1d/vfBZiRwWquWDEfMSGHrJx19be/
 VZNPMZrEzv1UV02CopAWbe0XlP+m5RELqb9k+WZ+U8PfEQzJI9U4cNL6aKp+QQ6it9/e
 Q/bJMBm6P+NwcdFzs0eaWjrAEVSQfpRNL7CrJaq/V0RBIaJtFzB+fSfab+vkemSnF8DZ
 W+dbxPvvMlRZxUKKEdH3Sxz/Ypcj/zur0/vjDv9OKcqGi5dZMN0ZhHNcEiq31HN45BMc
 ANs3E43JdQFmupIV83adm0I6OFoJAw/qua+6FPOTK7U52yZDNmogRrrKvd3Ac5yhEfuH
 w6ew==
X-Gm-Message-State: AOAM531HyaYmlN54zS5f//6n+Yp85fXYE2OCOAu18+6SiUsJdI9iV+HE
 SyfRekuw/Wqg36GASH9svA==
X-Google-Smtp-Source: ABdhPJwOTz4yShdDPDvuRzHUrKX45LAoc/ClPXV6RlW1pZulnt5dgHTyt+IGhykIU67hkb84JbN4Qg==
X-Received: by 2002:a02:2b27:: with SMTP id h39mr10077711jaa.62.1626285094249; 
 Wed, 14 Jul 2021 10:51:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id p21sm1680316iog.37.2021.07.14.10.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 10:51:33 -0700 (PDT)
Received: (nullmailer pid 2832837 invoked by uid 1000);
 Wed, 14 Jul 2021 17:51:31 -0000
Date: Wed, 14 Jul 2021 11:51:31 -0600
From: Rob Herring <robh@kernel.org>
To: Rajeev Nandan <rajeevny@codeaurora.org>
Subject: Re: [v2 1/3] dt-bindings: msm/dsi: Add sc7280 7nm dsi phy
Message-ID: <20210714175131.GA2832803@robh.at.kernel.org>
References: <1624365748-24224-1-git-send-email-rajeevny@codeaurora.org>
 <1624365748-24224-2-git-send-email-rajeevny@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624365748-24224-2-git-send-email-rajeevny@codeaurora.org>
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
Cc: mkrishn@codeaurora.org, jonathan@marek.ca, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, kalyan_t@codeaurora.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Jun 2021 18:12:26 +0530, Rajeev Nandan wrote:
> The SC7280 SoC uses the 7nm (V4.1) DSI PHY driver.
> 
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
> 
> Changes in v2:
> - New
>   This patch depends on [1] (dt-bindings: msm: dsi: add missing 7nm bindings)
> 
> [1] https://lore.kernel.org/linux-arm-msm/20210617144349.28448-2-jonathan@marek.ca/
> 
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
