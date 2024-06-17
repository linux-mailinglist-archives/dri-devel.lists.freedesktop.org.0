Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A3C90A388
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 07:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4326810E1A0;
	Mon, 17 Jun 2024 05:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="L/EtPP90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCEA10E1A0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 05:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1718603962; x=1719208762; i=deller@gmx.de;
 bh=oakIaaFQS9p+3YLmGMVTxIkHRlaGNzy/TtYdT7umKlQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=L/EtPP902c111W+UWLnfE/Iu8ytGwWgNNGbZabhdiBwbfoNzsg+aaO6NnyJkhDD6
 Mq4PFvDZuesMOyo+8/ZAsBrq4SXCy3o9fu/rdLGlI3RbSNoEzALeqFbZxqHruYFBJ
 SAfp2Z2C3pjhsZLFsOX/4BNg5ITAwl5RegqdEZe3mj6ryekeZk982HErpfrBCfSU7
 LqwGjnbRiIIYKZznfcT4rXR+bGXGrU5ISNADASrGlXuESPGAtUVvN+XYcehtzGvam
 Y7dMEfwYxsv9tu5UnagAd48Rt4RPTmp3ckZ5P0i4oEJ1FR1mDreyBv7/dgMKXj4ek
 57EHsAxr8/BKMEtHsw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([83.135.217.92]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAwXh-1s7ppk1TmT-006VoK; Mon, 17
 Jun 2024 07:53:57 +0200
Message-ID: <84b56892-e172-44d7-9b09-a2eae3a24dd7@gmx.de>
Date: Mon, 17 Jun 2024 07:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 resend 8/9] video: fbdev: use
 for_each_endpoint_of_node()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-staging@lists.linux.dev
References: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
 <87jzios7t6.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <87jzios7t6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uNCDekLbyvIvaGfLmQqH/70IByajvIZVa+1xbf89g+5YDbKBgLh
 ueiha2kJVHFlaogibjkZSPK2pAfVZaK/aJ/aAEAyjGlWmjuNeyMlFCHAu+vA3TatyhcEJ4R
 vbyBlFA0kbn6S2Lf1VC6O11uWLhC/1I4R87xVy9IDMF5Q0kgT9ilw/6cWS1OEPoSFZZzcFn
 fzO4uXJI2v2QfwGl71Xfg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:j5b6W15cyxY=;ujLeTB78z4fQbmy7XEWAzww0oXz
 1w+8D0FL2xMakJhVI5kiUErnvv7AEHqVCdb52E3i2oVLqwQ77++/VyQuRcXyz8ED5TEyd9JMG
 eh5c5eJGLSYpNYsWJSGtnIe6QZLoRHf1MamRxMB+W046QFaKwxgFkSWlxI/XhR2ZiWANtRgN7
 9mEOxuLssmeU683jbaD4uiVIZjd0qYbiVG9zAWSrSEjJHIi0MjEx+Z0D3yWAHqE1KsGswItq1
 ZoWd1V4xUHN8Pu4V/tgho6I/6gjODGD82dQytwsxYJIndKXkCe8ophyeIMzPO7BeB9ouZ6Z0t
 BV47lDP9j39dfXfstNRVlWVZsC4Ebd8ayc0YUMeEY+RV+NlqtfatbMeoUTOHYF4i9XrT2268R
 EAwOdlI+ps3/MYVbjrfRPwyhzw85w98O9grRbgZLY3EsIRyrLrM4MuHIc0/MlIRBTBlTOhh/c
 5vlO5BEAIyLrF8vnn1/5f4jXeW8ILiGJ5s9OOYZliLQ88s8qwsYVgUWgBEq/gQH0IPuKNuCwy
 FF1z39yl9o1O4D3deRKxbJdfcjETSMvPOfEMJOEcD6LruVRgAaWDFKcAuldFAv359lBH4ztns
 IV8dWikwc2ffbLuAYAYBOzU6vb6hseaR1TZoBWsKJ5msqWJe+HmriBuD7bSzBAYL2x6RCl2bi
 NUNF9a09ImM/gkW45OIICeuA1xME6x4Nh9iq0JqJjG3dHM4LbTCj9Y+HM9rTBIMzrIUfUuTzy
 FGo4PsWXKAnj3SrHDyEb5WM4pGhLSfkGaOyEqyfgbfWM54fn90STLD1E9I0P5f3AtP4n+qvwb
 Kn2fxzE7qUqtN7Q5yneeutGBqnsVB0dYtYUKs9QFgvVnY=
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
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com=
>

applied to fbdev git tree.

Thanks!
Helge

> ---
>   drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c b/=
drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
> index 09f719af0d0c9..d80720c843235 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
> @@ -149,8 +149,7 @@ static void __init omapdss_walk_device(struct device=
_node *node, bool root)
>
>   	of_node_put(n);
>
> -	n =3D NULL;
> -	while ((n =3D of_graph_get_next_endpoint(node, n)) !=3D NULL) {
> +	for_each_endpoint_of_node(node, n) {
>   		struct device_node *pn;
>
>   		pn =3D of_graph_get_remote_port_parent(n);

