Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DDB16697F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 22:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7656E911;
	Thu, 20 Feb 2020 21:02:45 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0172A6E231
 for <dri-devel@freedesktop.org>; Thu, 20 Feb 2020 21:02:43 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id j15so2530602pgm.6
 for <dri-devel@freedesktop.org>; Thu, 20 Feb 2020 13:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yCWhyMONDF7/2d7s+slz/xE4GsVXYJ+VIwzdQklkW/U=;
 b=JsoqIRD4xomQetfHM7XtcK7FHq/ipSAEkJsVnBvyST4DrAaAZF6BueSVgo/A0us1yb
 ELSgSfno5PgHnoJm/NzqbsG8qQ02kmK3xDxajwkASRuGLEPI5+BMdVoxVksurm9wJ1Hp
 6IrSh0MG+2h1RvRA1zHGLa4KQ8N8MtjmIgGKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yCWhyMONDF7/2d7s+slz/xE4GsVXYJ+VIwzdQklkW/U=;
 b=n1PZ6352uxW5GZy/ZgVFjD2STDDy+RC35D4XAwfJ6qubc7MK/sxOW6DYy7Wp2T/mVU
 tcB0BhT+AfBXNWmfcvBU0k2d1T2m3YSJ817sl2m5Ri6bGSM3CdBxsqAK9bpW+Ba9M3eW
 2yWtkujOu61EoHXKQtt0JL4voryu1VO1V3C4p55tdPH8VtFSWmzVH5eOdzPhcndh5k3K
 NjXoWuNWC2DRj75wiqCHFELKTjvidVMNTUbo0AC6iC3X9sO0qu4jOW07RV1XChtb3qnx
 Jpk07D3Y634ZTHuQQW9G6PrwGgF7FWRSvQ/O41haY8TakCKtIVg+DtM8+D4v3pxaC4ll
 XZjA==
X-Gm-Message-State: APjAAAXIFMY6usfbJg1dThn7Ii2mduty+93pq7AxAbZbpChPZ9S9FXOJ
 jQVIb5HeQ7aubOrpfblIwWLgA5eZsO4=
X-Google-Smtp-Source: APXvYqybBEIA4/pqHt8cShquf8H+vaT94NLFSfun4J2uEKy/wjt157bBu3t/D8co6V54Gr/xmMNoZQ==
X-Received: by 2002:a63:565e:: with SMTP id g30mr3053334pgm.206.1582232563637; 
 Thu, 20 Feb 2020 13:02:43 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id o73sm341592pje.7.2020.02.20.13.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 13:02:43 -0800 (PST)
Date: Thu, 20 Feb 2020 13:02:42 -0800
From: Matthias Kaehlcke <mka@chromium.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH] dt-bindings: arm-smmu: update the list of clocks
Message-ID: <20200220210242.GC24720@google.com>
References: <1582186342-3484-1-git-send-email-smasetty@codeaurora.org>
 <1582186342-3484-2-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582186342-3484-2-git-send-email-smasetty@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 01:42:22PM +0530, Sharat Masetty wrote:
> This patch adds a clock definition needed for powering on the GPU TBUs
> and the GPU TCU.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 6515dbe..235c0df 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -28,6 +28,7 @@ properties:
>            - enum:
>                - qcom,msm8996-smmu-v2
>                - qcom,msm8998-smmu-v2
> +              - qcom,sc7180-smmu-v2

The addition of the compatible string isn't (directly) related with $subject,
this should be done in a separate patch.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
