Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D809890BC
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 19:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567B410E113;
	Sat, 28 Sep 2024 17:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cZoZZ9A4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245ED10E113
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 17:18:57 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42cafda818aso29518375e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 10:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727543935; x=1728148735; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p8NuiYSt8wJAr0VVOHDlVqwMqiURWjiBsLWVHXGngnA=;
 b=cZoZZ9A4UGvGN1jOnwM3QS3WWoA6ntkPLDxi5rvRomxh3746tZ4dVxjw2GSdHBKXYu
 6AgoL1pPxnK6bNRoHQQlOX7x/64jxHa+caZE7go3mmlPWBIE7EZrbdSVoWFF2INlo4v7
 SIwXctgJjdKVVcQovoQhHoEtkMB3yR68gtnyhbVtngjGMxTW0io1NiqhPg7+bQkyRzCr
 M5NbwACGAUsDCIW1vjwTXwZMBkcOl2fxXiizfh2QLMpb5IGzevo1P/JApFKWCmYORe17
 dfgpOfx6ALhA2kxMH/LVXnk6hTwjqIKHHYzXkGsChvCD3xtiXUK7JCbRsHvrXQ0g/e+N
 7y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727543935; x=1728148735;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p8NuiYSt8wJAr0VVOHDlVqwMqiURWjiBsLWVHXGngnA=;
 b=AJWwgipyZfQ1G7UWnJfrDVqoDnLTrkO/KubsJIebtyEISmA3Zug8jbjmRJorMc9zSF
 mnHL61ODXPKmgUVPy1JSWPAzEovCOkug8dxZ+GPiNGCMteVbV+N+hugvQdHL3muwUa6T
 1o+vI/iOXF5tZegUwJ/JRjXqaxCrBAcuOpYb5K3/1C3Nu5tQqmjx1BFIjjJ24+JQeML3
 +AJziDYxw0ilGn7+NHzUj1T3Q5V54VEEDoyPk+HGR7F+ivSjOG+0Gt2vPI42X6wCfODS
 ux/7tk7XxJHM8E3zSc0fWFD0F5a/F31voii6p+1sFaCr+55csmmmfkaLkUT5ZmicDH+8
 es5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHgUPgv3MqOp38UUsm4l9hE+OVAQz0MzpMFEwdvDRkhpDKTa9/EGftxfyZBboqLOMFlzk3/vOh/3o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2aQpw3ljQ4ttTK0pvZsUZyEfOs9jQF03SYz79Co3dOaD6vp53
 HesLU27wdjB/J6kl4oARgTY2yWM4CaiQbyWl1bHEf4vHH6M6GZ7b
X-Google-Smtp-Source: AGHT+IFmmIHk7jMGC1Rr49hdZC3xWIHG0TdbmxVJ/tvIZRVpiLLGzZ/mp8cIHr9g4anhuMyAjTK08g==
X-Received: by 2002:a05:6000:d8f:b0:37c:ced2:843b with SMTP id
 ffacd0b85a97d-37cd5ab75fcmr5003739f8f.20.1727543935169; 
 Sat, 28 Sep 2024 10:18:55 -0700 (PDT)
Received: from [192.168.0.10] ([178.233.24.52])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd5730e92sm5262538f8f.80.2024.09.28.10.18.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Sep 2024 10:18:54 -0700 (PDT)
Message-ID: <5207019e-5059-4721-8ac6-4f4ea2753643@gmail.com>
Date: Sat, 28 Sep 2024 20:18:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] Fix degradation problem of alpha blending series
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
References: <20240928161546.9285-1-jason-jh.lin@mediatek.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Language: en-US, tr, en-GB
In-Reply-To: <20240928161546.9285-1-jason-jh.lin@mediatek.com>
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

On 2024-09-28 19:15 +03:00, Jason-JH.Lin wrote:
> From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
> 
> Some SoCs not support pre-multiplied pixel formats and extending
> configuration of OVL pre-multiplied color formats, such as MT8173.
> 
> Fix the SoC degradation problem by this sreies.
> 
> ---
> Change in v8:
> Remove blend_modes for not supported pre-multiplied SoCs to fix the
> return error from drm_plane_create_blend_mode_property().
> 
> [...]

I no longer see the warnings I mentioned in v7, and everything looks OK
on my MT8173, MT8183, MT8186 Chromebooks.

Tested-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
