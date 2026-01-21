Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFqVDoZUcWkPEwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 23:34:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D1D5EE03
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 23:34:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1470510E89C;
	Wed, 21 Jan 2026 22:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="GElB3n5P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8694F10E89C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 22:34:41 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dxJsT3dVFz9tyd;
 Wed, 21 Jan 2026 23:34:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1769034877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nOIVcLvVFcWSuLuAPNcDsGiGlDzXBHXtRppJe2NX02A=;
 b=GElB3n5PYXD4tbhqA+pjuAre1uTo2ZNorDPb0e+JKkKeDoRaHhmSFIhUMgAdqNfdYfXTbk
 L/WNLrQCrFiqIaDDeqN1tsgDvqcLuQnWuJNrO0eOtnaVn7yaKOtXrI5a0cS+luVkhv8LCu
 SfcOyRPXKgr92X1mMrEo9jnDzZmk2J6vpgYuBc4DqUhkCGWgZsdT8GbuzSiqSaOEP7STl9
 Vd1s6qQC026vutfa7rjpNbC8ICfQ+aSeWZTem3eXhVHAQBAhstcVsRNC9fDhZPVNJupSdD
 hRrDpOT6UO/HPUh/DRWj7vnqxHZiaKxnGQUpxFJ2dm6PfsrEVBpoJVCV2ie1qw==
Message-ID: <6313097c-1a9c-4353-91e6-da97dda84dfc@mailbox.org>
Date: Wed, 21 Jan 2026 23:34:34 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/imagination: Fix build on 32bit systems
From: Marek Vasut <marek.vasut@mailbox.org>
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
References: <20251106232413.465995-1-marek.vasut+renesas@mailbox.org>
 <666b75d9-108c-42cf-bce7-b7efdb25e027@imgtec.com>
 <3af6990f-3b3e-4dbb-aa9e-1cd86341e0f0@mailbox.org>
Content-Language: en-US
In-Reply-To: <3af6990f-3b3e-4dbb-aa9e-1cd86341e0f0@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: i4sgg3bmbi9iceku4fyetzps6szrxaex
X-MBO-RS-ID: 658bc8f22e6a7e0b923
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Matt.Coster@imgtec.com,m:airlied@gmail.com,m:Frank.Binns@imgtec.com,m:Alessio.Belle@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:linux-renesas-soc@vger.kernel.org,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,imgtec.com,linux.intel.com,kernel.org,ffwll.ch,suse.de,lists.freedesktop.org,vger.kernel.org,ragnatech.se];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2001:67c:2050:b231:465::202:received];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B7D1D5EE03
X-Rspamd-Action: no action

On 1/5/26 5:34 PM, Marek Vasut wrote:
> On 1/5/26 2:09 PM, Matt Coster wrote:
>> On 06/11/2025 23:24, Marek Vasut wrote:
>>> Fix support for build on 32bit systems. Include linux/io-64- 
>>> nonatomic-hi-lo.h
>>> to provide non-atomic readq()/writeq()/ioread64()/iowrite64() 
>>> accessors, and
>>> use __ffs64() instead of plain ffs() on 64bit number SZ_1T.
>>>
>>> This allows this driver to bind on Renesas R-Car H2 which contains
>>> Rogue G6400 BVNC 1.39.4.1 .
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>
>> Hi Marek,
> 
> Hello Matt,
> 
>> My apologies, this one appears to have slipped through the cracks on our
>> end.
> 
> No worries.

Has there been any progress on this ?
