Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AACE03C5DFC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 16:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED6789C80;
	Mon, 12 Jul 2021 14:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F2689C82
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 14:09:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AB2C12215C;
 Mon, 12 Jul 2021 14:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626098996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=le2DW4lHcGMnbnFIKyPLL4mvjzcD3lY6gIoAqQT0KqQ=;
 b=MXEc0kNeHQVTX5PvVIH2Rw3cgmsovZ5ENguYOu2jejzAfXTPV69vv6pYVFS4erAAyfWTNI
 Qs9LgpnNj3SVEQMcsqaLg2+h9ADBeM/SbOJO+UTWiQyEebFV6b+V7UItsMaj6YAbPtb3F2
 C/Sdfa4GNd+htiDcJXkAHEVFMudolns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626098996;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=le2DW4lHcGMnbnFIKyPLL4mvjzcD3lY6gIoAqQT0KqQ=;
 b=wLYI3HfrTZwFe/HF9xAZmBCNVfeDCPJYgTZqb8WPzxDHsb16ZAH/dB+aqFnJwgLSW8bgpy
 RzNKw2WN+06k4ZBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 736D913AC4;
 Mon, 12 Jul 2021 14:09:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ht+xGjRN7GALdAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jul 2021 14:09:56 +0000
To: Sam Ravnborg <sam@ravnborg.org>
References: <20210705124515.27253-1-tzimmermann@suse.de>
 <20210705124515.27253-7-tzimmermann@suse.de> <YOlHBdXYeLtRga+k@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 06/12] drm/mgag200: Store values (not bits) in struct
 mgag200_pll_values
Message-ID: <b82e6ee2-00a3-e50c-8980-83896369fe45@suse.de>
Date: Mon, 12 Jul 2021 16:09:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOlHBdXYeLtRga+k@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="cGjQNM6dMKPUoDIdWAGKYobNXSjC2lazW"
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
Cc: John.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, emil.velikov@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cGjQNM6dMKPUoDIdWAGKYobNXSjC2lazW
Content-Type: multipart/mixed; boundary="OWqzniOZ7JfQZqOlnyhbQSiwDvjRye6Kx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, emil.velikov@collabora.com, John.p.donnelly@oracle.com,
 dri-devel@lists.freedesktop.org
Message-ID: <b82e6ee2-00a3-e50c-8980-83896369fe45@suse.de>
Subject: Re: [PATCH 06/12] drm/mgag200: Store values (not bits) in struct
 mgag200_pll_values
References: <20210705124515.27253-1-tzimmermann@suse.de>
 <20210705124515.27253-7-tzimmermann@suse.de> <YOlHBdXYeLtRga+k@ravnborg.org>
In-Reply-To: <YOlHBdXYeLtRga+k@ravnborg.org>

--OWqzniOZ7JfQZqOlnyhbQSiwDvjRye6Kx
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.07.21 um 09:06 schrieb Sam Ravnborg:
> Hi Thomas,
>=20
> On Mon, Jul 05, 2021 at 02:45:09PM +0200, Thomas Zimmermann wrote:
>> The fields in struct mgag200_pll_values currently hold the bits of
>> each register. Store the PLL values instead and let the PLL-update
>> code figure out the bits for each register.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> I gave up trying to follow the changes in this patch.

I cannot blame you.

> Also I was left with the impression that this was no win in readability=

> at it looks to me like changes with a high risk to introduce a
> hard-to-find bug.
> Your changelog did not justify why this change is a win, only what is
> does. But whatever works better for you I guess..

As I mention, struct mgag200_pll_values should store the PLL values. But =

the individual compute and set functions for each hardware revision mess =

this up completely. Sometimes they use 'function values' sometimes they=20
use 'register values'. If you'd try to debug a failed modeset operation=20
and have to look at the PLL, the stored values would be meaningless,=20
because there's simply no logic behind it.

The purpose of this patch is to make all compute functions store=20
function values in the struct and make all update function compute the=20
register values internally.

Do you think the change would be easier to understand if I change the=20
original _set_plls() functions *before* splitting them into compute and=20
update steps?

Best regards
Thomas

