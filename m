Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0CE4AE7DA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 04:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D12B10E2AE;
	Wed,  9 Feb 2022 03:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10D410E143
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 03:30:06 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 n6-20020a9d6f06000000b005a0750019a7so661800otq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 19:30:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zEVQ7Rw/tzHyjS5OXKqbzOVt0A9B00mYmLifv1I8/aY=;
 b=qV0dSO6SJgtJWRzwFk2hA+r5OAJgbSrMNJQkZePL+0ZgswbYfmqh7+I4nlGvrETlWq
 y6dBV6lMqlu1z3BpkDCG3wpT+3DBaHYhyKb1KY8+V7SBNIERWZRYUjTVyga5MxgpI5/A
 eavPuVLodloLVge3QjEvkzZ9I0zjqCbJng4sf4oyo2eWDpEL5CjaIMocYijOIK3mud4n
 rnNsRtc+wYs7B05Vitxpvt0eeqDzMKjfwCSwdMrlzzt8Fn5S8HVj1D4dIGrpxsOSGleX
 0kxsmcC38J/DeFa8z6hnYRirDLFmKnij6beKZyYOIdyfe+UiHwUAYCuQ6U/UQ+nSeQhw
 wf0Q==
X-Gm-Message-State: AOAM533XZaux7lDBDrBEVFA0bNzWap9F3fEl16ZPH0lKGk8bKlexmkIH
 UmyelkZT4qjDMwVYvGEuww==
X-Google-Smtp-Source: ABdhPJz66Nmvy9lEMz85Tl+OIfWEdYgsLXBYEqdh227dri4jtALkvNMeZsjk0ExxLb3Wwdb8nzKfEQ==
X-Received: by 2002:a9d:73d8:: with SMTP id m24mr188295otk.52.1644377405869;
 Tue, 08 Feb 2022 19:30:05 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id b20sm6021320otq.20.2022.02.08.19.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 19:30:05 -0800 (PST)
Received: (nullmailer pid 3582173 invoked by uid 1000);
 Wed, 09 Feb 2022 03:30:04 -0000
Date: Tue, 8 Feb 2022 21:30:04 -0600
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 14/27] dt-bindings: display: rockchip: dw-hdmi: use "ref"
 as clock name
Message-ID: <YgM1PBsETHleuSNt@robh.at.kernel.org>
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-15-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126145549.617165-15-s.hauer@pengutronix.de>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, Peter Geis <pgwipeout@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Jan 2022 15:55:36 +0100, Sascha Hauer wrote:
> "vpll" is a misnomer. A clock input to a device should be named after
> the usage in the device, not after the clock that drives it. On the
> rk3568 the same clock is driven by the HPLL.
> This patch adds "ref" as a new alternative clock name for "vpll"
> 
> Changes since v3:
> - Keep old clock name for compatibility reasons
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../bindings/display/rockchip/rockchip,dw-hdmi.yaml      | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
