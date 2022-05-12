Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A020524793
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 10:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083A110FB3F;
	Thu, 12 May 2022 08:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA30010FB3F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 08:05:22 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E07D13200312;
 Thu, 12 May 2022 04:05:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 12 May 2022 04:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1652342720; x=
 1652429120; bh=oe/zwelFl/MPCEmgAvq8U298nURwwSFqy+4gdAu/6+8=; b=D
 vD0QdhNK2axzkwBNDn6ijVnJ8AYfE3ovCU53vgdPvq5YJVUk//EyShiveywPDWDl
 MCvz1quSBMXn4ZwqsdLB64eXIh9JxXaTsOAucJVcFZsRWBjwu4wP7o6cXqbunRk/
 hn/qbUYj1wQZoxkLGQb5Ir0AD2TQT6Fi/ddfFrPhoNLXXygjM9R7qwBIlYXWeYxJ
 ONT2DNlMsV0ynNSgr8RqbtOcix80edmUetpVolARMd0TyfOQpbCPSu93v8fDkiwq
 FJptnu5HIejqnGKhdDqw4MMYCKksjw3ELZUXaWs/ploHj+c9owAQ6kbY9vFCwdh/
 4qFPHM7ctqUBesw7RFxgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1652342720; x=1652429120; bh=oe/zwelFl/MPC
 EmgAvq8U298nURwwSFqy+4gdAu/6+8=; b=QB4iCJF/1d0kDlufj45nIZE9tZra2
 RHRZWN3uqQo88rdpBS1AsNE/3pdZFw3sez5pzYU/SOu5JqGZvpN85MzkPBnGkNAc
 vLIiA9gWzXyJc5lF/GAwvzNyFZuCdTKVqMP15Z1lQO27ZfXwFOVr+mT4jZhsvgBq
 0ZauO+HvfP2JIHsHMNKvJ1jfjLmY3AeonzDJLTwpGPQVN1xHj3RPH5PKksQI2fCF
 s36TlHr67lC7B5aMUJ+EtxkvkbkWXKZyio81XGiNBkfHrUenRlRJubo/Hq12lBn+
 Ezd6jB7xdlimr60NaFZF8Ma9q7CTPSOP0DKOhX6S2R0pM+nvzvQjPWZiQ==
X-ME-Sender: <xms:wL98YnkOPFs04hO_uVoWU6WWvVFJ7-wq8wtJmLcd_Rnc1jju8Tsxqg>
 <xme:wL98Yq37FFv-BPYhub0VzITgli-T1uzTVntArzQsQGWaYA3uhKz8WzmoGbbsgz7GR
 qenxObV_Tdm2klLq04>
X-ME-Received: <xmr:wL98Ytru6KKDZPxfouRjbpURfbMPQBkBnhUtvTy8W0pZXZreB4g8Y41WxoRSJ82pTrHoRPMWWdgO_vunpaTQECxa8iThch_kmPKhtAY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeeigdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wL98Yvn6oCUnF94Nnox47lLNGtnTsBpFNIBn9FQ_9DS9cvDr7oXlJw>
 <xmx:wL98Yl1W1i7fa-N8aRhFfL5WSU4JgjYRB8RZVJNCxB7i0Yu67OR_xw>
 <xmx:wL98YuvvfEcMR3PAa7nrT47eJSlAUdIBWcpMtHVg4TuQbhwtEsKXUQ>
 <xmx:wL98Yus5oyMpPX-qQUO6eHqdegtr47T4oE9kgvEWEvo62CddWx7vXw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 04:05:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: (subset) [PATCH] MAINTAINERS: add Melissa to V3D maintainers
Date: Thu, 12 May 2022 10:05:17 +0200
Message-Id: <165234271412.626324.12156131765989430269.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220429193317.ol3u4e5jpt5jucox@mail.igalia.com>
References: <20220429193317.ol3u4e5jpt5jucox@mail.igalia.com>
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
Cc: jmcasanova@igalia.com, itoral@igalia.com, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, jasuarez@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 29 Apr 2022 18:33:30 -0100, Melissa Wen wrote:
> I've been contributing to v3d through improvements, reviews, testing,
> debugging, etc. So, I'm adding myself as a co-maintainer of the V3D
> driver.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
