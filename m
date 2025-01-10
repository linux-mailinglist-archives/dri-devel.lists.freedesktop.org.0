Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E87A08CC1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 10:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1987710F049;
	Fri, 10 Jan 2025 09:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sASTESgr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC0710F043
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 09:49:00 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so19462995e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 01:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736502479; x=1737107279;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CBGdfJMdVhlPTQvAdZpJcqFAGRqMXm8T9/wD9E1IyTM=;
 b=sASTESgryjfn659L5EqzEftU1yFkx3Agq4Gc1aQx2Wkk6AdGM4SNCkVh/mcciIlKx2
 jPAXKfg0Dqcm1XRH4PXNaHahhIsT18RJg36Lkjt1Gwvzm+Mgi2vJ0eP30m4dV4LGNMua
 /l3MbmAOZuDq3hU1ALEwS7+ffuhf3Gu6vLljYSjx9bc6zDpKkNtB9EAEuw3gwUgumqzF
 MXuvIseVCk+a7tknm1eKY2sxAnWrmABf2ibGUU/JNXja4ZCDkdOemSiEkin2ax23EVMv
 7orYoh80zsNqPaIC5IaQYK/hd5JgeGkJSWz2Zis0sQbkNsj/U7zHr4MCvawp+D2vr35R
 2oug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736502479; x=1737107279;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CBGdfJMdVhlPTQvAdZpJcqFAGRqMXm8T9/wD9E1IyTM=;
 b=mbxRZC7SL0dLlOUq7vFyKZQ2tQ2isXSLTn6wKTDQOIdwnoE/GI/5mLWAEe9m6J8Bdm
 0V+l+I9zjwtKaX8mXH9w9v1US8iBZSjX9zNYaaz+xfLT1qCDr7rjTIQdmqzD5BIuH2Rq
 lyX0o9SRT2TLL1cPg7pqZLbcSHHVRopeICzAzoEeMV+lLXvw5ipR69uNLN6meNiuT3nr
 ktpA1KqLQEPYNaOa3GVr+PmR9NNAMJ58LsL9Z6wYIm0nY+ya+Kk0oHH+wNwV2DPdoWRv
 A7DAr0iWTD+MS3PqoaVjDwwTy3p6iBsAYOAEGOZNXxrWoG/RdVLsUMpy5A+qZ9hQASnI
 eFUg==
X-Gm-Message-State: AOJu0YyJWQNNo2w1wXsM4TNJ0fxmPEBhTj6/orzAEvX9nedlIz9wit/u
 XNNXUlC+YAWn5BSuyAuALX73A2iUuKcpSfBTZ2kzYCJH/dgL3DvbmieIawLWYOA=
X-Gm-Gg: ASbGncuE1+pi9ZuDZPFM/qWgiqEFEJYqf4eDgNg7DQnvsAch40An9xV5bmkO9tTedB6
 g1bZ1EPr6SRQP3H8hiOHjx7dmMSlAEAoCfCQ3rSrz2/fe5cXe/SS2Jlxb8KAzx77fvQJnNy815i
 YF+G0KU1J7WuvJIPuLzLVzdtrHzD5L2JviAs2pvLGP5vT1nYip18/4li28/6ZZqq6GKRqzCF8M1
 koco9xNhF6bdVgayRT7FUDb68aF2KU7TLCRUyBWSdG7i/HCO8dHtIAPbyjOgXdYHt1/r9X3A0lW
 j79JW5SVqDl5KUrz68Bz8hzXz5JB
X-Google-Smtp-Source: AGHT+IFHyFvrD9JGtDK23deWD3TLVFj1J1IlYF6J7R6HXxf4RUW/XkwkfNSEE1u37u3mcJyOGBdgDQ==
X-Received: by 2002:a05:600c:1da8:b0:436:6460:e67a with SMTP id
 5b1f17b1804b1-436e889dff0mr54195005e9.25.1736502479074; 
 Fri, 10 Jan 2025 01:47:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:2555:edac:4d05:947d?
 ([2a01:e0a:5ee:79d0:2555:edac:4d05:947d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e92a50sm80261485e9.36.2025.01.10.01.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 01:47:58 -0800 (PST)
Message-ID: <f2cbaae9-d0b0-48e7-a869-81ca9666fca1@baylibre.com>
Date: Fri, 10 Jan 2025 10:47:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] arm64: defconfig: enable display support for
 mt8365-evk
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
 <20231023-display-support-v6-4-c6af4f34f4d8@baylibre.com>
 <f5859a83-975b-46a3-a33d-ab203efd9e21@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <f5859a83-975b-46a3-a33d-ab203efd9e21@kernel.org>
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



On 10/01/2025 08:38, Krzysztof Kozlowski wrote:
> On 09/01/2025 11:37, Alexandre Mergnat wrote:
>> Enable the DRM HDMI connector support.
>> Enable the MIPI-DSI display Startek KD070FHFID015 panel.
> 
> Why? It was in previous commit, now its missing.

What is missing ? Don't you asked me to squash the defconfig commit ?

> 
> Best regards,
> Krzysztof

-- 
Regards,
Alexandre
