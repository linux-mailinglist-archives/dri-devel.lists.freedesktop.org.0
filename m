Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA9F4BEB97
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 21:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD6310E220;
	Mon, 21 Feb 2022 20:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D22410E220
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 20:10:40 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id v22so14370852ljh.7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 12:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HGhrkRGOxLTFPp0IvWu9pw9Pr8JdXDbThJB0IGV8xLU=;
 b=q05VbA/LdGRm9JI5iCC7R/6MHFp+p8hZ7hUIYwm0rPqadyc6l2odkS+knjxOCpTps0
 0sn6JFA9ssyLAbfwEVZ7ciYQOPIbSQ5yOe2TxD9CT6N5+syqrdhqYpD45OLJlzm2Aphn
 JWMIYoq2bZI7jWflq8ftt8dKRu1/j97aYVkHlpXv9D4YNke2C7SeuCm/eunLAQ7tRsFX
 sdu2IEu6ZBpIU7OOJF8SAqn4ekdM35Sj9w3AsMIJ1E8b90sR9SghHLRPb23kBgivNu5P
 ePh2N/IYToJOAe6+2X5tRaUkLZuxsHNHOHXQq/T8/dXPZRg2PsASzqtkod4GY6XwfNYk
 i1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HGhrkRGOxLTFPp0IvWu9pw9Pr8JdXDbThJB0IGV8xLU=;
 b=rMnbt9nNcjf+T8OwLZGde/IC4DQVqSe2TBxyIXhFM67VXO+NpsQwVt98bFIt1ZtB7/
 3oxm7gDAZJfOtzp03UMRJVtea6g3SHjOFk2UnTjTU7MyrdfwMotOf+Bq8ytXH0AjoZnJ
 5UIDOIOC7VDu0Ka/fUjznkps9eZ4H4eiXspvCQ6j+IktOHE29eNWpa7yHODcZ3mllwq5
 ocjVr8tG2F/NQWmDoShpcy4Kl2f8L7AGgGdSY1fHPyQI0ZM18+CuR3D76R3PsjHsjLRW
 fyfHWeRezWy4yibKX+FRVFPtJidVnOcFiR79pC+xWDXjIoYfx2DuwQrxrnZcdV9BD8zE
 Y1XQ==
X-Gm-Message-State: AOAM530Wv5YbW0z69DEeQRx3XDF5g5pfc4fZ6yuMJ+4aGHQA09TgLs40
 Ss3VIBylDI/SSrnFPplnMqQ=
X-Google-Smtp-Source: ABdhPJyavA3z3RaF8eqkB6PeyyaK9TqvSWUKI3hfCkhd0iA6vw0WQYVeElevA+YsmAf57wtOSnmtSg==
X-Received: by 2002:a2e:a4d6:0:b0:246:e66:90ed with SMTP id
 p22-20020a2ea4d6000000b002460e6690edmr15896034ljm.389.1645474238315; 
 Mon, 21 Feb 2022 12:10:38 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id d13sm813294lji.26.2022.02.21.12.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 12:10:37 -0800 (PST)
Message-ID: <ee648994-b296-2ac4-a676-ddcac463a428@gmail.com>
Date: Mon, 21 Feb 2022 23:10:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 8/9] drm/tegra: vic: Implement get_streamid_offset
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 joro@8bytes.org, will@kernel.org, robh+dt@kernel.org, robin.murphy@arm.com
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-9-mperttunen@nvidia.com>
 <b1df816b-6838-c435-1a23-5029144e4cfe@gmail.com>
 <7f4e4c47-59f1-1def-36bf-a2ded912f76d@gmail.com>
 <5d1b6e82-2c9d-8388-697f-0d7305a1206f@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <5d1b6e82-2c9d-8388-697f-0d7305a1206f@kapsi.fi>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

21.02.2022 14:44, Mikko Perttunen пишет:
> On 2/19/22 20:54, Dmitry Osipenko wrote:
>> 19.02.2022 21:49, Dmitry Osipenko пишет:
>>> 18.02.2022 14:39, Mikko Perttunen пишет:
>>>> +static int vic_get_streamid_offset(struct tegra_drm_client *client)
>>>> +{
>>>> +    struct vic *vic = to_vic(client);
>>>> +    int err;
>>>> +
>>>> +    err = vic_load_firmware(vic);
>>>
>>> You can't invoke vic_load_firmware() while RPM is suspended. Either
>>> replace this with RPM get/put or do something else.
> 
> Why not, I'm not seeing any HW accesses in vic_load_firmware? Although
> it looks like it might race with the vic_load_firmware call in
> vic_runtime_resume which probably needs to be fixed.

It was not clear from the function's name that h/w is untouched, I read
"load" as "upload" and then looked at vic_runtime_resume(). I'd rename
vic_load_firmware() to vic_prepare_firmware_image().

And yes, technically lock is needed.
