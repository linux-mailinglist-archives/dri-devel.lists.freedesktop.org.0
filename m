Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A3DBC2ED2
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 01:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9CB10E716;
	Tue,  7 Oct 2025 23:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UmPw9hbd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5784E10E716
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 23:16:30 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-8ca2e53c37bso582575039f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 16:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1759878989; x=1760483789;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SD5yIh7mchDzfy+pmfKeaAbFqsdOLLaDl138ZLpTy7s=;
 b=UmPw9hbd/G/AtLRvInQjYUomCvAmln1YcNi7ff/20UuUYGD9bt34bKrMUpqruglR5B
 eD4XphkdSs4i1SzPa16rlONMOhL9OzHERFozb/f8tKilV/8/BI1FAy34QpzkZQ7LqcMF
 ntiMiczEdiAulVGvYMhZNjOxYY6ub3hEq37TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759878989; x=1760483789;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SD5yIh7mchDzfy+pmfKeaAbFqsdOLLaDl138ZLpTy7s=;
 b=oGXdjRyNtWnYJN8Yw+pCGzZrquBJ08xa1lDmOZdSMZVEzOopsq6OU5pv2PVYbMsMTF
 21otD7ENtFC32s3b6lqGjBhlvtHuS/nEg6Yo4VNeiRl/svHk7IWR9KUU0gr4H2yxHI28
 UpG39hizHOw54nTZ6OEmsnCzyYgKIXHB2s9eavLrF4OoyTIdc95kQ7EEmHVJu68f9huy
 QJAFVZjNAcXIDjqvkY+lM2QwCQR8cDQHcltvugGB0pjmBUHgj8fDGPo+b7TxXg45OXiu
 1f/p9oR/ollDb/KwADWR+SXHrf95EDdV7YCZdY5EADndQllSKe/CSRRtq7bjc2WIhj4D
 IHBQ==
X-Gm-Message-State: AOJu0YxED9axVk6kIWHbeBFxrnW5IoJAdTMZyBhoQImiw2uXUQzYectc
 sQnjHP9md2LLzxU5tTgi/Qrs3+FKIxdypTyBEfKQrld00Y7AIqhe7bJ4NFe6h86fUEY6EFc8qs2
 ao4jC
X-Gm-Gg: ASbGncuuEkfSEvC0NYwaj5qKaINK1eJzeotj5m4w81XbjHCK/VmUIcaBbQMaKiMvphH
 MHbJ1Ur+ts02CPV1d3h/wot/+ZRDqYNhXcY/tu6xO+k6n+JsW7SdITF8/N+NIYi/wKvbxF+wVUL
 OfUCEchyuBOCRiPF2NiOQ/QQfBiFcpNcB4T7koowK3ibZ/KD9WTYgstgI4eU/ULqxWbKqVsyjOu
 a9lWzR4UGl3BrJ+uhGdH2F+3WPBKaECjVs/y+5EUDTnb4VP/oeZyld1uNcOn6HtD52AaPvYQ7HX
 C2TKdAn6qXrVgFvQZf0PycwL21itki/ojhNxioTa1VqAr4YzWqj0DXWEShA07IC7RxxcA8wldol
 osiKtjvTgtjSz2OutXNu1lPYLH1qnEJecYM5QAQ0T6fcndRuNNvC6tAw7tLk=
X-Google-Smtp-Source: AGHT+IFtnjgHVUKlgejgjQmfrY8NhWm0K4ECYfhZKgNrEOhgOUSbX5KisBkAd+fZ7CYn0EsvLjgWXg==
X-Received: by 2002:a05:6e02:2581:b0:428:7f76:4ec4 with SMTP id
 e9e14a558f8ab-42f873d2956mr11775395ab.16.1759878989058; 
 Tue, 07 Oct 2025 16:16:29 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-42e7bd2f139sm58970215ab.8.2025.10.07.16.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 16:16:28 -0700 (PDT)
Message-ID: <f774da25-ab98-4731-b78d-394d8e3a4c3a@linuxfoundation.org>
Date: Tue, 7 Oct 2025 17:16:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/komeda: Convert logging in komeda_crtc.c to drm_*
 with drm_device parameter
To: Rahul Kumar <rk0006818@gmail.com>, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20250926093008.1949131-1-rk0006818@gmail.com>
 <CAKY2RybMM5jcOzO_mknsdH+m9-T+Qe3yMhRrdpV_VE4paUrAKw@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAKY2RybMM5jcOzO_mknsdH+m9-T+Qe3yMhRrdpV_VE4paUrAKw@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/3/25 11:51, Rahul Kumar wrote:
> Hi Liviu,
> 
> Just following up to ask if anything more is needed from my side for
> this patch, or if you plan to pick it up in this merge window.
> 
> Thanks,
> Rahul
> 

Rahul, no top posting. Please give people time to respond before
sending a second email asking for feedback. I see two messages
back to back from you - perhaps an error during send.

> On Fri, Sep 26, 2025 at 3:00 PM Rahul Kumar <rk0006818@gmail.com> wrote:
>>
>> Replace all dev_err(), dev_warn(), dev_info() and DRM_ERROR/WARN/INFO()
>> calls in drivers/gpu/drm/arm/display/komeda/komeda_crtc.c with the
>> corresponding drm_err(), drm_warn(), and drm_info() helpers.
>>
>> The new drm_*() logging functions take a struct drm_device * as the
>> first argument. This allows the DRM core to prefix log messages with
>> the specific DRM device name and instance, which is essential for
>> distinguishing logs when multiple GPUs or display controllers are present.
>>
>> This change aligns komeda with the DRM TODO item: "Convert logging to
>> drm_* functions with drm_device parameter".
>>
>> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
>> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
>> ---
>> Changes since v2:
>> - Added Reviewed-by tag from Liviu Dudau
>>

thanks,
-- Shuah
