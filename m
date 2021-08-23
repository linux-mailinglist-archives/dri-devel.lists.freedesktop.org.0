Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2284C3F57FD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 08:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C438689E7C;
	Tue, 24 Aug 2021 06:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C9F899EA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 22:43:40 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EDBCE5C01A3;
 Mon, 23 Aug 2021 18:43:37 -0400 (EDT)
Received: from imap7 ([10.202.2.57])
 by compute4.internal (MEProxy); Mon, 23 Aug 2021 18:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 amanoeldawod.com; h=mime-version:message-id:date:from:to:cc
 :subject:content-type; s=fm2; bh=2+JX0yqShj0kXinR3kiiDe7rbvQVmPt
 7/PwpmGm3xgI=; b=JjygX/X8xpSBidfsEFTgbUGVw2Ob0HnuqPGAEh5sgLaKaXq
 Ryg2V3JiwmM4LiJKlwtSOT69VgFlXJUdoTVPkB8Uvjt0RbOTejNMLRcAqQgZM1X7
 2k7d++xMVG12MID2iDDkolo5RmTH4nB0h6mroNZDBXBtTYtbUh/W5/QosRFupTic
 FbDIaNKleU18luvYFHDMGq19FiRVYmFqEVmKkYemkRDmR9/lfAG2a+Ml8utPf+zH
 hryMHKTUbdS5/cRLNH8HXUVmfXlRLZxQSbiy6u5jVpvKIMsz6D+gqRmWpY2aqnoV
 Je3lbcfozUzxHul5lcYcmrAoKlGtE1k3D7kGSsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=2+JX0yqShj0kXinR3kiiDe7rbvQVm
 Pt7/PwpmGm3xgI=; b=pHqT/9atBNxycauHkhXXejLLOtP//nR8OnkjHmHrQK7nO
 IZuBjoRzJhsrNwqXd8ijB8dqMVRoimSVdqEbc30wdQTcoLHN6TiFYXq2wH8e5QRq
 Wzp1gqwL8gnwJjz5ax/VjgNwK/kUc25ENSL3m52qk6nCRkyVRu30EHI51vMD01Kl
 XjGh8Dhv/LeRDE6y9IkELrbNqhniuuefkSRrZ1tK0fcNe/Fj1xKgu7gO4fTZ9R10
 ommktgmzOFuz3pUCdHOQe0KEgxaN8DByZBQ/5r79g1Z37TY6Fw0aTt++CpoK5Wg/
 KZaZ9ZnwGtwFy20cdaymBrdkO8aVCjGCNAMtGj77A==
X-ME-Sender: <xms:mCQkYXAizDYt3Os9KK6Fbm-4iuongXioVMEGiHLmaCtZQvkPYWvNCA>
 <xme:mCQkYdhlEeNZl2Sd042tlkA20KDdtnzcvwMh6srMJIGykhQB8UzWWJxHX-aSmRk4m
 jxzwg3MIf_kIvvDHIs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtiedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkfffhvffutgesthdtredtreerjeenucfhrhhomhepfdetmhgrnhho
 vghlucffrgifohgufdcuoehkvghrnhgvlhesrghmrghnohgvlhgurgifohgurdgtohhmqe
 enucggtffrrghtthgvrhhnpeffieelhfegffdukeeivdegudejudejleefffelkeevgfdu
 heeijeekfeevgeehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehkvghrnhgvlhesrghmrghnohgvlhgurgifohgurdgtohhm
X-ME-Proxy: <xmx:mSQkYSnFaHrmJRk2vfp5aZBNoYG0j9ii4LgtCauK9GTY5XnDQp3lHw>
 <xmx:mSQkYZw0btQ-2rvZ_jNQUzMI7YnXw7n0vrarQ-w5otXvOc1xRtBbbA>
 <xmx:mSQkYcRSRHrPh8J-frl_WTn0q1i1LNdbaKNvUjQk0sMnaqiKaPphIg>
 <xmx:mSQkYbN7e2MguZ8LRO5Zz_NK9E3nuHRbQfCdNkfsaPgyKZUVsFkbkw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EE9183601A4; Mon, 23 Aug 2021 18:43:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1118-g75eff666e5-fm-20210816.002-g75eff666
Mime-Version: 1.0
Message-Id: <5186020a-192f-4e04-adc2-25a34305fea6@www.fastmail.com>
Date: Mon, 23 Aug 2021 18:42:42 -0400
From: "Amanoel Dawod" <kernel@amanoeldawod.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?Q?drm:_simpledrm:_fbdev_emulation_error_with_CONFIG=5FDRM=5FSIMP?=
 =?UTF-8?Q?LEDRM_enabled?=
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 24 Aug 2021 06:13:30 +0000
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

Hi,

This started since 5.14-rc1. The following error appears in dmesg
(as of 5.14-rc7) when I build the kernel with CONFIG_DRM_SIMPLEDRM=m

[    3.252275] [drm] Initialized simpledrm 1.0.0 20200625 for simple-framebuffer.0 on minor 0
[    3.252298] simple-framebuffer simple-framebuffer.0: [drm] *ERROR* fbdev: Failed to setup generic emulation (ret=-22)

thanks,
Amanoel
