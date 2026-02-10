Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOavGAkCi2npPAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:01:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7A11194F8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE73310E534;
	Tue, 10 Feb 2026 10:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="WV/YW8Bp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2771110E534
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 10:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1770717678; x=1771322478; i=deller@gmx.de;
 bh=TFDDVCWieF3uq8ruPhoSeErfzgba8VlS3WTKFrYoKM0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=WV/YW8Bp6ZehJuyijksg1WNEsX6TI0KNRtP/l5yERvKAZHcaA3KB6WQJcQGZuM0p
 UD02MpFeGG2+HRj5ZZlmssLA5eb9IBij8WhV+Rjuu8Y0btfsU8KkgdBuF3ZvuLMMY
 67gvufh6VV73XKd6eGFGsH06fAMXRFRbD4q7GAefWS3yqmxOflvZzFhi5SEWUdzSi
 Ww3PYgdeC3rPqy0d2Lo3XZ7Hw0yzWYFoXYoI4M8HlSOSYHGTSCVAxEt+5GjNdV6ZE
 r/kX9rRh34BRSTUjXZMnPPjQUgSVlyJd0DuMYt2XjSYZYjoD1fs/CMK6cjY99w54C
 fHTdcNFqiGrONmq9aw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.36]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE27-1w4OzV1qlX-00XM9J; Tue, 10
 Feb 2026 11:01:18 +0100
Message-ID: <617d86f7-9392-4f87-a4b2-c09eb7a260e7@gmx.de>
Date: Tue, 10 Feb 2026 11:01:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbcon: Declare struct fb_info.fbcon_par as of type struct
 fbcon_par
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20260210094356.23645-1-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260210094356.23645-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QKWuVwlAWGBH4XLm/WwupuK92f/pFJKk7cEOf0FaQ6eZqwz+1lA
 lYzHvyc6qFEyVELyRrjHrZCmMh07ufxP1OH/lOrLATuP15xm6TCB1y8HveYFYLfFdfPDsZw
 UR9cy10bdYJQr7LqAWcTXwBMiVkqDx+QKxirhD92L1fDWJaPvK+zl5KUsuqkIHaXSXbhz7D
 y/lfoA/aWNyh1ZQWckiCQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:D+k4M79ng24=;M8KH2XSYe/3QxGmjhAxhHVpyMEq
 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
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
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[gmx.de:query timed out];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[dri-devel];
	RSPAMD_EMAILBL_FAIL(0.00)[tzimmermann.suse.de:query timed out];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:email]
X-Rspamd-Queue-Id: 0A7A11194F8
X-Rspamd-Action: no action

On 2/10/26 10:43, Thomas Zimmermann wrote:
> The only correct type for the field fbcon_par in struct fb_info
> is struct fbcon_par. Declare is as such. The field is a pointer
> to fbcon-private data.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   include/linux/fb.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

applied.
Thanks!
Helge
