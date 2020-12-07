Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E122D1D8D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 23:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B18F6E8F8;
	Mon,  7 Dec 2020 22:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437F16E8F8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 22:42:39 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id x16so17355862oic.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 14:42:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YiGMY24NvG+qDD2dLzercR68pk9jWvYpHiZ4hoYrapc=;
 b=FOMscZ+lp0rmtYuHR24TX73/6o54UtJd8zhj19yReu7BGhZS4FMaACnfLPg3UEn8cF
 sfsnpshJ7r1+3AmrWNPUCOyivipaMMGcswRVSXAXO43kZTTl4QE9wpAjtd6pkl8THIDC
 5w6M/UO5nGfEn1xfcKIv+hAhikkU5uASd2XOq9NjI6WfWWg9WaGLnbK49xSicKU4Pn8k
 XsC1dahmNVB8KXrjhUxQHTo8WV/HLl6O3xgIp/sARvxvTlxKv1dAU6YKj9txzN65mbFP
 c3jEW0//JdSiB7CSzKFVWu8u8kdUAMyBZmHN++gnVyASLLkFnAoxiuDn62zwBv7vy8bl
 XI5Q==
X-Gm-Message-State: AOAM533pFc7bg94KrY/xhbgluUKEd3xabKm9WTbp1E1xICqpl0oyojjJ
 /6NGzMKTFuIb07MY66Ui6A==
X-Google-Smtp-Source: ABdhPJyEh6obLo3kkPcOpFXkhowNTZBEANUOz5IaapchbwUFJKb2tWBZruUtSCktbtkr34ZI8dJpqQ==
X-Received: by 2002:a54:4e95:: with SMTP id c21mr788580oiy.84.1607380958531;
 Mon, 07 Dec 2020 14:42:38 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m21sm1357720oos.28.2020.12.07.14.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 14:42:37 -0800 (PST)
Received: (nullmailer pid 978070 invoked by uid 1000);
 Mon, 07 Dec 2020 22:42:36 -0000
Date: Mon, 7 Dec 2020 16:42:36 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: Add power
 supplies
Message-ID: <20201207224236.GA978011@robh.at.kernel.org>
References: <20201123034652.3660584-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123034652.3660584-1-hsinyi@chromium.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 Nov 2020 11:46:52 +0800, Hsin-Yi Wang wrote:
> anx7625 requires 3 power supply regulators.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> Change:
> v2: remove maxItems for supplies
> ---
>  .../bindings/display/bridge/analogix,anx7625.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
