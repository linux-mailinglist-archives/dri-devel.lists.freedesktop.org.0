Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D8A1416E8
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 10:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03A56F9E3;
	Sat, 18 Jan 2020 09:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38B66F8CF;
 Fri, 17 Jan 2020 19:26:26 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f129so8753970wmf.2;
 Fri, 17 Jan 2020 11:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=CrQQQJS6hPBOvSxXvrnAqrRK6fwLt7e2C0voH4SKr0k=;
 b=fahfwsIRCL5XcTiGfHpb3xGA0wah3PeuQkVPJ+bnXWvwF8ZLPAyRVZUvCSuRWwP4Cj
 ur0GAKBTlTRdpHIREQ8aSuOXyNpFoPb6iE8otT46i3QXIef0/J5iI5oexgHOY6JogqYV
 3GPSBxNVU08D0HYXxxzvYLIyiv5W/XDutH95CdP9gcTdXmm9UE91QnYTF/U+3deBcB2N
 rpH/zmemra+IW4ovEzPmp8On7ZJ+HLghcYzgYrBYqHRnYovG8ekFuubY11ikbpKvZpEs
 2Ct3BRmqAPvR/21AB9XSSyN14ruV9V0eWn2mf+x9AaBQAx3zHabOT4rx3HnBNZHFgIzX
 GLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=CrQQQJS6hPBOvSxXvrnAqrRK6fwLt7e2C0voH4SKr0k=;
 b=WuuSvms6gL8kHudCX6NH900riKxX4RyKVlVuwy1z/MFosgkIum3hcwnyU9KYB1UIvy
 XiZIQb/+FW4PUNXWyONHNYHwaCTgsvKDy0ppBBCDmudqKLPgEORYq8zGRWtykkK36K4e
 YiwHCzl5RuHfFRp6e0qLtoqPeuSAvh2yCBRUHHppYsS97JgHILPqmL5NYrUNEVn83hd7
 iHLgg8ZH47vsMjo6XZjASDvHCiWBOMFR+bB15CRsBHW814FygMZtO4mr0cSDU8jpMF/2
 W5ia1EZIv/MBmxZGw3+k0wqVgd1oDXY2h3zVn3IN/YDA8iGPcrl1sK1rEAYGfGYl9A5D
 C4jQ==
X-Gm-Message-State: APjAAAVkPRFjnWHcqULooyFG3W+cipiF2EBzQi2lpaNaI0NaWdLaUvoj
 wIIrdK/lOps8yQfmTD+5d3eXqQ3fP7c=
X-Google-Smtp-Source: APXvYqwOum254fHTkisVnySvou7896TOt5jeUfPQz9ywH+p1klU2v02mlCRjQfhM3e1ZB/NTNFeLXQ==
X-Received: by 2002:a1c:a78c:: with SMTP id q134mr6234664wme.98.1579289185316; 
 Fri, 17 Jan 2020 11:26:25 -0800 (PST)
Received: from wambui.local ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id q11sm35636991wrp.24.2020.01.17.11.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 11:26:24 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
X-Google-Original-From: Wambui Karuga <wambui@wambui>
Date: Fri, 17 Jan 2020 22:25:44 +0300 (EAT)
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 0/4] drm/i915/display: conversion to new logging
 macros.
In-Reply-To: <87pnfigpi5.fsf@intel.com>
Message-ID: <alpine.LNX.2.21.99999.375.2001172219550.18007@wambui>
References: <20200116130947.15464-1-wambui.karugax@gmail.com>
 <87pnfigpi5.fsf@intel.com>
User-Agent: Alpine 2.21.99999 (LNX 375 2019-10-29)
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 18 Jan 2020 09:55:11 +0000
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, sean@poorly.run,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Fri, 17 Jan 2020, Jani Nikula wrote:

> On Thu, 16 Jan 2020, Wambui Karuga <wambui.karugax@gmail.com> wrote:
>> This series converts the printk based logging macros in
>> drm/i915/display/intel_display.c to the new struct drm_device based
>> logging macros. This change was split into four for manageability and
>> due to the size of drm/i915/display/intel_display.c.
>
> Please still write more descriptive commit messages than "part N".
>
What would be a more descriptive subject line? I wasn't really sure about 
the subject line since the series is for the same file - which is why I 
went with "part N".

> What are your basing your patches on? Our CI uses 
drm-tip, and it's > failing to apply the patches.
>
I'm using drm-tip, but I can rebase and try again.

Thanks.
wambui.
> BR,
> Jani.
>
>
>
>>
>> Wambui Karuga (4):
>>   drm/i915/display: conversion to new logging macros part 1
>>   drm/i915/display: conversion to new logging macros part 2
>>   drm/i915/display: conversion to new logging macros part 3
>>   drm/i915/display: convert to new logging macros part 4.
>>
>>  drivers/gpu/drm/i915/display/intel_display.c | 1021 ++++++++++--------
>>  1 file changed, 596 insertions(+), 425 deletions(-)
>
> -- 
> Jani Nikula, Intel Open Source Graphics Center
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
