Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADD98281A6
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4124610E3B1;
	Tue,  9 Jan 2024 08:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45B810E398;
 Tue,  9 Jan 2024 08:34:21 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e4f7119eeso3099775e9.1; 
 Tue, 09 Jan 2024 00:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704789260; x=1705394060; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3YGwl375Lp2NNLBp7zhtQjo0BnEm9qfsqG+R+PAs65Y=;
 b=RvWcYOjpYcIn4p4hOrFzldi0IP/cqKBl8ArhATl2SXagWP19GJ3bD88XvUVrOUTHN0
 686rEpAeyjuxD34S9+eXU6hxwxHmi5GofwK7mDOQ6iXt/hit7BlpyTtR7OIN20Avowv3
 n+EKx/qLShecgc3XOOTg+lKbaqzxFGys6ERBtQ81KqDXu1rSK/r8Wol/fWhfLIzi4eIb
 R/vfO2cf9axkH40cDT4AN1FsfjA6AzJ/EqJvfZPhr1O3fEjpMabBs4mT2RHAoL0M26g1
 JBa3m1tKItMfAGXELy+9xznJhKO9ZG18ygmTx4/HStgH86yxgW7gfJf1CBQ/kY4eWzEy
 pKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704789260; x=1705394060;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3YGwl375Lp2NNLBp7zhtQjo0BnEm9qfsqG+R+PAs65Y=;
 b=nj4UNSLcIMbMcWc/5PL4Elo6oF29qOWZA5cxzOOSuAHumntHcqm9ywI6ydYr/pNw0c
 z2yleUp6uYaZr9LGBZa+xl0ebT22wFDstd+8Vk4r2lZfV69ha8uubEAuRlnMcwMSVgjH
 4yLmjgfMqyJQR3FR+Ciw6RFS2ahMNMlp2Ls46cEgtGvenNoXxhhw6+7Gz+Qnx1gPkNhx
 QczzjJzP9/TA9JCHa5aB9ZbEZDHkBNBaRzR/H0UGteK8MUXw8IJOfsRhroi2f/Dd7kTT
 usgLy5f83lmoky30BcQWeRIlNCUD7ISreootAWgc1YN3khtuyZoXWz7HdxsbRlC9WAmL
 74NQ==
X-Gm-Message-State: AOJu0YyxSsu71NcjxWzUUWmV036F/SsgkpQFREsnSdjzYpjeTsDntyL8
 dgR4NeVhU6vmDSzRhnJJFXaMx2D7ld4=
X-Google-Smtp-Source: AGHT+IH9uU5FYn/hx5pejffF/o/AB6v9PgXWJhqOoc4vJ1uvrzcd7P6Lfh9aQNlgULSSSxGJLIPHtQ==
X-Received: by 2002:a05:600c:4587:b0:40e:50ac:d24e with SMTP id
 r7-20020a05600c458700b0040e50acd24emr213842wmo.13.1704789259806; 
 Tue, 09 Jan 2024 00:34:19 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 hn25-20020a05600ca39900b0040d91fa270fsm2559527wmb.36.2024.01.09.00.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 00:34:19 -0800 (PST)
Message-ID: <6eff58f4-7956-47cf-9a66-92456d5577d3@gmail.com>
Date: Tue, 9 Jan 2024 09:34:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Rework TTMs busy handling
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 zack.rusin@broadcom.com, lyude@redhat.com, kherbst@redhat.com,
 jani.nikula@linux.intel.com, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240109074729.3646-1-christian.koenig@amd.com>
 <70484d976d3af4286652a6b26ed8783a9362f403.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <70484d976d3af4286652a6b26ed8783a9362f403.camel@linux.intel.com>
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

Am 09.01.24 um 09:14 schrieb Thomas Hellström:
> Hi, Christian
>
> On Tue, 2024-01-09 at 08:47 +0100, Christian König wrote:
>> Hi guys,
>>
>> I'm trying to make this functionality a bit more useful for years now
>> since we multiple reports that behavior of drivers can be suboptimal
>> when multiple placements be given.
>>
>> So basically instead of hacking around the TTM behavior in the driver
>> once more I've gone ahead and changed the idle/busy placement list
>> into idle/busy placement flags. This not only saves a bunch of code,
>> but also allows setting some placements as fallback which are used if
>> allocating from the preferred ones didn't worked.
>>
>> Zack pointed out that some removed VMWGFX code was brought back
>> because
>> of rebasing, fixed in this version.
>>
>> Intel CI seems to be happy with those patches, so any more comments?
> Looks like Xe changes are missing? (xe is now in drm-tip).
>
> I also have some doubts about the naming "idle" vs "busy", since an
> elaborate eviction mechanism would probably at some point want to check
> for gpu idle vs gpu busy, and this might create some confusion moving
> forward for people confusing busy as in memory overcommit with busy as
> in gpu activity.
>
> I can't immediately think of something better, though.

Yeah, I was wondering about that as well. Especially since I wanted to 
add some more flags in the future when for example a bandwidth quota how 
much memory can be moved in/out is exceeded.

Something like phase1, phase2, phase3 etc..., but that's also not very 
descriptive either.

Going to take a look at XE as well, thanks for the notice.

Regards,
Christian.

>
> /Thomas
>
>
>> Regards,
>> Christian.
>>
>>

