Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F894FBD91
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 15:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D8310F2D8;
	Mon, 11 Apr 2022 13:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F351A10F2D8;
 Mon, 11 Apr 2022 13:44:23 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id t25so5806945edt.9;
 Mon, 11 Apr 2022 06:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BxgGwAJ6X1Q3q5NOietwfETATh7CWvy4+LzvQ2HiqHE=;
 b=kuo2xFBolliACj0bCZ4kC+VrdC/QNBrU+DHROt2YFalkRFuwscJa5fA1nAC5DF9pI9
 cPVsuJYh4DNN9MkBQxNb0GhJlWxD28QgrRNCC4WnF8g3ePovwPVUHI5P8IhoglkCJZTL
 WBiB3squW7s5W6xgYjnn/aW00w8xUPL188vGjhVN+ZsusVkMPjK3wfzGg/GTyuL+4iER
 pz/r3n9y+bj2gSXik+qXJmB2tujcHy00GOYhLieGWV488C6ZjKdtAztAYy+kE5nmzAcA
 k9lNFHQQGPdIIRNom/R9qCwIMJHXVcoYUPuK2IeyuyKe/GvUo5nuUizQvrM+KDvyh2OL
 5CUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BxgGwAJ6X1Q3q5NOietwfETATh7CWvy4+LzvQ2HiqHE=;
 b=kZCByRazWkgQ4PLMxFgBNGi8oFAxK2odQjzRwrA7VhRA+OFkVo4ODVmNjYA0Z/x3MQ
 lFfhxvsjYtfA7iKX8zFB9vSrnVjdqsY9f+0qFlx+FJbwsGOaj5OOaZXNlWibXPu6kLeS
 ynH/e+941Cje1eCCWPHS2C0S+W/lzd76EWcKwLXJB9yn8872yCat0yFF5aZs0ruHQKCX
 oED3gWx3NOpi07mgUtwXZFsH0vZ0DqzvltDCSCq2GvqZwGzH8215wIT9KmcBMRK5mbWe
 NbGpffEj1HkxNYgQ4X62U7KSMpgfH8Jx/nb9YUg9emPqgYAz0LJkKothhMdWT8uE0UxA
 pRpQ==
X-Gm-Message-State: AOAM531WPqD5H5qm3tH2NPUnjA96uCmGm7UwIYJoDEfcDGg1bD82RGX7
 YmFTIdvWWNJVeKMaD4qkwbs=
X-Google-Smtp-Source: ABdhPJyk2DT5yBhnxxnX071nyADn/zdXh7wjGgod9/Eg2KDmRLsuyRnifRhEW7lbUkpgWYzESzanuA==
X-Received: by 2002:a05:6402:e96:b0:41d:1a0f:e70a with SMTP id
 h22-20020a0564020e9600b0041d1a0fe70amr18178741eda.411.1649684662527; 
 Mon, 11 Apr 2022 06:44:22 -0700 (PDT)
Received: from ?IPV6:2a02:908:1252:fb60:b3e9:56a3:6bb9:f974?
 ([2a02:908:1252:fb60:b3e9:56a3:6bb9:f974])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a170906380a00b006a68610908asm11971120ejc.24.2022.04.11.06.44.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 06:44:22 -0700 (PDT)
Message-ID: <3796cd46-15f6-8991-0a29-7b7f1c7eeae1@gmail.com>
Date: Mon, 11 Apr 2022 15:44:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] drm: add a check to verify the size alignment
Content-Language: en-US
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220411073834.15210-1-Arunpravin.PaneerSelvam@amd.com>
 <9ecac65c-84d9-9965-4fd3-f86ea572bb9d@intel.com>
 <ca280f24-8efe-e972-4a03-700e002cc6f7@gmail.com>
 <5f2a190a-f8ef-9b5f-d6b2-efa30f367612@intel.com>
 <8e58d05a-61f0-1e6b-cab5-fcadb661c7e5@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <8e58d05a-61f0-1e6b-cab5-fcadb661c7e5@amd.com>
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 11.04.22 um 15:49 schrieb Arunpravin Paneer Selvam:
>
> On 11/04/22 7:02 pm, Matthew Auld wrote:
>> On 11/04/2022 13:42, Christian König wrote:
>>> Am 11.04.22 um 11:47 schrieb Matthew Auld:
>>>> On 11/04/2022 08:38, Arunpravin Paneer Selvam wrote:
>>>>> Add a simple check to reject any size not aligned to the
>>>>> min_page_size.
>>>>>
>>>>> when size is not aligned to min_page_size, driver module
>>>>> should handle in their own way either to round_up() the
>>>>> size value to min_page_size or just to enable WARN_ON().
>>>>>
>>>>> If we dont handle the alignment properly, we may hit the
>>>>> following bug, Unigine Heaven has allocation requests for
>>>>> example required pages are 257 and alignment request is 256.
>>>>> To allocate the left over 1 page, continues the iteration to
>>>>> find the order value which is 0 and when it compares with
>>>>> min_order = 8, triggers the BUG_ON(order < min_order).
>>>>>
>>>>> v2: add more commit description
>>>>> v3: remove WARN_ON()
>>>>>
>>>>> Signed-off-by: Arunpravin Paneer Selvam
>>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>>
>>> Question here is who will be pushing that to drm-misc-next? Should I
>>> take care of that?
>> Yes, please do.
>>
>>> I think it's time that Arun should request push permission for
>>> drm-misc-next.
> How to get push permission for drm-misc-next, should I send request mail
> to maintainers, may be next time I will push myself.

See here 
https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html

Regards,
Christian.

>
> Thanks,
> Arun
>>> Thanks,
>>> Christian.

