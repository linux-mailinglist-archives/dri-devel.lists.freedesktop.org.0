Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DE559C98A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 22:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47ABDA11EA;
	Mon, 22 Aug 2022 20:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EA49EB0A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 20:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661198679;
 bh=bW2CW+29+FpqS4ExdCAZJgHe3DkgZ0Aw8e3uQoV6Wh0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ImddwC4LQipBvYzZ6I14KLPrKxd3NeyaUrooD/lHaku/QbYZS5gT0Zr+8u0GE81FP
 XRCgx7PQ7VyPuRetaqVFgZ1zcELl+PYh2VVOuXjtPd2rNXUwO3MeX20Br4U650fISN
 yboq9yFJoRULJ5E08lULiNET9RFZ0Hsi1vMv5iQE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.190.222]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpUYu-1pFm6U3hXg-00pr1n; Mon, 22
 Aug 2022 22:04:38 +0200
Message-ID: <39874c66-59c1-e5fd-5515-855e852205bd@gmx.de>
Date: Mon, 22 Aug 2022 22:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] video: fbdev: sis_main: Clean up some inconsistent
 indenting
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, thomas@winischhofer.net
References: <20220819110414.107565-1-jiapeng.chong@linux.alibaba.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220819110414.107565-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FBv/Gcc6P2yretpdGODj5l5bh0s49rVJVB/YWf27fUMSOgO21Xf
 rmzm+wJq67Xk9MFel3FrLCKRDqfdJGvyzSC/hVVJRvkv5w4/5HoO3U2XCLeop6BBYI6ySAy
 l3SokgoW0H0+XpWXVZpm9TOhGw14kG4pbjTjUQzmSF9+tZ1X29opE+1H/VOM5qazx6Q9W8X
 eGPC/rBor4+PGZuY58YtA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ye281Vhc1eY=:2Bbj4opTbK+FOisHmHEpsL
 fJZcj+rfbLxvUX2FqxYAR0Pwblw1A/J8pFxgGtpXdwHMSLUgGgsaQ8z7nwM6fCpQDQT9rwdl+
 IKAsohHr04jTOsMjbRWv66y8iYQgqTqb86JnCk2j/gVNodfa/qxcx3/i14gYjL1Xp3OKXa1Oz
 0vdfqFi/Ryzz1mDwtCBmHYK+5YLHkOIuwUAvS8y/pxbh3TvxPc4vNZfq4fD7btvOgQzc4fz/z
 0NEfUo1mF6uVl1CDrSiVjnAEiqZg4xa8x3p6q/X/l57qSQgO51xag2sKf58AO9Yd44A1iAiOW
 fd2p/Qji4/CVO46JUMD+vpoQfZMfcX0fD+pIVL5eMuADrIZixEIyQkh5sKdsSiOprX23Ersu4
 ev3zxWJ4XE0AyMccHXwGYBOO5YB2AjES/bKHXeui9hzdJHpH9vAiyobY+3Q0/OmUSCqyTDncH
 WGQDqvwoFtn98SKq8ju3PKChHBamJs5XyA+UdJW6fVReqs0VakDv3k6FZOQBVN2+Jb76kgAis
 +2czk2+kB9BoABwWqJxJFehHYXSKDZcUNpGMTl7EGcKuRKQ+UXd7HyKwcmgvAs8SSUhgzh018
 SQsRSnjzaCPSn0JuNoGFvESl73FiLwrk5ojXGi/RCgS1Gvs/6ABFBSce26tgKQEBUyQcAua6j
 i8gdwnJQOXwLlXJpWZ/BLJ+yONM8p//tIlV6guzs3ZGw/Cs54/DE2gD+M6X97Lxm30XgZzVYh
 XzjkaFfDe36hdr4+STwwz8MVtDnUvnlzgMiS0N75WZxMNSP1y3XzjVkxBShgrZgr/X4/H99uY
 q9hFaCM/aoeZ5fnod8/HNHX4afSEWccrg0tu2bVYpepOeXy9Zh9fE9hDXwpLgu32hw8pM2nYU
 IVVSDuijg/eeGTyX+tbHlACdFZfq0fHgk4TKk6miLg+HR9zmDxjxHz/DE0Cm9xpffIjRpNB4O
 gZeiJwuv4Ry+5NJ1/Q/tfkx6tYq3SyGohlkL/4huleQJtJyL1eEAW5heUzkpE3KgttMR3Gavo
 pwOkMPY1cC/DajI7qLS1+RlosQP073ieZdsPh6KMw4qLmN/8o6ET4zS2jfcEkFMxdGiuoKo6Y
 wlYWlmbQxM5w8WHePmGwn/crUE3pCB2l0yApbI5NtQQujsdMjSbpOfzlw==
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
Cc: linux-fbdev@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/19/22 13:04, Jiapeng Chong wrote:
> No functional modification involved.
>
> drivers/video/fbdev/sis/sis_main.c:6165 sisfb_probe() warn: inconsistent=
 indenting.
