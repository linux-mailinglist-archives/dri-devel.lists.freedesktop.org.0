Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B1D744DA8
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 15:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5F010E0C2;
	Sun,  2 Jul 2023 13:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7129A10E0C2
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jul 2023 13:01:56 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbc244d307so38676595e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 06:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688302915; x=1690894915;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zzka9CnRuiGxtiFqL9JgKk46K47spIoim848zQhRx/I=;
 b=b1WNUNT4oTwKh77H5nT3jfqCE3yGRMR6EkAhEAFqi7jR/T1jTcluVilYz655Q0pIYX
 T2+nS0EnBCIcSSafc/OxQJqxPWnGwo/JC6P82Lk9Y+ViWTeTIaVmFbB1YsyrSArw55Jp
 Q7EzB3uerrUwVEzqSXYRtc1Hx75rNfVpJAO+Yed1N5X5PhwnNJfvuoajZAZddgo589/9
 PqorW4chq2JgOvNZaWYMjFQISh+CFw/Ln+QEMnujnKV72B1XldfUSU76VI+6G39hvJOs
 coOn32UVkkeyRyID1QqcL6Ao82nPtI+qhfOVXnJgbPlxM8inX6eahd0mnV3MBG1w1nin
 Zg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688302915; x=1690894915;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zzka9CnRuiGxtiFqL9JgKk46K47spIoim848zQhRx/I=;
 b=i4CJ3vtxgZ1b1yFaRTMBTXTychbTa9x4fJ7t0uh66YjbVhl88gOLG3YYtYF2obVMmV
 IaLlHoMxWJa2ZczgfMRdbLncVVVc1tYYpeZdrswm/V+Kav942fcZq0pvkGw1firTQVMH
 j/IU9mt6e1lVmbQEzg2xemPem+wFX5lLc1WnJfvxBOKSmIgWW0GBXER4eZUyDFoq7EYv
 HsoIZoC2DQmuTg/FCXw/EH16wFK66MTu6n0xrXoIsom4pNUmRRT7OQ5Jd9jy9NmV8Qqi
 GJlTLy0v/mnTL3GhAKF9YZ0d7GRPECVXnokbWoyEgCatIP6u8201/t2PLTVi/aUuVbvx
 rfRg==
X-Gm-Message-State: AC+VfDyd5RwO8Ul9dDomFugmvJsvB1GK/ZrpngtDPxlrl2UPpO0CcGJR
 OUP8YXkJ6m1i5DmtaHBN9P0=
X-Google-Smtp-Source: ACHHUZ57l2NYdjFz6gnbDv5RtxHSLeNECuh+UmIbNVUXxycz4UEWnF6Th5b5Yk8FZNtDi4ojGzHT9g==
X-Received: by 2002:a05:600c:2213:b0:3fa:e92e:7a7b with SMTP id
 z19-20020a05600c221300b003fae92e7a7bmr6995851wml.15.1688302914474; 
 Sun, 02 Jul 2023 06:01:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:32f:1f0:ae0b:3bc8:c743:b2d8?
 ([2a01:e0a:32f:1f0:ae0b:3bc8:c743:b2d8])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a1c4b11000000b003f90a604885sm24277641wma.34.2023.07.02.06.01.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Jul 2023 06:01:54 -0700 (PDT)
Message-ID: <ae400e28-0cd4-cdf8-811d-843e62cd4a95@gmail.com>
Date: Sun, 2 Jul 2023 15:05:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] staging: fbtft: ili9341: use macro
 FBTFT_REGISTER_SPI_DRIVER
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230702080324.120137-1-rgallaispou@gmail.com>
 <2023070254-embark-subplot-4dd4@gregkh>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=c3=abl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <2023070254-embark-subplot-4dd4@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le 02/07/2023 à 14:02, Greg Kroah-Hartman a écrit :
> On Sun, Jul 02, 2023 at 10:03:24AM +0200, Raphael Gallais-Pou wrote:
>> Using FBTFT_REGISTER_DRIVER resolves to a NULL struct spi_device_id. This
>> ultimately causes the module to an early exit at probe time.
> 
> So this doesn't work at all today?  Has it ever worked?  What commit
> does thi fix?

I tested again with only a tweak in my device-tree. The early exit in 
the driver's code is caused by a missing field. So regarding this 
particular driver the macro works.

It resolves to set spi_driver.id_table = NULL, which yields a warning in 
__spi_register_driver(). So I guess this patch only fixes a warning.

> 
>> In addition the MODULE_ALIASes can be dropped.
> 
> Why?  When you say "also" or "in addition", that's a huge hint it should
> be a separate patch.
I did not find any reference to those aliases in the kernel, which led 
me to remove those.

If you think they are still necessary, I'll split them in an upcoming v2.

Thanks for your insights,

Raphaël
> 
> thanks,
> 
> greg k-h
