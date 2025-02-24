Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57401A4262A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 16:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3F410E25B;
	Mon, 24 Feb 2025 15:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CPciV7zc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E784B10E25B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 15:24:19 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-abb81285d33so874841766b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 07:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740410658; x=1741015458; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=90b7JTu64HyQeEwAMfpKEcwfZyjyUK0IOy6HdZ/FyAs=;
 b=CPciV7zc0739sAQ4RPhScvq37N+h0yQap7hsPN3IA/hflXVLeMvrBGHQA1yfFNvvan
 C1yt+ErIBzif2BSINTe2evulzNG0k75aGdNhhEGCd7uONvYgrkt7Jty6bD2r/vxsEZo6
 IpKIKl1iNq66ANNMa+rMY3gZajUdzzoladV9095s0KV9u/Q9YI9zpjqh7RAWG/Nh1QzT
 UqVibhBaeo4WHpvfdMIupju0Qhjtcyuh8tYbGWJpoBgI/VyEHzjadhfpB4YZiWalNwF4
 eEF/GhTf0YRovutsxnIdgtA8Cp+y47EwJA0LKh/dwwC8eY4gm67SE1lsLVsl4mqU5NxG
 RtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740410658; x=1741015458;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=90b7JTu64HyQeEwAMfpKEcwfZyjyUK0IOy6HdZ/FyAs=;
 b=d5E8ftng1zfbLlV03Wh9R2HVlBecwWkXkttRwF/VCCzYNgrlS+nw80lVKZ0AfL29f5
 Uf5pAakU/PHrCh4DcS1+xKvDJWElUmQ834FmsOI6ox5Fbr1/6Cuf/tWFdfBpf+ckqH4q
 fxMf83tkP6Y7nTLmbpim3pqu55ZiZiL3iOfKmbHUvn3u7s8ltQRkgy9mOxNzlSXWzPJD
 zKO+mZy6jgxAnGEt7j/iwh6y3LrW/1pVT92NSIH3Y0r1AACtbybRqw030CcMOxBdAi8/
 PTfZadwyg26mHVWuK5bTsP+Dh0gwDvVoT6yj8YbDpd0jiMSFuW3lYKcN+6GgeARL1lbd
 YVNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvHimk5PtqcFHGPMWyZd6Pt45+wnlihXeXNyZ78M4nHxxXU4cNURt1YirRH0uUM2lh1P2OZevt8Ig=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/jqMgubnG97V2qIL8YWL9RE7G3YPBGWqe/jrUhk0/vaLSGNWR
 xGuPVCDgYKICCYqhCDkGUmHqAV+VPYDQXhAMk2o2SX9gOtI1TUHG
X-Gm-Gg: ASbGncvxmb0Nbz2yOZdLtHzsPS7uZZQjVoiGIxCKjZ/+gew7yydOZjU7F2oLdcocxn4
 TipE9iDOOGkVwbKUTp5yERk35GcipomiSpbAQUPsl7KH8kPhQoDr1zVK8z5da53381IuNOqDRrf
 icm3vwAXWAXC8YkJRAfbqEx35ol55K0o64Ls+8uQ+ZVYIHU2s0amsaGF28NJDq9quL6WXACfqOe
 gZacAVV5xYzdLNjnG4l+rZ7ZVCfEhXrv5lytnK3Krw8Y3Ew9UtO2Y3X2hsaEcb4Ly46MOk0S4xK
 CUxvFFwYXal/J7T9Ksd8sjqmfJI=
X-Google-Smtp-Source: AGHT+IFuxTp/JUjRKgHm6bk8HGglm4eMoWBRrY8PM6xIIRBJOeg9hhqPfUM+m5fxkbKuGg8YC/F0FQ==
X-Received: by 2002:a17:907:c29:b0:ab7:86ae:4bb8 with SMTP id
 a640c23a62f3a-abc09a0bc37mr1270641566b.23.1740410658075; 
 Mon, 24 Feb 2025 07:24:18 -0800 (PST)
