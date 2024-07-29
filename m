Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BDC93FBE4
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 18:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A5410E448;
	Mon, 29 Jul 2024 16:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JzOV+JXG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C1610E3C2;
 Mon, 29 Jul 2024 12:55:47 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a7ab76558a9so663016266b.1; 
 Mon, 29 Jul 2024 05:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722257746; x=1722862546; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qR/vBojdZFsa2xaAseqMvWWZxAcLC6Y8RjNWdERSqmU=;
 b=JzOV+JXGFUwpyKK4eZ9mgL127tIsGfpy14V2/8aWJga39X6pTxZiYTVwXUselIfub1
 p+P/GERJtXP6FLlaCLGxHTa0uIikH+X7Fq60gJRvduVPPf5cHzPPn9Ee32DVQPnhDI7+
 PqSBovllqpivvLcbM7gJ4lOiND6P9v7gF1zVqvJwqeHZfcqZnwk+mZqQgIhT3T0sn9JK
 teP80Khe3u1tg8EvLVB8iamVm3hH7RilFQL7WQxEnxofvzGFViZLISvlT60MyEEFR92c
 Ye27dhxPQ25EL9Vrxs/Qrtnmk9nDbK+XEZozHsP3bUaz2PFqBa3ctA8C+KeMvgkrq/ka
 KZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722257746; x=1722862546;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qR/vBojdZFsa2xaAseqMvWWZxAcLC6Y8RjNWdERSqmU=;
 b=dkJS+r6hHZGlb1x6fCwcntuSRFl2oSwh2z0QcL9ofHQr0Zhg9yPvd0Fy1UeX2GNkUT
 gJK6Uzjfd/m0BibWCNOFF+teKew7EORt3n8zGzPzg0QBo+9dKH4Dt7+8AotRAM6CmxVC
 atQabj/YQ/H6Qt56//rGsd6vsFFvSBSB1rRvEkqpnZh4xgsy5yMKZ0y9qx+OGXJR+HeL
 KVfUw/OWUMAr0pukRTbhL6YbceWOsxIMxRSqc0aqTTaI9zrtCxi8CuFwe5FYrxebRA7m
 s3t8I+7okqTf78rtCXKr8n7VaT+7jtmTs9f+eogGC7hnx308FxaD6kAC8TosyeRar7Au
 48EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSJIkxtjvs0IzFCJtq7ryExHI7Ra6OXlmBoGk9KUTMIfKBRf5unkclNEmlLWpmcdFVsZLLVLlIA2N56hg2qMLSHrs85UxGx5DSFDTB/VSmK+SatSGuVJ+Q0MsJjrF3RBnPqpypEQwlNtcBl7fBfMpH
X-Gm-Message-State: AOJu0YxI9xtRDsfa7+wb6bqRmt5Gn89v20YREW2LQdOfJZIAMxdQRne/
 5fjL4b8GB3Gb+cSjBKXuI8NmCKf/eics72cc6Q1shOz0w0pYt9sn
X-Google-Smtp-Source: AGHT+IFYLxLa5C1lxPvmKsruDwbb3MC0Hd7b22TT+Vxz0bhSckaKQDDQduUgdElX8FsESFUOAIKHkg==
X-Received: by 2002:a17:907:60cf:b0:a73:9037:fdf5 with SMTP id
 a640c23a62f3a-a7d3f81dccdmr851992166b.6.1722257745634; 
 Mon, 29 Jul 2024 05:55:45 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad4117asm506350166b.133.2024.07.29.05.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 05:55:45 -0700 (PDT)
Message-ID: <a1ff72a2-7992-4ebd-b48b-2bb85335edaf@gmail.com>
Date: Mon, 29 Jul 2024 14:55:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: update email for Konrad Dybcio
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-pm@vger.kernel.org
References: <20240729125225.2090-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20240729125225.2090-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 29 Jul 2024 16:55:27 +0000
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



On 29.07.2024 2:51 PM, Wolfram Sang wrote:
> The old email address bounced. I found the newer one in MAINTAINERS,
> so update entries accordingly.
> 
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Already sent a series of fixups, but thanks for keeping track

https://lore.kernel.org/linux-arm-msm/39a2303c-c89c-4fa3-a2e3-87589d242f4e@kernel.org/T/#me914f204e70ab34dd8bc3e6cbb51747490a81817
