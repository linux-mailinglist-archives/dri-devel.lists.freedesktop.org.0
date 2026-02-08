Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCpHGGPMiGnZwAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 18:48:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C03109971
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 18:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A7910E172;
	Sun,  8 Feb 2026 17:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="paFrEdxn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2270910E172
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Feb 2026 17:48:13 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-47edd9024b1so27119495e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Feb 2026 09:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770572892; x=1771177692;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qVxkLTNVEDSTdm+aBk1/2i6S8/IHNFf2q2LyNyNYpH4=;
 b=paFrEdxnMRxV22NayzRK062JjOSynpDT6s7z9NgOQOYbg93QuPjmzmCm0FmsikG7dp
 aarhJLgXqoLf2AjvZ5OOAem1eJeAq7sj05Yomi/1nUeJAfX1n4VNaKkAholHgaOYXoY0
 6ieY1Me/grln8Z2oC8//0SfsmZPxPfr7bx9EtRO1PuHCkXW9gs5iTxbKsL+LxyFwFa0h
 zR93KwCNwTnj5aI+08SoX1TDigwoaXeGOtY/AawrSPXJ0ESpXc75boE3rEwJStr4wLi1
 3N8YD+Uk517O7tt8f0hbU1K4xsePOoJBKzovvQuKnexHzlZ2J2tm2lIuKYjyH3l++oPO
 64xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770572892; x=1771177692;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qVxkLTNVEDSTdm+aBk1/2i6S8/IHNFf2q2LyNyNYpH4=;
 b=GMQBmYGgE4owDqTQ2GwFhFLb2dkw1mwoVtiBSlNOcZS59CYcAkiY88/gV/5tt28Jdg
 sh9fjwRdANUolJAE0t7Hw/0EWh32pDr4j5PP5CbSj4gsUC9ATxW7pi2C1PC/hZfre6gA
 Ein+aH08BF7FriK5Yb20F9tAC7Kx+a45e2DBsnbpLspIgUhzEsuFL0FDVIoFcf9DAt2q
 /banH+/FzoK7Ht9eXyXmN4UP3MRIVGuRXbl48CJCpaLzPfti4TJULTrarCjJygVu6/iL
 StpwnCcUpkBRj8hT5TyfGZN3brcaxY8gTmCbR2dSAjvukUsm22Eu2dq73b9SbnFDtSqF
 FgYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkF+kGRr0aR7kS4rmo/dBZjhrwfiWOP2YNYvQ/beHfGuYrtxSCiRK22k23gNWLLQTXzpcYj7hzuRE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm0yBP8pgTXXHBBx5QP2MZ/V2M5IpJFFPADfk/SxDd7BgZ5QVt
 spLRQesRpTUOAbnPvJhauh45KF5+fsWYUv7HTNM0HjOO9NYAsYc41JvurLE+SfahZYY=
X-Gm-Gg: AZuq6aLmhFY4B/bxBG+T91qMOjv53xGFloaeIpd3Hrvm2a7wTSk06fbuQ800qveJyWg
 CPge/0E4JmuiTdXdowAjUu/RFWiSYtHhSVjK1qNR/OOMMr/zXtsOdnGAALn2daAmk+IA13JFvbM
 RNjdhiadVHDvQDcuhQvC+JrGX+o5zHU7wKEVW7C6LchzJSuq7IHmSgRVhSTJ1GGTPpwLu9LPzbT
 GfSFKzC7WsParEgdZvmFt7OfOqTFuVEADu7fbO+o/uV2OXk1Tq181dcO3YiIp97uhuJ16G2hpDD
 wOygg25uH09lrGggY3Wu/XY98D+762SSZZDjiZ7kQ19lRWtYjItuYMShdlW3P73cbt6r/pnmzJ0
 7VspfyvMhYDjo+7bBL95A322Y2G7rd/HYiNB6o0CXY/iIom15p+kPMh3IF+GEj9w2/6aZLdfe+X
 HcaWMoG29zkDufO3iF
X-Received: by 2002:a05:600c:8116:b0:480:1c10:5633 with SMTP id
 5b1f17b1804b1-4832021c74cmr132509965e9.26.1770572892294; 
 Sun, 08 Feb 2026 09:48:12 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4832097e142sm70961185e9.8.2026.02.08.09.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Feb 2026 09:48:11 -0800 (PST)
Date: Sun, 8 Feb 2026 18:48:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] fbdev: au1100fb: Don't store device specific data
 in global variables
Message-ID: <aYjLX1uGMkDugm39@monoceros>
References: <cover.1770483674.git.u.kleine-koenig@baylibre.com>
 <0e1ecdde447dc32816f1f066812ec8e84b4aad0a.1770483674.git.u.kleine-koenig@baylibre.com>
 <7334e2a2-d71f-404c-b2b0-170a7117c0c5@gmx.de>
 <aYevgJ6cfe6JVlJq@monoceros>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="spaogm5g56oxtz74"
Content-Disposition: inline
In-Reply-To: <aYevgJ6cfe6JVlJq@monoceros>
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
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_TO(0.00)[gmx.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.982];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: A2C03109971
X-Rspamd-Action: no action


--spaogm5g56oxtz74
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4] fbdev: au1100fb: Don't store device specific data
 in global variables
MIME-Version: 1.0

Hello,

On Sat, Feb 07, 2026 at 10:34:21PM +0100, Uwe Kleine-K=F6nig wrote:
> > > @@ -559,7 +554,7 @@ int au1100fb_drv_suspend(struct platform_device *=
dev, pm_message_t state)
> > >   	clk_disable(fbdev->lcdclk);
> > > -	memcpy(&fbregs, fbdev->regs, sizeof(struct au1100fb_regs));
> > > +	memcpy(&fbdev->pm_regs, fbdev->regs, sizeof(struct au1100fb_regs));
> >=20
> > Although memcpy() was used before, isn't this:
> > 	fbdev->pm_regs =3D *fbdev->regs;
> > sufficient and better?
>=20
> Probably yes, that's a separate patch then.

Thinking again: this is copying from io memory. So both memcpy and
struct assignment might be a bad idea. I'll keep it as is, this driver
already occupies me much longer than I intended.

Best regards
Uwe

--spaogm5g56oxtz74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmIzFYACgkQj4D7WH0S
/k5S8gf+JqZRaaFc9xKL633QUtFt//Z+4Wyti4iKrtYDkeJAvUA0yAeNksku8Vfh
PHxP25/AY/5swCHs87aAZ28SOgqmkuc2MsQKJWC3g0Xb7i2cgTA1jzCBbHjWydvf
A7YLK0JL1phZSLJKS1gbZ7vYj89gnFq+tc3FJypJoTtU9mmeWneB5ewwUanl4/Ul
wu1+HGhqRUxH3i4iSNAADAG6TyNKn3GI1JYchEV7ANMUrckUOkOmOEHkXTSY1TJx
lHaWjtbib9QzNH0a4Rg/m/KS9pqRWZ9Fa8jG+FSVoAM3mOttEJG45fGS5Ox0ihej
f6WoMhxaGR6yusQgM244g2/U046wiA==
=l4sx
-----END PGP SIGNATURE-----

--spaogm5g56oxtz74--
