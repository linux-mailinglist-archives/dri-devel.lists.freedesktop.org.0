Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B95A16ED98
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 19:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C5E6EB74;
	Tue, 25 Feb 2020 18:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B2A6EB74
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 18:12:52 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id z9so405966oth.5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AS7kSS/iqLKzluPfp1yYbu9JOTEV5k+vqjiHSYnpBvI=;
 b=N/tH/DRfTkCb3eMhXCS1CFsnZlFR9I5lcyqWAgz1iwviRUjqJ2gr2IA6onLIi605JD
 ou6Wkqx1cI3q+Dr74tC27qm0PvkQCC2UurxvI+tzdjtvFzydp9OlVpgz9ZaLQ2s2Lond
 9BPYawTC75ibL0Kmd76Z3YDSFzjb//Vux4VLQ6ngtelBUW0IUmrrB606LBwADl4zkMb+
 c19bHMNF7nT+TpPqtO3I1dxsUXYIR65WZbTVBftHwKwB4k+pEy8lCTCVMUSt3BUmOQB2
 ru8Kow9ya1wMe2zLJmftute3QTzY7ZmwNTJdCS7MCxCoNDwkp2kOhXYTK14GD+HE6k5o
 NZtw==
X-Gm-Message-State: APjAAAUdUL6G/BhoeCerCWaV1CILbcGZDNCXtuFB9sBTw5FHE1cQ2Ll9
 pP9XLF9K3LKb0j6Kfg++ghcxCXQ=
X-Google-Smtp-Source: APXvYqzaRLTYii3nkDojyPbV178KGbB2P+XQwbj2nlCdlEq+3mr3I5oDWMhdY8xQvu7D06fbfbzTIQ==
X-Received: by 2002:a9d:6b06:: with SMTP id g6mr45424470otp.93.1582654372101; 
 Tue, 25 Feb 2020 10:12:52 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n25sm5528659oic.6.2020.02.25.10.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:12:51 -0800 (PST)
Received: (nullmailer pid 29791 invoked by uid 1000);
 Tue, 25 Feb 2020 18:12:51 -0000
Date: Tue, 25 Feb 2020 12:12:51 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3 v2] drm/panel: Add DT bindings for Novatek
 NT35510-based panels
Message-ID: <20200225181251.GA29735@bogus>
References: <20200223121841.26836-1-linus.walleij@linaro.org>
 <20200223121841.26836-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200223121841.26836-2-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 23 Feb 2020 13:18:40 +0100, Linus Walleij wrote:
> This adds device tree bindings for the Novatek NT35510-based
> family of panels. Since several such panels are in existence
> we define bindings common for all, and define the compatible
> string for one certain panel (Hydis HVA40WV1).
> 
> As other panels are discovered and investigated, we can add
> more compatibles to the binding using oneOf constructions.
> 
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Rename file to novatek,nt35510,yaml to match the first
>   compatible.
> - Require both the specific display manufacturer compatible
>   and the novatek,nt35510 compatible in strict sequence.
> ---
>  .../display/panel/novatek,nt35510.yaml        | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
