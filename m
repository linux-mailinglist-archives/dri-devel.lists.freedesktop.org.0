Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6008A84275
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 14:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5A410E972;
	Thu, 10 Apr 2025 12:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="SXwyFFF3";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="n640nl1q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 412 seconds by postgrey-1.36 at gabe;
 Thu, 10 Apr 2025 12:06:08 UTC
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B8D10E972
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 12:06:08 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 3B11E11401CC;
 Thu, 10 Apr 2025 07:59:15 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-05.internal (MEProxy); Thu, 10 Apr 2025 07:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1744286355;
 x=1744372755; bh=VTBj3WFm372ZmTtp6+ksoCLEYSgXDDKfayMXT9EC2nE=; b=
 SXwyFFF3kDrb/rOXpRNddWGKG4N5V9FuGgiv+shN21MsubXiGS6pr5UcYSVevtc6
 dFTpQUFKc0ruucYJNcCCWiMX3Qt8RMJEfIiUeo5SQxhkVG9WSCXiPCsI9iP9BPvg
 Z0EnsaL0EafZ7hpunQzE7Zul81y3FjDfCMr9C8wvlY/1SGvaAn/1j/1H5IU9I7qS
 OE/0UNMnspP4dA6AXnUmMX9TmsDDo6d+rmdV+2cyiaTftXoktOLbIzs4pyLIhVGd
 uRmumaw7b1cMjAF6KcH8gy2ENDjMmRCcqJilUkNV+xzK5f3NfSQGoPUEH1kmyyWH
 dQ5gahK9RsFHTwtM0n4SYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744286355; x=
 1744372755; bh=VTBj3WFm372ZmTtp6+ksoCLEYSgXDDKfayMXT9EC2nE=; b=n
 640nl1qVTi6Tx2XNGVxqLy9TaA1YPRJJHeXT7MHQ4NFuJQ4GhVk1SOLQGkv4mJIc
 71ywCZVH0Xm5Uwpkllu/zLeX8MzS3wxK+R2yXNq/rY/CticDv6zlGzKTUPHBoOLn
 ZOhQHCivql43HeVdu43vgKwiDicVYlfPQvc1UEbI9GbXL7PHdfhnsd4BFSV7eYrE
 idoUf/fMI9kTopxPF9ksGsByrt1CHg+G2OovE6ADSOR2VQj+cEXoDMJOcrG3cylk
 vrfr956z+EZoSeRmzSXHkcPJltXLLM193bKtfVAN3JxzMxhpysHpimJX5+mQiKIv
 XUwuLP3PdK09OXpCdzJkA==
X-ME-Sender: <xms:krL3Z3CPVOipcaxQsDkxzJ2J8PZ4NNENRESk6LvOXEiTrnjG8YcIPQ>
 <xme:krL3Z9jOFYh_VS4T38xIoOydDPdvAnr_kxOQndglS-7tDqcO0mProLQaj7t3SNlrh
 h5nrhAmWz_NX8nUi1U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekkeehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
 tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
 gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
 fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
 udeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhgvgigrnhguvghrrdguvg
 hutghhvghrsegrmhgurdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgt
 hhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprg
 hlvghsshhiohdrsggvlhhlvgesihhmghhtvggtrdgtohhmpdhrtghpthhtohepfhhrrghn
 khdrsghinhhnshesihhmghhtvggtrdgtohhmpdhrtghpthhtohepmhgrthhtrdgtohhsth
 gvrhesihhmghhtvggtrdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurges
 ihhnthgvlhdrtghomhdprhgtphhtthhopehjrghnihdrnhhikhhulhgrsehinhhtvghlrd
 gtohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:krL3Zyl6n38L2lNkACaRosX9HczN0oayyw8hy4aCiMYnvv2SWExh9A>
 <xmx:krL3Z5xFVw8_ebuW62yTZTTSLrWWoGhM7QogMWlHerjeovxC7ro2yw>
 <xmx:krL3Z8SPxqB8wZhAGb_1VTE0S-rwFRQoTwf6WXEVBfItZ5lJocEzjQ>
 <xmx:krL3Z8bqS9u9erxGWyi1Qd9QIqF_CifIVaidfEsZqWUIrlNd5mQ2TA>
 <xmx:k7L3Z4Tb2UUwI89pogVw-mj0kluYUms6Z3H48mu1Ve8vpJcSBJ9QmQ8_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 465762220073; Thu, 10 Apr 2025 07:59:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T696e5320db2814d5
