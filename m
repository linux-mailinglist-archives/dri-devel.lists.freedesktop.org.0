Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A874CC221
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 17:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5DE896C7;
	Thu,  3 Mar 2022 16:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35AD896C7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:03:19 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5E93B3F1E6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646323398;
 bh=gmVjym9cd+uCsI0b9eeIUMjOCAOQQ2Nu9Za2weChuPo=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=DIntzxdZLSqO2Td7JB62k8UwDDjKA19uKeWoBwENdwA1y3tH2gm04mMKUeHUEyeEH
 g4F2XClLagvr7+oq3vQejf0yQdQ1ou/0oYF28QZcf8FFR66tjOof8IPNQRgG4oUEl5
 Kat69seAeKIa07e5NOqivhUIACXbgGicd7mSAMHs7ZgxQL/78tIurDz9z6vyTAm55o
 bb1Zty6hnRIY6yWN2TQLoVWC1lPezIetv0+on5SDHOXGS+Exskm1nszdxrltPuzPbZ
 ybSxelHnxFbEJ8w0QO82anf6S3yFmvab2304odRxjkTI6BMcJ0cCMf63urFUTUJAwF
 iW5mbjMvpQJxg==
Received: by mail-wm1-f71.google.com with SMTP id
 h19-20020a05600c351300b0038141cf26deso1765137wmq.8
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 08:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gmVjym9cd+uCsI0b9eeIUMjOCAOQQ2Nu9Za2weChuPo=;
 b=02MCYVccoVj94Uw+VmMfZbgr8jO5gPVsRIT50Vug0iL7X5l2dbvup/DGVjmare31+9
 fsvnqjLmsybPMx6JPRlsPk1XnUs/4MCsY1rdU6g77spKV6HeUuKJ2xDUBmWovJG0uTem
 8VObbQO96JoOXDkCfMErqc7iLSo9VfKCjcXXu7TR4xFKYU1wkZ5+71vVGhWBzVqLWDwn
 9zuejvFdgl79UQ0KBB7Cnrjr0Loy/dqmmcQO/IHNGf4ekGYJ9Kyk31w77/qjBFlS3dGM
 HskUd/DRUAVXhq7+qXYd5mVw8zON8jC/qobu1wKxH0cn1E1Jpp8nH+oqIvoEVYdJ/WPR
 Gd/Q==
X-Gm-Message-State: AOAM53125+i8kNUgsiDLjAQj505ZVk3SVsLF7VluQH9024g75kLfIJkW
 BaX04JAnajM3vRuKG0O9xz3e4nGJ4trUPvxOdUXwMWFvu356Xs3mvGANasdtAar9YvoHvhLnO4t
 7XYpK6utCpBbiB7h8am4wzagt6fvxgX821GVaxxiIzjd5uw==
X-Received: by 2002:a5d:45cb:0:b0:1ed:f938:7e17 with SMTP id
 b11-20020a5d45cb000000b001edf9387e17mr27109114wrs.170.1646323397173; 
 Thu, 03 Mar 2022 08:03:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwD6l0dLxfnigO1O4ROoidzn9kyVra6G61WTQNQDFli8qZZO6vBD6gcGbzDEkzc7uGrF/hq4A==
X-Received: by 2002:a5d:45cb:0:b0:1ed:f938:7e17 with SMTP id
 b11-20020a5d45cb000000b001edf9387e17mr27109091wrs.170.1646323396953; 
 Thu, 03 Mar 2022 08:03:16 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 r5-20020a5d4945000000b001f06372fa9fsm1176056wrs.54.2022.03.03.08.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 08:03:14 -0800 (PST)
Message-ID: <9c1dc8ee-c717-377b-879c-0706a1613cf3@canonical.com>
Date: Thu, 3 Mar 2022 17:03:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 RESEND 21/24] drm/exynos/decon5433: add local path
 support
Content-Language: en-US
To: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>
References: <20190325071349.22600-1-a.hajda@samsung.com>
 <CGME20190325071401eucas1p10df709b256570f1aba9cbc4e875da1b3@eucas1p1.samsung.com>
 <20190325071349.22600-22-a.hajda@samsung.com>
 <b3c98aa3-751b-acc4-8e57-5566af27f922@canonical.com>
 <6270db2d-667d-8d6f-9289-be92da486c25@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <6270db2d-667d-8d6f-9289-be92da486c25@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/03/2022 02:00, Inki Dae wrote:
> Hi Krzysztof,
> 
> 22. 2. 7. 01:51에 Krzysztof Kozlowski 이(가) 쓴 글:
>> On 25/03/2019 08:13, Andrzej Hajda wrote:
>>> GSCALERs in Exynos5433 have local path to DECON and DECON_TV.
>>> They can be used as extra planes with support for non-RGB formats and scaling.
>>> To enable it on DECON update_plane and disable_plane callback should
>>> be modified. Moreover DSD mux should be set accordingly, and finally
>>> atomic_check callback should be used to limit the number of active planes.
>>>
>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>> ---
>>>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 80 +++++++++++++++----
>>>  drivers/gpu/drm/exynos/regs-decon5433.h       |  6 ++
>>>  2 files changed, 72 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ex
>> Hi guys!
>>
>> I am working on DRM bindings conversion to DT schema format and I found
>> this set only partially applied. I merged the DTS patches ("dsd" clock),
>> but I think the driver and bindings were not picked up.
>>
>> Nevertheless I am going to include the "dsd" clock in the new bindings,
>> so the DTS passes DT schema checks. Let me know if other approach
>> (revert of DTS change) should be taken.
>>
> 
> Sorry for late response.
> 
> As of now, "dsd" is a dead property not used anywhere.
> This patch series makes real user not to work correctly due to ABI change.
> How about reverting it until this patch series is merged after fixing the real user problem?

The Exynos5433 DECON bindings were already merged by Rob, so someone
would need to send a revert. However this does not answer the actual
question - whether the "dsd" clock is necessary, whether it is there
(routed to DECON). If it is, it should stay in the bindings.

Best regards,
Krzysztof
