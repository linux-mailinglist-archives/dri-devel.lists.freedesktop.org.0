Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A30A89453CC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 22:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC6710E0C1;
	Thu,  1 Aug 2024 20:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="TDKAyXJl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C8F10E0C1
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 20:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1722545132; x=1723149932; i=deller@gmx.de;
 bh=Val38mT4EFBf83cRJQQiOok/CpEe6U7DASQ5SF4Q5Kc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=TDKAyXJlZduayWRqQPQA1wZM5Qa0HKKF3Jw6vQCv8FVpP4frBJX5tbkJPeghtw0z
 xanlDrZjr3GXmLH7eiNj7Ui075/uoHXZBpjTxrn793kjiB1eqX+g/O7xPfoym43JY
 mGhs3Xqnv7IQVjoGOq01AiOoCJw3DSQNbLRQ4yS1BG9cr5mwvRIxUivD8p0VymF1w
 K65DxPJ09prmsgD7RpDZlQwQj/yngXjyrgbZkfFzuRD/1MNzaWb9rFQte7sFlGhPM
 DqK3OGrvSSfaiKOXreSu/As5HpfOm5D3OupYGJ++EbKM7hyKqMKWVU+y7g61bl0/x
 Lk14Ac9+OfBxUqClhw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.33]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McpJg-1rzjd03GUM-00lfVL; Thu, 01
 Aug 2024 22:45:32 +0200
Message-ID: <a7a1b5b7-9d98-4c3f-a5c4-36c692c12418@gmx.de>
Date: Thu, 1 Aug 2024 22:45:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] video: Handle HAS_IOPORT dependencies
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 linux-kernel@vger.kernel.org
References: <20240410142329.3567824-1-schnelle@linux.ibm.com>
 <20240410142329.3567824-2-schnelle@linux.ibm.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240410142329.3567824-2-schnelle@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lzYvjcjDyDNxEaHtrDlJ0rIuzfB/w2Ev8lE30ZhORoaIL1jTTo2
 WDuOrQkwWQcwBm71GpUHs7kTE5nQpoMP8wNnBda3FotxwQ9YZG6Uahzur+1iOuzT3LO5bY+
 svWo1mySdZKnoAxgO6JVy6mA53kaYjqAK5e7N16QlY/tktEBm10Ko9yvLxPe0LkkJrue95Y
 SGYxdsw/pDGuHnIJl0Vew==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/JHtuh+UIs0=;wLU1+TfU5Egd/kMuFonftWx3N52
 stXkP4Wzdoi3LaKPEQAfmDoAKlXT3rCQH6k4Q80BGVottqaFGfYJnL6o+Y9zgSZUg6t7XtneY
 J+Tj0OJCqNBTw1Z/Um5n7wYuD4gUtKtj9SVqFYnkxFaz0SDeNW7W+bu01lotppDxSQOrhWHVK
 IViq4cNsLUCQpIY6SsJEb0WKJRvzyX9Q05BfMVo10mI4U6iKhAtbt70Jaoz++Xfp4giGizR+1
 jwhzVsZo3xLUhm1lrIPYcuJbomzXwM7Bou9Ytr0fo3tlYDNrT+rpixRjlilOR2aiLGF0pigVD
 TEoK3hUxy3lAU9HHYY+XfiIxXW0YQjS5MB4yCgmlkIW6JHSw/Z+T7HlLfeUifFKqYLgtk4Il6
 yqarvNQsAhmGD1W2k4KR8uwYBc/yHpeoHzb9VuKn5mEM0CAdd9Spij9/JqIsK6aTTFQMgqq+q
 7sk5ZumFCjISV4MbMejlHPMxaYQM4c5Q2S95jL9CZSDEVDV254VWlNM2SGLiX5tgh7N55SRRN
 QF668h4gZJWIqD9Qp6TVfz3RrpueHBt/zzC/ssEiPTKwb4m9AAgwp8ugbGq5ifjfFOHlpazHo
 uH6MAKX0ArH9Ihf3S4pcQiVraVH+rFxRhGeC2rkE6Ya2aBEx08n00YyDq2xnGWcAj/g8075mi
 gx2kppZfk9gt4vP62neoY5+3fFaw8jbmjOEB0i62oPguphL6AcBxF9Xp8USvR1yJEZRoH7p3m
 LjrU3JeExPwrrf587cCbEwJ3ug/m+LaAYB6lZtZJmSZdrvovB3K20nCdytmTBJXzsrXhwN4cF
 yXbSngScbkjlMOmrTaYbGcyQ==
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

On 4/10/24 16:23, Niklas Schnelle wrote:
> In a future patch HAS_IOPORT=3Dn will disable inb()/outb() and friends a=
t
> compile time. We thus need to #ifdef functions and their callsites which
> unconditionally use these I/O accessors. In the include/video/vga.h
> these are conveniently all those functions with the vga_io_* prefix.
>
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

I've applied this patch now to the for-next fbdev git tree.

Please let me know if you prefer another patch....

Thanks!
Helge


