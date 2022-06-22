Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F34C554399
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 09:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6031A113BE4;
	Wed, 22 Jun 2022 07:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A1E113BE4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 07:37:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B090A5C0085;
 Wed, 22 Jun 2022 03:37:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 22 Jun 2022 03:37:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1655883435; x=
 1655969835; bh=DjPbEtlaojvueI+OxOc4rnXCnJdk9FjW5sV0Sm2bRuI=; b=h
 z4aD+1gq5FSAQCBqgkOSr2/zV5D1OBCNzxJvYg2TPP/xkLwFJ/zrf00xMkTbp7H3
 j44ieXA4zHWzVokd951d5rROoa/Ja8p3L58VnrFncGCf2EAkcbfFfCWyOeKYrAF+
 WZ8RzDhamLqLENmY+XFRHkdO74fKoSvYokN2KO5wRbFw5LDNlhcSGT3F/hl/eDIZ
 jQJJ3ZzbtrVBZxTMggL20O/aYyR4wUG0LONmp25CFFEBiUxe7wlA6Did2RXFnHEq
 HM1PHoNRFFdfwreagoybNYAw4mz6NeeSFK6yxYc2gyHXSQEWdwBEyByrvi8Ar1LV
 LMGMAxBqTk2NzJQq3GAtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655883435; x=
 1655969835; bh=DjPbEtlaojvueI+OxOc4rnXCnJdk9FjW5sV0Sm2bRuI=; b=k
 QdcKKVPyz8ou8e5mNwhn8A+951SIzBtvgtPUn8oWlb9hb9VfKzBYjJvq1vc1sDpB
 47F2+XSf2qAL5e7a5/T1cIj74vuNC20CLhYpq3WD0ulUC0cZBFfk+xlaHQCmpu6J
 RpaOHVZVxRbrqBw9oRsYJi/aeVLqbU8ZPq01hFTPoKOyayitvGFuEEgvghcrmHbM
 knuh9T0aRtsQhgSxrGKajHrJ7mEi1uTVZnOE+r3GRZ755/tRPJ1sKoBGT12rscnN
 /VxVZNqqTPFaW/nkhfCzFnQ+6szbOt8oq8xnapZDqGoJgDNw7YWiZmbvZwmQyAZ5
 lA5BXM6nEKX/fsL0c7hXQ==
X-ME-Sender: <xms:q8ayYs61KqqyndKpSOWojOQaNSPJMKg72FPjWS2vcQrxP2ijg0_Mxg>
 <xme:q8ayYt6YZFkS2pFO-zpZPsvtUKfVHDk1CGntzAU02hH3NXRTkA_Nat09EB8Nl0j0f
 LBV3VPEbcy-aMt9tS4>
X-ME-Received: <xmr:q8ayYrfiNNnSz_UVIyCPP3aQzIkK8sFet433pMEL8ZcdmtXltTnMKmGwkXskgiOHPdQEQoHPnkn6xCE_NRTOm68GmDsTH40gz58RKOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgedguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhggtgfgse
 htkeertdertdejnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgv
 segtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepueeigefghfffffeifeehud
 eiuedvteegueefffevgfetvdffheehkeffvedufeeinecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:q8ayYhJezPaytnnaSsws_MIuCJ6b0UubwSnUUdusVKsgAqjbJeLn0g>
 <xmx:q8ayYgL-Y0Ljbf509Ib7KxY-Aev5GnOuqT0dyZotr3_SgtzugyBtrA>
 <xmx:q8ayYiyPh4G44EfgAICrwIOACm19GA5SKq8nvP1M6gzEa60TVkMqGg>
 <xmx:q8ayYo8qCdcWBX7ODJZxh3O5kmG4IQTdcuY_iTUFnXB9XvWnyHUWVA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 03:37:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, airlied@linux.ie, mripard@kernel.org,
 linux-kernel@vger.kernel.org, daniel@ffwll.ch, farooqui_saud@hotmail.com,
 emma@anholt.net
Subject: Re: (subset) [PATCH] drm/vc4: hdmi: Fixed possible integer overflow
Date: Wed, 22 Jun 2022 09:37:12 +0200
Message-Id: <165588343010.17134.11173109971081825342.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <PA4P189MB1421E63C0FF3EBF234A80AB38BA79@PA4P189MB1421.EURP189.PROD.OUTLOOK.COM>
References: <PA4P189MB1421E63C0FF3EBF234A80AB38BA79@PA4P189MB1421.EURP189.PROD.OUTLOOK.COM>
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
Cc: Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 9 Jun 2022 23:50:31 +0500, Saud Farooqui wrote:
> Multiplying ints and saving it in unsigned long long
> could lead to integer overflow before being type casted to
> unsigned long long.
> 
> Addresses-Coverity:  1505113: Unintentional integer overflow.
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
