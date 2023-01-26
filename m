Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D060467C6A4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 10:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C597310E183;
	Thu, 26 Jan 2023 09:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEECB10E183
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 09:08:10 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id x10so1240624edd.10
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 01:08:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hMr0xC0YhrqgD1viBDPP26FWvFPbPdmQWji8YbWNKZM=;
 b=npLsj5ahAG+gasrIKQGikib9z+u4NRjrb+Cwc4OuEfugW//RZalNFc06wP9MgPvyeF
 TN377jEe/WE6muLbMH3Jydu8Og9cCyeBaR9xfgXxW6ni+QnxJ04ULyT8spFykqgeg7Ed
 laHoCtVWHOIXJHdmZ7e42hD5uSpKdsvPqlcm+KhXDO745EcHJft/9Gen2d7wP3YpfG7c
 qtQ0UG1Q3LIp8J/OH451SfUlJ8dMtMLQDmEDYdlx7uoYR7G+2cGq5MZ8mTjqCMurHln8
 NnSI3LYUgGebr8fdTOQjoIL5CHv8+EsA3xru8mVDdgTdSvgaT3ALcZOkdcpF5UhjD2uF
 mVvA==
X-Gm-Message-State: AFqh2kpnHTOlt1nUhPZ2hHTh+IU8h+aU4wYHKr3lI8W3ENZ46LiECS6g
 CATomTtMBb+gnir45JAU62E=
X-Google-Smtp-Source: AMrXdXs7LccmnB0bZcinEZc6Pyw0tuNtDY8p4RYr8ArU3wqk/0+yiT/jtfRNjdsb9EbsAtxehuiZ3g==
X-Received: by 2002:a05:6402:524f:b0:49e:498c:5e16 with SMTP id
 t15-20020a056402524f00b0049e498c5e16mr43666895edd.30.1674724089094; 
 Thu, 26 Jan 2023 01:08:09 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a50eb0b000000b00467481df198sm434295edp.48.2023.01.26.01.08.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 01:08:08 -0800 (PST)
Message-ID: <edcf26d4-64a0-04ea-435c-17d9efde7dd9@kernel.org>
Date: Thu, 26 Jan 2023 10:08:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] fbcon: Check font dimension limits
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20230126004911.869923511@ens-lyon.org>
 <20230126004921.616264824@ens-lyon.org> <Y9IvBoAbmh27xl4B@kroah.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <Y9IvBoAbmh27xl4B@kroah.com>
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
Cc: linux-fbdev@vger.kernel.org, Sanan Hasanov <sanan.hasanov@knights.ucf.edu>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26. 01. 23, 8:43, Greg KH wrote:
>> --- linux-6.0.orig/drivers/video/fbdev/core/fbcon.c
>> +++ linux-6.0/drivers/video/fbdev/core/fbcon.c
>> @@ -2489,9 +2489,12 @@ static int fbcon_set_font(struct vc_data
>>   	    h > FBCON_SWAP(info->var.rotate, info->var.yres, info->var.xres))
>>   		return -EINVAL;
>>   
>> +	if (font->width > 32 || font->height > 32)
>> +		return -EINVAL;
>> +
>>   	/* Make sure drawing engine can handle the font */
>> -	if (!(info->pixmap.blit_x & (1 << (font->width - 1))) ||
>> -	    !(info->pixmap.blit_y & (1 << (font->height - 1))))
>> +	if (!(info->pixmap.blit_x & (1U << (font->width - 1))) ||
>> +	    !(info->pixmap.blit_y & (1U << (font->height - 1))))
> 
> Are you sure this is still needed with the above check added?  If so,
> why?  What is the difference in the compiled code?

For font->{width,height} == 32, definitely. IMO, 1 << 31 is undefined as 
1 << 31 cannot be represented by an (signed) int.

-- 
js
suse labs

