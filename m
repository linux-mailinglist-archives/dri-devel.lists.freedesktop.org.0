Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7783A16686E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 21:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C306EE53;
	Thu, 20 Feb 2020 20:35:13 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44956EE53
 for <dri-devel@freedesktop.org>; Thu, 20 Feb 2020 20:35:11 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id v19so28907258oic.12
 for <dri-devel@freedesktop.org>; Thu, 20 Feb 2020 12:35:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dj2rW5WH1XuuP/JPuEpJptUF9hTbGtr1qjFfIR5yvb8=;
 b=j1vH7p4nqmwi/oR1Hvqp4pxgbWTRswNofF9rdV8RQ/hu82E+gIfNuyLdeLx/g3U3P1
 9FEMZ0xAznzdKyjAbXJWXrSXdhqXlwXTKJDJgXx9e5//1gftDc0YJmxv5hxrpsfH+Me6
 aXSgcx4Jpxputn+hh4TrUeG2oRpXzFMTJzYmOlOVS6R95ZKl00TyOdu6mosHgRTgUjJ9
 cszJJwfbHv1CqJoDDcC48o7H8IHlEIuOYqH/wMIc5mjP/p0iHgETwmH4lpaJJToWHxrq
 z26LV6M3St6MGKLl+oHpbzSQjjTXFpWnj4uSsHX9OCsL4a29jI0q9pNY9T6/MEdHRcql
 SRMw==
X-Gm-Message-State: APjAAAU4swK8O/E5IsrylBVSzw6yU2Eso6PntW9JrpurV1uADJa0xFHK
 +dpU1zlnT15dsKxjvGyO0w==
X-Google-Smtp-Source: APXvYqxwJ/2yGaYe0f1ffh3BnhSHPhuRw7WYXDEqylBf6OGb/cfcQC8kdGy9BeTH3mgWz4ApoOvUbg==
X-Received: by 2002:a05:6808:249:: with SMTP id m9mr3532186oie.5.1582230910787; 
 Thu, 20 Feb 2020 12:35:10 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e5sm182426otk.74.2020.02.20.12.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 12:35:10 -0800 (PST)
Received: (nullmailer pid 15161 invoked by uid 1000);
 Thu, 20 Feb 2020 20:35:09 -0000
Date: Thu, 20 Feb 2020 14:35:09 -0600
From: Rob Herring <robh@kernel.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH] dt-bindings: arm-smmu: update the list of clocks
Message-ID: <20200220203509.GA14697@bogus>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, dianders@chromium.org,
 linux-kernel@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org,
 bjorn.andersson@linaro.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Feb 2020 13:42:22 +0530, Sharat Masetty wrote:
> This patch adds a clock definition needed for powering on the GPU TBUs
> and the GPU TCU.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iommu/arm,smmu.example.dt.yaml: iommu@d00000: clock-names: ['bus', 'iface'] is too short
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iommu/arm,smmu.example.dt.yaml: iommu@d00000: clocks: [[4294967295, 123], [4294967295, 124]] is too short

See https://patchwork.ozlabs.org/patch/1241297
Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
