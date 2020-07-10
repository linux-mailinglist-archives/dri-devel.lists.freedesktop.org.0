Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A7B21B895
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 16:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EAE6EC6A;
	Fri, 10 Jul 2020 14:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472086EC6A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 14:26:26 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200710142625euoutp0119c8179f282431e3bea01a41a7b01c29~galXaX-Ev0132301323euoutp01j
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 14:26:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200710142625euoutp0119c8179f282431e3bea01a41a7b01c29~galXaX-Ev0132301323euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594391185;
 bh=tAftW2OboZMz6wgcU+jQBLkLK8BsqY1wC8/nkINbb9c=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=YkbCC+LOOLuaDWy9Gg9bQ/OOas/hhRh1AJJAsmEPAG8oMeOn/jY8iZWWsrTY1zmzD
 B2J7+EIbK0f1ROZB78GCfQ8i4jWyawZTQMMMaiTkvSqslA4A+wyEGr3aNIq9AIf9vo
 lYcZDOLViOT6hWJWzlbfF2BRJaal1uHpzE+KkyG4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200710142624eucas1p13817340e31e8e24e48254697ac1fe2d9~galXCmz0S1217812178eucas1p1V;
 Fri, 10 Jul 2020 14:26:24 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id A2.2F.06318.09A780F5; Fri, 10
 Jul 2020 15:26:24 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200710142624eucas1p1a0b3012b95dd8dd029b6419340c02a93~galWvP_Na1216012160eucas1p1n;
 Fri, 10 Jul 2020 14:26:24 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200710142624eusmtrp2720fc9bf47d61e2a00d4e37b0acc4aa0~galWusu_61412614126eusmtrp2I;
 Fri, 10 Jul 2020 14:26:24 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-c5-5f087a90e6a2
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 05.C1.06017.09A780F5; Fri, 10
 Jul 2020 15:26:24 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200710142623eusmtip2529d07a10f91486defa4c9b07c0beced~galWXpwPT1630016300eusmtip2S;
 Fri, 10 Jul 2020 14:26:23 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: vt8623fb: Constify static vga_regsets
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <2b4fbc55-4f77-bf93-4464-fcb86868ce8a@samsung.com>
Date: Fri, 10 Jul 2020 16:26:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200701210248.64893-1-rikard.falkeborn@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRmVeSWpSXmKPExsWy7djPc7oTqjjiDb6sULG48vU9m8WJvg+s
 Fpd3zWGzeHbS0YHFY+esu+we97uPM3l83iQXwBzFZZOSmpNZllqkb5fAlXFx+le2gmb1ig29
 vSwNjM0KXYwcHBICJhIPFoR2MXJxCAmsYJQ4NO8MUxcjJ5DzhVHiwm8diMRnRon2PZtZQRIg
 DZ9fdjFBJJYzSkz50MIM4bxllPh5+RhYlbCAh8SXY5vZQGwRAUOJmbuWs4PYzAIJEqcX3WMB
 sdkErCQmtq9iBLF5Bewkzk/sBqthEVCVaLz2BWyOqECExKcHh1khagQlTs58AtbLKeAg0d04
 ixliprjErSfzmSBseYntb+eAHSQh0M0uMePqUSaIs10kXnx6A/WCsMSr41vYIWwZif875zNB
 NKxjlPjb8QKqezujxPLJ/9ggqqwl7pz7xQYKMWYBTYn1u/Qhwo4S155uYYQEJJ/EjbeCEEfw
 SUzaNp0ZIswr0dEmBFGtJrFh2QY2mLVdO1cyT2BUmoXktVlI3pmF5J1ZCHsXMLKsYhRPLS3O
 TU8tNs5LLdcrTswtLs1L10vOz93ECEwnp/8d/7qDcd+fpEOMAhyMSjy8CxI54oVYE8uKK3MP
 MUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iFGag0VJnNd40ctYIYH0xJLU7NTUgtQimCwT
 B6dUA+OcfO8j8cUbvofcTZmYf7tr+6pl89qk37ALz7eUMf738lbajLK+R9O/HzaRYssW2faq
 b9pVnRdvNzfv91jOtyhojVv1t5r4elHFFYdP6+XLPJvYfTP21EILccs1lzdZhjoeEKkyOGnr
 /DTE+Ejm0if2z+yUppYz3SsUS9tRYDw5UX3WhF6L+WuVWIozEg21mIuKEwGB+wPaIwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xe7oTqjjiDVqfCVhc+fqezeJE3wdW
 i8u75rBZPDvp6MDisXPWXXaP+93HmTw+b5ILYI7SsynKLy1JVcjILy6xVYo2tDDSM7S00DMy
 sdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy7g4/StbQbN6xYbeXpYGxmaFLkZODgkBE4nPL7uY
 uhi5OIQEljJKrFr6iKWLkQMoISNxfH0ZRI2wxJ9rXWwgtpDAa0aJDxuiQWxhAQ+JL8c2g8VF
 BAwlZu5azg7SyiyQIPFsXgrEyMmMEht72tlBatgErCQmtq9iBLF5Bewkzk/sBouzCKhKNF77
 wgpiiwpESBzeMQuqRlDi5MwnLCA2p4CDRHfjLGYQm1lAXeLPvEtQtrjErSfzmSBseYntb+cw
 T2AUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMHq2Hfu5ZQdj
 17vgQ4wCHIxKPLwLEjnihVgTy4orcw8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyI0RTo
 uYnMUqLJ+cDIziuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwOiq
 +ev+8RVfqi8mCWrN2R/hVcp08EWKnHmav/dEl9Z8OVEGtucmXYuyjxWIrDyY3fgu49IPT2+N
 6XxMSnpJR7es2bv+SZGMwt+fm6xDji5wF9U/FV63VEFTlW3HpaJ1lk9lH0XOW8K8YKU482Gz
 vslnxTyfzXtzMVWW7XW6puRPCXd2BqE/c5RYijMSDbWYi4oTAeHombu0AgAA