> ---
> Note: This patch does not depend any not-yet-mainline HAS_IOPORT changes
> and may be merged via subsystem specific trees at your earliest
> convenience.
>
>   include/video/vga.h | 35 +++++++++++++++++++++++++----------
>   1 file changed, 25 insertions(+), 10 deletions(-)
>
> diff --git a/include/video/vga.h b/include/video/vga.h
> index 947c0abd04ef..ed89295941c4 100644
> --- a/include/video/vga.h
> +++ b/include/video/vga.h
> @@ -201,6 +201,7 @@ extern int restore_vga(struct vgastate *state);
>    * generic VGA port read/write
>    */
>
> +#ifdef CONFIG_HAS_IOPORT
>   static inline unsigned char vga_io_r (unsigned short port)
>   {
>   	return inb_p(port);
> @@ -210,12 +211,12 @@ static inline void vga_io_w (unsigned short port, =
unsigned char val)
>   {
>   	outb_p(val, port);
>   }
> -
>   static inline void vga_io_w_fast (unsigned short port, unsigned char r=
eg,
>   				  unsigned char val)
>   {
>   	outw(VGA_OUT16VAL (val, reg), port);
>   }
> +#endif /* CONFIG_HAS_IOPORT */
>
>   static inline unsigned char vga_mm_r (void __iomem *regbase, unsigned =
short port)
>   {
> @@ -235,28 +236,34 @@ static inline void vga_mm_w_fast (void __iomem *re=
gbase, unsigned short port,
>
>   static inline unsigned char vga_r (void __iomem *regbase, unsigned sho=
rt port)
>   {
> -	if (regbase)
> -		return vga_mm_r (regbase, port);
> -	else
> +#ifdef CONFIG_HAS_IOPORT
> +	if (!regbase)
>   		return vga_io_r (port);
> +	else
> +#endif /* CONFIG_HAS_IOPORT */
> +		return vga_mm_r (regbase, port);
>   }
>
>   static inline void vga_w (void __iomem *regbase, unsigned short port, =
unsigned char val)
>   {
> -	if (regbase)
> -		vga_mm_w (regbase, port, val);
> -	else
> +#ifdef CONFIG_HAS_IOPORT
> +	if (!regbase)
>   		vga_io_w (port, val);
> +	else
> +#endif /* CONFIG_HAS_IOPORT */
> +		vga_mm_w (regbase, port, val);
>   }
>
>
>   static inline void vga_w_fast (void __iomem *regbase, unsigned short p=
ort,
>   			       unsigned char reg, unsigned char val)
>   {
> -	if (regbase)
> -		vga_mm_w_fast (regbase, port, reg, val);
> -	else
> +#ifdef CONFIG_HAS_IOPORT
> +	if (!regbase)
>   		vga_io_w_fast (port, reg, val);
> +	else
> +#endif /* CONFIG_HAS_IOPORT */
> +		vga_mm_w_fast (regbase, port, reg, val);
>   }
>
>
> @@ -280,6 +287,7 @@ static inline void vga_wcrt (void __iomem *regbase, =
unsigned char reg, unsigned
>   #endif /* VGA_OUTW_WRITE */
>   }
>
> +#ifdef CONFIG_HAS_IOPORT
>   static inline unsigned char vga_io_rcrt (unsigned char reg)
>   {
>           vga_io_w (VGA_CRT_IC, reg);
> @@ -295,6 +303,7 @@ static inline void vga_io_wcrt (unsigned char reg, u=
nsigned char val)
>           vga_io_w (VGA_CRT_DC, val);
>   #endif /* VGA_OUTW_WRITE */
>   }
> +#endif /* CONFIG_HAS_IOPORT */
>
>   static inline unsigned char vga_mm_rcrt (void __iomem *regbase, unsign=
ed char reg)
>   {
> @@ -333,6 +342,7 @@ static inline void vga_wseq (void __iomem *regbase, =
unsigned char reg, unsigned
>   #endif /* VGA_OUTW_WRITE */
>   }
>
> +#ifdef CONFIG_HAS_IOPORT
>   static inline unsigned char vga_io_rseq (unsigned char reg)
>   {
>           vga_io_w (VGA_SEQ_I, reg);
> @@ -348,6 +358,7 @@ static inline void vga_io_wseq (unsigned char reg, u=
nsigned char val)
>           vga_io_w (VGA_SEQ_D, val);
>   #endif /* VGA_OUTW_WRITE */
>   }
> +#endif /* CONFIG_HAS_IOPORT */
>
>   static inline unsigned char vga_mm_rseq (void __iomem *regbase, unsign=
ed char reg)
>   {
> @@ -385,6 +396,7 @@ static inline void vga_wgfx (void __iomem *regbase, =
unsigned char reg, unsigned
>   #endif /* VGA_OUTW_WRITE */
>   }
>
> +#ifdef CONFIG_HAS_IOPORT
>   static inline unsigned char vga_io_rgfx (unsigned char reg)
>   {
>           vga_io_w (VGA_GFX_I, reg);
> @@ -400,6 +412,7 @@ static inline void vga_io_wgfx (unsigned char reg, u=
nsigned char val)
>           vga_io_w (VGA_GFX_D, val);
>   #endif /* VGA_OUTW_WRITE */
>   }
> +#endif /* CONFIG_HAS_IOPORT */
>
>   static inline unsigned char vga_mm_rgfx (void __iomem *regbase, unsign=
ed char reg)
>   {
> @@ -434,6 +447,7 @@ static inline void vga_wattr (void __iomem *regbase,=
 unsigned char reg, unsigned
>           vga_w (regbase, VGA_ATT_W, val);
>   }
>
> +#ifdef CONFIG_HAS_IOPORT
>   static inline unsigned char vga_io_rattr (unsigned char reg)
>   {
>           vga_io_w (VGA_ATT_IW, reg);
> @@ -445,6 +459,7 @@ static inline void vga_io_wattr (unsigned char reg, =
unsigned char val)
>           vga_io_w (VGA_ATT_IW, reg);
>           vga_io_w (VGA_ATT_W, val);
>   }
> +#endif /* CONFIG_HAS_IOPORT */
>
>   static inline unsigned char vga_mm_rattr (void __iomem *regbase, unsig=
ned char reg)
>   {

