Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEE8757A1E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 13:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDCE10E31C;
	Tue, 18 Jul 2023 11:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540D910E31C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 11:10:19 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-992acf67388so689763366b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 04:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689678617; x=1692270617;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aajYIP5snbVq3l5m7wqui3wz8vLZfCkS107XHrf17Nk=;
 b=FrBsmurDeFoxnrfcaRJj3S4siJ250IDShr9ktrso9kakqk/dqYGg/nGyrvPyLMTo7n
 Mzx80YMQeH/qKpx+G0hJY23/JB7zWvRcpGRd39AOeqU3AO0RBSqrc5qXUgkIiZkjZm0D
 49nguYZk9ZAhqavC0XEty0I0fSupPpCXydPmguajvH4FArOWHCed3mMdOnMtG4e0Rlmq
 6culvTmxnFlx6ofKV+VCvC7XyxhOfs0N0q46uehskc7JVyPmZ0EzFfAEAAOFmvJ8spto
 9N0OuAfhQa1/vfgKDoNivuxekRX23wNBwxHrNbo6+OjInvfvDguHZIlF7MdFXq5AmnxJ
 OclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689678617; x=1692270617;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aajYIP5snbVq3l5m7wqui3wz8vLZfCkS107XHrf17Nk=;
 b=Ma/1HmEDsMziwDbJPP+RG06kYGHuoxF5ZnOKW3796icz1WBJINBrGc8LJIfezociCo
 hLxSwg5NAGP89mwHHVNpA3PBD5Tnn8B9jI7vLefrfTdMKhN/t2zJf+YXLrXe4A4ccxiH
 BkHi8hcfnAQoioNrRjw1FApEvUUWhd53SfjcFXpKxsP5n0iqbmq6E4/GixCfjw7AEo+Z
 x3RLCitliUsG9YlMrRokuk1+pTyDDRoJ4Ls8Anh9frZKe6er2bNQ1r57IwPXhCm9e8So
 01VrX2Bz5BYLlY2fEmmbCnLuDkNQUY4pyCGjlPLsK6s6HGrKch2lJT8NqPqcSk8DvW2a
 mpNA==
X-Gm-Message-State: ABy/qLbXM3PaQhse6FtATd3b1G1fWk4wI+oqfdWw9WX1ZocEickp36x3
 IDLZhSo8tWuGFKl2brqVxTWtiA==
X-Google-Smtp-Source: APBJJlGWV/QSUi6HFAgilRdsMb0RiR24L2HSwKqQilgOC33dQBeMvzgNtwKldyAC2HnEcBh8bsHMqw==
X-Received: by 2002:a17:906:10d2:b0:991:37d2:c9ea with SMTP id
 v18-20020a17090610d200b0099137d2c9eamr12802294ejv.6.1689678617448; 
 Tue, 18 Jul 2023 04:10:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a1709063b8900b00992e51fecfbsm900717ejf.64.2023.07.18.04.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 04:10:16 -0700 (PDT)
Message-ID: <4131759e-9474-48f6-cc05-67b6d4b6559b@linaro.org>
Date: Tue, 18 Jul 2023 13:10:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Content-Language: en-US
To: Frank Binns <Frank.Binns@imgtec.com>, "conor@kernel.org"
 <conor@kernel.org>, Sarah Walker <Sarah.Walker@imgtec.com>
References: <20230714142526.111569-1-sarah.walker@imgtec.com>
 <20230715-paramount-straining-6a486f8af20d@spud>
 <a86f6359706485cf595889a07e513e2b9fd6d71b.camel@imgtec.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a86f6359706485cf595889a07e513e2b9fd6d71b.camel@imgtec.com>
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "hns@goldelico.com" <hns@goldelico.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>, "afd@ti.com" <afd@ti.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>,
 Donald Robson <Donald.Robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/07/2023 13:08, Frank Binns wrote:
>> And this
>> items:
>>   - const: gpu
>> can just be
>> const: gpu
>>
>> Although, if there is only one interrupt this is probably not
>> particularly helpful. Are there other implementations of this IP that
>> have more interrupts?
> 
> No, all our current GPUs just have a single interrupt. I assume it's more future
> proof to keep the name in case that ever changes? 

Why do you need name in the first place? If there is single entry, the
name is pointless, especially if it repeats the name of the IP block.

> As in, by having the name now
> we can make it a required property, which I guess we won't be able to do at some
> later point.

Why even making it required?

Best regards,
Krzysztof

