Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC2C7F896E
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 09:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4DB10E140;
	Sat, 25 Nov 2023 08:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7237410E140
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 08:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1700902666; x=1701507466; i=deller@gmx.de;
 bh=AUosW9V3IxDxK2liiMeEPjrj2fM3ItCOEQ5c6OvqZPk=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=WxaaOn7bIBcWueoAWMsiRCJEHyE7k8avIvZiWX/oRyLUVCGuzlqZwieH8MQ97jb9
 XWvE7QnR9VawuL4deiiM7CaCJpxg0N8ZrPWxJ/juwe0MdBp3g0Li16kwNL7XaIvsh
 zJUDw15nU6BOFYX5w4Thkva26NJXNcJX9OwcygFwJrE9FfFDxzRAzR8sz/WeJXrTj
 KYf3Olo6G9jYQvknoZP8+bPEM5JkDBxbLV1ZRW5WhCxBFUmap7xH02IwBRWdQwG2r
 pVC5xAhx90J6dlMNoxnRI/va/5eofeMfi9jPzfnLePRCyAbRRSCn6mSe5ltN1WAhY
 k2Sy28OSZDsc4RgeCQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.47]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MG9gE-1r5fMs1aua-00GZvV; Sat, 25
 Nov 2023 09:57:46 +0100
Message-ID: <8dfad83f-20b1-49c9-bab8-ff5259ab85d0@gmx.de>
Date: Sat, 25 Nov 2023 09:57:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev/fsl-diu-fb: Fix srapse warning due to
 virt_to_phys() prototype change
Content-Language: en-US
To: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
 timur@kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <170052488691.21532.13211751644917367476.stgit@skinsburskii.>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <170052488691.21532.13211751644917367476.stgit@skinsburskii.>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4lzMUy2YNes4bzPay43m9jOyqRjehRDiEyApuWC1KSIzYRTWqrm
 B/TrNJQirdGlwWz+/vFfLer5+9QfrAghleMeIf1wT7UuAfgcUIN7co0AXAhAu1HXB8sTDEU
 Qh5A6CB2tvshUgWnbR+2nSn/dOX4wVxzf0Fr/Axo/Tt09jLh5aSkVhrsmmNyVoDLXXIaAKk
 VdJuC3Wiq/u1OR5W6wocQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vJNe/opcLO4=;cjGPSWMCoIY0iRlfq3od+qepdBO
 D316Yt6UGVQZ0BqwBEf6bTmAHnLSQmLtWLZTEjY8FRr7hPY2Ms+DrAxsZlvcaekO9G/+ESwCX
 rjEaBT5Ya1o2HY/J5JiZzevzJQqhjJyedrqWw5h9i/6R9K0QTchO8dVgrHC55Gp7nZ/d+Vd59
 9wyGFbxdPrmV0UjZX9xIAY0fOUwmAiOIGuDGxeAykLDictCh/Ej6fvOEJ5GKeLzdyE3735RcH
 5TtT8wk9K6Wa7Z2aqKOk/bceu541b5rhxiPRQhLib1RLcYG48RgmJMdU5wQRNFNM3+hrvD9tP
 +yMJItz/j3mzSxhOPBCdmtd2jTwhgp7txYbYFYJkSo4Ov0OPKdIxv0zNh2fXBSpzIYbx1yqab
 exYvY20cyz0+HAG5sKsCpKtMGxQ5XavigUyc9w+vyp7fK4/g7ZPNCGrdOOAoD30nG1pYpEvSi
 gwByHjx34cHd4E7442LuFxmc9buwhOqPJ8IHDohno/2OjusQEkREBkbHT9slpTDYww3wYJzVW
 fYNxfKSBa5YdlJlszErXm1wzaWJ3lasstl7EfjG46TtIkf4N40BDYhatb7ZH7kmZH4mKbjPxb
 9R92a8Q1gQgn8KVdPn3SjjwN3kJEph5N6ulcXJxS38P2N8JZIrmdu6JQvXVmru1vLKlaqQcWP
 kUsxiKPcViXzUO7wfGOZGyE5oZWyhu0yBukIKp5A6kfteiQIqgg4UZeAzym61VCHX4XYbA/th
 1eqBWTxj+MW3mpM1J7VJ2E16jIvSh7h7k0uVv8haGTG71y2J1SuO1acT3zuEh79kVorj8kSHl
 MJLwG/pf8uQmb/7arhVParyOtIwwjGaxyJUVBdbOGhK6rHHWatknX74EOED7LCWo3yMZUdFMu
 JX31gchl1SfPu2W9RDO9l92ReoAkE/P/JWW3a8jCXErtKdqXcLshHRB0WXrOQ5FUQS4rIXAuc
 IT9bLlBAAWEBdP484jgpCJelMA4=
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

On 11/21/23 01:01, Stanislav Kinsburskii wrote:
> Explicitly cast __iomem pointer to const void* with __force to fix the
> following warning:
>
>     incorrect type in argument 1 (different address spaces)
>        expected void const volatile *address
>        got char [noderef] __iomem *screen_base
>
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311161120.BgyxTBMQ-lkp@=
intel.com/
> ---
>   drivers/video/fbdev/fsl-diu-fb.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-=
diu-fb.c
> index 7fbd9f069ac2..b0fda5bd1964 100644
> --- a/drivers/video/fbdev/fsl-diu-fb.c
> +++ b/drivers/video/fbdev/fsl-diu-fb.c
> @@ -877,7 +877,7 @@ static int map_video_memory(struct fb_info *info)
>   	}
>   	mutex_lock(&info->mm_lock);
>   	info->screen_base =3D p;
> -	info->fix.smem_start =3D virt_to_phys(info->screen_base);
> +	info->fix.smem_start =3D virt_to_phys((__force const void *)info->scre=
en_base);
>   	info->fix.smem_len =3D smem_len;
>   	mutex_unlock(&info->mm_lock);
>   	info->screen_size =3D info->fix.smem_len;

applied to fbdev git tree (with some typos corrected).

Helge

