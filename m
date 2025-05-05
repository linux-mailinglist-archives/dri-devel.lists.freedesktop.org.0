Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2661AA8B42
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 05:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A9310E2E9;
	Mon,  5 May 2025 03:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K/E33fAi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB08410E2E9;
 Mon,  5 May 2025 03:12:53 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b1a1930a922so2659023a12.3; 
 Sun, 04 May 2025 20:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746414773; x=1747019573; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TlgSStpSYXQ2a9TUV+lZAcOUuuATCiZr4BxvCgwoP5Y=;
 b=K/E33fAiBCku84o6mgiriAK0G/upLf3t27YO/kY/TruqnO2WZUpEVwsUDTRGeCoPQa
 s92PQvvnrF/S5g8XY2KkuKfOZaJwCW3/zGqgYGWeRJ8j0u6yucYdjCce/ex02ZxyCXyz
 IFeXSHnowQ+rwWiN3DLoNGoFTlwefODfGd0AZ0Hq+BNQZGrXk/QegcCYQfpx++PScIL1
 4TbIFmagV/dInBmAcpIBe2B3KsZxBmdyoCckM8gdgp13LK2NJWCx+K1uY6IGohaNzXWV
 FflcvmC2sCyl9ThJB4QvUCZAvlwaOq956n+kt4fzuRcJlIDQo4GHmDIQ9Y7xoLtjaV/b
 y/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746414773; x=1747019573;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TlgSStpSYXQ2a9TUV+lZAcOUuuATCiZr4BxvCgwoP5Y=;
 b=Coq0OGA8ElU+qiIxJ7ncBPeZ+WpK0fhjrTY/qMWrpPbzWFHXQ/WIdR0pDCeEH8an1M
 mgjoxO+KKiT7R8q2AEU7nu1OCwsJD1XkE6VytTsz1wcNMZWZ28QbmzG+4cwSUPNEv7QV
 xPG0pmrz953Kn1g6B47Lf8x1Hd0A9HywhXKlyer7cCGMcwR0f8ziRqzQkC7t8oVtqe1H
 5zESsgpxCkNpyD4vhJHe7mz9vz9ft1hs7FK8G83B34TUZD8CSVzivjdUtnsXeDRlX/ue
 oNc88Ka9NmMFhgruuIMEk7V+IJgAzkkf+avzcckleI0ZRi3B/5uh9xVtauaCNQMPZAQz
 F2hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7PR24O72QxFTBs+ObB2KTA0vI002si9FQb0z3oO9/A02Xq3PJYoikgHc9KTTbYBH5WO/R4d1YD/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIi6bYchGswSA3wJCdvhiSc1xuYt48LbmvTKurj+JEgx8NXCt1
 w+7CCX0Av4Huw4iDainZ/XjqPBeZpagyJ+/uSuEkX5dkCcI+vQqWF2ZfCg==
X-Gm-Gg: ASbGncvFA3sq9uJlZNK2b6kiit6Z/uBnQApXFXUFABSECaAjHoIeCQPHwvvkuY4ZGPu
 Ls4uriVYByAiIi+ql2xKOxbf5iaujqjF2dD+FKeZtWIM1E92EQyLoFUZSzB47nDKXlF95rhtFOt
 G2J7wz/imrhS9AM5nPYP1yZKj3p8HFcXKIkSOJ4kLg3A1a9fAYWnR5YxiPU4vb7yh7KWIjfO7OC
 CPD1Cql30l4/tMmlg43yGHgZ6/fv2Qw8WztaRSgc8Dx06LwmM30A+UQidMLqeC27cC65r3FrrV1
 VYFaTJGjoz9JiB2yJsczc5LUSA27ETMQt3QfJ/wePzXNKo+n
X-Google-Smtp-Source: AGHT+IEIGQK5pJPC9ad+ktF++Wil1ARW/ydqEqUl7LMXOEO9CEBc8/2iFt8F3CH+dqvY45W3k63u+g==
X-Received: by 2002:a17:90b:4c51:b0:2ee:b4bf:2d06 with SMTP id
 98e67ed59e1d1-30a5ae52d16mr10505882a91.19.1746414773098; 
 Sun, 04 May 2025 20:12:53 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a4762672bsm7527392a91.32.2025.05.04.20.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 May 2025 20:12:52 -0700 (PDT)
