Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AF5614E63
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 16:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B40710E3EB;
	Tue,  1 Nov 2022 15:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102C810E3EB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 15:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1667316703; bh=cDsCgGbMgxtrDxmKnfejjSiozbQ852sV0zOmQsq2ASg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=d5SlO76qBWk2Rv7VzqKL67vO5sbNDfwKT3edaP9wGp/Xf1r7PA2beSn+jt7ufmbs6
 b0UtmSWKxD0WOORGR3DXeFeGHVuM/1nmr/8MRMvfdun0kgLvsPNSJ11Z9olaR72DuY
 M6nJ0Ilqen2TmOmbtBDra9PBtCkaGWzu+YuuyY6eh98G7Du5+iEjG1O7iqYTaxxrsv
 WtluUWJc8OmjRLbxInEgkVkCBVC/6zaH3W27Td/Qp4XhHrAkifzmpP+nMIwRlVPdVs
 xvmwVQ/A+xanFzQyPrstBfUf4eV2Kwo7klE8UsyR0+e20b+6Aq4MUm3oo46vm8dnC2
 pgjhMBIbrnjZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.182.121]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzyuS-1pDjFB3B7G-00x2tU; Tue, 01
 Nov 2022 16:31:43 +0100
Message-ID: <9cca0527-3483-9a4c-6989-39ecd04c35e9@gmx.de>
Date: Tue, 1 Nov 2022 16:31:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] video: fbdev: omapfb: remove redundant variable checksum
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>, linux-omap@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20221101102947.27524-1-colin.i.king@gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221101102947.27524-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RfAhM3HtBD1GXQLwMI4J3pZ+iPhEykNECeoznkCJs3wS9IEBGYO
 F+REdpIvpAhP++JcQLj+hupxc/Am8sp6X2BtKc8PgH0dLzxMBMqX5WmNcroyt3fTYjfzhUK
 GCffkRMuy3Kcy9PXHtSUW7tVpg3VB5kiMW8qOdusmM1Bs494nWZSKWcjw/UT1C+LVKdsg0a
 g/M0bnCd7OKgx0N8/uN1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5Sp2FIn0Sx8=;kzxlJjblcfMoXLq+UIK7LweCYmA
 QmADwzLaJdsaWNmCS+jYXZxo+OFh2Lk9XRibXEAaji2APo0sPFiRtov5bvxMtyB5IwBN9TYNz
 tGTotz+ST/Ur9v4Tf4eif5mNQ8gEFxRybq/+LM9XBThWMpo7kNpc1P2OSIHG6nl6+hbb6Ov9M
 HSVUlKlAMh0REeC94fh8MWR/4gT2DUVuwYGJmfQSQLcfbdk2UQ1XcZ2nVrdoKWsH9UWjy1aGU
 9gFSOJOr59c1lcUApVtq3juwPS0nBOqBh1Fc/jx7iCvD5X+iwQKtp6Kz6umiWyyeQxM/aRLwE
 iiZ+Pw0fN2+pdbnCthiej1d0gIQJ2yT3qtUNBAxUYyM8ePZnfDJevSBPn7mMXO4q9PugMVo92
 wUmzW55qLzYAiZwQy3cKFkBhTp0WGjpvJTpdlHfmM6w8uMYOGH1VjOg6DJPGOPrjp8dB77qaC
 KY98SQmZe21UrmlxF7NvsGBH5NBK5HeCdhAT7OiimOAwVyaopvyAFe0D2ZPonIaNB0w2RIzL0
 iOMwVQajauJtExBjP+LijPq02aAYesPfi09oHSTkgs8PRwv4AUXsNFyAFoIyIRe0mpmbsg75G
 ILzT+0HXQUzvi8Q0N4DNv6ENMqMvTzWszmDEmkyRTHJBaTGohv5QaVptGVLoozOMpEICj21Yi
 EexMWsM9p1AKwbW3wxG+hPsPfnltaMt/0i5oi6k7/bvZ+S9wIicD2mF3R8CLa5UkXK82J//uc
 wsnNViysZkErtYEbyiPJdbbIbzW8MDqtVNkB6OqSw202VRg9bwPlxIbeMZyax1GBN6RUA39Di
 K/o5o4FWa7pl8HtqDJWVNsf5+Fgp4lH1d5sU2BDOqnVNHPEBbfxeE9DyE/Zh9h7y1B57LGquP
 xMYPUvlI7i2/z6aEdI0Sl0cdTNbuZSKiP2Tv/FyTJcZWiwZlxJbmSHI45JckKk7/4TscMBuOi
 QWgQnLiYKiGf773Yx/DKKBxOS7w=
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/1/22 11:29, Colin Ian King wrote:
> Variable checksum is being used to accumulate values however
> it is never read or used afterwards. It is redundant and can
> be removed.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

applied.

Thanks!
Helge

> ---
>   drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c b/drivers=
/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
> index cb63bc0e92ca..b33f62c5cb22 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
> @@ -129,7 +129,6 @@ static int hdmi_core_ddc_edid(struct hdmi_core_data =
*core, u8 *pedid, u8 ext)
>   {
>   	void __iomem *base =3D core->base;
>   	u8 cur_addr;
> -	char checksum =3D 0;
>   	const int retries =3D 1000;
>   	u8 seg_ptr =3D ext / 2;
>   	u8 edidbase =3D ((ext % 2) * 0x80);
> @@ -178,7 +177,6 @@ static int hdmi_core_ddc_edid(struct hdmi_core_data =
*core, u8 *pedid, u8 ext)
>   		}
>
>   		pedid[cur_addr] =3D REG_GET(base, HDMI_CORE_I2CM_DATAI, 7, 0);
> -		checksum +=3D pedid[cur_addr];
>   	}
>
>   	return 0;

