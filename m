Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHcmHDKNh2nMZgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 20:06:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5971106EC8
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 20:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A6410E2AE;
	Sat,  7 Feb 2026 19:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="C2K//QU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B08610E2AE
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 19:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1770491179; x=1771095979; i=deller@gmx.de;
 bh=FN76Ump4MjM5hZjiy+etLOWDwDwxCq/98XFIIVRa7f8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=C2K//QU+EvqkI8aWlowk+xwOO4kWOfBINs4gbfrJo+xCm5tfkxMHURc7f5lgoRc0
 p7BycJkXF+fOtahGM3XgeAiA3OQfGh6Kiwdxl4u8Tb5TJUhtIFnlSbi/2R2pSwrh8
 QZ9jF0vgQOAgrEXvwvjE3Nzltmf4kL6+PkXw8KfL4q1sE3CQWfUeHVev9eWaDuq82
 vx3MUNTTHP+Er66r8MEdexiCgb0fWRiIY9dhqtgAd7zBHTgWKOtQMaW88193cHu4Q
 LmuSLV3ZvXioNDSrt8kBEeBOBTKxUm1ZSrtuw8uLJ5Pv1S529/DlSs58BCqcOVm+G
 9jSUS+JtMESk6nCHdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.215]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPog5-1wA3oW06gF-00Xnrt; Sat, 07
 Feb 2026 20:06:19 +0100
Message-ID: <615c1263-fbdc-40bd-aff6-b1411af012fe@gmx.de>
Date: Sat, 7 Feb 2026 20:06:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] fbdev: au1100fb: Use %zu to printk a value of type
 size_t
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <cover.1770483674.git.u.kleine-koenig@baylibre.com>
 <444f0cd1a39cc665a9e2d76454138c3e71c7747f.1770483674.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <444f0cd1a39cc665a9e2d76454138c3e71c7747f.1770483674.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Y7W894RNa5Lvajgx44U3EzF2HUhJZ0RwSrCvJl3XEHny7vK8NwR
 om8qh+jt67TC2pxDxAVV3VUnMLwwvcnaaltWOHFs68Zz0nk+EF1EV5Tf6ys+FiqD5GJreZH
 NT3RTKunx/J4UDmLa/254Si95loyyxGZQguebR1Cer2DFt64i7Ry1cSLq2/rzlDrQuILNeh
 A8WyAEt4yLg6fq7hw5MPA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Kgu86fmCkkA=;Gzv5EZRECCE7VyT1lAIWu8tIekd
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,baylibre.com:email]
X-Rspamd-Queue-Id: C5971106EC8
X-Rspamd-Action: no action

On 2/7/26 18:12, Uwe Kleine-K=C3=B6nig wrote:
> %zu is the dedicated type for size_t. %d only works on 32bit
> architectures where size_t is typedef'd to be unsigned int. (And then
> the signedness doesn't fit, but `gcc -Wformat` doesn't stumble over this=
.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
>   drivers/video/fbdev/au1100fb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100=
fb.c
> index beba8befaec9..a0e1aceaf9a6 100644
> --- a/drivers/video/fbdev/au1100fb.c
> +++ b/drivers/video/fbdev/au1100fb.c
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

I think there is a second hunk missing?

@@ -470,7 +470,7 @@ static int au1100fb_drv_probe(struct platform_device *=
dev)
         fbdev->info.fix.smem_len =3D fbdev->fb_len;

         print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
-       print_dbg("phys=3D0x%08x, size=3D%dK", fbdev->fb_phys, fbdev->fb_l=
en / 1024);
+       print_dbg("phys=3D0x%08x, size=3D%zuK", fbdev->fb_phys, fbdev->fb_=
len / 1024);


Helge
