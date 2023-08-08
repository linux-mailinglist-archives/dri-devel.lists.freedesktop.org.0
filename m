Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE2E7735B8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 03:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC0710E0A7;
	Tue,  8 Aug 2023 01:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC74E10E0A7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 01:09:46 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b9c55e0fbeso79134651fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 18:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691456985; x=1692061785;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=v2WiY/PzP9OftvDaO3xHFVNVzeJ+Fqlc1tMWxnRjBio=;
 b=cmY1VXYYDvgBrNS0ePJ/h1unT4zBVo+iHRO4Zqn6aUJDy9DkjofkrsyxPZ0fl6cBy4
 WEo+IoqC6vwYzCl+h9ctqs3SNpGd9Mr4QrYHXlGHJi0QWwPu1nb1TPJlz2AIAf6YvtW8
 VgPBEMBfJNi95bnYH4nlUKd4E/sL4W8z6ud5/r5bJZfA+S1PyiCBzDGLQz0mD7rkw7yC
 XlZH6Oaa64FxW0Yc53x7wQ7vvhlMtiQBm9lqLE1dp1mhDpdfbno9dFN+nihAm9rcuZqO
 wn6lP8qoCc7QpcRawYypJqLgjlbtXhySQNjComM0l7Tkt7d6h/ECjM/Y0IpmlmyplvPs
 8OIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691456985; x=1692061785;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v2WiY/PzP9OftvDaO3xHFVNVzeJ+Fqlc1tMWxnRjBio=;
 b=hPJeEqoKau/UZQfYpFtA8EyefLNrIuD+fL62iNBPb3EGozN5F9SlFjhTTMrJpbpbDu
 i1g/OqKbaCc6wFEJqhZMWroeTSREQ8ngwDJl4jOhlmNBwHqYY/oa0KWHIO7XIIYLdNVz
 0k6ZgqwroR3KAB+zio9FeGvZiyS5CXraInQl/NFLShTPLTdq5DmfxZO5HYtmF+AuVZ1E
 i3UaWEk0XHQxhFPkJKi6sNIUn9THH7DFpOBgOO5TN0UVevkmX5MmC6lZM/bb2c24rXW3
 Y3JgGun2MqrqTJX5+qG1Aaezi+ctPUIrgqBF1u46I2zS00INIjSx9vfM+EQ5jqZap2XH
 /Txw==
X-Gm-Message-State: AOJu0Yy7t5M6/PUXlzdbOuHgwAZebB1eWT59Cc0OwkXMWUDqeSVwQdrB
 G/c0eP6ZCFP75nM2aOwcd+YAgw==
X-Google-Smtp-Source: AGHT+IHKBoy/zGIM1wWqpDA+354JQ4m54OuqBkue/PE1tVhQR9xt8m8ahsiVGv7yY6sehZwIf/fuwQ==
X-Received: by 2002:ac2:58f1:0:b0:4fe:1f1c:184f with SMTP id
 v17-20020ac258f1000000b004fe1f1c184fmr7250618lfo.44.1691456984821; 
 Mon, 07 Aug 2023 18:09:44 -0700 (PDT)
Received: from [127.0.0.1] ([188.162.64.78]) by smtp.gmail.com with ESMTPSA id
 eq6-20020a056512488600b004fb7cd9651bsm1681427lfb.98.2023.08.07.18.09.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Aug 2023 18:09:44 -0700 (PDT)
Date: Tue, 08 Aug 2023 04:07:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH RFC v5 02/10] drm: Introduce solid fill DRM plane property
User-Agent: K-9 Mail for Android
In-Reply-To: <26b4bb91-8786-c7cf-a821-eb2b881a42ab@quicinc.com>
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-2-053dbefa909c@quicinc.com>
 <CAA8EJpq=pbDoYc9wqKKrX+RahXp8zWTPFqVqA=S-0TkWXXJUjQ@mail.gmail.com>
 <26b4bb91-8786-c7cf-a821-eb2b881a42ab@quicinc.com>
