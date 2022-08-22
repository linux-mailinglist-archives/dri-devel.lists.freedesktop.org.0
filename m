Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BBB59C997
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 22:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8FEA17FD;
	Mon, 22 Aug 2022 20:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF8118BC9A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 20:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661198859;
 bh=dXpn5pHIlG3QJlIra6cx9HEfiXeMoNnRQ6WKhIoZGP8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Dk3l/7qVbk5gZ1+qR/XYUUvjOt5dTjw5qok/vC0c2hj7rdB9FHK3WFuZcZ/BAMEZv
 X6kHsRC3MQxinclZto+I0kGeBzyh9vKPvqPDwJY0HZIZpoWtssYC4eZlSbgWMShvgg
 rrxeWFBR39Hik/7bBJ9MTA20Y26Myiid5s9lZhA4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.190.222]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mjj87-1p9Qcz3YLb-00lBVT; Mon, 22
 Aug 2022 22:07:38 +0200
Message-ID: <7ac99deb-33a1-ca62-510c-e319c759934d@gmx.de>
Date: Mon, 22 Aug 2022 22:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] video: fbdev: radeon: Clean up some inconsistent indenting
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, benh@kernel.crashing.org
References: <20220819110659.110384-1-jiapeng.chong@linux.alibaba.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220819110659.110384-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8LWOlxNoMfqPWSTSrv2LuGaTgY/RnlafGOGKIzO9xUNi6shY5P4
 kjwUAg3gSzLawWn44VZZwUlmBF+FtAJf8QjljDjA4wgYhHrf+6myYHVq4AzkR5QXUU/jrXJ
 f5PX+v+GNte1QqB2RtWuOwY5NcQ27K3iNW5tuQzPwyvlVYQhfj+hNG2iG0T9uMMF1qucQGZ
 ir9cui8yyAu5l8UBCzg4w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iepqQ7dUop0=:dfvAPfQXoqVBNxapVO52QA
 FXMIlEesCEpsPgBL4u+WqFZ9gHqnfhJhoYc/BaJOkz8c6xHlAe7PyH3eQ098KZnZQR/rjoW+W
 qcMDwQTAtXYHsnb8XrGY+f66mKidBbtme6xw+fClTRgMWrRkXOjNz077di2IcI0ancKSLWD1v
 T6wAOfhX1/jRUiT9MSks9IlamI0vgdvLXWw7n0luINaPHgjakf2sGZb1EXVCJJwphrQclR4rn
 OY399LNqd+utAfLlpAdqDKr/eYEgE2KQyiEm5YgGSJIiOqUxKyxOcgKR0ceTL0R3YnKlFLmNH
 fewSzj44Y6trRAGI16HR9Bl2Tc/BzaoXE4cbkaWeUe3tCeCMzBcl8s0zAVKoqI9YR1PL5lnCT
 K1r8AhT1uo1VPI/MEPszaS7tTO28GChLjF9qMI4LOznZPMLvPTuz/PxefEgtFJz36UgqHO7f3
 DX76ATSMoMQ92rxKVEhbQ1ad//xyXlJxA5D+2aU9Bla9YfWJm0x8GZXAdyjW0jT0Rmk67Vu1V
 tJmU+cQrdZJUXujKg+dw98ctIUC03FYAjgI4r/OB3r1XgzziLeAC13mO8HHDr5P8gSaGsftF4
 /hIsPcIixjleB/fMlEDWQ2FDKnOiQd+l5jJPFt25zJ8KIrQIImhGmaEkiFIQTz/Z9NOzGTb9C
 V1g3UCNk6/e0aTyBWZjcWf4p4N4gr0Tt2GgFf5wSetbsOjowyQsdLLP0ViKap2KNw97EWvCLq
 V0T4mlbS2BWYoLHMputEM+GUbW5Un4lKiO6kk9P65UdkcdaYgs/LQBWEgcTD1EtAvy/EDAOyq
 oIk5bQsQLaA+wrDJa9kgKfudzPXbhUQMWc+on/aar0GPbzoOKNYHGQX+VTBaUT4IR7/t1+Mv1
 gNozYhNS/Zdvp9fTyBzDcgr1lAKwfmZRRH50Npt974DZV0vR2ft9Iz7ODU0bqvtKZq2C7xFL9
 u7giPLjcY3hMygx9RsuJYZHRVUeAj7tINS68hFkfD7CmQg7DprYgC09kVlWUeLESTBB7CdCqb
 aJ0jcgQy8H22z9XD4rNW1M2nFoihykoarlttDa93SnkDVx2n6QXGQ+71bws+S0flZVz35y2dW
 4e1UXtx2cdmb87wC4emFwygJLLFBpoz7sZbfGS451Hk+ErbB6b+IhdMyA==
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

