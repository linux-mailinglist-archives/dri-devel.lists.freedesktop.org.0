Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA4C57086E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 18:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306818FC2A;
	Mon, 11 Jul 2022 16:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA668FC25
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 16:36:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 867E0326;
 Mon, 11 Jul 2022 18:36:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1657557368;
 bh=R6O8Am8L6fEahUpcYNpS7RBeL6kUkCqEF2g9TkjHNmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wj6vt4nNzyeeSKK2kB+l+oizKo4oBPSter00srL59FIyfwHqwD1PD6FRMf/51ZoDK
 xjaZ4YTTJPxx1bV3ibbRzyBb1gM/6FRu9h0WVlFLthmAOxTu2PTNnHsfWmqMMi83ab
 Wq0wJHIuYTzSErB9k9tzZX/BY3eoegsDbatq2MTE=
Date: Mon, 11 Jul 2022 19:35:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH libdrm] util: Remove unused definitions of RED, GREEN,
 and BLUE
Message-ID: <YsxRXY0+4zeXIBcE@pendragon.ideasonboard.com>
References: <76c3c5d0e44a385f7289a918ca77cc3ca19a9b18.1657554940.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <76c3c5d0e44a385f7289a918ca77cc3ca19a9b18.1657554940.git.geert@linux-m68k.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Mon, Jul 11, 2022 at 05:56:41PM +0200, Geert Uytterhoeven wrote:
> These are unused since commit edcef53685edf5fb ("modetest: Add test
> pattern support for missing RGB formats").
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  tests/util/pattern.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/tests/util/pattern.c b/tests/util/pattern.c
> index f28fad311ec3de11..178aee8341a38920 100644
> --- a/tests/util/pattern.c
> +++ b/tests/util/pattern.c
> @@ -764,11 +764,6 @@ static void fill_smpte(const struct util_format_info *info, void *planes[3],
>  	}
>  }
>  
> -/* swap these for big endian.. */
> -#define RED   2
> -#define GREEN 1
> -#define BLUE  0
> -
>  static void make_pwetty(void *data, unsigned int width, unsigned int height,
>  			unsigned int stride, uint32_t format)
>  {

-- 
Regards,

Laurent Pinchart
