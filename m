Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6A986AF1F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 13:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42DD10E473;
	Wed, 28 Feb 2024 12:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="hTJOvhKL";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="LwGTjde4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh4-smtp.messagingengine.com
 (fhigh4-smtp.messagingengine.com [103.168.172.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140FC10E40C;
 Wed, 28 Feb 2024 12:27:06 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id EC53811400B2;
 Wed, 28 Feb 2024 07:27:05 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Wed, 28 Feb 2024 07:27:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1709123225; x=1709209625; bh=NvXreyBpDp
 tssmYJWYfiUdp7AMo/Vkt6KKjFpA50xek=; b=hTJOvhKLUIRULLUpBy0nU4WxD2
 LNOikhUWSV4dZ4K3XVFdwx5vFRUFtZhPKQMmSHGL3Em9BZefNI3opWoomZPO3cuK
 dDti8ZykaispBUIihQCaJJISsMBcoIyFqI3PqldO2FQq2mlg26qawbG8jV3233Gi
 WWth2SR68Ao6/iSuYfCkP9+Q+HGAp8dI/T2c6uF8GjM0G0uXqT9oPVrnDo0Bxx5e
 Ymy3TBza9zjNR2Kn21fkUgQBGXph0bqUtouo2CYPAPT2kcWVbz1Ls8JktvoSaHcs
 8SZJcFjB4rWjBUfzzyyMg+Iz4isKniR4+H8ldpQRWVdxWAyzAD5NApKmZhow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1709123225; x=1709209625; bh=NvXreyBpDptssmYJWYfiUdp7AMo/
 Vkt6KKjFpA50xek=; b=LwGTjde4yuDMXoy0vchb84skXNMkqtmVTCm4LsaKwi+W
 Ra0vJ3LHJNQ396P+w5maIIV6OxDj+d69cLuJ3mF8oKsyaZOLe5hE76qBFJWwf8bk
 ADN88i7s8Wlj9jV6NdQ2hLd3c/T14apsWfCYrjvE0oIfKDiq6R0xoaSUtXaPOkxD
 gSrHgruCyj/CyM1SwPogTKUj8cKX2A9K32AcpRBIA3qpjf5SrphJLJslgxmRjO2y
 3nCmfbuObMgjR7HYByPZbVeMG07ys4UMs5YooF+vMUtHTm2ayj+FtyhyTqMTsDcK
 3lPn8TRYIKeymhPmVHjkePj3DoKJwHDbEvQg8BL8uw==
X-ME-Sender: <xms:mSbfZZQuIwMkl6tnbBxHGj0eIpl4i43TVltp0-45yGCPjW_K5pbG0Q>
 <xme:mSbfZSzpOYJkm3U5uhSkWAYY5WOZ1e3bATNd_yggZmjGNcjqPYbH17cTcQwmfydYo
 NXtg8T1IMYH8nMO_Uk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgeejgdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:mSbfZe0nFo7etxjN5tiz5X-sskqp_-8Y4zmh7qmJAzhw64qDOQwmgw>
 <xmx:mSbfZRBarQB6eEKB82mrB9aI0M7u43KL-jzPUbafWLhHf8GK66OSUA>
 <xmx:mSbfZSh9vSvBFLtoVDuIMgMwveJBnRhOH9jffZ-khp40oO_VTWFZIA>
 <xmx:mSbfZS6u1fwf3B3fgkKLB_bwvXKxE3IHgr0IV0X-4_8et7Kh09ohSw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2B6F2B6008D; Wed, 28 Feb 2024 07:27:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-182-gaab6630818-fm-20240222.002-gaab66308
MIME-Version: 1.0
Message-Id: <0c6127da-53d8-4c37-8337-e64e3e91bbaf@app.fastmail.com>
In-Reply-To: <kq3cpbz4ctqvfhtlh7f7wxd7ub3izdjovhv2jqkjasre7u6y2k@exaw42ber3f6>
References: <20240226124736.1272949-1-arnd@kernel.org>
 <20240226124736.1272949-3-arnd@kernel.org>
 <kq3cpbz4ctqvfhtlh7f7wxd7ub3izdjovhv2jqkjasre7u6y2k@exaw42ber3f6>
Date: Wed, 28 Feb 2024 13:26:29 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Oded Gabbay" <ogabbay@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>, 
 "Daniel Vetter" <daniel@ffwll.ch>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Matt Roper" <matthew.d.roper@intel.com>,
 "Matthew Brost" <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] [v2] drm/xe/xe2: fix 64-bit division in
 pte_update_size
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 26, 2024, at 17:40, Lucas De Marchi wrote:
> On Mon, Feb 26, 2024 at 01:46:38PM +0100, Arnd Bergmann wrote:
>>
>>Fixes: 237412e45390 ("drm/xe: Enable 32bits build")
>>Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>---
>>v2: use correct Fixes tag
>
> but what about the other comment? How are we supposed to use
> DIV_ROUND_UP() but then in some places (which?) have to open code it?

The problem is not DIV_ROUND_UP() but the division but the 64-bit
division itself. There is a DIV_ROUND_UP_ULL() macro that would
address the build failure as well, but doing the shift is much
more efficient here since it can be done in a couple of instructions.

> What compiler does this fail on?

I saw it with clang-19 on 32-bit arm, but I assume it happens
on others as well.

>> drivers/gpu/drm/xe/xe_migrate.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>index a66fdf2d2991..ee1bb938c493 100644
>>--- a/drivers/gpu/drm/xe/xe_migrate.c
>>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>>@@ -462,7 +462,7 @@ static u32 pte_update_size(struct xe_migrate *m,
>> 	} else {
>> 		/* Clip L0 to available size */
>> 		u64 size = min(*L0, (u64)avail_pts * SZ_2M);
>>-		u64 num_4k_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>>+		u32 num_4k_pages = (size + XE_PAGE_SIZE - 1) >> XE_PTE_SHIFT;
>
> also the commit message doesn't seem to match the patch as you are only
> changing one instance.

Not sure what you mean. As I wrote in the changelog, the
second instance is fixed by using a 32-bit division here,
which does not cause link failures.

      Arnd
