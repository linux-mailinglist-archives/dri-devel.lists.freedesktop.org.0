Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE/lJcOUgGnL/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:12:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2C4CC3B4
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AD510E2A1;
	Mon,  2 Feb 2026 12:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="K/PSO4CT";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="KKUCsFHX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABE910E2A2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 12:12:46 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 4AAAE7A0043;
 Mon,  2 Feb 2026 07:12:45 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-04.internal (MEProxy); Mon, 02 Feb 2026 07:12:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1770034365;
 x=1770120765; bh=Fw7i9nIfM6eJs8qgMKg6v2kwvooQl/40xF7sINOX4tI=; b=
 K/PSO4CT+GJTMuqx5uJhxpfY0mZi0QO13rG/GzVzVAtUevsHD3wKCIFG94TX/vcb
 zQ1m03zqEmORPAHQb7zvhuVYb85ndppfOp2tDa1dhZ9GcLEveA7JOiH44RQxFwQW
 pcowxzY3gYkArC7arrc7U3IvBDRm2tKemT3Qnl+j6cKzdXM2PYDWlU2l9ozk0a1K
 okZSeTnxX0Z0Yh6Zjwc0ucQjzgpTupX9V8/SEK3y22OdLaBom52++t80ut2C1Jk3
 W2FG7BNjttoHZWbzobEKyfUWJvw59gPMKukMrawE06aHMr4NH/IkobWUxCGdH23d
 uECfDIOX6msXVAABZx6/4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770034365; x=
 1770120765; bh=Fw7i9nIfM6eJs8qgMKg6v2kwvooQl/40xF7sINOX4tI=; b=K
 KUCsFHXFgvfXkYjGDqOitDIewxSw2lWRQgggAGx1zmXz5SssT/BLArYHx2h0T3nF
 NVOS37dqtVhvG3XUsfSjIDfIINPIlLHLLu4C9M2/iOfuL3bkAgZ6Nd4XPekiZzm5
 Kxza2O4GuPL6q3Zn2gYthPhMcp8KjkfVvPY7qvsLNauOPVLtITzZ0sq/FnhhzsM2
 P7c7Y4rWj0RNC574YxEe9csvyGi230PcKV1R7RKNW30008RL8rcGsroLOtnlSXGm
 t0SFwn6QcQFPwyf8M68YrNcOYHils8Q0q5z3gT+xVJRi0xU7qp6zBCDtWjy6m4CV
 CCVcdyr0c2/7ihJ4q/B9Q==
X-ME-Sender: <xms:vJSAaQZSVl4q46qfGcBfjGSmN-czz-tsDy-WL2EVKt5IYEMRwlqTQg>
 <xme:vJSAaWMkiWUOSwqCQZF6kBhMG_PiP2azBDRqoCuqCacrKrFGfQl8ZT-W1qYadWU5w
 2337lwYlzzobDdxDTMaq6Fh6Xdk-fYtybhJpmB8K_mFLczmigLwCl8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeejieduucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
 uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
 hrnhepveeikeduheeftdegfffffeettedtkeffhfetgeeuvdeivdeujeeuueevveeuueei
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdp
 nhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehnih
 gvjhhirghnghhlvghivddtvdduseduieefrdgtohhmpdhrtghpthhtohepthhhohhmrghs
 rdhpvghtrgiiiihonhhisehfrhgvvgdqvghlvggtthhrohhnshdrtghomhdprhgtphhtth
 hopegrsgguuhhnrdhnihhhrggrlhesghhmrghilhdrtghomhdprhgtphhtthhopegthhhi
 nhhtrghnlhhikhgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvlhhlvghrsehgmh
 igrdguvgdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorhhgpdhrtghp
 thhtoheprghnugihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugeskhgvrh
 hnvghlrdhorhhgpdhrtghpthhtohepuggrnhdrtggrrhhpvghnthgvrheslhhinhgrrhho
 rdhorhhg
X-ME-Proxy: <xmx:vJSAaUHtF1kSHpgqhojLNaGEk-k1RufeZLxS813s5Bk99vWsWmgc4Q>
 <xmx:vJSAaYioQ1SVS9VNrXUY9IiHYSmfxYxHPLBKp8lyOq60tHuC3145Vw>
 <xmx:vJSAaR9w0TNUdIWvXuU4Qhx74IxHm6lXsc8R8zJEc5OhbuAHVebp9w>
 <xmx:vJSAaQadKVjYUQcbz29cvkNtu6ALuQY6hsCzwMl64Gq0BSCQq49Ogw>
 <xmx:vZSAaeiu2Po9DpkatnPZyObY65tRIQxGi8_xb4KSiEaFmQ_H5wzgadPs>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 09383700065; Mon,  2 Feb 2026 07:12:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A-U3gBgaItWR
Date: Mon, 02 Feb 2026 13:12:03 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Arnd Bergmann" <arnd@kernel.org>, "Andy Shevchenko" <andy@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>,
 "Noralf Tronnes" <notro@tronnes.org>, "Helge Deller" <deller@gmx.de>,
 "Chintan Patel" <chintanlike@gmail.com>
Cc: "Abdun Nihaal" <abdun.nihaal@gmail.com>,
 "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Jianglei Nie" <niejianglei2021@163.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <3384db41-0ddb-4c00-9af1-f194ec5dccc4@app.fastmail.com>
In-Reply-To: <6580aa60-5f9d-49c7-8482-83bed12dfb0c@suse.de>
References: <20260202095743.1309162-1-arnd@kernel.org>
 <6580aa60-5f9d-49c7-8482-83bed12dfb0c@suse.de>
Subject: Re: [PATCH] staging: fbtft: fix dev_info() device arguments
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.20 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:arnd@kernel.org,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:thomas.petazzoni@free-electrons.com,m:notro@tronnes.org,m:deller@gmx.de,m:chintanlike@gmail.com,m:abdun.nihaal@gmail.com,m:dan.carpenter@linaro.org,m:willy@infradead.org,m:niejianglei2021@163.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:abdunnihaal@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[suse.de,kernel.org,linuxfoundation.org,free-electrons.com,tronnes.org,gmx.de,gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[arnd@arndb.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,infradead.org,163.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,arndb.de:email,arndb.de:dkim,app.fastmail.com:mid,messagingengine.com:dkim]
X-Rspamd-Queue-Id: DB2C4CC3B4
X-Rspamd-Action: no action

On Mon, Feb 2, 2026, at 12:32, Thomas Zimmermann wrote:
> Hi,
>
> there's already
>
> https://patchwork.freedesktop.org/series/160468/
>
> which no one picked up yet. This needs to go into the fbdev tree, but I 
> can also take into drm-misc-fixes.

Ok, that looks fine as well. The output is of course
different, but I don't think that matters either way.

> Am 02.02.26 um 10:57 schrieb Arnd Bergmann:
>> From: Arnd Bergmann <arnd@arndb.de>

>>
>> Fixes: c296d5f9957c ("staging: fbtft: core support")
>> Fixes: bc9f9cb85a7d ("staging: fbtft: Make FB_DEVICE dependency optional")
>
> These commit hashes differ from the other fix?

No idea. The bc9f9cb85a7d commit is currently in linux-next,
the a06d03f9f238 is not.

     Arnd
