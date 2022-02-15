Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 406A04B7520
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 21:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E0610E617;
	Tue, 15 Feb 2022 20:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D0410E617
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 20:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644957995;
 bh=0OSbOP7dVuxah5dzxOSWPDpWQt+waq4IO/yrm245na0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=RM8lbqfXj4CquNffPjLDAk/zqsA2R7oPEntJIfErC/JFzifQUKiCCwI3sQ/AwS3UH
 u+PDvEN61F59Ofw1QXdQ7s99jAvoAWJRtsvl3CYAHnhMh1rMymay5Nv8yKR1A9xG1K
 XK+pIDDlkBrtJwgBGiQ/YPmKR4xRWeE8wNcYaJAw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.185.100]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE27-1naNTk1Cfr-00KivD; Tue, 15
 Feb 2022 21:46:35 +0100
Message-ID: <7e60cd01-8afc-ddb5-a1bb-6e9f53ccfba5@gmx.de>
Date: Tue, 15 Feb 2022 21:46:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 22/23] video: omapfb: dss: Make use of the helper
 component_compare_dev
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20220214060819.7334-1-yong.wu@mediatek.com>
 <20220214060819.7334-23-yong.wu@mediatek.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220214060819.7334-23-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MjTT6/0mKscyzurmEJq+TRDLFWm722/o5oh1VceIWTDo9Su6z33
 Uqcw4r79WPXMZ1MHVQ5YZwMpT3/LUtQYuMEKT1s4Qsw268nztXs8M1PHTdwFSaaX3fRCVHa
 I5hj8j+9RzGYlu8e8qiZ43jIdVRKdmD+CGxvzWPF1Cw57f4/4D8ejp1FysOEiqU6iTGSqwc
 ErfKQfh2UKAhLIHNSceWg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EO1+Ylb+ev0=:HpXUahwDBxS2Q6GJ/UdQMa
 n+62M3husXUXoHxxs8AxzjuuYDkqIBegYnyeAV7YgP0Mle0rT21+2LEV21Cm/oK+NdFah8S9W
 CpzPyAZIRuU01jq211YudtbXnvFOMgwbjvey4rIl2NTTJUDs+3nbJ6EgXSJwHO77nbgaCNttA
 G+VtN7qVCXCtu780Msj9tZjo7C1oDNvtl1Z0DVM0OdyjyuO5D93T57PbebQJO+46L8tQ0bfg4
 PClJhDBMO98xxmJRVp6iBSjNS7q7geteQaZ0ZJQVZhNyuKpKUNS7ESMvNsPEhSTzcXNJDdgSx
 Vq9g3AnCPk01P40v1QI4BqRKbdc93kQn/QMzvwnd6VKhhT5hOO0TqppV8u07Mwhznrax7VcRW
 +v1Ixw3WjKmrwEdG4wxBOsqT1dFC/6QoqorX3z1sqp7Ag6Ncwj2vZEjoNZ1YUThIr4BpD/vWq
 hjpVXVTw/vir74eHyvdnz2eZXfQD7YPWYiK3z1oTwSGkoUciP9hPqvp4WS1qWPD3Wx4UiMz4y
 2dpK2641P1xHzfATt1y9hhMgc6vt9XFxpm9Ycl0uN+Nf/W9WIYa2fD+vPujh/CyO3jLklKrNP
 rhbT5NjDJGfC/AFaC2iH75aCY+P5r1pQZOBnvTunjmLUTuER4bhCqMQqM9G+WAIVA1mScRE7x
 z5RtmJWkKSwplc9SI/e09hsIAALu0cz7R3+T3vF1BUPB0RwiiTFPg2EbSOsu0l9GrJ8CkvoHP
 6ajgPfPMXcn62tOWZWD9MMtunWjyjGeCeU0sZsO37FBgxO6O75XX5KNPo3ZtVKQ/rb45z2Rj6
 BmFoOKHsV5p6ypFwr9d2I3zNEcl0DYDNBnMwKA/3QTkYeOJgYkBDK8DU7dxFOUM6q9OWcMRcY
 NoMQI8g/0H0GxrMHZA3BmETGV399e4Ve0zB9yhBv/cd9YdH0LKj0wm2/KEIbC/oPNQrOB040l
 zX8J1rybbjKBBzimlhU2e1yTmGHdV4geJl204qxFdDOHSN0uiAnzvI89ljAQcys4MdV9EpQSa
 NnChsjeiQrZB5ZntJzdsbaO7RJJahTHLc0+epBUeuUd6C0orPGZgiQsH8Kwcy4p8Uu6vZoYIV
 JC4pPsVjDwiUHc=
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
Cc: linux-fbdev@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 James Wang <james.qian.wang@arm.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/14/22 07:08, Yong Wu wrote:
> Use the common compare helper from component.
>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-omap@vger.kernel.org
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Applied to the fbdev for-next branch.

Thanks!
Helge

>  drivers/video/fbdev/omap2/omapfb/dss/dss.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/=
fbdev/omap2/omapfb/dss/dss.c
> index a6b1c1598040..45b9d3cf3860 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> @@ -1193,12 +1193,6 @@ static const struct component_master_ops dss_comp=
onent_ops =3D {
>  	.unbind =3D dss_unbind,
>  };
>
> -static int dss_component_compare(struct device *dev, void *data)
> -{
> -	struct device *child =3D data;
> -	return dev =3D=3D child;
> -}
> -
>  static int dss_add_child_component(struct device *dev, void *data)
>  {
>  	struct component_match **match =3D data;
> @@ -1212,7 +1206,7 @@ static int dss_add_child_component(struct device *=
dev, void *data)
>  	if (strstr(dev_name(dev), "rfbi"))
>  		return 0;
>
> -	component_match_add(dev->parent, match, dss_component_compare, dev);
> +	component_match_add(dev->parent, match, component_compare_dev, dev);
>
>  	return 0;
>  }
>

