Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904245178C8
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 23:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6030610F4D1;
	Mon,  2 May 2022 21:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAF110F4D1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 21:07:39 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 f6-20020a4ace86000000b0035f083d2216so374250oos.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 14:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a371VTHbSEYi79+z15TeJoB6mz5PgVgi7zKHT0xX1Kk=;
 b=SQsun6tewHrjO3SWO83yCxBTl8YorKIQKFjKTWkwo5FR7SEAgqyPJZJCDZ7cWKE4Vt
 6p8EMlH1xE9SWoENZ6lUEbVTz/KOkQNWxUOm3cN2ZiCDufxlEMB7ayQZlisC7/oPddBf
 rvDYtCxnFS384DyiWc7+s+thGb/qB9NdnO4wBxIDynUowC172pYK1ToSrfZe2u5V+Akj
 2AbaZHVE2AAJXKrKdG+eIpoCCNYMTxdr7Ol8L/1m1UNiCNUm2TAFs/svHGcm6KSwyteZ
 1WUxwt6svv3OfEtWT5awCgNJvfaSBB/vy22kqkmUZ2rE9dDN7hwg8YpgAPxXQKnfT771
 mCaA==
X-Gm-Message-State: AOAM531Uzp6ig4fH1ZBM9rvOxYOgi2dxLUEcrMcuAURUqpHQDMQzEq+a
 ks+6ar0bmfyQl8Q7fx4k4w==
X-Google-Smtp-Source: ABdhPJy6gQDKkHfAjtBO138VnCai1byqDYuCDzwBFDj3hayyiSHN7IKBKJSlh5E+ccDtYeuAvkjfMQ==
X-Received: by 2002:a4a:d48c:0:b0:35e:aa26:b720 with SMTP id
 o12-20020a4ad48c000000b0035eaa26b720mr4702936oos.12.1651525658914; 
 Mon, 02 May 2022 14:07:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x108-20020a9d37f5000000b006060322123csm3242660otb.12.2022.05.02.14.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 14:07:38 -0700 (PDT)
Received: (nullmailer pid 1752385 invoked by uid 1000);
 Mon, 02 May 2022 21:07:37 -0000
Date: Mon, 2 May 2022 16:07:37 -0500
From: Rob Herring <robh@kernel.org>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v2 3/4] dt-bindings:drm/bridge:anx7625: add port@0 property
Message-ID: <YnBIGY+EWuZ2/rGI@robh.at.kernel.org>
References: <20220422084720.959271-1-xji@analogixsemi.com>
 <20220422084720.959271-3-xji@analogixsemi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422084720.959271-3-xji@analogixsemi.com>
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
Cc: devicetree@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, qwen@analogixsemi.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 bliang@analogixsemi.com, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Apr 2022 16:47:17 +0800, Xin Ji wrote:
> Add 'bus-type' and 'data-lanes' define, bus-type 7 for MIPI DPI
> input, others for DSI input.
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> 
> ---
> V1 -> V2: rebase on the latest code.
> ---
>  .../display/bridge/analogix,anx7625.yaml      | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
