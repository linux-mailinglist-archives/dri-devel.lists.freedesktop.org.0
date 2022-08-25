Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7DA5A19FB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 22:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5968610E0A1;
	Thu, 25 Aug 2022 20:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0158310E0A1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 20:03:24 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 v12-20020a9d7d0c000000b00638e210c995so14617439otn.13
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 13:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=NX+kWlu7YzDi1erT8mv3EVrowDzctlnFUR1m+ea6ebM=;
 b=7Gv4p8Z32FhomQGj5idLroUZWmK0H3vyi7tDKKDP71EXLWXCSuksMPrAqty16SwDXh
 vHzyepwAHXTfgTuk4UrcUf6gHtbH3k0eCZzkzQEpQga293asTesLWbmbIMO4NDWScKqc
 s+BniZ5FMlcxnbSZgJEDiEEU3BLwyz9Ug+9OsYKhTsQmxjpyiW5PsB5qEx2aOQO7mNbk
 k04Frt0HmtuOCKMtd773f9GKexM3gb56evtz945UCtD8l7Dqph89HxZmg/AFqYSrwtEa
 PFQ36XrWf6Wg4iiIDI1HvX1ei3XsKJMTr+fHsI0WtEOqtnMsLoJaLVLco9lw68tnCNFc
 wd1w==
X-Gm-Message-State: ACgBeo3A0eS1vHiEnGe1LYUV9rmkveDeXkxsLIEapGZ6CfT9bdtJBQVj
 tfv5PBPKh20ER0zFHwDHtQ==
X-Google-Smtp-Source: AA6agR6EYi3++RtEDrELk6ImmynBdGP+rRvJ/VMvskjARhold+xHLeFuDizT0Xo3s+lz8Jth8lG9Qw==
X-Received: by 2002:a05:6830:3699:b0:638:8a49:b83 with SMTP id
 bk25-20020a056830369900b006388a490b83mr257269otb.13.1661457804218; 
 Thu, 25 Aug 2022 13:03:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y5-20020a056830208500b00636fd78dd57sm24otq.41.2022.08.25.13.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 13:03:23 -0700 (PDT)
Received: (nullmailer pid 1595917 invoked by uid 1000);
 Thu, 25 Aug 2022 20:03:22 -0000
Date: Thu, 25 Aug 2022 15:03:22 -0500
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: adi,adv75xx: Add missing graph
 schema references
Message-ID: <20220825200322.GA1595830-robh@kernel.org>
References: <20220823145649.3118479-12-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823145649.3118479-12-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Aug 2022 09:56:43 -0500, Rob Herring wrote:
> DT bindings using the graph binding must have references to the graph
> binding schema. These are missing from the adi,adv7511 and adi,adv7533
> bindings, so add them.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/display/bridge/adi,adv7511.yaml       | 14 ++++++--------
>  .../bindings/display/bridge/adi,adv7533.yaml       | 14 ++++++--------
>  2 files changed, 12 insertions(+), 16 deletions(-)
> 

Applied, thanks!
