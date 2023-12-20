Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C97A5819504
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 01:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986B010E258;
	Wed, 20 Dec 2023 00:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3C810E258
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 00:17:46 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-5cd8e2988ddso1626676a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 16:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1703031466; x=1703636266;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=vOWpbpPDJWdl4peog2qHCPFpo/pUG5DQNuld5TpDu3Q=;
 b=cwqccsUhm0xPxtMNoEZR4U1l7g3Nf/j9RocmUNZNzVpdka0CUtgeWlpHnyiYmNTyCQ
 BgTGubROHrK94ObHpdJXxNKChHKthrIhH5YKQtxrehJS0yhDaGjuk1bIh22IY4B1bgFI
 +/FHQgQ+Oo7lsOAsYOrVmY8fooJva4UW/mqAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703031466; x=1703636266;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vOWpbpPDJWdl4peog2qHCPFpo/pUG5DQNuld5TpDu3Q=;
 b=d80Td75wRu6mdVvGIqZ2ENrpClHXPJELw4BtFjUnBMK1gEijpUMqd//txlLjFa+bW+
 mX9TJHSVmHLXhRHYETxVnSR4lEQwE912z1GhyfStn9BDEBQ7J6afonKYqY+SbInYY1mG
 dDh4sjGLvGJFD8DYGWVvdyXdazKEZkoCq8FbSkcSEXPG7EgTvvUZram6rNj2NNlae7sW
 oRl5n48Hildgj3PRafaKSNAnCR/CQRZr9qFuYRnchWpJDQ0jFHInmSnj9ozncNMGH6PJ
 ZSYxcVOZdF7X1Cp3Nm22lMxwUKBOYaxxLeY1MfbY/vJ2JciK7llvWz4Hzo9NwiPv2EAB
 bbyQ==
X-Gm-Message-State: AOJu0YxOPgVzsiSt5Zao2+dkkITTbKOKkOpKMlOKLvr8zy46aDGQ7Rsg
 8zfvrIxvdziL5HPa1tPDSs57SQ==
X-Google-Smtp-Source: AGHT+IHIuMekCRXvJUY/dSTCtVx5xTxiebzylcTaZ86KKFW45a58KJKBg/YJ3jHYGLae3yu3QQ0CvA==
X-Received: by 2002:a17:902:d2cf:b0:1d0:6ffd:8352 with SMTP id
 n15-20020a170902d2cf00b001d06ffd8352mr8742191plc.93.1703031466096; 
 Tue, 19 Dec 2023 16:17:46 -0800 (PST)
Received: from [192.168.0.111] (d-174-140-102-53.fl.cpe.atlanticbb.net.
 [174.140.102.53]) by smtp.gmail.com with ESMTPSA id
 c7-20020a170902d48700b001d0c1281ef5sm21587781plg.89.2023.12.19.16.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 16:17:45 -0800 (PST)
Message-ID: <75eed318-2d22-429d-ab95-80610ba82934@broadcom.com>
Date: Tue, 19 Dec 2023 16:17:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] x86/vmware: Introduce vmware_hypercall API
To: kirill.shutemov@linux.intel.com
References: <20231219215751.9445-1-alexey.makhalov@broadcom.com>
 <20231219215751.9445-3-alexey.makhalov@broadcom.com>
 <20231219232023.u4dyuvbzbh565grk@box.shutemov.name>
Content-Language: en-US
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <20231219232023.u4dyuvbzbh565grk@box.shutemov.name>
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
Cc: pv-drivers@vmware.com, dave.hansen@linux.intel.com,
 dri-devel@lists.freedesktop.org, namit@vmware.com, hpa@zytor.com,
 airlied@gmail.com, timothym@vmware.com, x86@kernel.org, mingo@redhat.com,
 linux-graphics-maintainer@vmware.com, linux-input@vger.kernel.org,
 tzimmermann@suse.de, richardcochran@gmail.com, virtualization@lists.linux.dev,
 mripard@kernel.org, akaher@vmware.com, bp@alien8.de, jsipek@vmware.com,
 tglx@linutronix.de, netdev@vger.kernel.org, dmitry.torokhov@gmail.com,
 linux-kernel@vger.kernel.org, horms@kernel.org, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/19/23 3:20 PM, kirill.shutemov@linux.intel.com wrote:
> On Tue, Dec 19, 2023 at 01:57:47PM -0800, Alexey Makhalov wrote:
>> +static inline
>> +unsigned long vmware_hypercall1(unsigned long cmd, unsigned long in1)
> ...
>> +static inline
>> +unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
>> +				uint32_t *out1, uint32_t *out2)
> ...
>> +static inline
>> +unsigned long vmware_hypercall4(unsigned long cmd, unsigned long in1,
>> +				uint32_t *out1, uint32_t *out2,
>> +				uint32_t *out3)
> ...
>> +static inline
>> +unsigned long vmware_hypercall5(unsigned long cmd, unsigned long in1,
>> +				unsigned long in3, unsigned long in4,
>> +				unsigned long in5, uint32_t *out2)
> ...
>> +static inline
>> +unsigned long vmware_hypercall6(unsigned long cmd, unsigned long in1,
>> +				unsigned long in3, uint32_t *out2,
>> +				uint32_t *out3, uint32_t *out4,
>> +				uint32_t *out5)
> ...
>> +static inline
>> +unsigned long vmware_hypercall7(unsigned long cmd, unsigned long in1,
>> +				unsigned long in3, unsigned long in4,
>> +				unsigned long in5, uint32_t *out1,
>> +				uint32_t *out2, uint32_t *out3)
> 
> Naming is weird. The number in the name doesn't help much as there seems
> no system on how many of the parameters are ins and outs.

There was internal discussion on hypercall API naming. One of proposals 
was using 2 digits - number of input and number of output arguments.
And it definitely looked weird. So, we agreed to have just single number 
  - total number of arguments excluding cmd.

> 
> Why these combinations of ins/outs are supported?

VMware hypercalls can use up to 6 ins and 6 outs for LB and 7 ins and 7 
outs for HB calls. The mapping to x86 registers is below:
in0/out0 - rax
in1/out1 - rbx
in2/out2 - rcx
in3/out3 - rdx
in4/out4 - rsi
in5/out5 - rdi
in6/out6 - rbp (only used in high bandwidth hypercalls)
args 0, 2 and 6 are remapped to r12, r13 and r14 for TDX.

There is a standard on some arguments such as cmd on in2, magic on in0 
and output value is on out0. While other arguments are not standardized 
across hypercall.

Theoreticaly max hypercall, in term of number of arguments:
vmware_hypercall9(cmd, in1, in3, in4, in5, *out1, *out2, *out3, *out4, 
*out5)
But there is no such called in a linux kernel.

Current combination of hypercalls covers all current and future (not yet 
upstreamed) callers, with round up to next number in some cases.


> 
> And as an outsider, I'm curious where in2 got lost :P
> 
'lost' arguments:
in0 - indirectly initialized inside hypercall function.
out0 - return value from the hypercall.
[LB hypercalls] in2 <- input cmd
[HB hypercalls] in1 <- input cmd


Regards,
--Alexey

