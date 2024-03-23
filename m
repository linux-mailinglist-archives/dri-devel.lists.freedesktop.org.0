Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE048877EC
	for <lists+dri-devel@lfdr.de>; Sat, 23 Mar 2024 11:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D86D10F0CD;
	Sat, 23 Mar 2024 10:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j2i31pTc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3889910F0CD
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 10:20:52 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so6643869a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711189250; x=1711794050; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=mv+dntp0+Yd5x4FtxAoMVnrAVTs/kYox5gzBd17b5Sk=;
 b=j2i31pTcH+SVLXtjcSVWMmB62aJPsbDiIoHoVoERxK1ixXYeKnC24Lxd/05cC7/Gct
 VRCfGqmtWKJU37Mo18p4haJAYxDM7Yw/JEg0VNRF585f5jhGlZUCecYKFVWwMYY2+SU5
 JlFce2w7A3gUkOe/E+hv/WrtwIUpDovIzvqqa+C92MhJj+GHddHZlIH7GeLtN7JURiJe
 EnRoQcT1QrCy8jevbd87Kmb7aowP7QrqLQ36Rva5e2cQzkNNHsEYbadYvAyZDusPiU1U
 1KfvvQc4keaNM5NAuAGFdFJ2Ldziw5FPouds6cs//lEYHgiopoED2bbHB8y8ViaVsLEM
 FMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711189250; x=1711794050;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mv+dntp0+Yd5x4FtxAoMVnrAVTs/kYox5gzBd17b5Sk=;
 b=ewkTrs90Zum+zF9VNMY1CXzdbfGlPTLdYcPrUeGRltz9bT13XiZiFziZT4l/nihuoF
 KSZLd3acsuFXDE0y4MwqIuA5d6eJ41jOGQtRCfBOBoaPpeXPCqpF8/LS+PQ8otkRe4S3
 rOqQeeku6FoS1fnhjWUgk+pJmwG1uUg7D360ZzlLPDwpt7yyDgwm3q7x22xQa2iYCNQc
 DMbU3DTUCULuTCfPut0JJc0iyC2usPBmzBpAwf2yNiLtl27Cp3vxIRbPztj7z1aMGZGu
 ypX4rQTVkbTr0HLRNe6CBYMQKOUiOU3sr8wpE0wk5NUpiS5l8qJkDxhWRBKMVgCafOyU
 tO2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVszPpU/nljdEuRQKtoq/cUaTTF9WoSYqAHCRjR4OqHFSNgCEPOG92IZifAL3CSsPsv4JEt8uON9s2552jXnWyWImqaYctTXEiW/jgEKkoh
X-Gm-Message-State: AOJu0YzT2xb25r8eZQ2/rBVjFUsseqByOg/P4xh8VAQBmqaRj2Qx1zhl
 Cjsc7ZsFrmjyMA62jFyPg2SIFZKVS2L7S4gbYoGDkQ1cflXlGTJ4q4v0rmk4IgI=
X-Google-Smtp-Source: AGHT+IF+QkBaa9f+5oBcdmnEhymDovwjZkQnW5un8gceEcxp2mRV4SYnZHHM4XYweYwBFQkG93ai3A==
X-Received: by 2002:a17:906:8cc:b0:a47:3f10:b3c8 with SMTP id
 o12-20020a17090608cc00b00a473f10b3c8mr1216214eje.26.1711189250183; 
 Sat, 23 Mar 2024 03:20:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a1709061d4100b00a46b4c09670sm755351ejh.131.2024.03.23.03.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Mar 2024 03:20:49 -0700 (PDT)
Message-ID: <c0d70ba9-34ef-4121-834d-4d107f03d7f0@linaro.org>
Date: Sat, 23 Mar 2024 11:20:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] dt-bindings: xlnx: Add VTC and TPG bindings
To: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Simek, Michal" <michal.simek@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
 <20240321-dp-live-fmt-v3-8-d5090d796b7e@amd.com>
 <a82d525c-737a-4ac4-9d71-e88f4ba69ea1@linaro.org>
 <MW4PR12MB7165889CE7F27A3F0B29DC7EE6312@MW4PR12MB7165.namprd12.prod.outlook.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <MW4PR12MB7165889CE7F27A3F0B29DC7EE6312@MW4PR12MB7165.namprd12.prod.outlook.com>
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

On 22/03/2024 20:12, Klymenko, Anatoliy wrote:
> Hi Krzysztof,
> 
> Thanks a lot for the review.
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Thursday, March 21, 2024 10:59 PM
>> To: Klymenko, Anatoliy <Anatoliy.Klymenko@amd.com>; Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
>> Thomas Zimmermann <tzimmermann@suse.de>; David Airlie
>> <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Simek, Michal
>> <michal.simek@amd.com>; Andrzej Hajda <andrzej.hajda@intel.com>; Neil
>> Armstrong <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>; Jonas
>> Karlman <jonas@kwiboo.se>; Jernej Skrabec <jernej.skrabec@gmail.com>; Rob
>> Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
>> Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>; dri-
>> devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> media@vger.kernel.org
>> Subject: Re: [PATCH v3 8/9] dt-bindings: xlnx: Add VTC and TPG bindings
>>
>> Caution: This message originated from an External Source. Use proper caution
>> when opening attachments, clicking links, or responding.
>>
>>
>> On 21/03/2024 21:43, Anatoliy Klymenko wrote:
>>> diff --git a/include/dt-bindings/media/media-bus-format.h b/include/dt-
>> bindings/media/media-bus-format.h
>>> new file mode 100644
>>> index 000000000000..60fc6e11dabc
>>> --- /dev/null
>>> +++ b/include/dt-bindings/media/media-bus-format.h
>>> @@ -0,0 +1,177 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>>> +/*
>>> + * Media Bus API header
>>> + *
>>> + * Copyright (C) 2009, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License version 2 as
>>> + * published by the Free Software Foundation.
>>
>> That's not true. Your SPDX tells something entirely different.
>>
> 
> Thank you - I'll see how to fix it.
> 
>> Anyway, you did not explain why you need to copy anything anywhere.
>>
>> Specifically, random hex values *are not bindings*.
>>
> 
> The same media bus format values are being used by the reference driver in patch #9. And, as far as I know, we cannot use headers from Linux API headers directly (at least I 

I don't understand what does it mean. You can use in your driver
whatever headers you wish, I don't care about them.


noticed the same pattern in ../dt-bindings/sdtv-standarts.h for
instance). What would be the best approach to reusing the same defines
on DT and driver sides from your point of view? Symlink maybe?
> 

Wrap your messages to match mailing list discussion style. There are no
defines used in DT. If there are, show me them in *THIS* or other
*upstreamed* (being upstreamed) patchset.

Whatever you have out of tree or "DO NOT MERGE" does not matter and does
not justify anything.


Best regards,
Krzysztof

