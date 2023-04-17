Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AC16E5493
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 00:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5874710E62D;
	Mon, 17 Apr 2023 22:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F2D10E62D;
 Mon, 17 Apr 2023 22:10:25 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 29DBA32001AB;
 Mon, 17 Apr 2023 18:10:23 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Mon, 17 Apr 2023 18:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1681769422; x=1681855822; bh=eq
 Lfw997/9uHiXeORALSDo9Bcbz/MyoV3LSW0WqDJyQ=; b=kGUJCIxHwelNpg7uP7
 JJO4NwfT71UVZ/RY6DERs85Rm923NOW0jDx3fN7RdcWVo4f9toqDiqJv6k48K4JN
 Gd4HlfQLdFr2anQv0v871UJET97qJjh3AZYXzEjxQUJ+3qsLXWLgc7+qdYSyknMO
 2vx1Sd6fDjQs1lW/DZjsaEJxl52jTcejvG/v4qsnr/YdRSLMy74NJP05KjOPOVpb
 7fS7zhjlf76IR6pWKpzZdQ0qv7vtGJyGg1x66N1bIKzwsiQ73RkGn/PrUVM3FiA8
 XFjkTJEvd5gMUA9qqQiR5H77/XFnxkNNdvog7s6tPD5TG/DAicWxSpdTR30a7TJo
 7VZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1681769422; x=1681855822; bh=eqLfw997/9uHi
 XeORALSDo9Bcbz/MyoV3LSW0WqDJyQ=; b=htI8ZGNJECLgXiDn0nKCyW7dJ0u9C
 7fqZmeppCjGRqZxfP21wrpT/nhwXzXNWsnRDMFUqMa+ZS5i+KQ7A3WwwSKJuWnzx
 6pxCP3lHfBw+JfwXpRjQj/WW4P/DP3n5cfhqzzsBFdSLd++38+nERQJTRlqw0bNb
 M38knALXARqmwRwKjSedtrsBTgkt7Tlosrs3KcIOzkjWCYYgCqhQn+iE6zutTSqV
 Eup/63ejtVIZNoaym1qLfj9zDLVastgzXqrd0ziM4r5iyiuTrMzJ1dUawranKcq3
 7Adp245tCcuQ8ILAH1ukNTyOnTO0/wpt1C7IfjuS8qaHsK+sUDv0zoNug==
X-ME-Sender: <xms:zsM9ZMOQjh5U7GKLct8AVf27AOsCDsZw_DGZw5DCyytLtSn0MTHXvg>
 <xme:zsM9ZC_xfO6yHsKa7TLlaccv-A8VBghGfKLkmEn24ATcaR9bJnGxFIDYChbyI16ez
 i_dc8q5L2ubbEeWoNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeljedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:zsM9ZDRDl9zHPW9Xd6LETEfQAP30Ds3QE_JRQtqjlHB4A06FsBkD2w>
 <xmx:zsM9ZEvBmyMidQVUZt0h17rVZUWF7wkNF40A2jaOAL1dABa-HqF8yA>
 <xmx:zsM9ZEdzYpAsM2RrUjbTbZzDdPEzSxdVHVABqHhfOnZDAv8FgY2ipg>
 <xmx:zsM9ZLnIZGtvw4BmqB_p5imnnm2q9NGqMNoZDtkc2snitQ6sbtqbWA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 88203B60086; Mon, 17 Apr 2023 18:10:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-372-g43825cb665-fm-20230411.003-g43825cb6
Mime-Version: 1.0
Message-Id: <00468187-1b28-4cc6-a319-1af1acb0048f@app.fastmail.com>
In-Reply-To: <558fee93-282a-34b1-7225-3bcce63f6b1b@amd.com>
References: <20230417210602.2614198-1-arnd@kernel.org>
 <20230417210602.2614198-2-arnd@kernel.org>
 <558fee93-282a-34b1-7225-3bcce63f6b1b@amd.com>
Date: Tue, 18 Apr 2023 00:10:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Hamza Mahfooz" <hamza.mahfooz@amd.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Harry Wentland" <harry.wentland@amd.com>, 
 "Leo Li" <sunpeng.li@amd.com>, "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, 
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Dave Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] drm/amd/display: fix missing=prototypes warnings
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, dri-devel@lists.freedesktop.org,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, Alex Hung <alex.hung@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Jasdeep Dhillon <jdhillon@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Aurabindo Pillai <Aurabindo.Pillai@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Alvin Lee <Alvin.Lee2@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Jun Lei <Jun.Lei@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023, at 23:17, Hamza Mahfooz wrote:
> On 4/17/23 17:05, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> Three functions in the amdgpu display driver cause -Wmissing-prototype
>> warnings:
>> 
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1858:6: error: no previous prototype for 'is_timing_changed' [-Werror=missing-prototypes]
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:210:6: error: no previous prototype for 'is_synaptics_cascaded_panamera' [-Werror=missing-prototypes]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:294:6: error: no previous prototype for 'optc3_wait_drr_doublebuffer_pending_clear' [-Werror=missing-prototypes]
>> 
>> is_timing_changed() is actually meant to be a global symbol, but needs
>> a proper name and prototype, while the other two can just be made static.
>> 
>> Fixes: 54c7b715b5ef ("drm/amd/display: Add DSC Support for Synaptics Cascaded MST Hub")
>> Fixes: 17ce8a6907f7 ("drm/amd/display: Add dsc pre-validation in atomic check")
>> Fixes: 8f0d304d21b3 ("drm/amd/display: Do not commit pipe when updating DRR")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> It seems like, only the changes for is_timing_changed() are in this patch.

Indeed. I made this patch a few weeks ago, and it looks like the other
two were fixed in the same way that I had in the meantime, so the other
changes got silently dropped during a rebase. I've updated the changelog
text and sent a v2 now.

      Arnd