Message-ID: <2b9baf30-53ae-4653-8043-afbc2e396107@gmail.com>
Date: Mon, 5 May 2025 10:12:47 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] nova-core: docs: Document vbios layout
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
 <20250503040802.1411285-4-joelagnelf@nvidia.com> <aBgp5ZTIArRukRk8@archie.me>
Content-Language: en-US
In-Reply-To: <aBgp5ZTIArRukRk8@archie.me>
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

On 5/5/25 10:00, Bagas Sanjaya wrote:
> On Sat, May 03, 2025 at 12:07:55AM -0400, Joel Fernandes wrote:
>> +Here is a block diagram of the VBIOS layout::
>> +
>> + ┌────────────────────────────────────────────────────────────────────────┐
>> + │ VBIOS (Starting at ROM_OFFSET: 0x300000)                               │
>> + ├────────────────────────────────────────────────────────────────────────┤
>> + │ ┌───────────────────────────────────────────────┐                      │
>> + │ │ PciAt Image (Type 0x00)                       │                      │
>> + │ ├───────────────────────────────────────────────┤                      │
>> + │ │ ┌───────────────────┐                         │                      │
>> + │ │ │ ROM Header        │                         │                      │
>> + │ │ │ (Signature 0xAA55)│                         │                      │
>> + │ │ └───────────────────┘                         │                      │
>> + │ │         │ rom header's pci_data_struct_offset │                      │
>> + │ │         │ points to the PCIR structure        │                      │
>> + │ │         V                                     │                      │
>> + │ │ ┌───────────────────┐                         │                      │
>> + │ │ │ PCIR Structure    │                         │                      │
>> + │ │ │ (Signature "PCIR")│                         │                      │
>> + │ │ │ last_image: 0x80  │                         │                      │
>> + │ │ │ image_len: size   │                         │                      │
>> + │ │ │ in 512-byte units │                         │                      │
>> + │ │ └───────────────────┘                         │                      │
>> + │ │         │                                     │                      │
>> + │ │         │ NPDE immediately follows PCIR       │                      │
>> + │ │         V                                     │                      │
>> + │ │ ┌───────────────────┐                         │                      │
>> + │ │ │ NPDE Structure    │                         │                      │
>> + │ │ │ (Signature "NPDE")│                         │                      │
>> + │ │ │ last_image: 0x00  │                         │                      │
>> + │ │ └───────────────────┘                         │                      │
>> + │ │                                               │                      │
>> + │ │ ┌───────────────────┐                         │                      │
>> + │ │ │ BIT Header        │ (Signature scanning     │                      │
>> + │ │ │ (Signature "BIT") │  provides the location  │                      │
>> + │ │ └───────────────────┘  of the BIT table)      │                      │
>> + │ │         │ header is                           │                      │
>> + │ │         | followed by a table of tokens       │                      │
>> + │ │         V one of which is for falcon data.    │                      │
>> + │ │ ┌───────────────────┐                         │                      │
>> + │ │ │ BIT Tokens        │                         │                      │
>> + │ | |  ______________   |                         |                      |
>> + │ │ │ │ Falcon Data │   │                         │                      │
>> + │ │ │ │ Token (0x70)│---+------------>------------┼──+                   │
>> + │ │ │ └─────────────┘   │  falcon_data_ptr()      │  │                   │
>> + │ │ └───────────────────┘                         │  V                   │
>> + │ └───────────────────────────────────────────────┘  │                   │
>> + │              (no gap between images)               │                   │
>> + │ ┌───────────────────────────────────────────────┐  │                   │
>> + │ │ EFI Image (Type 0x03)                         │  │                   │
>> + │ ├───────────────────────────────────────────────┤  │                   │
>> + │ | Contains the UEFI GOP driver (Graphics Output)|  |                   |
>> + │ │ ┌───────────────────┐                         │  │                   │
>> + │ │ │ ROM Header        │                         │  │                   │
>> + │ │ +───────────────────+                         │  │                   │
>> + │ │ │ PCIR Structure    │                         │  │                   │
>> + │ │ +───────────────────+                         │  │                   │
>> + │ │ │ NPDE Structure    │                         │  │                   │
>> + │ │ └───────────────────┘                         │  │                   │
>> + │ │ │ Image data        │                         │  │                   │
>> + │ │ └───────────────────┘                         │  │                   │
>> + │ └───────────────────────────────────────────────┘  │                   │
>> + │              (no gap between images)               │                   │
>> + │ ┌───────────────────────────────────────────────┐  │                   │
>> + │ │ First FwSec Image (Type 0xE0)                 │  │                   │
>> + │ ├───────────────────────────────────────────────┤  │                   │
>> + │ │ ┌───────────────────┐                         │  │                   │
>> + │ │ │ ROM Header        │                         │  │                   │
>> + │ │ +───────────────────+                         │  │                   │
>> + │ │ │ PCIR Structure    │                         │  │                   │
>> + │ │ +───────────────────+                         │  │                   │
>> + │ │ │ NPDE Structure    │                         │  │                   │
>> + │ │ └───────────────────┘                         │  │                   │
>> + │ │ │ Image data        │                         │  │                   │
>> + │ │ └───────────────────┘                         │  │                   │
>> + │ └───────────────────────────────────────────────┘  │                   │
>> + │              (no gap between images)               │                   │
>> + │ ┌───────────────────────────────────────────────┐  │                   │
>> + │ │ Second FwSec Image (Type 0xE0)                │  │                   │
>> + │ ├───────────────────────────────────────────────┤  │                   │
>> + │ │ ┌───────────────────┐                         │  │                   │
>> + │ │ │ ROM Header        │                         │  │                   │
>> + │ │ +───────────────────+                         │  │                   │
>> + │ │ │ PCIR Structure    │                         │  │                   │
>> + │ │ +───────────────────+                         │  │                   │
>> + │ │ │ NPDE Structure    │                         │  │                   │
>> + │ │ └───────────────────┘                         │  │                   │
>> + │ │                                               │  │                   │
>> + │ │ ┌───────────────────┐                         │  │                   │
>> + │ │ │ PMU Lookup Table  │ <- falcon_data_offset   │<─┘                   │
>> + │ │ │ ┌─────────────┐   │    pmu_lookup_table     │                      │
>> + │ │ │ │ Entry 0x85  │   │                         │                      │
>> + │ │ │ │ FWSEC_PROD  │   │                         │                      │
>> + │ │ │ └─────────────┘   │                         │                      │
>> + │ │ └───────────────────┘                         │                      │
>> + │ │         │                                     │                      │
>> + │ │         │ points to                           │                      │
>> + │ │         V                                     │                      │
>> + │ │ ┌───────────────────┐                         │                      │
>> + │ │ │ FalconUCodeDescV3 │ <- falcon_ucode_offset  │                      │
>> + │ │ │ (FWSEC Firmware)  │    fwsec_header()       │                      │
>> + │ │ └───────────────────┘                         │                      │
>> + │ │         │   immediately followed  by...       │                      │
>> + │ │         V                                     │                      │
>> + │ │ ┌────────────────────────────┐                │                      │
>> + │ │ │ Signatures + FWSEC Ucode   │                │                      │
>> + │ │ │ fwsec_sigs(), fwsec_ucode()│                │                      │
>> + │ │ └────────────────────────────┘                │                      │
>> + │ └───────────────────────────────────────────────┘______________________│
> 
> Diagram borders look messy in htmldocs output (due to Unicode characters
> ─ and │), so I use ASCII dash and vertical bar instead:
> 
> ---- >8 ----
> diff --git a/Documentation/gpu/nova/core/vbios.rst b/Documentation/gpu/nova/core/vbios.rst
> index dd6ac891e5f1d0..c68ef0e7b70124 100644
> --- a/Documentation/gpu/nova/core/vbios.rst
> +++ b/Documentation/gpu/nova/core/vbios.rst
> @@ -56,112 +56,113 @@ The VBIOS layout is roughly a series of concatenated images as follows:
>   
>   Here is a block diagram of the VBIOS layout::
>   
> - ┌────────────────────────────────────────────────────────────────────────┐
> - │ VBIOS (Starting at ROM_OFFSET: 0x300000)                               │
> - ├────────────────────────────────────────────────────────────────────────┤
> - │ ┌───────────────────────────────────────────────┐                      │
> - │ │ PciAt Image (Type 0x00)                       │                      │
> - │ ├───────────────────────────────────────────────┤                      │
> - │ │ ┌───────────────────┐                         │                      │
> - │ │ │ ROM Header        │                         │                      │
> - │ │ │ (Signature 0xAA55)│                         │                      │
> - │ │ └───────────────────┘                         │                      │
> - │ │         │ rom header's pci_data_struct_offset │                      │
> - │ │         │ points to the PCIR structure        │                      │
> - │ │         V                                     │                      │
> - │ │ ┌───────────────────┐                         │                      │
> - │ │ │ PCIR Structure    │                         │                      │
> - │ │ │ (Signature "PCIR")│                         │                      │
> - │ │ │ last_image: 0x80  │                         │                      │
> - │ │ │ image_len: size   │                         │                      │
> - │ │ │ in 512-byte units │                         │                      │
> - │ │ └───────────────────┘                         │                      │
> - │ │         │                                     │                      │
> - │ │         │ NPDE immediately follows PCIR       │                      │
> - │ │         V                                     │                      │
> - │ │ ┌───────────────────┐                         │                      │
> - │ │ │ NPDE Structure    │                         │                      │
> - │ │ │ (Signature "NPDE")│                         │                      │
> - │ │ │ last_image: 0x00  │                         │                      │
> - │ │ └───────────────────┘                         │                      │
> - │ │                                               │                      │
> - │ │ ┌───────────────────┐                         │                      │
> - │ │ │ BIT Header        │ (Signature scanning     │                      │
> - │ │ │ (Signature "BIT") │  provides the location  │                      │
> - │ │ └───────────────────┘  of the BIT table)      │                      │
> - │ │         │ header is                           │                      │
> - │ │         | followed by a table of tokens       │                      │
> - │ │         V one of which is for falcon data.    │                      │
> - │ │ ┌───────────────────┐                         │                      │
> - │ │ │ BIT Tokens        │                         │                      │
> - │ | |  ______________   |                         |                      |
> - │ │ │ │ Falcon Data │   │                         │                      │
> - │ │ │ │ Token (0x70)│---+------------>------------┼──+                   │
> - │ │ │ └─────────────┘   │  falcon_data_ptr()      │  │                   │
> - │ │ └───────────────────┘                         │  V                   │
> - │ └───────────────────────────────────────────────┘  │                   │
> - │              (no gap between images)               │                   │
> - │ ┌───────────────────────────────────────────────┐  │                   │
> - │ │ EFI Image (Type 0x03)                         │  │                   │
> - │ ├───────────────────────────────────────────────┤  │                   │
> - │ | Contains the UEFI GOP driver (Graphics Output)|  |                   |
> - │ │ ┌───────────────────┐                         │  │                   │
> - │ │ │ ROM Header        │                         │  │                   │
> - │ │ +───────────────────+                         │  │                   │
> - │ │ │ PCIR Structure    │                         │  │                   │
> - │ │ +───────────────────+                         │  │                   │
> - │ │ │ NPDE Structure    │                         │  │                   │
> - │ │ └───────────────────┘                         │  │                   │
> - │ │ │ Image data        │                         │  │                   │
> - │ │ └───────────────────┘                         │  │                   │
> - │ └───────────────────────────────────────────────┘  │                   │
> - │              (no gap between images)               │                   │
> - │ ┌───────────────────────────────────────────────┐  │                   │
> - │ │ First FwSec Image (Type 0xE0)                 │  │                   │
> - │ ├───────────────────────────────────────────────┤  │                   │
> - │ │ ┌───────────────────┐                         │  │                   │
> - │ │ │ ROM Header        │                         │  │                   │
> - │ │ +───────────────────+                         │  │                   │
> - │ │ │ PCIR Structure    │                         │  │                   │
> - │ │ +───────────────────+                         │  │                   │
> - │ │ │ NPDE Structure    │                         │  │                   │
> - │ │ └───────────────────┘                         │  │                   │
> - │ │ │ Image data        │                         │  │                   │
> - │ │ └───────────────────┘                         │  │                   │
> - │ └───────────────────────────────────────────────┘  │                   │
> - │              (no gap between images)               │                   │
> - │ ┌───────────────────────────────────────────────┐  │                   │
> - │ │ Second FwSec Image (Type 0xE0)                │  │                   │
> - │ ├───────────────────────────────────────────────┤  │                   │
> - │ │ ┌───────────────────┐                         │  │                   │
> - │ │ │ ROM Header        │                         │  │                   │
> - │ │ +───────────────────+                         │  │                   │
> - │ │ │ PCIR Structure    │                         │  │                   │
> - │ │ +───────────────────+                         │  │                   │
> - │ │ │ NPDE Structure    │                         │  │                   │
> - │ │ └───────────────────┘                         │  │                   │
> - │ │                                               │  │                   │
> - │ │ ┌───────────────────┐                         │  │                   │
> - │ │ │ PMU Lookup Table  │ <- falcon_data_offset   │<─┘                   │
> - │ │ │ ┌─────────────┐   │    pmu_lookup_table     │                      │
> - │ │ │ │ Entry 0x85  │   │                         │                      │
> - │ │ │ │ FWSEC_PROD  │   │                         │                      │
> - │ │ │ └─────────────┘   │                         │                      │
> - │ │ └───────────────────┘                         │                      │
> - │ │         │                                     │                      │
> - │ │         │ points to                           │                      │
> - │ │         V                                     │                      │
> - │ │ ┌───────────────────┐                         │                      │
> - │ │ │ FalconUCodeDescV3 │ <- falcon_ucode_offset  │                      │
> - │ │ │ (FWSEC Firmware)  │    fwsec_header()       │                      │
> - │ │ └───────────────────┘                         │                      │
> - │ │         │   immediately followed  by...       │                      │
> - │ │         V                                     │                      │
> - │ │ ┌────────────────────────────┐                │                      │
> - │ │ │ Signatures + FWSEC Ucode   │                │                      │
> - │ │ │ fwsec_sigs(), fwsec_ucode()│                │                      │
> - │ │ └────────────────────────────┘                │                      │
> - │ └───────────────────────────────────────────────┘______________________│
> + ┌------------------------------------------------------------------------┐
> + | VBIOS (Starting at ROM_OFFSET: 0x300000)                               |
> + ├------------------------------------------------------------------------┤
> + | ┌-----------------------------------------------┐                      |
> + | | PciAt Image (Type 0x00)                       |                      |
> + | ├-----------------------------------------------┤                      |
> + | | ┌-------------------┐                         |                      |
> + | | | ROM Header        |                         |                      |
> + | | | (Signature 0xAA55)|                         |                      |
> + | | └-------------------┘                         |                      |
> + | |         | rom header's pci_data_struct_offset |                      |
> + | |         | points to the PCIR structure        |                      |
> + | |         V                                     |                      |
> + | | ┌-------------------┐                         |                      |
> + | | | PCIR Structure    |                         |                      |
> + | | | (Signature "PCIR")|                         |                      |
> + | | | last_image: 0x80  |                         |                      |
> + | | | image_len: size   |                         |                      |
> + | | | in 512-byte units |                         |                      |
> + | | └-------------------┘                         |                      |
> + | |         |                                     |                      |
> + | |         | NPDE immediately follows PCIR       |                      |
> + | |         V                                     |                      |
> + | | ┌-------------------┐                         |                      |
> + | | | NPDE Structure    |                         |                      |
> + | | | (Signature "NPDE")|                         |                      |
> + | | | last_image: 0x00  |                         |                      |
> + | | └-------------------┘                         |                      |
> + | |                                               |                      |
> + | | ┌-------------------┐                         |                      |
> + | | | BIT Header        | (Signature scanning     |                      |
> + | | | (Signature "BIT") |  provides the location  |                      |
> + | | └-------------------┘  of the BIT table)      |                      |
> + | |         | header is                           |                      |
> + | |         | followed by a table of tokens       |                      |
> + | |         V one of which is for falcon data.    |                      |
> + | | ┌-------------------┐                         |                      |
> + | | | BIT Tokens        |                         |                      |
> + | | | ┌-------------┐   |                         |                      |
> + | | | | Falcon Data |   |                         |                      |
> + | | | | Token (0x70)|---+------------>------------┼--+                   |
> + | | | └-------------┘   |  falcon_data_ptr()      |  |                   |
> + | | └-------------------┘                         |  V                   |
> + | └-----------------------------------------------┘  |                   |
> + |              (no gap between images)               |                   |
> + | ┌-----------------------------------------------┐  |                   |
> + | | EFI Image (Type 0x03)                         |  |                   |
> + | ├-----------------------------------------------┤  |                   |
> + | | Contains the UEFI GOP driver (Graphics Output)|  |                   |
> + | | ┌-------------------┐                         |  |                   |
> + | | | ROM Header        |                         |  |                   |
> + | | +-------------------+                         |  |                   |
> + | | | PCIR Structure    |                         |  |                   |
> + | | +-------------------+                         |  |                   |
> + | | | NPDE Structure    |                         |  |                   |
> + | | └-------------------┘                         |  |                   |
> + | | | Image data        |                         |  |                   |
> + | | └-------------------┘                         |  |                   |
> + | └-----------------------------------------------┘  |                   |
> + |              (no gap between images)               |                   |
> + | ┌-----------------------------------------------┐  |                   |
> + | | First FwSec Image (Type 0xE0)                 |  |                   |
> + | ├-----------------------------------------------┤  |                   |
> + | | ┌-------------------┐                         |  |                   |
> + | | | ROM Header        |                         |  |                   |
> + | | +-------------------+                         |  |                   |
> + | | | PCIR Structure    |                         |  |                   |
> + | | +-------------------+                         |  |                   |
> + | | | NPDE Structure    |                         |  |                   |
> + | | └-------------------┘                         |  |                   |
> + | | | Image data        |                         |  |                   |
> + | | └-------------------┘                         |  |                   |
> + | └-----------------------------------------------┘  |                   |
> + |              (no gap between images)               |                   |
> + | ┌-----------------------------------------------┐  |                   |
> + | | Second FwSec Image (Type 0xE0)                |  |                   |
> + | ├-----------------------------------------------┤  |                   |
> + | | ┌-------------------┐                         |  |                   |
> + | | | ROM Header        |                         |  |                   |
> + | | +-------------------+                         |  |                   |
> + | | | PCIR Structure    |                         |  |                   |
> + | | +-------------------+                         |  |                   |
> + | | | NPDE Structure    |                         |  |                   |
> + | | └-------------------┘                         |  |                   |
> + | |                                               |  |                   |
> + | | ┌-------------------┐                         |  |                   |
> + | | | PMU Lookup Table  | <- falcon_data_offset   |<-┘                   |
> + | | | ┌-------------┐   |    pmu_lookup_table     |                      |
> + | | | | Entry 0x85  |   |                         |                      |
> + | | | | FWSEC_PROD  |   |                         |                      |
> + | | | └-------------┘   |                         |                      |
> + | | └-------------------┘                         |                      |
> + | |         |                                     |                      |
> + | |         | points to                           |                      |
> + | |         V                                     |                      |
> + | | ┌-------------------┐                         |                      |
> + | | | FalconUCodeDescV3 | <- falcon_ucode_offset  |                      |
> + | | | (FWSEC Firmware)  |    fwsec_header()       |                      |
> + | | └-------------------┘                         |                      |
> + | |         |   immediately followed  by...       |                      |
> + | |         V                                     |                      |
> + | | ┌----------------------------┐                |                      |
> + | | | Signatures + FWSEC Ucode   |                |                      |
> + | | | fwsec_sigs(), fwsec_ucode()|                |                      |
> + | | └----------------------------┘                |                      |
> + | └-----------------------------------------------┘                      |
> + └------------------------------------------------------------------------┘
>   

Addendum: I'm using Roboto Mono on my htmldocs build (using custom style 
sheet). The diagram looks fine with default Alabaster font stack 
(Consolas). If you disagree you can ignore above diff.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
