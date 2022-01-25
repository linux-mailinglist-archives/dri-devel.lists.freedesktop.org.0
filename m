Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF6549AFC5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F40F10E660;
	Tue, 25 Jan 2022 09:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D267F10E660
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 09:25:27 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2A7BF580DB5;
 Tue, 25 Jan 2022 04:25:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 25 Jan 2022 04:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=rlstxoOruwBatw
 g3aqdaTs6o6tVKm2RxqltJTyKRuo8=; b=SyHPGPKmILvzDVhsgvP7+IK+j78hnc
 Wlzfw9MTPvhWza69UO6yrCpKh4qkFK3+kP+M+yJTtJ1dWxGQ0+4FQfXGsxw0e/iu
 /SBbI5CJKdy+R6n0JGTu01JLqZXSAjFsQcd3Z0n0znyC8+rsWIMEP6p6OWeVZFsq
 T7G/junoElPNhk3O9FGVOqBouhX6Gnblx664hkpxnzmVmO8X45Dh6aESMsJEhBua
 XafFSwmDqIzisjOv1qAyUFp37MmE+vwOrHberNNxijLVDoaCpgD1Ge+r58RK+up/
 iMbiSiVQ4GejAJukzR+hAMVIsge6IFV11ASLiAu+OebcoUH0yPgeQnGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=rlstxoOruwBatwg3aqdaTs6o6tVKm2RxqltJTyKRu
 o8=; b=QdtodtNAuGq79l95wrd3g6PP7HsOmDuYs1TUWcn05AEwIpvfY0dZqa+ze
 cnN5QL8Sp5UxwHCL0fEbhZb8vYaraUXKmdGbMCLa+HADZSgqmbFVNh1fL5D0ZMaT
 gmHHay03c1YJTh3JvW4xRjGgJL/kUJp3y6DbHJgFaG+/3OTWmXdZrmbV5aRlo3jl
 P87R9R1ZMWq7C3wbXFIdkjZbqBpfweAJQD0kNDNpD7Gjt2ul9l7OizqG8Zvye0RJ
 XYK/Ys1rn/3nur7rhCQ2zrvTNYz8FsoKvmuS3FtPt/yQKjJje3ZKgHGk8nJdnHC/
 ogQ8IH1wJ4zdxnC4fsupTEV5Ly9rg==
X-ME-Sender: <xms:BsLvYZPZ9hbvd3BYKQ_5GTAaQlFHvbz_av84WaAOWOq5zkmih0sZig>
 <xme:BsLvYb_RDuTZdYfDnbX0bGhl4X_jUaSo5TRJsi_KLVWAr-2Zw_-ibx6rztMZIOe1t
 GcQTHRd0x2vkjmWcGM>
X-ME-Received: <xmr:BsLvYYRANWC7H8e5emn6WOiG0HG7612cDgljJJfKZob_DaxXe9EkJJgSQM5hb0eeIlNtX96TE-73TqNj7LGBewHfr71AZi_yD9dce0o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BsLvYVt8NgVnQUm0crsTqGghtFiX617_6FRAENUflNmH31RNKMWy_Q>
 <xmx:BsLvYRd5FPa3JIRClbspBOfj54UD6aMcZFRzxsoqskhVRMVJ99xdIQ>
 <xmx:BsLvYR3VnD_Pojm75Qr5PtXsKJ4fYXbTWtPJK1SV__8xZAzYhGVbVg>
 <xmx:B8LvYd5pH1auLEljRb2MYF0u3nKbozDpfeMNvkbp15m2E1hrtZmF7g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 04:25:26 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v4 02/16] drm/edid: Don't clear formats if using
 deep color
Date: Tue, 25 Jan 2022 10:25:11 +0100
Message-Id: <164310270996.583056.16179202253940602649.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-3-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
 <20220120151625.594595-3-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jan 2022 16:16:11 +0100, Maxime Ripard wrote:
> The current code, when parsing the EDID Deep Color depths, that the
> YUV422 cannot be used, referring to the HDMI 1.3 Specification.
> 
> This specification, in its section 6.2.4, indeed states:
> 
>   For each supported Deep Color mode, RGB 4:4:4 shall be supported and
>   optionally YCBCR 4:4:4 may be supported.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
