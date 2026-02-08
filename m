Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HjPBWbjiGloyAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 20:26:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2635109F9D
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 20:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6134810E298;
	Sun,  8 Feb 2026 19:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="nvW1+TzX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5924310E298
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Feb 2026 19:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1770578781; x=1771183581; i=deller@gmx.de;
 bh=eJXNgOsVHxue1kLgAn2HyLgO1ePhGZMU4yqMo7m0DMU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=nvW1+TzXlQ5e6Zzc+98LsgHZAQ8Zor5qcRIZt3Yvh2FaNeOovMXgXgv9krDnCnBH
 hJYJ2+yKLby0eEz6JNKyAtsbVaBJ6q3Ev+RK5PntZSRwFmzneLvpO3X7KlpNsMy9a
 Y+SDIXJJ1//HmAYalvqqGC1WjZrnyOoiSuxTQT7VniWYZ4HBmyEt0kWo4bsCKZl+1
 plTAxxOMInlo59JjU9+3N3yJbiX0mx++wjjks1CxzuXKA7ZY65jcVV3GStk9JrGgT
 utubJ8kuIyIop8PFsloIbO4g0vgG8Y1X+P2f7nZUY2grPf9BHzb0ITs92s69wq+SL
 xjtr2q9tZwipt/RxpA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.231]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpDJX-1vSkYQ2nbL-00cy06; Sun, 08
 Feb 2026 20:21:05 +0100
Message-ID: <f4b5c6ec-0960-4c76-be49-ec0236b1e450@gmx.de>
Date: Sun, 8 Feb 2026 20:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] fbdev: au1100fb: Use %zu to printk a value of type
 size_t
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <cover.1770572936.git.u.kleine-koenig@baylibre.com>
 <3eea98cc14bae12a3ff6c6574971669e15a1f16a.1770572936.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <3eea98cc14bae12a3ff6c6574971669e15a1f16a.1770572936.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5q6R1V8OLG3iJUvVGvek2qIVgQ9wVh1tA3KOYr2B8W4ttNi/tjl
 pKIQYowerjTpup4QB1l1yMqdA9opFBfx24zQResU9QoqKnbYoG8Nm0K+gLqTgR4uDqxs20m
 ramRY2C42YQ+Yus9GlF9qgOrrQ4oYNVKL1VHQacUa/ZcmlfA64eRHhN7shT96dPRRLQS4FP
 03axEtMiXBXmFtv4QAJQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rRhsg63WB6E=;J+kdKoEqynKmM+R4/t5g4nhkMx4
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,gmx.de:mid,gmx.de:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E2635109F9D
X-Rspamd-Action: no action

On 2/8/26 18:58, Uwe Kleine-K=C3=B6nig wrote:
> %zu is the dedicated type for size_t. %d only works on 32bit
> architectures where size_t is typedef'd to be unsigned int. (And then
> the signedness doesn't fit, but `gcc -Wformat` doesn't stumble over this=
.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
>   drivers/video/fbdev/au1100fb.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100=
fb.c
> index b1da51683de7..914f371a614c 100644
> --- a/drivers/video/fbdev/au1100fb.c
> +++ b/drivers/video/fbdev/au1100fb.c
> @@ -439,7 +439,7 @@ static int au1100fb_drv_probe(struct platform_device=
 *dev)
>   	fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.fix.mmio=
_start);
>  =20
>   	print_dbg("Register memory map at %p", fbdev->regs);
> -	print_dbg("phys=3D0x%08x, size=3D%d", fbdev->regs_phys, fbdev->regs_le=
n);
> +	print_dbg("phys=3D0x%08x, size=3D%zu", fbdev->regs_phys, fbdev->regs_l=
en);
>  =20
>   	c =3D clk_get(NULL, "lcd_intclk");
>   	if (!IS_ERR(c)) {
> @@ -456,7 +456,7 @@ static int au1100fb_drv_probe(struct platform_device=
 *dev)
>   					    PAGE_ALIGN(fbdev->fb_len),
>   					    &fbdev->fb_phys, GFP_KERNEL);
>   	if (!fbdev->fb_mem) {
> -		print_err("fail to allocate framebuffer (size: %dK))",
> +		print_err("fail to allocate framebuffer (size: %zuK))",
>   			  fbdev->fb_len / 1024);
>   		return -ENOMEM;
>   	}
> @@ -465,7 +465,7 @@ static int au1100fb_drv_probe(struct platform_device=
 *dev)
>   	fbdev->info.fix.smem_len =3D fbdev->fb_len;
>  =20
>   	print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
> -	print_dbg("phys=3D0x%08x, size=3D%dK", fbdev->fb_phys, fbdev->fb_len /=
 1024);
> +	print_dbg("phys=3D0x%08x, size=3D%zuK", &fbdev->fb_phys, fbdev->fb_len=
 / 1024);

The & seems to be wrong.

Helge
