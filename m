Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1D890848C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E611C10E256;
	Fri, 14 Jun 2024 07:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="YOwYy/YN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4539210E256
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 07:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1718349741; x=1718954541; i=deller@gmx.de;
 bh=aoQpnmcqZ2zGUKOcJ4Yznr1wi0r9yiCpBWrjxGtmp6k=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=YOwYy/YNQK/gy51lR4Zxd8Ii7+CwgSrNSJEVuFPwvRE+CjoEp8pWRIW0whcv1ywD
 p8UQ+baGPK5eSi75Zlqmei/KbrHVHVPigIqVYpmcP1kgIXu6IPiYLN/UWS6XJWjUX
 /c58umHmnBV/9cnR5f8rEbO+IuagOHfcwzXtZ3SiZBfQ8le8F5CTQ9lgbtgwIf9kS
 sE7hhy9OektMLwppNi07u5eJIGMYcUuqa2qj7hOsB/FcmJRGJ49JM+Sj9kVMQrH3W
 8nocsniqrOngfUYDIkDl0JhH7k0v4TTDwrg8QPu2ZwO35DXZs6AcQgI9rbj5G9x7P
 onm0XaPwtV9wpbnfOA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([83.135.217.92]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGQnF-1sCDLm3NnR-00EzZ6; Fri, 14
 Jun 2024 09:16:55 +0200
Message-ID: <fc597da4-fb65-41a0-9e63-f45643afc239@gmx.de>
Date: Fri, 14 Jun 2024 09:16:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: fbdev: sis: clean up some inconsistent indenting
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
References: <20240614065313.117790-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240614065313.117790-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cd+4jFaz9WPgqOA9ORi4YZHxGkI32kdQbBw2SaLJ3X49d+qYV0k
 /156nqLhb0uHXGbXTUfy99Zp1eLpXSJFG3JL/gV0uwrmnUtumUIT7PSbe8CQhEMMj9Qxjp3
 RgM2NOQXurpkkXkeCKxBxQCUfYV7SbZQfwOdEV4yqdCzDkzv7oMQAdPLXshxkZteH6Ckt+3
 wKyFl+ebInhXJ7W0+7Muw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:M/HrxB8+eac=;XjP3ib9i5IiJE+TEaKTpgeHPdL3
 r/vC/1I+LcsdaT6w/jdjiZThXk8yzAub2cg1tMiZekpknYPDCSbTbab9EPC6oK8wBHffp/aGL
 g0ChTzCQvPwnMFB2BYPiZg4/90L3jujqixmZOA+1c9/MJAqSZKRsNQHiKe/EkPfBuT5dtsEdn
 eyPGIevY5scdNyyOxfqNP8GvbOkyNieDLkAWKiyNoSyNFxZVhboz5RH4aIcPqJHQhm3rXDTze
 28XkvWCayEtiTli/Uu+/tTmg2fkkt7tZjhDhuPH8QQfM55DCbAWDHsBOYLehOY9wLMNulZwXT
 DJ6EzIgWJsq+Q0u5baRlhCEk3/54yc1RxMdG708K6oQcJ1qbQhCnQMDXZr3mMOnJKZ1Yn/Tp9
 VkcuLqGp1ap+MIULypWpLYjFVVOPut1CElSPppDMfcatWvjO5o73iNGrA5W6q2ZnfuZWhbIk8
 pDtBUDiMdKM1TQ60iAQ3kL71Jxj04MKuatR0qkbDH5ks2s/GgMi/83ywZFbQ+ffGiwsyMd/56
 6Ej1oQ0v+0YNShQPnOzmbRNTIisN1r9GLc9NiUeN0ELxQOVNJtmjGl4I0zQG3YlZ/jehhDxBY
 Y+/0CMlOmpOZlfII2Z/AwbpEtR3dHsDg0/DodUrZlGIUBjp7dvIkHrn9H7sCX9u4/nhqofPwY
 OKJaY/tFsS/O4Bwu2Xmj0in/GVSWPycUdBo5wLIShPQG5uDu+PuaEM4+zCwIQOLP6KY2ZCipE
 Q69NEVNxGBXZPs4KZyHAvblN9HLPJjixpdAjGjNbfnBY8zfplR+mt6HE3zDweozfKf9vE/Ugh
 GtoDeT7sH4lMiJL1bp7Nk4WB65D8soWqayVRVjAmkaNjU=
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

On 6/14/24 08:53, Jiapeng Chong wrote:
> No functional modification involved.
>
> drivers/video/fbdev/sis/sis_main.c:2511 SiS_Sense30x() warn: inconsisten=
t indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9330
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>


Jiapeng, I see your motivation, but sorry, I will not apply this patch.
Please fix indentings only when you have to touch the code anyway, e.g.
when fixing or modifying a specific function. Otherwise you just make
backporting smaller fixes impossible.

Helge


> ---
>   drivers/video/fbdev/sis/sis_main.c | 502 +++++++++++++++--------------
>   1 file changed, 260 insertions(+), 242 deletions(-)
>
> diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/si=
s/sis_main.c
> index 009bf1d92644..fc5b9a0d78bf 100644
> --- a/drivers/video/fbdev/sis/sis_main.c
> +++ b/drivers/video/fbdev/sis/sis_main.c
> @@ -2384,266 +2384,284 @@ static int SISDoSense(struct sis_video_info *i=
video, u16 type, u16 test)
>
>   static void SiS_Sense30x(struct sis_video_info *ivideo)
>   {
> -    u8  backupP4_0d,backupP2_00,backupP2_4d,backupSR_1e,biosflag=3D0;
> -    u16 svhs=3D0, svhs_c=3D0;
> -    u16 cvbs=3D0, cvbs_c=3D0;
> -    u16 vga2=3D0, vga2_c=3D0;
> -    int myflag, result;
> -    char stdstr[] =3D "sisfb: Detected";
> -    char tvstr[]  =3D "TV connected to";
> -
> -    if(ivideo->vbflags2 & VB2_301) {
> -       svhs =3D 0x00b9; cvbs =3D 0x00b3; vga2 =3D 0x00d1;
> -       myflag =3D SiS_GetReg(SISPART4, 0x01);
> -       if(myflag & 0x04) {
> -	  svhs =3D 0x00dd; cvbs =3D 0x00ee; vga2 =3D 0x00fd;
> -       }
> -    } else if(ivideo->vbflags2 & (VB2_301B | VB2_302B)) {
> -       svhs =3D 0x016b; cvbs =3D 0x0174; vga2 =3D 0x0190;
> -    } else if(ivideo->vbflags2 & (VB2_301LV | VB2_302LV)) {
> -       svhs =3D 0x0200; cvbs =3D 0x0100;
> -    } else if(ivideo->vbflags2 & (VB2_301C | VB2_302ELV | VB2_307T | VB=
2_307LV)) {
> -       svhs =3D 0x016b; cvbs =3D 0x0110; vga2 =3D 0x0190;
> -    } else
> -       return;
> -
> -    vga2_c =3D 0x0e08; svhs_c =3D 0x0404; cvbs_c =3D 0x0804;
> -    if(ivideo->vbflags & (VB2_301LV|VB2_302LV|VB2_302ELV|VB2_307LV)) {
> -       svhs_c =3D 0x0408; cvbs_c =3D 0x0808;
> -    }
> -
> -    biosflag =3D 2;
> -    if(ivideo->haveXGIROM) {
> -       biosflag =3D ivideo->bios_abase[0x58] & 0x03;
> -    } else if(ivideo->newrom) {
> -       if(ivideo->bios_abase[0x5d] & 0x04) biosflag |=3D 0x01;
> -    } else if(ivideo->sisvga_engine =3D=3D SIS_300_VGA) {
> -       if(ivideo->bios_abase) {
> -          biosflag =3D ivideo->bios_abase[0xfe] & 0x03;
> -       }
> -    }
> -
> -    if(ivideo->chip =3D=3D SIS_300) {
> -       myflag =3D SiS_GetReg(SISSR, 0x3b);
> -       if(!(myflag & 0x01)) vga2 =3D vga2_c =3D 0;
> -    }
> -
> -    if(!(ivideo->vbflags2 & VB2_SISVGA2BRIDGE)) {
> -       vga2 =3D vga2_c =3D 0;
> -    }
> -
> -    backupSR_1e =3D SiS_GetReg(SISSR, 0x1e);
> -    SiS_SetRegOR(SISSR, 0x1e, 0x20);
> -
> -    backupP4_0d =3D SiS_GetReg(SISPART4, 0x0d);
> -    if(ivideo->vbflags2 & VB2_30xC) {
> -	SiS_SetRegANDOR(SISPART4, 0x0d, ~0x07, 0x01);
> -    } else {
> -       SiS_SetRegOR(SISPART4, 0x0d, 0x04);
> -    }
> -    SiS_DDC2Delay(&ivideo->SiS_Pr, 0x2000);
> -
> -    backupP2_00 =3D SiS_GetReg(SISPART2, 0x00);
> -    SiS_SetReg(SISPART2, 0x00, ((backupP2_00 | 0x1c) & 0xfc));
> -
> -    backupP2_4d =3D SiS_GetReg(SISPART2, 0x4d);
> -    if(ivideo->vbflags2 & VB2_SISYPBPRBRIDGE) {
> -	SiS_SetReg(SISPART2, 0x4d, (backupP2_4d & ~0x10));
> -    }
> -
> -    if(!(ivideo->vbflags2 & VB2_30xCLV)) {
> -       SISDoSense(ivideo, 0, 0);
> -    }
> -
> -    SiS_SetRegAND(SISCR, 0x32, ~0x14);
> -
> -    if(vga2_c || vga2) {
> -       if(SISDoSense(ivideo, vga2, vga2_c)) {
> -          if(biosflag & 0x01) {
> -	     printk(KERN_INFO "%s %s SCART output\n", stdstr, tvstr);
> -	     SiS_SetRegOR(SISCR, 0x32, 0x04);
> -	  } else {
> -	     printk(KERN_INFO "%s secondary VGA connection\n", stdstr);
> -	     SiS_SetRegOR(SISCR, 0x32, 0x10);
> -	  }
> -       }
> -    }
> -
> -    SiS_SetRegAND(SISCR, 0x32, 0x3f);
> -
> -    if(ivideo->vbflags2 & VB2_30xCLV) {
> -       SiS_SetRegOR(SISPART4, 0x0d, 0x04);
> -    }
> -
> -    if((ivideo->sisvga_engine =3D=3D SIS_315_VGA) && (ivideo->vbflags2 =
& VB2_SISYPBPRBRIDGE)) {
> -       SiS_SetReg(SISPART2, 0x4d, (backupP2_4d | 0x10));
> -       SiS_DDC2Delay(&ivideo->SiS_Pr, 0x2000);
> -       if((result =3D SISDoSense(ivideo, svhs, 0x0604))) {
> -          if((result =3D SISDoSense(ivideo, cvbs, 0x0804))) {
> -	     printk(KERN_INFO "%s %s YPbPr component output\n", stdstr, tvstr)=
;
> -	     SiS_SetRegOR(SISCR, 0x32, 0x80);
> -	  }
> -       }
> -       SiS_SetReg(SISPART2, 0x4d, backupP2_4d);
> -    }
> -
> -    SiS_SetRegAND(SISCR, 0x32, ~0x03);
> -
> -    if(!(ivideo->vbflags & TV_YPBPR)) {
> -       if((result =3D SISDoSense(ivideo, svhs, svhs_c))) {
> -          printk(KERN_INFO "%s %s SVIDEO output\n", stdstr, tvstr);
> -	   SiS_SetRegOR(SISCR, 0x32, 0x02);
> -       }
> -       if((biosflag & 0x02) || (!result)) {
> -          if(SISDoSense(ivideo, cvbs, cvbs_c)) {
> -	     printk(KERN_INFO "%s %s COMPOSITE output\n", stdstr, tvstr);
> -	     SiS_SetRegOR(SISCR, 0x32, 0x01);
> -          }
> -       }
> -    }
> -
> -    SISDoSense(ivideo, 0, 0);
> -
> -    SiS_SetReg(SISPART2, 0x00, backupP2_00);
> -    SiS_SetReg(SISPART4, 0x0d, backupP4_0d);
> -    SiS_SetReg(SISSR, 0x1e, backupSR_1e);
> -
> -    if(ivideo->vbflags2 & VB2_30xCLV) {
> -	biosflag =3D SiS_GetReg(SISPART2, 0x00);
> -       if(biosflag & 0x20) {
> -          for(myflag =3D 2; myflag > 0; myflag--) {
> -	     biosflag ^=3D 0x20;
> -	     SiS_SetReg(SISPART2, 0x00, biosflag);
> -	  }
> -       }
> -    }
> -
> -    SiS_SetReg(SISPART2, 0x00, backupP2_00);
> +	u8 backupP4_0d, backupP2_00, backupP2_4d, backupSR_1e, biosflag =3D 0;
> +	u16 svhs =3D 0, svhs_c =3D 0;
> +	u16 cvbs =3D 0, cvbs_c =3D 0;
> +	u16 vga2 =3D 0, vga2_c =3D 0;
> +	int myflag, result;
> +	char stdstr[] =3D "sisfb: Detected";
> +	char tvstr[]  =3D "TV connected to";
> +
> +	if (ivideo->vbflags2 & VB2_301) {
> +		svhs =3D 0x00b9; cvbs =3D 0x00b3; vga2 =3D 0x00d1;
> +		myflag =3D SiS_GetReg(SISPART4, 0x01);
> +		if (myflag & 0x04) {
> +			svhs =3D 0x00dd; cvbs =3D 0x00ee; vga2 =3D 0x00fd;
> +		}
> +	} else if (ivideo->vbflags2 & (VB2_301B | VB2_302B)) {
> +		svhs =3D 0x016b; cvbs =3D 0x0174; vga2 =3D 0x0190;
> +	} else if (ivideo->vbflags2 & (VB2_301LV | VB2_302LV)) {
> +		svhs =3D 0x0200; cvbs =3D 0x0100;
> +	} else if (ivideo->vbflags2 & (VB2_301C | VB2_302ELV | VB2_307T | VB2_=
307LV)) {
> +		svhs =3D 0x016b; cvbs =3D 0x0110; vga2 =3D 0x0190;
> +	} else
> +		return;
> +
> +	vga2_c =3D 0x0e08; svhs_c =3D 0x0404; cvbs_c =3D 0x0804;
> +	if (ivideo->vbflags & (VB2_301LV | VB2_302LV | VB2_302ELV | VB2_307LV)=
) {
> +		svhs_c =3D 0x0408; cvbs_c =3D 0x0808;
> +	}
> +
> +	biosflag =3D 2;
> +	if (ivideo->haveXGIROM) {
> +		biosflag =3D ivideo->bios_abase[0x58] & 0x03;
> +	} else if (ivideo->newrom) {
> +		if (ivideo->bios_abase[0x5d] & 0x04)
> +			biosflag |=3D 0x01;
> +	} else if (ivideo->sisvga_engine =3D=3D SIS_300_VGA) {
> +		if (ivideo->bios_abase)
> +			biosflag =3D ivideo->bios_abase[0xfe] & 0x03;
> +	}
> +
> +	if (ivideo->chip =3D=3D SIS_300) {
> +		myflag =3D SiS_GetReg(SISSR, 0x3b);
> +		if (!(myflag & 0x01))
> +			vga2 =3D vga2_c =3D 0;
> +	}
> +
> +	if (!(ivideo->vbflags2 & VB2_SISVGA2BRIDGE))
> +		vga2 =3D vga2_c =3D 0;
> +
> +	backupSR_1e =3D SiS_GetReg(SISSR, 0x1e);
> +	SiS_SetRegOR(SISSR, 0x1e, 0x20);
> +
> +	backupP4_0d =3D SiS_GetReg(SISPART4, 0x0d);
> +	if (ivideo->vbflags2 & VB2_30xC)
> +		SiS_SetRegANDOR(SISPART4, 0x0d, ~0x07, 0x01);
> +	else
> +		SiS_SetRegOR(SISPART4, 0x0d, 0x04);
> +
> +	SiS_DDC2Delay(&ivideo->SiS_Pr, 0x2000);
> +
> +	backupP2_00 =3D SiS_GetReg(SISPART2, 0x00);
> +	SiS_SetReg(SISPART2, 0x00, ((backupP2_00 | 0x1c) & 0xfc));
> +
> +	backupP2_4d =3D SiS_GetReg(SISPART2, 0x4d);
> +	if (ivideo->vbflags2 & VB2_SISYPBPRBRIDGE)
> +		SiS_SetReg(SISPART2, 0x4d, (backupP2_4d & ~0x10));
> +
> +	if (!(ivideo->vbflags2 & VB2_30xCLV))
> +		SISDoSense(ivideo, 0, 0);
> +
> +	SiS_SetRegAND(SISCR, 0x32, ~0x14);
> +
> +	if (vga2_c || vga2) {
> +		if (SISDoSense(ivideo, vga2, vga2_c)) {
> +			if (biosflag & 0x01) {
> +				printk(KERN_INFO "%s %s SCART output\n", stdstr, tvstr);
> +				SiS_SetRegOR(SISCR, 0x32, 0x04);
> +			} else {
> +				printk(KERN_INFO "%s secondary VGA connection\n", stdstr);
> +				SiS_SetRegOR(SISCR, 0x32, 0x10);
> +			}
> +		}
> +	}
> +
> +	SiS_SetRegAND(SISCR, 0x32, 0x3f);
> +
> +	if (ivideo->vbflags2 & VB2_30xCLV)
> +		SiS_SetRegOR(SISPART4, 0x0d, 0x04);
> +
> +	if ((ivideo->sisvga_engine =3D=3D SIS_315_VGA) && (ivideo->vbflags2 & =
VB2_SISYPBPRBRIDGE)) {
> +		SiS_SetReg(SISPART2, 0x4d, (backupP2_4d | 0x10));
> +		SiS_DDC2Delay(&ivideo->SiS_Pr, 0x2000);
> +		result =3D SISDoSense(ivideo, svhs, 0x0604);
> +		if (result) {
> +			result =3D SISDoSense(ivideo, cvbs, 0x0804);
> +			if (result) {
> +				printk(KERN_INFO "%s %s YPbPr component output\n", stdstr, tvstr);
> +				SiS_SetRegOR(SISCR, 0x32, 0x80);
> +			}
> +		}
> +		SiS_SetReg(SISPART2, 0x4d, backupP2_4d);
> +	}
> +
> +	SiS_SetRegAND(SISCR, 0x32, ~0x03);
> +
> +	if (!(ivideo->vbflags & TV_YPBPR)) {
> +		result =3D SISDoSense(ivideo, svhs, svhs_c);
> +		if (result) {
> +			printk(KERN_INFO "%s %s SVIDEO output\n", stdstr, tvstr);
> +			SiS_SetRegOR(SISCR, 0x32, 0x02);
> +		}
> +		if ((biosflag & 0x02) || (!result)) {
> +			if (SISDoSense(ivideo, cvbs, cvbs_c)) {
> +				printk(KERN_INFO "%s %s COMPOSITE output\n", stdstr, tvstr);
> +				SiS_SetRegOR(SISCR, 0x32, 0x01);
> +			}
> +		}
> +	}
> +
> +	SISDoSense(ivideo, 0, 0);
> +
> +	SiS_SetReg(SISPART2, 0x00, backupP2_00);
> +	SiS_SetReg(SISPART4, 0x0d, backupP4_0d);
> +	SiS_SetReg(SISSR, 0x1e, backupSR_1e);
> +
> +	if (ivideo->vbflags2 & VB2_30xCLV) {
> +		biosflag =3D SiS_GetReg(SISPART2, 0x00);
> +		if (biosflag & 0x20) {
> +			for (myflag =3D 2; myflag > 0; myflag--) {
> +				biosflag ^=3D 0x20;
> +				SiS_SetReg(SISPART2, 0x00, biosflag);
> +			}
> +		}
> +	}
> +
> +	SiS_SetReg(SISPART2, 0x00, backupP2_00);
>   }
>
>   /* Determine and detect attached TV's on Chrontel */
>   static void SiS_SenseCh(struct sis_video_info *ivideo)
>   {
>   #if defined(CONFIG_FB_SIS_300) || defined(CONFIG_FB_SIS_315)
> -    u8 temp1, temp2;
> -    char stdstr[] =3D "sisfb: Chrontel: Detected TV connected to";
> +	u8 temp1, temp2;
> +	char stdstr[] =3D "sisfb: Chrontel: Detected TV connected to";
>   #endif
>   #ifdef CONFIG_FB_SIS_300
> -    unsigned char test[3];
> -    int i;
> +	unsigned char test[3];
> +	int i;
>   #endif
>
> -    if(ivideo->chip < SIS_315H) {
> +	if (ivideo->chip < SIS_315H) {
>
>   #ifdef CONFIG_FB_SIS_300
> -       ivideo->SiS_Pr.SiS_IF_DEF_CH70xx =3D 1;		/* Chrontel 700x */
> -       SiS_SetChrontelGPIO(&ivideo->SiS_Pr, 0x9c);	/* Set general purpo=
se IO for Chrontel communication */
> -       SiS_DDC2Delay(&ivideo->SiS_Pr, 1000);
> -       temp1 =3D SiS_GetCH700x(&ivideo->SiS_Pr, 0x25);
> -       /* See Chrontel TB31 for explanation */
> -       temp2 =3D SiS_GetCH700x(&ivideo->SiS_Pr, 0x0e);
> -       if(((temp2 & 0x07) =3D=3D 0x01) || (temp2 & 0x04)) {
> -	  SiS_SetCH700x(&ivideo->SiS_Pr, 0x0e, 0x0b);
> -	  SiS_DDC2Delay(&ivideo->SiS_Pr, 300);
> -       }
> -       temp2 =3D SiS_GetCH700x(&ivideo->SiS_Pr, 0x25);
> -       if(temp2 !=3D temp1) temp1 =3D temp2;
> -
> -       if((temp1 >=3D 0x22) && (temp1 <=3D 0x50)) {
> -	   /* Read power status */
> -	   temp1 =3D SiS_GetCH700x(&ivideo->SiS_Pr, 0x0e);
> -	   if((temp1 & 0x03) !=3D 0x03) {
> -		/* Power all outputs */
> -		SiS_SetCH700x(&ivideo->SiS_Pr, 0x0e,0x0b);
> -		SiS_DDC2Delay(&ivideo->SiS_Pr, 300);
> -	   }
> -	   /* Sense connected TV devices */
> -	   for(i =3D 0; i < 3; i++) {
> -	       SiS_SetCH700x(&ivideo->SiS_Pr, 0x10, 0x01);
> -	       SiS_DDC2Delay(&ivideo->SiS_Pr, 0x96);
> -	       SiS_SetCH700x(&ivideo->SiS_Pr, 0x10, 0x00);
> -	       SiS_DDC2Delay(&ivideo->SiS_Pr, 0x96);
> -	       temp1 =3D SiS_GetCH700x(&ivideo->SiS_Pr, 0x10);
> -	       if(!(temp1 & 0x08))       test[i] =3D 0x02;
> -	       else if(!(temp1 & 0x02))  test[i] =3D 0x01;
> -	       else                      test[i] =3D 0;
> -	       SiS_DDC2Delay(&ivideo->SiS_Pr, 0x96);
> -	   }
> +		ivideo->SiS_Pr.SiS_IF_DEF_CH70xx =3D 1;	/* Chrontel 700x */
> +		/* Set general purpose IO for Chrontel communication */
> +		SiS_SetChrontelGPIO(&ivideo->SiS_Pr, 0x9c);
> +		SiS_DDC2Delay(&ivideo->SiS_Pr, 1000);
> +		temp1 =3D SiS_GetCH700x(&ivideo->SiS_Pr, 0x25);
> +		/* See Chrontel TB31 for explanation */
> +		temp2 =3D SiS_GetCH700x(&ivideo->SiS_Pr, 0x0e);
> +		if (((temp2 & 0x07) =3D=3D 0x01) || (temp2 & 0x04)) {
> +			SiS_SetCH700x(&ivideo->SiS_Pr, 0x0e, 0x0b);
> +			SiS_DDC2Delay(&ivideo->SiS_Pr, 300);
> +		}
> +		temp2 =3D SiS_GetCH700x(&ivideo->SiS_Pr, 0x25);
> +		if (temp2 !=3D temp1)
> +			temp1 =3D temp2;
> +
> +		if ((temp1 >=3D 0x22) && (temp1 <=3D 0x50)) {
> +			/* Read power status */
> +			temp1 =3D SiS_GetCH700x(&ivideo->SiS_Pr, 0x0e);
> +			if ((temp1 & 0x03) !=3D 0x03) {
> +				/* Power all outputs */
> +				SiS_SetCH700x(&ivideo->SiS_Pr, 0x0e, 0x0b);
> +				SiS_DDC2Delay(&ivideo->SiS_Pr, 300);
> +			}
> +			/* Sense connected TV devices */
> +			for (i =3D 0; i < 3; i++) {
> +				SiS_SetCH700x(&ivideo->SiS_Pr, 0x10, 0x01);
> +				SiS_DDC2Delay(&ivideo->SiS_Pr, 0x96);
> +				SiS_SetCH700x(&ivideo->SiS_Pr, 0x10, 0x00);
> +				SiS_DDC2Delay(&ivideo->SiS_Pr, 0x96);
> +				temp1 =3D SiS_GetCH700x(&ivideo->SiS_Pr, 0x10);
> +
> +				if (!(temp1 & 0x08))
> +					test[i] =3D 0x02;
> +				else if (!(temp1 & 0x02))
> +					test[i] =3D 0x01;
> +				else
> +					test[i] =3D 0;
> +				SiS_DDC2Delay(&ivideo->SiS_Pr, 0x96);
> +			}
>
> -	   if(test[0] =3D=3D test[1])      temp1 =3D test[0];
> -	   else if(test[0] =3D=3D test[2]) temp1 =3D test[0];
> -	   else if(test[1] =3D=3D test[2]) temp1 =3D test[1];
> -	   else {
> -		printk(KERN_INFO
> -			"sisfb: TV detection unreliable - test results varied\n");
> -		temp1 =3D test[2];
> -	   }
> -	   if(temp1 =3D=3D 0x02) {
> -		printk(KERN_INFO "%s SVIDEO output\n", stdstr);
> -		ivideo->vbflags |=3D TV_SVIDEO;
> -		SiS_SetRegOR(SISCR, 0x32, 0x02);
> -		SiS_SetRegAND(SISCR, 0x32, ~0x05);
> -	   } else if (temp1 =3D=3D 0x01) {
> -		printk(KERN_INFO "%s CVBS output\n", stdstr);
> -		ivideo->vbflags |=3D TV_AVIDEO;
> -		SiS_SetRegOR(SISCR, 0x32, 0x01);
> -		SiS_SetRegAND(SISCR, 0x32, ~0x06);
> -	   } else {
> -		SiS_SetCH70xxANDOR(&ivideo->SiS_Pr, 0x0e, 0x01, 0xF8);
> -		SiS_SetRegAND(SISCR, 0x32, ~0x07);
> -	   }
> -       } else if(temp1 =3D=3D 0) {
> -	  SiS_SetCH70xxANDOR(&ivideo->SiS_Pr, 0x0e, 0x01, 0xF8);
> -	  SiS_SetRegAND(SISCR, 0x32, ~0x07);
> -       }
> -       /* Set general purpose IO for Chrontel communication */
> -       SiS_SetChrontelGPIO(&ivideo->SiS_Pr, 0x00);
> +			if (test[0] =3D=3D test[1])
> +				temp1 =3D test[0];
> +			else if (test[0] =3D=3D test[2])
> +				temp1 =3D test[0];
> +			else if (test[1] =3D=3D test[2])
> +				temp1 =3D test[1];
> +			else {
> +				printk(KERN_INFO
> +				       "sisfb: TV detection unreliable - test results varied\n");
> +				temp1 =3D test[2];
> +			}
> +
> +			if (temp1 =3D=3D 0x02) {
> +				printk(KERN_INFO "%s SVIDEO output\n", stdstr);
> +				ivideo->vbflags |=3D TV_SVIDEO;
> +				SiS_SetRegOR(SISCR, 0x32, 0x02);
> +				SiS_SetRegAND(SISCR, 0x32, ~0x05);
> +			} else if (temp1 =3D=3D 0x01) {
> +				printk(KERN_INFO "%s CVBS output\n", stdstr);
> +				ivideo->vbflags |=3D TV_AVIDEO;
> +				SiS_SetRegOR(SISCR, 0x32, 0x01);
> +				SiS_SetRegAND(SISCR, 0x32, ~0x06);
> +			} else {
> +				SiS_SetCH70xxANDOR(&ivideo->SiS_Pr, 0x0e, 0x01, 0xF8);
> +				SiS_SetRegAND(SISCR, 0x32, ~0x07);
> +			}
> +		} else if (temp1 =3D=3D 0) {
> +			SiS_SetCH70xxANDOR(&ivideo->SiS_Pr, 0x0e, 0x01, 0xF8);
> +			SiS_SetRegAND(SISCR, 0x32, ~0x07);
> +		}
> +		/* Set general purpose IO for Chrontel communication */
> +		SiS_SetChrontelGPIO(&ivideo->SiS_Pr, 0x00);
>   #endif
>
> -    } else {
> +	} else {
>
>   #ifdef CONFIG_FB_SIS_315
> -	ivideo->SiS_Pr.SiS_IF_DEF_CH70xx =3D 2;		/* Chrontel 7019 */
> -	temp1 =3D SiS_GetCH701x(&ivideo->SiS_Pr, 0x49);
> -	SiS_SetCH701x(&ivideo->SiS_Pr, 0x49, 0x20);
> -	SiS_DDC2Delay(&ivideo->SiS_Pr, 0x96);
> -	temp2 =3D SiS_GetCH701x(&ivideo->SiS_Pr, 0x20);
> -	temp2 |=3D 0x01;
> -	SiS_SetCH701x(&ivideo->SiS_Pr, 0x20, temp2);
> -	SiS_DDC2Delay(&ivideo->SiS_Pr, 0x96);
> -	temp2 ^=3D 0x01;
> -	SiS_SetCH701x(&ivideo->SiS_Pr, 0x20, temp2);
> -	SiS_DDC2Delay(&ivideo->SiS_Pr, 0x96);
> -	temp2 =3D SiS_GetCH701x(&ivideo->SiS_Pr, 0x20);
> -	SiS_SetCH701x(&ivideo->SiS_Pr, 0x49, temp1);
> -	temp1 =3D 0;
> -	if(temp2 & 0x02) temp1 |=3D 0x01;
> -	if(temp2 & 0x10) temp1 |=3D 0x01;
> -	if(temp2 & 0x04) temp1 |=3D 0x02;
> -	if( (temp1 & 0x01) && (temp1 & 0x02) ) temp1 =3D 0x04;
> -	switch(temp1) {
> -	case 0x01:
> -	     printk(KERN_INFO "%s CVBS output\n", stdstr);
> -	     ivideo->vbflags |=3D TV_AVIDEO;
> -	     SiS_SetRegOR(SISCR, 0x32, 0x01);
> -	     SiS_SetRegAND(SISCR, 0x32, ~0x06);
> -	     break;
> -	case 0x02:
> -	     printk(KERN_INFO "%s SVIDEO output\n", stdstr);
> -	     ivideo->vbflags |=3D TV_SVIDEO;
> -	     SiS_SetRegOR(SISCR, 0x32, 0x02);
> -	     SiS_SetRegAND(SISCR, 0x32, ~0x05);
> -	     break;
> -	case 0x04:
> -	     printk(KERN_INFO "%s SCART output\n", stdstr);
> -	     SiS_SetRegOR(SISCR, 0x32, 0x04);
> -	     SiS_SetRegAND(SISCR, 0x32, ~0x03);
> -	     break;
> -	default:
> -	     SiS_SetRegAND(SISCR, 0x32, ~0x07);
> -	}
> +		ivideo->SiS_Pr.SiS_IF_DEF_CH70xx =3D 2;		/* Chrontel 7019 */
> +		temp1 =3D SiS_GetCH701x(&ivideo->SiS_Pr, 0x49);
> +		SiS_SetCH701x(&ivideo->SiS_Pr, 0x49, 0x20);
> +		SiS_DDC2Delay(&ivideo->SiS_Pr, 0x96);
> +		temp2 =3D SiS_GetCH701x(&ivideo->SiS_Pr, 0x20);
> +		temp2 |=3D 0x01;
> +
> +		SiS_SetCH701x(&ivideo->SiS_Pr, 0x20, temp2);
> +		SiS_DDC2Delay(&ivideo->SiS_Pr, 0x96);
> +		temp2 ^=3D 0x01;
> +
> +		SiS_SetCH701x(&ivideo->SiS_Pr, 0x20, temp2);
> +		SiS_DDC2Delay(&ivideo->SiS_Pr, 0x96);
> +		temp2 =3D SiS_GetCH701x(&ivideo->SiS_Pr, 0x20);
> +		SiS_SetCH701x(&ivideo->SiS_Pr, 0x49, temp1);
> +		temp1 =3D 0;
> +
> +		if (temp2 & 0x02)
> +			temp1 |=3D 0x01;
> +		if (temp2 & 0x10)
> +			temp1 |=3D 0x01;
> +		if (temp2 & 0x04)
> +			temp1 |=3D 0x02;
> +		if ((temp1 & 0x01) && (temp1 & 0x02))
> +			temp1 =3D 0x04;
> +
> +		switch (temp1) {
> +		case 0x01:
> +			printk(KERN_INFO "%s CVBS output\n", stdstr);
> +			ivideo->vbflags |=3D TV_AVIDEO;
> +			SiS_SetRegOR(SISCR, 0x32, 0x01);
> +			SiS_SetRegAND(SISCR, 0x32, ~0x06);
> +			break;
> +		case 0x02:
> +			printk(KERN_INFO "%s SVIDEO output\n", stdstr);
> +			ivideo->vbflags |=3D TV_SVIDEO;
> +			SiS_SetRegOR(SISCR, 0x32, 0x02);
> +			SiS_SetRegAND(SISCR, 0x32, ~0x05);
> +			break;
> +		case 0x04:
> +			printk(KERN_INFO "%s SCART output\n", stdstr);
> +			SiS_SetRegOR(SISCR, 0x32, 0x04);
> +			SiS_SetRegAND(SISCR, 0x32, ~0x03);
> +			break;
> +		default:
> +			SiS_SetRegAND(SISCR, 0x32, ~0x07);
> +		}
>   #endif
> -    }
> +	}
>   }
>
>   static void sisfb_get_VB_type(struct sis_video_info *ivideo)

