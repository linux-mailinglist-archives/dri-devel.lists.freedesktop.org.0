Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C64356E53BB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 23:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7890410E60B;
	Mon, 17 Apr 2023 21:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1D010E608;
 Mon, 17 Apr 2023 21:15:00 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 1DF8A3200913;
 Mon, 17 Apr 2023 17:14:57 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Mon, 17 Apr 2023 17:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1681766096; x=1681852496; bh=mC
 5DuaozRZOtAfkgxPWm4eLWSyE/qIa2ZY/soYhKUHU=; b=l+GQ8d078hCM1xjfO/
 gUbbAG4xtPuBG6RprgWz1nukoce59e9tsiv02GCC90zlWdVpUnq/KcTQTAhcw2H/
 omRwKI7vA1wqMPsmlVU20t4AQzf+drS5gJi2Jqzgj3Zys/XvCz+bnPlgCEobchNE
 /qAddAhDRflIQsg2sbSD+XBchNnsLajLkoBbOdJAfB3YQ4FvzlsOUzDzEhxZpr75
 NRI0gbkGtZJVXJOAn6x2Rm6SL5Cjlua3zmbVuvumDHDJms9BJDGDQUN7fWlYiTfm
 BkbuPF5bkYbqZkR+usRJK4dCjdlX/grLQi7Xi6XFLG8bWXZhVl+B7CohWqHCEC3i
 BPBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1681766096; x=1681852496; bh=mC5DuaozRZOtA
 fkgxPWm4eLWSyE/qIa2ZY/soYhKUHU=; b=iX870AtNY8yMO5uSFmk2eyLjvSphX
 O98KD4jOhavoZtkuBESGQGjnVIsetJ2M7wnBysWX2R/sAu887WTHrXrJihAkTE7w
 E8ojF5Vz4f/r0nocwXWeuAxzzUr4/xNGb+cw80qbJO1tFr0V9dzKIzLALbMlLK8b
 dbNH15rPbOrde94+af1x2bTZ28rJOPPM9rwAp6u3yrjOkwrMhmNughxzDIaGNCWw
 z6uruCXO3s9QFAJBFMBhNExWY5v+3sQ95mbIdbkYBGd5aq//kqdiKQXKe5o3RAKi
 eWnyBKwO6kFiquox6WIyr30yRuE0dKIcfyC9QN0YgzvgrI4a1othrWkxw==
X-ME-Sender: <xms:0LY9ZPPwUGeHFceJLxve8skHlv420bTnpb55962VFUUN8fFGKgrJdw>
 <xme:0LY9ZJ8F69cBQHiUziVY6qQCV22tNk2EsuAsrklVWludm7SHlyTY3KrhG574lI2hc
 rxwT-NvKywBbhdd0hs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeliedgudehkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
 keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:0LY9ZOSWEh6URb5WYiwyjEwIE01z5_F6O9fj3Tr9kptf6K-cQLcmzw>
 <xmx:0LY9ZDuDjpgimztpRmoawAD0y2EYy126dxSnFmyosJ5RosMEwY0SmA>
 <xmx:0LY9ZHemPF9TgHKzX7VNfrSxXC1NL17MdPVJyK-9ID4Y6nmpMIUVVg>
 <xmx:0LY9ZCBe-jmlGGha8tZp-eNdhpZTAzecgkGoJuP1ywrJHUTYby9EMg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 296A1B60086; Mon, 17 Apr 2023 17:14:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-372-g43825cb665-fm-20230411.003-g43825cb6
Mime-Version: 1.0
Message-Id: <0d966637-6074-4d54-a299-41d063e05310@app.fastmail.com>
In-Reply-To: <de29b7ac-910c-8d4b-50ff-47ba4134d16a@amd.com>
References: <20230417210602.2614198-1-arnd@kernel.org>
 <de29b7ac-910c-8d4b-50ff-47ba4134d16a@amd.com>
Date: Mon, 17 Apr 2023 23:14:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Hamza Mahfooz" <hamza.mahfooz@amd.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Harry Wentland" <harry.wentland@amd.com>, 
 "Leo Li" <sunpeng.li@amd.com>, "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, 
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Dave Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm/amd/display: mark dccg314_init() static
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
Cc: Alex Hung <alex.hung@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Taimur Hassan <Syed.Hassan@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Michael Strauss <michael.strauss@amd.com>, dri-devel@lists.freedesktop.org,
 Jasdeep Dhillon <jdhillon@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023, at 23:12, Hamza Mahfooz wrote:
> On 4/17/23 17:05, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The newly introduced global function is not declared in a header or
>> called from another file, causing a harmless warning with sparse
>> or W=1 builds:
>> 
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_dccg.c:277:6: error: no previous prototype for 'dccg314_init' [-Werror=missing-prototypes]
>> 
>> Mark it static instead.
>> 
>> Fixes: 6f6869dcf415 ("drm/amd/display: prep work for root clock optimization enablement for DCN314")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> This has already been fixed as of commit 669f4ac40947 ("drm/amd/display:
> set variable dccg314_init storage-class-specifier to static") in
> amd-staging-drm-next.

Ok, thanks. I waited for a rebase on today's linux-next before posting
mine to make sure it's not already fixed, it must have just missed the
cut-off.

      Arnd
