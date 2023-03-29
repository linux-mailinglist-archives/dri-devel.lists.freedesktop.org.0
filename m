Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 886256CF36E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 21:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3056910E188;
	Wed, 29 Mar 2023 19:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B73910E188
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 19:44:36 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-17aeb49429eso17407213fac.6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 12:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680119075;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gw4BTbq/GKEHZpknHsWKDHl2LDWv94M+hU6ER2t+0i0=;
 b=irGmhFVpsOdY0n9g70K+OgQUKiMHeVdhSxaYntn12ey76zUs9h50TJKp3hmUXdVjEk
 KC4RzMe/4FQZ/YqozxAWAMG+BotvVVdWGKFCCmEILsMuqfZw3UvwjfDNQa1k+Dzmz/gi
 zw06nypqEo0KPztiKomlPziOWSY39RjNT8423g1V8Xx2FiHFYy0F0IMmb47TH0A48Ve+
 e1T5kNJ67mhsNLcIEgsHn18QRr4taCwfGZq5Dd1yA1t4Ai6/K6uAGpCd1ECoUoxZOE+Z
 EWrMmw48SOmL1t6Tuv4VFqzUtgTXKGzgdRvMAeFHfr9jTxBMu2UNIeZBEie6g7+VCbI6
 1xVg==
X-Gm-Message-State: AAQBX9dfWmVKxlTJ5I87ZGRFULklXGwZLiid87gIZDkv5wbutYv+Ytvr
 7T3DDTPzoGTPcByYr6y75A==
X-Google-Smtp-Source: AK7set+O9Odhp1fWLs2DYIMjVAxvfspb1xzgtELXVpLM0P2qPRhdawCZdo1a7m777DWX9U02hiRWpw==
X-Received: by 2002:a05:6870:65a5:b0:17a:c102:b449 with SMTP id
 fp37-20020a05687065a500b0017ac102b449mr12497538oab.59.1680119075716; 
 Wed, 29 Mar 2023 12:44:35 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 tk6-20020a05687189c600b0017703cd8ff6sm12085149oab.7.2023.03.29.12.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 12:44:35 -0700 (PDT)
Received: (nullmailer pid 4097012 invoked by uid 1000);
 Wed, 29 Mar 2023 19:44:34 -0000
Date: Wed, 29 Mar 2023 14:44:34 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/6] dt-bindings: display: panel-simple: merge Innolux
 p120zdg-bf1
Message-ID: <20230329194434.GA4096624-robh@kernel.org>
References: <20230326155425.91181-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230326155425.91181-1-krzysztof.kozlowski@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Bjorn Andersson <andersson@kernel.org>,
 Harigovindan P <harigovi@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 26, 2023 at 05:54:20PM +0200, Krzysztof Kozlowski wrote:
> There is nothing special in Innolux p120zdg-bf1 panel, so just like
> other Innolux panels it can be made part of panel-simple.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../display/panel/innolux,p120zdg-bf1.yaml    | 43 -------------------
>  .../bindings/display/panel/panel-simple.yaml  |  2 +
>  2 files changed, 2 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml

Series applied to drm-misc-next.

Rob
