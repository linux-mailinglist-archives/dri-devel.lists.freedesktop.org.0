Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C34859A1A10
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 07:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AFD10E03B;
	Thu, 17 Oct 2024 05:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="Z1Yc1AQu";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="V2xKV5tV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F163F10E03B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 05:11:59 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.phl.internal (Postfix) with ESMTP id 2C34513801D7;
 Thu, 17 Oct 2024 01:11:59 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-10.internal (MEProxy); Thu, 17 Oct 2024 01:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1729141919;
 x=1729228319; bh=417rKyW++kXoBCxiKYzXCjfYZVIaLYr4ooQeqr23rRc=; b=
 Z1Yc1AQua7MgpuMzhaklr7wC4Pxan3UQW1N62m1pfo28GyyCD7M56ul4vIXfzyHY
 LQyjwlwrZQQJ3rvIa0pCU53Mk9oq6Ut1xTm2al5EP4iAn4qR2KvgXybuJ0nTU685
 ot6RHtldW4mruKsfcSuk1xx5IQeexHePSZDwHOBNlwBziXE612p1wmURM8PniquC
 hKCKsNxA8FokKlkRlBXz0BwRZx91KeifubXlXHhaFkJ3B0tDE1/a1tsVoPiTZgFR
 kKg+H8R5Wh0OLTTuJ+3SDjEWWohPogP1mkl9kB24EkpOZpI+3yPmjmbLdZXRV7wF
 fo5KqOmPMzWGdzKj9jelJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1729141919; x=
 1729228319; bh=417rKyW++kXoBCxiKYzXCjfYZVIaLYr4ooQeqr23rRc=; b=V
 2xKV5tVlvGHUKy1/9w+FwaVDS63SvtUdOUxEQcXLcq8VaFKyoi4fcuNPFUpL/l4x
 uy/zOaNzF7+IAfRTg5WUxGRbuMTr+Gaad0SsoLJy9CHyBMiMlI/NOyFzCJ9fDlI9
 L6T9Fp/GVpPZBcMXYpyHfSkGCJutZn58nYWaHu4yiKmsqqu3wkYmsYG8BhUKBQ5c
 uEY2/1AKhBYSp08dXBTPDARJfZdSnyQfi1d3e6YZOyUlh9YSoTV//q4SPY+ZQq7T
 /jAmn0ioq2gsZAcRzkH0UKDU7JmR1LjkOT5WWbQ9T3TRltLFgzww2mcqL3W540hX
 L2fQ6gMv+5Gq2MB3CCsCQ==
X-ME-Sender: <xms:npwQZyGReiVKX36RogAt7hAYnYTmBmkbUizDiIJQ4jd4QrXTaBVP1g>
 <xme:npwQZzWN9cP75c71gqHhoElHbzFnQwmZAvx08DZAmLuo3eMcmBSJCC7qnt03Fv9zf
 zYoXP5sdny8b8v5_Zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehtddgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
 necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
 guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
 gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudeh
 pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtg
 hhpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgt
 phhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrghnjh
 gtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehimhhrvgdruggvrghksehinhhtvghl
 rdgtohhmpdhrtghpthhtoheprhhoughrihhgohdrvhhivhhisehinhhtvghlrdgtohhmpd
 hrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrhhiphgr
 rhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjrghnihdrnhhikhhulhgrsehlih
 hnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:npwQZ8IVpyZoZAXeJbJJOyj4QKhgwXei_wpXByBm4gK2KzoFJHTtJQ>
 <xmx:npwQZ8H7ayIiY3OlHbngCw-W6aCSRqxzwUi3aayZ1MQpEC7OPdzsMw>
 <xmx:npwQZ4VbWVxUZ0j13nWJQGlldfM14rbAUXA802PeX9QeiwpJHmHmoQ>
 <xmx:npwQZ_MRyM8E1frSJtGtCnKZN4Gc-PmgPfYgPaM-lEdKAH3THB3NyA>
 <xmx:n5wQZ5saNI0QRopPL_GtcGnKG647YsLELqL9jyx07G6gOpx2aYtaRNzh>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 3034E2220071; Thu, 17 Oct 2024 01:11:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 17 Oct 2024 05:11:37 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sean Christopherson" <seanjc@google.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Dave Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Paolo Bonzini" <pbonzini@redhat.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Imre Deak" <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-Id: <6201c467-e5f2-4aa1-967c-8d9116c5367a@app.fastmail.com>
In-Reply-To: <ZxBZx5EUhJFjTcXP@google.com>
References: <20241015152157.2955229-1-arnd@kernel.org>
 <ZxBZx5EUhJFjTcXP@google.com>
Subject: Re: [PATCH] i915: fix DRM_I915_GVT_KVMGT dependencies
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

On Thu, Oct 17, 2024, at 00:26, Sean Christopherson wrote:
> On Tue, Oct 15, 2024, Arnd Bergmann wrote:
>> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
>> index 46301c06d18a..985cb78d8256 100644
>> --- a/drivers/gpu/drm/i915/Kconfig
>> +++ b/drivers/gpu/drm/i915/Kconfig
>> @@ -118,9 +118,8 @@ config DRM_I915_USERPTR
>>  config DRM_I915_GVT_KVMGT
>>  	tristate "Enable KVM host support Intel GVT-g graphics virtualization"
>>  	depends on DRM_I915
>> -	depends on X86
>> +	depends on KVM_X86
>
> Can GVT-g even work on non-Intel CPUs?  I.e. would it make sense to take a
> dependency on KVM_INTEL?
>

Yes, I think that should work, but I'm not sure if it needs a dependency
on both KVM_INTEL and KVM_X86 in that case, to handle the link-time
dependency in all configurations.

    Arnd
