Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AE08B2794
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 19:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C8911A6B2;
	Thu, 25 Apr 2024 17:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Gg5rKRH5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825F611A6B2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 17:27:53 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6ee0642f718so1784229b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 10:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1714066073; x=1714670873;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=OOqmW9EMXSCXAzKPIqERIeQh9xbCR10AzpPSejSv1nY=;
 b=Gg5rKRH5/udDBWFSIt7clNgixf74EmUzXI5G8JAOjuyMj0y9wdiYBNrN0OsuXZ+Gcj
 QTdzjq4MXwIh1rM+Adk+tPVnO0H2l9QOBiJouJqexGkCHAwvWtfdogESgsJJC7c7KpNy
 Z4w0eXF6yJFpJ+eiXcLzXOGzNirvVpQYciYH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714066073; x=1714670873;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OOqmW9EMXSCXAzKPIqERIeQh9xbCR10AzpPSejSv1nY=;
 b=uhf+7Hdi2LMF8DAO/WX7fZwdmcNsR56P7K8Fbn8kU3LBAPu66meQbnNfBjAH94UFaT
 /ohcJ3XC/u7PomdS7umc+ZxDaDP0Pl9oCVVa7po3Nn1g+T5UQuAx1898c0rmuwNu/kP6
 0KqkCBobmpXW3Fx4zIQ37Ncdxq9Ac7tjGd2/9qb96tGSuw/Aw+gqh9vchGlgSyqXXQUe
 eqyVOZaiDQcbYJdjeULd7s2Et9mK3DMAaLSIpOrcygmjXNJ2rCskv3POwZhFFnU111nh
 rXmOevwokOkrgXeEgFUfLnq44zgPSU5JLy/1V9TrlMySC/B/XHoZZI8OJ6kj6Ptr/Wod
 /3Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlnXpZ4I4SBzZXLvj+Dzn146sv2ReT09er87Oref80JAkbCkVMMMuU351a5oUXFHiuSpFG+dKnMdrvxlMzj0S6qE5I/AS/SX5KLnBStF0M
X-Gm-Message-State: AOJu0Yz529g5p8sUFFYEyy47wjNDCT/AJrulfFUFFTYG1LY79UE5pV+Q
 oLLGQ+mihVLPeOvKXco7w0ufz44MENVB4c1PchEcuYFLqy47W6G4Iv9gh+6sxg==
X-Google-Smtp-Source: AGHT+IEyj9gBxZv62LFLgGLraFFkbznKTsTduDdrNLHM9g1XxKCbQgndWqkDDmR8l5zO3xGctaJgyw==
X-Received: by 2002:a05:6a20:2454:b0:1a9:509c:eba6 with SMTP id
 t20-20020a056a20245400b001a9509ceba6mr594000pzc.25.1714066072683; 
 Thu, 25 Apr 2024 10:27:52 -0700 (PDT)
Received: from [192.168.1.162] ([50.35.46.55])
 by smtp.gmail.com with ESMTPSA id
 i22-20020aa78b56000000b006f095e6b702sm13095672pfd.73.2024.04.25.10.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 10:27:52 -0700 (PDT)
Message-ID: <8356c1a0-4a4d-42e6-94dc-97abad2f8e04@broadcom.com>
Date: Thu, 25 Apr 2024 10:27:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/8] x86/vmware: Correct macro names
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de, x86@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-input@vger.kernel.org,
 dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com
References: <adcbfb9a-a4e1-4a32-b786-6c204d941e9f@broadcom.com>
 <20240424231407.14098-1-alexey.makhalov@broadcom.com>
 <20240425152130.GJZip0-l040XCyUapN@fat_crate.local>
