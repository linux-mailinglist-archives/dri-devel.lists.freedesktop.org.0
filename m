Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020FB97A5F2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 18:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F56D10E3B7;
	Mon, 16 Sep 2024 16:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WyYm2Qg4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992D210E3B7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 16:26:01 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42cb5b3c57eso46417755e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 09:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726503960; x=1727108760; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O/DYkCdH/gmU3Os/Pwqx0cgxO12Vdt0xg3X05ImTUp8=;
 b=WyYm2Qg4hZr9oMSpxOA/9LqSwmOtcCoPeQ9tPJpbPy3ZeikkRppTo3MQ1TjzhL29pP
 6Gmu+6rt6/oJH+6ZGG1Upj06je4iDhqpaK+i4JCYA34m/c0E+TKhcD+IQfXsUgJlFNGb
 eo3NNxJihzsA3kLsMeiyMeVhfvc8fL5VUxx3wjWTTWxzFy2KqIb/X/1RG5oTfxhd3Qsx
 kJ+2PY30gZ2+gWOErpBusXIehqKx+ducCW6epFVGEjWRAZ5dUFQo7z1sVwW4dyvOOp51
 EC0mcFg+WzOw+JBxzxWLO9HE0zUT/wIwf178xkW2DSaicIJZX/Y05Q3QHAyyMXCc91nr
 AJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726503960; x=1727108760;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O/DYkCdH/gmU3Os/Pwqx0cgxO12Vdt0xg3X05ImTUp8=;
 b=DHuWY1UW3DT+iDRNxnpMUYGSPfFWsymZvmHQr7ntvBEfHUxXEkQi8wQl+4zkrLgqPA
 NbobEuMuMhyPXT4ZrIYQvXolNugGpaGwel/FfeYsnALeFDQ/shWffU0sVASvs/D08J09
 4b8Y0J7WlBbM5BhT5KzniLRCalYiWeljDjFrAJ0TFC4ishKubgH0A+n4dN8DLBEQwQuV
 Q3shYKB8Guu5MFUJdlpOJESwRJtoIzWZw/pd7Zh2T960WngobphBj3eBEJuc8tSQ3N+A
 YQIyzyGStGie1CcVxxGOi4MhM3rkltiklJLTX+243RBWxU3oGl3+miUJO6jSnLVYx1tG
 llxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLjQeWnbImUSWfOkfVx1bS0r3MCxWJF2/WDa9GokvBVrhHnbeIKEdfS8f/yL7gt96E6yHVIF1PJJM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHN4fOTDpac5K5MnVkL1PoqYZLEsDIJeUBoZ4n7qOLQL8wdTBY
 IQPODZQMLkBrIvZoE6Crpk5KeXGJkGwPEkRioUlOurZp8WQwJEufXjeWF/oF
X-Google-Smtp-Source: AGHT+IHdtK4eYtnmHmLxW/z0qkevWcipo3F4LfK611EvaMbZJea3I5V4XWBz27XMAZ+Qt+QiI0wJcg==
X-Received: by 2002:a5d:4811:0:b0:374:c6ad:a7c6 with SMTP id
 ffacd0b85a97d-378c2d065c0mr7874708f8f.20.1726503959418; 
 Mon, 16 Sep 2024 09:25:59 -0700 (PDT)
Received: from [192.168.0.10] ([178.233.24.52])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e780defdsm7485344f8f.115.2024.09.16.09.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 09:25:58 -0700 (PDT)
Message-ID: <63ca91a9-f2f4-483e-b7bf-11febcd49f1d@gmail.com>
Date: Mon, 16 Sep 2024 19:25:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/mediatek: ovl: Add fmt_support_man for MT8192 and
 MT8195
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240915161245.30296-1-jason-jh.lin@mediatek.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Language: en-US, tr, en-GB
In-Reply-To: <20240915161245.30296-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 2024-09-15 19:12 +03:00, Jason-JH.Lin wrote:
> OVL_CON_CLRFMT_MAN is an configuration for extending color format
> settings of DISP_REG_OVL_CON(n).
> It will change some of the original color format settings.
> 
> Take the settings of (3 << 12) for example.
> - If OVL_CON_CLRFMT_MAN = 0 means OVL_CON_CLRFMT_RGBA8888.
> - If OVL_CON_CLRFMT_MAN = 1 means OVL_CON_CLRFMT_PARGB8888.
> 
> Since OVL_CON_CLRFMT_MAN is not supported on previous SoCs,
> It breaks the OVL color format setting of MT8173.
> So add fmt_support_man to the driver data of MT8192 and MT8195
> to solve the downgrade problem.
> 
> Fixes: a3f7f7ef4bfe ("drm/mediatek: Support "Pre-multiplied" blending in OVL")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 43 ++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 8 deletions(-)

Tested-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>

Thanks!
