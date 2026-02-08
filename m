Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJECMjrkiGmtyAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 20:30:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB8E10A030
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 20:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6E610E333;
	Sun,  8 Feb 2026 19:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="c7DXONXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 522 seconds by postgrey-1.36 at gabe;
 Sun, 08 Feb 2026 19:29:57 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6812310E338
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Feb 2026 19:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1770578995; x=1771183795; i=deller@gmx.de;
 bh=if9oRB3d+/FKGxUg7+pw8eFW2ryZ3GiRliNT5TE3JYw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=c7DXONXaRoLTUfuXLzXgIPYN00Jg8voRPjMDjpp6L2wPwM6oqRYgnbaZtbAc4X5P
 lBxxJ5q9icwAxUInH/H6ratDsNUsEqQEj2bQIa8cxsuIsOmP8NVJRKka87f0YN6/x
 nql2vpfQA31zPgvyHou270Vy2f2yAyS2JCz1NZS4OjIaffpEOI7Fhdwg2YTQoF7GA
 2tuqRPgaUinsfb6Y4Ryn5ZFUg/NEmLKYx+PAJB1bhz91W8pHVx4LC96RvMBhQklWM
 1MciR2vDZRLexUautqoSK4asLkDX0+BtqEFxFN+Z8ihvx/sj3GTzzDB0Qh90mj+zY
 MI2wIKfuvKtOh+x04A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.231]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MulmF-1vYBVg3BZr-014TsH; Sun, 08
 Feb 2026 20:24:43 +0100
Message-ID: <d6891ed3-0a6b-443d-b64f-10e8a17bde49@gmx.de>
Date: Sun, 8 Feb 2026 20:24:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] fbdev: au1100fb: Use %zu to printk a value of type
 size_t
From: Helge Deller <deller@gmx.de>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <cover.1770572936.git.u.kleine-koenig@baylibre.com>
 <3eea98cc14bae12a3ff6c6574971669e15a1f16a.1770572936.git.u.kleine-koenig@baylibre.com>
 <f4b5c6ec-0960-4c76-be49-ec0236b1e450@gmx.de>
Content-Language: en-US
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <f4b5c6ec-0960-4c76-be49-ec0236b1e450@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:knPkK2/f3YbksAURwvbiTOq5fPEyLva0mBajsgaofa8h3Nv6aAS
 XPAFOeWZIhMwQ+q5MOypmvGyvLyTCvingsrogHmuHZ78OUhdkHOBH2OhJ7qFKqJTit/Dvo1
 WcvTNAf6Ojcpd28UQ8jm228S+azMoWGcrabbNZBmURF9VowiftthTj/KD8i+uSS7rA37pQS
 lsLwHjQO5Ee8gCwN7QpYg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vmbnORBCSKI=;DrAXR874JIbkZzrKaqXUN7cFpL7
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_MULTI_FAIL(0.00)[gabe.freedesktop.org:server fail,gmx.de:server fail,baylibre.com:server fail];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gmx.de:mid,gmx.de:dkim,baylibre.com:email]
X-Rspamd-Queue-Id: 1FB8E10A030
X-Rspamd-Action: no action

On 2/8/26 20:21, Helge Deller wrote:
> On 2/8/26 18:58, Uwe Kleine-K=C3=B6nig wrote:
>> %zu is the dedicated type for size_t. %d only works on 32bit
>> architectures where size_t is typedef'd to be unsigned int. (And then
>> the signedness doesn't fit, but `gcc -Wformat` doesn't stumble over thi=
s.
>>
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
>> ---
>> =C2=A0 drivers/video/fbdev/au1100fb.c | 6 +++---
>> =C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au110=
0fb.c
>> index b1da51683de7..914f371a614c 100644
>> --- a/drivers/video/fbdev/au1100fb.c
>> +++ b/drivers/video/fbdev/au1100fb.c
>> @@ -439,7 +439,7 @@ static int au1100fb_drv_probe(struct platform_devic=
e *dev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev->regs =3D (struct au1100fb_regs*)K=
SEG1ADDR(fbdev->info.fix.mmio_start);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_dbg("Register memory map at %p", f=
bdev->regs);
>> -=C2=A0=C2=A0=C2=A0 print_dbg("phys=3D0x%08x, size=3D%d", fbdev->regs_p=
hys, fbdev->regs_len);
>> +=C2=A0=C2=A0=C2=A0 print_dbg("phys=3D0x%08x, size=3D%zu", fbdev->regs_=
phys, fbdev->regs_len);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c =3D clk_get(NULL, "lcd_intclk");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!IS_ERR(c)) {
>> @@ -456,7 +456,7 @@ static int au1100fb_drv_probe(struct platform_devic=
e *dev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 PAGE_ALIGN(fbdev->fb_len),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &fbdev->fb_phys, GFP_KERNEL);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!fbdev->fb_mem) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_err("fail to allocate=
 framebuffer (size: %dK))",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_err("fail to allocate=
 framebuffer (size: %zuK))",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 fbdev->fb_len / 1024);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> @@ -465,7 +465,7 @@ static int au1100fb_drv_probe(struct platform_devic=
e *dev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev->info.fix.smem_len =3D fbdev->fb_l=
en;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_dbg("Framebuffer memory map at %p"=
, fbdev->fb_mem);
>> -=C2=A0=C2=A0=C2=A0 print_dbg("phys=3D0x%08x, size=3D%dK", fbdev->fb_ph=
ys, fbdev->fb_len / 1024);
>> +=C2=A0=C2=A0=C2=A0 print_dbg("phys=3D0x%08x, size=3D%zuK", &fbdev->fb_=
phys, fbdev->fb_len / 1024);
>=20
> The & seems to be wrong.

I see you fix it up in patch #4.
Maybe simply merge them?

Helge
