Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD334B8462
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 10:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68A710E61F;
	Wed, 16 Feb 2022 09:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752B810E61F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 09:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645004157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wuRCqHtrGnCNe4lFzhUlKSmhRtzzz/eDauDhTkRgdqU=;
 b=MZqSIL9hQyB0BKX+W/24iR2QV9G/5YCiuEtwcbFzYJfGkQpI/j0dICJvyFKMpukPz0FuSR
 I8/1aX3e1VndM0Ua8Ta1WphW4XdJObroYUB1e//2PyJ4RmsexkqUoBw/gkoKa9ESadkdtX
 gxeKi5g46OYNqCOr9gOj6lJeG1BhyDE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-o3eY-HHsPDSn_ABq7GmPiQ-1; Wed, 16 Feb 2022 04:35:56 -0500
X-MC-Unique: o3eY-HHsPDSn_ABq7GmPiQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay41-20020a05600c1e2900b0037c5168b3c4so2677250wmb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 01:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wuRCqHtrGnCNe4lFzhUlKSmhRtzzz/eDauDhTkRgdqU=;
 b=m9FjVDrZL0SCT4Z3/Bi/ZwlYgOuNDKSty1RPgpH+LZ30NN2UAKDtf6zb7y+j9SkwPc
 aFtydUVf4PVN0lLSmythaIpXqcXTlCSl839AnWNcCReID+lZyqIog+9kFbPNaoJhcolm
 48C2XTCNHbYVLLzL/iPkGsaw0MGLcQXspZqIjrfEp5mWHQXGl38W+J7v1wCynpIRqntQ
 RuEUNvU84aVB9ZZDBFa0DrRKi8g6E64GaYDkCWGxz+VGRqKAny86mFTKq1BRLmMvu1lg
 HLU8G6pskJipC41ebo/uaad+Es/bcL6r9L6wP7qUgg1y5xCvdRPri9RtfyrRoFPIbdFi
 eIdg==
X-Gm-Message-State: AOAM532XBvngXBS+Yg5NO5YnqLFD5HC8EMKHL/d3DoK5AbhfhduzZy1B
 gHQBvRa/3aDwWekQOeGRqVfeGK2eoNeN+I78VrTvajsPd3e9wl57yWIeEMxz9UP3vFD80eO1GE6
 13xE0tJsL8zvKAki0+JKVsuS+be6c
X-Received: by 2002:a7b:c4d5:0:b0:37b:ffb9:bb6a with SMTP id
 g21-20020a7bc4d5000000b0037bffb9bb6amr727577wmk.89.1645004155040; 
 Wed, 16 Feb 2022 01:35:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqfTxyIwHKGURmvfa8yIzjAYthlgNAnwVa9jRIycXk3slfzdebWzRK+l4sr6w0evO2C94Sgg==
X-Received: by 2002:a7b:c4d5:0:b0:37b:ffb9:bb6a with SMTP id
 g21-20020a7bc4d5000000b0037bffb9bb6amr727553wmk.89.1645004154754; 
 Wed, 16 Feb 2022 01:35:54 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id b16sm26397520wrj.26.2022.02.16.01.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 01:35:54 -0800 (PST)
Message-ID: <ce339fc7-b6bf-b19a-be10-54ee86487b96@redhat.com>
Date: Wed, 16 Feb 2022 10:35:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/3] drm: Plumb debugfs_init through to panels
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Doug Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20220205001342.3155839-1-dianders@chromium.org>
 <20220204161245.v2.2.Ib0bd5346135cbb0b63006b69b61d4c8af6484740@changeid>
 <5d60473d-be8f-e2dc-2ce9-bc0b9056e4b4@redhat.com>
 <e6670fd7-1f75-56f7-b668-20db9902cac6@intel.com>
 <CAD=FV=Ut3N9syXbN7i939mNsx3h7-u9cU9j6=XFkz9vrh0Vseg@mail.gmail.com>
 <87ee435fjs.fsf@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <87ee435fjs.fsf@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, lschyi@chromium.org,
 Sam Ravnborg <sam@ravnborg.org>, jjsu@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/16/22 10:25, Jani Nikula wrote:

[snip]

>>
>> I actually wrote said follow-up patches and they were ready to go, but
>> when I was trying to come up with the right "Fixes" tag I found commit
>> b792e64021ec ("drm: no need to check return value of debugfs_create
>> functions"). So what's being requested is nearly the opposite of what
>> Greg did there.
>>
>> I thought about perhaps only checking for directories but even that
>> type of check was removed by Greg's patch. Further checking shows that
>> start_creating() actually has:
>>
>> if (IS_ERR(parent))
>>   return parent;
>>
>> ...so I guess that explains why it's fine to skip the check even for parents?
>>
>> Sure enough I confirmed that if I pass `ERR_PTR(-EINVAL)` as the root
>> for `panel->funcs->debugfs_init()` that nothing bad seems to happen...
> 
> Yeah, the idea is that you don't need to check for debugfs function
> return values and you can safely pass error pointers to debugfs
> functions. The worst that can happen is you don't get the debugfs, but
> hey, it's debugfs so you shouldn't fail anything else because of that
> anyway.
> 

Thanks a lot Doug and Jani for the explanations. That makes sense and it
explains why most code I looked was not checking for the return value.

I guess we should write something about this in the debugfs functions
kernel doc so it's mentioned explicitly and people don't have to guess. 

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

