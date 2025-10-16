Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0923BE6EE3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 09:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3C310E023;
	Fri, 17 Oct 2025 07:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rds6/S5S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C63D10EAA6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 21:46:31 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3ece0e4c5faso1120317f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 14:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760651189; x=1761255989; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qLVbGWoACrgE9VODWgB1TKnJBzMVwNUtM6cFxhgg3wc=;
 b=Rds6/S5SjgEEL3SyTBlCntcmdsi66P01NmBR0x1+MslmifFyqHrJgjtvehVZvxDt8B
 JU5jxsmxk7BmTT4Wl4H3HobXTe+jVDCB2WAcsjoqRSQGKHQxZ0HDi8893M3IlnfjjySz
 6cawn+3LUzVmyK49RYggJ1BxQ7MU5W+kR8ZUzivjRN8ARYV2UIIG/09dFlsNaq26EmMk
 rcxfIlhm3pjjpOBSiRB9DWnXP8CSX2hAKKj+PwS6CYM6aWWkfIr1xERfRxyCp4HSB45m
 F+x2xNN3zEIpocEESTqBCIDiZ0z4yqX+iRisQDF/A2FKm5IQKWU3YtNSiZHUbJD7y2iv
 tsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760651189; x=1761255989;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qLVbGWoACrgE9VODWgB1TKnJBzMVwNUtM6cFxhgg3wc=;
 b=J8E3N7plphz2BYMcH1/UCNgjg/XhjM6rQfbYiqt+floXpXpgJkugqorSELmsNzKCqP
 mK5SDDZBviyktsIoxlIyYuc7Iax8n33AGP8uGmsxxZFrtEV5V981bwLe735U2z5M/TrX
 STUeKcFS7QTOkAOtUFsj7Zxrx+0V+ujp+Y3tl1CXpMwYJ1/Q4G06masBqdXC9EycuOGx
 MFgsQnO/3IRkj9Mab4eTW7DmmZne5QwIzbFLs98hL/A2i5iGfjoPsGXF1oqelgZ/fkLo
 yiauzyW3DkzrGoBOvzKPBTT6CGsusr+btR84kfpoM+NO40sAG0UmWYKtsCKhheg/CBKL
 qolw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrOf+cWSxmmHvqb19JBy3HLzly91OOtTJadtbl9d8Ez8gdaCD8iXepM0OvsiG7p/jljovZgTeMaZM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+8iU8ZK7NIorkvbVPzGKORxfhybjxEOqoAHNJcN2gRwZ+jAgn
 vsqM7TEVcnVDhBluN3RhrDuPre4Ye8hn7h5XPnf2loGoZljdbeRw6B7w
X-Gm-Gg: ASbGncvfhhErhOtmmUTByuC4vyuQbZEzhwYnkZ4ZccBSEEXoU+XcwgD3x1whD3gpfAS
 kqaHBDf2VWyzMeJSP16PPoWl9DvKjV+c6bwKskzwSAL7QZCeW2u/y3olcmFjL2CB7myHk4tRQp8
 D1qc8DWd0p7C+DumU6e6jo0QY2CKwuthChXhsYgDTrbTY20T5J/OGOttwVLAdeoYgnSR5XKTevQ
 7nzi9WFsPgee8banASG6uixsEbGWn9SPGiSZKZR1TIKQmwWYcYkUrbEPk93Gz/WAX3C8froV76O
 8KVrjQRhp0L8lXMMLqBLbTV3j+PpgoDRuW0ddGw3uOUtGoiaDxffWgLkPuQiODx5QMYMPfW0I5E
 9czmDan4QtoPndZAffNzdwFoA5vCnnSEMCy+1MWsPRouV8PD12PMXWsGljErarosxFRAdYjShr3
 7sv9ME6uIpVKfBfeRQMCXY+6Dhup/CfWF7uFbQJFQEzcjlb6Cc7lkhZzYtOvtZPz3GObsi1B0yB
 zvn7F6hkYZX2I3B
X-Google-Smtp-Source: AGHT+IH/zjgPG/HV9ngqclxgSOqwAQJ1HFnhUiJ+6D/aP5dTWD4NXoIdy+KZQeUj/f6oIUnU/Azdag==
X-Received: by 2002:a05:6000:2911:b0:425:8bc2:9c43 with SMTP id
 ffacd0b85a97d-42704d7e987mr1012235f8f.1.1760651189397; 
 Thu, 16 Oct 2025 14:46:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:acc:bb60:756b:64e3:20ef:1d08?
 ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57d4bbsm37423275f8f.2.2025.10.16.14.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 14:46:29 -0700 (PDT)
Message-ID: <a7ccda73-2c40-419c-a7c3-3155739648d0@gmail.com>
Date: Thu, 16 Oct 2025 23:46:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nova-core: Solve mentions of `CoherentAllocation`
 improvements [COHA]
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
References: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
 <409f2f03-2bc2-4cb8-9ca7-4e30f82077ff@kernel.org>
Content-Language: en-US
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
In-Reply-To: <409f2f03-2bc2-4cb8-9ca7-4e30f82077ff@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 17 Oct 2025 07:28:31 +0000
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

Hi Danilo,

On 10/15/25 22:04, Danilo Krummrich wrote:
>> diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
>> index 94f44bcfd748..639a99cf72c4 100644
>> --- a/drivers/gpu/nova-core/dma.rs
>> +++ b/drivers/gpu/nova-core/dma.rs
>> @@ -25,21 +25,11 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Sel
>>      }
>>  
>>      pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
>> -        Self::new(dev, data.len()).map(|mut dma_obj| {
>> -            // TODO[COHA]: replace with `CoherentAllocation::write()` once available.
>> -            // SAFETY:
>> -            // - `dma_obj`'s size is at least `data.len()`.
>> -            // - We have just created this object and there is no other user at this stage.
>> -            unsafe {
>> -                core::ptr::copy_nonoverlapping(
>> -                    data.as_ptr(),
>> -                    dma_obj.dma.start_ptr_mut(),
>> -                    data.len(),
>> -                );
>> -            }
>> -
>> -            dma_obj
>> -        })
>> +        let mut dma_obj = Self::new(dev, data.len())?;
>> +        // SAFETY: We have just created this object and there is no other user at this stage.
> 
> The safety comment should rather confirm that it is guaranteed that the device
> won't access this memory concurrently.

I actually don't know how this is guaranteed. It wasn't explicitly
explained before here, although unless I'm mistaken it was already a
requirement. Could you help me? I guess it's related to the already
mentioned fact that we just allocated this DMA memory and the device
isn't yet initialized?

Thanks,
Daniel