X-CMS-MailID: 20200710142624eucas1p1a0b3012b95dd8dd029b6419340c02a93
X-Msg-Generator: CA
X-RootMTR: 20200701224107eucas1p274a4251ad3ba00807783486d9592db0d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200701224107eucas1p274a4251ad3ba00807783486d9592db0d
References: <CGME20200701224107eucas1p274a4251ad3ba00807783486d9592db0d@eucas1p2.samsung.com>
 <20200701210248.64893-1-rikard.falkeborn@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/1/20 11:02 PM, Rikard Falkeborn wrote:
> These are not modified so make them const to allow the compiler to put
> them in read-only memory.
> 
> Before:
>    text    data     bss     dec     hex filename
>   25509    7928      64   33501    82dd drivers/video/fbdev/vt8623fb.o
> 
> After:
>    text    data     bss     dec     hex filename
>   26533    6904      64   33501    82dd drivers/video/fbdev/vt8623fb.o
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Applied to drm-misc-next tree, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/vt8623fb.c | 36 +++++++++++++++++-----------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/video/fbdev/vt8623fb.c b/drivers/video/fbdev/vt8623fb.c
> index 7b3eef1b893f..98ff8235c9e9 100644
> --- a/drivers/video/fbdev/vt8623fb.c
> +++ b/drivers/video/fbdev/vt8623fb.c
> @@ -62,24 +62,24 @@ static const struct svga_pll vt8623_pll = {2, 127, 2, 7, 0, 3,
>  
>  /* CRT timing register sets */
>  
> -static struct vga_regset vt8623_h_total_regs[]       = {{0x00, 0, 7}, {0x36, 3, 3}, VGA_REGSET_END};
> -static struct vga_regset vt8623_h_display_regs[]     = {{0x01, 0, 7}, VGA_REGSET_END};
> -static struct vga_regset vt8623_h_blank_start_regs[] = {{0x02, 0, 7}, VGA_REGSET_END};
> -static struct vga_regset vt8623_h_blank_end_regs[]   = {{0x03, 0, 4}, {0x05, 7, 7}, {0x33, 5, 5}, VGA_REGSET_END};
> -static struct vga_regset vt8623_h_sync_start_regs[]  = {{0x04, 0, 7}, {0x33, 4, 4}, VGA_REGSET_END};
> -static struct vga_regset vt8623_h_sync_end_regs[]    = {{0x05, 0, 4}, VGA_REGSET_END};
> -
> -static struct vga_regset vt8623_v_total_regs[]       = {{0x06, 0, 7}, {0x07, 0, 0}, {0x07, 5, 5}, {0x35, 0, 0}, VGA_REGSET_END};
> -static struct vga_regset vt8623_v_display_regs[]     = {{0x12, 0, 7}, {0x07, 1, 1}, {0x07, 6, 6}, {0x35, 2, 2}, VGA_REGSET_END};
> -static struct vga_regset vt8623_v_blank_start_regs[] = {{0x15, 0, 7}, {0x07, 3, 3}, {0x09, 5, 5}, {0x35, 3, 3}, VGA_REGSET_END};
> -static struct vga_regset vt8623_v_blank_end_regs[]   = {{0x16, 0, 7}, VGA_REGSET_END};
> -static struct vga_regset vt8623_v_sync_start_regs[]  = {{0x10, 0, 7}, {0x07, 2, 2}, {0x07, 7, 7}, {0x35, 1, 1}, VGA_REGSET_END};
> -static struct vga_regset vt8623_v_sync_end_regs[]    = {{0x11, 0, 3}, VGA_REGSET_END};
> -
> -static struct vga_regset vt8623_offset_regs[]        = {{0x13, 0, 7}, {0x35, 5, 7}, VGA_REGSET_END};
> -static struct vga_regset vt8623_line_compare_regs[]  = {{0x18, 0, 7}, {0x07, 4, 4}, {0x09, 6, 6}, {0x33, 0, 2}, {0x35, 4, 4}, VGA_REGSET_END};
> -static struct vga_regset vt8623_fetch_count_regs[]   = {{0x1C, 0, 7}, {0x1D, 0, 1}, VGA_REGSET_END};
> -static struct vga_regset vt8623_start_address_regs[] = {{0x0d, 0, 7}, {0x0c, 0, 7}, {0x34, 0, 7}, {0x48, 0, 1}, VGA_REGSET_END};
> +static const struct vga_regset vt8623_h_total_regs[]       = {{0x00, 0, 7}, {0x36, 3, 3}, VGA_REGSET_END};
> +static const struct vga_regset vt8623_h_display_regs[]     = {{0x01, 0, 7}, VGA_REGSET_END};
> +static const struct vga_regset vt8623_h_blank_start_regs[] = {{0x02, 0, 7}, VGA_REGSET_END};
> +static const struct vga_regset vt8623_h_blank_end_regs[]   = {{0x03, 0, 4}, {0x05, 7, 7}, {0x33, 5, 5}, VGA_REGSET_END};
> +static const struct vga_regset vt8623_h_sync_start_regs[]  = {{0x04, 0, 7}, {0x33, 4, 4}, VGA_REGSET_END};
> +static const struct vga_regset vt8623_h_sync_end_regs[]    = {{0x05, 0, 4}, VGA_REGSET_END};
> +
> +static const struct vga_regset vt8623_v_total_regs[]       = {{0x06, 0, 7}, {0x07, 0, 0}, {0x07, 5, 5}, {0x35, 0, 0}, VGA_REGSET_END};
> +static const struct vga_regset vt8623_v_display_regs[]     = {{0x12, 0, 7}, {0x07, 1, 1}, {0x07, 6, 6}, {0x35, 2, 2}, VGA_REGSET_END};
> +static const struct vga_regset vt8623_v_blank_start_regs[] = {{0x15, 0, 7}, {0x07, 3, 3}, {0x09, 5, 5}, {0x35, 3, 3}, VGA_REGSET_END};
> +static const struct vga_regset vt8623_v_blank_end_regs[]   = {{0x16, 0, 7}, VGA_REGSET_END};
> +static const struct vga_regset vt8623_v_sync_start_regs[]  = {{0x10, 0, 7}, {0x07, 2, 2}, {0x07, 7, 7}, {0x35, 1, 1}, VGA_REGSET_END};
> +static const struct vga_regset vt8623_v_sync_end_regs[]    = {{0x11, 0, 3}, VGA_REGSET_END};
> +
> +static const struct vga_regset vt8623_offset_regs[]        = {{0x13, 0, 7}, {0x35, 5, 7}, VGA_REGSET_END};
> +static const struct vga_regset vt8623_line_compare_regs[]  = {{0x18, 0, 7}, {0x07, 4, 4}, {0x09, 6, 6}, {0x33, 0, 2}, {0x35, 4, 4}, VGA_REGSET_END};
> +static const struct vga_regset vt8623_fetch_count_regs[]   = {{0x1C, 0, 7}, {0x1D, 0, 1}, VGA_REGSET_END};
> +static const struct vga_regset vt8623_start_address_regs[] = {{0x0d, 0, 7}, {0x0c, 0, 7}, {0x34, 0, 7}, {0x48, 0, 1}, VGA_REGSET_END};
>  
>  static const struct svga_timing_regs vt8623_timing_regs     = {
>  	vt8623_h_total_regs, vt8623_h_display_regs, vt8623_h_blank_start_regs,
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
