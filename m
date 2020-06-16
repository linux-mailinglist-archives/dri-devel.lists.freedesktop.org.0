Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74E41FC72E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D09F6EA84;
	Wed, 17 Jun 2020 07:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD596E07F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 11:15:14 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id s10so9086758pgm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 04:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=SgTOvbgxwA5VoaXVXVrIfLqGjYTA/hWr+DeE114p4Z8=;
 b=X9LTNBZiXJJz9efMUp9iGtVr8fNdH3Q1LOojyeXv01dGysdbuy3KYNUUGT1uniXOUw
 DjD9oOo8gHYvd5yg7NJnQUQpB+gjfjE6C0lTFbahQC+gzOd0JXwa/A41wgpLch45bIzZ
 VJsNzKctIhTMbqLzq9G/apS+VOjcPgo72eD3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=SgTOvbgxwA5VoaXVXVrIfLqGjYTA/hWr+DeE114p4Z8=;
 b=FBTSeVK37nPoIktFiVMJWr9vUtPSJ6HUBXAfdWcDN62Ys3Sl7Fbq4AZVHvVCe2Ok0a
 T7G7G7ApiV5Eh3sv1DRjizMB8+K12Ny2124vnYihhfq5y8wRRMDSV6JEOJ3R7xi6xhZW
 uHfh4sWbsuMO1XURemOdtEsdhi0fNU2SyBMAbp8TFipfRMEdI9GQnaHQNBj/uewW1Jx7
 ZhsMRoZb5NYmTbnQSaHNw/wRvO297YQ8Bj1eFor4C79gOOcd05LKSBtyB990TWPxWjMJ
 deHUMKDSXewZ1K8SuXhryj9BO7N916oCdfdO+Ei2Y+axIvbj/gAKuJA2yfCVrk6ukWjI
 Bxdw==
X-Gm-Message-State: AOAM532uLhgXav52OsE8nBb2SR3xYgUtCbOsNT2WE1JJ1m8MTiDgwAs7
 PsLgYhI72pL6pWaBv6nESICPjQ==
X-Google-Smtp-Source: ABdhPJydaKHWTiQS4tjTQ62P0i7l/8GnXMtSVp9/WiCYOl6NgtRjnVcqxnmh19tvXcq+VnLsQ8hwGw==
X-Received: by 2002:a65:6703:: with SMTP id u3mr1653921pgf.179.1592306113834; 
 Tue, 16 Jun 2020 04:15:13 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id 67sm13336068pga.44.2020.06.16.04.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 04:15:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200612015030.16072-2-tanmay@codeaurora.org>
References: <20200612015030.16072-1-tanmay@codeaurora.org>
 <20200612015030.16072-2-tanmay@codeaurora.org>
Subject: Re: [PATCH v6 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL
 driver for Snapdragon
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>, robh+dt@kernel.org, sam@ravnborg.org
Date: Tue, 16 Jun 2020 04:15:12 -0700
Message-ID: <159230611219.62212.8262135380349283774@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:03 +0000
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
Cc: devicetree@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 abhinavk@codeaurora.org, Vara Reddy <varar@codeaurora.org>,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Tanmay Shah (2020-06-11 18:50:26)
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> new file mode 100644
> index 000000000000..5fdb9153df00
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> @@ -0,0 +1,142 @@
> +        data-lanes = <0 1>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                dp_in: endpoint {
> +                    remote-endpoint = <&dpu_intf0_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                dp_out: endpoint {

Just curious what is eventually connected here? This is possibly a
question for Rob Herring, but I can't figure out how we're supposed to
connect this to the USB type-c connector that is receiving the DP
signal. Does the type-c connector binding support connecting to this end
of the graph? Or should this connect to the DP phy and then the phy
connects to the USB type-c connector node? Right now it is empty which
seems wrong.

> +                };
> +            };
> +        };
> +    };
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
