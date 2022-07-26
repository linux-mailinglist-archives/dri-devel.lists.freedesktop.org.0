Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAC25812D1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 14:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CC71120F3;
	Tue, 26 Jul 2022 12:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9916113CEB;
 Tue, 26 Jul 2022 12:07:03 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-10d845dcf92so18234319fac.12; 
 Tue, 26 Jul 2022 05:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7T38UTPHaDYqfOXMWpYC5zzC9yjWJzkWI04Yg2JEH3c=;
 b=nPC11/34luiHEnb1tElXmYo/Fb76IC0BjQEzDU0JmRpe9j3i3ay2HVChCT0sDqPF9A
 LClxDfnuhb2jk1g2FNgGIKzFjDi9YhDU9KtGZYkx2Icm2hmpSO5/6nIMwOlxNb3WPePZ
 XpOlv3Rp+C/PorqSv5F2yhuCUB+ZCN+MdCyplkk2KXaGP0I5Cu0kpb2MHFqH5i9EvnS3
 RV6e+GJRXlnjOI4c6n1flbBoLVV8Z15+S5yI5iSNlgkLg28KKuwj7SS6a86PtM67tTZw
 1Oieb/QWqpR+2kX0mlHy3tosCEPTGdze3QGFMxtgO6WDMOKl3qvgsxVxjLSmXLeoYA6Y
 M/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7T38UTPHaDYqfOXMWpYC5zzC9yjWJzkWI04Yg2JEH3c=;
 b=kmN/pfFftJIfYRe5G5Jgi9Dipm6Mg3xNsNylHnTwX/875wONiEuC4hN6TS5gAy8T7N
 Y8Xr3+9iDlUcrLgIshh8oL+rzaFe7edMtB5w846SEgTQcsyg7LrOwkejQ2K3XMIpZvKg
 +7YYnUKUVjjrwteLJfOXDiH7Urj6YJZ93aBrqfLw+ZXIlXNgM7Q5gIgS4doDcKcsEXjB
 C/Dlgz824G1HMauh58v1XlEEI4XGgkTvZ02G1VAMQnrrsirSr4zQIMTw4yEgbYdUf7r0
 g8RYa2KXKym/lJRb+19uofh/uhiRCSS1KAXdB2bQnAW8gmYBM/tG0cscNnNRpYXByzeV
 d9yw==
X-Gm-Message-State: AJIora/CGF2OqO80nxp4nRfbuzpB94OeUMH/z/Z/pL4NmKqqv3Dz6kTB
 S7Y8s7l038BNIdNF2MWU8TA=
X-Google-Smtp-Source: AGRyM1vYmk1/vlAA7ySYkjL2JlboJAsT4TLAa+QChodCThP0tZk1joXUO2gfrVYmNHWMSjaykZOKPQ==
X-Received: by 2002:a05:6870:6087:b0:10b:aef4:db0a with SMTP id
 t7-20020a056870608700b0010baef4db0amr16070887oae.17.1658837222558; 
 Tue, 26 Jul 2022 05:07:02 -0700 (PDT)
Received: from ?IPV6:2804:14c:bbe3:4370:95da:f07f:e927:6958?
 ([2804:14c:bbe3:4370:95da:f07f:e927:6958])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a9d7756000000b0061c3246bd42sm6223803otl.44.2022.07.26.05.06.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 05:07:02 -0700 (PDT)
Message-ID: <88ce4703-e295-f41a-5905-d8afe5589f80@gmail.com>
Date: Tue, 26 Jul 2022 09:06:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] drm/amd/display: change variables type
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20220725181559.250030-1-magalilemes00@gmail.com>
 <a7589316-2a55-85f2-b665-5fe4bebf7a69@igalia.com>
 <4f359e30-90f8-c8bf-4e07-6856fcfd3506@gmail.com>
 <20220725233853.5y7wgpbhfau24ric@mail.igalia.com>
From: Magali Lemes <magalilemes00@gmail.com>
In-Reply-To: <20220725233853.5y7wgpbhfau24ric@mail.igalia.com>
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
Cc: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 siqueirajordao@riseup.net, mairacanal@riseup.net, sunpeng.li@amd.com,
 tales.aparecida@gmail.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 isabbasso@riseup.net, andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/25/22 20:38, Melissa Wen wrote:

> On 07/25, Magali Lemes wrote:
>> On 7/25/22 16:42, André Almeida wrote:
>>> Hi Magali,
>>>
>>> Às 15:15 de 25/07/22, Magali Lemes escreveu:
>>>> As "dcn3_15_soc" and "dcn3_16_soc" are of type "struct
>>>> _vcs_dpi_soc_bounding_box_st", change their types accordingly.
>>>>
>>> I can see that indeed this type change sense for those variables, but
>>> isn't a bit strange that the type was wrong in the first place? I wonder
>>> if this variable is even used, given that it would very likely throw a
>>> compiler error when using the wrong type and trying to access struct
>>> members that aren't defined.
>>
>> A compilation error would be thrown if either "dc/dcn315/dcn315_resource.h"
>> or "dc/dcn316/dcn316_resource.h" were included in the files where
>> "dcn3_15_soc" and "dcn3_16_soc" are initialized. Since they are not
>> included, the wrong variable type error is not shown.
>> To solve the sparse warning in the second patch of this series, those
>> variables need to be declared first, but they are already declared, we're
>> only missing the headers. If I only add the headers, then those variables
>> will be seen, and I get the expected incompatible variables types error. So,
>> fixing the types here is a preliminary work for the next patch.
>>
> Hi Magali,
>
> Thanks for inspecting it. What you say makes sense, but André pointed
> out something that makes sense to me too.
>
> As fas as I checked, dcn3_15_soc and dcn16_soc is not used outside their
> respective FPU files. Maybe the proper solution is removing those
> declarations (and make the struct static). Can you take a look at it?
>
> Best Regards,
>
> Melissa

Hi, Melissa. Thank you for the suggestion!
My sole reason not to make those structs static was to keep some sort of 
consistency with the rest of the dcn*_resource.h files, since that is 
where all the other structs are first declared. I'm not sure, though, if 
that's a good enough reason not to turn these variables into static. Let 
me know what you think.

Magali



> Magali
>
>
>>>> Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h | 2 +-
>>>>    drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h | 2 +-
>>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
>>>> index 39929fa67a51..45276317c057 100644
>>>> --- a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
>>>> +++ b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
>>>> @@ -32,7 +32,7 @@
>>>>    	container_of(pool, struct dcn315_resource_pool, base)
>>>>    extern struct _vcs_dpi_ip_params_st dcn3_15_ip;
>>>> -extern struct _vcs_dpi_ip_params_st dcn3_15_soc;
>>>> +extern struct _vcs_dpi_soc_bounding_box_st dcn3_15_soc;
>>>>    struct dcn315_resource_pool {
>>>>    	struct resource_pool base;
>>>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
>>>> index 0dc5a6c13ae7..d2234aac5449 100644
>>>> --- a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
>>>> +++ b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
>>>> @@ -32,7 +32,7 @@
>>>>    	container_of(pool, struct dcn316_resource_pool, base)
>>>>    extern struct _vcs_dpi_ip_params_st dcn3_16_ip;
>>>> -extern struct _vcs_dpi_ip_params_st dcn3_16_soc;
>>>> +extern struct _vcs_dpi_soc_bounding_box_st dcn3_16_soc;
>>>>    struct dcn316_resource_pool {
>>>>    	struct resource_pool base;
