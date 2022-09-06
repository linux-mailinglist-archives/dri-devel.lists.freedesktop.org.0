Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CA95AF875
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 01:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7440710E02D;
	Tue,  6 Sep 2022 23:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C7310E013
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 23:36:07 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-127ba06d03fso8491398fac.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 16:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=7fI7GSQEqzfTbxrtg0p1r0owGwfzmjJSW9DpLrWCgIc=;
 b=d9TLgsDmvl68FCD/rIKT+9o+eHronhkechLJbLPFu0/PmQ2az8Yi+kDsA2+lJReMRj
 7wI3BCJGIvDKg3YsvpdhbBtQP4r9PIl5YohE1C6cO7Y0SNNurt+6o7QGugTfNzvhHcxr
 bRxbKNfSozmNHBJLbkvXkwuDfSQ5Wa+QX2N6cGNLs5NTRozcTQ5UDnwFBbcd4a/tJ9Gk
 E5osJPfJJUbVDHVZsxQRsDl42IwvvNH0Nmm+7VsHAuJt4BiHELS3S/T+jHhyltYOL6wp
 6HeEQDWSyuxj1n/rB3o/Jhyfb7iSOd1pnZQFG5H4L/fjLo9AfWfvgmzfTFHUUMIRJZWa
 heBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=7fI7GSQEqzfTbxrtg0p1r0owGwfzmjJSW9DpLrWCgIc=;
 b=l/axehUusoRnXOizzJnr2H+eC3l/pE641zkA9sd3vDsorBQStbS/MKzKB0W9+8sWnu
 yWVTzZw8/w7EwvuNYoUJwqO7oaLCTEXSxhINK1ihLNTPen+9GY9O7TGXG4veV5dKINyp
 RgmeakqCBorhJAIusyq1N0aIBt7fvvbwkyOVLVBMw9YlTG7gq56N0XQiyGUJOi5EZVjj
 eU9SWLwPZWZ16R8JrwkJriUSgKGoWF3JwldzHjtRJ3HRCaC+T0GgYxEg2VXQlZKgYix5
 hJLvFva+8RUbNaroZpSQh3XMC9C9fT2ZmdCZRlJfAAsBa8DrzocK7Lr4E0CHy3TG2S6j
 I+RA==
X-Gm-Message-State: ACgBeo3TF1CeqsayuxI47UHBNhUZno4ytuhLCxN6a7NvSuoKU3NGsdMi
 RR7p1NPmuZshCzAAeroLeHmAglsROx4=
X-Google-Smtp-Source: AA6agR7zZb77ZwaCfAlECdF3kNlSriboTt5SSacEBTaPERsG+TCNe0XQVOt1ni6Y2tZrTzaz5UGcag==
X-Received: by 2002:a05:6808:1389:b0:345:fde:79eb with SMTP id
 c9-20020a056808138900b003450fde79ebmr10790885oiw.21.1662507366364; 
 Tue, 06 Sep 2022 16:36:06 -0700 (PDT)
Received: from ?IPV6:2804:431:c7f5:f684:ee06:25a5:3122:5cd3?
 ([2804:431:c7f5:f684:ee06:25a5:3122:5cd3])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a9d3782000000b00639443424f8sm6405852otb.8.2022.09.06.16.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 16:36:05 -0700 (PDT)
Message-ID: <8e4350df-0c73-6ca2-a25f-28a40a1856db@gmail.com>
Date: Tue, 6 Sep 2022 20:35:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: build failure of next-20220906 due to 396369d67549 ("drm: vkms:
 Add support to the RGB565 format")
Content-Language: en-US
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
References: <YxducgSzR6/zyHD7@debian>
 <CADVatmNfc1YT02v5-FaMoGN==MOx5ZJ=o8YMQAH19Gvf91betA@mail.gmail.com>
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
In-Reply-To: <CADVatmNfc1YT02v5-FaMoGN==MOx5ZJ=o8YMQAH19Gvf91betA@mail.gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-next <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/6/22 18:26, Sudip Mukherjee wrote:
> On Tue, Sep 6, 2022 at 4:59 PM Sudip Mukherjee (Codethink)
> <sudipm.mukherjee@gmail.com> wrote:
>>
>> Hi All,
>>
>> The builds of next-20220906 fails for mips, xtensa and arm allmodconfig.
>>
>> The errors in mips and xtensa are:
>>
>> ERROR: modpost: "__divdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
>> ERROR: modpost: "__udivdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
>>
>> The error in arm is:
>>
>> ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/vkms/vkms.ko] undefined!
>> ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/vkms/vkms.ko] undefined!
>>
>>
>> Trying to do a git bisect to find out the offending commit.
> 
> git bisect points to 396369d67549 ("drm: vkms: Add support to the
> RGB565 format")

Are these architectures incapable of doing 64bits int division?

> 
> 

