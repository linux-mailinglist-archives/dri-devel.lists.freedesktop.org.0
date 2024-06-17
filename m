Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CB090A37A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 07:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA8410E137;
	Mon, 17 Jun 2024 05:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="oKqy27b1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C58610E137
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 05:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1718603601; x=1719208401; i=deller@gmx.de;
 bh=7LGiMRoUbvViZ1dOXOlLnrjhwn/uJPjjN+/JOELi6L8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=oKqy27b1shS3gPBCWYfl/f6v7em/cc5jr15h5Lwi8cZwjii6/XiBVlxujr4pFnKo
 BVykrY5/Xkn5U6IUQqQC2cs0+TTlyGReY3quaqN87sAgrVzIX7J4HAa8CgVy166RD
 DAh+LTFPsPic9qT8qDYDDPjnr2oj8DluNcF3JKT0xxAZO6haXKGOWbL5LKcS6Bkl2
 q2Os6BEx6suxwI2co23CLUsNOpcghWGrs9mL1luaRyLOGi5kW1T4AO6eMgzJUYkmc
 6P+5Gx0ANGlWqxuwQpxlb08bfXjUGhlm9yqWA/v2fJ7pDIvF/INAoR9wqbdVuBloH
 5DmQseF3PbbSX0glAA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([83.135.217.92]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYeR1-1rwEy22WbD-00XDJ4; Mon, 17
 Jun 2024 07:53:21 +0200
Message-ID: <43626ced-4015-4844-96a5-de8705cb83c8@gmx.de>
Date: Mon, 17 Jun 2024 07:53:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 resend 9/9] fbdev: omapfb: use
 of_graph_get_remote_port()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-staging@lists.linux.dev
References: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
 <87iky8s7t0.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <87iky8s7t0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gn6G3Xa1o+7Gzg18WcNQSWUqfMZn8dif9vo61IKQlDgBMH2pgtK
 W3vkbScmTjUQVuakVii6O+MeFaA9g4qoIe6jnlBht1gAE06o9vyjBPg8bTDG6xXNqjn5zFq
 qjma55MMP8xcG0bFRKr+vFkjAnneDWtpIEPMHWbkSSPSzUw+o6JaxBMy9+/UgI1lELlERFJ
 MEbYgeYrm3VAI8NKA6kGw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DuGU0jojE+4=;u+A2WS3fSQyF/9FHEM/+PzImgqq
 vVROuPZmugNIknkQujg0xSnnPNSMT7Z54s4qInuarRR4AaD3wTX5aGK68jkNVhfmcFdbkcYf1
 wZl0Y4X1tF0OcAVPKlXlKh7V30GzotrvocZfpVLfJyNREYfmvZaBs9+EYAJv5xhC9b0DeMfHR
 jXuJifmHVw9FeQYF198JIUpNoj7GoiEisrMqBqdiCKQG0wwN5OYXpGasMZklo4QFPI0BCwlLz
 Fo5A1WIvBne/3p0ruMkI+YQiDOovJCMmUUrs5GiDSLq1NJg9N/VsXvBX6gr7seeZyZbE+kFTm
 +FoEOcIhlxOmRHBcerhr8zfbaAdnRwqY8wZeYLzfQprB/2i9lHRcVLXYl9jsEJYTN8tMtJv0C
 eJCtbckD3hsdZbpEdulnZA2Kbw9gu082d9wh2evkPgFww94YkHS2QB5Qc8YhY/R/HXAqIFvT5
 W4xTavgB3dovN5LJczuTbtIPbw2PiTUeE9aAGshIo6xiEN6MT3w9EEGdU4JNxSSoDLJIWdiOA
 uyNGIfphzbfkRY+ChDxq7rVsBz+EcacdjqG/vHWAfCW4iBEroHENv2R8TilBib5F8Y0+U9WBG
 7N5pYqkOyeAntJwliAtGh7Zocfq1d5FCeliQZf7mU8HRfjavo6bv3cUxBG4whLFJqO6oJsyn5
 PQXTM0eBRKv31Dyz9OToqJu0X2QrYJ4Gau2UHGeumLi119azl0BSBYfdfkxebxUAhFg4jYing
 463SXoIii0kB9FKqVa4ygH2LxUoFW1UO7MkAPU94zWb0jYAqsYGwoXQrS7L5IzDfIcb9pCbee
 oK+mqR/gMj1LiRa27x4CpbX6Sy/AarBO1e5C+DTgIetFI=
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

On 6/17/24 02:59, Kuninori Morimoto wrote:
> We already have of_graph_get_remote_port(), Let's use it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com=
>

applied to fbdev git tree.

Thanks!
Helge

> ---
>   drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 15 +--------------
>   1 file changed, 1 insertion(+), 14 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/vid=
eo/fbdev/omap2/omapfb/dss/dss-of.c
> index 14965a3fd05b7..4040e247e026e 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> @@ -117,19 +117,6 @@ u32 dss_of_port_get_port_number(struct device_node =
*port)
>   	return reg;
>   }
>
> -static struct device_node *omapdss_of_get_remote_port(const struct devi=
ce_node *node)
> -{
> -	struct device_node *np;
> -
> -	np =3D of_graph_get_remote_endpoint(node);
> -	if (!np)
> -		return NULL;
> -
> -	np =3D of_get_next_parent(np);
> -
> -	return np;
> -}
> -
>   struct omap_dss_device *
>   omapdss_of_find_source_for_first_ep(struct device_node *node)
>   {
> @@ -141,7 +128,7 @@ omapdss_of_find_source_for_first_ep(struct device_no=
de *node)
>   	if (!ep)
>   		return ERR_PTR(-EINVAL);
>
> -	src_port =3D omapdss_of_get_remote_port(ep);
> +	src_port =3D of_graph_get_remote_port(ep);
>   	if (!src_port) {
>   		of_node_put(ep);
>   		return ERR_PTR(-EINVAL);

