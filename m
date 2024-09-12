Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0352C977413
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 00:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCFC10EC59;
	Thu, 12 Sep 2024 22:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KbiOymI5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9F010EC47
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 20:29:06 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-37747c1d928so152375f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726172945; x=1726777745; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K+Vvlq6kPIRv3v2sNDT50A07Twv9J2TV9GHlO+JqyOA=;
 b=KbiOymI5qOy/dr0Z0isLD1/rmu5ZprMK6tyQ6pUVZpjZDezlak+Rb2ZFgpxUYzB/h4
 1UK5oaHLSl5c3NrDfb/JQRDep+pUy7MgpvUE+eYKy09+tZXp+PDZtyqRU5eU/ClSFLqG
 mncixRu7MjHHsGu3Y9CNEOC2P8muhnf/hYZg5ewObMhih9Qjcjzb/NkDFwSa2+QuWYWr
 JnBDVpI2bbvIt3EAWMmHP8saJ45EZzfBpYbV7KO3UFBPxrfTabmZ6kO3nIEcJoRAGNP5
 /Oe5n+TM4ypmgaUB8af+hO0Oegjl3XzIwsLW4rP4BT/Kgi+a/nRZDQmFanM7Z5wkngMv
 Ljtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726172945; x=1726777745;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K+Vvlq6kPIRv3v2sNDT50A07Twv9J2TV9GHlO+JqyOA=;
 b=bld4jvuJDqHfS6lmsCF+elgqWIdFPzd8BvE7IdHJ7kjchIggr1ru4D0RdVqOFNd3uP
 AomYXZ8JRK0QQrpHR/dqEVHIKFIgJV9Np5gXEIxK820n5wyniLN14u/pZTiHltBc7obU
 AjBX+pvlplr8kqc0Zi/eaB6jU5v4CSzrKSms4mRR4D/zopKBKS/kziwXKPkc1jTUWNWz
 ejWAGMiD2nSb51lp1exTZtyziHequLql30WzhXaZn2YQcTa9ikjJtUsWsJhaH1sYWGx8
 q7MSLyGzHy//SOxmlWX6o+5UmimaU1ORVVXoPiqmBiIDKOLmO6bJVt1Rvu9sYkqC55Xj
 +K5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwbVk8Gci/OkvbfGTeFezsACxNmT0S+gF8C2EaIy6kzjOkiXqIwUlSv/82RnjwDf8J/IjzVfxlun4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCuAf4k6d3xxElxxyDaGbzaFBSR1Ou1+2q81sW8d9lFIxRmYgL
 9mSIcU9XQ7euDrthYNTqiUCXwDvxFfS3be1E7msadkoeQRRCPRZ+
X-Google-Smtp-Source: AGHT+IF6AGfDleGr42k1egNIDn9NzhhgPE6NVPwmZsDi9VTBrErzhGtAmkQv7+/UngllSM9A8ndaPg==
X-Received: by 2002:a05:6000:1445:b0:374:b9d7:5120 with SMTP id
 ffacd0b85a97d-378d61e2adcmr279407f8f.23.1726172944504; 
 Thu, 12 Sep 2024 13:29:04 -0700 (PDT)
Received: from [192.168.0.10] ([178.233.24.52])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675c11sm15086968f8f.55.2024.09.12.13.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 13:29:03 -0700 (PDT)
Message-ID: <6c9b7f85-f92d-44ed-ae9d-00f6d55ea614@gmail.com>
Date: Thu, 12 Sep 2024 23:29:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Support alpha blending in MTK display driver
To: linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>,
 CK Hu <ck.hu@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
References: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
 <CAAOTY_8ThuusfHk9Gd5pFP8VhJkG2seuJmkFiruK1rPQFZGBzg@mail.gmail.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Language: en-US, tr, en-GB
In-Reply-To: <CAAOTY_8ThuusfHk9Gd5pFP8VhJkG2seuJmkFiruK1rPQFZGBzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 12 Sep 2024 22:03:18 +0000
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

Hi,

On 2024-07-31 16:34 +03:00, Chun-Kuang Hu wrote:
> Hi, Shawn:
> 
> Hsiao Chien Sung via B4 Relay
> <devnull+shawn.sung.mediatek.com@kernel.org> 於 2024年7月17日 週三 下午1:24寫道：
>>
>> Support "Pre-multiplied" and "None" blend mode on MediaTek's chips by
>> adding correct blend mode property when the planes init.
>> Before this patch, only the "Coverage" mode (default) is supported.
> 
> For the whole series, applied to mediatek-drm-next [1], thanks.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

I am seeing broken colors on an MT8173 Chromebook with next-20240912,
which goes away if I git-revert this series (commits 1f66fe62cc09
eb17c5909481 a3f7f7ef4bfe 59e9d9de25f0 4225d5d5e779).

To illustrate, I took a picture [1] of some color mixing diagrams from
Wikipedia [2]. Do you have an idea of what goes wrong?

(I'm busy with too many things so I don't want to debug it now...)

[1] https://i.imgur.com/tNFvovB.jpeg
[2] https://en.wikipedia.org/wiki/Color_space#Generic
