Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE3A2A6E77
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 21:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826726E3AA;
	Wed,  4 Nov 2020 20:03:04 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEE06E3AA
 for <dri-devel@freedesktop.org>; Wed,  4 Nov 2020 20:03:02 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id w145so17820719oie.9
 for <dri-devel@freedesktop.org>; Wed, 04 Nov 2020 12:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oBqDX2AjknVBn06K8/u+vt1ooNK8RMqy/l2tyn5+RE8=;
 b=pHAufxi5OApoADkbNPBC7ftNAa0fzjB4mz93a7JTw8yN390cCaliUpygchlqK+IpNK
 fdAlA0n31kPWWPgKwQxQJWgBrMdT608NlzAAKUTx9sSYLhbRCKXwzPLwvCAppewu1aiW
 yjgE7Ly9IEK0NXJwmc8j6UizuvwxHx5VcGBjtP859qZxetOK+0QQkyHY7fOr1F13WAtm
 LnJbEyFZdy68chRO0H80ozXDv5zvg5dImdTEdcmpf4KIrYnl2kjfwMJd1+27WkUENpCY
 TeAdakYbp5zT8pmEob44WNiLUMlmULAPXlYm055x//OR6SeOERN8x13P/HahVxj4WItm
 MkXw==
X-Gm-Message-State: AOAM532EOrNPW9Z4lFcJqhYrXiKgzs3UNi+kxPJUMPtBHR9vA3LYdltL
 0mHuNKIG4cop/nyfFqUIlA==
X-Google-Smtp-Source: ABdhPJwScFjt5SJiTj7x04SzO5UJDiz4X8g4A1clj71IAewexTQOZdLGaJUnD77962i4rsrTIwSVtQ==
X-Received: by 2002:aca:eb06:: with SMTP id j6mr3334409oih.144.1604520181850; 
 Wed, 04 Nov 2020 12:03:01 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h8sm660259otm.72.2020.11.04.12.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 12:03:01 -0800 (PST)
Received: (nullmailer pid 4037168 invoked by uid 1000);
 Wed, 04 Nov 2020 20:03:00 -0000
Date: Wed, 4 Nov 2020 14:03:00 -0600
From: Rob Herring <robh@kernel.org>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [PATCH v5 3/3] dt-bindings: drm/msm/gpu: Add cooling device
 support
Message-ID: <20201104200300.GA4036650@bogus>
References: <1604054832-3114-1-git-send-email-akhilpo@codeaurora.org>
 <1604054832-3114-3-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604054832-3114-3-git-send-email-akhilpo@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dianders@chromium.org, linux-kernel@vger.kernel.org, mka@chromium.org,
 dri-devel@freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 30 Oct 2020 16:17:12 +0530, Akhil P Oommen wrote:
> Add cooling device support to gpu. A cooling device is bound to a
> thermal zone to allow thermal mitigation.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
