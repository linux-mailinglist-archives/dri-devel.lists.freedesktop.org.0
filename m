Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8234894229
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 18:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F8110F303;
	Mon,  1 Apr 2024 16:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="GmWyHD3g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81C210F303
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 16:49:51 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-33ddd1624beso2615616f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 09:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1711990190; x=1712594990;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EEXHUakeYi35deGcfs1FlH8AAIZBmJjR2nNcFnABEJw=;
 b=GmWyHD3g485sWIENgep6Zwxw7zQsytXJOEKuqzIRe90Fd/8w7MvmcfncMPpOS7ouwl
 jaU2/S0QxfP+9BMurk6H/SZuqOpaxuN9JC9S6/cnYAKEz4D4GVm+/slmedTnhdzY7T4Z
 upGtYNLPq2VnQvC9Pk5HBLpoznMQlwYwwBApPkDxCxkwwfC8IhPlC7UgCyeyFJyOlR0L
 8lKeLCXJJ7eGCMHbaBUbg1fG9wBJrN5in307c+l9j20Klw4h3iYYIQCVCVuAAUQtE6EX
 leMTs8Hq+3RIl54zpNX7n7UFZCAiK6+nVr5JoWKljKkOx1tZVtzUqdjELhoaY9/MjArt
 Ytng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711990190; x=1712594990;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EEXHUakeYi35deGcfs1FlH8AAIZBmJjR2nNcFnABEJw=;
 b=ozuZGLJ3hUoZPlAhsBzLraAk8hNM7NWQbIhnUsXZlO5eJoK3IKTsqTJIhOTvbS1yhK
 ScmEahE1lkFR8a/bCzimXeKCqRbN+yO6mHhRsuRA4zJP+7VEqCXeTh3EfElxC5niFNb5
 pVAV2fy/xoWFwhgPmicmdyMk5z0ov7XJp9NIMcSZM/wyuyxITSnYVk0WrpyEcdYa4Sq1
 AfXv6iel0eqG60vutOAEFEBRGhH7jw/IqJWPKEsKNVu72Ds6Lpu1WiT+vlo6dQ7UrSxA
 xzuCuVaqpy5AwRZNu7QxqPuC8ZxFjyXbiG5K63lgghB4DbiwwB/XSvIqtnGgOR/Socft
 Navg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMh4JMnmxN0qCw+M87CmlSQ0ynIF3Yymr4M0SMWOodJSFgaxSxP/WFlwxm/4BohZaJd+iuQ5TfP5clCTIWlFvE84pS90HWVA1CAc/G5XpD
X-Gm-Message-State: AOJu0YzF3PMO1cn2Ih2zn2FpthFVjQhO8xL7xFGjFXlgja5XQJv0HWdN
 2aWQl+dC/xv8USR/15ijhQT9wEiyZL9J4tLBHoXCRADzHKZ+XikT3AaZrqC2g/Y=
X-Google-Smtp-Source: AGHT+IHjAX05tuFKWU5ZU1matM2+yrbPIX11jR+xXS+ePaVIa3YRCtJT/wGl+0PmqujDntzBKMOUOQ==
X-Received: by 2002:a5d:64a2:0:b0:33e:cbec:e98 with SMTP id
 m2-20020a5d64a2000000b0033ecbec0e98mr13220057wrp.13.1711990189688; 
 Mon, 01 Apr 2024 09:49:49 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 fs11-20020a05600c3f8b00b004146dd6bfe2sm15187582wmb.47.2024.04.01.09.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Apr 2024 09:49:49 -0700 (PDT)
Message-ID: <2ddb4f5e-504e-4ce3-95d2-179dc7e6bf7b@ursulin.net>
Date: Mon, 1 Apr 2024 17:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm-misc migration to Gitlab server
Content-Language: en-GB
To: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Stone <daniels@collabora.com>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <20240312-bizarre-rational-sawfish-ccee0a@houat>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240312-bizarre-rational-sawfish-ccee0a@houat>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/03/2024 13:56, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Feb 20, 2024 at 09:49:25AM +0100, Maxime Ripard wrote:
>> ## Changing the default location repo
>>
>> Dim gets its repos list in the drm-rerere nightly.conf file. We will
>> need to change that file to match the gitlab repo, and drop the old cgit
>> URLs to avoid people pushing to the wrong place once the transition is
>> made.
>>
>> I guess the next merge window is a good time to do so, it's usually a
>> quiet time for us and a small disruption would be easier to handle. I'll
>> be off-duty during that time too, so I'll have time to handle any
>> complication.
>>
>> ## Updating the documentation
>>
>> The documentation currently mentions the old process to request a
>> drm-misc access. It will all go through Gitlab now, so it will change a
>> few things. We will also need to update and move the issue template to
>> the new repo to maintain consistency.
>>
>> I would expect the transition (if everything goes smoothly) to occur in
>> the merge-window time frame (11/03 -> 24/03).
> 
> The transition just happened. The main drm-misc repo is now on gitlab,
> with the old cgit repo being setup as a mirror.
> 
> If there's any issue accessing that gitlab repo, please let me know.

No issues accessing the repo just a slight confusion and how to handle 
the workflow. More specifically, if I have a patch which wants to be 
merged to drm-misc-next, is the mailing list based worklflow still the 
way to go, or I should create a merge request, or I should apply for 
commit access via some new method other than adding permissions to my 
legacy fdo ssh account?

Regards,

Tvrtko