Date: Thu, 10 Apr 2025 13:58:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Matt Coster" <Matt.Coster@imgtec.com>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Frank Binns" <Frank.Binns@imgtec.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>, 
 "Simona Vetter" <simona@ffwll.ch>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Jani Nikula" <jani.nikula@intel.com>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 "Alessio Belle" <Alessio.Belle@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-Id: <997d5df5-fa8e-4b3b-83a9-f86131705b13@app.fastmail.com>
In-Reply-To: <7ae4be5c-b115-405e-aa57-caeaa206775b@imgtec.com>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
 <7ae4be5c-b115-405e-aa57-caeaa206775b@imgtec.com>
Subject: Re: [PATCH 01/10] drm/imagination: avoid unused-const-variable warning
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

On Thu, Apr 10, 2025, at 13:22, Matt Coster wrote:
> On 09/04/2025 13:22, Arnd Bergmann wrote:
>> 
>> Rather than adding more #ifdef blocks, address this by changing the
>> existing #ifdef into equivalent IS_ENABLED() checks so gcc can see
>> where the symbol is used but still eliminate it from the object file.
>
> Possibly a silly question, but wouldn't adding __maybe_unused to
> stid_fmts be a simpler change here? Or is there a strong preference to
> avoid #ifdef CONFIG_* and let the compiler figure out what to elide?

All three ways work, and it's mainly a matter a preference. A lot
of developers don't like __maybe_unused, and there are enough developers
that really dislike #ifdef blocks in .c files, though a lot of
others don't really care.

I sent the version that I like best because I find that easier to
read and it gives better compile-time coverage in all configurations,
but I mainly care about having no warnings, so pick whatever approach
works for you. 

> The contents of the pvr_rogue_fwif*.h headers is essentially normative
> outside of company-internal documentation. With types, there's generally
> no warnings emitted when they're not used, but I believe this is the
> only instance of actual data being stored in these headers.
>
> I suppose technically it should even be moved to an associated *.c file,
> but that would (I assume) further confound the compiler's ability to
> decide when it's needed in the final binary (or I guess the linker if
> it's in a separate object).

Moving it next to the user of that definition is geneally best
here, if the variable is only ever used in one place. If that
happens to be inside of an existing #ifdef, it just works, and
if someone later replaces the #ifdef with an IS_ENABLED() check
it keeps working.

>> -#if defined(CONFIG_DEBUG_FS)
>>  /* Forward declaration from <linux/dcache.h>. */
>>  struct dentry;
>
> With the #ifdef removed, there's no reason to keep this forward
> declaration down here. Can you move it up to the top of the file with
> the others?

I don't think it changes much, I usually keep these close to
the function prototype that use them as you have here.

>> @@ -73,6 +72,5 @@ void pvr_fw_trace_mask_update(struct pvr_device *pvr_dev, u32 old_mask,
>>  			      u32 new_mask);
>>  
>>  void pvr_fw_trace_debugfs_init(struct pvr_device *pvr_dev, struct dentry *dir);
>> -#endif /* defined(CONFIG_DEBUG_FS) */
>
> Having said that, surely it makes sense to keep at least
> *_debugfs_init() gated behind CONFIG_DEBUG_FS?

With the IS_ENABLED() check, it's an empty function, so the cost
of the function is very small. Leaving the #ifdef in here would
probably again cause warnings about unused functions or variable.

Ideally the entire file would just be left out of the build
here, with the function decarations in pvr_fw_trace.h
replaced with empty stubs for !CONFIG_DEBUG_FS. I don't
know if that's possible, or if you still need to initialize
the fw trace if there is no debugfs interface for it, so
I did not try this myself.

Can you try to come up with a fix for the warning that you
like best and treat my email as "Reported-by: Arnd Bergmann
<arnd@arndb.de>"?

      Arnd
