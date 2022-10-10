Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F92D5FA3EF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 21:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DEB10E1EE;
	Mon, 10 Oct 2022 19:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D996C10E1EE
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 19:07:28 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id c23so3025624qtw.8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 12:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tHbgSss03L35eJoiPvd6E+bOo+CK2kE8ZZuMTI5hMok=;
 b=ZLiCbmc+aLvVY6yK7PQS9yEjBx9W8tYKi8fpjZ1vBWhLhIJ8nQiLl2qIXAXSb+zai3
 dwLfe9FHOQHDeHis8L2jVeKaMteFBh3cz1qYG0aHxFlMbISl9PjSLsDmt8G5ARIIEPxC
 rLJP2JkpDijQTOgJmSBOp6wzr93kPscCY46zXKhjFbvTpQ+Bbj4C0kG9GQReLPuBFN68
 4ulyP9iMo7aKSCdiIITiCkRFXwo8WmqmbolIUecGab3+QFvFQ7G3jsYeG+N6I+HRjIhl
 tf8pCA3jjUo5VfnctePnGP4UziYpV7vcFtNPQK0HBkj+ltjPvhPZ1XC8sPM+fm9FNQEt
 jESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tHbgSss03L35eJoiPvd6E+bOo+CK2kE8ZZuMTI5hMok=;
 b=LBhDo3QDTc63g6K5rQyTVJmAZZlWhm99e19s6MsLNcY1Hi+lSWlDIfPBrq9gMdNtkb
 pW6kxCU/DLnWBPxQB9TWG5Xi4Bvo2SSj0n9DUcq9EqI9N+Prn3uWqZLe8HFXbbUC4WkP
 yrOu+lQ7SUwIM3Uo45zAwxCi6UHt0nrS6achUou7JoOZQZuyipWOYDffMrXpoXkf6zQl
 K0ietvdW+Y8TRylb6KGFsc0GI0jP5PVGI07/aRXUsjTC7Wo0mBaFHOiEAOjbkikl/KB9
 hq8vREoFCkTUgahMBbFokdvWTWm0UV5x+VsTrYFgLXynYsfaxhzUMtXvtkdQZb663Or0
 zaXg==
X-Gm-Message-State: ACrzQf2AQ+lyD7ZZaWpRXLccrHAYogLP647/asOu+WIwM5hhz8VtrO7V
 LBobbxx9poDo8z2812vF/8o=
X-Google-Smtp-Source: AMsMyM4sqjylyecSB8SpRQyKOlV52WBMIcnfpUmsjSNs6YgKEywOKanh7L6jExlWXlG/AzcbJCI/uQ==
X-Received: by 2002:a05:622a:10e:b0:398:d464:eefa with SMTP id
 u14-20020a05622a010e00b00398d464eefamr8672655qtw.172.1665428847849; 
 Mon, 10 Oct 2022 12:07:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 bm38-20020a05620a19a600b006cebfea5c55sm11505848qkb.2.2022.10.10.12.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 12:07:27 -0700 (PDT)
Message-ID: <395633de-193f-609e-abc6-9dddb2cae3c0@gmail.com>
Date: Mon, 10 Oct 2022 12:07:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/7] drm/vc4: Fix the core clock behaviour
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Scott Branden <sbranden@broadcom.com>, Stephen Boyd <sboyd@kernel.org>,
 Emma Anholt <emma@anholt.net>, Ray Jui <rjui@broadcom.com>
References: <20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech>
 <20221010114420.beytjynzshjgiy6y@houat>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221010114420.beytjynzshjgiy6y@houat>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/22 04:44, Maxime Ripard wrote:
> Hi Florian,
> 
> On Tue, Sep 20, 2022 at 02:50:19PM +0200, Maxime Ripard wrote:
>> Those patches used to be part of a larger clock fixes series:
>> https://lore.kernel.org/linux-clk/20220715160014.2623107-1-maxime@cerno.tech/
>>
>> However, that series doesn't seem to be getting anywhere, so I've split out
>> these patches that fix a regression that has been there since 5.18 and that
>> prevents the 4k output from working on the RaspberryPi4.
>>
>> Hopefully, we will be able to merge those patches through the DRM tree to avoid
>> any further disruption.
> 
> Could you review this? Ideally this would be merged through drm-misc due
> to the dependencies between the new firmware functions and the DRM
> patches.

I suppose I can review the firmware parts if you would like me to, for 
vc4 I am pretty much clueless, and despite efforts from Emma to get the 
vc4 driver to be usable on platforms other than Pi, that never happened 
unfortunately. It would be better to keep the firmware and vc4 drivers 
decoupled, just so "wrong" assumptions are not made, but for all 
practical purposes this is the only combination that exists.
-- 
Florian
