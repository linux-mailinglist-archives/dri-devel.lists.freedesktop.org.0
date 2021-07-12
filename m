Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D613C5DEA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 16:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6597389885;
	Mon, 12 Jul 2021 14:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F9389885
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 14:03:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4D2091FF97;
 Mon, 12 Jul 2021 14:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626098583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PsFZaYifnFtIvpnNNftokWb2NduEdAHI2gvea6DKDQ0=;
 b=re+PmH3TF/flKgXqCfvuF4jB3uvbLNSiD6Vv4wEmChh0eJKv3k8QKhDN7m8qhRoVFU1xiI
 V5EEId+ajwOT4PmZerkmKSwUqLPImfYLTPubwV/BhhC5clHF+/vQVWmEMbdvQ2HfOHqKpP
 AVdZv2Dp4PKi6LHDcmhvQovH2xLlm2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626098583;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PsFZaYifnFtIvpnNNftokWb2NduEdAHI2gvea6DKDQ0=;
 b=OY0IZ7R+XRNUu1ASvmmE/h7HNeyT86OnbFQK4UUg2+8vI5pHgZVhJcoNlZbW8vsb5cTUio
 Hk/IIL+zKrk8NiBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 04AF713AC4;
 Mon, 12 Jul 2021 14:03:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vpLbOpZL7GA7cgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jul 2021 14:03:02 +0000
To: Sam Ravnborg <sam@ravnborg.org>
References: <20210705124515.27253-1-tzimmermann@suse.de>
 <20210705124515.27253-5-tzimmermann@suse.de> <YOifo/8ZaSYAzIc1@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 04/12] drm/mgag200: Split PLL setup into compute and
 update functions
Message-ID: <1aab4438-2b3c-679b-3fb7-9dae5097a5ae@suse.de>
Date: Mon, 12 Jul 2021 16:03:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOifo/8ZaSYAzIc1@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ujFuiWPuZtQTTe3tWinHdaDsdiwYG827w"
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
--ujFuiWPuZtQTTe3tWinHdaDsdiwYG827w
Content-Type: multipart/mixed; boundary="AtF1mTfC4qHo1Ib4f9o3Qj4ZdyRikGzmY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, emil.velikov@collabora.com, John.p.donnelly@oracle.com,
 dri-devel@lists.freedesktop.org
Message-ID: <1aab4438-2b3c-679b-3fb7-9dae5097a5ae@suse.de>
Subject: Re: [PATCH 04/12] drm/mgag200: Split PLL setup into compute and
 update functions
References: <20210705124515.27253-1-tzimmermann@suse.de>
 <20210705124515.27253-5-tzimmermann@suse.de> <YOifo/8ZaSYAzIc1@ravnborg.org>
In-Reply-To: <YOifo/8ZaSYAzIc1@ravnborg.org>

--AtF1mTfC4qHo1Ib4f9o3Qj4ZdyRikGzmY
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.07.21 um 21:12 schrieb Sam Ravnborg:
> Ho Thomas,
>=20
> On Mon, Jul 05, 2021 at 02:45:07PM +0200, Thomas Zimmermann wrote:
>> The _set_plls() functions compute a pixel clock's PLL values
>> and program the hardware accordingly. This happens during atomic
>> commits.
>>
>> For atomic modesetting, it's better to separate computation and
>> programming from each other. This will allow to compute the PLL
>> value during atomic checks and catch unsupported modes early.
>>
>> Split the PLL setup into a compute and a update functions, and
>> call them one after the other. Computed PLL values are store in
>> struct mgag200_pll_values. No functional changes.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_drv.h  |  17 ++
>>   drivers/gpu/drm/mgag200/mgag200_mode.c | 234 +++++++++++++++++++----=
--
>>   2 files changed, 196 insertions(+), 55 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/m=
gag200/mgag200_drv.h
>> index f7a0537c0d0a..fca3904fde0c 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> @@ -110,6 +110,23 @@
>>   #define MGAG200_MAX_FB_HEIGHT 4096
>>   #define MGAG200_MAX_FB_WIDTH 4096
>>  =20
>> +/*
>> + * Stores parameters for programming the PLLs
>> + *
>> + * Fref: reference frequency (A: 25.175 Mhz, B: 28.361, C: XX Mhz)
>> + * Fo: output frequency
>> + * Fvco =3D Fref * (N / M)
>> + * Fo =3D Fvco / P
>> + *
>> + * S =3D [0..3]
>> + */
>> +struct mgag200_pll_values {
>> +	unsigned int m;
> Why not u8?
>> +	unsigned int n;
> Why not u8?
>> +	unsigned int p;
> Why not u8?
>> +	unsigned int s;
>> +};

