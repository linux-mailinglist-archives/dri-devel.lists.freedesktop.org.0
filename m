Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2520C736F19
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 16:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1567C10E2F4;
	Tue, 20 Jun 2023 14:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16ACE10E2F4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 14:49:51 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3411ea250efso25571765ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 07:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687272590; x=1689864590;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pNeUCHjGHh7bJE/7uofbP2PYTnvjxgnzc+IxbdCcyLw=;
 b=hRpXmERLndcS2/90F/UplE1xVVQ4priCeicvsiLthJubGQXNRmCiLnRTMC/wq3fdVS
 OfrNfJGdBO2Zj/iwEDhpMCN2/yYaTzxWcmvYFE7IbfYKZvSwRPpalOhOj4GM+aRsotb4
 3RUaYKspHj/7ueOiAbZV9KQum9mvhR4H2zhNgsZPlxAdbUXGQqTH6e25BscaPWCxVUTo
 a9QuZixp+WnGOcoxIIdxUCbGTfCBg9o01jL6cFTRpsbUq3ccKkEOov2BcfhVFl48qisg
 HR5r4a+/oW8AFTHE/N5QXtPjpm9yzOdAIBNSkpsibOEu67psxV8j07HJraFFEEI/FpNH
 mU8A==
X-Gm-Message-State: AC+VfDyFiRrbddUgRZBwOh5G2/xk2TqzVxEv0Jg4JmhdtH5ZhcoBmNei
 zf6VwMZB/0IfCcwsiSmLog==
X-Google-Smtp-Source: ACHHUZ4S0zb0vXjrS2u+bCfs/vcRgVGNiN0e/Kh7jZi1YbPslVXuzlbDqDmk45ovZnLm7SYsrai4bA==
X-Received: by 2002:a92:cc0f:0:b0:342:1954:6c0c with SMTP id
 s15-20020a92cc0f000000b0034219546c0cmr11215974ilp.11.1687272589756; 
 Tue, 20 Jun 2023 07:49:49 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a029f82000000b004265fff893asm659101jam.179.2023.06.20.07.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 07:49:49 -0700 (PDT)
Received: (nullmailer pid 3575014 invoked by uid 1000);
 Tue, 20 Jun 2023 14:49:47 -0000
Date: Tue, 20 Jun 2023 08:49:47 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: gpu: drop unneeded quotes
Message-ID: <168727258711.3574956.16756717526607386996.robh@kernel.org>
References: <20230609140738.64958-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609140738.64958-1-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 09 Jun 2023 16:07:38 +0200, Krzysztof Kozlowski wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 +-
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!

