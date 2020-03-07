Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA8D17CDF4
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 13:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE8E6E13A;
	Sat,  7 Mar 2020 12:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BD06E13A
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2020 12:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583582620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cUukN5YqJY/S454IY2OKTFidd3uQ3MfuvVzq3/Fu8So=;
 b=ExYcPmSK+xJOJgTk/oADlwiVxgIDzdh1jOrnT4DWiqf6E6y0KFVqUsZkABuJZLBtQvr3U2
 lyzstSN3tnqmEVN9LTuu2UNHH88vY0aQjT/D+kXa6RGOAsY/8ilyL2TWJ6m6aceH5QHYC7
 T4Vv0zVsCVBfXFdct0d2H1EVm+9wYko=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-z4idD_zFP0y5_fmoiUOBEA-1; Sat, 07 Mar 2020 07:03:37 -0500
X-MC-Unique: z4idD_zFP0y5_fmoiUOBEA-1
Received: by mail-wr1-f70.google.com with SMTP id b11so92015wru.21
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2020 04:03:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cUukN5YqJY/S454IY2OKTFidd3uQ3MfuvVzq3/Fu8So=;
 b=rabSim8KH2L2rUFnlDtlR/6J3WM1ItUN9ZJZGGg6+RaPwfd6/5UpxnCbL4IKhQVKu1
 cghB6hyUxWdTegzoLveplURs1DbT/0iQn3mqgTv+jgDPCf9BZA/eOzEgt7wtF30goX3I
 YHNSKmHktq1PYo55zI/Iorjj0B04+2nDzVYQEsQUfg5blhFInIbe1AnJx402Lnmk43wC
 T4Qsd2qKXKwC2Gk0HIfhdRpXViu1U0cs8xNDyHlx3jJoQqZQ9mvHECmtUSkpCVtRxHPl
 Te0U/RkCyBQV6YXfwpRWV3B2xX1AXLbM2dEXjf+hrFpgs4xjNV7pbqABIohzP1y87ehq
 r0lA==
X-Gm-Message-State: ANhLgQ2xejemumcOn5KBS1RoRpHNv1M4LtSqM4KJGy2cqVFuuFzRDMmL
 NEEqsDS/EUtJ8YeLRml2uuhixtOnIElx+EMASspTTXAcOCdokoqU00eyVbw0t1ELkYloyBiRCP7
 qxen3LLbOQoG9CTNmPe3w2c8ajjz2
X-Received: by 2002:adf:f5cb:: with SMTP id k11mr2854990wrp.214.1583582615457; 
 Sat, 07 Mar 2020 04:03:35 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtzB8xe/uIZ14rpqcoUTPZsdHikyLwdsuXPODIXDnw8js25x5XEh+do1YNn/zatTaheRRd75g==
X-Received: by 2002:adf:f5cb:: with SMTP id k11mr2854975wrp.214.1583582615201; 
 Sat, 07 Mar 2020 04:03:35 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id m3sm33958379wrx.9.2020.03.07.04.03.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Mar 2020 04:03:34 -0800 (PST)
Subject: Re: [PATCH][next] drm/vboxvideo/vboxvideo.h: Replace zero-length
 array with flexible-array member
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200305105558.GA19124@embeddedor>
 <8e2ab9a2-fb47-1d61-d09c-0510ad5ee5ff@redhat.com>
 <20200306104118.GV2363188@phenom.ffwll.local>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <2bc072ea-9e18-2d2c-8427-80a721f8750e@redhat.com>
Date: Sat, 7 Mar 2020 13:03:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306104118.GV2363188@phenom.ffwll.local>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/6/20 11:41 AM, Daniel Vetter wrote:
> On Thu, Mar 05, 2020 at 03:22:38PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 3/5/20 11:55 AM, Gustavo A. R. Silva wrote:
>>> The current codebase makes use of the zero-length array language
>>> extension to the C90 standard, but the preferred mechanism to declare
>>> variable-length types such as these ones is a flexible array member[1][2],
>>> introduced in C99:
>>>
>>> struct foo {
>>>           int stuff;
>>>           struct boo array[];
>>> };
>>>
>>> By making use of the mechanism above, we will get a compiler warning
>>> in case the flexible array does not occur last in the structure, which
>>> will help us prevent some kind of undefined behavior bugs from being
>>> inadvertently introduced[3] to the codebase from now on.
>>>
>>> Also, notice that, dynamic memory allocations won't be affected by
>>> this change:
>>>
>>> "Flexible array members have incomplete type, and so the sizeof operator
>>> may not be applied. As a quirk of the original implementation of
>>> zero-length arrays, sizeof evaluates to zero."[1]
>>>
>>> This issue was found with the help of Coccinelle.
>>>
>>> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
>>> [2] https://github.com/KSPP/linux/issues/21
>>> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>>>
>>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>>
>> Patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> You're also going to push this? r-b by maintainers without any hint to
> what's going to happen is always rather confusing.

I've pushed this now, sorry for the confusion I will be more
clear about my intentions next time.

Regards,

Hans



>>> ---
>>>    drivers/gpu/drm/vboxvideo/vboxvideo.h | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/vboxvideo/vboxvideo.h b/drivers/gpu/drm/vboxvideo/vboxvideo.h
>>> index 0592004f71aa..a5de40fe1a76 100644
>>> --- a/drivers/gpu/drm/vboxvideo/vboxvideo.h
>>> +++ b/drivers/gpu/drm/vboxvideo/vboxvideo.h
>>> @@ -138,7 +138,7 @@ struct vbva_buffer {
>>>    	u32 data_len;
>>>    	/* variable size for the rest of the vbva_buffer area in VRAM. */
>>> -	u8 data[0];
>>> +	u8 data[];
>>>    } __packed;
>>>    #define VBVA_MAX_RECORD_SIZE (128 * 1024 * 1024)
>>>
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