First of all, thanks for going through these changes. The current code=20
is nightmarish. So patch 4 and later is where the fun happens. :)

These fields are supposed to be values as used by the function that=20
controls the PLL's output frequency; so they are unsigned int. u8 would=20
be for in-register values; which can be different.

The MGA manual explains how to program this.

=20
https://manualzz.com/viewer_next/web/manual?file=3D%2F%2Fs3p.manualzz.com=
%2Fstore%2Fdata%2F024667257.pdf%3Fk%3DEwAAAXqa--YRAAACWCABFrit5RcAiDXxvUV=
Lzg4j6q39p78ki8fJxGpPn7F6&img=3D%2F%2Fs3.manualzz.com%2Fstore%2Fdata%2F02=
4667257_1-acc0a233d724738660be61a3ba8e1135&ads=3Dtrue#G10.1092838

Apparently, there's one way of doing this. And still each hardware=20
revision manages to require it's own code.


>> +
>>   #define to_mga_connector(x) container_of(x, struct mga_connector, ba=
se)
>>  =20
>>   struct mga_i2c_chan {
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/=
mgag200/mgag200_mode.c
>> index fa06f1994d68..961bd128fea3 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -114,7 +114,8 @@ static inline void mga_wait_busy(struct mga_device=
 *mdev)
>>    * PLL setup
>>    */
>>  =20
>> -static int mgag200_g200_set_plls(struct mga_device *mdev, long clock)=

>> +static int mgag200_compute_pixpll_values_g200(struct mga_device *mdev=
, long clock,
>> +					      struct mgag200_pll_values *pixpllc)
>>   {
>>   	struct drm_device *dev =3D &mdev->base;
>>   	const int post_div_max =3D 7;
>> @@ -130,7 +131,6 @@ static int mgag200_g200_set_plls(struct mga_device=
 *mdev, long clock)
>>   	long ref_clk =3D mdev->model.g200.ref_clk;
>>   	long p_clk_min =3D mdev->model.g200.pclk_min;
>>   	long p_clk_max =3D  mdev->model.g200.pclk_max;
>> -	u8 misc;
>>  =20
>>   	if (clock > p_clk_max) {
>>   		drm_err(dev, "Pixel Clock %ld too high\n", clock);
>> @@ -175,19 +175,34 @@ static int mgag200_g200_set_plls(struct mga_devi=
ce *mdev, long clock)
>>   	drm_dbg_kms(dev, "clock: %ld vco: %ld m: %d n: %d p: %d s: %d\n",
>>   		    clock, f_vco, m, n, p, s);
>>  =20
>> +	pixpllc->m =3D m;
>> +	pixpllc->n =3D n;
>> +	pixpllc->p =3D p;
>> +	pixpllc->s =3D s;
>> +
>> +	return 0;
>> +}
>> +
>> +static void mgag200_set_pixpll_g200(struct mga_device *mdev,
>> +				    const struct mgag200_pll_values *pixpllc)
>> +{
>> +	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp;
> Strange names, but whatever.

Those are the names of the registers; as used in the MGA manual. I try=20
to use official names wherever possible. Others can then read the code=20
and grep the register manual for the names.

Note that xpixpllcp stores p and s; so it's not a 1-1 relationship with=20
the values in struct mageg200_pll_values.

>> +
>>   	misc =3D RREG8(MGA_MISC_IN);
>>   	misc &=3D ~MGAREG_MISC_CLK_SEL_MASK;
>>   	misc |=3D MGAREG_MISC_CLK_SEL_MGA_MSK;
>>   	WREG8(MGA_MISC_OUT, misc);
>>  =20
>> -	WREG_DAC(MGA1064_PIX_PLLC_M, m);
>> -	WREG_DAC(MGA1064_PIX_PLLC_N, n);
>> -	WREG_DAC(MGA1064_PIX_PLLC_P, (p | (s << 3)));
>> -
>> -	return 0;
>> +	xpixpllcm =3D pixpllc->m;
>> +	xpixpllcn =3D pixpllc->n;
>> +	xpixpllcp =3D pixpllc->p | (pixpllc->s << 3);
>> +	WREG_DAC(MGA1064_PIX_PLLC_M, xpixpllcm);
>> +	WREG_DAC(MGA1064_PIX_PLLC_N, xpixpllcn);
>> +	WREG_DAC(MGA1064_PIX_PLLC_P, xpixpllcp);
>=20
> I cannot see why this code does not look like this:
> 	WREG_DAC(MGA1064_PIX_PLLC_M, pixpllc->m);
> 	WREG_DAC(MGA1064_PIX_PLLC_N, pixpllc->n);
> 	WREG_DAC(MGA1064_PIX_PLLC_P, pixpllc->p | (pixpllc->s << 3));

Readability for the reviewer. :) And I usually prefer to compute a=20
register's value in one statement, and read/write the register in=20
separate statements. I hope this isn't too much of an issue.

>=20
>=20
> Same goes for all the functions in the following.
>=20
>>   }
>>  =20
>> -static int mga_g200se_set_plls(struct mga_device *mdev, long clock)
>> +static int mgag200_compute_pixpll_values_g200se(struct mga_device *md=
ev, long clock,
>> +						struct mgag200_pll_values *pixpllc)
>>   {
>>   	static const unsigned int pvalues_e4[] =3D {16, 14, 12, 10, 8, 6, 4=
, 2, 1};
>>  =20
>> @@ -199,7 +214,6 @@ static int mga_g200se_set_plls(struct mga_device *=
mdev, long clock)
>>   	unsigned int computed;
>>   	unsigned int fvv;
>>   	unsigned int i;
>> -	u8 misc;
>>  =20
>>   	if (unique_rev_id <=3D 0x03) {
>>  =20
>> @@ -295,35 +309,47 @@ static int mga_g200se_set_plls(struct mga_device=
 *mdev, long clock)
>>   		return -EINVAL;
>>   	}
>>  =20
>> +	pixpllc->m =3D m;
>> +	pixpllc->n =3D n;
>> +	pixpllc->p =3D p;
>> +	pixpllc->s =3D 0;
>> +
>> +	return 0;
>> +}
>> +
>> +static void mgag200_set_pixpll_g200se(struct mga_device *mdev,
>> +				      const struct mgag200_pll_values *pixpllc)
>> +{
>> +	u32 unique_rev_id =3D mdev->model.g200se.unique_rev_id;
>> +	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp;
>> +
>>   	misc =3D RREG8(MGA_MISC_IN);
>>   	misc &=3D ~MGAREG_MISC_CLK_SEL_MASK;
>>   	misc |=3D MGAREG_MISC_CLK_SEL_MGA_MSK;
>>   	WREG8(MGA_MISC_OUT, misc);
>>  =20
>> -	WREG_DAC(MGA1064_PIX_PLLC_M, m);
>> -	WREG_DAC(MGA1064_PIX_PLLC_N, n);
>> -	WREG_DAC(MGA1064_PIX_PLLC_P, p);
>> +	xpixpllcm =3D pixpllc->m;
>> +	xpixpllcn =3D pixpllc->n;
>> +	xpixpllcp =3D pixpllc->p | (pixpllc->s << 3);
> The "(pixpllc->s << 3)" look like a copy error. No harm as s is 0 but
> confusing.

I mentioned this above. xpixpllcp stores both, p and s. Here and below.

>=20
>=20
>> +	WREG_DAC(MGA1064_PIX_PLLC_M, xpixpllcm);
>> +	WREG_DAC(MGA1064_PIX_PLLC_N, xpixpllcn);
>> +	WREG_DAC(MGA1064_PIX_PLLC_P, xpixpllcp);
>>  =20
>>   	if (unique_rev_id >=3D 0x04) {
>>   		WREG_DAC(0x1a, 0x09);
>>   		msleep(20);
>>   		WREG_DAC(0x1a, 0x01);
>> -
>>   	}
>> -
>> -	return 0;
>>   }
>>  =20
>> -static int mga_g200wb_set_plls(struct mga_device *mdev, long clock)
>> +static int mgag200_compute_pixpll_values_g200wb(struct mga_device *md=
ev, long clock,
>> +						struct mgag200_pll_values *pixpllc)
>>   {
>>   	unsigned int vcomax, vcomin, pllreffreq;
>>   	unsigned int delta, tmpdelta;
>>   	unsigned int testp, testm, testn, testp2;
>>   	unsigned int p, m, n;
>>   	unsigned int computed;
>> -	int i, j, tmpcount, vcount;
>> -	bool pll_locked =3D false;
>> -	u8 tmp, misc;
>>  =20
>>   	m =3D n =3D p =3D 0;
>>  =20
>> @@ -396,11 +422,30 @@ static int mga_g200wb_set_plls(struct mga_device=
 *mdev, long clock)
>>   		}
>>   	}
>>  =20
>> +	pixpllc->m =3D m;
>> +	pixpllc->n =3D n;
>> +	pixpllc->p =3D p;
>> +	pixpllc->s =3D 0;
>> +
>> +	return 0;
>> +}
>> +
>> +static void mgag200_set_pixpll_g200wb(struct mga_device *mdev,
>> +				      const struct mgag200_pll_values *pixpllc)
>> +{
>> +	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp, tmp;
>> +	int i, j, tmpcount, vcount;
>> +	bool pll_locked =3D false;
>> +
>>   	misc =3D RREG8(MGA_MISC_IN);
>>   	misc &=3D ~MGAREG_MISC_CLK_SEL_MASK;
>>   	misc |=3D MGAREG_MISC_CLK_SEL_MGA_MSK;
>>   	WREG8(MGA_MISC_OUT, misc);
>>  =20
>> +	xpixpllcm =3D pixpllc->m;
>> +	xpixpllcn =3D pixpllc->n;
>> +	xpixpllcp =3D pixpllc->p | (pixpllc->s << 3);
> The (pixpllc->s << 3) looks wrong here too.
>=20
>> +
>>   	for (i =3D 0; i <=3D 32 && pll_locked =3D=3D false; i++) {
>>   		if (i > 0) {
>>   			WREG8(MGAREG_CRTC_INDEX, 0x1e);
>> @@ -441,9 +486,9 @@ static int mga_g200wb_set_plls(struct mga_device *=
mdev, long clock)
>>   		udelay(50);
>>  =20
>>   		/* program pixel pll register */
>> -		WREG_DAC(MGA1064_WB_PIX_PLLC_N, n);
>> -		WREG_DAC(MGA1064_WB_PIX_PLLC_M, m);
>> -		WREG_DAC(MGA1064_WB_PIX_PLLC_P, p);
>> +		WREG_DAC(MGA1064_PIX_PLLC_N, xpixpllcn);
>> +		WREG_DAC(MGA1064_PIX_PLLC_M, xpixpllcm);
>> +		WREG_DAC(MGA1064_PIX_PLLC_P, xpixpllcp);
>>  =20
>>   		udelay(50);
>>  =20
>> @@ -491,21 +536,21 @@ static int mga_g200wb_set_plls(struct mga_device=
 *mdev, long clock)
>>   				udelay(5);
>>   		}
>>   	}
>> +
>>   	WREG8(DAC_INDEX, MGA1064_REMHEADCTL);
>>   	tmp =3D RREG8(DAC_DATA);
>>   	tmp &=3D ~MGA1064_REMHEADCTL_CLKDIS;
>>   	WREG_DAC(MGA1064_REMHEADCTL, tmp);
>> -	return 0;
>>   }
>>  =20
>> -static int mga_g200ev_set_plls(struct mga_device *mdev, long clock)
>> +static int mgag200_compute_pixpll_values_g200ev(struct mga_device *md=
ev, long clock,
>> +						struct mgag200_pll_values *pixpllc)
>>   {
>>   	unsigned int vcomax, vcomin, pllreffreq;
>>   	unsigned int delta, tmpdelta;
>>   	unsigned int testp, testm, testn;
>>   	unsigned int p, m, n;
>>   	unsigned int computed;
>> -	u8 tmp, misc;
>>  =20
>>   	m =3D n =3D p =3D 0;
>>   	vcomax =3D 550000;
>> @@ -538,11 +583,28 @@ static int mga_g200ev_set_plls(struct mga_device=
 *mdev, long clock)
>>   		}
>>   	}
>>  =20
>> +	pixpllc->m =3D m;
>> +	pixpllc->n =3D n;
>> +	pixpllc->p =3D p;
>> +	pixpllc->s =3D 0;
>> +
>> +	return 0;
>> +}
>> +
>> +static void mgag200_set_pixpll_g200ev(struct mga_device *mdev,
>> +				      const struct mgag200_pll_values *pixpllc)
>> +{
>> +	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp, tmp;
>> +
>>   	misc =3D RREG8(MGA_MISC_IN);
>>   	misc &=3D ~MGAREG_MISC_CLK_SEL_MASK;
>>   	misc |=3D MGAREG_MISC_CLK_SEL_MGA_MSK;
>>   	WREG8(MGA_MISC_OUT, misc);
>>  =20
>> +	xpixpllcm =3D pixpllc->m;
>> +	xpixpllcn =3D pixpllc->n;
>> +	xpixpllcp =3D pixpllc->p | (pixpllc->s << 3);
>> +
>>   	WREG8(DAC_INDEX, MGA1064_PIX_CLK_CTL);
>>   	tmp =3D RREG8(DAC_DATA);
>>   	tmp |=3D MGA1064_PIX_CLK_CTL_CLK_DIS;
>> @@ -561,9 +623,9 @@ static int mga_g200ev_set_plls(struct mga_device *=
mdev, long clock)
>>   	tmp |=3D MGA1064_PIX_CLK_CTL_CLK_POW_DOWN;
>>   	WREG8(DAC_DATA, tmp);
>>  =20
>> -	WREG_DAC(MGA1064_EV_PIX_PLLC_M, m);
>> -	WREG_DAC(MGA1064_EV_PIX_PLLC_N, n);
>> -	WREG_DAC(MGA1064_EV_PIX_PLLC_P, p);
>> +	WREG_DAC(MGA1064_EV_PIX_PLLC_M, xpixpllcm);
>> +	WREG_DAC(MGA1064_EV_PIX_PLLC_N, xpixpllcn);
>> +	WREG_DAC(MGA1064_EV_PIX_PLLC_P, xpixpllcp);
>>  =20
>>   	udelay(50);
>>  =20
>> @@ -592,20 +654,16 @@ static int mga_g200ev_set_plls(struct mga_device=
 *mdev, long clock)
>>   	tmp =3D RREG8(DAC_DATA);
>>   	tmp &=3D ~MGA1064_PIX_CLK_CTL_CLK_DIS;
>>   	WREG8(DAC_DATA, tmp);
>> -
>> -	return 0;
>>   }
>>  =20
>> -static int mga_g200eh_set_plls(struct mga_device *mdev, long clock)
>> +static int mgag200_compute_pixpll_values_g200eh(struct mga_device *md=
ev, long clock,
>> +						struct mgag200_pll_values *pixpllc)
>>   {
>>   	unsigned int vcomax, vcomin, pllreffreq;
>>   	unsigned int delta, tmpdelta;
>>   	unsigned int testp, testm, testn;
>>   	unsigned int p, m, n;
>>   	unsigned int computed;
>> -	int i, j, tmpcount, vcount;
>> -	u8 tmp, misc;
>> -	bool pll_locked =3D false;
>>  =20
>>   	m =3D n =3D p =3D 0;
>>  =20
>> @@ -676,11 +734,30 @@ static int mga_g200eh_set_plls(struct mga_device=
 *mdev, long clock)
>>   		}
>>   	}
>>  =20
>> +	pixpllc->m =3D m;
>> +	pixpllc->n =3D n;
>> +	pixpllc->p =3D p;
>> +	pixpllc->s =3D 0;
>> +
>> +	return 0;
>> +}
>> +
>> +static void mgag200_set_pixpll_g200eh(struct mga_device *mdev,
>> +				      const struct mgag200_pll_values *pixpllc)
>> +{
>> +	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp, tmp;
>> +	int i, j, tmpcount, vcount;
>> +	bool pll_locked =3D false;
>> +
>>   	misc =3D RREG8(MGA_MISC_IN);
>>   	misc &=3D ~MGAREG_MISC_CLK_SEL_MASK;
>>   	misc |=3D MGAREG_MISC_CLK_SEL_MGA_MSK;
>>   	WREG8(MGA_MISC_OUT, misc);
>>  =20
>> +	xpixpllcm =3D pixpllc->m;
>> +	xpixpllcn =3D pixpllc->n;
>> +	xpixpllcp =3D pixpllc->p | (pixpllc->s << 3);
> Again (pixpllc->s << 3)
>> +
>>   	for (i =3D 0; i <=3D 32 && pll_locked =3D=3D false; i++) {
>>   		WREG8(DAC_INDEX, MGA1064_PIX_CLK_CTL);
>>   		tmp =3D RREG8(DAC_DATA);
>> @@ -698,9 +775,9 @@ static int mga_g200eh_set_plls(struct mga_device *=
mdev, long clock)
>>  =20
>>   		udelay(500);
>>  =20
>> -		WREG_DAC(MGA1064_EH_PIX_PLLC_M, m);
>> -		WREG_DAC(MGA1064_EH_PIX_PLLC_N, n);
>> -		WREG_DAC(MGA1064_EH_PIX_PLLC_P, p);
>> +		WREG_DAC(MGA1064_EH_PIX_PLLC_M, xpixpllcm);
>> +		WREG_DAC(MGA1064_EH_PIX_PLLC_N, xpixpllcn);
>> +		WREG_DAC(MGA1064_EH_PIX_PLLC_P, xpixpllcp);
>>  =20
>>   		udelay(500);
>>  =20
>> @@ -728,11 +805,10 @@ static int mga_g200eh_set_plls(struct mga_device=
 *mdev, long clock)
>>   				udelay(5);
>>   		}
>>   	}
>> -
>> -	return 0;
>>   }
>>  =20
>> -static int mga_g200er_set_plls(struct mga_device *mdev, long clock)
>> +static int mgag200_compute_pixpll_values_g200er(struct mga_device *md=
ev, long clock,
>> +						struct mgag200_pll_values *pixpllc)
>>   {
>>   	static const unsigned int m_div_val[] =3D { 1, 2, 4, 8 };
>>   	unsigned int vcomax, vcomin, pllreffreq;
>> @@ -740,8 +816,6 @@ static int mga_g200er_set_plls(struct mga_device *=
mdev, long clock)
>>   	int testr, testn, testm, testo;
>>   	unsigned int p, m, n;
>>   	unsigned int computed, vco;
>> -	int tmp;
>> -	u8 misc;
>>  =20
>>   	m =3D n =3D p =3D 0;
>>   	vcomax =3D 1488000;
>> @@ -782,11 +856,28 @@ static int mga_g200er_set_plls(struct mga_device=
 *mdev, long clock)
>>   		}
>>   	}
>>  =20
>> +	pixpllc->m =3D m;
>> +	pixpllc->n =3D n;
>> +	pixpllc->p =3D p;
>> +	pixpllc->s =3D 0;
>> +
>> +	return 0;
>> +}
>> +
>> +static void mgag200_set_pixpll_g200er(struct mga_device *mdev,
>> +				      const struct mgag200_pll_values *pixpllc)
>> +{
>> +	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp, tmp;
>> +
>>   	misc =3D RREG8(MGA_MISC_IN);
>>   	misc &=3D ~MGAREG_MISC_CLK_SEL_MASK;
>>   	misc |=3D MGAREG_MISC_CLK_SEL_MGA_MSK;
>>   	WREG8(MGA_MISC_OUT, misc);
>>  =20
>> +	xpixpllcm =3D pixpllc->m;
>> +	xpixpllcn =3D pixpllc->n;
>> +	xpixpllcp =3D pixpllc->p | (pixpllc->s << 3);
> Again (pixpllc->s << 3)
>=20
>> +
>>   	WREG8(DAC_INDEX, MGA1064_PIX_CLK_CTL);
>>   	tmp =3D RREG8(DAC_DATA);
>>   	tmp |=3D MGA1064_PIX_CLK_CTL_CLK_DIS;
>> @@ -809,37 +900,70 @@ static int mga_g200er_set_plls(struct mga_device=
 *mdev, long clock)
>>  =20
>>   	udelay(500);
>>  =20
>> -	WREG_DAC(MGA1064_ER_PIX_PLLC_N, n);
>> -	WREG_DAC(MGA1064_ER_PIX_PLLC_M, m);
>> -	WREG_DAC(MGA1064_ER_PIX_PLLC_P, p);
>> +	WREG_DAC(MGA1064_ER_PIX_PLLC_N, xpixpllcn);
>> +	WREG_DAC(MGA1064_ER_PIX_PLLC_M, xpixpllcm);
>> +	WREG_DAC(MGA1064_ER_PIX_PLLC_P, xpixpllcp);
>>  =20
>>   	udelay(50);
>> -
>> -	return 0;
>>   }
>>  =20
>> -static int mgag200_crtc_set_plls(struct mga_device *mdev, long clock)=

