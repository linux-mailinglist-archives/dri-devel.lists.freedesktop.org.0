Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ+KFEX2p2mtmwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:07:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B445D1FD32E
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E758110E8C1;
	Wed,  4 Mar 2026 09:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="pw5EK2gm";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="WyMQzHsg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b2-smtp.messagingengine.com
 (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0018D10E8C1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 09:07:11 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id D20F57A01C0;
 Wed,  4 Mar 2026 04:07:10 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-04.internal (MEProxy); Wed, 04 Mar 2026 04:07:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1772615230;
 x=1772701630; bh=4HZcCt0xrSe1MKL8+grG1PUCwoEjyp3CA+Kghv05k8c=; b=
 pw5EK2gmcl0wxe3psF1Uk2zZMsKGjf+xbzgFsqEZl6GIiV6d1yFqt7e92qv5U8/E
 1FOA6p/yAw6EdcQXy3oOYaVAKORchKtjRYgTTIuNqWy3g0HySAtwzZ/UMzbu8d01
 Fs3pMt4sAIZs4oiKozguf+ocj1UevszvWCxGC4ELCdexx1Zz5J6qUvr4h+qz3Dcw
 dD2KRnz0uoM+TvAXKlR6foR5tnXyhEpEaGnKhyvwEyTHCrbnraMJPr1xP4xqmQ/R
 taRUOVQ7Xse7A19yd12AMKP7Bm3zinjfafqw1mEWn6ASZ2SA2QwpMQHudArx14lf
 dor61XcH5Qy5s2K468lSzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772615230; x=
 1772701630; bh=4HZcCt0xrSe1MKL8+grG1PUCwoEjyp3CA+Kghv05k8c=; b=W
 yMQzHsgDDVVH7Dnl1Am/fQBw8IY5d9qf4RsWQxgUJGVcZl3dGrudQdmCqJw4tQYo
 uV3yE0DaYu5FOugrBEUVbdIBd0iYocke6GJxZcEsQ6LrdLlYGl+AZtzvuRn924hP
 fcF+4RIFxZTQ1RE/BsELOuK4jIMLaeEJYp2oKPOUKW/OZW9qhGV/yUexFz+4/13Y
 6UCbIzYAOpuCBMWFGoi9vxfcZOPyd2c+K8wDkEkF43yp6vWoQAcU+EhugL/fHjgt
 j/VBp4KW2RulY2/HW428uyoFHVzSzt7RL8F03+elF3IH2DiAYYzC8QzU8GkvJiBu
 BQhuNTaHbToQ4fcIYzBWw==
X-ME-Sender: <xms:PfanaR7wx63YQJzlg9DDEjyBKnsR2YC9BLVG0XwJSuceShqdijUjLg>
 <xme:PfanaZsEE9s8JoDnXVh_sC-pmCKj61VdBvh5BlLl_2LDeGZtPLvIQBWdLijxZcZuT
 emxU-lXviMBoAiTYYPP2pya9DR1P6e2ZtBAchxKUyzPDyn1gaOS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieeftdekucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
 uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
 hrnhepveeikeduheeftdegfffffeettedtkeffhfetgeeuvdeivdeujeeuueevveeuueei
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdp
 nhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsih
 hmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdr
 tghomhdprhgtphhtthhopehmrghtthhhvgifrdgsrhhoshhtsehinhhtvghlrdgtohhmpd
 hrtghpthhtohepmhhitghhrghlrdifrghjuggvtgiikhhosehinhhtvghlrdgtohhmpdhr
 tghpthhtohepphhiohhtrhdrphhiohhrkhhofihskhhisehinhhtvghlrdgtohhmpdhrtg
 hpthhtoheprhhoughrihhgohdrvhhivhhisehinhhtvghlrdgtohhmpdhrtghpthhtohep
 rghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlsh
 htrhhomheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegurhhiqdguvghv
 vghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-ME-Proxy: <xmx:Pfanaccwqq2iHIcIk6OOPXduEiVMc-DPAWXccumwXIJ0HlEayma2bA>
 <xmx:PfanafzLa5Vx_kizVBtorF1oYAFhWZRTPTAnbv-rsXmOFrhFHyS4QQ>
 <xmx:PfanaczYBFNFAcyYjFGV2DQ2hUBA8ddP9WL9rzg683_v4P2dYOXIpA>
 <xmx:PfanaYZo5qJcT9RCzRYo-8QEvArFk8DucIm2VUHvJ5D3IIijmHoBsQ>
 <xmx:PvanaenkR3ffUG7tRWShftKOxWcyxmZVPgJnss7qkpHRIx1O4arHwU1d>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 7A68070006A; Wed,  4 Mar 2026 04:07:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AWJR11MObH7o
Date: Wed, 04 Mar 2026 10:06:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Matthew Brost" <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "Dave Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-Id: <77d07ecc-69d1-4661-b4f8-56a189a3b56b@app.fastmail.com>
In-Reply-To: <399b1f09-b134-4ec1-bada-5ec053691bf7@intel.com>
References: <20260304083741.725121-1-arnd@kernel.org>
 <399b1f09-b134-4ec1-bada-5ec053691bf7@intel.com>
Subject: Re: [PATCH] drm/xe/tests: avoid build warning on 32-bit targets
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
X-Rspamd-Queue-Id: B445D1FD32E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.30 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_RECIPIENTS(0.00)[m:michal.wajdeczko@intel.com,m:arnd@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:piotr.piorkowski@intel.com,m:intel-xe@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,kernel.org,linux.intel.com,gmail.com,ffwll.ch];
	FORGED_SENDER(0.00)[arnd@arndb.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:dkim,arndb.de:email,messagingengine.com:dkim,gitlab.freedesktop.org:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,app.fastmail.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026, at 09:51, Michal Wajdeczko wrote:
> On 3/4/2026 9:37 AM, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> ---
>> If there is a better way to fix this, please treat this as a bug report and
>> just add a Reported-by tag in the commit.
>
> this was already fixed and pushed [1]
>
> [1] 
> https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/4f18a79b3585a28c9f73f859fe83f12d0eccc736
>

Right, that looks better than my version. Apparently it just
missed the current linux-next that I was testing on.

     Arnd
