Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4B969F9B2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 18:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7534B10EA53;
	Wed, 22 Feb 2023 17:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC7610E04E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 01:16:47 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso2104687pjv.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 17:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=51UaoPU/C0/KKF4ZFxyoQ4hLTKIyJZ32r01ujK1PNOs=;
 b=Yig2kknJSmcFfW97L8SV0DtDNp5GVM1Mwp5L8c6O0+W9I0n7upaXqnjasr9J0X1xSu
 OUE5Ol8Z5XCOEETOMzRbDaNauPP0KxjMNKKJQWjrxbJqfPUUAaoPLzow3TDfHApx3shX
 m6weGLE6Vsws8J094vsqHctjV/3sIp8NtcPCDtSqaD5nBZN0cRZntEweMzjwoxY60cEC
 zq9I46sJs2sPQMV7Xlr7fQN//tP4oYKvn72CP5JbYsee0EcQoX48EkjSSjW44Y5apLLO
 h8oN6muSCKFJu2ef/Oy6HpqnAqt6ZLifRWohiCW/qNKRVFlGT5t2uCakW/4gajqUJ7s+
 w6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=51UaoPU/C0/KKF4ZFxyoQ4hLTKIyJZ32r01ujK1PNOs=;
 b=uNbYBGD9VkJSL8JigaBX7BdI/XNBAx4Xm2cfDPcWAbLr/Kt3WsCw6c3gug+t/aJtru
 G14LzK3fkzIlMSoM9c/ANYCHvZB3gH06q8IQQU1NEWFCZvupuVV8aHhDDh+I4Dp7t3v9
 QgH4MhCdAKiFGdHDpIiCUBCmvAauY8BglCAkZMtUj3drLxqntPrVfa1ILIvgD5mtr6Bp
 yX+xwiF9wn56c7R/6hVLJjSrzIU/iSwGc18AhXqMlXdL7xRU6n4PtO9bLNnsRjZeeUKC
 DYEcllkSpKwP/NCu/1pWu72ZNR2fOFllVwVWq2em9jRFQftkfhf5Z5DBvVXLLtWoKsWe
 QZ3w==
X-Gm-Message-State: AO0yUKWuFptQLt9UqvrYSKzb5TKAafApBYWyTbE6D1sIi7F8/1kVbFPO
 NWxhUxdy2THpDZnr1UX+/Pg=
X-Google-Smtp-Source: AK7set8wykRs1U7+p7ntm5Q4aBh/+/Gvh0uXbKnasmubA2myc1B9A9dVm7ch2hTjzAAJReivMFQpRA==
X-Received: by 2002:a17:90b:4b0b:b0:233:bc73:a926 with SMTP id
 lx11-20020a17090b4b0b00b00233bc73a926mr5098300pjb.20.1676942206869; 
 Mon, 20 Feb 2023 17:16:46 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp.
 [106.167.171.201]) by smtp.gmail.com with ESMTPSA id
 gm24-20020a17090b101800b00232cc61e16bsm2153683pjb.35.2023.02.20.17.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 17:16:46 -0800 (PST)
Message-ID: <e2ca05a5-4d49-a1ce-6129-25c2f57d23c7@gmail.com>
Date: Tue, 21 Feb 2023 10:16:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] media: Fix building pdfdocs
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
References: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
 <Y+NnRvQ8X04tuurf@pendragon.ideasonboard.com>
 <20230208121750.1b4ac5cd@coco.lan>
 <a8a89876-8868-04c6-104b-6be1b6c628c4@ideasonboard.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <a8a89876-8868-04c6-104b-6be1b6c628c4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 22 Feb 2023 17:09:36 +0000
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
Cc: Akira Yokosawa <akiyks@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 9 Feb 2023 12:11:19 +0200, Tomi Valkeinen wrote:
> Hi Daniel, Dave,
>=20
> Could you pick this fix to drm-next? The offending commit is there, it =
was merged via Laurent's "[GIT PULL FOR v6.3] R-Car DU fixes and improvem=
ents".
>=20
> I can also push this to drm-misc-fixes, but the offending commit is not=
 there yet.

Hi,

I don't see this fix in next-20230220.

I'd really appreciate it if it could be upstreamed during the current
merge window.

Does anybody care to pick this up?

        Thanks, Akira

>=20
> =C2=A0Tomi
>=20
> On 08/02/2023 13:17, Mauro Carvalho Chehab wrote:
>> Em Wed, 8 Feb 2023 11:11:34 +0200
>> Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
>>
>>> Hi Tomi,
>>>
>>> Thank you for the patch.
>>>
>>> On Wed, Feb 08, 2023 at 10:29:16AM +0200, Tomi Valkeinen wrote:
>>>> Commit 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats") added
>>>> documatation for a few new RGB formats. For some reason these break =
the
>>>
>>> s/documatation/documentation/
>>>
>>>> pdfdocs build, even if the same style seems to work elsewhere in the=

>>>> file.
>>>>
>>>> Remove the trailing empty dash lines, which seems to fix the issue.
>>>>
>>>> Fixes: 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats")
>>>> Reported-by: Akira Yokosawa <akiyks@gmail.com>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
>>>
>>>> ---
>>>>
>>>> Note: the offending patch was merged via drm tree, so we may want to=

>>>> apply the fix to the drm tree also.
>>>
>>> Sounds good to me. Mauro, could you ack this patch ?
>>
>> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>>
>>>
>>>> =C2=A0 Documentation/userspace-api/media/v4l/pixfmt-rgb.rst | 3 ---
>>>> =C2=A0 1 file changed, 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/=
Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
>>>> index d330aeb4d3eb..ea545ed1aeaa 100644
>>>> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
>>>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
>>>> @@ -868,7 +868,6 @@ number of bits for each component.
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - r\ :sub:`4`
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - r\ :sub:`3`
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - r\ :sub:`2`
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * .. _V4L2-PIX-FMT-RGBA1010102:
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``V4L2_PIX_FMT_R=
GBA1010102``
>>>> @@ -909,7 +908,6 @@ number of bits for each component.
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - r\ :sub:`4`
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - r\ :sub:`3`
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - r\ :sub:`2`
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * .. _V4L2-PIX-FMT-ARGB2101010:
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``V4L2_PIX_FMT_A=
RGB2101010``
>>>> @@ -950,7 +948,6 @@ number of bits for each component.
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - r\ :sub:`6`
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - r\ :sub:`5`
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - r\ :sub:`4`
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
>>>> =C2=A0 =C2=A0 .. raw:: latex
>>>> =C2=A0=C2=A0=C2=A0=20
>>>
>>
>>
>>
>> Thanks,
>> Mauro
>=20
