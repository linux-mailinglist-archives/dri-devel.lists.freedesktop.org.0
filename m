Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E97D99FFEF
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 06:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C211F10E117;
	Wed, 16 Oct 2024 04:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yr8b/Lwz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADA310E117
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 04:04:37 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-71e6d988ecfso1937107b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 21:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729051477; x=1729656277; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=59NZbVQOS9Li652Zznp470jAKXQhZQZy0L3fXqoVtrk=;
 b=Yr8b/LwzwpiJ2tIgGDqN+cg8SMb4Oncshc4FAXa0dnLmir/yFILLManDsFInThXjVI
 N8r/+1s/vdQ4Klt5xKpuBKvbeOBf4u2qZaNMlIPgkBR3eOBOuJSzAR2K4tEPlFlAtMPU
 zu9rh1d1S/FZv5erJ223ZmdIMOZ75+pO7znxYsYloykr2SNF4d4ZLERT/OPnzVfwSQ4I
 TrGNhFilVry76ULy5/UHvVAtXEHpXGeN/gTixWNS3Y2kFCcE5bfXygyerKJWWqMcsmET
 /V0Ays9Q85XST8rBnWfs/HYKUAdptNcVCNnOCTJ9BgzATscObxLOhW3AHXB0cj9s0018
 2a3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729051477; x=1729656277;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=59NZbVQOS9Li652Zznp470jAKXQhZQZy0L3fXqoVtrk=;
 b=ftv8ZPjercOmcMCsaExNAD/vmVAGlJCpmm+I0GRyNtR+Fh+T3q7PKpdWcUySW/LAvS
 Of5LsWUSUjeUny9+e1SuLvoQGS/C/DAZpZxEKsNBALieowJmn38NX4OB3bvnAtuI/beS
 WkWnezO7skJpOYry/BeHywavdtHLvs5ncT87DPsgtMaqoBonTxf9vhbbiukYsPTmYaR4
 hGRBdqmQKMEVPRYEzjaQqxs5jEGrwcj/tjWNK4L3BpoBNXQ6OZQV/EfmMCrVBY7wR7cQ
 kgxbN/hVkou3NPFogGIXIE9c/ZnkO1sa16cwkr8MoGYExSJitDVeu4pQmzG2VA1UYVeT
 VoAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsURYXeeG+rlunWNwnBEV1vCz2tQ56v6zGqVq6mWg6reTVkq+wU0iv9G1Nl5jE0zhPjC6fPaWMxEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmbmZ0pfwxQobo30SLvfo3PcE2gxjekI7HaIk5I0hJ6o4rhU6t
 NOg3W3NINqDKZq4jU2Pc1MRLsItjm+3RQdqvgr1r8PIR06MAXrkE
X-Google-Smtp-Source: AGHT+IHPbt6ayP2jbww1xbmug0+xqouQX5CoAQQxJZQYaF5exueNlXpzBtj0KFTo0KFcMMRMoyLHiQ==
X-Received: by 2002:a05:6a21:4581:b0:1d8:f4d9:790f with SMTP id
 adf61e73a8af0-1d8f4d97fa1mr6194095637.22.1729051476605; 
 Tue, 15 Oct 2024 21:04:36 -0700 (PDT)
Received: from ?IPV6:2409:40c0:11a6:bd6f:94e5:e911:e544:8911?
 ([2409:40c0:11a6:bd6f:94e5:e911:e544:8911])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e77370dfdsm2144367b3a.42.2024.10.15.21.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Oct 2024 21:04:36 -0700 (PDT)
Message-ID: <694e02fd-34b7-427c-9693-322afbafeb09@gmail.com>
Date: Wed, 16 Oct 2024 09:34:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: fix inconsistent indentation warning
To: Helge Deller <deller@gmx.de>, adaplas@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241006071514.5577-1-surajsonawane0215@gmail.com>
 <fab752c8-0193-4d97-bbe5-40c426ede668@gmx.de>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <fab752c8-0193-4d97-bbe5-40c426ede668@gmx.de>
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

On 15/10/24 02:02, Helge Deller wrote:
> On 10/6/24 09:15, SurajSonawane2415 wrote:
>> Fix the indentation to ensure consistent code style and improve
>> readability, and to fix this warning:
>> drivers/video/fbdev/nvidia/nv_hw.c:1512 NVLoadStateExt() warn:
>> inconsistent indenting
>>
>> Signed-off-by: SurajSonawane2415 <surajsonawane0215@gmail.com>
>> ---
>>   drivers/video/fbdev/nvidia/nv_hw.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> applied.
> 
> Thanks!
> Helge
Thank you for applying the patch!

Best regards,
Suraj Sonawane
