Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 581C45EB2DE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 23:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7457110E6FC;
	Mon, 26 Sep 2022 21:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4398310E0DA;
 Mon, 26 Sep 2022 21:09:28 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id d24so7372061pls.4;
 Mon, 26 Sep 2022 14:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=7hiR0SpuwZReSlXLRcigPQKkR3hTLdfiyP448cVXiFw=;
 b=UJBQZykTPhHzdrrtre+mxfDn7aatmmKTmhDUKtx/UD5YqWSGbNAis4tgmo8DmeJSZv
 XL5fJxmytRdVeDwZ9HhK0uHyLYN+YoM+5t96uHoX9raiqOhfeEp3Hv+Fwt1GMf3IolMS
 FWHsM5rPdOmdno7sBNUIN57XY5Rq/qzK2DyOc3jSdSLk56zb7KyVA21N1pHtuzhb0g9D
 0Hzam8fwYOpQmxyRLDG6jSF4FY7ZBjW5JU4RARl2MYuAOBeq1k3ibI/yEAsjXXZF5a3w
 ffKP1ghdPpsDpwqzu9EQTtxK/o5IB7pXGozTYaBkeLdt01DMx9PMMv/M41jRgbz51RIT
 IJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=7hiR0SpuwZReSlXLRcigPQKkR3hTLdfiyP448cVXiFw=;
 b=sLT+KRNyefJpRvt+U3ffYcA6LPbbs9c7bSBT0ckYNFww26hDVyvwoKzCLVaMmPYyWm
 EOxO8pg64DtAWvaVUGsUmmJFH/6SgSK471qFqzgdfXwBuDocHH0ZgY7HVVUpnJ4M7rwD
 6VBWaUrxpjpdt7ft1nZUrkZ2aexe0qZf2pBpfLhn1QDFTwNwbScVitFC9QahLS+TM9R0
 C/fjrWhJBtx1jJjyR2IvC6O811OKuTqX1ZKxDta0CZae1FNKtZbEKAGOIz6ayYal47Bc
 zjU/pszHatIjPIHd+Ee7HMCGdr98T355/5p31hmw1clkJFLSNKlzr3ARFpER47JIGDXP
 gx3g==
X-Gm-Message-State: ACrzQf2lt7KBdWoAfRk6/aWJH5LgAO1OctQtHJfO6vzyRwQh3weNGqty
 zggcNvnWFsy6bjlvu2CjPEY=
X-Google-Smtp-Source: AMsMyM6XWAWe+Zn9tyh4ERXFKmtuqTiYVsHZEu4hNEGpIYT0A9opTtsNkUidS6jbXuYJmr0utLcNbw==
X-Received: by 2002:a17:90a:5508:b0:205:783c:7b6a with SMTP id
 b8-20020a17090a550800b00205783c7b6amr731777pji.218.1664226567748; 
 Mon, 26 Sep 2022 14:09:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a170902f54d00b00178af82a000sm11646470plf.122.2022.09.26.14.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 14:09:26 -0700 (PDT)
Message-ID: <f995da40-b20a-437b-0b1f-5028b861300d@roeck-us.net>
Date: Mon, 26 Sep 2022 14:09:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/7] Add HWMON support
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220926175211.3473371-1-badal.nilawar@intel.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220926175211.3473371-1-badal.nilawar@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, andi.shyti@intel.com, tvrtko.ursulin@intel.com,
 anshuman.gupta@intel.com, dri-devel@lists.freedesktop.org,
 ashutosh.dixit@intel.com, jon.ewins@intel.com, riana.tauro@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/26/22 10:52, Badal Nilawar wrote:
> This series adds the HWMON support for DGFX
> 
> Test-with: 20220919144408.251981-1-riana.tauro@intel.com
> 
> v2:
>    - Reorganized series. Created first patch as infrastructure patch
>      followed by feature patches. (Ashutosh)
>    - Fixed review comments (Jani)
>    - Fixed review comments (Ashutosh)
> 
> v3:
>    - Fixed review comments from Guenter
>    - Exposed energy inferface as standard hwmon interface (Ashutosh)
>    - For power interface added entries for critical power and maintained
>      standard interface for all the entries except
>      power1_max_interval
>    - Extended support for XEHPSDV (Ashutosh)
> 
> v4:
>    - Fixed review comment from Guenter
>    - Cleaned up unused code
> 
> v5:
>    - Fixed review comments (Jani)
> 
> v6:
>    - Fixed review comments (Ashutosh)
>    - Updated date and kernel version in documentation
> 
> v7:
>    - Fixed review comments (Anshuman)
>    - KernelVersion: 6.2, Date: February 2023 in doc (Tvrtko)
> 
> v8: s/hwmon_device_register_with_info/
>        devm_hwmon_device_register_with_info/ (Ashutosh)
> 

Is there some reason for not actually versioning this patch series ?
Just wondering.

Thanks,
Guenter

> Ashutosh Dixit (2):
>    drm/i915/hwmon: Expose card reactive critical power
>    drm/i915/hwmon: Expose power1_max_interval
> 
> Dale B Stimson (4):
>    drm/i915/hwmon: Add HWMON infrastructure
>    drm/i915/hwmon: Power PL1 limit and TDP setting
>    drm/i915/hwmon: Show device level energy usage
>    drm/i915/hwmon: Extend power/energy for XEHPSDV
> 
> Riana Tauro (1):
>    drm/i915/hwmon: Add HWMON current voltage support
> 
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  75 ++
>   drivers/gpu/drm/i915/Makefile                 |   3 +
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   8 +
>   drivers/gpu/drm/i915/i915_driver.c            |   5 +
>   drivers/gpu/drm/i915/i915_drv.h               |   2 +
>   drivers/gpu/drm/i915/i915_hwmon.c             | 736 ++++++++++++++++++
>   drivers/gpu/drm/i915/i915_hwmon.h             |  20 +
>   drivers/gpu/drm/i915/i915_reg.h               |   6 +
>   drivers/gpu/drm/i915/intel_mchbar_regs.h      |  21 +
>   9 files changed, 876 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>   create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
>   create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h
> 

