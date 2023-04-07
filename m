Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7440E6DA7D9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 04:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358F410E227;
	Fri,  7 Apr 2023 02:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C29710E2AD
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 02:57:37 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id a11so42458525lji.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 19:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680836255;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g0F4oiLkijYrhTD6GuHvT418JGo8rv9l6KH9KGjO6BI=;
 b=VX9VJMVYbdSwv/hQpnoko8/0+p6YXYnni/dqJ8I/uNdnjvaJfZFt0jFVnT3jmm+Ls1
 UCQrw6YLECs+Ia3TDAdYosXJj0BpLhwg+YQyx4r7TjmJpRJhjccCRYv6bOFCD2Nx6RN1
 NEpeIi5Z/Xz30kn4cGXyMxZrgoktITQzjMJkuEaaxc5aaQiujPRT14ZG/T7jjhev9uxe
 2XaGIjtP0OmM+leGoVF5YWfwwMzn7cXUXscXIVflIBgxJ0t49gglASeHVSW1kpkgdpfw
 QreYbNXR/pH6IcFvTk3LH0zm0/eimaoxKyD6sYSbasXqUvK7Rqh42RfVZecai3TSdPuE
 xWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680836255;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g0F4oiLkijYrhTD6GuHvT418JGo8rv9l6KH9KGjO6BI=;
 b=cEZueG+d8AtBRrt17XTC3JMOP0yS15r9e4VEN5ZHl4XGqrBVhBC0r1szHvy8KqImJi
 7pclzmSo/rXkjo/e38rkj+yakXPN8+2DAWp15DN8mHHXkqKy/wnvvG823YFTzNwpI3jz
 1wEwXR1GvxwswzKPDmTCOkaYeGlMr8X1G8+XRgMaoYIQEI7M+4ALprsyphcrcpmG3jTx
 R0dELePK9M7sVYxVeG59lwMXzukRbUX/MGcoDAGRmlz/77dWPbqg7IbMjbGBVbP03eOa
 yx053z/orV7cQ0xzrAzM+DVL3vAEay2daRuooKXLJ5R4PdNFlkn4OEvQg4U0KJDj4W5z
 LrLw==
X-Gm-Message-State: AAQBX9d72sHnSRbTDAeO6PDgRmEB9PWVZCbCf/tdYFZnMzPy/kkWJgU9
 ZLfNJwblASH+CVjwhI6WyivkRw==
X-Google-Smtp-Source: AKy350ZZVZqn4xs0cfPBNaU1gaGbr94MuY1Feh/ngQImLhzo1Ag8Xx7iokDDR0n2G9ilnTGr2+3XpQ==
X-Received: by 2002:a2e:6a16:0:b0:299:ac49:46da with SMTP id
 f22-20020a2e6a16000000b00299ac4946damr211580ljc.42.1680836254793; 
 Thu, 06 Apr 2023 19:57:34 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a2ea418000000b0029bd4365c95sm569471ljn.87.2023.04.06.19.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 19:57:34 -0700 (PDT)
Message-ID: <e4fbeb9d-25f6-fe19-99ee-fa4f8a689535@linaro.org>
Date: Fri, 7 Apr 2023 05:57:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/7] Enable YCbCr420 format for VDSC
Content-Language: en-GB
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
 <87ttyvbhuz.fsf@intel.com>
 <SN7PR11MB6750FDE3318A85E0A2541831E3889@SN7PR11MB6750.namprd11.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <SN7PR11MB6750FDE3318A85E0A2541831E3889@SN7PR11MB6750.namprd11.prod.outlook.com>
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
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Shankar,
 Uma" <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Suraj

On 28/03/2023 16:20, Kandpal, Suraj wrote:
> 
> 
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Jani
>> Nikula
>> Sent: Wednesday, March 8, 2023 5:00 PM
>> To: Kandpal, Suraj <suraj.kandpal@intel.com>; dri-
>> devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>; Nautiyal, Ankit K
>> <ankit.k.nautiyal@intel.com>; Shankar, Uma <uma.shankar@intel.com>;
>> Kandpal, Suraj <suraj.kandpal@intel.com>
>> Subject: Re: [PATCH 0/7] Enable YCbCr420 format for VDSC
>>
>> On Wed, 22 Feb 2023, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
>>> This patch series aims to enable the YCbCr420 format for DSC. Changes
>>> are mostly compute params related for hdmi,dp and dsi along with the
>>> addition of new rc_tables for native_420 and corresponding changes to
>>> macros used to fetch them.
>>> There have been discussions prior to this series in which some patches
>>> have gotten rb and can be found in the below link
>>> https://patchwork.freedesktop.org/series/113729
>>
>> I think it would be useful to get [1] from Dmitry merged to drm-misc-next
>> first, have that in drm-next, and again backmerged to drm-intel-next before
>> this. At least patches 1-5.
>>
>> There's not much point in all drivers duplicating the parameters, and we
>> need to move towards common code. Dmitry has been helpful in
>> contributing this to us.
>>
>> BR,
>> Jani.
>>
>>
> 
> Hi Jani,
> Maarten has acked the patch series to be merged through drm-intel and in the meantime
> I will work with Dmitry to pull the common code to avoid duplication

I wanted to check, are there any updates from your side regarding the 
series at [1] ?

> 
> Regards,
> Suraj Kandpal
> 
>> [1] https://patchwork.freedesktop.org/series/114473/



-- 
With best wishes
Dmitry

