Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A1nCmCvh2mabwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 22:32:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6768310728C
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 22:32:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC1B10E193;
	Sat,  7 Feb 2026 21:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Bt7CsAli";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CEB10E193
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 21:32:11 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso35184665e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Feb 2026 13:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770499930; x=1771104730;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0BrPLLSWSjiawj1gbSbQ0ZlYLO5BlnXdXTmgTcb/Ius=;
 b=Bt7CsAli22XiFpx7ORvrvV4Nsq1uq1z/7nlS+jvb3WfiXSjNhSZ4RaEC6VU3v8X4Fv
 zsWc4NgUTQQoppGsaoDRTxnX/QkIVINDjkXx83wNRibFOngE/ndc1Kjv6mNVrvwAeRiW
 YKBkG3wT3QAwkSyQwa8Tqz9OEI7yetNVVqHJkhDZ1s8n15Q/n6duGzMxa5zczIIBndTH
 SJGTyGOxQYAsnBP6JGhH62rrsyRMtZ6LODJvBos2ZUGoSTyJTpNAx43+JW+z+qTUjwEo
 knjpSxZZ+TVTaHAINr+o3YL0JVnqbk+LO5o6AwfDe9JFP54eEoM4rK9jDgLiPQcswZCk
 8BZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770499930; x=1771104730;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0BrPLLSWSjiawj1gbSbQ0ZlYLO5BlnXdXTmgTcb/Ius=;
 b=m8SNyQTed2Mw0Cc8s2GksRFrxNj5+XuCwn3XEwq36AaZScHWJBSy5UQ0ElsdKAyjDv
 ymKHIXgj54o8cLD67jd0O72n9TBFy1bS9kTfKN/Wr8wFDt4dRv0a113RXsb0hesMuOIz
 aHhFrjTTNwr91rNOR5oZWflqfgGcK9HZREfEp9VJgOvDDveqG2ynuGREqDpo8XcmqTh0
 fZ6GVQ2lWlJ761Q1FmG9STGD4OId2gpa+J6niC59oz7cNFv5dHpueEoSg7yorb6peuBi
 nyFT3PhnXYXN0E66hluWWLgIxmYb0tHPudqPgUOzl1W3zhSR7zTzSaWrIbqAaQdjLCbx
 19kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTI+JhHlYiEtyJCQe4b1LUFSmqgH8PANiEt4PmOUK7JCjkBcSZGz1OwHdRvXZ3XD4DaMhvcCfg+/o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPTfkXDBs0LvcwnYe1zqkuF63WEDqXzDGmr+VTML9k5vv8poTr
 eU90EzvR8GI5a7OsEt4NlhYL4D9XH++KFaVZUYOIufXrQ5etJrI+5+cVk614j3BK+9Q=
X-Gm-Gg: AZuq6aLQ7QYQJ9hwv09bmpfHVpMhANF2b054IWbS2lU8q44oZ8DadEizAYUEn0e+IQT
 qwe0qsHqIt/qtgDcUkH2Wb74iBRqncVxVP95IAtCwTIjYsIJJUMD5Ka3+WjX3vOTcwPe5OhKEeE
 SXP3oNclX5rvA2XzNRmTTrs1DNJIi0Gzz/IVEn4im2bEcZBoQRVAm0lBmdftGCThGYh7B2cCpEA
 XYTxFmOH7qKWCLoXeRHKM/9seIdX2Az+Hszn15z1TODxWrozs69UBZwqIauwoacXYciuEEEFPnQ
 uhd2CBw+PzEloI90RRbWzNpWAbb8QN86+48aEUb+pO9flT8yLmH+RojRKRd1NUmuGRICr/XOGpo
 8PjpXF36MSxbW1BV6fX5UTaeDuXnOP4mGNsAPV2MuTYKr8cn20t5WSxcVvdbCjAi4cfRD2r6WPg
 ZJBb/DLLsvBWJZ0scl
