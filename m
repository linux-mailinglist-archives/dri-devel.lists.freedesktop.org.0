Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1869D4B73
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 12:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CCB10E3EB;
	Thu, 21 Nov 2024 11:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BrMeoVNq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8148810E3F1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 11:18:47 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53dccdcb583so669086e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 03:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732187925; x=1732792725; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FXX0ErhFOVu8Od8Q7ZNgo+Y4NZ3xb4nv+yBNbXca4Fo=;
 b=BrMeoVNq/Aw5eNZLLXzAMxvMwh990jj97aFNSwjnRtO6Pt1VbhRNf8wANFtafW+T8B
 mdF5zixPLQyHDV816uL2K6/fUS7UUiEfjFGwk3a3y2EWXfwSdCeUGSkpirUkA25LwyUG
 ox1Hu9qFpdXULYwjka13/kTZj7E8rDfpySymindFCk0C3tJWF0t1Me4MSbQGtZoJ9a9k
 0Jz1Hb3d6q6IwsSiXuieBavX51UgczQO7k2x1qihScuckhoVJtFdjavcPBPFSyIVhf1p
 KTwMBSlcP7t00vihT2rhnJQuLYZcqbN6zCplqLVzVxKfvP+MsGJYwZCksUI74Vg5onrl
 CRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732187925; x=1732792725;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FXX0ErhFOVu8Od8Q7ZNgo+Y4NZ3xb4nv+yBNbXca4Fo=;
 b=lBmeMtZmXYWGeFc8VgDueLhUxD5Eo2BCLt/pYXbmmqBUpMA+jqjvGs8b9sHVj/WWPY
 PV8LEOW82SWJ9Z0K2XcBJ4zezhU8d+i4hPUHj8W7pEP/kzvmWw7YIJqhx6RemsYPuzam
 rqxyMVFSKu3h/0CoDMoEajZWuoRvyyMbb3ONRYtsfTinxH6YbaaQw6ORxHSkQzutNDbB
 whv/P9EealDzFmfMvJxmEnwjGoTEmxHx7kCgo62ibqPgy/lc5KPEpV6DMbNs07CZyar2
 tet9+X1g9JZPe+a2w/dtMPr0fO64SAAKSDSRTtf+q5tWPaHvyaLF0bYdSCQfH192BOAe
 6hJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlFkB6OLPbC6RrcmQZ9UcdOmLqngdnt2St+K+qM+W4LEEptNtxkinW4OEXbquUWORc7kW07RXHGZo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3IFt6obrcqfKu/AFCWa4XsqbcqF64Sq9qd+nMhdquqtOpCIgA
 2MrPi1lvaUs6RSCSnlYVzittczycNW9tUDRUt3eStzDw/Hd2sy+O
X-Gm-Gg: ASbGncveMp7b+G3J8oavcniqFMUCxM8+MN3+83R3/7ePp0feFI9TpRfnuMuuEkwMh+D
 BxlWUh/9sz+uGL5D2L8mAO3gYTqbQDum3pAkcs/NTCAkCGBO2C/zfTYFWDGhPlH+Q9CboRb3IJO
 H4AXvarmXJNg9m1ec1BJIaqMpbdIDdrOJyHfArV0zDWbavuaO9SZj8fKvwF8VVBUoe4PDnLf/0A
 XfLJxVMWcjZvHoT9TNUJfRIiZ+3i1hbDX8qwe3Kn901RFNgpaKY3b0/41ozFg4K7t3rpWi56E3m
 EoJOnN0hIfCM7j+U9gg=
X-Google-Smtp-Source: AGHT+IGQJYMemdhzchakHAvCcrLvXLVQyZudyNgQh0lKIDqfAYSpRnqffoUO4VS2mZVGjuE0xgBPbQ==
X-Received: by 2002:ac2:4e06:0:b0:539:ea0f:cc43 with SMTP id
 2adb3069b0e04-53dc13384b9mr2398710e87.19.1732187925266; 
 Thu, 21 Nov 2024 03:18:45 -0800 (PST)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b01e117bsm55427445e9.8.2024.11.21.03.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 03:18:45 -0800 (PST)
Message-ID: <c3e3b5b4-1b67-4564-ab3e-da7a073f45ec@gmail.com>
Date: Thu, 21 Nov 2024 12:18:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sti: Add __iomem for mixer_dbg_mxn's parameter
To: Pei Xiao <xiaopei01@kylinos.cn>, alain.volmat@foss.st.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, --to=lkp@intel.com
Cc: ville.syrjala@linux.intel.com, kernel test robot <lkp@intel.com>
References: <202411191809.6V3c826r-lkp@intel.com>
 <c28f0dcb6a4526721d83ba1f659bba30564d3d54.1732087094.git.xiaopei01@kylinos.cn>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <c28f0dcb6a4526721d83ba1f659bba30564d3d54.1732087094.git.xiaopei01@kylinos.cn>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Sparse complains about incorrect type in argument 1.
> expected void const volatile  __iomem *ptr but got void *.
> so modify mixer_dbg_mxn's addr parameter.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411191809.6V3c826r-lkp@intel.com/
> Fixes: a5f81078a56c ("drm/sti: add debugfs entries for MIXER crtc")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
Hi,

Thanks for your fix.

Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Regards,
Raphaël
> ---
>   drivers/gpu/drm/sti/sti_mixer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_mixer.c b/drivers/gpu/drm/sti/sti_mixer.c
> index 7e5f14646625..06c1b81912f7 100644
> --- a/drivers/gpu/drm/sti/sti_mixer.c
> +++ b/drivers/gpu/drm/sti/sti_mixer.c
> @@ -137,7 +137,7 @@ static void mixer_dbg_crb(struct seq_file *s, int val)
>   	}
>   }
>   
> -static void mixer_dbg_mxn(struct seq_file *s, void *addr)
> +static void mixer_dbg_mxn(struct seq_file *s, void __iomem *addr)
>   {
>   	int i;
>   

