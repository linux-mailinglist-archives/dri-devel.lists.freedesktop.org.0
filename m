Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C099F65EF9B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 16:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E896D10E0D9;
	Thu,  5 Jan 2023 15:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1637610E0D9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 15:02:52 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id DE9AC2B066F5;
 Thu,  5 Jan 2023 10:02:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 05 Jan 2023 10:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1672930966; x=
 1672938166; bh=WkYtchw+JsDA8U4rAt2DTeYa7Q89MkU3G5aouTgy9yQ=; b=d
 aqvw6TkNechKgjoSsmo8/QAVH4UazQIAobTGp/lPGClu15GtGKbLKof21QIzYirk
 A5/edUlx25FduSLhGamiSNOzSpHqR5bXBpKmCl8SUq0hem6DF1W03Psa0e4+HXka
 u77+2yAdUTy3Nfv0yxC6sb0Rbn9iZBeA04o82pWwMW3WdNC/p6MFPTZT0He5bHt0
 lj4B+C0WjM8QBgAXN/bofNFUh2bDx2jLs6GOW6H/ktjXDyGFWZ6XfmXKDrQHp+N4
 ob3mAv4bnnM3i7jkmgYOcRfZptlUIvuATuKc/VtQ5M3dDyAnIS0PIOFcRf/AfOt7
 Tz0xyigIaYHfgWa27X4UA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672930966; x=
 1672938166; bh=WkYtchw+JsDA8U4rAt2DTeYa7Q89MkU3G5aouTgy9yQ=; b=G
 HQx7PxaBigaFXOSifZ853YfJvLVQuOkX7jJszSB7Kn9wiwXZHRqVwuS9ic6gsWHb
 1jxCc8OmHdnrWjmF3muFNlOixNylxVTUf2ViMvKQbZdG2Ua2Bkr4Dy/aQO/bD+Nh
 QSnVi/kVCbrH16rKN3v7p1YjsWhriVne5IQXs5ThnTlyC5Y8gujdMtKXLZ3NEkzS
 c+CEEW+eTbDS4I0U4l75i+qN5fIXzQx9tqC27ybFsWTl1ImvHtPBMW3Zq7Ibls6o
 smW8xincJ3KLubaJUsolFz612i3cPvhkZLBH2kKH1KzxXRj3fElcuwjg6o4cnEfE
 noexAXMwSRohNeqkGzfow==
X-ME-Sender: <xms:lOa2Y3XhFglO11uLOBPzOK18J2JM23g81BWVNp05n-htXu2TABmIMQ>
 <xme:lOa2Y_k4HwMhIA7jne0Ph-8C1v4_W12w0zOqcr6Jd50I4slMeAgkHsJOnPJ4MQjw1
 HslTGJ037FD50_ceqU>
X-ME-Received: <xmr:lOa2YzZQZ8xZJJuXo35BRT7-HgGnoTZXcl1zmWrR0sES4LiWE1cF4Bzt8U-pr5weS9q4LUOVYOz3tGajoab2WoTn17Mkbxj3g1ORU7y0_oWhPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeekgdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelieffgfdvteejjeeujeeiheeuvdetieegheethffhieefgeelkedukeet
 geeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:lea2YyUXueTazBWPRPfHzGilEJ8cwv_P5eGluh9a8KOyL8I2t9andg>
 <xmx:lea2Yxnd-VWyK8ml6nLWbJB1_c6iL_QIf8KSYTDKA1FqAf4_qaring>
 <xmx:lea2Y_c1-hkVkK44Z64ug7fN2iliM3IRJOQhb8HLZKf-hyFAcKxNeQ>
 <xmx:lua2Y1yLrWihP2eUVteokblN25OQeZOOv2dsUQpkm7oGA9e_UuyHnXJMcG8>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Jan 2023 10:02:44 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
In-Reply-To: <20230102120123.19062-1-maxime@cerno.tech>
References: <20230102120123.19062-1-maxime@cerno.tech>
Subject: Re: (subset) [PATCH] drm/bridge: panel: Prevent ERR_PTR Dereference
Message-Id: <167293095135.351461.4447192942392286304.b4-ty@cerno.tech>
Date: Thu, 05 Jan 2023 16:02:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.1
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dan Carpenter <error27@gmail.com>, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 02 Jan 2023 13:01:23 +0100, Maxime Ripard wrote:
> Commit 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to
> drm_panel") introduced an access to the bridge pointer in the
> devm_drm_panel_bridge_add_typed() function.
> 
> However, due to the unusual ERR_PTR check when getting that pointer, the
> pointer access is done even though the pointer might be an error
> pointer.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
