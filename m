Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 004EF4CFFED
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 14:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C834410F5C7;
	Mon,  7 Mar 2022 13:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B7310F5C7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 13:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646659542;
 bh=/O6l7hkL0uaacIQ/iMx/QBKyPp5fhtRwIBhUp3/cTu4=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=ccCdse4vpkfQI5F08kiPQ6PbQowNCfVJXRx3NVBLWVYFK1/TGbh+1VUT7+PLyhdh0
 kYfNIModpIgxB0p3u9eNJuVPS+cjGLiCIvcU0JqCUkWs3yZymyniTBFgJB/uRlL7wv
 97Xfw2PLCISx4JA55rbKZv5+vJmWe0ppOuCMVLbw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.169.192]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MI5QF-1nLU4g38PX-00F9vK; Mon, 07
 Mar 2022 14:25:41 +0100
Message-ID: <ea285d28-1b96-984a-b033-4c539c653d11@gmx.de>
Date: Mon, 7 Mar 2022 14:25:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] omapfb: Add missing of_node_put() in dvic_probe_of
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Dave Airlie <airlied@gmail.com>,
 linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20220307123816.31888-1-linmq006@gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220307123816.31888-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dZ56hsbY+6HJ6VDAQ/N9tk9Ko4iaHAHR03UaXmJm1eaWw1Mh/vB
 DG+3M82ZwLfE3FHRHEnwXmyUxnbSywthcLabvt57wn7yyuk6JkLuZ/mPez3kzsD0y9yHdSe
 /dq5BcbG3cGaJorKcEbmMX3J8mUatxag7lH4gshRI/XQjUTAUkvfC614OU2YwUkuHz3GttB
 YlT62iyEoYjBzGPrB2N/g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:h2qOqFjmeLA=:i3fGhRnr2uvK9ix8KeR57h
 X0QbM5PNDOIfSdqC7GyG/Klxj44Z1fL06cXkEZoZxyHwmaVycBdYU4N8Wx01WRoBHgNWUZ6Wj
 iM3haxNcSGCG9bSdstRgyFE3raPM4AnFcrZuFsmTAFwSUP6ZeDQa0H+AYkMQAjCqfPkXoTXt5
 J9gh5Foo/hB2BzjBuyDK6fOnA7030yBY4XD7ZXkasmWawF1pj5Xfao++Uf69Q9o2c2CITWzV2
 1AAppwsNg5YWw40O2/n7WMXfv9p/q06R8yNoMc5aL9AzOECogGikZE+XqwgmkToKLR9Q990QI
 j4jHPE3BU6hUaYwp+EL8ygnoERZbfUZIidtQXAflFbceYGsdK9o7hMKpqHmjwJnDNDitj61q4
 LaHd7WV0meErvwDE9kg/XpVFIxNGXzjUNa15SAb3x25i1c3u7MNXx4DmxcA2/wuL1uMX3XLnp
 alImYClUJPFAPNkEoqfxu0AGLbc8nC3ktvkiUx1MLNe33v68Goh7snI60Sh6o4qcyRUKrHXaG
 AV28nJu9T0qZSCVVve3pzRmagic39ZsUJZuufo38HHBdCimn+a+8+JRfHaDyTIPXqlgaJpMyd
 PVwu4w/TN5cJQC2D4c6XOJ1qD0HwU7zcTmJdM/1iV+IsMPFOuPVTBUHEEaAggtdS74HrvYmDv
 ZX5Q5w4FMgT2JKlubB6D0JJzpKakwQXUNgByYvSuw+sv81CbtAUJ8DIQGQehxSZudyZp+EOKp
 cwjFxgTpdWgF3CF9BzC301ct7GR9dNhMXrF/pLyB4sXJ7YIWk9S4i12NPHytFdddM9DHqOH5K
 pk1mARboHErVK5aFHV12VGdd8pWXYqPhTYRrM9lMRw9/XPYkIWFXdsuA/eiZDd2Snl/TqV5CT
 3qIKN3CuSV0vqCaqSz2NczdNeYYuQcSmXK6iVaCm1WsRvZFoClcL0AC5oc+ztvsHNiWKhHkoV
 auN2+tvpX0sFki1AEyJNXJzU8ocG5WwG1nt32yB62M3hKzO0wiJDLx1V6a0kZXRj1xWSL5bUT
 9DUSbFfcTpIIn1SGhvrODlG6TKgL153UIIYI2poQgRM7HyzdiqkiHHvwnM7/Dq/36hqnbUhza
 vfDfrWcHa4PNjs=
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

On 3/7/22 13:38, Miaoqian Lin wrote:
> The device_node pointer is returned by of_parse_phandle()  with refcount
> incremented. We should use of_node_put() on it when done.
>
> Fixes: f76ee892a99e ("omapfb: copy omapdss & displays for omapfb")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

applied to the fbdev for-next tree.
Thanks!
Helge

> ---
>  drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c b=
/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c
> index 2fa436475b40..c8ad3ef42bd3 100644
> --- a/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c
> +++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c
> @@ -246,6 +246,7 @@ static int dvic_probe_of(struct platform_device *pde=
v)
>  	adapter_node =3D of_parse_phandle(node, "ddc-i2c-bus", 0);
>  	if (adapter_node) {
>  		adapter =3D of_get_i2c_adapter_by_node(adapter_node);
> +		of_node_put(adapter_node);
>  		if (adapter =3D=3D NULL) {
>  			dev_err(&pdev->dev, "failed to parse ddc-i2c-bus\n");
>  			omap_dss_put_device(ddata->in);

