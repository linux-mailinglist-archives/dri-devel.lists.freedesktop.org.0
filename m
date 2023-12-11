Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D63180C53A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 10:50:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EC510E38B;
	Mon, 11 Dec 2023 09:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C3710E38B;
 Mon, 11 Dec 2023 09:50:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c29f7b068so40315215e9.0; 
 Mon, 11 Dec 2023 01:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702288229; x=1702893029; darn=lists.freedesktop.org;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=McMkjnTstF1kyi4iy40vHAfwGgnk9K5v7Kf81mLP6FU=;
 b=Ed7g6gQg7Q6MOk+aGNx1E5ARVr0f8cvbKM4Sc5+pnH1UAyFixSmtef6eOrLEzrqyHC
 tiHzid6Eq1068GbvMY31VQ0d5b4HnpaeYdINOqlrUYJvhLi9+ZELXjNPDIYmfBeTeEEl
 osiaetAHAoQkqdSQ4Z/BTu3VIWM92JP1mta7AO/90a2/jcDhffMxdkZ06f32gvE/myml
 AXiB+mlldrv2yys6Rj6KRNWFRcQFVeWhLeHuLULEaVPiZgCft9u+Jo0sVLmqWLuyarK4
 Ok60cUJ6egT8qaHbaB1I/k2WSSZiB0bO0hkqw9f6aH9Q34gVX+GWtm3fYUUxSZ02bnY/
 d5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702288229; x=1702893029;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=McMkjnTstF1kyi4iy40vHAfwGgnk9K5v7Kf81mLP6FU=;
 b=WrPJTX3zBMJY1pkDsG0wZN2E5496MoZfA8P+mK5xBlVzyIsHsPS0EOVulyKHOyIvG5
 fuSNGwdwzJOpFHx3QlLg+7TxOcGbRQuk+ayobmnRMrywfkfBSgUSeT5mpOLtNmCqpwgv
 obebXz+spjWPqFvYTVBTqOfrankS4Jead9dYAR8Bm3k7UqCXTOuA3Wtcvn4iF0OefpAc
 VyEOn9a7evx+kuVvxKHQ72PLmH5dQwCb57MS+dGx3OJa0Rwh3bCMcJQ1G4ejaZe36a0Q
 BLB4pHY99mJoJcXRRUwky1QB4lj5c91XqHpKi215uFnm/kY1fmY9h9HK/Z52lbe6IDNL
 /ddg==
X-Gm-Message-State: AOJu0YwGipF0Rn8w9kQgHGJ5/M20HFDAklQLlKdEIpBKspkDGJqgt9Ue
 gRC9czpCoDHyUwPskc8ekDk=
X-Google-Smtp-Source: AGHT+IHUgPXi6Fg3unfCSfVOyaKAuvqFDAyxbFn70spYbyFgrDlEYj+prZv7RY51J+3zIPjsRxF7cw==
X-Received: by 2002:a05:600c:1913:b0:40c:3742:59b with SMTP id
 j19-20020a05600c191300b0040c3742059bmr2060847wmq.114.1702288229264; 
 Mon, 11 Dec 2023 01:50:29 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a05600c384d00b004030e8ff964sm14711679wmr.34.2023.12.11.01.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 01:50:28 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------O0WZ1HXXPQlxyBFlvwAPJ8RA"
Message-ID: <473652dd-8ca1-436b-aa52-eb85eb0e98df@gmail.com>
Date: Mon, 11 Dec 2023 10:50:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: Enable clear page functionality
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20231207151142.929349-1-Arunpravin.PaneerSelvam@amd.com>
 <20231207151142.929349-2-Arunpravin.PaneerSelvam@amd.com>
 <d30b7992-5c39-49f5-889c-c31d4994a5c3@amd.com>
 <CADnq5_PdWUDVK0mvMgyTyogMnT-DD2nhXHarO+BLg9BjtGPRGA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CADnq5_PdWUDVK0mvMgyTyogMnT-DD2nhXHarO+BLg9BjtGPRGA@mail.gmail.com>
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
Cc: alexander.deucher@amd.com, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, amd-gfx@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------O0WZ1HXXPQlxyBFlvwAPJ8RA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 08.12.23 um 20:53 schrieb Alex Deucher:
> [SNIP]
>> You also need a functionality which resets all cleared blocks to
>> uncleared after suspend/resume.
>>
>> No idea how to do this, maybe Alex knows of hand.
> Since the buffers are cleared on creation, is there actually anything to do?

Well exactly that's the problem, the buffers are no longer always 
cleared on creation with this patch.

Instead we clear on free, track which areas are cleared and clear only 
the ones which aren't cleared yet on creation.

So some cases need special handling. E.g. when the engine is not 
initialized yet or suspend/resume.

In theory after a suspend/resume cycle the VRAM is cleared to zeros, but 
in practice that's not always true.

Christian.

>
> Alex
--------------O0WZ1HXXPQlxyBFlvwAPJ8RA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Am 08.12.23 um 20:53 schrieb Alex Deucher:<br>
    <blockquote type="cite"
cite="mid:CADnq5_PdWUDVK0mvMgyTyogMnT-DD2nhXHarO+BLg9BjtGPRGA@mail.gmail.com">[SNIP]<span
      style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">You also need a functionality which resets all cleared blocks to
uncleared after suspend/resume.

No idea how to do this, maybe Alex knows of hand.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Since the buffers are cleared on creation, is there actually anything to do?</pre>
    </blockquote>
    <br>
    Well exactly that's the problem, the buffers are no longer always
    cleared on creation with this patch.<br>
    <br>
    Instead we clear on free, track which areas are cleared and clear
    only the ones which aren't cleared yet on creation.<br>
    <br>
    So some cases need special handling. E.g. when the engine is not
    initialized yet or suspend/resume.<br>
    <br>
    In theory after a suspend/resume cycle the VRAM is cleared to zeros,
    but in practice that's not always true.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite"
cite="mid:CADnq5_PdWUDVK0mvMgyTyogMnT-DD2nhXHarO+BLg9BjtGPRGA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Alex
</pre>
    </blockquote>
  </body>
</html>

--------------O0WZ1HXXPQlxyBFlvwAPJ8RA--
