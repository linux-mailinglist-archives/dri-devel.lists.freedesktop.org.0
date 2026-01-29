Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ih/Er8Ie2kJAwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:14:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63532AC7FA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9099610E096;
	Thu, 29 Jan 2026 07:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EmvLRWMn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC56910E096
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 07:14:01 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso1134226f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 23:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769670840; x=1770275640;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=L+F5CpBXR6il9Er3qZ+S7/cbqloU+3ySb0pfp/IqRj4=;
 b=EmvLRWMnFEAu33uvP9D76O/kGnHWq2OZW3+Ciqwq0ebM1tokmVJi0oSkKM9jxEgZwo
 9mDsW1h/oC+iMBT/G7Ubojz5hEYkbOClZb6XfOi3fCDhxoyIGMP1TKFiioE0w00c5hCm
 axJw7i0w45t4vM5E0F6Nphe+cj8g2kNzYtQdZK8TMwVmA5h+X/UiYEHFSHZ/R6Qgwjrs
 WqCGxsj0htQgCDSNFOkPsD/rG5r9ALXqPAvtGhezIo8xqpRv8FKBHe1oB58vEjZJ9Zbz
 AaCgpM7XI8dFazGzaOMxeTaevaUjI2T7woEa3+CXFnjpyYYy5BrOa/AIoFZbqz6u5Ygc
 fHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769670840; x=1770275640;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L+F5CpBXR6il9Er3qZ+S7/cbqloU+3ySb0pfp/IqRj4=;
 b=DaLDwx4SEf8RsLTq/Ld4UcAFIXEuA97WyedVrA04y7MU/XQcSvtF7A0b+E6HlPi9lx
 7D5KZWBIVGOQbz3oRLcrHvv0v+H/eiyTayG2X/+4fOfSJRZnAR6z+CVj87XZ5Vc/+/8z
 2vdyZWahmB9vVR4ICcc3LOM6c5VSUJ0CpAEANmiY2P6LwwKpCpZZa2Ce/yj61JomaCAZ
 NbD9fDDRx1pzShl8X9HRHRz+OqgyA9R6T3qtNH/vrhRjfuqxX2Bv25d2TGMSwFi+aTlM
 qsClUm4YnAVFH3yRb8Dun6zFW3qOji8y6TCFzsat9ZWhLJdHjZjcCINou8QKEsiLxb0R
 WGQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMjiifjTCQpDe+aRbLwwpgrtrlnw+B31+7Hhf35lQKy5cw1BO6TyKgWWkmfL1btxohrMi2GtOTXEY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUaQqxTFzKukvh5nEcqDejJIdu4ATMgAlxaah3uZ//PI46RFWH
 Sk+m2mOOW+7Muo3UE/LcqiuwTLTIBUHwfqPwoWv3sfzEheVCbqLWDJ7fxBEsQYo7g/WJCdWp7JG
 ARnMH
X-Gm-Gg: AZuq6aIx9PdxV1USBsWMOFLnxr/pJHYIxyjrVGqX1l1xVmAwPBEHzpOVnWfHUhj6lC2
 wPXaFaADZIyG02EGmGOJJcR5O8HLCTXl3oKqYFbeRg+XAwtpdOikbQsuJkjlDCtyD8vDHtKAFUW
 yuDTioKAmAepb+wq/qk0+MFuPT3NMLnYDwzhzDgUSiZtV1iWn1dO/Hk6DtXaGTYH32r4zcjGHah
 TnbZyNcm3vEwkv9NagXbBB6/3EcVfr6tAt/URD3C0ZXFEEYUHPbb1J0b217O30BgdRdehr4r8/H
 SBjhi+Hq5ml9w0Yct2xSHWBdvjwc5a2FOgmu8awnjFCYWFn17iiuamlWkOCUXBoY4CteKNgbEye
 +Yc3sq8qsSy4vgqNP5Fq1L7baYHfrkhahlVm3l4MhZFJJwvRpgM7M/cDnWliRophLv6JwSBAM21
 XaZeoie1L2sIqWXwMR
X-Received: by 2002:a05:6000:402a:b0:435:932e:f924 with SMTP id
 ffacd0b85a97d-435ea0645cemr2617818f8f.2.1769670840219; 
 Wed, 28 Jan 2026 23:14:00 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-435e10edfccsm11615181f8f.17.2026.01.28.23.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 23:13:59 -0800 (PST)
Date: Thu, 29 Jan 2026 08:13:58 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: deller@gmx.de, dri-devel@lists.freedesktop.org, 
 elfring@users.sourceforge.net, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] fbdev: au1100fb: Check return value of clk_enable()
 in .resume()
Message-ID: <u7a7owvizacghl3kpk5zxrf6iurmvvvjnjnzqa43xgafxcmb7x@jsihky4phvko>
References: <zytpnyodschvn4mmpllxp62yg3o77hjl7l5nyckoxyuvucjyaj@xsxbybnyzd44>
 <20260129040714.2772522-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gr4u2xptyrvtpzze"
Content-Disposition: inline
In-Reply-To: <20260129040714.2772522-1-nichen@iscas.ac.cn>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:nichen@iscas.ac.cn,m:deller@gmx.de,m:elfring@users.sourceforge.net,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de,lists.freedesktop.org,users.sourceforge.net,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,baylibre.com:email,iscas.ac.cn:email,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 63532AC7FA
X-Rspamd-Action: no action


--gr4u2xptyrvtpzze
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] fbdev: au1100fb: Check return value of clk_enable()
 in .resume()
MIME-Version: 1.0

On Thu, Jan 29, 2026 at 12:07:14PM +0800, Chen Ni wrote:
> Check the return value of clk_enable() in au1100fb_drv_resume() and
> return the error on failure.
> This ensures the system is aware of the resume failure and can track
> its state accurately.
>=20
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks
Uwe

--gr4u2xptyrvtpzze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAml7CLMACgkQj4D7WH0S
/k5VfwgAgl6ASoju2yK6n3drvTVNDpTdikzxleB+4wdtfFDsC3uG7oWJxnKy7uh/
7BkY+1OVaBrHr+epWZWjbuKWYv5zfsdlhNRDdk/Rp63pWOfONNpi8IhFZTvrpoq8
SjLKyuj2RaYAxZ5kzODKlqvrzT/gVHcqesU1vBoBbhq+peUqCbEvpHKSYEg6Kccv
Ni98EAvyupPogf4+HMdRUH2/qDkZbaLZsAQdwEJyNPwCfJ+LeyBWCqK4y1Xn10b3
WjCBJfPXice0NhsTFWg4ptCxH1xfPbBeFvWtPQ1YrnnvGvlvu07emABAqfyl197X
O0dXbeth4EtZiRBR0ggjPGbmXCpa4Q==
=eHUM
-----END PGP SIGNATURE-----

--gr4u2xptyrvtpzze--
