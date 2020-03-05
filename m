Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD80F17A74E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 15:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B016EBC8;
	Thu,  5 Mar 2020 14:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95946EBC8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 14:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583418164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6noagWxZ5YiSaEFMdQzCHre9EJD3npDKEFOYBbGNFrU=;
 b=eGbH+kDULE6ycjvEXg3CCLM8LevcBKgt6ivF6CQkGX/P6vHgCFIMgvx8htj0X9nBC8+XIl
 jtZpQr0qfhO7sXH+Z4lrGoIWzJA1JDOYvuNCd0CrbPkvYOtpNQDRzswublGQBXmtytQMrW
 rOIwLGSvmBz/uq/2ONDSzoHlHlQa0Fg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-WOJkWQg9MQqRAh-IocfPNQ-1; Thu, 05 Mar 2020 09:22:41 -0500
X-MC-Unique: WOJkWQg9MQqRAh-IocfPNQ-1
Received: by mail-wr1-f69.google.com with SMTP id w18so2384278wro.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 06:22:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6noagWxZ5YiSaEFMdQzCHre9EJD3npDKEFOYBbGNFrU=;
 b=Ad3Ag6YtubELDDaMEpMywJY/YxhA4FVmD+ZpPsPZcH8wE0dReLm3iouhYvCw1CoXfy
 WadnQEMwXwYX8ldDa0TabWi73X9qGcYMCuM2Ygqzh8Rmy5MYKGBEnKlXvMdlHvMkO8xT
 xlUI6QTH814m/higDO1NAlB+9vwBMcAXXfkSDQU/ZPFxQetgEiZXep9g90xX6q5aTIKa
 an3zrihexHfK7wwlVh3Qi64WvRkleq+dsiCBxV8+39zs8V29wNU7+4qIzfAw1Lm/ckR3
 amHgQYixybfmr8ipRMfqn30hlr3qnIOYgYWs1JMWgFdJnBx8IytQZeQilHmUbBZ7AHX1
 hT3A==
X-Gm-Message-State: ANhLgQ2Xx25rQLiym51lcQ0D6r9Yc7n+Cj4cTKJiqTIl5U8jfpQHlvpp
 wY8pQsolpJXXJoglg+ty79DyrWrTAZ0GF23K0bIxDJOHs2OsIKutZPhMB6JpiY3Tz4UIsHQW2Mf
 +yMSEF8VTc9Hkd9ay5h/Gj79kPCWQ
X-Received: by 2002:a5d:6146:: with SMTP id y6mr10560243wrt.107.1583418159920; 
 Thu, 05 Mar 2020 06:22:39 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsVPpJ1Cv7XI3CgGNNoNJ0eAJgUXSnFi1wfWwG4CQQJ1K56cUcw027pOLSq+CkOV+HtsaXJ9g==
X-Received: by 2002:a5d:6146:: with SMTP id y6mr10560228wrt.107.1583418159722; 
 Thu, 05 Mar 2020 06:22:39 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id z2sm40199326wrq.95.2020.03.05.06.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2020 06:22:39 -0800 (PST)
Subject: Re: [PATCH][next] drm/vboxvideo/vboxvideo.h: Replace zero-length
 array with flexible-array member
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20200305105558.GA19124@embeddedor>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8e2ab9a2-fb47-1d61-d09c-0510ad5ee5ff@redhat.com>
Date: Thu, 5 Mar 2020 15:22:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305105558.GA19124@embeddedor>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/5/20 11:55 AM, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>          int stuff;
>          struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/gpu/drm/vboxvideo/vboxvideo.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vboxvideo.h b/drivers/gpu/drm/vboxvideo/vboxvideo.h
> index 0592004f71aa..a5de40fe1a76 100644
> --- a/drivers/gpu/drm/vboxvideo/vboxvideo.h
> +++ b/drivers/gpu/drm/vboxvideo/vboxvideo.h
> @@ -138,7 +138,7 @@ struct vbva_buffer {
>   
>   	u32 data_len;
>   	/* variable size for the rest of the vbva_buffer area in VRAM. */
> -	u8 data[0];
> +	u8 data[];
>   } __packed;
>   
>   #define VBVA_MAX_RECORD_SIZE (128 * 1024 * 1024)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
