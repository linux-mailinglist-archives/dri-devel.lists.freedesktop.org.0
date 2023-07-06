Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DBA749AC7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 13:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E4310E4EC;
	Thu,  6 Jul 2023 11:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3215E10E4EC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 11:36:28 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 6973E5C00CF;
 Thu,  6 Jul 2023 07:36:26 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Thu, 06 Jul 2023 07:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1688643386; x=1688729786; bh=C6
 FVmoTeWIWnJ398pRC/XE6TyNj7Ymf62dAsmaGtmb0=; b=BGdluiom3ggcRnDdxp
 oee0FvzfxpIvCY638tQFktcGhwOwhI/XrlJsyp2RiY/jp66a0kp0i4kzB50Nqzj+
 m/GNGAiPe1F+41dKNx0j9TXocBWXc2ufXklfxDDTcKLAr8QK90fpbFQYooSOvxNY
 squbxC2U9VEEYoab/tsz66VHwP4qpRaAybj3RyetmVcABnDy35/H4PhNI537HMMl
 Alp905FYz+MUPF+uTBorshIxPxn5GXogQUBG7RsNU+9iKDeCBgTAeOPPsIdsHR+A
 iqE5oUzoC6eNOhKT+ggsZELNRm9QR+bdKDO4Z1RA640NTcaNlR2u6h+PPS/STnPy
 6fvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1688643386; x=1688729786; bh=C6FVmoTeWIWnJ
 398pRC/XE6TyNj7Ymf62dAsmaGtmb0=; b=HgJL/+GrbgeA+YFm5wY12KsV+XMlf
 I27AR7t2G64hgj9h3LHJ9JHL/p0fuYvHGoBUFQmnExZEw15FQu3X5vrkOiZITQfT
 aAR4LFGeGQWIFunHDDZSbhA/B79sOx1cKVUBvih/BhOyCK0kKIW1E+lKx03BWFK+
 9hHhJrL2sNGDfTWAuQIO8zbQkPeKCZmCNsmUCEz9HHfVM9gOkUMVo8hf+hS0kFxx
 Kxo7Nt2rTl+DdncvRl3sbXo18vOFay3Y9mwGu8/xBannx8AdWSuUTc6aikJwg8oY
 UtMXxykZEzyYo1vLbYLvGIemQHhNvC9ILdHpvLo72fsANwPNPbyi9birw==
X-ME-Sender: <xms:OaemZOVlx0154p7bocZZlUeBHpdW82c0XY_NdXki0MG0Ou92E5XCjg>
 <xme:OaemZKk8hBBmwpHJ3NcYpX4zrZ9G4zOa33jY7F_gmcq-MWcaY1DeaKYxVIJVkEIns
 rNPrzavq1Io0MH0aFk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:OaemZCYC-kcNVGyv9tbkCRAZgzbXAnZNjIdYX4lmWN2MRrQEyK-GoQ>
 <xmx:OaemZFV6THc4JH7aD5rBuPCk8TpjQpy6zynjY4ckYHEcPWFLG86o2A>
 <xmx:OaemZIk4GDpiUC1IRM-thG41fdAQ8w_42nIr51vo8Fq_AXoedROxQg>
 <xmx:OqemZBf_EX86cWlRl9fbPwVaJYQVWvnoMpDF7tXummLoJFIh-O-IMg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8E56CB60089; Thu,  6 Jul 2023 07:36:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <97ae7c3d-3eeb-4bd5-bac3-64a1605d48e2@app.fastmail.com>
In-Reply-To: <20230706104852.27451-3-tzimmermann@suse.de>
References: <20230706104852.27451-1-tzimmermann@suse.de>
 <20230706104852.27451-3-tzimmermann@suse.de>
Date: Thu, 06 Jul 2023 13:36:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Sui Jingfeng" <suijingfeng@loongson.cn>
Subject: Re: [PATCH v2 2/4] fbdev/sm712fb: Do not include <linux/screen_info.h>
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 Teddy Wang <teddy.wang@siliconmotion.com>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongarch@lists.linux.dev,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 6, 2023, at 12:42, Thomas Zimmermann wrote:
> Sm712fb's dependency on <linux/screen_info.h> is artificial in that
> it only uses struct screen_info for its internals. Replace the use of
> struct screen_info with a custom data structure and remove the include
> of <linux/screen_info.h>.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>
> Cc: Helge Deller <deller@gmx.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
