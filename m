Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB91876C1DF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 03:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F4710E07C;
	Wed,  2 Aug 2023 01:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A607510E07C;
 Wed,  2 Aug 2023 01:06:57 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1b8b2886364so39236635ad.0; 
 Tue, 01 Aug 2023 18:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690938417; x=1691543217;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+PdQZNMSX4BWd7GfGQsgkbSU4z+LmFph5fAsS9Mb/8E=;
 b=LiiY6SIY57LUWIarlaRfiiG5slzPSiWyCTrNC10J1X6bDP306y+pZtT4CiOn9V2+QH
 5O4LpUeNPytWKhbHYu/aEVdn43Kouub92jKz1O33BAJrvN7jdqzIusQV3wXDKxQeDzdQ
 Q5EdAnfrwHW7fzo7lcGuH0AZelAvIOOVO7MGlFsm1dvIWD/g5tvkk3KpCj76xKclykHe
 tu9Ukv+OeUJLyP7fW4VTh9Vmkh6u4R8m0DYnbjdt8PThMHhosNfl7pOSk+A1FN2Jlf+n
 /SWqkEaxG3mISL+aJWqUXOl7rdOnbmGYvESMtlVtQSXaAUksiod8bW3ZupB+1zXc672G
 RnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690938417; x=1691543217;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+PdQZNMSX4BWd7GfGQsgkbSU4z+LmFph5fAsS9Mb/8E=;
 b=f+1ejwe1vIX4OHRZ0uV2NCjKsV2VBBWEti+odGEcD3i3Hr39AvBN+lu1d4Uu9BEmmD
 LMtY2XmnBtiQuW+27eqEazddG/EQOmp9F0BwlgusXAJOUCNkkP+U3g+ssWH1WqCTpfzK
 yCJIvqXkhHi45ViefnIKGOAUAWHHmLA8VHS7VKHvUDC4BQS6196zW/J/8cu5/0b8cy46
 RnvQmNEOP+KGaQthR6JlZ30AOA+MDJUA4EiQAI8UlokpB1P/N5neqewDrg2tbTJ3smC7
 mvlV2t5ZXoh/RCE0LqsNRDu4bUuXi3EBAT+bnwMFPUYbVLWDBzxIoCP3hn74tyOQikys
 QQbA==
X-Gm-Message-State: ABy/qLYfLfnS1YFxCYB5CbSqM2S9BECK+VEIGgItLSHlsWHiSDGBbdJr
 29hHbBKZEThdpcMwU38jtWI=
X-Google-Smtp-Source: APBJJlFPO24E4YncgqAZho5j6BS4ESZz3zlESgIJC4yejRGuMT93LjBIrPlB6A5DdR6DXK6Z7FVJpQ==
X-Received: by 2002:a17:902:7086:b0:1ae:10bc:4ae8 with SMTP id
 z6-20020a170902708600b001ae10bc4ae8mr12904705plk.26.1690938416930; 
 Tue, 01 Aug 2023 18:06:56 -0700 (PDT)
Received: from [192.168.0.105] ([103.131.18.64])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a170902748900b001b54a88e4a6sm11017738pll.51.2023.08.01.18.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 18:06:56 -0700 (PDT)
Message-ID: <2f4f53e2-b12b-c77c-e7cb-8c0436a209e5@gmail.com>
Date: Wed, 2 Aug 2023 08:06:51 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in smu73_discrete.h
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, Ran Sun
 <sunran001@208suo.com>, alexander.deucher@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230801100024.8215-1-sunran001@208suo.com>
 <ZMjposYeMFxU5nE9@debian.me> <87cz07vvwu.fsf@intel.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <87cz07vvwu.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/08/2023 18:34, Jani Nikula wrote:
> On Tue, 01 Aug 2023, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>> And it is unfortunate that you and @208suo.com people doesn't reply to
>> review comments (try searching lore.kernel.org)
> 
> Essentially a one-way firehose of patches pointed at our general
> direction is not benefitial to the community. It's not participation,
> it's not co-operation. If the review gets ignored, why should we invest
> our time on *any* of the patches?
> 
> 

Well, I guess this is the kind of "hey, some new orgs spam us tens
of trivial patches, then we review them as usual, but people from
that org are deaf in regards of our reviews (maybe deliberately?)".
The exact same situation happened last year with @cdjrlc.com
people, when they were notoriously known for spell-fixing and
redundant word fixing patches. Many of these patches were correct,
but some of them were not, triggering reviews requesting changes.
Yet, they also ignore the reviews.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

