Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F1B4A6E38
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 10:56:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C681110E4A5;
	Wed,  2 Feb 2022 09:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888C610E4A5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 09:56:12 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 4F8DE2B00BC1;
 Wed,  2 Feb 2022 04:56:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 02 Feb 2022 04:56:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=Z7i/gIstVFNk3d
 lHdldAzj/PWqAnuJPMeVFtRzRDtHI=; b=sLLaQHuTaKh7hSojtE+OombaR+llsl
 t4WjAErLuJ/pyW9RidA5aR/EyRH7v1b2Waf09BnPTHr1VEIwqH5B3/pVbQK6VxhU
 /jaRBSk92vznEktMiPyBvqAfhfSW8bT9ncxCDOQ50y+9MyxIB4spvgmr7BMIfICk
 CP0ZiKK3ye+bpqqJeP0keBPCZsBUHdOrqWhD8Wdw89QeCaPJBkaaNWnFaNo8LKFM
 hurvyOG0ST08CrIBKx+7QFk0Sra1DeLyg5rgv6Q6OHw73MO2qT4l5aoWU0jiBE2U
 KKeqfZPzqp3buT93q24OvDMeLIardd8nwHxqWfGHOl7q1JFTYuC8seuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Z7i/gIstVFNk3dlHdldAzj/PWqAnuJPMeVFtRzRDt
 HI=; b=QCqni5/zkxBxJ0hKKeNCB1g1Gc8tp1peW3j5ND3J/EggNr2tzqwYXm8dT
 sbWY6tKQEkrPEYLRQRDnj0sM26PlFtTh08NDtcxdCtozoj4s3xmohkh5XnWMDs2u
 sloMS2uBZMX5qWCaTGolHBbJ5D4d5/JWopvmsiorxfpV+opKRzgbW/biuwfxyBdj
 4RsMjwYtlFKedmqJulgk3n/wgVGArxPBEzo2meWT2yOoLoNbDNrjuT19VivjDl0z
 kU1AMxFBUbNsK6xzKFD85g2Y+o/LusvkmPqFVzugVSVeO85vk8wMywZSBSBzDumr
 eGUNoNvZxttYLFxjNP2ErkEgJJo4w==
X-ME-Sender: <xms:OlX6YRfgG51AxYKO9uSxy8kUACA6CLuwFWUlhC_mqK77pCZTouyBXw>
 <xme:OlX6YfMvXb_pU4PVhrV65KNAuNrd5BFplC_OUO_h3niiMZ1n_ALZvYI8LRoL6nOlh
 nO3CLVanMrA-cJ0StI>
X-ME-Received: <xmr:OlX6YagUJhlZXOdyqPzJ7WpES-vBLB0laEPNRCWQxQNbe80TPgaPY4dDRrdNiG9EgxoI8RTtAEJYISY4X6GP4WX3WBDbMVNoi-tdcx0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeehgddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OlX6Ya8nies6XSA8E7Ju9K3FmDNjKXZdej9iCY42J26zR2hhIy5pZA>
 <xmx:OlX6YdvjpBbG7FyOZiKYCneVxOyWBxJ-tCysii3hSrqjRlSH6EeuVg>
 <xmx:OlX6YZFitkGckvqch-664oSkSzxj2eaWTtKs4h4jHmQw0LeIilU-Ag>
 <xmx:OlX6YTKSg5hopIhem9-7kBiiGXqFTajbcPHr2YKFkZwwQ7ZcUwBNHO1tN3Y>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Feb 2022 04:56:10 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Frank Rowand <frowand.list@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: (subset) [PATCH v4 1/2] dt-bindings: display: Turn lvds.yaml into
 a generic schema
Date: Wed,  2 Feb 2022 10:56:00 +0100
Message-Id: <164379573892.876896.5996086983408978566.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127143045.310199-1-maxime@cerno.tech>
References: <20220127143045.310199-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Jan 2022 15:30:44 +0100, Maxime Ripard wrote:
> The lvds.yaml file so far was both defining the generic LVDS properties
> (such as data-mapping) that could be used for any LVDS sink, but also
> the panel-lvds binding.
> 
> That last binding was to describe LVDS panels simple enough, and had a
> number of other bindings using it as a base to specialise it further.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
