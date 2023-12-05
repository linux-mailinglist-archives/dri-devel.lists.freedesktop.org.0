Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5B9806179
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 23:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C78710E639;
	Tue,  5 Dec 2023 22:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C291410E608
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 21:18:07 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6ce72730548so967497b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 13:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1701811087; x=1702415887;
 darn=lists.freedesktop.org; 
 h=content-language:in-reply-to:autocrypt:from:references:cc:to
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FqlnvQW16nyM/4+Z2TN2ZrjqXtIsb9qn3QR8ENv3X2A=;
 b=ZM97Y0wI37jUqXDgol5rHEhGVauUY5vS4qMc7/FjitCIdCMkQUK4GxCirTDncPQIzq
 3VDNfulSoEyVPrT+4dkW84RAkYapDDDBHfJ19slansv6hWUWuIHsJfXuDzTE2RQZkiTT
 Rh9JrmDvuXWB4r+mH0kCXiz/E0GeeBRI7/fqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701811087; x=1702415887;
 h=content-language:in-reply-to:autocrypt:from:references:cc:to
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FqlnvQW16nyM/4+Z2TN2ZrjqXtIsb9qn3QR8ENv3X2A=;
 b=uThReKEKTVE/waH4Qe5vz4Mez+WsILewROI6at1xO6xaJr6ga55x6q0D0lzu6zC1Zm
 wH9iPKqRRoOBRZosh3oGrcTKpmqB0xEsxWSlJF+A3Mlt+EgzTmR9LJtJTJNx4Y2UHKrO
 SWtaK7SVtV5l+rp+yKtyFwXHiLSX06wI25YoSq+WevIjdXNbhZ4/A+4RXVhb6kRKHGau
 SLoKX27uwLJsw/iTfPq0DMBOQYYfTQ2kxExzKO90I9EwdLTBI7qbJTJ72kPv67W6AQKd
 kLwdiiwm9bRjNiE/XzkD7DlZnhLeHgtyHeRwqZ5Uf713hxhGQrCBe9IDuRosaCTZzQe8
 ONug==
X-Gm-Message-State: AOJu0YwIC8Msm4O3QL4+DSy6e1x9lApQype7mf4Zjb6cbY0ayAR9vNFQ
 pFt4gAzQFnSzs7BUzV/7wq1VjvhFT3dupZqv1wp7Q2qC5Ljyd4nRte3Zkje3LBdd8kOtyisGS2e
 Xq2jY19vaM3j+fv805H4=
X-Google-Smtp-Source: AGHT+IELeWNVuGK7mZfNA7Zqefhj9aCwCwIH9VJEe4vWYWz9B22XUDSfQLIwuLWMhoAGgwTkbkPqNw==
X-Received: by 2002:a05:6a00:e0f:b0:6ce:4941:c52d with SMTP id
 bq15-20020a056a000e0f00b006ce4941c52dmr2041170pfb.68.1701811087201; 
 Tue, 05 Dec 2023 13:18:07 -0800 (PST)
Received: from [10.62.14.168] ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 x13-20020aa784cd000000b006ce691a1419sm1949670pfn.186.2023.12.05.13.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 13:18:06 -0800 (PST)
Message-ID: <0c3c5ce8-f379-4ad9-8069-801299e78b0a@broadcom.com>
Date: Tue, 5 Dec 2023 13:18:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] drm/vmwgfx: Use vmware_hypercall API
To: Borislav Petkov <bp@alien8.de>, Alexey Makhalov <amakhalov@vmware.com>
References: <20231122233058.185601-8-amakhalov@vmware.com>
 <20231201232452.220355-1-amakhalov@vmware.com>
 <20231201232452.220355-6-amakhalov@vmware.com>
 <20231205202703.GIZW+Hl814mKqEDy/m@fat_crate.local>
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <20231205202703.GIZW+Hl814mKqEDy/m@fat_crate.local>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Mailman-Approved-At: Tue, 05 Dec 2023 22:13:57 +0000
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
Cc: pv-drivers@vmware.com, dri-devel@lists.freedesktop.org, namit@vmware.com,
 hpa@zytor.com, timothym@vmware.com, dave.hansen@linux.intel.co, x86@kernel.org,
 mingo@redhat.com, linux-graphics-maintainer@vmware.com,
 linux-input@vger.kernel.org, tzimmermann@suse.de, richardcochran@gmail.com,
 virtualization@lists.linux.dev, mripard@kernel.org, akaher@vmware.com,
 jsipek@vmware.com, tglx@linutronix.de, netdev@vger.kernel.org,
 dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org, horms@kernel.org,
 bp@alien8.d, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/5/23 12:27 PM, Borislav Petkov wrote:
> On Fri, Dec 01, 2023 at 03:24:51PM -0800, Alexey Makhalov wrote:
>> Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
>> Eliminate arch specific code.
>>
>> drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h: implement arm64 variant
>> of vmware_hypercall here for now. The move of these functions to
>> arch/arm64/include/asm/vmware.h as well as removal of
>> drivers/gpu/drm/vmwgfx/vmwgfx_msg_{x86,arm64}.h header files will
>> be performed in the follow up patchset.
> Same note as for patch 1 - no commit order in git.
>
>
Thanks for the review Borislav. I'll address your comments regarding 
description messages
in v3. It is going to be sent from @broadcom.com and may take some time 
to align with
corporate legal stuff.

--Alexey

-- 
This electronic communication and the information and any files transmitted 
with it, or attached to it, are confidential and are intended solely for 
the use of the individual or entity to whom it is addressed and may contain 
information that is confidential, legally privileged, protected by privacy 
laws, or otherwise restricted from disclosure to anyone else. If you are 
not the intended recipient or the person responsible for delivering the 
e-mail to the intended recipient, you are hereby notified that any use, 
copying, distributing, dissemination, forwarding, printing, or copying of 
this e-mail is strictly prohibited. If you received this e-mail in error, 
please return the e-mail to the sender, delete it from your computer, and 
destroy any printed copy of it.
