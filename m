Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D13D844801
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 20:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6DC10E6B5;
	Wed, 31 Jan 2024 19:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B5810E6B5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 19:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1706729524; x=1707334324; i=deller@gmx.de;
 bh=54GTfPx7NhIT/7kF1QnzMlYP44hFYBBnqJSy6GIZ0bc=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=KEA/73cbKnCEnt9TpbmS+LMB2PqtE82eaRpHA8PO28/imjYoLymrWour97Kdy48g
 1FwRIw50zwtZ2fqjaNp6uD1QXU5QV/wACm8ODhgnQuX2gK5MMU8QStrRBdQoySmBt
 ftdp+IMfLWz6k+BUc/gCb42UrwaUUWHpMxqNL8CAaJY3VTPVjORFXqBSqc7WzQuUu
 QgiFY3FsohYZsjmtJ5mhHitDdMujnuHo50nN0WzABg1YshHUezQ9KlLOavaQjSxIV
 pBwSvLnOYpbyp2e0TAULjq6LamcytJjVSbOD/yWlfPRxoN5/SUA/6s4QicgLZVSRY
 VAZVfMBSB5BiclVZFw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.150.68]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wLZ-1rOPt92DrX-007Qzv; Wed, 31
 Jan 2024 20:32:04 +0100
Message-ID: <7a563927-49be-4fd0-9da1-e527c65f63c0@gmx.de>
Date: Wed, 31 Jan 2024 20:32:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Restrict FB_SH_MOBILE_LCDC to SuperH
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>
References: <c4a090bd3f4737774351b136db72b15297cd0239.1706717146.git.geert+renesas@glider.be>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <c4a090bd3f4737774351b136db72b15297cd0239.1706717146.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XoyrZPgmz+bdHXOIOvyAYUoNulErbwqGvsg9Zd47a7RX9YERcFb
 dQUS8wnSECW4xQz1o228aqgY6EcU6GvGyIw1pgg80ywbkzGb/yCKTNJON5kZa06icRnUaLd
 1ElOTUHYr+SIMKVEjMwHBMcxkIQrzrfYWZmarAvD9NLhk6k/dbp+ZLPexMYw8CbtzQ+JzT3
 XWwqVVM9ePiFWsE5lPwWA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:w1bpGMjIkSo=;weW/hTFWvRlRsp4ab7w4grHQoGK
 EKrar8scrHlWhUwDhJDcpf4w+lERwKQdwylQd7YpIV4nR1yJxEp8WpulzSwKAaCOIju22pCc6
 V0wPlF0fCvFEB6XrUk5v5fqLs1Ukh9emSImQV8oNlcqERhRWRGnidNcvHfZ5GUbY/8MB2t2tT
 sG5zcn2unbf2KT14SJ4GqUEDiuP4Z5kr/MAOJa8wEcU1CavE2aqDhc1NJ3rnG2nc/i5v1EvVk
 MQZqCTZeA7VSVBXWidXYxE0093BvAuZTVRfLXD5bNWxOtJZec5zVNFOfdZPbHdL1dtu4B87YE
 kYJvuiQl+87xpANMLdCv+E70u8h5FBk3a7lYmHsB3+MpAYwLje7D11PZVA0mQ9ll9TkCfs+lu
 qxCZGDMoI3pv/wYsBQ0YWT3BlxejwX75sTuxPqLAeMmfUtay3qoWiclnMgbJD9Lzz4d+Z7Yp8
 D0vE1FWjFN9PV2DMQnC4Q1ZNM2K/1pokl5acLK00dMUliJXK7DoDAhP+OBuAo93MKz28sssED
 cWLtqp5LZElqBGs3GAYNfgOQawAJOSphDTXkyqPRSpPw8MIqwKQMQr9rDYjGJXtr0VeOJdNfZ
 cTUd4qgCx0x/E5SpKiWdQWqishBCgdQ9obJrqQnVr7JtCSTI+vd2X+M71VDeXhDE2+aaGWIiD
 rLYPBiDGVdNicGnpa1ml1ZBd7QiTdWw4kxrxpJVBYJVTgf/bRHMisNFsB9R6gyLZ72JAJd+8E
 mPNXDEBN/ypOzcEovuK4x2x1TxuKEsU4rpAlL0crqxAzx/hYKq4OYJEPDnIUnHmewxSOAI2wA
 LjHpXMpOjcZ6q9aJG6gFtxpl0BV0I29B3WSNnOpK0YrOM=
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
Cc: linux-renesas-soc@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 linux-sh@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/31/24 17:08, Geert Uytterhoeven wrote:
> Since commit f402f7a02af6956d ("staging: board: Remove Armadillo-800-EVA
> board staging code"), there are no more users of the legacy SuperH
> Mobile LCDC framebuffer driver on Renesas ARM platforms.  All former
> users on these platforms have been converted to the SH-Mobile DRM
> driver, using DT.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Commit f402f7a02af6956d is in staging-next (next-20240129 and later).

applied to fbdev git tree.

Thanks!
Helge


> ---
>   drivers/video/fbdev/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index 2d0bcc1d786e50bb..b688900bb67eed55 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1554,7 +1554,7 @@ config FB_FSL_DIU
>   config FB_SH_MOBILE_LCDC
>   	tristate "SuperH Mobile LCDC framebuffer support"
>   	depends on FB && HAVE_CLK && HAS_IOMEM
> -	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
> +	depends on SUPERH || COMPILE_TEST
>   	depends on FB_DEVICE
>   	select FB_BACKLIGHT
>   	select FB_DEFERRED_IO

