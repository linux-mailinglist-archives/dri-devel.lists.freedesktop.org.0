Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMuTCnKpjWkK5wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:20:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F206E12C6B2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D63510E1DA;
	Thu, 12 Feb 2026 10:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="eryi6RMZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F4410E1AD;
 Thu, 12 Feb 2026 10:20:27 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fBWX75kgzz9tJR;
 Thu, 12 Feb 2026 11:20:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1770891623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EvlNh4whGfRORlPs4ksfhA1L1r7Z2CtEieq3IwPk7Ic=;
 b=eryi6RMZAVZx/Z17Dv6jBLpnlhuJU3F9ucktibIq+euPBYgSLh8TuFcbZ4eRgl13sMCIlQ
 iKKo4ak83Q6OGd6uCiMWIb/CbjTpKT80JLRo8pjAqHC37LvlraPDDIWFzd3Xu4+CfwpInG
 1+68sJZGuSo+4brEnA7yBTd7XEhjQxDhLjZFX0NZz9LKBQ/frtSUbyX8Q3TqbLT4woT6uu
 EyE5dcCCzVRf6cort2/YCIGMsysKjgOeBjzI6YyXq+GQg4awpcbwdGsZdxA/HMAKSQxPN/
 TAVcmOiFXJuYaf7UbBAcS6nFUyrxHms029oeKj5QOW+oqMfU1Q5LIk1lzAop7A==
Message-ID: <5c5363a4-a337-40b0-9ee5-11fbe6fd3edf@mailbox.org>
Date: Thu, 12 Feb 2026 11:20:20 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/amd/display: add module param to disable immediate
 vblank off
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Michele Palazzi <sysdadmin@m1k.cloud>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 mario.limonciello@amd.com, Rodrigo.Siqueira@igalia.com, alex.hung@amd.com,
 aurabindo.pillai@amd.com
References: <20260211074529.131290-1-sysdadmin@m1k.cloud>
 <2026021146-mockup-pushup-5f47@gregkh>
 <7a1fa826-cddc-4f8d-ae45-afe6ddecd6e0@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <7a1fa826-cddc-4f8d-ae45-afe6ddecd6e0@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f2fbebcb4843a3059bf
X-MBO-RS-META: o8njixjm3uzjgjrjbgatzthy79dzzp5g
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:mid,mailbox.org:dkim];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[mailbox.org:+]
X-Rspamd-Queue-Id: F206E12C6B2
X-Rspamd-Action: no action

On 2/11/26 11:07, Christian König wrote:
> Dropping stable, putting Grep on BCC.
> 
> On 2/11/26 10:19, Greg KH wrote:
>> On Wed, Feb 11, 2026 at 08:45:29AM +0100, Michele Palazzi wrote:
>>> Add amdgpu.no_vblank_immediate parameter to optionally disable the
>>> immediate vblank disable path on DCN35+ non-PSR CRTCs. When set to 1,
>>> a 2-frame offdelay is used instead, matching the behavior used for
>>> older hardware and DGPUs.
>>
>> Please no more module parameters, this is not the 1990's with only one
>> one device in the system.  Please fix this the proper way.
> 
> I just wanted to write the same.
> 
> We can of course implement something in DAL/DC, but clearly not behind a module parameter.
> 
> Or is there any other negative consequence except for that the display blanking is delayed by ~40ms?

It doesn't affect display blanking, only how long the vblank interrupt stays enabled. (If it stays enabled unnecessarily, that might waste some energy)


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
