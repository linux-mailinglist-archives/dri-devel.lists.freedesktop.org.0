Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65768549EFF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B481F10F8C1;
	Mon, 13 Jun 2022 20:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1671510F8C1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 20:27:04 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-fb6b4da1dfso9933902fac.4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 13:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gtpBcwBcEaPEli5qXI5uOR4Vujusoou4n3Boc09Uuo8=;
 b=HPM+iA7zEvenwkrKizP0QnKRAZQqxf4ZGQase5BtVczogJtzJXfBH4oAdOjDukW6uj
 3kyFjMjCjXvfz8K6nzKoz44yo3jw124xQK5DbIrg7ug+Ua7JQFtK6/L5XQucHZNsbSeJ
 GL137O1ha++TOdRtWNE3L9nqaI62WLX4huRxANHcVVVSDh6P0SgMog4tDxXpfh/+ziCh
 jjWiFqt1AcSUiYBcC213cUSrElEH95fcFaXf+KMbFaZBsi3I5Z91RBiGlKlYGuU/L+Gz
 eSCtXmx8hI6XxW/F5k3URaFPU3cdX/i954xooAETEs2c39WzIWQAaYqRjIAKn3rL19KS
 00zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gtpBcwBcEaPEli5qXI5uOR4Vujusoou4n3Boc09Uuo8=;
 b=kXtVWaAbx0iv/tmxyNC2bQrIgSeDw4p//7/FxFpzgIZhshvmbcWmDBcD3nDHf7izvN
 flDUaFYtw2QHGiB44U1dt7o0LTjGWW9IXpkW+y9sBCV0E996N8Mw1aVTkmYPqH2FXNkW
 cTS8m8ItWRKezCTum7yLEnIDWmPzUih7c/X1xwkhRjbMA/tWREvAC164Fiy7xS739HWo
 prd80mn76yE5FJXrWiKfepPeMfF4gWE35cp9yAxoeLmT625AyusLA2rEnZzv9BnS3AW2
 nmpJmHCyuOx9DN0yTnkJpfrvEfEWqUxaQHmCB0wxWxTMWxBPrHa3+Xil1q5kPNQ5ntTi
 IqSg==
X-Gm-Message-State: AJIora9ysqAFHFWl2KYFYlQKGp/msRl+KBZbpM+ks7uY4dV3VES+K0rv
 q90CpIFg6dnfnMVLcaYBofo=
X-Google-Smtp-Source: AGRyM1tQXP09EH8xbPDbFUlTMVuJPbUnGclSqCT9mGpTVNaXiwQgj+N7sIeNdX9hupyivzzeZP3M4A==
X-Received: by 2002:a05:6870:4585:b0:fb:5105:76b8 with SMTP id
 y5-20020a056870458500b000fb510576b8mr339572oao.92.1655152023218; 
 Mon, 13 Jun 2022 13:27:03 -0700 (PDT)
Received: from ?IPV6:2804:431:c7f5:a472:4c3:87f9:70d2:df2e?
 ([2804:431:c7f5:a472:4c3:87f9:70d2:df2e])
 by smtp.gmail.com with ESMTPSA id
 dt22-20020a0568705a9600b000f349108868sm4428084oab.44.2022.06.13.13.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 13:27:02 -0700 (PDT)
Message-ID: <5ac8ef6f-a9e8-67a9-3055-3015f161bf0b@gmail.com>
Date: Mon, 13 Jun 2022 17:26:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 0/9] Add new formats support to vkms
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220613095202.sxlbt7aot5hid6e2@mail.igalia.com>
From: Igor Torrente <igormtorrente@gmail.com>
In-Reply-To: <20220613095202.sxlbt7aot5hid6e2@mail.igalia.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 tales.aparecida@gmail.com, leandro.ribeiro@collabora.com,
 melissa.srw@gmail.com, ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Melissa,

