Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4D4365D3E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 18:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA1C6E86D;
	Tue, 20 Apr 2021 16:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2669D6E872
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 16:25:14 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 o13-20020a9d404d0000b029028e0a0ae6b4so17273205oti.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 09:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xNokQdd4tw5VCGbyrKSX00JvoLe/Bjaadc0Hud+iZsc=;
 b=AIcJzVMFzsy0IpvMFaFDuEU32gJv09u09miGfEmPmAzNSg0I0duyLZuGbwiKpUQXk8
 7G6Hg3e0W+fNCP9+MV64K+nZ5q8f7IbKbxPBbpCwfxTEspydbbZL1jjeo1p9+pLiOsOH
 X9jbJffwiio3IJZ7PC9om+V8ZVA2mdMfBVD90Lh2GNyTTCLGkVBVyoukzBOZcxKGHdtr
 rljSWtdFWo9R8i1vX+w7hKmuqp5gXiAgd1MqfSPwjeAzLb6ZKtb/wBkn300//ng0cckx
 aqr2nV44rdP5Jp+mtuh/+A824ZZQwHa8r/PiSFMj8ZsA7aIy6duHkJ4xrLnnjv9KUbLY
 u9bw==
X-Gm-Message-State: AOAM531dtmwk35RZpghxf8U7IXkCX7uQkEqSXjeMeYBEKUv2KcBVEJrA
 hdZkMjtaKio/ntBccs4OFg==
X-Google-Smtp-Source: ABdhPJzASVJX35pEZmVLXrSCMM1IFUj/grYGNXM2VM9K/dZzVcb9p8rJj4sXmjiCuipGmkeJADIxgg==
X-Received: by 2002:a05:6830:15cb:: with SMTP id
 j11mr19339733otr.209.1618935913281; 
 Tue, 20 Apr 2021 09:25:13 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a65sm2362646oob.27.2021.04.20.09.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 09:25:11 -0700 (PDT)
Received: (nullmailer pid 3431648 invoked by uid 1000);
 Tue, 20 Apr 2021 16:25:10 -0000
Date: Tue, 20 Apr 2021 11:25:10 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: mediatek: add mt8167 to hdmi,
 hdmi-ddc and cec bindings
Message-ID: <20210420162510.GA3431608@robh.at.kernel.org>
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
 <20210419073244.2678688-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419073244.2678688-3-narmstrong@baylibre.com>
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
Cc: devicetree@vger.kernel.org, chunkuang.hu@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 Apr 2021 09:32:41 +0200, Neil Armstrong wrote:
> Add mt8167 SoC compatible to Mediatek hdmi, hdmi-ddc and cec schema bindings.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,cec.yaml       | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,hdmi.yaml      | 1 +
>  3 files changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
