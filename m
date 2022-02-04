Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E954AA30D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 23:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0F310E481;
	Fri,  4 Feb 2022 22:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB3710E7F7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 22:20:59 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 t75-20020a4a3e4e000000b002e9c0821d78so6236625oot.4
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 14:20:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=51UcnV8idQFx159Np6IWbNC0MFaAO1dhJYFWbgqko8Y=;
 b=5U5vq34hKGJQJrXWc838nX6C2dOSRLBbaTjQKTEwLXaSDIGeHYPSfQYqqZpE1sBrzg
 AP/Byyl759VnNT04HPn5neKRxWLqLXip8CnWc7+gL6kylbunLR+jb4XBRooJO4YI1F6c
 /mDCM8sAWe1JOsJzqddLhTdFm0MgigVGezxs6IBjZzHeXgxJ+yeLIZr60MfSPh0t5qqI
 474YztAUppZB1qv+mBsjNHNzzMUE4Mx7Oepm3dNddDNr8WX3BKoJCjXX8u9gMDCI8VOC
 SmVieKfA8LjUtwfNZB9rN8ClNXodZirjKxWcC6qNiF5f7AA+9M5nwpxz8FbKgmnR17ZJ
 GH/Q==
X-Gm-Message-State: AOAM5335NSVwUZj6qxVyR0JZg0Q229HMYdVdMth20TBSfJDq7Ext6G7R
 IVOeCfawjD+ISf6xnX840Q==
X-Google-Smtp-Source: ABdhPJwvUqeWoik7ZNFtYmaKADKWiDeedTQlW+VdSFjU9fb9NCAECIy0T20ANVIH1ZXCc5VefSf6RQ==
X-Received: by 2002:a05:6870:e6d6:: with SMTP id
 s22mr300999oak.261.1644013259101; 
 Fri, 04 Feb 2022 14:20:59 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w62sm1303039oie.4.2022.02.04.14.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 14:20:58 -0800 (PST)
Received: (nullmailer pid 3285339 invoked by uid 1000);
 Fri, 04 Feb 2022 22:20:57 -0000
Date: Fri, 4 Feb 2022 16:20:57 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v6 4/4] dt-bindings: drm/bridge: anx7625: Add aux-bus node
Message-ID: <Yf2mySxEeH6zru1C@robh.at.kernel.org>
References: <20220203141023.570180-1-hsinyi@chromium.org>
 <20220203141023.570180-4-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203141023.570180-4-hsinyi@chromium.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 03 Feb 2022 22:10:23 +0800, Hsin-Yi Wang wrote:
> List panel under aux-bus node if it's connected to anx7625's aux bus.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  .../display/bridge/analogix,anx7625.yaml        | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
