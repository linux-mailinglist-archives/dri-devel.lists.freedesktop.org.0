Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B08731EE4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 19:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FAD10E531;
	Thu, 15 Jun 2023 17:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621C310E52E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 17:26:19 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-33b3cfb9495so42967125ab.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 10:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686849978; x=1689441978;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eiE+FMwFXrvEzfrfx66BeZbJm09rLDYZlCG0hGL4XwI=;
 b=IKQGBjFRLmc5edKpiDbKwdFhRRR1NEiW/Jb7imAY/cwGf014JyHxYeFeC7m30dPF1q
 I4WglNv8qYp9CAB6JoK5pbjp9+WKsKEEKggZgLcLWswc62UdmSEIDwyDRLzAPJHfT3FU
 X9cCMeCeEn/hTxHkk1Tu9zxkXRp8fm+r074zR4os8XOYI1ZD+c5EUyyuoapyiMuakdNN
 +zHq+Nu+DJcXQMLNMZveetSsmR/mYBNQBt0hnPdVEAksWEtAyJiG69g7hoZkRlwxFpA9
 FUGR2Lajr+Tgo3prn0y4IVnZcoJSeY7o3XYfpewTZeWowV65M122y+RuBbnfDJSQXLRB
 oZdw==
X-Gm-Message-State: AC+VfDxXqQnM4ZX6djlRUjhluu+AM8Yz5WGIpSyhMbCp11NbCRbGfkvf
 Dlzoo0Dl/0ivYcgyFP4DdQ==
X-Google-Smtp-Source: ACHHUZ5ffp/CPCX/w2WnRbG3x6FbKIfQYYkpTq2fX2zmFBurHApqSFxCEWGU/yNpzidUDjI/F1Sn5g==
X-Received: by 2002:a92:d08e:0:b0:33a:b6ca:c4d3 with SMTP id
 h14-20020a92d08e000000b0033ab6cac4d3mr108866ilh.12.1686849978327; 
 Thu, 15 Jun 2023 10:26:18 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a02c72f000000b003c4f35c21absm5576928jao.137.2023.06.15.10.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 10:26:17 -0700 (PDT)
Received: (nullmailer pid 1229750 invoked by uid 1000);
 Thu, 15 Jun 2023 17:26:15 -0000
Date: Thu, 15 Jun 2023 11:26:15 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: Add missing property types
Message-ID: <168684997427.1229651.3186486766088079078.robh@kernel.org>
References: <20230613201114.2824626-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613201114.2824626-1-robh@kernel.org>
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
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 13 Jun 2023 14:11:14 -0600, Rob Herring wrote:
> A couple of display bridge properties are missing a type definition. Add
> the types to them.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/bridge/analogix,dp.yaml          | 1 +
>  .../devicetree/bindings/display/bridge/nxp,tda998x.yaml          | 1 +
>  2 files changed, 2 insertions(+)
> 

Applied, thanks!