> drivers/video/fbdev/sis/sis_main.c:4266 sisfb_post_300_rwtest() warn: in=
consistent indenting.
> drivers/video/fbdev/sis/sis_main.c:2388 SISDoSense() warn: inconsistent =
indenting.
> drivers/video/fbdev/sis/sis_main.c:2531 SiS_Sense30x() warn: inconsisten=
t indenting.
> drivers/video/fbdev/sis/sis_main.c:2382 SISDoSense() warn: inconsistent =
indenting.
> drivers/video/fbdev/sis/sis_main.c:2250 sisfb_sense_crt1() warn: inconsi=
stent indenting.
> drivers/video/fbdev/sis/sis_main.c:672 sisfb_validate_mode() warn: incon=
sistent indenting.
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D1934
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

applied.

Thanks!
Helge


> ---
>  drivers/video/fbdev/sis/sis_main.c | 274 +++++++++++++++--------------
>  1 file changed, 141 insertions(+), 133 deletions(-)
>
> diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/si=
s/sis_main.c
> index 7114c5c17c91..ac4680a74d78 100644
> --- a/drivers/video/fbdev/sis/sis_main.c
> +++ b/drivers/video/fbdev/sis/sis_main.c
> @@ -650,37 +650,37 @@ sisfb_validate_mode(struct sis_video_info *ivideo,=
 int myindex, u32 vbflags)
