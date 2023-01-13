Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CA7669EF3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 18:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A645A10E9B3;
	Fri, 13 Jan 2023 17:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61B910EA65
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 17:00:29 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 086825C0178;
 Fri, 13 Jan 2023 12:00:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 13 Jan 2023 12:00:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673629227; x=
 1673715627; bh=vGrOBRThs0IjPAOvNG05ifp9pUpMVW2XpKJSwiRdLmE=; b=V
 V7cafQMItog5R0bsq5xGD4F0PiTAnya1v3WH52dKJZPKg01M/OX7OxmKx+1sOEj2
 /L5Yv9O2Nr9ktMLAStRuhwCPGnCYSUXUNJv4nLTGapOtaLGuR+cLzD8EVOMC+RXW
 oDpYuYXZDIZspnrn88CC3pVKqeibEqaDlXyzgdix95bhx15evr1hV67b40OsQ5RC
 HQjjsYTR6ikOUV5N6H7wMwV9cEdDNlnRDko0tISw04Fwa8yt9YVHtN3kj95UTKq3
 sJnSHcHHderlGA4SZzCfq2WxAP7pMYxRVWb9g4WJOnbXCoWr9lAuF9q07+PRP+h0
 gW00zyAc3CNs3n4EHA64g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673629227; x=
 1673715627; bh=vGrOBRThs0IjPAOvNG05ifp9pUpMVW2XpKJSwiRdLmE=; b=K
 yiHSBShCxlCXFWwPQgj3BW0rdYoss40cQgwQ9sSteaOBuNGj7Y+6WspZyBz6+uwb
 mrHFXMO16FZzNpGUA+PImflRuUvFvYtopk1xMy7iUHzAYQL2w/UKzaknQ9HPb+8j
 Y+mAOL4xeS5uvsreJ5UQvfqiVFvplu+wmbzyBgs3a/SbQ7r7WhzubCGdXMJ9dGNG
 qI34W0fbngpmU135EjSwJXpg2cU++srUhWNajpmaTbLH5Ko2bVdKXhSP+dJvi7Qz
 4U81QJV4x6DlXfX4Z/NcDdPdh4hp8/w4QKToYoRtC6K3y4QeCg94JnPiQZ6aqt4K
 f3jbc3IHYBCtUSJtmOwRQ==
X-ME-Sender: <xms:Ko7BYwp03T9HlklvaSf_NpzcnbVq_r6teCQmazrSkv7mLbmHinJlsA>
 <xme:Ko7BY2qAuRRDeEmG2OR0GmUXkHbwxdPpt4jQlxjxtuvpLrVMY-qrBS6EPcQiwbf2g
 65dcZ_QvQ75pD57QLs>
X-ME-Received: <xmr:Ko7BY1NBc8GkqlFDUlNFg59tWDLHeGBxkmRvZYNWTrvB3Rm_hoUJrtIuqV_-fgzn2UAatHhelkCNBTNPbTymM7QzqQRF3-qE6yF7dMBDFX7SHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleekgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelieffgfdvteejjeeujeeiheeuvdetieegheethffhieefgeelkedukeet
 geeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ko7BY37OKmKBnW-5JVtc155MyTB3Gb41GI3bskMBYbCXPxP8iKwRCg>
 <xmx:Ko7BY_7jKh5XFuX0suiGjLlrl67goJs8K99v1FSiMzbGCmZfH5niQg>
 <xmx:Ko7BY3jjJ1QRMGlAwIZLGmkd-KwlXZN-G23b2yFBtaq71D90fHErNA>
 <xmx:K47BY3xfIR_A-mlvlQfX1_POJULrTKA9WMJYw3QHWX2JzF13ws4tHA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jan 2023 12:00:25 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
In-Reply-To: <20230113154637.1704116-1-maxime@cerno.tech>
References: <20230113154637.1704116-1-maxime@cerno.tech>
Subject: Re: (subset) [PATCH] drm/vc4: bo: Fix unused variable warning
Message-Id: <167362919127.1721383.12570206079155179123.b4-ty@cerno.tech>
Date: Fri, 13 Jan 2023 17:59:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.2
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 13 Jan 2023 16:46:37 +0100, Maxime Ripard wrote:
> Commit 07a2975c65f2 ("drm/vc4: bo: Fix drmm_mutex_init memory hog")
> removed the only user of the ret variable, but didn't remove the
> variable itself leading to a unused variable warning.
> 
> Remove that variable.
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
