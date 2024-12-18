Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 886C39F6548
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 12:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC5310EB7B;
	Wed, 18 Dec 2024 11:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NoDx4MlO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6B810EB7B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 11:49:07 +0000 (UTC)
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi
 [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EE3359D;
 Wed, 18 Dec 2024 12:48:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1734522507;
 bh=6gooqBsR7+L5GfB2gqUJbCX4jcBA2Znu6P1JHxNTee4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NoDx4MlOekXSzaY/4ZDSNuUtpWIpQ+L5lO2/GRJuvlOtjQqtjiDJ+dAEaV01RP+fS
 5ujJXjqHTq7J+bCzdJ/WpGN8LqOrffwnPvNzPMxIYyE8NKcIMRWEMehN5TDzgN0xe4
 OybQqLEbjf3H0bzCaB/XtgUS4ZMi56saWFzQVUOA=
Message-ID: <02da12fe-4d94-4a40-86b6-6dad28588843@ideasonboard.com>
Date: Wed, 18 Dec 2024 13:49:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] drm/fourcc: Add warning for bad bpp
To: "Sagar, Vishal" <vishal.sagar@amd.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Simek, Michal" <michal.simek@amd.com>
References: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
 <20241204-xilinx-formats-v1-1-0bf2c5147db1@ideasonboard.com>
 <BL1PR12MB596954886CC5E28EC8E735BA9C372@BL1PR12MB5969.namprd12.prod.outlook.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <BL1PR12MB596954886CC5E28EC8E735BA9C372@BL1PR12MB5969.namprd12.prod.outlook.com>
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

Hi Vishal,

On 04/12/2024 18:26, Sagar, Vishal wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Tomi,
> 
> Thanks for the patch.
> 
>> -----Original Message-----
>> From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Sent: Wednesday, December 4, 2024 10:31 AM
>> To: Sagar, Vishal <vishal.sagar@amd.com>; Klymenko, Anatoliy
>> <Anatoliy.Klymenko@amd.com>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
>> Thomas Zimmermann <tzimmermann@suse.de>; David Airlie
>> <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com>; Simek, Michal <michal.simek@amd.com>
>> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Subject: [PATCH 01/10] drm/fourcc: Add warning for bad bpp
>>
>> drm_format_info_bpp() cannot be used for formats which do not have an
>> integer bits-per-pixel. Handle wrong calls by printing a warning and
>> returning 0.
> 
> It would be good to add an example of pixel format that may cause this issue.

Indeed, the description is perhaps a bit lacking. I'll change it to:

drm_format_info_bpp() cannot be used for formats which do not have an
integer bits-per-pixel in a pixel block.

E.g. DRM_FORMAT_XV15's (not yet in upstream) plane 0 has three 10-bit 
pixels (Y components), and two padding bits, in a 4 byte block. That is 
10.666... bits per pixel when considering the whole 4 byte block, which 
is what drm_format_info_bpp() does. Thus a driver that supports such 
formats cannot use drm_format_info_bpp(),

It is a driver bug if this happens, but so handle wrong calls by 
printing a warning and returning 0.

  Tomi

>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/drm_fourcc.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
>> index 193cf8ed7912..e84c4ed6928c 100644
>> --- a/drivers/gpu/drm/drm_fourcc.c
>> +++ b/drivers/gpu/drm/drm_fourcc.c
>> @@ -429,6 +429,13 @@ unsigned int drm_format_info_bpp(const struct
>> drm_format_info *info, int plane)
>>        if (!info || plane < 0 || plane >= info->num_planes)
>>                return 0;
>>
>> +     if (info->char_per_block[plane] * 8 %
>> +         (drm_format_info_block_width(info, plane) *
>> +          drm_format_info_block_height(info, plane))) {
>> +             pr_warn("unable to return an integer bpp\n");
>> +             return 0;
>> +     }
>> +
>>        return info->char_per_block[plane] * 8 /
>>               (drm_format_info_block_width(info, plane) *
>>                drm_format_info_block_height(info, plane));
>>
>> --
>> 2.43.0
> 
> Regards
> Vishal Sagar

