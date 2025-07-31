Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9EAB17363
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 16:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E24410E25A;
	Thu, 31 Jul 2025 14:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="a4Asjwi9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3D910E25A
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 14:48:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 839A243274;
 Thu, 31 Jul 2025 14:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1753973319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ksu1dXDAFNE+JPsv0VJpt/t7DBDLZyiIgOqyU0p+STc=;
 b=a4Asjwi9qfSNmebKcYAdghS7HPFDsKyE252AdYlTTMwkJT47RbtsSKSRAnU2f6lFD1gnTP
 hquf+hyY8kWVB0FBceOCNwACwceKUKAQ7c77OxXFtClkVuQyECVP7czycScY9Tu7djNxZe
 pNXmqBhaWotEeu0peOGPLTnAmW7ZDV6xVhmzbSgoSacyaEZ+KmwZRDdfrbp42DqICeftRa
 hkmBwOBXMc9BFpfvGxeCsvhU6tiPK8u5ZUVlFx49y3VlWJFh5N8HCM/dLQetzOHTtWNzc8
 LX1OWpPJWtT5MHXRLPO23LQ4+YoODL2FS5PGjxdA4psVAxbJ86YPWYp/qIm57g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: dri-devel@lists.freedesktop.org, Robert Mader <robert.mader@collabora.com>
In-Reply-To: <20250718121442.490634-1-robert.mader@collabora.com>
References: <20250718121442.490634-1-robert.mader@collabora.com>
Subject: Re: [PATCH v2] drm/vkms: Add writeback encoders as possible clones
Message-Id: <175397331935.298545.10295397782822807396.b4-ty@bootlin.com>
Date: Thu, 31 Jul 2025 16:48:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfgjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjedtkefhheefuefhieelheffleeukeekleeiffeigfejgeduvdektdeffefhveeunecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhosggvrhhtrdhmrgguvghrsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-GND-Sasl: louis.chauvet@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 18 Jul 2025 14:14:42 +0200, Robert Mader wrote:
> Since commit 41b4b11da0215 ("drm: Add valid clones check") setting
> the `possible_clones` values is a hard requirement for cloning.
> `vkms` supports cloning for writeback connectors in order to capture
> CRTC content, however that broke with said commit.
> 
> Writeback connectors are created on a per-CRTC basis, thus mark
> every non-writeback connector that is compatible with a given CRTC
> as possible clone - and vice-versa.
> 
> [...]

Applied, thanks!

[1/1] drm/vkms: Add writeback encoders as possible clones
      commit: 934452cbb16e1e3609ba52acb48c503b9aaf3154

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

