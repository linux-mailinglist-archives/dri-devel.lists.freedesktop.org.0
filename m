Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEk9Fe+NiWnP+gQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 08:34:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EEA10C7B3
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 08:34:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC4210E304;
	Mon,  9 Feb 2026 07:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SYoe6WlQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0058F10E304
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 07:34:02 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4362d4050c1so2528883f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Feb 2026 23:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770622441; x=1771227241;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OCETD2Ir3XdZsZrpCZXE8L7Gxegk6DC6juk+h3rkygY=;
 b=SYoe6WlQbmSrcnRE/IkgdWA4sbtR9gufwqthglce+CnB5JvRttKo14Uzx2q+6yI576
 9b45Fcv4ZnewsdNCFsWlXFLpAEdLcnBCEfklI+2pvnsgxZHnObRvFIftihYTCaueaXj5
 uOAcYPLKHD+SM9SR19OB6x1jt51KgIIaiD7RYlHzBUtj4E+d0iQS+dnk9VC9QUD7nLWB
 ao8yhaW8IiX3WFWr/5i2lK6LLr2F+3+0xMt2lxGZsi6jkqSz5oCqGvOQsXCnO2wcw4yu
 F4ixT4wsHJZ3AAAIK43jCSSIcL/bM714Mj660Hpudrvt20dgw6Z4m9YOuLV+K3hfUBxH
 vs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770622441; x=1771227241;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OCETD2Ir3XdZsZrpCZXE8L7Gxegk6DC6juk+h3rkygY=;
 b=Xqc1yDb3wi3FK/tkHZuwIFnyYFti3nbWgOjYy5MGIw/r4/TXD/aHLPiGMFwUXuLomb
 rM/DeFmgBNzsr4mtE7Lo/rf3OWd+yTI3qZk0mXJmEEaC78hK1Ew85ndWEU7URURXduJI
 I/xXny5zCzVSdUdd1OS6/5a8DnBhKaa67/2M1bdha2QSil2onuUc+vvygqM+h+s7IBlU
 N65RK8aQtSMwpf5a1YO9rwzk687YxsjcqdbuR7jw6unW1VgVFhMt5QnAOkYyAIIq45iy
 PAhDZahwULwi5To8ksndLBd6w10wfAOKwrX6Nf7xeWIGv0ntIXi8HW3GkMr6IyDsU7Mk
 ffqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6d2RjzIJvmHGDqTcWdnJYMOUEg30uz6gJhqFuuhdJ7KxvQTof5cRf9x9SkMyf1+kqhL/H09RFiec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeBsp9yuAu34qT2bL3vTCT+2LmnWwJhH1HOE4zE/lBhH7YcztK
 H7UGWnuQEGo6IXFyw2al+LZBJCCl2ZojSOYjYQo7Xm27SeOMj+2fYhpf9rfj+5QDc+4=
X-Gm-Gg: AZuq6aIY4I7NCtsqfTpu8unvOAKYZjqQ0cesWOzCrK5A8lCP3MrMFNlZ8pLv5wcE9mp
 NdWCH22Dj4PF9ko3mS8UFJNbd1K4+XjiuTlukGcIBA/we+QhodN1/ZstbwEDp6B5uXk/q78j5ot
 J4poZ0eIOF9hG4kHr4ouin6hEHgMArTjPDtG6hlEz2ZNrkvFKXmZnVi14VdcO2KrTSTV8TUhpHH
 M2t3A9CsS6Zbg/smiqTVmf67rCO5WURPdnzuvlfQqWsny9eC4MAUCr/YP1CwmyjxYtCfRLV0haB
 /vliyRkPhYvxoO51teRwRfuW7s5YdyXYOavV2pTBURdTj92k10n1dFP5QInCMU3LSrsH7eqTBMF
 plT8nEf8lXwq0ctEyE+C+8OdnIcp1l4iZR+CNS+QVORH6W3WskTBGJkOHcd54nfwv63y+D+SFM1
 A9T1D5OfGHjv3nCcM0
X-Received: by 2002:a05:6000:2209:b0:435:9241:37b4 with SMTP id
 ffacd0b85a97d-4362938ffe3mr17992442f8f.53.1770622441280; 
 Sun, 08 Feb 2026 23:34:01 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-4376686130csm12534072f8f.1.2026.02.08.23.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Feb 2026 23:34:00 -0800 (PST)
Date: Mon, 9 Feb 2026 08:33:59 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 3/6] fbdev: au1100fb: Use %zu to printk a value of
 type size_t
Message-ID: <aYmMyNMC0z8dLisS@monoceros>
References: <cover.1770572936.git.u.kleine-koenig@baylibre.com>
 <3eea98cc14bae12a3ff6c6574971669e15a1f16a.1770572936.git.u.kleine-koenig@baylibre.com>
 <f4b5c6ec-0960-4c76-be49-ec0236b1e450@gmx.de>
 <d6891ed3-0a6b-443d-b64f-10e8a17bde49@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="whgo2niphctkkmr6"
Content-Disposition: inline
In-Reply-To: <d6891ed3-0a6b-443d-b64f-10e8a17bde49@gmx.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.982];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A6EEA10C7B3
X-Rspamd-Action: no action


--whgo2niphctkkmr6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 3/6] fbdev: au1100fb: Use %zu to printk a value of
 type size_t
MIME-Version: 1.0

Hello Helge,

On Sun, Feb 08, 2026 at 08:24:43PM +0100, Helge Deller wrote:
> On 2/8/26 20:21, Helge Deller wrote:
> > On 2/8/26 18:58, Uwe Kleine-K=C3=B6nig wrote:
> > > @@ -465,7 +465,7 @@ static int au1100fb_drv_probe(struct platform_dev=
ice *dev)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev->info.fix.smem_len =3D fbdev->fb=
_len;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_dbg("Framebuffer memory map at %=
p", fbdev->fb_mem);
> > > -=C2=A0=C2=A0=C2=A0 print_dbg("phys=3D0x%08x, size=3D%dK", fbdev->fb_=
phys, fbdev->fb_len / 1024);
> > > +=C2=A0=C2=A0=C2=A0 print_dbg("phys=3D0x%08x, size=3D%zuK", &fbdev->f=
b_phys, fbdev->fb_len / 1024);
> >=20
> > The & seems to be wrong.
>=20
> I see you fix it up in patch #4.
> Maybe simply merge them?

I see how my compile testing went wrong: I checked that

	make drivers/video/fbdev/

was happy on several archs (but not mips) but only starting with patch
#5 this actually compiled the driver. =F0=9F=99=84

I'll give it another go tomorrow or so.

Best regards
Uwe

--whgo2niphctkkmr6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmJjeUACgkQj4D7WH0S
/k59kQf/V6SKzt6FZ8AYhQY7Rmk3hbW5XDpdI3qUpn25p4yU4ZlhAa7es+94axGa
w4tW7z+a504jbueH8n9CDQTlAuNwvT4RKRTCMKlLEzZOvlXMWiFKxtkPOt/BMY++
BGLekYKrZqqiqvPBOEjWWkkSAFzKk6BWN4ognAM2lNB1D1ivIjVeqvMD6VPmwSYO
zh5k5sl4WxG5v2kfZtEfBSR0GL+hHMotp2z7jmoQ36ZMZoNdhjbW5afVE33dTq1m
snHKSf4mGQ0gYYI2NmOq6GkzUYtoFj+oJrY7heixt5iTYx6O5hsyw/t7BDeTXokd
50LRfUVUV7KdWbq2qf+tbCTnDxsnzQ==
=wUKs
-----END PGP SIGNATURE-----

--whgo2niphctkkmr6--
