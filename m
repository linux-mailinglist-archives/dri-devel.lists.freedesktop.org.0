Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC5A5805EA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 22:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264FF8E856;
	Mon, 25 Jul 2022 20:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914E58E83D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 20:47:55 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-10d6e8990b9so16253485fac.7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 13:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wM1hK2c/dTp5U3qgSjbl+Mkf9GAgKrulWLu2l8asXMg=;
 b=09ZDGCDSQZ4mCKeEB/74uffgrjE112benRLVAWtJHksN5tgo6MzPjH+U40qVBjLnn2
 1g6xFEaDN5EUjcyZA8JX87zZEPHDWplFvjGorufbV83UiQzIrJ0U2/n9tezVmEK9OTtX
 09a/ytzEpuCMZw7JRA42+Etkct9mUNPfy82v9xTVbc1v37vYnHkglx38kL94pZhivfCn
 2Ikpj6BFB5pMMoRsnVjaz7F0Mnffe4gTNAhI04s/VW0035JIr+5Z5kWA9tP1de5xcgb6
 KQW1OiiHWVu+jY+cyw8cWZhE/EMB8fIIBBaT8EBPBV/DQt9J0GE2TgrZaf4X2wzYIQCR
 t6Xw==
X-Gm-Message-State: AJIora901QpWrC2hStl+SHTQD+lfqXOiFp5j6uoy8cPl3dSgNBDApZG0
 cqimnVek1tWE9QrZOyqkqg==
X-Google-Smtp-Source: AGRyM1uYYn9eDDDIyVDp1EozaBHVGSFeYmutnuF07N2Do7HDPkvBIRyLKm0gPmoaR0mEba9mzl7nSw==
X-Received: by 2002:a05:6870:231b:b0:10b:7a08:bfbf with SMTP id
 w27-20020a056870231b00b0010b7a08bfbfmr14335133oao.11.1658782074708; 
 Mon, 25 Jul 2022 13:47:54 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a056870b39500b0010bf07976c9sm6539499oap.41.2022.07.25.13.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 13:47:54 -0700 (PDT)
Received: (nullmailer pid 2696639 invoked by uid 1000);
 Mon, 25 Jul 2022 20:47:52 -0000
Date: Mon, 25 Jul 2022 14:47:52 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: panel: raydium, rm67191: Add missing type to
 'video-mode'
Message-ID: <20220725204752.GA2696554-robh@kernel.org>
References: <20220719215201.1877997-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220719215201.1877997-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Jul 2022 15:52:01 -0600, Rob Herring wrote:
> 'video-mode' is missing a type definition and is not a common property. The
> type is 'uint32'.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/panel/raydium,rm67191.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!
