Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBAF7CB505
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 23:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507EB10E185;
	Mon, 16 Oct 2023 21:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE07A10E185
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 21:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1697490408; x=1698095208; i=deller@gmx.de;
 bh=d6tjiijzqQhQKa4d9B5bi64BIn8+37P4rH09K0TNgCk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=fW880YgfFGiPWR6gnyAu9yN8aKybPvsczrXXi3oKHWDCXOshb5ThdkCvB+m2F9qZ45ZSNlaTS5F
 USfUQvnj73mxGhkeT4IJfFsy/jZvvDIDEcGXJt411XIRe1d/jJqqNcckQR/HSHTR094bo72yQWn0y
 f/0G7/+Jhe/fDKnwbfTY/QSJLYxJPkSB3BxHTRLkXFFezJ4ZRmuHQrRgm2RHbGBEpb+PnK2ZgCJQQ
 OU7RIfsVBa/mpsn0PL4nzYNdw+vm5IKrtujiYAluw8+SkMTWeXLZQNe3V+0JVWhduK0oeqXVpLbTZ
 Z+GVYuIPjTEnLjca+N+pyWj4KxyfZbEg8HTw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.153.197]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPokD-1rEr8t1oIt-00MuL8; Mon, 16
 Oct 2023 23:06:48 +0200
Message-ID: <3ad85b24-4f7d-4031-ab27-d5c6516dff8b@gmx.de>
Date: Mon, 16 Oct 2023 23:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: sa1100fb: mark sa1100fb_init() static
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>
References: <20231016200450.826502-1-arnd@kernel.org>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231016200450.826502-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oww78UoT3556zyxNmfdLNIun6dvYXk9jadrobaQVz4Ke3P4xxcO
 5RcgOMbOl9NAdoDa55i132ZOvOqAZL5iEt+JOLGvJW9eB2l7PKfcDScXSt+17+JUpyJm5Yy
 Kqrk27CMl/ArKvcxBlRJk4Fc11B3R+1J0nPDmu0HZ7mlOCO0ZPZAiE9JT5LvpY2dzejnGlL
 0Qu5OMhDPh/VK02ibFRGw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NXFGhKVB1Ss=;t5w+h5GczZzzMmIu5idSOSmAJQU
 CPUt4xslxFC6MVMCH9aF90nkkhWCzff0sYrjWJwLBKbSHT/u/hONVVbxvl3s8EwK3UPUnuBHK
 dlJzgt3mGp5mfm90KqQKHu24AFzOnE5O61aO8RJrhQHjPDjq+j+BnqA/+EMdC9K3trMR03vPm
 3hd1E8gao+EhTERXmdjqAdMTpvqopTOr7U26T4M4eZQL+CRnCf2KLkzI6lZ82pkIOkbBcvNQO
 EcGZKoERagWuFWqRaVH7QeRYdy7owkpCSlt58KaaUYzNuCT/ID5u+F/7bgFDXBDMbMg8ZG4rK
 7cY3jThtJkxQdPM5L4ukBehVrJQQFyTGZFczeaSdeAf+6gIB67xxiaoBhSTKW+7mAnDeT6uh1
 Tjm9m1f02I677taUegWVUm9+JqfT6+UWrLTEeDjokYWkSB4PNQreZ7/0CnxhbChV4YNZXE96I
 dhsI6j6J0wwh42nZoHamBGsAaCjhDK+V+FCXyxqUxYEDiQg4X/aZDmxixNqt0/Op0pJQmKRF3
 AcB9PtCt1ePbpVKdpk6ihgKFXaVAWH7WgIroUeVdS/E/7kwDd2NK7mXNSYQJyC+ApCuENDQiS
 qeRjPtk5T+lXRVa4GBZ4BhA52+I/S0MyCG9kLuiPqbTwm/bvAIWSSZq4g1tAq0MXtjr5sBASn
 eh34AT2bbYaSvOFqJnSXyalKlERVuF7EUP9y+jupTuZd1BhgT8C0CPDnQ7gyiACJE6g0o99r+
 gRXBPpmeoMEgarLOuoG05VgXpviDBMW9pHHOYCAwbkSfqQeXBlvts3ZUkxtTf5yW8Yfrveu0c
 lGrWQxq384w/EsuHlJwLrVuVc5c2HgfSMgVe8Ou19xT1FJ3zdF95xNd4P2Gip6BvHBfClPCld
 zFDw7zDNBXNf8JGb2bn5uk7Ks+Vnq6UVV6eST24fJ9gx9gR7JvhFUx5N0m1lyBiTFpClCWyqJ
 MIBnVxKmliDvl9EuQjKjKteNzJw=
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/16/23 22:04, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> This is a global function that is only referenced as an initcall. This c=
auses
> a warning:
>
> drivers/video/fbdev/sa1100fb.c:1218:12: error: no previous prototype for=
 'sa1100fb_init' [-Werror=3Dmissing-prototypes]
>
> Make it static instead.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

applied.

Thanks!
Helge

> ---
>   drivers/video/fbdev/sa1100fb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/sa1100fb.c b/drivers/video/fbdev/sa1100=
fb.c
> index 63e12a7c1100e..e14eb634cb944 100644
> --- a/drivers/video/fbdev/sa1100fb.c
> +++ b/drivers/video/fbdev/sa1100fb.c
> @@ -1215,7 +1215,7 @@ static struct platform_driver sa1100fb_driver =3D =
{
>   	},
>   };
>
> -int __init sa1100fb_init(void)
> +static int __init sa1100fb_init(void)
>   {
>   	if (fb_get_options("sa1100fb", NULL))
>   		return -ENODEV;

