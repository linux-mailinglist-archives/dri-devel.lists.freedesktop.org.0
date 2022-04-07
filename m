Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE994F8839
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 21:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4336B10ED1A;
	Thu,  7 Apr 2022 19:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2572110ED1A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 19:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649360579;
 bh=DlbOpXdlheJlXvoOey1WuM162xwLkn8EcO/3A3LfIes=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Lbd8lLb/7vXjDrUIJYIKdXaq8TAtqGBMRkyvId6DdHRnYneQxpk3T0KISjtqkoT3T
 SrlC17VfhM4yn0eyvzpJMrhoLPvEt0cfeFXHUFCwgrRHKi0FSgpiUUS2Z83+cDMLax
 KmiO2h1P8ijiNnX8iZm1/Rxl7hji40KvMxK78x10=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.161.122]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLzFr-1nKkAE36sj-00Hzfk; Thu, 07
 Apr 2022 21:42:59 +0200
Message-ID: <67698385-b2fe-2de9-9775-9f6320a0e9e3@gmx.de>
Date: Thu, 7 Apr 2022 21:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] video: fbdev: Fix missing of_node_put in imxfb_probe
Content-Language: en-US
To: cgel.zte@gmail.com, s.hauer@pengutronix.de, kernel@pengutronix.de
References: <20220407090122.2491922-1-lv.ruyi@zte.com.cn>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220407090122.2491922-1-lv.ruyi@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p8vzFrrvIKVFtaDT5l91hwUiLPe13/ZAgxzuyd2hmZIvj7Byh+E
 bTNrO2hlWJyT3u/MXuenFvALE+UwOdfIacAKaHtRH/4at5tF8O2x33miZCZSrd5HVyRuVSl
 uKygwSj3diqZz43fAJYPAVr/6FSb/UZxRBISPq2bS1hQj8AuZMdCTjutD0IhOWzFdU2+i53
 B4UU9mCfo86WAK2ZpyZpw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nSya5LOwODc=:cgSo9LhYc1r+hG/4cgQecM
 12G9trd22+0oCEANd3ainclAvW/QD/eSrhxPR1XtDBjD6ZZ/YFV4ga//5AdHr6wEMZnWWcLDM
 yuDG6K7eEB4E6DU523PZwq2TI+H/0j9zBPn2cd0kGLeZ40vEp+KmL61HwuGTaS0bF/QUqSFTB
 3K8Vl+gj3fq8Em7QeGTY4h8v5raT3g1ebn8ohAk1N96L1ljcJ9HXqDneVNdVDlKkCQBC0fpm4
 12kK4L5lhj97Zcu1CwI436u/UQ8014z5rT83GT4jrx7ghPcMlAEKkULmXD4CYlkODhbfz68Tv
 x2G1wTDDPc/J1pqelovoRHb4OrFw+UaeIyU5Xjdq1ScH2mXFocWWzc+MRRiCVR0qPgGjNcp34
 J5ErKpypexvgFbyjugebVC1NPDCq0Fy2Qwz0qX+tV8DCT/RhwpRfm4yI90B+21VpVahpgzE32
 B+YcHfqjK7kiPk9yF3mq/armeLo/SoK+P5Io32qv8nvBkL31B4QWq2Ou+UMpDmp+FbguPH1Eo
 DaVkeoFkKF7vcxl8ru6zjdHzIKIr+qeaNMLR84RqAuKfuexikuqGIHupT8V03UPn1EWOG3/lh
 cgZ8LTihVcw+ZQu8CS+qKTDFuAhaC23vHdwuCYRjxBqIwTrxxUNcPCH3CA7+kYIf44F9TJ1f2
 haQQNNROjzUxc5Bv8SyPFbczmIwkElSEoxTHfCMfkhU76W3U61DfNJ8Piwa7EGizbeTr81ea+
 22CGjKc7tu58mLawEYjBoPFnbLaqKH33qZZEHpGTFDDYxIzTai/Q0u8ugA9b6AKq+8XD1pTZC
 Z0tEv3muzdfay2fGp6fY0VmktgRw37lm2Fy6YqXKFXTrVv7AGueC241ytGLevuwLI5HsmkduL
 YDC0+pPzVZs/ZEP5JrT0uRPS1G0g6dti9cS4chCJoF8SXS4vWUtjUvR9zTGP78qUW5wXX8kze
 bo5qiZ59Y6FxZyYt2qYzaENTo+yvxiB/Uk29JLGI20HPrQJBKAYc8RGq9bYkfO5ErFn4Ow6/a
 3vx3O12SNuhMgsuBaMYlJzJt0Kyn3FGz5lq8ApeduogKLAC9rrOO3zCD8V0AYrcnv5L9w4IeB
 GapnAEjcdNehBI=
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
Cc: linux-fbdev@vger.kernel.org, shawnguo@kernel.org,
 Lv Ruyi <lv.ruyi@zte.com.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com,
 Zeal Robot <zealci@zte.com.cn>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/7/22 11:01, cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>
> of_parse_phandle returns node pointer with refcount incremented,
> use of_node_put() on it when done.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>

applied.
Thanks!
Helge

> ---
>  drivers/video/fbdev/imxfb.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
> index 68288756ffff..a2f644c97f28 100644
> --- a/drivers/video/fbdev/imxfb.c
> +++ b/drivers/video/fbdev/imxfb.c
> @@ -925,10 +925,12 @@ static int imxfb_probe(struct platform_device *pde=
v)
>  				sizeof(struct imx_fb_videomode), GFP_KERNEL);
>  		if (!fbi->mode) {
>  			ret =3D -ENOMEM;
> +			of_node_put(display_np);
>  			goto failed_of_parse;
>  		}
>
>  		ret =3D imxfb_of_read_mode(&pdev->dev, display_np, fbi->mode);
> +		of_node_put(display_np);
>  		if (ret)
>  			goto failed_of_parse;
>  	}

