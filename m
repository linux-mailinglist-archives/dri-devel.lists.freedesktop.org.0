Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 878D036147D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 00:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7B36EB09;
	Thu, 15 Apr 2021 22:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DD76EB09;
 Thu, 15 Apr 2021 22:04:20 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 65-20020a9d03470000b02902808b4aec6dso19259391otv.6; 
 Thu, 15 Apr 2021 15:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cjrjUXHacNvGNDk7Q/C+ESbCLjg4Pa5yFyEf+O/Q6Rk=;
 b=Oe/UYSEAD7POi1UfY6PrMJ38+DtZRY/HkIa86QXf229Sh43I4zo9NPM/4vU6hr8OwA
 iI6pwmDvbwjQiOicLSVsG/CEnSUfxLkp7o5EFFSdva3bQOqhtm1yta/nYinR5h8Sk0bv
 76qQoLMdYNbOHV+U987mHzzpI3xUpSYI0CuzYaNkHLRiaFsFKc3tt79smG/VonKpEf3F
 XIqBDGF6rp+sExUXcu39qzb8c89ek7j1DVe7F4qc1f0MSG24JjqZ0KvBZpGNosxFfY1p
 oSh4/Fpn4XnzKdguwEW21iY2AHYS+8k+tW0ZF5uv5rgpNwRTmMXolaVBrlflo2/mBjv3
 lHDg==
X-Gm-Message-State: AOAM532K4Tc/qbaP7Xq56LlzN3dSEXlknZt52uwduVFXoUR92xgqKtcD
 NQS7vjcsb6KI+AGlqQ3TCA==
X-Google-Smtp-Source: ABdhPJzs5cTY0YiItEz95ckGhd4fP2bum5/rIk1QKiYpZyI1sYfO1Yo40mAXSSBYGF8zxgIXNDa72A==
X-Received: by 2002:a05:6830:1e15:: with SMTP id
 s21mr1077237otr.334.1618524260057; 
 Thu, 15 Apr 2021 15:04:20 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l9sm820713oog.32.2021.04.15.15.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 15:04:18 -0700 (PDT)
Received: (nullmailer pid 1959975 invoked by uid 1000);
 Thu, 15 Apr 2021 22:04:16 -0000
Date: Thu, 15 Apr 2021 17:04:16 -0500
From: Rob Herring <robh@kernel.org>
To: Rajeev Nandan <rajeevny@codeaurora.org>
Subject: Re: [v1 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Document
 use-aux-backlight
Message-ID: <20210415220416.GA1954887@robh.at.kernel.org>
References: <1618418390-15055-1-git-send-email-rajeevny@codeaurora.org>
 <1618418390-15055-3-git-send-email-rajeevny@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1618418390-15055-3-git-send-email-rajeevny@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, mkrishn@codeaurora.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, seanpaul@chromium.org,
 abhinavk@codeaurora.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 14, 2021 at 10:09:49PM +0530, Rajeev Nandan wrote:
> If the panel connected to the bridge supports backlight control
> using DPCD registers on the DisplayPort aux channel, setting
> "use-aux-backlight" property in the bridge node will enable the
> registration of a DP aux backlight device from the bridge driver.
> 
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml          | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index 26932d2..c8d8c00 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -58,6 +58,12 @@ properties:
>    clock-names:
>      const: refclk
>  
> +  use-aux-backlight:

use-dp-aux-backlight perhaps.

> +    type: boolean
> +    description:
> +      The panel backlight to be controlled using DPCD registers on
> +      the DP aux channel.

Sounds like a property of the panel, not the bridge. So it should be in 
the panel node.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