On 8/19/22 13:06, Jiapeng Chong wrote:
> No functional modification involved.
>
> drivers/video/fbdev/aty/radeon_base.c:2107 radeon_identify_vram() warn: =
inconsistent indenting.
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D1932
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

applied.
Thanks!
Helge

> ---
>  drivers/video/fbdev/aty/radeon_base.c | 46 +++++++++++++--------------
>  1 file changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev=
/aty/radeon_base.c
> index 0a8199985d52..1e6ac7ef3e73 100644
> --- a/drivers/video/fbdev/aty/radeon_base.c
> +++ b/drivers/video/fbdev/aty/radeon_base.c
> @@ -2095,34 +2095,34 @@ static void radeon_identify_vram(struct radeonfb=
_info *rinfo)
>  	u32 tmp;
>
>  	/* framebuffer size */
> -        if ((rinfo->family =3D=3D CHIP_FAMILY_RS100) ||
> +	if ((rinfo->family =3D=3D CHIP_FAMILY_RS100) ||
>              (rinfo->family =3D=3D CHIP_FAMILY_RS200) ||
>              (rinfo->family =3D=3D CHIP_FAMILY_RS300) ||
>              (rinfo->family =3D=3D CHIP_FAMILY_RC410) ||
>              (rinfo->family =3D=3D CHIP_FAMILY_RS400) ||
>  	    (rinfo->family =3D=3D CHIP_FAMILY_RS480) ) {
> -          u32 tom =3D INREG(NB_TOM);
> -          tmp =3D ((((tom >> 16) - (tom & 0xffff) + 1) << 6) * 1024);
> -
> - 		radeon_fifo_wait(6);
> -          OUTREG(MC_FB_LOCATION, tom);
> -          OUTREG(DISPLAY_BASE_ADDR, (tom & 0xffff) << 16);
> -          OUTREG(CRTC2_DISPLAY_BASE_ADDR, (tom & 0xffff) << 16);
> -          OUTREG(OV0_BASE_ADDR, (tom & 0xffff) << 16);
> -
> -          /* This is supposed to fix the crtc2 noise problem. */
> -          OUTREG(GRPH2_BUFFER_CNTL, INREG(GRPH2_BUFFER_CNTL) & ~0x7f000=
0);
> -
> -          if ((rinfo->family =3D=3D CHIP_FAMILY_RS100) ||
> -              (rinfo->family =3D=3D CHIP_FAMILY_RS200)) {
> -             /* This is to workaround the asic bug for RMX, some versio=
ns
> -                of BIOS doesn't have this register initialized correctl=
y.
> -             */
> -             OUTREGP(CRTC_MORE_CNTL, CRTC_H_CUTOFF_ACTIVE_EN,
> -                     ~CRTC_H_CUTOFF_ACTIVE_EN);
> -          }
> -        } else {
> -          tmp =3D INREG(CNFG_MEMSIZE);
> +		u32 tom =3D INREG(NB_TOM);
> +
> +		tmp =3D ((((tom >> 16) - (tom & 0xffff) + 1) << 6) * 1024);
> +		radeon_fifo_wait(6);
> +		OUTREG(MC_FB_LOCATION, tom);
> +		OUTREG(DISPLAY_BASE_ADDR, (tom & 0xffff) << 16);
> +		OUTREG(CRTC2_DISPLAY_BASE_ADDR, (tom & 0xffff) << 16);
> +		OUTREG(OV0_BASE_ADDR, (tom & 0xffff) << 16);
> +
> +		/* This is supposed to fix the crtc2 noise problem. */
> +		OUTREG(GRPH2_BUFFER_CNTL, INREG(GRPH2_BUFFER_CNTL) & ~0x7f0000);
> +
> +		if ((rinfo->family =3D=3D CHIP_FAMILY_RS100) ||
> +		    (rinfo->family =3D=3D CHIP_FAMILY_RS200)) {
> +			/* This is to workaround the asic bug for RMX, some versions
> +			 * of BIOS doesn't have this register initialized correctly.
> +			 */
> +			OUTREGP(CRTC_MORE_CNTL, CRTC_H_CUTOFF_ACTIVE_EN,
> +				~CRTC_H_CUTOFF_ACTIVE_EN);
> +		}
> +	} else {
> +		tmp =3D INREG(CNFG_MEMSIZE);
>          }
>
>  	/* mem size is bits [28:0], mask off the rest */