Message-ID: <656526F6-C123-4A5A-9E62-6ED092474113@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 sebastian.wick@redhat.com, ppaalanen@gmail.com,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 laurent.pinchart@ideasonboard.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8 August 2023 00:41:07 GMT+03:00, Jessica Zhang <quic_jesszhan@quicinc=
=2Ecom> wrote:
>
>
>On 8/4/2023 6:27 AM, Dmitry Baryshkov wrote:
>> On Fri, 28 Jul 2023 at 20:03, Jessica Zhang <quic_jesszhan@quicinc=2Eco=
m> wrote:
>>>=20
>>> Document and add support for solid_fill property to drm_plane=2E In
>>> addition, add support for setting and getting the values for solid_fil=
l=2E
>>>=20
>>> To enable solid fill planes, userspace must assign a property blob to
>>> the "solid_fill" plane property containing the following information:
>>>=20
>>> struct drm_mode_solid_fill {
>>>          u32 version;
>>>          u32 r, g, b;
>>> };
>>>=20
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc=2Ecom>
>>> ---
>>>   drivers/gpu/drm/drm_atomic_state_helper=2Ec |  9 +++++
>>>   drivers/gpu/drm/drm_atomic_uapi=2Ec         | 55 +++++++++++++++++++=
++++++++++++
>>>   drivers/gpu/drm/drm_blend=2Ec               | 30 +++++++++++++++++
>>>   include/drm/drm_blend=2Eh                   |  1 +
>>>   include/drm/drm_plane=2Eh                   | 35 +++++++++++++++++++=
+
>>>   include/uapi/drm/drm_mode=2Eh               | 24 ++++++++++++++
>>>   6 files changed, 154 insertions(+)
>>>=20
>>=20
>> [skipped most of the patch]
>>=20
>>> diff --git a/include/uapi/drm/drm_mode=2Eh b/include/uapi/drm/drm_mode=
=2Eh
>>> index 43691058d28f=2E=2E53c8efa5ad7f 100644
>>> --- a/include/uapi/drm/drm_mode=2Eh
>>> +++ b/include/uapi/drm/drm_mode=2Eh
>>> @@ -259,6 +259,30 @@ struct drm_mode_modeinfo {
>>>          char name[DRM_DISPLAY_MODE_LEN];
>>>   };
>>>=20
>>> +/**
>>> + * struct drm_mode_solid_fill - User info for solid fill planes
>>> + *
>>> + * This is the userspace API solid fill information structure=2E
>>> + *
>>> + * Userspace can enable solid fill planes by assigning the plane "sol=
id_fill"
>>> + * property to a blob containing a single drm_mode_solid_fill struct =
populated with an RGB323232
>>> + * color and setting the pixel source to "SOLID_FILL"=2E
>>> + *
>>> + * For information on the plane property, see drm_plane_create_solid_=
fill_property()
>>> + *
>>> + * @version: Version of the blob=2E Currently, there is only support =
for version =3D=3D 1
>>> + * @r: Red color value of single pixel
>>> + * @g: Green color value of single pixel
>>> + * @b: Blue color value of single pixel
>>> + */
>>> +struct drm_mode_solid_fill {
>>> +       __u32 version;
>>> +       __u32 r;
>>> +       __u32 g;
>>> +       __u32 b;
>>=20
>> Another thought about the drm_mode_solid_fill uABI=2E I still think we
>> should add alpha here=2E The reason is the following:
>>=20
>> It is true that we have  drm_plane_state::alpha and the plane's
>> "alpha" property=2E However it is documented as "the plane-wide opacity
>> [=2E=2E=2E] It can be combined with pixel alpha=2E The pixel values in =
the
>> framebuffers are expected to not be pre-multiplied by the global alpha
>> associated to the plane=2E"=2E
>>=20
>> I can imagine a use case, when a user might want to enable plane-wide
>> opacity, set "pixel blend mode" to "Coverage" and then switch between
>> partially opaque framebuffer and partially opaque solid-fill without
>> touching the plane's alpha value=2E
>
>Hi Dmitry,
>
>I don't really agree that adding a solid fill alpha would be a good idea=
=2E Since the intent behind solid fill is to have a single color for the en=
tire plane, I think it makes more sense to have solid fill rely on the glob=
al plane alpha=2E
>
>As stated in earlier discussions, I think having both a solid_fill=2Ealph=
a and a plane_state=2Ealpha would be redundant and serve to confuse the use=
r as to which one to set=2E

That depends on the blending mode: in Coverage mode one has independent pl=
ane and contents alpha values=2E And I consider alpha value to be a part of=
 the colour in the rgba/bgra modes=2E


>
>Thanks,
>
>Jessica Zhang
>
>>=20
>> --=20
>> With best wishes
>> Dmitry

--=20
With best wishes
Dmitry
