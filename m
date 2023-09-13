Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3F779E016
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 08:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13AC10E088;
	Wed, 13 Sep 2023 06:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387B710E088
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 06:34:07 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-52a23227567so8285911a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 23:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694586845; x=1695191645; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4xivZoRLvn+KlDMwpBnyJeJwebEb3d7RlJsAeQ2v9Xg=;
 b=VFyAyAiyxWAxucmOBvPCmFosASMbPfTYhoNAQ4b1q7F/xOF7Oj2Y0NVlB3tSK3Qdb2
 6TKHq8ceg/R6XoKuKxTfcTePeStaP0Mm4tneGO5wN0au7VeOzig604FJDnyGo9UHHmER
 0qSN+mtryXd3LsI9PFiQt9HmDTP4UjBJrKe0YZnxg29Qpddv/KLOCK83UCbh9Hq8dedx
 lftXWz5fgBk3XdYrKAJqs6u27uEJxObSSdyPfkMOnYjif74rZLdWXARk02kmNs0e0Wgf
 LvGzxqPo6LYhcZtaeYikIpyzw7yrCCWrWqtpmSJdR0fduuhXYGPtNvZASJBpwp1qYGN1
 dmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694586845; x=1695191645;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4xivZoRLvn+KlDMwpBnyJeJwebEb3d7RlJsAeQ2v9Xg=;
 b=Gfb9vyUDK/WndktOaW5zvi4FKt6jET3JackljeQEZLcMecQpEJVU+pgCH4l9ouJObu
 KGZWZlrpZewhgJ5ArSalb9TR4veGwRKA/ieuSry4qfO1PsiVs/4/DpdNJ0GoCHlCKn34
 mwnji+cTD7BcmW0KfVkUWH2rTvgbYIVEULHwb/U3GlWxoJK1k/d1NwIdmt/kk5zJp0TI
 752ENOXlfGs3DoUyTSGawJPIYivGKMczuqbE+I+TNTMxwaO1BNka/SDB4YkZkxlulrTr
 tfl4iHbResy6lJLiwcXBM4sYDwMMdxWBvFnclPyEYKwSeO14p01qNrlN01rpEZRIcRic
 gQBQ==
X-Gm-Message-State: AOJu0YwYILARxCdeb6IbHySUERjPyiC4WWal6S3SjRBrqTn1ANoPkkxz
 zQc1o7hIfza+9tXRQDQyZhGhfg==
X-Google-Smtp-Source: AGHT+IH7pVsLeTcuGo1IKYmY0OKmMz3guLsV/+W9YMk15RXLnYgeiGl9YmdqiaV6jYyLCb+FD4rIbg==
X-Received: by 2002:a05:6402:74f:b0:514:9ab4:3524 with SMTP id
 p15-20020a056402074f00b005149ab43524mr1452889edy.7.1694586845587; 
 Tue, 12 Sep 2023 23:34:05 -0700 (PDT)
Received: from [192.168.69.115] (176-131-211-241.abo.bbox.fr.
 [176.131.211.241]) by smtp.gmail.com with ESMTPSA id
 x18-20020aa7d392000000b00522828d438csm6829049edq.7.2023.09.12.23.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 23:34:05 -0700 (PDT)
Message-ID: <7a34d350-9583-9e81-5706-9932a03441eb@linaro.org>
Date: Wed, 13 Sep 2023 08:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v4 3/5] arch/powerpc: Remove trailing whitespaces
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, arnd@arndb.de, deller@gmx.de
References: <20230912135050.17155-1-tzimmermann@suse.de>
 <20230912135050.17155-4-tzimmermann@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230912135050.17155-4-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/9/23 15:49, Thomas Zimmermann wrote:
> Fix coding style. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   arch/powerpc/include/asm/machdep.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

