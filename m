Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F23A750938
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 15:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECA910E527;
	Wed, 12 Jul 2023 13:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C0510E527
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 13:07:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbc244d307so77441755e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 06:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689167268; x=1691759268; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lk0KxbPL7g9PHdbTrRV8GwvZTLdNn5RyLE237XDBwng=;
 b=Pl3dPP9WaagaZa5NZVF07AyuGVkuebSNjvMI/IJzHvl1F1sPHVcp/7u/J80rHfduqf
 UO5wNcVh1Wz2IdYKjZS/uJQwfzdzb97YnykXQEWEEGrVDdK67csEpl9l2inwECsJ1Q8m
 VJqq6NDxmvU5r2ivTTuMRKX6IzfYXVtB/UOLxTM9G4kiuOZg1DZbwSIcc8wGe2yvxi9C
 OtVeqs38kzjyf5rKg1E8KSwGCODuLs7PZLBFui7IOAk8mcdKvqdKw4fRGRE43L6L3sQw
 Wrl7k9WvADMh6sVGcJYBwDD9V8+0nERpFVyG45qBAIIPlXOuG468dazCuwDDEDKlMVrM
 gr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689167268; x=1691759268;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lk0KxbPL7g9PHdbTrRV8GwvZTLdNn5RyLE237XDBwng=;
 b=EMzY1K2BrxAb40ZBOPj4eJtTfYF/wC8bJeyqrOayda1bOlbZC/AcCvICH9BCcbIGdx
 ZqMdvUH0eaDMeayo3aW1bDY3eNHEj/qgiSYKj1S8nadZL96UaFCyRCJ9v0RNDUk9XuxI
 D0yRjaMAkFeB9gKUoxTxmkAGQTxTDf4s6ighLMnaSdSYci2ZuQ+mlOoUslbVzoe8QoNQ
 8GjIVGLNnzDN57g47diXiCZHTH4giWwpt0MQ7EVKWX6IOHclxaWVsU/XmlgTkYSwvU3D
 YK9P+UeCfskDT/ZuFeyPoz3gcjzVvBp4HOEmajlVcvipP5WodpKy6UO/tRVBgDAQmIsk
 tLeA==
X-Gm-Message-State: ABy/qLaG02ORePPiWiQhYt9kS0pi6r6LZT8e/JO86LIbuXfEoWrpb1Bj
 SwAqQk/ELhbS9haUpT9jtWXj+g==
X-Google-Smtp-Source: APBJJlHfRnv7y9rZI3NMWpRgDW07OG6yBWWWNoyjxIJUDcLnaIvBEGr8R4hrrI4kOutThs0bqhTanA==
X-Received: by 2002:a5d:45cc:0:b0:314:3358:d57f with SMTP id
 b12-20020a5d45cc000000b003143358d57fmr18305861wrs.56.1689167267884; 
 Wed, 12 Jul 2023 06:07:47 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a5d6506000000b003143b14848dsm5050267wru.102.2023.07.12.06.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 06:07:47 -0700 (PDT)
Message-ID: <aa92a6da-b406-59c3-8d2e-084bee6ba778@baylibre.com>
Date: Wed, 12 Jul 2023 15:07:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/4] drm/mediatek: Add casting before assign
Content-Language: en-US
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
References: <20230621102247.10116-1-jason-jh.lin@mediatek.com>
 <20230621102247.10116-4-jason-jh.lin@mediatek.com>
 <797c0144-4072-8728-304e-e64213185687@baylibre.com>
 <4d7f86a662429256e5a0a5a52b9e8c375b22c382.camel@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <4d7f86a662429256e5a0a5a52b9e8c375b22c382.camel@mediatek.com>
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
Cc: =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22/06/2023 10:02, Jason-JH Lin (林睿祥) wrote:
>> drm_plane_state *new_state,
>> >   dma_addr_t addr;
>> >   dma_addr_t hdr_addr = 0;
>> >   unsigned int hdr_pitch = 0;
>> > +int offset;
>> 
>> I agree with Angelo, please set offset as unsigned.
>> 
> I think offset should be unsigned, but since src.x1 and src.y1 are
> 'int'. That means 'unsigned int' offset will be very big when src.x1 or
> src.y1 is negative.
> So I just use 'int' for offset here.

Ok

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
