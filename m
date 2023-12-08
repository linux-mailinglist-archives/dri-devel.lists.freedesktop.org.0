Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B002480992A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 03:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E5110E24C;
	Fri,  8 Dec 2023 02:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1A110E24C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 02:27:43 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1d04d286bc0so12431475ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 18:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1702002463; x=1702607263;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bYKvR9biHT3dayV04op9dSPEQWRRtNPHfVpKUnfsyTI=;
 b=Pv1PtY4DW7+/IWzHgyfCEPAFQTV2MCZtz2m11pUDoa4ht+gqc9SYyxoOWfxbcTs26M
 WOvS7q5vrQYJr1zmdzSpGcHrVs5F7nE3ywSv1Xgu8vcw4ZPwWH+lFuSv1Z6SL26E7s7k
 8s5xaPDaGTTZvSyVkhwZ32WqhlOn5RIL/WUsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702002463; x=1702607263;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bYKvR9biHT3dayV04op9dSPEQWRRtNPHfVpKUnfsyTI=;
 b=cRg9uGEaA+R4FzaN7qss55ozgYQb4Jhzeo7SUNWT1aZljyiKbwtt1tRK58phaGVnWH
 ToKNQTDYEKstP4C6sJWvMJ1/oZUBC07YZPutWwQMGb+KWSOc6zRdN5ET+h5b90uPBJ9F
 x59QijcU9PsHxbZSNV/IhdVYToWvWV1usf7ZgP3YFQTDm77AfYJoFPQ6YcPiIR0XdXgX
 tjxK6SJnfo4YVWDbSkNtjNTObFjHQ7mmtsiKThYVsq44H7c+5/lMHwsZC5L7Mybgg1OD
 C+/shmv4EGXGcUQGWmKlQSNUzn8fHOORLQcxw9DwBAq4Oau4jevVvTkfdlKkNW8wka5i
 8EKg==
X-Gm-Message-State: AOJu0YxEElXDiaIqCAi0eQD6ALrFZj3libiDynu/7q5K1/XeVP8m3VWX
 lrK9tBRsKkYhVsqdDxyxnRjisw==
X-Google-Smtp-Source: AGHT+IE+YH6XCFuLw8IMGfclF6KPMZA8MDgow7b5AP5v+501j19hkR62ob7PHHZkLnrwYuYQEJvI6w==
X-Received: by 2002:a17:903:230b:b0:1d0:6ffd:cea8 with SMTP id
 d11-20020a170903230b00b001d06ffdcea8mr3531967plh.97.1702002462996; 
 Thu, 07 Dec 2023 18:27:42 -0800 (PST)
Received: from [192.168.0.212] ([50.47.85.47])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a170902b58700b001d0c41b1d03sm512054pls.32.2023.12.07.18.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 18:27:42 -0800 (PST)
Message-ID: <64074f04-fd72-488b-831a-ad744bbcd950@broadcom.com>
Date: Thu, 7 Dec 2023 18:27:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vmware: Add TDX hypercall support
Content-Language: en-US
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, hpa@zytor.com, dave.hansen@linux.intel.co,
 bp@alien8.d, mingo@redhat.com, tglx@linutronix.de,
 dave.hansen@linux.intel.com
References: <ef8d3e17-7028-47fd-ad31-54dadbb6796d@broadcom.com>
 <20231206071527.59171-1-alexey.makhalov@broadcom.com>
 <53592a3a-3d96-4aa1-8357-ec595f59c5f3@intel.com>
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <53592a3a-3d96-4aa1-8357-ec595f59c5f3@intel.com>
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
Cc: dmitry.torokhov@gmail.com, tzimmermann@suse.de, pv-drivers@vmware.com,
 netdev@vger.kernel.org, richardcochran@gmail.com, x86@kernel.org,
 dri-devel@lists.freedesktop.org, horms@kernel.org, akaher@vmware.com,
 timothym@vmware.com, linux-graphics-maintainer@vmware.com, mripard@kernel.org,
 jsipek@vmware.com, linux-input@vger.kernel.org, namit@vmware.com,
 zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/7/23 9:12 AM, Dave Hansen wrote:
> On 12/5/23 23:15, Alexey Makhalov wrote:
>> +#ifdef CONFIG_INTEL_TDX_GUEST
>> +/* Export tdx hypercall and allow it only for VMware guests. */
>> +void vmware_tdx_hypercall_args(struct tdx_module_args *args)
>> +{
>> +	if (hypervisor_is_type(X86_HYPER_VMWARE))
>> +		__tdx_hypercall(args);
>> +}
>> +EXPORT_SYMBOL_GPL(vmware_tdx_hypercall_args);
>> +#endif
> 
> I think this is still too generic.  This still allows anything setting
> X86_HYPER_VMWARE to make any TDX hypercall.
> 
> I'd *much* rather you export something like vmware_tdx_hypercall() or
> even the high-level calls like hypervisor_ppn_reset_all().  The higher
> level and more specialized the interface, the less likely it is to be
> abused.

Dave, I understood your point. Please take a look on the next version of 
the patch.

I export vmware_tdx_hypercall(), while vmware_tdx_hypercall_args() is a
static inline wrapper on top.
Most of the vmware hypercall logic plus sanity checks are now in 
exported function. While only input and output argument handling remains 
in the wrapper to allow compiler optimization for hypercalls with few 
argument. Exporting vmware_tdx_hypercall1, vmware_tdx_hypercall3, and so 
on is not an option either.

Regards,
--Alexey
