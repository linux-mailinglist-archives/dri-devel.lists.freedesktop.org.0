Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9EB743891
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 11:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAAF10E11A;
	Fri, 30 Jun 2023 09:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD36710E11A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 09:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1688118226; x=1688723026; i=deller@gmx.de;
 bh=PuRc/kjIJIbi993cRBfu1ZPq5Cu+mGWLjbyY6TAcpcA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=C0Sy+tSwxrPYRv9san4TkYmJ9Dn+Zn/QhAAE8heytRtUXj8d3liwcblnTUw+JcsTRqQyWaX
 deacT3vvvm7dCWGouuMASxV+UkZ4rrNfFCaJkhfedFYvmfUEE69soeRjLw40NMtSeuEW0N590
 3/Rwh4OlEc8gl9Gs+AImVHQvJHtQQiJhMZzIWGaLDCgQnI+dJDuzhHUTxjJXgVQWvhvJJKFNt
 0FmG9Z0iPCyqP2pfbjZk5SVvI3JKqoZyrtqP6nodohy2va+jRKTxmU2pVehC2cklL2t4+6kDw
 IdA58xtjG70KckDIVqnXNsCqxvVp/+Z2uG9rO/F1GuiYz8XQyrYQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.148.7]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbAgq-1pddzW0xho-00baOz; Fri, 30
 Jun 2023 11:43:46 +0200
Message-ID: <a290cf05-8f6b-3b88-32fc-66f6a173d5c4@gmx.de>
Date: Fri, 30 Jun 2023 11:43:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] arch/sparc: Add module license and description for fbdev
 helpers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, davem@davemloft.net,
 arnd@arndb.de, linux@roeck-us.net, sam@ravnborg.org
References: <20230627145843.31794-1-tzimmermann@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230627145843.31794-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yFwZer+4cG2YpT/RBVobGYrSKl6RpD8WYAB8kDxZX2pgR9rx+6b
 5+LkQKy3oY54y/yHI4nwyqoH6f99IdAmhTOsm5LWc9c6u94GPdYJ9pta8KYqD3VOqnMdeEm
 goMGdoHfztRcoGowJPelswASZm+/obYDXSwFpk47AfqWXhOHaT4M64mv3wYHijMGtzirl21
 lFjjJKreU7Rpj7h3ZXFPg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QPJwbdBNydc=;z2kDlcTPmJhN2ALEqfEsK8CRWrt
 LjgtAsskQHWMNsYqjsFa6VIaUOeggBH0vIjEL0d9JR8BhwamjFBT0v+3GZX3CEEJpRFrc5RY6
 ehaq3kYd386+nmrMp7lPr+k9cEWXjP9bofQqDzUaTmJcjmxU+jg9dQNB304YMsahq5jUTHqvD
 omSkmQGefbKGYT7frdUq5X3efy+lC66Xb4bcwGIIMmIe3ykUOLXu88beyNjfdl5OzraE6BZlX
 83VjGrCxPRkZ/b6ooIXidw7UdCB+pCHjRwB+/noiCEcaQVt2LiUo/MzHYvILC9JBn8VKRXvvO
 0VUcXfba1qZfMV/wRlONo2LPSiaPdeek0opXQOTlMOTfxgClqPHqwRvXEVPeQyGgPo996V+gG
 pYIccEzS+yqJG6WGJY91AMF1D4N93a0jxsaElUcD+7TaUFNxCfPaYm6N1ZgPmW6j1AytczpI8
 NEBEuggsQcF9YcoC/mTwxWGaS6VBD2Rw9YwhzkZzRdL/rAwGREaXLwEfW6tVTzrPNwk7WWGek
 sXMkbAhe5OYYdh2Rgu2Zz0HNBMyQ/M7hCyKeQAtKV6vqhjqz1Zl5tsefuYSdf2BF+3AP+kHYt
 d7IIQQsRsQjwBXCNuIROBSc5piYS3HfuyUyOXEYsA914FdLyG1lbViAhOV3z0R6Ss+1IBkEtX
 Ood4/20Jagmoues4FnND7qIfWOCHWxoVvVWRCAsLYc4VTwtLdOMne5Qj18RHK8S2A6TtDd2b4
 lKh+D+GMdIlpcKzVd619djOwF67YSXOsxw0KR1sLpZCLNYSc0xsmudmqCEggkyCfjJu2DV9Ge
 6PSVGyhf5WctJ2PvW/rC9+CpV407z2KQBs4nI/znfoZOIwcQ/IBPK3TSUJEKcxMPUzdRGRiqY
 QJka7ZJSRrSpix0grFnDOZSXboZPtK0EXg4t6GP2MBpzalP44FaGVXjENfEVRQ1AEW4y9F4p9
 ntyjEw==
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
Cc: sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/27/23 16:58, Thomas Zimmermann wrote:
> Add MODULE_LICENSE() and MODULE_DESCRIPTION() for fbdev helpers
> on sparc. Fixes the following error:
>
> ERROR: modpost: missing MODULE_LICENSE() in arch/sparc/video/fbdev.o
>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/dri-devel/c525adc9-6623-4660-8718-e0c931=
1563b8@roeck-us.net/
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 4eec0b3048fc ("arch/sparc: Implement fb_is_primary_device() in so=
urce file")
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: sparclinux@vger.kernel.org
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   arch/sparc/video/fbdev.c | 3 +++
>   1 file changed, 3 insertions(+)

I've queued it up in the fbdev git tree but will drop it anytime
if someone prefers to take this patch through another tree....

Thanks!
Helge


>
> diff --git a/arch/sparc/video/fbdev.c b/arch/sparc/video/fbdev.c
> index 25837f128132d..bff66dd1909a4 100644
> --- a/arch/sparc/video/fbdev.c
> +++ b/arch/sparc/video/fbdev.c
> @@ -21,3 +21,6 @@ int fb_is_primary_device(struct fb_info *info)
>   	return 0;
>   }
>   EXPORT_SYMBOL(fb_is_primary_device);
> +
> +MODULE_DESCRIPTION("Sparc fbdev helpers");
> +MODULE_LICENSE("GPL");

