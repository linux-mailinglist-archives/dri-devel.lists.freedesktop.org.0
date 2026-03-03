Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OxKHyPrpmnjZgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:07:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F951F10D9
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:07:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033A010E81E;
	Tue,  3 Mar 2026 14:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="YpOba/ki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9AE10E81E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 14:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772546835; x=1773151635; i=deller@gmx.de;
 bh=oGklMYkndDS2s5kfPs2+SWhIE/hCC7BEDMZZVAxZzgA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=YpOba/kizF8PrdOCz7vCX6kAXqw+aatAPWLiIsezRwRcuGEY1WyoSSHraMGawPfh
 gsoj5zLuXR0yQTUdBWBZSvSTORXRHACHtPN4Jn6Vf7THXAY1/bMKwwLF9KBaaOWC4
 1klbySHMGnFQhNYaJuAKuNkDR9cbo916pBOaF1L7Qod7IbGk5YTjibaQtG1MfYlyI
 GUcZNoIvYW4Bdy1y4eVb7aKq+VFqgjP5NJqjvgGTo3ySFVYQ66j9vEnvPBE8dau+l
 aWYHwcT5LxVhatPOGEg/vv1d1lPEXOI0P23stPletimPnJzcDmjNxD6ObuMvePlem
 /FKgyODZGZYjiI1lpw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwwZX-1vlwzY377b-00zrAW; Tue, 03
 Mar 2026 15:07:15 +0100
Message-ID: <ef603e8e-a5f6-4f8a-b538-6535f1b934a2@gmx.de>
Date: Tue, 3 Mar 2026 15:07:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: goldfishfb: use devm_platform_ioremap_resource()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Amin GATTOUT <amin.gattout@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260303-master-v1-1-85eb5ff584b0@gmail.com>
 <2fb9b0fe-e63a-4b06-968d-3cb30383ba37@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <2fb9b0fe-e63a-4b06-968d-3cb30383ba37@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m4K3RIOmJSqrrLItYyKQAO3HtI8g9W938K4sCOugZRGotSneqJz
 7thJLLfX0PtoBbUeoJnTWOoMlN4itfQzw/NUL6GNwSuS9lrImXJdb6WsEn9pIk/4dWGe6V4
 tyo1KNoeAAjj5Vn+pULPnJTBWVnvKYORhAHzfPTMib79J3naW8rpbROrb0c2HYz80KNXvP9
 4Gfj4ofx1g8O8axfa11+w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3z1tXV4jT3g=;NlejXf2dI0TU/dI3VJpLuJX7Yh1
 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
 UkmB5HwrnWrQBao/bbbHNq85pk7blsIjo7GGK9
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
X-Rspamd-Queue-Id: 60F951F10D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[suse.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:amin.gattout@gmail.com,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:amingattout@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,gmx.de:dkim,gmx.de:mid,suse.de:email]
X-Rspamd-Action: no action

On 3/3/26 13:51, Thomas Zimmermann wrote:
> Am 03.03.26 um 13:22 schrieb Amin GATTOUT:
>> Replace the open-coded platform_get_resource() + ioremap() pair with
>> devm_platform_ioremap_resource(), which requests the memory region and
>> maps it in a single call, with automatic cleanup on device removal.
>>
>> Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
>=20
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
>> ---
>> =C2=A0 drivers/video/fbdev/goldfishfb.c | 14 +++-----------
>> =C2=A0 1 file changed, 3 insertions(+), 11 deletions(-)

applied to fbdev git tree.
Thanks!
Helge