Content-Language: en-US
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 xsFNBGVo9lkBEACeouRIm6Q3QTvjcnPczfBqgLffURstVJz5nqjnrNR4T+8dwNrZB8PTgOWA
 QdGV4bIyqtNG7UHQuZ7sVKr2tx0gYJyQ5uZgncEHB5YIuhQ/CyAHrVmO+5/0/xWCLI0g44rF
 ZJqsYw2JQ2+vayTWbR65rkOiKL8GOVFNZanDg80BRh6qCmCEMXd/tymxvgnvWpHtxMgukexk
 4vV9nV4XhxRVYdpLk8mBxsh+AEbHE+nbWgIuJDrmrZDGI2Dha7JFoB0Mi6hbbYd9BdkcHKQ7
 6c+S1xOrZL3jX7OIFhb4NNnEOhh8/+BDlyby478p6YsimNa7TgAUbrygGyfVG8usrZy8SvO+
 vUbVQwqjcJaCK1xazK12dfuZm2kSMJUrJqa9ng6OMjkE2/WrtnK8ruFNSCdytzbuheT0nYUJ
 Uwy84cU4p2K/N2C4vYjcn+IT+l1BFr5FViKYruoRLVH6zK/WOoZjA+Fc6tdM5nC1pgSB9c7h
 XLQqDSzYPzk3nqeHWG1qJ0Hu7pscIrjxyNTIZ5le0TlpblJdoRcL5maDNw22yle8m4D18ERF
 VrqNoqwW8fObMCHbd6C3m75lzerq1HhrSvLyU4UfprEyAcjOI1C0319SXfYlXDjKXRQyaDZP
 wxln8uShSitSSnx0AsSAjcUa8Cc7km81+G2WSK3S2wVIAN11awARAQABzS5BbGV4ZXkgTWFr
 aGFsb3YgPGFsZXhleS5tYWtoYWxvdkBicm9hZGNvbS5jb20+wsGNBBMBCAA3FiEEjLzRtST/
 a5u42vOKbM7yHr5SJ3cFAmVo9lwFCQ0oaIACGwMECwkIBwUVCAkKCwUWAgMBAAAKCRBszvIe
 vlInd0jTD/9bZtjehewLRrW3dRDAbLG/+J5g1K4X5qQPfAo42NrhZQlOTibL7ixwq7NSXynZ
 V4Iu9jHAW++KXjxJzkg7zjBf9OOvvgCpqZGKYgWNvHHnX4eIVh8Ikp5JtvGPMBcRv7lJA5co
 kb+RHo9iRrB1dvRIOsP1SlGS85SiNA0yvmgqwbigLDmDRSWtvvt9XPwU1iqF+1OopT3UE10i
 /z+qE2ogcw2ADveBovq2W4JeQEBvlETwDKOdh8Q3UBHOqrZUrL7YjpUxgmb89FcjdDzUU95I
 fCB5YxF0hUctxFH5Uujh2F4qk0m2rp7+aOGtxWCJUqkHXjgpOoxyn0FPZiZlDkst84NO5OSI
 5ZFPwaFqxUrFF+cFCY2O/UE2gpoK9Lt3gYNK6o2WIAtufuiYVdK6lANMkBgZ+t2fDLIN147a
 172zu8XnyJMTo+tVfUjxwqynoR/NSWpVPs0Ck3K0LGjQE0tJ6HZrH0vudXk3YaiqW+D4CtGh
 I17Pk0h6x8LCdjmWmuDXoc99ezOEFSyWuTHjAYxx3cmgSUyIhdHtimuf0CVLTcFoBErb/5pJ
 zjb11Cj0HP87FMH57bnD3qyfkBMOB6tztfdt3vkCBaWkxaiTGXNhwr4IiLUoi90yIdXDMcTj
 /gvnjXgN+31iYgPWgTOdUEQud0DwDwuDwkzx/0x4sF1Dfc7BTQRlaPZcARAAuGkoYKWcrCh8
 5RffedM6uBZ4p5Z4+RVj05uq7hlAwhHUpLP/XGbgNzhJP375Lonmnuyg2x7oHxfiwOohuuiA
 MnhSeEXn2qWZJuHosrYxs9y2zyiE/GTUAcqKiYBFa/96zOaZjHpNuQ5qSHYL64WhqvtmCQYg
 fL+jes2Z4IXl2R7MrN9OE+G3A3pOAo8TZKUEmlUV85fSmgopIX+hCiSQmRNRtp2jK6hd2+38
 YAXc+eRxYgXKaWX5zeBgNrfM7Oxeh/0iWRZPWstTvVH2xMlzywOB3e/fqg+Q3NlPGDrTyHoc
 L86ZELSLcMTFn+RXw8lX8oVjTcQA0M8sQHB5g0JEWtMsFjnQZkJGCfeh0Odbn/F8nZ6LQQtu
 +fjc/4n9vRun+PZjdhd3W9ZM9D87W9XJg9txIaYnoUXBLLpHK/OirFfr5cJTUf4svtE3EVXb
 x6P9vr7zqUbE0f76h1eDPmyMwFAuibIXhNoEoKQtEjLX9aKgKYny3hczRiuQpA+6U4oTNn4S
 /CEqphLPT53aMH0w4x0CebMPozf24ZE9YphdX8ECclLBlDL1/zx2xKrJNw8v6wdXMSfsybBW
 98b5b1eVBk1uc1UMlpDl7AIHyCMTjL9Ha85eoya/Hk9l93aVHgK04hOBY2ED1/ZRpj0M5P5m
 tNX1JqZunpyvKooT1PrJr4UAEQEAAcLBfAQYAQgAJhYhBIy80bUk/2ubuNrzimzO8h6+Uid3
 BQJlaPZeBQkNKGiAAhsMAAoJEGzO8h6+Uid3SDoQAI3XXqsehWKvyAVeGXPxmkk+Suos/nJC
 xZWjp4U2xbbegBnNWladZoNdlVW/WV+FSFsN5IWztxQTWBMI12A0dx+Ooi9PSIANnlN+gQsA
 9WeQ5iDNveEHZyK1GmuqZ3M3YZ1r3T2KyzTnPPZQ1B8gMQ442bOBWe077MqtLaC0J1jHyWHU
 j6BbUCAyR2/OCV/n1bH4wYIm2lgrOd2WuzoAGvju+j2g7hMRxw/xeHeu8S0czHuEZ0dC6fR1
 ZKUOw03+mM/xRzL1be6RVS9AF7R5oDd11RrTOb7k14z0inFqSRrRwzOPKcuMxrApcquar336
 3FQuLcJLjBo/SAOh2JatOkkwkw5PZseqdwcAk5+wcCbdYy8J8ttR04iV1FzrdQp8HbVxGNo7
 AlDn1qtoHzvJHSQG51tbXWfLIi1ek3tpwJWj08+Zo+M47X6B65g7wdrwCiiFfclhXhI1eJNy
 fqqZgi3rxgu4sc5lmR846emZ/Tx85/nizqWCv7xUBxQwmhRPZRW+37vS2OLpyrTtBj3/tEM9
 m9GMmTZqaJFeK7WCpprJV4jNHpWZuNAsQrdK1MrceIxb0/6wYe0xK79lScxms+zs9pGTrO4U
 5RoS4gXK65ECcBH8/mumV6oBmLrNxKUrzTczdo9PnkmRyZcAa6AndbjmQDznwxvTZu2LjMPC EuY0
