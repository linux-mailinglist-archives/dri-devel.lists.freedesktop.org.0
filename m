Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 355225805E6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 22:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6232C8DD68;
	Mon, 25 Jul 2022 20:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7270F8DCDA;
 Mon, 25 Jul 2022 20:47:08 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 z12-20020a056830128c00b0061c8168d3faso9578580otp.7; 
 Mon, 25 Jul 2022 13:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Cg/l5r1DnfHeQDhJMEUy4F+4PmlxIavAirIL0/cpxLY=;
 b=hQb7YnD6H74svuohwJ5MGhCu6hJIzuKgaz1De63644kZ3X7lWS7VjWdR5dC4VjT4nc
 74C49l30iD3MnjL3i6fgY6dKK9DC6cW5jUKNzdehgfOxLpcJWuBwZ0JN15ymAyBpl0f3
 wIWbdBwq4vghDxbSls5/cOkQLAVCd4IqybBy3wOkW8Cw8PEcNgHvWXaVzds71Fn0cz7r
 Kh7pgoX8pDsXQHQL93NlbPjVp2FHhNfcBwIpPxXsHIGmjVhN7vbVjZxXZKwb4NSRIZMI
 v/+Nk8NfkaHYcE4QPQYgk7U6djHRtVtXHRsrmTDBi8UzaJNWKMHbqGEtsR57/U0d5+pU
 jnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cg/l5r1DnfHeQDhJMEUy4F+4PmlxIavAirIL0/cpxLY=;
 b=8I8gy4HrPjmXMX6zDGaOnFuR00yMtwoPCo/0MDSXIErtlbR/RV3oz/l0s9ZtTa2Igx
 d5qJeMxzthi9jZpVet3ePCgOffQ3L+Y+q4od/uHiLSiEB/U74uyFCqnObMBi179PlJZ1
 qHg+Jc39dgvfw3Qj1MY0upC6dGSlQGd7k2Cv31yVJ1ih7g+FUZHPBINL9kcNUS5zm5FF
 cevNYy8GM/S7owFfSnEVUBED3w2Hj5MIjQKqTs0F+IM3g3Fst1c+1qxSX7iAhtHjwolV
 o63G0Xx5dTU1mFD/mXE+I/ZOywYYluaom/W6+1q22UZ2OX2ZEA3HXN1ZC2W212MnOJlQ
 RTUQ==
X-Gm-Message-State: AJIora8s/+RtAvnZK1nSVmETuUvQNbZzVP9BuunYfr0vfS//g7rjuf0E
 pcum4cAtp2bWZOrKrvqwmj0=
X-Google-Smtp-Source: AGRyM1v+7jRm6tpyJZxahGhRMsz454sYm8Q2qSd6NB5xA0Uv/skaQtKPfgvnbBzJvoF6ucOVc6dpfA==
X-Received: by 2002:a9d:2083:0:b0:61c:dbc8:3d8b with SMTP id
 x3-20020a9d2083000000b0061cdbc83d8bmr5369503ota.192.1658782027639; 
 Mon, 25 Jul 2022 13:47:07 -0700 (PDT)
Received: from ?IPV6:2804:14c:bbe3:4370:95da:f07f:e927:6958?
 ([2804:14c:bbe3:4370:95da:f07f:e927:6958])
 by smtp.gmail.com with ESMTPSA id
 j5-20020aca6545000000b0033ad9f035a5sm1967963oiw.34.2022.07.25.13.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 13:47:07 -0700 (PDT)
Message-ID: <4f359e30-90f8-c8bf-4e07-6856fcfd3506@gmail.com>
Date: Mon, 25 Jul 2022 17:47:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH 1/2] drm/amd/display: change variables type
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
References: <20220725181559.250030-1-magalilemes00@gmail.com>
 <a7589316-2a55-85f2-b665-5fe4bebf7a69@igalia.com>
From: Magali Lemes <magalilemes00@gmail.com>
In-Reply-To: <a7589316-2a55-85f2-b665-5fe4bebf7a69@igalia.com>
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
Cc: siqueirajordao@riseup.net, sunpeng.li@amd.com, tales.aparecida@gmail.com,
 airlied@linux.ie, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 mairacanal@riseup.net, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, isabbasso@riseup.net, andrealmeid@riseup.net,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/25/22 16:42, André Almeida wrote:
> Hi Magali,
>
> Às 15:15 de 25/07/22, Magali Lemes escreveu:
>> As "dcn3_15_soc" and "dcn3_16_soc" are of type "struct
>> _vcs_dpi_soc_bounding_box_st", change their types accordingly.
>>
> I can see that indeed this type change sense for those variables, but
> isn't a bit strange that the type was wrong in the first place? I wonder
> if this variable is even used, given that it would very likely throw a
> compiler error when using the wrong type and trying to access struct
> members that aren't defined.


A compilation error would be thrown if either 
"dc/dcn315/dcn315_resource.h" or "dc/dcn316/dcn316_resource.h" were 
included in the files where "dcn3_15_soc" and "dcn3_16_soc" are 
initialized. Since they are not included, the wrong variable type error 
is not shown.
To solve the sparse warning in the second patch of this series, those 
variables need to be declared first, but they are already declared, 
we're only missing the headers. If I only add the headers, then those 
variables will be seen, and I get the expected incompatible variables 
types error. So, fixing the types here is a preliminary work for the 
next patch.


Magali


>
>> Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
>> ---
>>   drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h | 2 +-
>>   drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
>> index 39929fa67a51..45276317c057 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
>> +++ b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
>> @@ -32,7 +32,7 @@
>>   	container_of(pool, struct dcn315_resource_pool, base)
>>   
>>   extern struct _vcs_dpi_ip_params_st dcn3_15_ip;
>> -extern struct _vcs_dpi_ip_params_st dcn3_15_soc;
>> +extern struct _vcs_dpi_soc_bounding_box_st dcn3_15_soc;
>>   
>>   struct dcn315_resource_pool {
>>   	struct resource_pool base;
>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
>> index 0dc5a6c13ae7..d2234aac5449 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
>> +++ b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
>> @@ -32,7 +32,7 @@
>>   	container_of(pool, struct dcn316_resource_pool, base)
>>   
>>   extern struct _vcs_dpi_ip_params_st dcn3_16_ip;
>> -extern struct _vcs_dpi_ip_params_st dcn3_16_soc;
>> +extern struct _vcs_dpi_soc_bounding_box_st dcn3_16_soc;
>>   
>>   struct dcn316_resource_pool {
>>   	struct resource_pool base;