>=20
> 	Sam
>=20
>=20
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_mode.c | 153 +++++++++++++++--------=
--
>>   1 file changed, 91 insertions(+), 62 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/=
mgag200/mgag200_mode.c
>> index 9f6fe7673674..7d6707bd6c27 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -123,7 +123,7 @@ static int mgag200_compute_pixpll_values_g200(stru=
ct mga_device *mdev, long cloc
>>   	const int in_div_max =3D 6;
>>   	const int feed_div_min =3D 7;
>>   	const int feed_div_max =3D 127;
>> -	u8 testm, testn;
>> +	u8 testp, testm, testn;
>>   	u8 n =3D 0, m =3D 0, p, s;
>>   	long f_vco;
>>   	long computed;
>> @@ -141,10 +141,11 @@ static int mgag200_compute_pixpll_values_g200(st=
ruct mga_device *mdev, long cloc
>>   		clock =3D p_clk_min >> 3;
>>  =20
>>   	f_vco =3D clock;
>> -	for (p =3D 0;
>> -	     p <=3D post_div_max && f_vco < p_clk_min;
>> -	     p =3D (p << 1) + 1, f_vco <<=3D 1)
>> +	for (testp =3D 0;
>> +	     testp <=3D post_div_max && f_vco < p_clk_min;
>> +	     testp =3D (testp << 1) + 1, f_vco <<=3D 1)
>>   		;
>> +	p =3D testp + 1;
>>  =20
>>   	delta =3D clock;
>>  =20
>> @@ -157,12 +158,12 @@ static int mgag200_compute_pixpll_values_g200(st=
ruct mga_device *mdev, long cloc
>>   				tmp_delta =3D computed - f_vco;
>>   			if (tmp_delta < delta) {
>>   				delta =3D tmp_delta;
>> -				m =3D testm;
>> -				n =3D testn;
>> +				m =3D testm + 1;
>> +				n =3D testn + 1;
>>   			}
>>   		}
>>   	}
>> -	f_vco =3D ref_clk * (n + 1) / (m + 1);
>> +	f_vco =3D ref_clk * n / m;
>>   	if (f_vco < 100000)
>>   		s =3D 0;
>>   	else if (f_vco < 140000)
>> @@ -186,6 +187,7 @@ static int mgag200_compute_pixpll_values_g200(stru=
ct mga_device *mdev, long cloc
>>   static void mgag200_set_pixpll_g200(struct mga_device *mdev,
>>   				    const struct mgag200_pll_values *pixpllc)
>>   {
>> +	unsigned int pixpllcm, pixpllcn, pixpllcp, pixpllcs;
>>   	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp;
>>  =20
>>   	misc =3D RREG8(MGA_MISC_IN);
>> @@ -193,9 +195,14 @@ static void mgag200_set_pixpll_g200(struct mga_de=
vice *mdev,
>>   	misc |=3D MGAREG_MISC_CLK_SEL_MGA_MSK;
>>   	WREG8(MGA_MISC_OUT, misc);
>>  =20
>> -	xpixpllcm =3D pixpllc->m;
>> -	xpixpllcn =3D pixpllc->n;
>> -	xpixpllcp =3D pixpllc->p | (pixpllc->s << 3);
>> +	pixpllcm =3D pixpllc->m - 1;
>> +	pixpllcn =3D pixpllc->n - 1;
>> +	pixpllcp =3D pixpllc->p - 1;
>> +	pixpllcs =3D pixpllc->s;
>> +
>> +	xpixpllcm =3D pixpllcm;
>> +	xpixpllcn =3D pixpllcn;
>> +	xpixpllcp =3D (pixpllcs << 3) | pixpllcp;
>>   	WREG_DAC(MGA1064_PIX_PLLC_M, xpixpllcm);
>>   	WREG_DAC(MGA1064_PIX_PLLC_N, xpixpllcn);
>>   	WREG_DAC(MGA1064_PIX_PLLC_P, xpixpllcp);
>> @@ -240,9 +247,9 @@ static int mgag200_compute_pixpll_values_g200se(st=
ruct mga_device *mdev, long cl
>>   						tmpdelta =3D clock - computed;
>>   					if (tmpdelta < delta) {
>>   						delta =3D tmpdelta;
>> -						m =3D testm - 1;
>> -						n =3D testn - 1;
>> -						p =3D testp - 1;
>> +						m =3D testm;
>> +						n =3D testn;
>> +						p =3D testp;
>>   					}
>>   				}
>>   			}
>> @@ -280,22 +287,19 @@ static int mgag200_compute_pixpll_values_g200se(=
struct mga_device *mdev, long cl
>>  =20
>>   					if (tmpdelta < delta) {
>>   						delta =3D tmpdelta;
>> -						m =3D testm - 1;
>> -						n =3D testn - 1;
>> -						p =3D testp - 1;
>> +						m =3D testm;
>> +						n =3D testn;
>> +						p =3D testp;
>>   					}
>>   				}
>>   			}
>>   		}
>>  =20
>> -		fvv =3D pllreffreq * (n + 1) / (m + 1);
>> +		fvv =3D pllreffreq * n / m;
>>   		fvv =3D (fvv - 800000) / 50000;
>> -
>>   		if (fvv > 15)
>>   			fvv =3D 15;
>> -
>> -		p |=3D (fvv << 4);
>> -		m |=3D 0x80;
>> +		s =3D fvv << 1;
>>  =20
>>   		clock =3D clock / 2;
>>   	}
>> @@ -317,6 +321,7 @@ static void mgag200_set_pixpll_g200se(struct mga_d=
evice *mdev,
>>   				      const struct mgag200_pll_values *pixpllc)
>>   {
>>   	u32 unique_rev_id =3D mdev->model.g200se.unique_rev_id;
>> +	unsigned int pixpllcm, pixpllcn, pixpllcp, pixpllcs;
>>   	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp;
>>  =20
>>   	misc =3D RREG8(MGA_MISC_IN);
>> @@ -324,9 +329,14 @@ static void mgag200_set_pixpll_g200se(struct mga_=
device *mdev,
>>   	misc |=3D MGAREG_MISC_CLK_SEL_MGA_MSK;
>>   	WREG8(MGA_MISC_OUT, misc);
>>  =20
>> -	xpixpllcm =3D pixpllc->m;
>> -	xpixpllcn =3D pixpllc->n;
>> -	xpixpllcp =3D pixpllc->p | (pixpllc->s << 3);
>> +	pixpllcm =3D pixpllc->m - 1;
>> +	pixpllcn =3D pixpllc->n - 1;
>> +	pixpllcp =3D pixpllc->p - 1;
>> +	pixpllcs =3D pixpllc->s;
>> +
>> +	xpixpllcm =3D pixpllcm | ((pixpllcn & BIT(8)) >> 1);
>> +	xpixpllcn =3D pixpllcn;
>> +	xpixpllcp =3D (pixpllcs << 3) | pixpllcp;
>>   	WREG_DAC(MGA1064_PIX_PLLC_M, xpixpllcm);
>>   	WREG_DAC(MGA1064_PIX_PLLC_N, xpixpllcn);
>>   	WREG_DAC(MGA1064_PIX_PLLC_P, xpixpllcp);
>> @@ -352,7 +362,6 @@ static int mgag200_compute_pixpll_values_g200wb(st=
ruct mga_device *mdev, long cl
>>   	delta =3D 0xffffffff;
>>  =20
>>   	if (mdev->type =3D=3D G200_EW3) {
>> -
>>   		vcomax =3D 800000;
>>   		vcomin =3D 400000;
>>   		pllreffreq =3D 25000;
>> @@ -375,19 +384,16 @@ static int mgag200_compute_pixpll_values_g200wb(=
struct mga_device *mdev, long cl
>>   							tmpdelta =3D clock - computed;
>>   						if (tmpdelta < delta) {
>>   							delta =3D tmpdelta;
>> -							m =3D ((testn & 0x100) >> 1) |
>> -								(testm);
>> -							n =3D (testn & 0xFF);
>> -							p =3D ((testn & 0x600) >> 3) |
>> -								(testp2 << 3) |
>> -								(testp);
>> +							m =3D testm + 1;
>> +							n =3D testn + 1;
>> +							p =3D testp + 1;
>> +							s =3D testp2;
>>   						}
>>   					}
>>   				}
>>   			}
>>   		}
>>   	} else {
>> -
>>   		vcomax =3D 550000;
>>   		vcomin =3D 150000;
>>   		pllreffreq =3D 48000;
>> @@ -408,10 +414,10 @@ static int mgag200_compute_pixpll_values_g200wb(=
struct mga_device *mdev, long cl
>>   						tmpdelta =3D clock - computed;
>>   					if (tmpdelta < delta) {
>>   						delta =3D tmpdelta;
>> -						n =3D testn - 1;
>> -						m =3D (testm - 1) |
>> -							((n >> 1) & 0x80);
>> -						p =3D testp - 1;
>> +						n =3D testn;
>> +						m =3D testm;
>> +						p =3D testp;
>> +						s =3D 0;
>>   					}
>>   				}
>>   			}
>> @@ -429,6 +435,7 @@ static int mgag200_compute_pixpll_values_g200wb(st=
ruct mga_device *mdev, long cl
>>   static void mgag200_set_pixpll_g200wb(struct mga_device *mdev,
>>   				      const struct mgag200_pll_values *pixpllc)
>>   {
>> +	unsigned int pixpllcm, pixpllcn, pixpllcp, pixpllcs;
>>   	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp, tmp;
>>   	int i, j, tmpcount, vcount;
>>   	bool pll_locked =3D false;
>> @@ -438,9 +445,14 @@ static void mgag200_set_pixpll_g200wb(struct mga_=
device *mdev,
>>   	misc |=3D MGAREG_MISC_CLK_SEL_MGA_MSK;
>>   	WREG8(MGA_MISC_OUT, misc);
>>  =20
>> -	xpixpllcm =3D pixpllc->m;
>> -	xpixpllcn =3D pixpllc->n;
>> -	xpixpllcp =3D pixpllc->p | (pixpllc->s << 3);
>> +	pixpllcm =3D pixpllc->m - 1;
>> +	pixpllcn =3D pixpllc->n - 1;
>> +	pixpllcp =3D pixpllc->p - 1;
>> +	pixpllcs =3D pixpllc->s;
>> +
>> +	xpixpllcm =3D ((pixpllcn & BIT(8)) >> 1) | pixpllcm;
>> +	xpixpllcn =3D pixpllcn;
>> +	xpixpllcp =3D ((pixpllcn & GENMASK(10, 9)) >> 3) | (pixpllcs << 3) |=
 pixpllcp;
>>  =20
>>   	for (i =3D 0; i <=3D 32 && pll_locked =3D=3D false; i++) {
>>   		if (i > 0) {
>> @@ -571,9 +583,9 @@ static int mgag200_compute_pixpll_values_g200ev(st=
ruct mga_device *mdev, long cl
>>   					tmpdelta =3D clock - computed;
>>   				if (tmpdelta < delta) {
>>   					delta =3D tmpdelta;
>> -					n =3D testn - 1;
>> -					m =3D testm - 1;
>> -					p =3D testp - 1;
>> +					n =3D testn;
>> +					m =3D testm;
>> +					p =3D testp;
>>   				}
>>   			}
>>   		}
>> @@ -590,6 +602,7 @@ static int mgag200_compute_pixpll_values_g200ev(st=
ruct mga_device *mdev, long cl
>>   static void mgag200_set_pixpll_g200ev(struct mga_device *mdev,
>>   				      const struct mgag200_pll_values *pixpllc)
>>   {
>> +	unsigned int pixpllcm, pixpllcn, pixpllcp, pixpllcs;
>>   	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp, tmp;
>>  =20
>>   	misc =3D RREG8(MGA_MISC_IN);
>> @@ -597,9 +610,14 @@ static void mgag200_set_pixpll_g200ev(struct mga_=
device *mdev,
>>   	misc |=3D MGAREG_MISC_CLK_SEL_MGA_MSK;
>>   	WREG8(MGA_MISC_OUT, misc);
>>  =20
>> -	xpixpllcm =3D pixpllc->m;
>> -	xpixpllcn =3D pixpllc->n;
>> -	xpixpllcp =3D pixpllc->p | (pixpllc->s << 3);
>> +	pixpllcm =3D pixpllc->m - 1;
>> +	pixpllcn =3D pixpllc->n - 1;
>> +	pixpllcp =3D pixpllc->p - 1;
>> +	pixpllcs =3D pixpllc->s;
>> +
>> +	xpixpllcm =3D pixpllcm;
>> +	xpixpllcn =3D pixpllcn;
>> +	xpixpllcp =3D (pixpllcs << 3) | pixpllcp;
>>  =20
>>   	WREG8(DAC_INDEX, MGA1064_PIX_CLK_CTL);
>>   	tmp =3D RREG8(DAC_DATA);
>> @@ -685,9 +703,9 @@ static int mgag200_compute_pixpll_values_g200eh(st=
ruct mga_device *mdev, long cl
>>   					tmpdelta =3D clock - computed;
>>   				if (tmpdelta < delta) {
>>   					delta =3D tmpdelta;
>> -					n =3D testn;
>> -					m =3D testm;
>> -					p =3D testp;
>> +					n =3D testn + 1;
>> +					m =3D testm + 1;
>> +					p =3D testp + 1;
>>   				}
>>   				if (delta =3D=3D 0)
>>   					break;
>> @@ -719,12 +737,10 @@ static int mgag200_compute_pixpll_values_g200eh(=
struct mga_device *mdev, long cl
>>   						tmpdelta =3D clock - computed;
>>   					if (tmpdelta < delta) {
>>   						delta =3D tmpdelta;
>> -						n =3D testn - 1;
>> -						m =3D (testm - 1);
>> -						p =3D testp - 1;
>> +						n =3D testn;
>> +						m =3D testm;
>> +						p =3D testp;
>>   					}
>> -					if ((clock * testp) >=3D 600000)
>> -						p |=3D 0x80;
>>   				}
>>   			}
>>   		}
>> @@ -741,6 +757,7 @@ static int mgag200_compute_pixpll_values_g200eh(st=
ruct mga_device *mdev, long cl
>>   static void mgag200_set_pixpll_g200eh(struct mga_device *mdev,
>>   				      const struct mgag200_pll_values *pixpllc)
>>   {
>> +	unsigned int pixpllcm, pixpllcn, pixpllcp, pixpllcs;
>>   	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp, tmp;
>>   	int i, j, tmpcount, vcount;
>>   	bool pll_locked =3D false;
>> @@ -750,9 +767,14 @@ static void mgag200_set_pixpll_g200eh(struct mga_=
device *mdev,
>>   	misc |=3D MGAREG_MISC_CLK_SEL_MGA_MSK;
>>   	WREG8(MGA_MISC_OUT, misc);
>>  =20
>> -	xpixpllcm =3D pixpllc->m;
>> -	xpixpllcn =3D pixpllc->n;
>> -	xpixpllcp =3D pixpllc->p | (pixpllc->s << 3);
>> +	pixpllcm =3D pixpllc->m - 1;
>> +	pixpllcn =3D pixpllc->n - 1;
>> +	pixpllcp =3D pixpllc->p - 1;
>> +	pixpllcs =3D pixpllc->s;
>> +
>> +	xpixpllcm =3D ((pixpllcn & BIT(8)) >> 1) | pixpllcm;
>> +	xpixpllcn =3D pixpllcn;
>> +	xpixpllcp =3D (pixpllcs << 3) | pixpllcp;
>>  =20
>>   	for (i =3D 0; i <=3D 32 && pll_locked =3D=3D false; i++) {
>>   		WREG8(DAC_INDEX, MGA1064_PIX_CLK_CTL);
>> @@ -843,9 +865,10 @@ static int mgag200_compute_pixpll_values_g200er(s=
truct mga_device *mdev, long cl
>>   						tmpdelta =3D clock - computed;
>>   					if (tmpdelta < delta) {
>>   						delta =3D tmpdelta;
>> -						m =3D testm | (testo << 3);
>> -						n =3D testn;
>> -						p =3D testr | (testr << 3);
>> +						m =3D (testm | (testo << 3)) + 1;
>> +						n =3D testn + 1;
>> +						p =3D testr + 1;
>> +						s =3D testr;
>>   					}
>>   				}
>>   			}
>> @@ -863,6 +886,7 @@ static int mgag200_compute_pixpll_values_g200er(st=
ruct mga_device *mdev, long cl
>>   static void mgag200_set_pixpll_g200er(struct mga_device *mdev,
>>   				      const struct mgag200_pll_values *pixpllc)
>>   {
>> +	unsigned int pixpllcm, pixpllcn, pixpllcp, pixpllcs;
>>   	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp, tmp;
>>  =20
>>   	misc =3D RREG8(MGA_MISC_IN);
>> @@ -870,9 +894,14 @@ static void mgag200_set_pixpll_g200er(struct mga_=
device *mdev,
>>   	misc |=3D MGAREG_MISC_CLK_SEL_MGA_MSK;
>>   	WREG8(MGA_MISC_OUT, misc);
>>  =20
>> -	xpixpllcm =3D pixpllc->m;
>> -	xpixpllcn =3D pixpllc->n;
>> -	xpixpllcp =3D pixpllc->p | (pixpllc->s << 3);
>> +	pixpllcm =3D pixpllc->m - 1;
>> +	pixpllcn =3D pixpllc->n - 1;
>> +	pixpllcp =3D pixpllc->p - 1;
>> +	pixpllcs =3D pixpllc->s;
>> +
>> +	xpixpllcm =3D pixpllcm;
>> +	xpixpllcn =3D pixpllcn;
>> +	xpixpllcp =3D (pixpllcs << 3) | pixpllcp;
>>  =20
>>   	WREG8(DAC_INDEX, MGA1064_PIX_CLK_CTL);
>>   	tmp =3D RREG8(DAC_DATA);
>> --=20
>> 2.32.0

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--OWqzniOZ7JfQZqOlnyhbQSiwDvjRye6Kx--

--cGjQNM6dMKPUoDIdWAGKYobNXSjC2lazW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDsTTMFAwAAAAAACgkQlh/E3EQov+Cl
yBAAz+e8dMYdcfLQj21V/Bo5LtDsnB+WB/MIH+dE4q8oE0umyWs/GeWcosdmwE/5hkWduqAXte4T
75GE6C7U+Vvm+5+7Ie5sjyalTyzMSX57WXstgAOM9sjP/02iDyqmEE8mqORBMTCPq/ephDV/J4po
mDUwHyqwtWgDvTB5GDt3Pqb8lGKJxT7XD0UDnY3EeDo8z3qIRs1LENSzt+QHi0nATn+kju3sUmZO
9MLZDCV6A+776whZK3PV32zsrNNyQWa0DL7aa9NeLO4j0YGcU0Kdq+gfx6/czA7Y3vUqrcB6TUE2
/uBuswHCEWmoxy7OOQ6gX7a3CMCAg/KtwXar38DQuRI/us5xNFdR9RY16JGqC5vpGQqzwuEHE0rz
7TCgcLueqnHATvL8Z/RNAh+I42KNFFbX5fSwgUpMwV84d0Yc8WvYKsFtcXpuCFJdEWLZkeYW6csF
3v16WTcK/eWsdHUevhZbu1Sz2nYwWJ27yuEKNb5Af0PL6aIxx1WOdB9V0ogq3KonbNQRMdrLlVC2
8QMxOXWdPDVFvqiEPCTYqvtvHpLHp4LyL/kQBiviwV6c/ERZATpRqi5N33ulfuQowc7MEHF9Fl8g
+/oZ91W6sFpW5qrgR7fcgcK+zPsUHsIj2lOJyR1x9h2jYqWQhebnEcn+tFnWStZylYit8JtQJvtp
CeM=
=Lj2X
-----END PGP SIGNATURE-----

--cGjQNM6dMKPUoDIdWAGKYobNXSjC2lazW--
