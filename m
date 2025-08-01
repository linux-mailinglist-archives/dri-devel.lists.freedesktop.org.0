Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9362FB17E9E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 10:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821A410E303;
	Fri,  1 Aug 2025 08:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ajDIQJft";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C6910E303
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 08:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754038358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3ut2IZtB01vlovnDAd6xUWzFbNv5v2C3DILCLpVpw0=;
 b=ajDIQJftgUcdesngDH1xZcpGSEgWMhmzmfNQr4OxMD9m2eA1NRo8u/QRw67SjRBXg/u0OG
 DGIfx6n1DlpLsAwWySEsVgFyKcldneT1xStnLrh97v815EfzOs5/Tdrl6A/pRsoDsHJhcA
 V/mP+MFOhGNTTs8NEU8MEgKzQEe5f9c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-7TvL3pB1PrqiUWnxk9F7-Q-1; Fri, 01 Aug 2025 04:52:37 -0400
X-MC-Unique: 7TvL3pB1PrqiUWnxk9F7-Q-1
X-Mimecast-MFC-AGG-ID: 7TvL3pB1PrqiUWnxk9F7-Q_1754038356
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3b785d52c19so298092f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 01:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754038356; x=1754643156;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q3ut2IZtB01vlovnDAd6xUWzFbNv5v2C3DILCLpVpw0=;
 b=HZpILXDXCJhinijTfszijUjo70wZVqT3dzFqKM8wPUNTzvJql1t1xFI7lxQZ3IUyi4
 GPlrWLfaDRj+/zSa2Rkd5o1NRXXShDXTqwXJJoRumaHp+msjjEAPSmETeuWFg1cMuYKn
 H8HG9J9zSVPjQuu2gihd0O0cOANVJQnyvui95zBFXMhSsUtQLZUb9We3T0Rq3T+LMnVt
 02jrtRn196mVcpz6NT9vaGwjUiUgcMgBzvzMt2Z23v+LfIMFCVTC8CDMnrXz2MvnyFo1
 zboM4IGeVYnNd7mokaAZNaubm58h/4h6Zk50nf+WCKmR+k/z5XbbjcfNnHWKWEXVsdJy
 R6WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBE2jmWUWHO3VSspF7VLq4iHHKs4CTjDYhECXehgVdbqWbfUsZhR5sfGvgWLjzWEtZ6t3t6XmIGnw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwywuIBJYScO73Mmn9u7a2UozIiPiAuGDBlxBx+9fhcLGlnEk8B
 shVR/pmUy4SnV7ygBP+AUhxjXLYouyuH2xpC+xqJSxppe1jOekdaAb5R4B4NMxLotuT47Tcqb7D
 eOP51PAh+mJ5fB9NFsD9V7cNNdOql0qhFn/X9AIEIcrWqp2BZg/wN09vcQz4SMFjDZFqwVg==
X-Gm-Gg: ASbGncvxLahy/BZeAZ32gtDOqkgssOu0MCtdokFoY1hGiQHFvs/Av7e7f8zH2edOaiV
 pkoAxM85DtIhpuZWXX80Ag2DEEtDdvkcTDP2iE6k+o/AYGTAGvIQzxoFiH0VMgjZBCiJF8mEA9J
 jzM6SHccxrZw3ofGhEZbo/mt3QZo5OCCgfydsxE5W3oYe0Wsqfau990KL/ky6GFIWzlHAVVObtR
 tiT47GcTSXJswifmvq6ySgV9EL1T/K/ELxURfT1WzP88Xf9oAOWtdQYi/3flK9TV3QGtWRoWjkv
 fJHEqD6a4jQUljGwjKkl2xFnnoEi0X0Og83zlhbEMNTFSYw4A2ith2gpnfMWd2eVX0zn8YKCyj3
 z0pQ=
X-Received: by 2002:a05:6000:2481:b0:3b8:bb8b:6b05 with SMTP id
 ffacd0b85a97d-3b8bb8b6deemr3637785f8f.29.1754038355815; 
 Fri, 01 Aug 2025 01:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0SO4q2RvFPtgA+PGMdbAXShTVcEjLgx7m1c3m1LKK7FMUDdGk4NLVg7RcdXJk4nSy5WynYA==
X-Received: by 2002:a05:6000:2481:b0:3b8:bb8b:6b05 with SMTP id
 ffacd0b85a97d-3b8bb8b6deemr3637740f8f.29.1754038355055; 
 Fri, 01 Aug 2025 01:52:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4533e6sm5323520f8f.35.2025.08.01.01.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 01:52:34 -0700 (PDT)
Message-ID: <b04db6eb-03aa-43bc-bc09-4192e2a021b8@redhat.com>
Date: Fri, 1 Aug 2025 10:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panic: Add a u64 divide by 10 for arm32
To: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20250627123854.921704-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250627123854.921704-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XXrJZs_TZ97OoYdrqhWqDpPyA1fnqJkM52UvQ__l1-s_1754038356
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 27/06/2025 14:38, Jocelyn Falempe wrote:
> On 32bits ARM, u64 divided by a constant is not optimized to a
> multiply by inverse by the compiler [1].
> So do the multiply by inverse explicitly for this architecture.

Gentle ping.


Best regards,

-- 

Jocelyn

> 
> Link: https://github.com/llvm/llvm-project/issues/37280 [1]
> Reported-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com/
> Fixes: 675008f196ca ("drm/panic: Use a decimal fifo to avoid u64 by u64 divide")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index dd55b1cb764d..774a17de4f2f 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -381,6 +381,26 @@ struct DecFifo {
>       len: usize,
>   }
>   
> +// On arm32 architecture, dividing an `u64` by a constant will generate a call
> +// to `__aeabi_uldivmod` which is not present in the kernel.
> +// So use the multiply by inverse method for this architecture.
> +fn div10(val: u64) -> u64 {
> +    if cfg!(target_arch = "arm") {
> +        let val_h = val >> 32;
> +        let val_l = val & 0xFFFFFFFF;
> +        let b_h: u64 = 0x66666666;
> +        let b_l: u64 = 0x66666667;
> +
> +        let tmp1 = val_h * b_l + ((val_l * b_l) >> 32);
> +        let tmp2 = val_l * b_h + (tmp1 & 0xffffffff);
> +        let tmp3 = val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
> +
> +        tmp3 >> 2
> +    } else {
> +        val / 10
> +    }
> +}
> +
>   impl DecFifo {
>       fn push(&mut self, data: u64, len: usize) {
>           let mut chunk = data;
> @@ -389,7 +409,7 @@ fn push(&mut self, data: u64, len: usize) {
>           }
>           for i in 0..len {
>               self.decimals[i] = (chunk % 10) as u8;
> -            chunk /= 10;
> +            chunk = div10(chunk);
>           }
>           self.len += len;
>       }
> 
> base-commit: 3529cb5ab16b4f1f8bbc31dc39a1076a94bd1e38

