Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8356739924E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 20:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FE76E544;
	Wed,  2 Jun 2021 18:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1D76E544
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 18:16:25 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso3258434otu.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 11:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YGs3ySUz+5yWOPGnnKcSs4d7r1g1klxeD4AjriZfMMk=;
 b=GM+NIC8LFPzn9eg9xRYCOam6gLsOEL7AiNZzmgqwEuSBOeeECh7XPGmYZmqXbmKV7w
 7xrOV/v43OVLBWJWS6NShad2ed8BaOcMadgF1Blb/RtYLZkqSqst2wNunao7wNcgkwJT
 aiG4U1tlBFb3jEqhcyVA2kwZdgTZw/YMtszGoq4WWEt8nTP/yGA+5fHGxTBcRvstzfOu
 nKsJNlmk4JWdY4alFmeGOGwJpDZeTSfCBqf5NXhbVFgkTie7WOYXC57hFMcMHNT0zgAW
 MivN+PhP8MpnXJ/WHno6UA1LkCwfbE4pacglLpacsp06R/X/tRkyEPEbHMf4nOLrjNEs
 sBig==
X-Gm-Message-State: AOAM530yxCdqTaIgNiySflEu24bHGRmUA76hf6Utact5ZDR0PQqKAcL8
 OWOos1YaBg/STG60NLVXGA==
X-Google-Smtp-Source: ABdhPJy6S/YWhSYolU2l1/6RinXushQyOPCztVxygHdQZ9YEIyxTE/T30sxKhvx+av2QZ1DrkGThfQ==
X-Received: by 2002:a9d:729d:: with SMTP id t29mr5989930otj.256.1622657784498; 
 Wed, 02 Jun 2021 11:16:24 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m66sm138702oia.28.2021.06.02.11.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:16:23 -0700 (PDT)
Received: (nullmailer pid 3703237 invoked by uid 1000);
 Wed, 02 Jun 2021 18:16:21 -0000
Date: Wed, 2 Jun 2021 13:16:21 -0500
From: Rob Herring <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v8 04/11] dt-bindings: drm/aux-bus: Add an example
Message-ID: <20210602181621.GB3692772@robh.at.kernel.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.4.I79c7ed8815a07d285dd3b38e680e980d1024dbf1@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524165920.v8.4.I79c7ed8815a07d285dd3b38e680e980d1024dbf1@changeid>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 24, 2021 at 05:01:52PM -0700, Douglas Anderson wrote:
> Now that we have an eDP controller that lists aux-bus, we can safely
> add an example to the aux-bus bindings.
> 
> NOTE: this example is just a copy of the one in the 'ti-sn65dsi86'
> one. It feels useful to have the example in both places simply because
> it's important to document the interaction between the two bindings in
> both places.

Don't forget the 3rd copy that exists in some .dts file most likely. 
That's 3 places to fix when we improve or add some schema.

I've generally been trying to de-duplicate examples...

Rob
