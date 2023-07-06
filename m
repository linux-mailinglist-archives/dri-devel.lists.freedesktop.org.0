Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4507B74A445
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 21:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0ABB10E49C;
	Thu,  6 Jul 2023 19:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425FD10E49C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 19:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1688670832; x=1689275632; i=deller@gmx.de;
 bh=a8EovxS7F3wo6/WJq5URlyIFDA9CAV8P4Cp0GextQbY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=LF5XiARbG/TyqxTe3XxmgMfjoqN34FOUQWCHCzxrtGALC3S7fPUkMtc5dWALqK//AFWHeeM
 3BE12FYk0fgpm7Z8/BchK796I5lTOyIxAApbiPzaABcFvXI+UzAmG2s0zNVd2f+C2ar/GY3BY
 cujpBjXR9OznVv9OHwSS4o3b4epYV6QN//JOw6mxOX0fzNAmKEZlO3vjZ/myX6Axm7mRi0Hoy
 eyi9+tOOfodRmtwgoeS3osXxK8sNHKwzKg2AhaGfa6S0+pWI5Ihtl12+FnW9yLF7fGBsVR7o0
 tG88fXFvvrHP0JyB7/YnkxWQmNIxZecPu9YkrHdQ7AxdhaqOvq4Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.152.0]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwQXN-1pyjBd1g0b-00sKuC; Thu, 06
 Jul 2023 21:13:52 +0200
Message-ID: <57cd2e4b-fcfc-587d-4b1b-eefad5416b61@gmx.de>
Date: Thu, 6 Jul 2023 21:13:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/10] fbdev/broadsheetfb: Select FB_SYS_HELPERS_DEFERRED
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com
References: <20230706151432.20674-1-tzimmermann@suse.de>
 <20230706151432.20674-2-tzimmermann@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230706151432.20674-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zeolCenktJTicAkt66ZEwDpjKCbugaTzUcsNNLv2dAfD0NZrBGD
 udrLg9fkmpmuBuDeinbFVz0vXycm68see7LwQxGGuqx1nSUmkGnNHRdNuahhvJCVX3YFevM
 UCP/TfYi48Ots84DY7SoD2iO+WGQ7xJ6sh+e52i9uzCkepGj0PLaRPb8yMM+mclyxVVGFJ8
 e3/G/WIBE1t3FI38SU4sw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7e0Fi/oszT0=;TzvvoMW3eP6qTSuH1GXFtAiT/iT
 EUiUBwcoHi4Qmhmk4UtgiIcLQKMMNIxrekc13x5U64Xo5EvVPlpPp7uisorg3CCNufEQeyd6f
 usMeZfNAkzP/EWf7KF2gqwo6jFrK686Riz2XaQPpXlBi9XQ0gQSYedaXxaSVIpi67mbJE6Rlo
 TiokWIE3gRjSokVJeG5giq4y0ZpKg/peziaVzdtVsuTHwDV+ut+Hdqga+v7v4QfuYv22m26Id
 Z9inqUpXSCKGY7dTL26WWx2mtfTDUQftU/4fzrxTGoTmkloKANR0RzjhWjcFPp4oAaPURlRvE
 adeNgp5MYQdEcUJSn3Q1EBGw35b1CjsPGH3s0STKXjbnm/zFUaOS2rQQqEYGxefMFazdThd9B
 0DJqN9NcPB0+0zBnuYv4Ct8q9PRRPEUknRldzS9CRphNdKZG9ECiCjY6NsU7xwDPnDEWNwfio
 /cXX0EzMINTQQq1LEKHGJf0NSPlz6/Uf1DAZ/I6PNdNW5S+62103Tk4TChVk5xoBrJMQTRLC9
 RkLW81gMVABpfAyUDgGblMyWmgUpM5y4lsimD0a0QslCDU/MyBbk1+lssJMPep4uFNvbWcUMB
 xHF/NpmkSS4PtjkCzea8Y416zSrB4b36HdLwcyVUfWhz1CoUHzcNv/nRstvhv4qPbY2mmavKr
 eZWpR80jofhk3RrRpUzS++zcC3upkEPn8AVRsE8PwQS7Pn4gCGuSGeJ3oa+CR2+ikGjSO+WXo
 0VKufnvYtKVISN4giLH08j6CDynz77OwtzEE8qaZUCrGxNIBGXbppd2lFpuzUglab/cx7NTp0
 UJ9QmzRh+fWGgWIwWuTbjZC6Qnt4mx9JsNBwhWn4Bq1RYvmcmo7Qkvz5jkSIkQisFrPfMpfe8
 ASg/hWOQj6/mzN4S/MsN9JmrOXv4jYofIDoYDwT7dAb6QEBP1kko2hmrNogeU0m/C3Sg785rb
 1c/0oA==
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/6/23 17:08, Thomas Zimmermann wrote:
> The Kconfig token FB_SYS_HELPERS_DEFERRED selects everything that
> is required for deferred I/O on system-memory framebuffers. Select
> it from FB_BROADSHEET in favor of the existing identical selection.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I'm actually not a fan of deferred-IO for older drivers, but
in this case where the drivers operate on system memory anyway,
this is the right approach.

The series looks good:

Acked-by: Helge Deller <deller@gmx.de>

Helge

> ---
>   drivers/video/fbdev/Kconfig | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index f14229757311..fd862faafe66 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -2179,11 +2179,7 @@ config FB_MX3
>   config FB_BROADSHEET
>   	tristate "E-Ink Broadsheet/Epson S1D13521 controller support"
>   	depends on FB && (ARCH_PXA || COMPILE_TEST)
> -	select FB_SYS_FILLRECT
> -	select FB_SYS_COPYAREA
> -	select FB_SYS_IMAGEBLIT
> -	select FB_SYS_FOPS
> -	select FB_DEFERRED_IO
> +	select FB_SYS_HELPERS_DEFERRED
>   	help
>   	  This driver implements support for the E-Ink Broadsheet
>   	  controller. The release name for this device was Epson S1D13521