X-Received: by 2002:a05:600c:a00f:b0:477:a289:d854 with SMTP id
 5b1f17b1804b1-483203aaae7mr98657615e9.5.1770499929709; 
 Sat, 07 Feb 2026 13:32:09 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-436296b20fasm16054853f8f.6.2026.02.07.13.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 13:32:09 -0800 (PST)
Date: Sat, 7 Feb 2026 22:32:07 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 3/4] fbdev: au1100fb: Use %zu to printk a value of
 type size_t
Message-ID: <aYeu_fgYxHSk9pjK@monoceros>
References: <cover.1770483674.git.u.kleine-koenig@baylibre.com>
 <444f0cd1a39cc665a9e2d76454138c3e71c7747f.1770483674.git.u.kleine-koenig@baylibre.com>
 <615c1263-fbdc-40bd-aff6-b1411af012fe@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ajzfog673aerj25p"
Content-Disposition: inline
In-Reply-To: <615c1263-fbdc-40bd-aff6-b1411af012fe@gmx.de>
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
X-Spamd-Result: default: False [-2.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,baylibre.com:email,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 6768310728C
X-Rspamd-Action: no action


--ajzfog673aerj25p
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/4] fbdev: au1100fb: Use %zu to printk a value of
 type size_t
MIME-Version: 1.0

On Sat, Feb 07, 2026 at 08:06:18PM +0100, Helge Deller wrote:
> On 2/7/26 18:12, Uwe Kleine-K=F6nig wrote:
> > %zu is the dedicated type for size_t. %d only works on 32bit
> > architectures where size_t is typedef'd to be unsigned int. (And then
> > the signedness doesn't fit, but `gcc -Wformat` doesn't stumble over thi=
s.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> >   drivers/video/fbdev/au1100fb.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au110=
0fb.c
> > index beba8befaec9..a0e1aceaf9a6 100644
> > --- a/drivers/video/fbdev/au1100fb.c
> > +++ b/drivers/video/fbdev/au1100fb.c
> > @@ -456,7 +456,7 @@ static int au1100fb_drv_probe(struct platform_devic=
e *dev)
> >   					    PAGE_ALIGN(fbdev->fb_len),
> >   					    &fbdev->fb_phys, GFP_KERNEL);
> >   	if (!fbdev->fb_mem) {
> > -		print_err("fail to allocate framebuffer (size: %dK))",
> > +		print_err("fail to allocate framebuffer (size: %zuK))",
> >   			  fbdev->fb_len / 1024);
> >   		return -ENOMEM;
> >   	}
>=20
> I think there is a second hunk missing?
>=20
> @@ -470,7 +470,7 @@ static int au1100fb_drv_probe(struct platform_device =
*dev)
>         fbdev->info.fix.smem_len =3D fbdev->fb_len;
>=20
>         print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
> -       print_dbg("phys=3D0x%08x, size=3D%dK", fbdev->fb_phys, fbdev->fb_=
len / 1024);
> +       print_dbg("phys=3D0x%08x, size=3D%zuK", fbdev->fb_phys, fbdev->fb=
_len / 1024);

Ah, the compiler didn't stumble about this one because print_dbg is a
stub without DEBUG defined.

I will prepare a v3.

Best regards
Uwe


--ajzfog673aerj25p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmHr1QACgkQj4D7WH0S
/k4pBAf/SEz7V6p2eFrCGkaO4pc4w8gT474jPM3+vx9iVk0bZtVywgFXYkzkgezN
Ho315SJi/3R8JIi6FhTnvmbtfty8gNJE6GmWsoKxDcQcXUIzlo/KSgLLU2aeRO1D
t/ga8kM0ypOCispx8JSLE3qcFzdsAFZVDD8NPSo9/z3nAG6kHi541td5y9sFULQu
RYojnIyH4vAXwIh2btzh/1L4pyLt5/83+0s3Q0lG3Zpt+pZJzMx4Fuo2jKfnT0Mx
WnecP/3cEr54Eis5el84SqNfBzORQV5zebPCXrih9etY4779CtvvvCHm2TnfOFn+
S8RMidMXAG0S++Cq0PfBZ1UGNrmdbw==
=aNGH
-----END PGP SIGNATURE-----

--ajzfog673aerj25p--
