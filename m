Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9DF52CA76
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 05:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9541611A413;
	Thu, 19 May 2022 03:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E50A11A413;
 Thu, 19 May 2022 03:41:32 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id v66so5067162oib.3;
 Wed, 18 May 2022 20:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=E+Jeeum5dAYeu7JrVKgmUScX8K6q6nSaD3V1Uo7Z0xo=;
 b=KFjvSCT6GXj5Kr0HO4phTFW0x5Mhrxpol/LwndM9mgk+gt2L/LZ/5khjHvxx9tCYCl
 ccDkePOGAv4JpJmRo0Xqzh6ClQpZnN/1/b7sQl4OHAEBLezdGI2XWE9/o/Z1OZFdJplA
 hvInyanC3HKTFBbmtIho+sxxjhNvtMvXN/SpDUcK6pzwbtXhkX4B8r6bM063uhwPRf2Y
 cRgCWW0s7tOlAD3+MsxhCIYV0WDd/vE6gTqXbb2/O3YdWrgPTUK3f0QWoOCgnNy5j+zJ
 Pm+2UwK0eLGDknVSYV48h5O6crlLJ0idezAZuMW3TB+ty1IBtVt29pHwTXbVrYvZnNon
 S1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=E+Jeeum5dAYeu7JrVKgmUScX8K6q6nSaD3V1Uo7Z0xo=;
 b=alLxFgFcZK2TR4rusGjOR9GAp8LxfgCayNRPWdV9Jwz3seDAKN0Lc+iCkyZPsZcbfN
 RfTPjl0aj/ttQHHUjQyiC0i8BIYhkY0o76bjW+4/fI4ooNG3VwrLM2y60DdzcgpSDgAV
 Ok+nDquEfTY51N7lUGeM28gmgamP/3+B6/SogV6KNV8aMIAWO1P6Mud7kMKOrtBPlEnd
 4riC21ffpA2HLuH2STL3pylfTrq6GFihi9eATt/ebQrDHkd/BxBsYYlOTI9hn8JVhDb9
 038nr1ub0w+SgcCV4y1UTcVXJRP7bbaaELWSJ1r9TSXMw0Q1mCoHkNbQ7iypwdwiTIl5
 jPZw==
X-Gm-Message-State: AOAM531KQR97RzdtatA4fU1lD/9viS8yw1HYe1jJGjnZkvD+m8WurhRx
 v86FsdtDnH2fQIPTf+h2XOVDfnr99FnR2w==
X-Google-Smtp-Source: ABdhPJzNbyvmXREi3jFpQ1BXha9I4ZZcQvTagfhdtbiKBgx1gr2M0BpSR/Ospfm2JXh/HEBEZ+zfpQ==
X-Received: by 2002:aca:4154:0:b0:322:7a9c:7daa with SMTP id
 o81-20020aca4154000000b003227a9c7daamr1784072oia.52.1652931691271; 
 Wed, 18 May 2022 20:41:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p4-20020aca4204000000b0032694a9925esm1451284oia.10.2022.05.18.20.41.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 20:41:30 -0700 (PDT)
Message-ID: <0530d502-1291-23f3-64ac-97bd38a26bd4@roeck-us.net>
Date: Wed, 18 May 2022 20:41:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <6285958d.+Z2aDZ4O1Y9eiazd%lkp@intel.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [linux-next:master] BUILD REGRESSION
 736ee37e2e8eed7fe48d0a37ee5a709514d478b3
In-Reply-To: <6285958d.+Z2aDZ4O1Y9eiazd%lkp@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, linux-fbdev@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-nvme@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/18/22 17:55, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: 736ee37e2e8eed7fe48d0a37ee5a709514d478b3  Add linux-next specific files for 20220518
> 
> Error/Warning reports:
> 
> https://lore.kernel.org/linux-mm/202204291924.vTGZmerI-lkp@intel.com
> https://lore.kernel.org/linux-mm/202205041248.WgCwPcEV-lkp@intel.com
> https://lore.kernel.org/linux-mm/202205122113.uLKzd3SZ-lkp@intel.com
> https://lore.kernel.org/linux-mm/202205172344.3GFeaum1-lkp@intel.com
> https://lore.kernel.org/linux-mm/202205190527.o9wVEvHI-lkp@intel.com
> 
> Error/Warning: (recently discovered and may have been fixed)
> 
[ .. ]
> drivers/hwmon/nct6775-platform.c:199:9: sparse:    unsigned char
> drivers/hwmon/nct6775-platform.c:199:9: sparse:    void

This is getting tiresome. Every driver using outb() on m68k will
experience that "problem". As far as I can see, it is caused by

#define out_8(addr,b) (void)((*(__force volatile u8 *) (unsigned long)(addr)) = (b))

in arch/m68k/include/asm/raw_io.h. I have no idea what the
"(void)" is for, but removing it "fixes" the problem.
Either case, this is not a problem with the nct6775 driver,
nor is it a new problem.

Guenter
