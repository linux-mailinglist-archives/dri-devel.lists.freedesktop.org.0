Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HQFC/kYl2nKugIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 15:06:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABCB15F51F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 15:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A97F10E6A0;
	Thu, 19 Feb 2026 14:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=engestrom.ch header.i=@engestrom.ch header.b="c84fA4zA";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="BC81rGd1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 585 seconds by postgrey-1.36 at gabe;
 Thu, 19 Feb 2026 14:06:44 UTC
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752B210E6A0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 14:06:44 +0000 (UTC)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
 by mailfhigh.stl.internal (Postfix) with ESMTP id C48B27A01BF;
 Thu, 19 Feb 2026 08:56:57 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-07.internal (MEProxy); Thu, 19 Feb 2026 08:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=engestrom.ch; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm3; t=1771509417; x=1771595817; bh=4SWKQ6mmsW6erDFNl7KWu
 f6pQ4EoQD0fsR2WoH3GzqA=; b=c84fA4zAgehHdSuJa5lkzK+oEtEJ1gJRSAsSg
 cLXtEHsYKQYh2k5sa4LKfUM1Eyxz8UbhgE7gWbn06HnJWyerNfwBQureyoZc1y4k
 MYwCuM/KTMY5Sq2MiqO9R1kR9vw7D+1GNHmnfUdPIrESZR0emf2haKCyPU6E8Nn6
 yZleDYdjR6yn70BpuGop1BimyDWQzLUIPFxGsnzldMhr0fhJzJ3qhtwuAQc+EZWm
 ZtiCS032sZduY/lR+pCnASxUtvVlDF8wxAjMdJQwlqLetkdTTF6oHcWIprOK12qf
 uBXCek4WgyIZcUsu40FCtHSXyIfuJbiTzgqfuJ0qEQ/5LxyPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1771509417; x=1771595817; bh=4SWKQ6mmsW6erDFNl7KWuf6pQ4EoQD0fsR2
 WoH3GzqA=; b=BC81rGd1J4hc3aEw4Jc2U4iQOHsb1uHnXximg6UTBHXX13ih/ip
 IEZTGGdZsElsmx+aiDjAcLoCIVEeNDWTP0an01EhrL+rEfSL3+medQDQ8lJl41Q+
 Gw1ctkuaQKJ4cmjnBzIkhvi16Uo+JOq3rraujY3SRRQDfTqUddmbOX/udTemKF3W
 yTltDqjbZpi705o5nLCGaUdwbeJZZxZ7SYYaugreN2HR2if1K74gAkKL98VE4Xdg
 Pzm+fS4N72UsDvPd52mdvu5/dfoScQ1PvW3MQg0wYA5BbQeNI/G9Zfzopt0mdGcg
 4bU0I7/6ZnG/S9PFx+8s8qDLUY5kfhhRr5w==
X-ME-Sender: <xms:qRaXaVK2y9CdAtuwbKIw_dTlMANn6Q4JpwbXtExTRR2S4Q-fUxbEqQ>
 <xme:qRaXaXjLjG60rzp6zI3LtYnIqNVSdrbiHKZOFDTZx6nhu0ti77ukMR_-zDRaLDtmf
 VcwVTvrv7okps8HRvC4vpAMsZ4DIVUUa3EeFd2R-zo1MmElHl00q2c>
X-ME-Received: <xmr:qRaXaZ-TULCNkJZu3WWuIKLt7u0qUZaR0xVEt3_RPqt3vwub5xmBibHy_5fL1uSRYuYU-x6sntXLtMHnFqOTG3dMPJY_t8OHf2ZA_Yfg2EE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdehjeduucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepgfhrihgtucfgnhhg
 vghsthhrohhmuceovghrihgtsegvnhhgvghsthhrohhmrdgthheqnecuggftrfgrthhtvg
 hrnhepkeefvdefvefhffdtiefgffffhfehkeefjefhvefhgedufeffhfetleffvedvheeh
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepvghrihgtsegvnhhgvghsthhrohhm
 rdgthhdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtth
 hopehhvghlvghnrdhfohhrnhgriihivghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
 vhhighhnvghshhdrrhgrmhgrnhestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhope
 hmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhr
 tghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiih
 hmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgr
 ihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtth
 hopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopegurhhiqdguvghvvghlsehl
 ihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-ME-Proxy: <xmx:qRaXaUNU8dRDEybJGNIrbUj959mUXPsnUNxRq42BKCrjXKe2tdd9Sw>
 <xmx:qRaXaVAdI92k28X7ECqm7GA9KW5obdIiHMgr-uzk3kNKUL1toFdsdw>
 <xmx:qRaXaQOnsydxoU1ewzmdGQ23d_kkK-xY47GBZeDPiN66co7eKHZ-ig>
 <xmx:qRaXaUexPFqWnnbhJ4KMUaczVMR20eN8m-VgehaYKxlAhWECGycGgQ>
 <xmx:qRaXaS8v-E7N3hcVlY79-5lO_lOGr3ZJkBSOkX_oTw2sJM56fCsncXlG>
Feedback-ID: ieaa94438:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Feb 2026 08:56:55 -0500 (EST)
From: Eric Engestrom <eric@engestrom.ch>
To: Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Eric Engestrom <eric@engestrom.ch>
Subject: [PATCH] drm/doc: recommend forking drm/kernel rather than uploading a
 distinct copy
Date: Thu, 19 Feb 2026 14:56:45 +0100
Message-ID: <20260219135645.261192-1-eric@engestrom.ch>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[engestrom.ch,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[engestrom.ch:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,collabora.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lwn.net,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:helen.fornazier@gmail.com,m:vignesh.raman@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:eric@engestrom.ch,m:helenfornazier@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[eric@engestrom.ch,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eric@engestrom.ch,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[engestrom.ch:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[engestrom.ch:mid,engestrom.ch:dkim,engestrom.ch:email,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 8ABCB15F51F
X-Rspamd-Action: no action

Signed-off-by: Eric Engestrom <eric@engestrom.ch>
---
 Documentation/gpu/automated_testing.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git ./Documentation/gpu/automated_testing.rst ./Documentation/gpu/automated_testing.rst
index 62aa3ede02a5df3f590b..8a7328aef10ef39ee329 100644
--- ./Documentation/gpu/automated_testing.rst
+++ ./Documentation/gpu/automated_testing.rst
@@ -99,7 +99,8 @@ How to enable automated testing on your tree
 ============================================
 
 1. Create a Linux tree in https://gitlab.freedesktop.org/ if you don't have one
-yet
+yet, by forking https://gitlab.freedesktop.org/drm/kernel (this allows GitLab
+to internally track that these are the same git objects).
 
 2. In your kernel repo's configuration (eg.
 https://gitlab.freedesktop.org/janedoe/linux/-/settings/ci_cd), change the
-- 
Cheers,
  Eric