>  	u16 xres=3D0, yres, myres;
>
>  #ifdef CONFIG_FB_SIS_300
> -	if(ivideo->sisvga_engine =3D=3D SIS_300_VGA) {
> -		if(!(sisbios_mode[myindex].chipset & MD_SIS300))
> +	if (ivideo->sisvga_engine =3D=3D SIS_300_VGA) {
> +		if (!(sisbios_mode[myindex].chipset & MD_SIS300))
>  			return -1 ;
>  	}
>  #endif
>  #ifdef CONFIG_FB_SIS_315
> -	if(ivideo->sisvga_engine =3D=3D SIS_315_VGA) {
> -		if(!(sisbios_mode[myindex].chipset & MD_SIS315))
> +	if (ivideo->sisvga_engine =3D=3D SIS_315_VGA) {
> +		if (!(sisbios_mode[myindex].chipset & MD_SIS315))
>  			return -1;
>  	}
>  #endif
>
>  	myres =3D sisbios_mode[myindex].yres;
>
> -	switch(vbflags & VB_DISPTYPE_DISP2) {
> +	switch (vbflags & VB_DISPTYPE_DISP2) {
>
>  	case CRT2_LCD:
>  		xres =3D ivideo->lcdxres; yres =3D ivideo->lcdyres;
>
> -		if((ivideo->SiS_Pr.SiS_CustomT !=3D CUT_PANEL848) &&
> -		   (ivideo->SiS_Pr.SiS_CustomT !=3D CUT_PANEL856)) {
> -			if(sisbios_mode[myindex].xres > xres)
> +		if ((ivideo->SiS_Pr.SiS_CustomT !=3D CUT_PANEL848) &&
> +		    (ivideo->SiS_Pr.SiS_CustomT !=3D CUT_PANEL856)) {
> +			if (sisbios_mode[myindex].xres > xres)
>  				return -1;
> -			if(myres > yres)
> +			if (myres > yres)
>  				return -1;
>  		}
>
> -		if(ivideo->sisfb_fstn) {
> -			if(sisbios_mode[myindex].xres =3D=3D 320) {
> -				if(myres =3D=3D 240) {
> -					switch(sisbios_mode[myindex].mode_no[1]) {
> +		if (ivideo->sisfb_fstn) {
> +			if (sisbios_mode[myindex].xres =3D=3D 320) {
> +				if (myres =3D=3D 240) {
> +					switch (sisbios_mode[myindex].mode_no[1]) {
>  						case 0x50: myindex =3D MODE_FSTN_8;  break;
>  						case 0x56: myindex =3D MODE_FSTN_16; break;
>  						case 0x53: return -1;
> @@ -689,7 +689,7 @@ sisfb_validate_mode(struct sis_video_info *ivideo, i=
nt myindex, u32 vbflags)
>  			}
>  		}
>
> -		if(SiS_GetModeID_LCD(ivideo->sisvga_engine, vbflags, sisbios_mode[myi=
ndex].xres,
> +		if (SiS_GetModeID_LCD(ivideo->sisvga_engine, vbflags, sisbios_mode[my=
index].xres,
>  			 	sisbios_mode[myindex].yres, 0, ivideo->sisfb_fstn,
>  			 	ivideo->SiS_Pr.SiS_CustomT, xres, yres, ivideo->vbflags2) < 0x14) =
{
>  			return -1;
> @@ -697,14 +697,14 @@ sisfb_validate_mode(struct sis_video_info *ivideo,=
 int myindex, u32 vbflags)
>  		break;
>
>  	case CRT2_TV:
> -		if(SiS_GetModeID_TV(ivideo->sisvga_engine, vbflags, sisbios_mode[myin=
dex].xres,
> +		if (SiS_GetModeID_TV(ivideo->sisvga_engine, vbflags, sisbios_mode[myi=
ndex].xres,
>  				sisbios_mode[myindex].yres, 0, ivideo->vbflags2) < 0x14) {
>  			return -1;
>  		}
>  		break;
>
>  	case CRT2_VGA:
> -		if(SiS_GetModeID_VGA2(ivideo->sisvga_engine, vbflags, sisbios_mode[my=
index].xres,
> +		if (SiS_GetModeID_VGA2(ivideo->sisvga_engine, vbflags, sisbios_mode[m=
yindex].xres,
>  				sisbios_mode[myindex].yres, 0, ivideo->vbflags2) < 0x14) {
>  			return -1;
>  		}
> @@ -2205,82 +2205,88 @@ static bool sisfb_test_DDC1(struct sis_video_inf=
o *ivideo)
>
>  static void sisfb_sense_crt1(struct sis_video_info *ivideo)
>  {
> -    bool mustwait =3D false;
> -    u8  sr1F, cr17;
> +	bool mustwait =3D false;
> +	u8  sr1F, cr17;
>  #ifdef CONFIG_FB_SIS_315
> -    u8  cr63=3D0;
> +	u8  cr63 =3D 0;
>  #endif
> -    u16 temp =3D 0xffff;
> -    int i;
> +	u16 temp =3D 0xffff;
> +	int i;
> +
> +	sr1F =3D SiS_GetReg(SISSR, 0x1F);
> +	SiS_SetRegOR(SISSR, 0x1F, 0x04);
> +	SiS_SetRegAND(SISSR, 0x1F, 0x3F);
>
> -    sr1F =3D SiS_GetReg(SISSR, 0x1F);
> -    SiS_SetRegOR(SISSR, 0x1F, 0x04);
> -    SiS_SetRegAND(SISSR, 0x1F, 0x3F);
> -    if(sr1F & 0xc0) mustwait =3D true;
> +	if (sr1F & 0xc0)
> +		mustwait =3D true;
>
>  #ifdef CONFIG_FB_SIS_315
> -    if(ivideo->sisvga_engine =3D=3D SIS_315_VGA) {
> -       cr63 =3D SiS_GetReg(SISCR, ivideo->SiS_Pr.SiS_MyCR63);
> -       cr63 &=3D 0x40;
> -       SiS_SetRegAND(SISCR, ivideo->SiS_Pr.SiS_MyCR63, 0xBF);
> -    }
> +	if (ivideo->sisvga_engine =3D=3D SIS_315_VGA) {
> +		cr63 =3D SiS_GetReg(SISCR, ivideo->SiS_Pr.SiS_MyCR63);
> +		cr63 &=3D 0x40;
> +		SiS_SetRegAND(SISCR, ivideo->SiS_Pr.SiS_MyCR63, 0xBF);
> +	}
>  #endif
>
> -    cr17 =3D SiS_GetReg(SISCR, 0x17);
> -    cr17 &=3D 0x80;
> -    if(!cr17) {
> -       SiS_SetRegOR(SISCR, 0x17, 0x80);
> -       mustwait =3D true;
> -       SiS_SetReg(SISSR, 0x00, 0x01);
> -       SiS_SetReg(SISSR, 0x00, 0x03);
> -    }
> +	cr17 =3D SiS_GetReg(SISCR, 0x17);
> +	cr17 &=3D 0x80;
>
> -    if(mustwait) {
> -       for(i=3D0; i < 10; i++) sisfbwaitretracecrt1(ivideo);
> -    }
> +	if (!cr17) {
> +		SiS_SetRegOR(SISCR, 0x17, 0x80);
> +		mustwait =3D true;
> +		SiS_SetReg(SISSR, 0x00, 0x01);
> +		SiS_SetReg(SISSR, 0x00, 0x03);
> +	}
>
> +	if (mustwait) {
> +		for (i =3D 0; i < 10; i++)
> +			sisfbwaitretracecrt1(ivideo);
> +	}
>  #ifdef CONFIG_FB_SIS_315
> -    if(ivideo->chip >=3D SIS_330) {
> -       SiS_SetRegAND(SISCR, 0x32, ~0x20);
> -       if(ivideo->chip >=3D SIS_340) {
> -	   SiS_SetReg(SISCR, 0x57, 0x4a);
> -       } else {
> -	   SiS_SetReg(SISCR, 0x57, 0x5f);
> -       }
> -	SiS_SetRegOR(SISCR, 0x53, 0x02);
> -	while ((SiS_GetRegByte(SISINPSTAT)) & 0x01)    break;
> -	while (!((SiS_GetRegByte(SISINPSTAT)) & 0x01)) break;
> -	if ((SiS_GetRegByte(SISMISCW)) & 0x10) temp =3D 1;
> -	SiS_SetRegAND(SISCR, 0x53, 0xfd);
> -	SiS_SetRegAND(SISCR, 0x57, 0x00);
> -    }
> +	if (ivideo->chip >=3D SIS_330) {
> +		SiS_SetRegAND(SISCR, 0x32, ~0x20);
> +		if (ivideo->chip >=3D SIS_340)
> +			SiS_SetReg(SISCR, 0x57, 0x4a);
> +		else
> +			SiS_SetReg(SISCR, 0x57, 0x5f);
> +
> +		SiS_SetRegOR(SISCR, 0x53, 0x02);
> +		while ((SiS_GetRegByte(SISINPSTAT)) & 0x01)
> +			break;
> +		while (!((SiS_GetRegByte(SISINPSTAT)) & 0x01))
> +			break;
> +		if ((SiS_GetRegByte(SISMISCW)) & 0x10)
> +			temp =3D 1;
> +
> +		SiS_SetRegAND(SISCR, 0x53, 0xfd);
> +		SiS_SetRegAND(SISCR, 0x57, 0x00);
> +	}
>  #endif
>
> -    if(temp =3D=3D 0xffff) {
> -       i =3D 3;
> -       do {
> -	  temp =3D SiS_HandleDDC(&ivideo->SiS_Pr, ivideo->vbflags,
> -		ivideo->sisvga_engine, 0, 0, NULL, ivideo->vbflags2);
> -       } while(((temp =3D=3D 0) || (temp =3D=3D 0xffff)) && i--);
> +	if (temp =3D=3D 0xffff) {
> +		i =3D 3;
>
> -       if((temp =3D=3D 0) || (temp =3D=3D 0xffff)) {
> -          if(sisfb_test_DDC1(ivideo)) temp =3D 1;
> -       }
> -    }
> +		do {
> +			temp =3D SiS_HandleDDC(&ivideo->SiS_Pr, ivideo->vbflags,
> +			ivideo->sisvga_engine, 0, 0, NULL, ivideo->vbflags2);
> +		} while (((temp =3D=3D 0) || (temp =3D=3D 0xffff)) && i--);
>
> -    if((temp) && (temp !=3D 0xffff)) {
> -       SiS_SetRegOR(SISCR, 0x32, 0x20);
> -    }
> +		if ((temp =3D=3D 0) || (temp =3D=3D 0xffff)) {
> +			if (sisfb_test_DDC1(ivideo))
> +				temp =3D 1;
> +		}
> +	}
> +
> +	if ((temp) && (temp !=3D 0xffff))
> +		SiS_SetRegOR(SISCR, 0x32, 0x20);
>
>  #ifdef CONFIG_FB_SIS_315
> -    if(ivideo->sisvga_engine =3D=3D SIS_315_VGA) {
> -	SiS_SetRegANDOR(SISCR, ivideo->SiS_Pr.SiS_MyCR63, 0xBF, cr63);
> -    }
> +	if (ivideo->sisvga_engine =3D=3D SIS_315_VGA)
> +		SiS_SetRegANDOR(SISCR, ivideo->SiS_Pr.SiS_MyCR63, 0xBF, cr63);
>  #endif
>
> -    SiS_SetRegANDOR(SISCR, 0x17, 0x7F, cr17);
> -
> -    SiS_SetReg(SISSR, 0x1F, sr1F);
> +	SiS_SetRegANDOR(SISCR, 0x17, 0x7F, cr17);
> +	SiS_SetReg(SISSR, 0x1F, sr1F);
>  }
>
>  /* Determine and detect attached devices on SiS30x */
> @@ -2294,25 +2300,25 @@ static void SiS_SenseLCD(struct sis_video_info *=
ivideo)
>  	ivideo->SiS_Pr.PanelSelfDetected =3D false;
>
>  	/* LCD detection only for TMDS bridges */
> -	if(!(ivideo->vbflags2 & VB2_SISTMDSBRIDGE))
> +	if (!(ivideo->vbflags2 & VB2_SISTMDSBRIDGE))
>  		return;
> -	if(ivideo->vbflags2 & VB2_30xBDH)
> +	if (ivideo->vbflags2 & VB2_30xBDH)
>  		return;
>
>  	/* If LCD already set up by BIOS, skip it */
>  	reg =3D SiS_GetReg(SISCR, 0x32);
> -	if(reg & 0x08)
> +	if (reg & 0x08)
>  		return;
>
>  	realcrtno =3D 1;
> -	if(ivideo->SiS_Pr.DDCPortMixup)
> +	if (ivideo->SiS_Pr.DDCPortMixup)
>  		realcrtno =3D 0;
>
>  	/* Check DDC capabilities */
>  	temp =3D SiS_HandleDDC(&ivideo->SiS_Pr, ivideo->vbflags, ivideo->sisvg=
a_engine,
>  				realcrtno, 0, &buffer[0], ivideo->vbflags2);
>
> -	if((!temp) || (temp =3D=3D 0xffff) || (!(temp & 0x02)))
> +	if ((!temp) || (temp =3D=3D 0xffff) || (!(temp & 0x02)))
>  		return;
>
>  	/* Read DDC data */
> @@ -2321,17 +2327,17 @@ static void SiS_SenseLCD(struct sis_video_info *=
ivideo)
>  		temp =3D SiS_HandleDDC(&ivideo->SiS_Pr, ivideo->vbflags,
>  				ivideo->sisvga_engine, realcrtno, 1,
>  				&buffer[0], ivideo->vbflags2);
> -	} while((temp) && i--);
> +	} while ((temp) && i--);
>
> -	if(temp)
> +	if (temp)
>  		return;
>
>  	/* No digital device */
> -	if(!(buffer[0x14] & 0x80))
> +	if (!(buffer[0x14] & 0x80))
>  		return;
>
>  	/* First detailed timing preferred timing? */
> -	if(!(buffer[0x18] & 0x02))
> +	if (!(buffer[0x18] & 0x02))
>  		return;
>
>  	xres =3D buffer[0x38] | ((buffer[0x3a] & 0xf0) << 4);
> @@ -2339,26 +2345,26 @@ static void SiS_SenseLCD(struct sis_video_info *=
ivideo)
>
>  	switch(xres) {
>  		case 1024:
> -			if(yres =3D=3D 768)
> +			if (yres =3D=3D 768)
>  				paneltype =3D 0x02;
>  			break;
>  		case 1280:
> -			if(yres =3D=3D 1024)
> +			if (yres =3D=3D 1024)
>  				paneltype =3D 0x03;
>  			break;
>  		case 1600:
> -			if((yres =3D=3D 1200) && (ivideo->vbflags2 & VB2_30xC))
> +			if ((yres =3D=3D 1200) && (ivideo->vbflags2 & VB2_30xC))
>  				paneltype =3D 0x0b;
>  			break;
>  	}
>
> -	if(!paneltype)
> +	if (!paneltype)
>  		return;
>
> -	if(buffer[0x23])
> +	if (buffer[0x23])
>  		cr37 |=3D 0x10;
>
> -	if((buffer[0x47] & 0x18) =3D=3D 0x18)
> +	if ((buffer[0x47] & 0x18) =3D=3D 0x18)
>  		cr37 |=3D ((((buffer[0x47] & 0x06) ^ 0x06) << 5) | 0x20);
>  	else
>  		cr37 |=3D 0xc0;
> @@ -2373,31 +2379,34 @@ static void SiS_SenseLCD(struct sis_video_info *=
ivideo)
>
>  static int SISDoSense(struct sis_video_info *ivideo, u16 type, u16 test=
)
>  {
> -    int temp, mytest, result, i, j;
> -
> -    for(j =3D 0; j < 10; j++) {
> -       result =3D 0;
> -       for(i =3D 0; i < 3; i++) {
> -          mytest =3D test;
> -	   SiS_SetReg(SISPART4, 0x11, (type & 0x00ff));
> -          temp =3D (type >> 8) | (mytest & 0x00ff);
> -	  SiS_SetRegANDOR(SISPART4, 0x10, 0xe0, temp);
> -          SiS_DDC2Delay(&ivideo->SiS_Pr, 0x1500);
> -          mytest >>=3D 8;
> -          mytest &=3D 0x7f;
> -	   temp =3D SiS_GetReg(SISPART4, 0x03);
> -          temp ^=3D 0x0e;
> -          temp &=3D mytest;
> -          if(temp =3D=3D mytest) result++;
> +	int temp, mytest, result, i, j;
> +
> +	for (j =3D 0; j < 10; j++) {
> +		result =3D 0;
> +		for (i =3D 0; i < 3; i++) {
> +			mytest =3D test;
> +			SiS_SetReg(SISPART4, 0x11, (type & 0x00ff));
> +			temp =3D (type >> 8) | (mytest & 0x00ff);
> +			SiS_SetRegANDOR(SISPART4, 0x10, 0xe0, temp);
> +			SiS_DDC2Delay(&ivideo->SiS_Pr, 0x1500);
> +			mytest >>=3D 8;
> +			mytest &=3D 0x7f;
> +			temp =3D SiS_GetReg(SISPART4, 0x03);
> +			temp ^=3D 0x0e;
> +			temp &=3D mytest;
> +			if (temp =3D=3D mytest)
> +				result++;
>  #if 1
> -	  SiS_SetReg(SISPART4, 0x11, 0x00);
> -	  SiS_SetRegAND(SISPART4, 0x10, 0xe0);
> -	  SiS_DDC2Delay(&ivideo->SiS_Pr, 0x1000);
> +			SiS_SetReg(SISPART4, 0x11, 0x00);
> +			SiS_SetRegAND(SISPART4, 0x10, 0xe0);
> +			SiS_DDC2Delay(&ivideo->SiS_Pr, 0x1000);
>  #endif
> -       }
> -       if((result =3D=3D 0) || (result >=3D 2)) break;
> -    }
> -    return result;
> +		}
> +
> +		if ((result =3D=3D 0) || (result >=3D 2))
> +			break;
> +	}
> +	return result;
>  }
>
>  static void SiS_Sense30x(struct sis_video_info *ivideo)
> @@ -4263,18 +4272,17 @@ static int sisfb_post_300_rwtest(struct sis_vide=
o_info *ivideo, int iteration,
>  	unsigned int k, RankCapacity, PageCapacity, BankNumHigh, BankNumMid;
>  	unsigned int PhysicalAdrOtherPage, PhysicalAdrHigh, PhysicalAdrHalfPag=
e;
>
> -	 for(k =3D 0; k < ARRAY_SIZE(SiS_DRAMType); k++) {
> -
> +	for (k =3D 0; k < ARRAY_SIZE(SiS_DRAMType); k++) {
>  		RankCapacity =3D buswidth * SiS_DRAMType[k][3];
>
> -		if(RankCapacity !=3D PseudoRankCapacity)
> +		if (RankCapacity !=3D PseudoRankCapacity)
>  			continue;
>
> -		if((SiS_DRAMType[k][2] + SiS_DRAMType[k][0]) > PseudoAdrPinCount)
> +		if ((SiS_DRAMType[k][2] + SiS_DRAMType[k][0]) > PseudoAdrPinCount)
>  			continue;
>
>  		BankNumHigh =3D RankCapacity * 16 * iteration - 1;
> -		if(iteration =3D=3D 3) {             /* Rank No */
> +		if (iteration =3D=3D 3) {             /* Rank No */
>  			BankNumMid  =3D RankCapacity * 16 - 1;
>  		} else {
>  			BankNumMid  =3D RankCapacity * 16 * iteration / 2 - 1;
> @@ -4288,18 +4296,22 @@ static int sisfb_post_300_rwtest(struct sis_vide=
o_info *ivideo, int iteration,
>  		SiS_SetRegAND(SISSR, 0x15, 0xFB); /* Test */
>  		SiS_SetRegOR(SISSR, 0x15, 0x04);  /* Test */
>  		sr14 =3D (SiS_DRAMType[k][3] * buswidth) - 1;
> -		if(buswidth =3D=3D 4)      sr14 |=3D 0x80;
> -		else if(buswidth =3D=3D 2) sr14 |=3D 0x40;
> +
> +		if (buswidth =3D=3D 4)
> +			sr14 |=3D 0x80;
> +		else if (buswidth =3D=3D 2)
> +			sr14 |=3D 0x40;
> +
>  		SiS_SetReg(SISSR, 0x13, SiS_DRAMType[k][4]);
>  		SiS_SetReg(SISSR, 0x14, sr14);
>
>  		BankNumHigh <<=3D 16;
>  		BankNumMid <<=3D 16;
>
> -		if((BankNumHigh + PhysicalAdrHigh      >=3D mapsize) ||
> -		   (BankNumMid  + PhysicalAdrHigh      >=3D mapsize) ||
> -		   (BankNumHigh + PhysicalAdrHalfPage  >=3D mapsize) ||
> -		   (BankNumHigh + PhysicalAdrOtherPage >=3D mapsize))
> +		if ((BankNumHigh + PhysicalAdrHigh >=3D mapsize) ||
> +		    (BankNumMid  + PhysicalAdrHigh >=3D mapsize) ||
> +		    (BankNumHigh + PhysicalAdrHalfPage  >=3D mapsize) ||
> +		    (BankNumHigh + PhysicalAdrOtherPage >=3D mapsize))
>  			continue;
>
>  		/* Write data */
> @@ -4313,7 +4325,7 @@ static int sisfb_post_300_rwtest(struct sis_video_=
info *ivideo, int iteration,
>  				(FBAddr + BankNumHigh + PhysicalAdrOtherPage));
>
>  		/* Read data */
> -		if(readw(FBAddr + BankNumHigh + PhysicalAdrHigh) =3D=3D PhysicalAdrHi=
gh)
> +		if (readw(FBAddr + BankNumHigh + PhysicalAdrHigh) =3D=3D PhysicalAdrH=
igh)
>  			return 1;
>  	}
>
> @@ -6155,24 +6167,20 @@ static int sisfb_probe(struct pci_dev *pdev, con=
st struct pci_device_id *ent)
>  #endif
>
>  #ifdef CONFIG_FB_SIS_315
> -		if(ivideo->sisvga_engine =3D=3D SIS_315_VGA) {
> +		if (ivideo->sisvga_engine =3D=3D SIS_315_VGA) {
>  			int result =3D 1;
> -		/*	if((ivideo->chip =3D=3D SIS_315H)   ||
> -			   (ivideo->chip =3D=3D SIS_315)    ||
> -			   (ivideo->chip =3D=3D SIS_315PRO) ||
> -			   (ivideo->chip =3D=3D SIS_330)) {
> -				sisfb_post_sis315330(pdev);
> -			} else */ if(ivideo->chip =3D=3D XGI_20) {
> +
> +			if (ivideo->chip =3D=3D XGI_20) {
>  				result =3D sisfb_post_xgi(pdev);
>  				ivideo->sisfb_can_post =3D 1;
> -			} else if((ivideo->chip =3D=3D XGI_40) && ivideo->haveXGIROM) {
> +			} else if ((ivideo->chip =3D=3D XGI_40) && ivideo->haveXGIROM) {
>  				result =3D sisfb_post_xgi(pdev);
>  				ivideo->sisfb_can_post =3D 1;
>  			} else {
>  				printk(KERN_INFO "sisfb: Card is not "
>  					"POSTed and sisfb can't do this either.\n");
>  			}
> -			if(!result) {
> +			if (!result) {
>  				printk(KERN_ERR "sisfb: Failed to POST card\n");
>  				ret =3D -ENODEV;
>  				goto error_3;