On 6/13/22 06:52, Melissa Wen wrote:
> On 04/04, Igor Torrente wrote:
>> Summary
>> =======
>> This series of patches refactor some vkms components in order to introduce
>> new formats to the planes and writeback connector.
>>
>> Now in the blend function, the plane's pixels are converted to ARGB16161616
>> and then blended together.
>>
>> The CRC is calculated based on the ARGB1616161616 buffer. And if required,
>> this buffer is copied/converted to the writeback buffer format.
>>
>> And to handle the pixel conversion, new functions were added to convert
>> from a specific format to ARGB16161616 (the reciprocal is also true).
>>
>> Tests
>> =====
>> This patch series was tested using the following igt tests:
>> -t ".*kms_plane.*"
>> -t ".*kms_writeback.*"
>> -t ".*kms_cursor_crc*"
>> -t ".*kms_flip.*"
>>
>> New tests passing
>> -------------------
>> - pipe-A-cursor-size-change
>> - pipe-A-cursor-alpha-transparent
>>
>> Performance
>> -----------
>> It's running slightly faster than the current implementation.
>>
>> Results running the IGT[1] test
>> `igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen` ten times:
>>
>> |                  Frametime                   |
>> |:--------------------------------------------:|
>> |  Implementation |  Current  |   This commit  |
>> |:---------------:|:---------:|:--------------:|
>> | frametime range |  9~22 ms  |     10~22 ms   |
>> |     Average     |  11.4 ms  |     12.32 ms   |
>>
>> Memory consumption
>> ==================
>> It consumes less memory than the current implementation in
>> the common case (more detail in the commit message).
>>
>> | Memory consumption (output dimensions) |
>> |:--------------------------------------:|
>> |       Current      |     This patch    |
>> |:------------------:|:-----------------:|
>> |   Width * Heigth   |     2 * Width     |
>>
>> [1] IGT commit id: bc3f6833a12221a46659535dac06ebb312490eb4
>>
>> XRGB to ARGB behavior
>> =====================
>> During the development, I decided to always fill the alpha channel of
>> the output pixel whenever the conversion from a format without an alpha
>> channel to ARGB16161616 is necessary. Therefore, I ignore the value
>> received from the XRGB and overwrite the value with 0xFFFF.
>>
>> Primary plane and CRTC size
>> ===========================
>> This patch series reworks the blend function to accept a primary plane with
>> a different size and position from CRTC.
>> Because now we need to fill the background, we had a loss in
>> performance with this change
>>
>> ---
> Hi Igor,
> 
> Thanks for this effort.
> 
>> Igor Torrente (9):
>>    drm: vkms: Alloc the compose frame using vzalloc
> 
> As this first patch fixes an error on vkms, I cherry-picked it and
> applied to drm-misc-next.

Oh right. I will skip it then!

Best Regards,
---
Igor Torrente

> 
> For remaining patches, looking forward the next version addressing
> feedback and rebasing them too.
> 
> Best Regards,
> 
> Melissa
> 
>>    drm: vkms: Replace hardcoded value of `vkms_composer.map` to
>>      DRM_FORMAT_MAX_PLANES
>>    drm: vkms: Rename `vkms_composer` to `vkms_frame_info`
>>    drm: drm_atomic_helper: Add a new helper to deal with the writeback
>>      connector validation
>>    drm: vkms: Add fb information to `vkms_writeback_job`
>>    drm: vkms: Refactor the plane composer to accept new formats
>>    drm: vkms: Supports to the case where primary plane doesn't match the
>>      CRTC
>>    drm: vkms: Adds XRGB_16161616 and ARGB_1616161616 formats
>>    drm: vkms: Add support to the RGB565 format
>>
>>   Documentation/gpu/vkms.rst            |  13 +-
>>   drivers/gpu/drm/drm_atomic_helper.c   |  39 ++++
>>   drivers/gpu/drm/vkms/Makefile         |   1 +
>>   drivers/gpu/drm/vkms/vkms_composer.c  | 325 ++++++++++++--------------
>>   drivers/gpu/drm/vkms/vkms_crtc.c      |   4 +
>>   drivers/gpu/drm/vkms/vkms_drv.h       |  41 +++-
>>   drivers/gpu/drm/vkms/vkms_formats.c   | 298 +++++++++++++++++++++++
>>   drivers/gpu/drm/vkms/vkms_formats.h   |  12 +
>>   drivers/gpu/drm/vkms/vkms_plane.c     |  50 ++--
>>   drivers/gpu/drm/vkms/vkms_writeback.c |  35 ++-
>>   include/drm/drm_atomic_helper.h       |   3 +
>>   11 files changed, 596 insertions(+), 225 deletions(-)
>>   create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
>>   create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
>>
>> -- 
>> 2.30.2
>>
