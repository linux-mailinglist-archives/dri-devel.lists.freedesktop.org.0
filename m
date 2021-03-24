Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0C43483ED
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 22:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95AA6EA93;
	Wed, 24 Mar 2021 21:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B0A6EA93;
 Wed, 24 Mar 2021 21:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=lwyeLRE3g3UreYgtCiDtmRzgTwzVFmBBdTsaNOT78AQ=; b=Xx37BQ+1LBnwwVZV/cAHESdIRh
 ytbDiMY4AFk3iDSVRE/aKxpFszVLjwSHYMswYFiqqlz6KYqRwc+3Je+8EKzIphjcyGH8iPWq7tuDc
 L7KSeyk38GjlkEYiVDI475ZIZZ5o5MZHtXPbgml801Xj0qb5YrKTbzfYdwAvEmdcP3h3DNbiqss65
 4Jmr53XUfcvxyCWU68MXCvOTYeyxr4eS2xSYRFFiBwpxTnJAPDTx0WL6UUMitWs9p+gdTf/q43zjp
 jTNUNfMHcrFlYbyIc4I4nJqMPLkMM5jqRUahV08jfEtIMLfj/B1uJL+QVrAvOBwwsIzT0kvbczIyk
 feWDpGMg==;
Received: from [2601:1c0:6280:3f0::3ba4]
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lPBI7-000FgH-OW; Wed, 24 Mar 2021 21:43:52 +0000
Subject: Re: [PATCH] drm/nouveau/bios/init: A typo fix
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, bskeggs@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210324063440.14969-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e5d43d9f-c1b5-e5e8-cdd6-6ec4ff709ca7@infradead.org>
Date: Wed, 24 Mar 2021 14:43:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324063440.14969-1-unixbhaskar@gmail.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/23/21 11:34 PM, Bhaskar Chowdhury wrote:
> 
> s/conditon/condition/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> index 9de74f41dcd2..142079403864 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> @@ -401,7 +401,7 @@ init_table_(struct nvbios_init *init, u16 offset, const char *name)
>  #define init_macro_table(b) init_table_((b), 0x04, "macro table")
>  #define init_condition_table(b) init_table_((b), 0x06, "condition table")
>  #define init_io_condition_table(b) init_table_((b), 0x08, "io condition table")
> -#define init_io_flag_condition_table(b) init_table_((b), 0x0a, "io flag conditon table")
> +#define init_io_flag_condition_table(b) init_table_((b), 0x0a, "io flag condition table")
>  #define init_function_table(b) init_table_((b), 0x0c, "function table")
>  #define init_xlat_table(b) init_table_((b), 0x10, "xlat table");
> 
> --


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