In-Reply-To: <20240425152130.GJZip0-l040XCyUapN@fat_crate.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/25/24 8:21 AM, Borislav Petkov wrote:
> On Wed, Apr 24, 2024 at 04:14:06PM -0700, Alexey Makhalov wrote:
>> VCPU_RESERVED and LEGACY_X2APIC are not VMware hypercall commands.
>> These are bits in return value of VMWARE_CMD_GETVCPU_INFO command.
>> Change VMWARE_CMD_ prefix to GETVCPU_INFO_ one. And move bit-shift
>> operation to the macro body.
> 
> I don't understand:
> 
> $ git grep GETVCPU_INFO
> arch/x86/kernel/cpu/vmware.c:51:#define VMWARE_CMD_GETVCPU_INFO  68
> arch/x86/kernel/cpu/vmware.c:478:       VMWARE_CMD(GETVCPU_INFO, eax, ebx, ecx, edx);
> 
> so that's a VMWARE_CMD 68, at least the prefix says so.
> 
> And those two are *bits* in that eax which that hypercall returns.
> 
> Or are those two bits generic but defined in a vmware-specific
> hypercall?
> 
> Hm.
> 

These are VMware hypercall commands:
#define VMWARE_CMD_GETVERSION    10
#define VMWARE_CMD_GETHZ         45
#define VMWARE_CMD_GETVCPU_INFO  68
#define VMWARE_CMD_STEALCLOCK    91


These are VMware-specific macros to analyze return values of 
corresponding commands. They are prefixed with command name.
#define GETVCPU_INFO_LEGACY_X2APIC           BIT(3)
#define GETVCPU_INFO_VCPU_RESERVED           BIT(31)

#define STEALCLOCK_NOT_AVAILABLE (-1)
#define STEALCLOCK_DISABLED        0
#define STEALCLOCK_ENABLED         1


Name VMWARE_CMD_LEGACY_X2APIC was not correct as LEGACY_X2APIC is not a 
command but the meaning of 3rd bit of a return value of 
VMWARE_CMD_GETVCPU_INFO. So, change it to GETVCPU_INFO_LEGACY_X2APIC.
The same change with GETVCPU_INFO_VCPU_RESERVED.
Both these bits are not generic.

--Alexey
