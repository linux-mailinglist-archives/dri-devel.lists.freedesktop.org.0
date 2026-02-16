Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHcuFkcWk2nD1QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 14:06:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD506143A76
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 14:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D28D10E3A2;
	Mon, 16 Feb 2026 13:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="nyBlN9vA";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="t3MArVV7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 597 seconds by postgrey-1.36 at gabe;
 Mon, 16 Feb 2026 13:06:10 UTC
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA3C10E39A;
 Mon, 16 Feb 2026 13:06:10 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 1B6B4140018A;
 Mon, 16 Feb 2026 07:56:13 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-04.internal (MEProxy); Mon, 16 Feb 2026 07:56:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1771246573;
 x=1771332973; bh=L2fHeGjfwbnAs6/88xqNLW9dwkh7TGnJ+IYK71dxH0w=; b=
 nyBlN9vAr0Ri60k+o09Pvq4MAnyxPhV3AHD8hy37mGT63tlwgqKhK1xaI84d4D/7
 aG0kukRCnAeZdavxrIBSz3CU5E/aj7Fkj47iY/B4ABaXg6Npkxb5KYu/CXIDzSRb
 l4E5j4B4PZrGOI9n7phO6zzC+kscb/IFQGgijL1HCJvxDfWymCA2lPPxX3tVXoRv
 9RiU0MUxP+J6R4ThqHiKPIaw0NVjf6AGzIUtaE+RAprKrYvTkUOPvqbV3J8mNQhL
 nl+bmC/y73vaX2IiNnj2yzgAep1zlETEJke4Alz+GIKJXeCmCEeKPg8JVV9nBZtt
 cvNJVDmxWAlk2i3fn77JJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1771246573; x=
 1771332973; bh=L2fHeGjfwbnAs6/88xqNLW9dwkh7TGnJ+IYK71dxH0w=; b=t
 3MArVV7kFx5oAjXVa2MSw5rMH7wgMzw3WS5FCAdy0NFG9ZAtrrEmrcdJ3eOfMlB8
 oiff89v1QAhbt8L5BF9KBP8qdQTDesDpOLnlM0GzM/rB52BUozEyx8+9xlr2atPK
 6/kRUA3HtMz+rJgsyJcKh9q6nbnlnup2dRB4txEGZoUOVgLvJ8rOcTc7o9l4xpS4
 6pWq2c/uXEFMs2HUMJuaOGegOBtkcw/TUeL0nduL5lsMc6jRaF3s7tU8p84ojAg6
 CLeusLNGjKSEV35ZCqrcVxmEJg2H0LE5mW8NDMWE5jGhUsvYZ6XldDVr/t7F9WhD
 ka0LdzuFxvoQmGK0WovkA==
X-ME-Sender: <xms:7BOTabZl4olFUi6r6hzO-0mOMupxPLXqD7HZ8HzYV6t6Qqsp4jnFTw>
 <xme:7BOTaVOmHZAHArn2jHP36q8oLYYmgBPsedIgkeXJnNb-GJWwyIbngATKLyKSlXGC3
 8KPoSgMRooFbalcfY5TsgsSsFK_GoHnl1l13f7Zop8JIPxuOXfFL9k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvudeileefucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
 uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
 hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
 gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudejpdhmohguvgepshhmthhpohhu
 thdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghirh
 hlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghfnhgrrdhhihhrshgthhhf
 vghlugesihhnthgvlhdrtghomhdprhgtphhtthhopehfrhgrnhgtohhishdrughughgrsh
 htsehinhhtvghlrdgtohhmpdhrtghpthhtohephhhimhgrlhdrphhrrghsrggurdhghhhi
 mhhirhgrhiesihhnthgvlhdrtghomhdprhgtphhtthhopehmrghtthhhvgifrdgruhhlug
 esihhnthgvlhdrtghomhdprhgtphhtthhopehmrghtthhhvgifrdgsrhhoshhtsehinhht
 vghlrdgtohhmpdhrtghpthhtoheprhhoughrihhgohdrvhhivhhisehinhhtvghlrdgtoh
 hmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:7BOTaTw3tFbHK7bqLIPUhHEEMejvd7XTxUlEJck5vQXDrACtnBOmcA>
 <xmx:7BOTaV9FUeof93fgHQBFKf8ruVWECSHHY1DBtpm_Znkkqt3goFq26w>
 <xmx:7BOTaT-WQSt_oxq8xFVKRxwrWx0yvbTpwa8k4z8fTwi4ypNRcWvodA>
 <xmx:7BOTaYcuJhnJM-q6VBPduOsTc1efyEHfVGY9kOrJ1zHBYc4qsxUPkA>
 <xmx:7ROTaSX-YGAC2IOl10B2jTYiguYoCAW5gymZ1_HHYRDeOvaYksoEtY1n>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 8287C700065; Mon, 16 Feb 2026 07:56:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A8fugOliEBiw
Date: Mon, 16 Feb 2026 13:55:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>, 
 "Simona Vetter" <simona@ffwll.ch>, "Matthew Brost" <matthew.brost@intel.com>, 
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>,
 "Lucas De Marchi" <demarchi@kernel.org>,
 "Matthew Auld" <matthew.auld@intel.com>,
 "Dafna Hirschfeld" <dafna.hirschfeld@intel.com>,
 "Francois Dugast" <francois.dugast@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Message-Id: <45dee0c0-f0c4-444e-a478-1e1c7212fe03@app.fastmail.com>
In-Reply-To: <dca855eb1de92fce96f6be418c8646705564cf69.camel@linux.intel.com>
References: <20260216121709.2345721-1-arnd@kernel.org>
 <dca855eb1de92fce96f6be418c8646705564cf69.camel@linux.intel.com>
Subject: Re: [PATCH] drm/pagemap: pass pagemap_addr by reference
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.30 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,app.fastmail.com:mid,messagingengine.com:dkim,arndb.de:email,arndb.de:dkim];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+]
X-Rspamd-Queue-Id: BD506143A76
X-Rspamd-Action: no action

On Mon, Feb 16, 2026, at 13:32, Thomas Hellstr=C3=B6m wrote:
> On Mon, 2026-02-16 at 13:16 +0100, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>=20
>> Passing a structure by reference into a function is sometimes
>> problematic,
>
> Do you mean passing by *value* is problematic?

Yes

>> =C2=A0static void xe_pagemap_destroy_work(struct work_struct *work)
>> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
>> index 2baf0861f78f..74a32d0dacd8 100644
>> --- a/include/drm/drm_pagemap.h
>> +++ b/include/drm/drm_pagemap.h
>> @@ -95,7 +95,7 @@ struct drm_pagemap_ops {
>> =C2=A0	 */
>> =C2=A0	void (*device_unmap)(struct drm_pagemap *dpagemap,
>> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev,
>> -			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap_addr addr);
>> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap_addr *addr);
>
> Makes sense, although this should preferrably be
>
> const struct drm_pagemap_addr *addr;
>

Good point, I'll send a v2 with both changes after some more testing.

     Arnd
