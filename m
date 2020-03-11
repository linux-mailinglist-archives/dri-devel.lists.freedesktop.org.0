Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C10D3182A80
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFDC6EA3D;
	Thu, 12 Mar 2020 08:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BE56E996
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:55:05 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p2so3017678wrw.7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 07:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=T6dhYyYvJS/8Bl4FjnByulc+SHG/kFSfXU5KSrYTgvo=;
 b=YpR821mEYGSQYCAJdxDmyyX1QVwPDu7Rb+v0SpjUUf77rpGL4EX+ni4S+CA2f5Ddd4
 Tn6GVumWKMkc+KSE4/YRS9Bh9EXH07aq1OGbWacOITIjyrgjPKWp5s8QtRFCtElId6ap
 loh9EfaNtUHKS0cARkPlOA5W3ZvPDVQe4YKYApAG4RFW2sO+D4lojIESO+ye4U8YfB0U
 OA7UmdyO96F/KOBzabiUxreqyVAmzi4lLfGFxNyETOZu5z/8kdcwLFq4eTsGGz3FN+Qt
 Zq9+pswIm00N4KRxKmDlZZouEd/pvKvXEVr3JS3V9AZ8rQJlOaDRPFtcDijkVtvYv9mf
 QLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=T6dhYyYvJS/8Bl4FjnByulc+SHG/kFSfXU5KSrYTgvo=;
 b=J3F1mYpNcWbjpLS0H8DVBtIQZbUb2Xxo2bpPIozMOPv1q+TpwCNiavWwtYkxwJgVFf
 t+WzHNzQn/pd7opZut6Z7oi95cZLTxF9GiViRK04VwBjhzBP4YZQhBjXAcEnjDVBxaQ1
 fIzIOKEnrJyoB8Bwukqa4+uy2JlfQ7vQsoW+hjdsrk6zFG9Qrf777bm9duMnLMACM8Kw
 5vCLJnnkGSGSSqa+jUwtKMNbyhdG7LmVw+tsR722uDGnGGtJXgYVSbDRhStrt9KWrGjJ
 cWXPpEGgHfOi0d1TH0RA4eZRdjEO54bS/3Xz1f459OIfAFr08xpg0yXsIxVfBIDTbSAb
 1x4g==
X-Gm-Message-State: ANhLgQ2lug8lCdTfDZ/lBcHBd+Q3SEGF7c9/LYBLBkjCKpDsi6WlR1oh
 7y3LGmwLqUKfvrfUD1q5PRk=
X-Google-Smtp-Source: ADFU+vs4BWU2lMGWUFQMXyBURcsQiYdsefcfXhTiCwDFmuMlBP9RvmVVDzc5UzvPBDK9q9P6PpDWBQ==
X-Received: by 2002:adf:a506:: with SMTP id i6mr4636282wrb.146.1583938503671; 
 Wed, 11 Mar 2020 07:55:03 -0700 (PDT)
Received: from wambui.local ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i7sm56001662wro.87.2020.03.11.07.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 07:55:02 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
X-Google-Original-From: Wambui Karuga <wambui@wambui>
Date: Wed, 11 Mar 2020 17:54:46 +0300 (EAT)
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 10/21] drm/tegra: remove checks for debugfs functions
 return value
In-Reply-To: <20200311143753.GC494173@ulmo>
Message-ID: <alpine.LNX.2.21.99999.375.2003111750360.14786@wambui>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
 <20200227120232.19413-11-wambui.karugax@gmail.com>
 <20200311143753.GC494173@ulmo>
User-Agent: Alpine 2.21.99999 (LNX 375 2019-10-29)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, Wambui Karuga <wambui.karugax@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Thierry,

On Wed, 11 Mar 2020, Thierry Reding wrote:

> On Thu, Feb 27, 2020 at 03:02:21PM +0300, Wambui Karuga wrote:
>> Since 987d65d01356 (drm: debugfs: make
>> drm_debugfs_create_files() never fail) there is no need to check the
>> return value of drm_debugfs_create_files(). Therefore, remove the
>> return checks and error handling of the drm_debugfs_create_files()
>> function from various debugfs init functions in drm/tegra and have
>> them return 0 directly.
>>
>> This change also includes removing the use of drm_debugfs_create_files
>> as a return value in tegra_debugfs_init() and have the function declared
>> as void.
>>
>> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
>> ---
>>  drivers/gpu/drm/tegra/dc.c   | 11 +----------
>>  drivers/gpu/drm/tegra/drm.c  |  8 ++++----
>>  drivers/gpu/drm/tegra/dsi.c  | 11 +----------
>>  drivers/gpu/drm/tegra/hdmi.c | 11 +----------
>>  drivers/gpu/drm/tegra/sor.c  | 11 +----------
>>  5 files changed, 8 insertions(+), 44 deletions(-)
>
> Applied, thanks.
>
There's a newer version[1] of this patch series as this specific patch 
depends on other work in drm.

Thanks,
wambui karuga.

[1] https://lists.freedesktop.org/archives/dri-devel/2020-March/258793.html
> Thierry
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
