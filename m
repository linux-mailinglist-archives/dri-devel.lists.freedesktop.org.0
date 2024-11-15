Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5555E9CF194
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 17:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA8410E2D9;
	Fri, 15 Nov 2024 16:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="N1V/uaTI";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="TuUuyXh8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F8A10E162
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 16:36:09 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.stl.internal (Postfix) with ESMTP id D8016114011A;
 Fri, 15 Nov 2024 11:36:08 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-10.internal (MEProxy); Fri, 15 Nov 2024 11:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1731688568;
 x=1731774968; bh=Di/rS4M465PPBMn1lW76KE0FVONCxRZbbC1er82K2KA=; b=
 N1V/uaTIIinuZJbAPUA7QBWjnK7q33fI/3NpfhABhaLBbKLxLZXFDgjYTwrG5nQG
 yS9I9liMDeYpPoQpRjclQJ0L6vvsghTpfBlj5BA7OcuUV4N9n2ftvQMpD1UqmznK
 owtbqhxAYFwR2MMuh0JFX8xZtkiFxyl5teDRE9FWPG5ipDWUwNmcmZrkRENb60yN
 RTKKX34nMx/zLGa0d8YlFllkRWdidq5a2EEP2XPbjDSVSwjrIQQUvaacVML4mGup
 X/odWQpcAZ5HQYxuQKTi2TdptOPZZTxE0/X/XnEhY4bw+yPsyPZ8wnwdiea4iMLY
 diZQwZK3sFxc5qvY20y97Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731688568; x=
 1731774968; bh=Di/rS4M465PPBMn1lW76KE0FVONCxRZbbC1er82K2KA=; b=T
 uUuyXh8KkZvC28+YbhrXUZInLT048FHI70IYoFsRN32sR0wCsxud/ytRpWPPfJTY
 MY18sBTsFssnyv+6PKR3R4QipY48i40jUGr6snIn/n2kbWArDMWrwsdXIdqy6AiQ
 hidMJDq7yg004jj5gGk/BcMcQPptc7WxXQ37Zvd/qTnxgy6q3zmHT3iGHeOm93H1
 W81Lv8XDePenJs+wOHoXEEHo07xYGL7+NEDzilaisYcoapMAXAimIbXxDqNwMt5l
 AmCbhvIouU2oE9+yPbk4xz60+G3M5bql1InqTmZncIPiS2bMvtzOrZN6yY3q0AJq
 b0hyCGnmV0d9ZqRTpB4Pw==
X-ME-Sender: <xms:eHg3Z4hizG_dOCVH1Oye3-gkJjK4d0x1aRqj-o8Q3_aKmNHnCT5tRw>
 <xme:eHg3ZxBA4kc_OfD_Spftv4SFW1xDHkTcbDSiW5ezHcfPRURR-jIEO9hnrfjEJrjcQ
 BumKsgjUAgm0Bi69v0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvdeggdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
 tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
 hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
 ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
 gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
 vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedugedp
 mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephhgrrhhrhidrfigvnhhtlhgrnhguse
 grmhgurdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphht
 thhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprg
 hirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehjrghnihdrnhhikhhulhgr
 sehinhhtvghlrdgtohhmpdhrtghpthhtohepjhhonhgrthhhrghnrdgtrghvihhtthesih
 hnthgvlhdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghp
 thhtohepmhgrshgrhhhirhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhrih
 hprghrugeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:eHg3ZwH_A8dWUgIz_T_3FfKBcEgM2XE3rxZos1gm7alCFnU0mTVnmQ>
 <xmx:eHg3Z5TlnYsSVRPc1oI3ScwsWuQKmRYS412295ODwvMUUyazCLBerg>
 <xmx:eHg3Z1x8MYdNTLCM895nyWYDt6sTcfCiGhHmHABRv1xL-UPpT9o-dQ>
 <xmx:eHg3Z343g_NDTIrTu_TY8VGMQTmTGvPxPCcGYkqhWbjGrKp2pYIhjQ>
 <xmx:eHg3Z1jH9_WjP7Ql5uhKr9s9BXtQbH0An8N87Gdm2WZVSIyQFYUuaS1I>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 2D0B72220071; Fri, 15 Nov 2024 11:36:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 15 Nov 2024 17:35:46 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Dave Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Jocelyn Falempe" <jfalempe@redhat.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Jani Nikula" <jani.nikula@intel.com>,
 "Harry Wentland" <harry.wentland@amd.com>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Jonathan Cavitt" <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-Id: <96269b2e-2a0e-4c7e-9d47-a52e64d1ea0a@app.fastmail.com>
In-Reply-To: <a600708e-5240-4c31-ad29-4a6e791a65e7@suse.de>
References: <20241115152722.3537630-1-arnd@kernel.org>
 <a600708e-5240-4c31-ad29-4a6e791a65e7@suse.de>
Subject: Re: [PATCH] drm: rework FB_CORE dependency
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Fri, Nov 15, 2024, at 16:54, Thomas Zimmermann wrote:
> Am 15.11.24 um 16:27 schrieb Arnd Bergmann:
>>   
>> @@ -220,7 +221,6 @@ config DRM_CLIENT_LIB
>>   	tristate
>>   	depends on DRM
>>   	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
>> -	select FB_CORE if DRM_FBDEV_EMULATION
>
> This should remain. More fbdev code will move into drm_fbdev_client.c 
> and that will require FB_CORE.

Got it.

>>   	help
>>   	  This option enables the DRM client library and selects all
>>   	  modules and components according to the enabled clients.
>> @@ -372,6 +372,7 @@ config DRM_GEM_SHMEM_HELPER
>>   	tristate
>>   	depends on DRM && MMU
>>   	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
>> +	select FB_CORE if DRM_FBDEV_EMULATION
>
> This select is also needed by DRM_GEM_DMA_HELPER and DRM_GEM_TTM_HELPER.
>
> Please sort these select statements alphabetically.

Sent a v2 now.

     Arnd
