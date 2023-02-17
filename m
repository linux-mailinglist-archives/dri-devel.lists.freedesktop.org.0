Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E131B69B064
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 17:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D452110E1D9;
	Fri, 17 Feb 2023 16:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0693810E1D9;
 Fri, 17 Feb 2023 16:15:35 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 576075C004F;
 Fri, 17 Feb 2023 11:15:33 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Fri, 17 Feb 2023 11:15:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1676650533; x=1676736933; bh=tleUz3zIP8
 QkFyed9TDh0JqE4e6vPHKfXik/Tpa7P2A=; b=Iwad271NcLWSK/mSbAeplkyueM
 AIRurVdo4aMWp4R3HsReutyJ+uhd/1LoUeBfcNSPfpmuDjOcNlrMdXrhduE//szT
 LtGXHiTQw41sazpZc4vW3YJ/q3isQ9S480h/vEMoYlXHEbJ46S4rnnRDalHYhAAh
 pTFa51xkyt2FeAVVTT/BfMBCdRMKVppXjqnWcLbO7yvThZXLd7WnJEz/VBtgotUr
 tBIWwy6fr0G/eluf5oHK5vRAJf+ibwl25xf7veLOYLVjnMm1m980ZfSFLwXoR5Ad
 cK6HQXlw61Q4XeLPgkAhKQTomPEvSqWBMuf8wgwI1F3NqKIQmEGTPyTy2Hcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1676650533; x=1676736933; bh=tleUz3zIP8QkFyed9TDh0JqE4e6v
 PHKfXik/Tpa7P2A=; b=hbIbBfXPNzBtvk5bc5ylnttncvE8EukoQnTmWDr5tLSB
 VE49C6JVVQ16V3ExFn+CcSEmN8WO3idKgvF0txCBn/U6E+PASSfgyWZ2BoaIGipe
 Yadf3L5T8Yo/HW0HCFXW8vBoF6ZIY7bHJzrLbn+DFaV83TFujI6vp9FTPTUiXptK
 xG2rxdquimRGSy8nN3O14nClHJOi3NSnjWYdBKUU2+JZWEgzVoLNr6q6dLuAQ/I4
 Epdbb1JWRhgr2TU+IQKhdoCH/mOFLsQW9Rl9rRXA7K3/84/e3r6rRcXcoXS3o6Of
 EQ+3MFNm7XP1Xyqvk/cMqhXOyOfGjvaU9g5O32EYWw==
X-ME-Sender: <xms:JKjvY6AeRLlxXnsCf5olcXo3RSIGuiUVBHxCKYJOpeMVaEq76Eqdgw>
 <xme:JKjvY0jm-ljLeEgwqGJS4meZ3TEImW97EMsptV7EjfyTrK5btVAa3N9Gwnq4bIUjN
 nfc17kVTuMzLn61I-k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeiledgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:JajvY9kUef-VXLovENBb-OOpa5c_oBLnME7LlOKinAUYjyZtTys9LQ>
 <xmx:JajvY4xCODqVaE8TCjjhXbXpT6F00XXQCuT1X_9KlIMGicujGDxKgg>
 <xmx:JajvY_ThEVMjhAOhVP16bmpWW9XsYOzeNXbd055bBxD2XGk0uXb2BA>
 <xmx:JajvY3bV18cpr4ofTn-aJ-BHgR1be5bONKNHMLiyM7pIKrbH2SNCjA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E246DB60086; Fri, 17 Feb 2023 11:15:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Mime-Version: 1.0
Message-Id: <a4c599b3-8dd5-4799-8565-cf07c7e07227@app.fastmail.com>
In-Reply-To: <c830e0c7-a483-aaf6-cd46-e26c8c414b6b@intel.com>
References: <20230217124724.1324126-1-arnd@kernel.org>
 <c830e0c7-a483-aaf6-cd46-e26c8c414b6b@intel.com>
Date: Fri, 17 Feb 2023 17:15:14 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>,
 "Dave Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Matthew Brost" <matthew.brost@intel.com>,
 "John Harrison" <John.C.Harrison@Intel.com>,
 "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: avoid FIELD_PREP warning
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023, at 16:38, Andrzej Hajda wrote:
> On 17.02.2023 13:46, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> With gcc-7 and earlier, there are lots of warnings like
>> 
>> In file included from <command-line>:0:0:
>> In function '__guc_context_policy_add_priority.isra.66',
>>      inlined from '__guc_context_set_prio.isra.67' at drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3292:3,
>>      inlined from 'guc_context_set_prio' at drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3320:2:
>> include/linux/compiler_types.h:399:38: error: call to '__compiletime_assert_631' declared with attribute error: FIELD_PREP: mask is not constant
>>    _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>>                                        ^
>> ...
>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2422:3: note: in expansion of macro 'FIELD_PREP'
>>     FIELD_PREP(GUC_KLV_0_KEY, GUC_CONTEXT_POLICIES_KLV_ID_##id) | \
>>     ^~~~~~~~~~
>> 
>> Make sure that GUC_KLV_0_KEY is an unsigned value to avoid the warning.
>
> Does it mean __builtin_constant_p in gcc7 returns 0 on signed constants?
> I guess there should be more similar errors.

No, it's not as simple as that, I'm not really sure what the underlying
problem is with the compiler, and this is the only file that triggered
this particular warning.

There are other cases where old compilers had the reverse problem,
where they sometimes report a variable to be __builtin_constant_p()==true
if there is a branch that assigns a constant to it.

I think here it happens because GUC_KLV_0_KEY and GUC_KLV_n_VALUE are
negative.

   Arnd