Received: from [192.168.1.100] ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb9f8442c0sm1531734566b.150.2025.02.24.07.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 07:24:17 -0800 (PST)
Message-ID: <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
Date: Mon, 24 Feb 2025 16:24:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 03/17] x86: Replace open-coded parity calculation with
 parity8()
To: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 Ingo Molnar <mingo@redhat.com>, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com,
 mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, parthiban.veerasooran@microchip.com,
 arend.vanspriel@broadcom.com, johannes@sipsolutions.net,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, yury.norov@gmail.com,
 akpm@linux-foundation.org, mingo@kernel.org
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-4-visitorckw@gmail.com>
Content-Language: en-US
From: Uros Bizjak <ubizjak@gmail.com>
In-Reply-To: <20250223164217.2139331-4-visitorckw@gmail.com>
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



On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:
> Refactor parity calculations to use the standard parity8() helper. This
> change eliminates redundant implementations and improves code
> efficiency.

The patch improves parity assembly code in bootflag.o from:

   58:	89 de                	mov    %ebx,%esi
   5a:	b9 08 00 00 00       	mov    $0x8,%ecx
   5f:	31 d2                	xor    %edx,%edx
   61:	89 f0                	mov    %esi,%eax
   63:	89 d7                	mov    %edx,%edi
   65:	40 d0 ee             	shr    %sil
   68:	83 e0 01             	and    $0x1,%eax
   6b:	31 c2                	xor    %eax,%edx
   6d:	83 e9 01             	sub    $0x1,%ecx
   70:	75 ef                	jne    61 <sbf_init+0x51>
   72:	39 c7                	cmp    %eax,%edi
   74:	74 7f                	je     f5 <sbf_init+0xe5>
   76:

to:

   54:	89 d8                	mov    %ebx,%eax
   56:	ba 96 69 00 00       	mov    $0x6996,%edx
   5b:	c0 e8 04             	shr    $0x4,%al
   5e:	31 d8                	xor    %ebx,%eax
   60:	83 e0 0f             	and    $0xf,%eax
   63:	0f a3 c2             	bt     %eax,%edx
   66:	73 64                	jae    cc <sbf_init+0xbc>
   68:

which is faster and smaller (-10 bytes) code.

Reviewed-by: Uros Bizjak <ubizjak@gmail.com>

Thanks,
Uros.

> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>   arch/x86/kernel/bootflag.c | 18 +++---------------
>   1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
> index 3fed7ae58b60..314ff0e84900 100644
> --- a/arch/x86/kernel/bootflag.c
> +++ b/arch/x86/kernel/bootflag.c
> @@ -8,6 +8,7 @@
>   #include <linux/string.h>
>   #include <linux/spinlock.h>
>   #include <linux/acpi.h>
> +#include <linux/bitops.h>
>   #include <asm/io.h>
>   
>   #include <linux/mc146818rtc.h>
> @@ -20,26 +21,13 @@
>   
>   int sbf_port __initdata = -1;	/* set via acpi_boot_init() */
>   
> -static int __init parity(u8 v)
> -{
> -	int x = 0;
> -	int i;
> -
> -	for (i = 0; i < 8; i++) {
> -		x ^= (v & 1);
> -		v >>= 1;
> -	}
> -
> -	return x;
> -}
> -
>   static void __init sbf_write(u8 v)
>   {
>   	unsigned long flags;
>   
>   	if (sbf_port != -1) {
>   		v &= ~SBF_PARITY;
> -		if (!parity(v))
> +		if (!parity8(v))
>   			v |= SBF_PARITY;
>   
>   		printk(KERN_INFO "Simple Boot Flag at 0x%x set to 0x%x\n",
> @@ -70,7 +58,7 @@ static int __init sbf_value_valid(u8 v)
>   {
>   	if (v & SBF_RESERVED)		/* Reserved bits */
>   		return 0;
> -	if (!parity(v))
> +	if (!parity8(v))
>   		return 0;
>   
>   	return 1;
