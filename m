Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF166D28A7
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 21:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE2C10E4C3;
	Fri, 31 Mar 2023 19:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF1C10E4C3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 19:27:07 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-17ab3a48158so24290681fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 12:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680290827;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=buu8WqVMzAcMHXXEn9C7CMlfiJnivaRXjI1lCWs4gWU=;
 b=DqwLHNrLgVOiLepvHTLGEiDvRPEwmSHHWb50GBLjiT25t28wmf2BtSnMpMuPeROlxv
 uRCLHgr/yPI9SA+93uqg9mq1clmwQ3yQwNm63714qNLBO3M8zf7sfTLmt9iZ/QdXsBuu
 BzRRe0V/dQVY0jLcDDs31si030AZXEa2Fto2F/ghjEazFzpoILRYm4Mm+ZIS+ntgPbHq
 ekQC8ZVLU+s0K9uRJ03bLHG9kBpnAzW4nqiKdivAPrJaR9F3a6i4he8QWlEeGtQbbKiQ
 P/VDHmxnrutlVmzvFEh1+EoemHBKuejQQ7GQXhJm8OvD2aYFHKBcbENq6OYDp5o0VnkQ
 Hb3Q==
X-Gm-Message-State: AAQBX9fPIhxt/KmjM9RhgRDuC1YpGr5yipaMd6aNKIY5fmENsRHqnZKo
 WwTDA+r+l1Y9k3X7c/RW/g==
X-Google-Smtp-Source: AKy350aaVHPapcCWgvkHXPT8cKxlw9Sl3X/+842+zkcyrUdJIsrfD1NB+jBgRlMHjhuketVAO601aA==
X-Received: by 2002:a05:6870:b48f:b0:177:c0e4:1bd2 with SMTP id
 y15-20020a056870b48f00b00177c0e41bd2mr17442367oap.52.1680290827144; 
 Fri, 31 Mar 2023 12:27:07 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 xf19-20020a056870cf1300b001724742cfcesm1230021oab.38.2023.03.31.12.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 12:27:06 -0700 (PDT)
Received: (nullmailer pid 2086972 invoked by uid 1000);
 Fri, 31 Mar 2023 19:27:05 -0000
Date: Fri, 31 Mar 2023 14:27:05 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: sitronix, st7789v: document dc-gpios
Message-ID: <168029082400.2086887.14988355567564977926.robh@kernel.org>
References: <20230326164700.104570-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230326164700.104570-1-krzysztof.kozlowski@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 26 Mar 2023 18:47:00 +0200, Krzysztof Kozlowski wrote:
> The device comes with DCX pin which is already used in
> canaan/sipeed_maixduino.dts (although not in Linux driver).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/panel/sitronix,st7789v.yaml   | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Applied, thanks!

