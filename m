Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CA9374BA3
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 01:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7498D6EC7B;
	Wed,  5 May 2021 23:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CFF6EC7B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 23:01:10 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id c3so3687226oic.8
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 16:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2t7KI7LfK5f/FnHiV9rDrMTIJlm24ZGWJejB3IMlcwI=;
 b=C/InVUveC//tdGleD7wc6XhKihWhQHDUdc1UeeA7hMGniAWvjHyFYrInxGJV9c5Z0n
 DDd1Yfktnu5FfGK2zrchKIOJR2FtogTIKnuI1ca9o8O6vws620fNshDsWtuXpRuKC173
 rX0Hf8eLo1uofrOYOrU30sn3ED97qNYnQGDFjG6lH8OVJp44X2npkhOobDruCm0w8y52
 9HFI4AQze1o50NB9yyomDD84grMbAU0/C8Yp7HdBCkHjj/2f71V1E3r9I4MDmdtTgX0P
 Q8lQs87PxLc1ZwjnS6qWW9uwg4z/OIURsrHnfJ4Fiu0noTaJL6B6y1AhMlJInrieVEX3
 kraw==
X-Gm-Message-State: AOAM5302dFkt/CpGQylfYX8BY6kWeVSnhAsfJcjKqfbY1CX84FxoiAc8
 rPZPG5UbJmda9nPg6B4j+g==
X-Google-Smtp-Source: ABdhPJwqSOXRvGO7rMRB/1QA3ZzGYWjxV1j2PQ/ar6QmazCIHQeBzFb80UuwGfZaOP8RQ6MfH1OcLA==
X-Received: by 2002:aca:48d5:: with SMTP id v204mr8307187oia.7.1620255669496; 
 Wed, 05 May 2021 16:01:09 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m67sm190792otm.69.2021.05.05.16.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 16:01:08 -0700 (PDT)
Received: (nullmailer pid 3001472 invoked by uid 1000);
 Wed, 05 May 2021 23:01:06 -0000
Date: Wed, 5 May 2021 18:01:06 -0500
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv2 3/5] dt-bindings: vendor-prefixes: add congatec
Message-ID: <20210505230106.GA3001442@robh.at.kernel.org>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
 <20210428222953.235280-4-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428222953.235280-4-sebastian.reichel@collabora.com>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Saravana Kannan <saravanak@google.com>,
 Alessandro Zummo <a.zummo@towertech.it>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Apr 2021 00:29:51 +0200, Sebastian Reichel wrote:
> Document binding for congatec.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