>> +static void mgag200_crtc_set_plls(struct mga_device *mdev, long clock=
)
>>   {
> Makes sense, you can forget my earlier comment about return 0 in this
> function.
>=20

Yes. The tests are in the compute functions, which will be allowed to=20
fail during atomic check.

Best regards
Thomas

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--AtF1mTfC4qHo1Ib4f9o3Qj4ZdyRikGzmY--

--ujFuiWPuZtQTTe3tWinHdaDsdiwYG827w
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDsS5YFAwAAAAAACgkQlh/E3EQov+BH
ow/7BR7VE8Nz7hu/QGGdq5hHmcHEbdR9sHzJlGuwlWXyQjaBALX4Xvy4CMIOr7J4P5i33ipAXSVI
ilWmtpsQl2TI22VWgRs+U68fk+V2BTFzLivlKBfrdNhIt2wkz4cSn9fFadrRUmXQK1NGVGpkfVzb
pmueH+4tWd4UTCJi/ewSiVCmo3GNQPZtXg7td5sX/rGdo5pyT/qj6zNWbNoynJuGXDdaMPT3Zdml
F7dfU+E4YyLunba7YhoqikwrfWLxaEtVz1MAVonJxR3GeI29TLHnuIDikQWz129aROBsNL4X3fUL
HfG2vAXSD0/yj2st7fJnCavqdIGbT0hJODx7lH5b44UZnrshilIP/MjuHMvAX+zu4ynpAe89BKvr
D9R9nKde9+FG44xauT5NQdY5lIJrwyiJEG+K7nhNrcH47xQ+kDxd236aLFUUv1+NTlKflVoHeBQJ
PUhSeY4WMCB4nRJ0Pco2hsWOokqN085PhkdAUPxxfI5pu6Y++Rj9uPLEEm48wl8FCGib6zrVfbaC
PU8zseExNZVcn0LdbtYkR+t2m/EETmCqfiaYTMc9ZTdq8Edowc66Gapffh9WnVeSJhcHaDZyjtfC
LgaRRtaBiBzb25dUCzVzB5a5kIo7qRhohHuZ4RQIISXKXHXncBkF4LIjwZiBOrxgBTSyuzfgewTZ
BDQ=
=E194
-----END PGP SIGNATURE-----

--ujFuiWPuZtQTTe3tWinHdaDsdiwYG827w--
