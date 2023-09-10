Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701D7799CD4
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 08:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E749010E163;
	Sun, 10 Sep 2023 06:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D8410E163
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 06:38:08 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-6543d62e9a4so21172686d6.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Sep 2023 23:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694327887; x=1694932687; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vx6P4Pa1g3+8cdYnSyaC1WefwX5h9QaELTCPeaFbI9Q=;
 b=oedMJzP00hENfGnpR9mqGGjO9IzOlz29nfAWI9KD62daxL0H+4CuMnCTjiThcAO4CX
 K7rCFqo+60uW4thsUoMRq/kKSeVmStepTlVgRapzo2SRMJGj3UrZSOdOjw6AsWadEQtU
 TlFPnL2k/qvoiNuUzfCXeIKPW2BqX7VvsG8+LF+aFng8F/thpZSYO9Do74CbgabjO+Gy
 QqhXFw2uapF2bbLKZxB36Pdzy1tgzMJgLMMVsfhORWQ+8lT2aYEzy+yBE+ypFhkqRG2j
 jWxs45XQDebh7QP6e5u1t7dWA7Fx87pqON2vzZyZXaqBkppGPqp44E7NGeL2a+tZv7n3
 zIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694327887; x=1694932687;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vx6P4Pa1g3+8cdYnSyaC1WefwX5h9QaELTCPeaFbI9Q=;
 b=A3B5xJaoo1/KIh0zKQ5TWURzPPXN1Y1gaM3pz9rwVKfqNW0/DWrMWcVUKcQCTrW8Gb
 vXBQOgHHO+EQoW+wWB/djGHPH5PPpZfHkEgV/gKfAafMLES2kdncn5/0HNTGA3wDPbJb
 s+twlwgJ56hwF7nqaOvwCsSYYjF3p+He20D3BTW9vKwI9wjuCEgcA0jogcM3m2K6dJaX
 xZVEodJCq6I3rgoK8OeI3QuRSdhqKhtQxCHRhlciv0xaWBgEIn0hIVTkXXWlVzBectXv
 5X4nYLa7i4tRThIbar3jlzif+IxFDwE1hrF/xw+Z9hOOb8WVg5e1ULiTo8w5tWFa7KHU
 kplg==
X-Gm-Message-State: AOJu0YzC5MN+BPQzTTXSQXCNuOAjlTuBFJXnkCfGxUek7GxE7c8ianpU
 8LAmCS9p8MkUKNGypr5rR9zzJp09lnn8xQvRkTI=
X-Google-Smtp-Source: AGHT+IFgjzyYXAfTnAyTdMiLAYw6Ic1f0RlAdrsX6WgLa/Qgbqfm1yzMlcCTRYmng+l2iXxk2rr7uX0sNytkaEy0BWg=
X-Received: by 2002:a0c:f5d4:0:b0:63c:6af2:d26e with SMTP id
 q20-20020a0cf5d4000000b0063c6af2d26emr9310780qvm.6.1694327887613; Sat, 09 Sep
 2023 23:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230909110343.8103-1-bragathemanick0908@gmail.com>
 <ZP0-DaW3lIeaZ8xY@debian.me>
 <3ae5be2b-8075-5a4d-65c7-7282a44909f3@infradead.org>
In-Reply-To: <3ae5be2b-8075-5a4d-65c7-7282a44909f3@infradead.org>
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
Date: Sun, 10 Sep 2023 12:07:55 +0530
Message-ID: <CAHZF+VZLB5h0HY2voHaMmkWsd_okTSP2svgNetNPJWG0MX9Gew@mail.gmail.com>
Subject: Re: [PATCH] drm: fix doc warnings related to drm connector
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: multipart/alternative; boundary="000000000000dfd2120604fb73e3"
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, Bagas Sanjaya <bagasdotme@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000dfd2120604fb73e3
Content-Type: text/plain; charset="UTF-8"

>On Sun, 10 Sept 2023 at 09:29, Randy Dunlap <rdunlap@infradead.org> wrote:
>On 9/9/23 20:54, Bagas Sanjaya wrote:
>> On Sat, Sep 09, 2023 at 04:33:43PM +0530, Bragatheswaran Manickavel
wrote:
>>> Addressing drm dp/hdmi connector related kernel documentation
>>> warning and add more information about these values.
>>
>> What are these?
>>
>
>There are already patches for these issues.
>
>Please check latest linux-next and make patches to it instead of using
mainline.
>
>Thanks.

Just had a look at the latest next-20230908. Changes of
include/drm/drm_connector.h are
not present.

Thanks,
>
>
>
>>>
>>> Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
>>> ---
>>>  drivers/gpu/drm/drm_connector.c | 2 ++
>>>  include/drm/drm_connector.h     | 2 ++
>>>  2 files changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_connector.c
b/drivers/gpu/drm/drm_connector.c
>>> index bf8371dc2a61..084c95785dda 100644
>>> --- a/drivers/gpu/drm/drm_connector.c
>>> +++ b/drivers/gpu/drm/drm_connector.c
>>> @@ -2203,6 +2203,7 @@ static int
drm_mode_create_colorspace_property(struct drm_connector *connector,
>>>  /**
>>>   * drm_mode_create_hdmi_colorspace_property - create hdmi colorspace
property
>>>   * @connector: connector to create the Colorspace property on.
>>> + * @supported_colorspaces: to get hdmi supported colorspaces.
>>>   *
>>>   * Called by a driver the first time it's needed, must be attached to
desired
>>>   * HDMI connectors.
>>> @@ -2227,6 +2228,7 @@
EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
>>>  /**
>>>   * drm_mode_create_dp_colorspace_property - create dp colorspace
property
>>>   * @connector: connector to create the Colorspace property on.
>>> + * @supported_colorspaces: to get dp supported colorspaces.
>>>   *
>>>   * Called by a driver the first time it's needed, must be attached to
desired
>>>   * DP connectors.
>>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>>> index d300fde6c1a4..556d66dd122c 100644
>>> --- a/include/drm/drm_connector.h
>>> +++ b/include/drm/drm_connector.h
>>> @@ -498,6 +498,8 @@ enum drm_privacy_screen_status {
>>>   *   ITU-R BT.601 colorimetry format
>>>   *   The DP spec does not say whether this is the 525 or the 625
>>>   *   line version.
>>> + * @DRM_MODE_COLORIMETRY_COUNT:
>>> + *   Represents the count of colorspaces.
>>>   */
>>>  enum drm_colorspace {
>>>      /* For Default case, driver will set the colorspace */
>>
>> Oh, you mean to add description for colorspace-related fields.
>>
>> Thanks.
>>
>>
>
>--
~Randy

--000000000000dfd2120604fb73e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;On Sun, 10 Sept 2023 at 09:29, Randy Dunlap &lt;<a hre=
f=3D"mailto:rdunlap@infradead.org">rdunlap@infradead.org</a>&gt; wrote:<br>=
&gt;On 9/9/23 20:54, Bagas Sanjaya wrote:<br>&gt;&gt; On Sat, Sep 09, 2023 =
at 04:33:43PM +0530, Bragatheswaran Manickavel wrote:<br>&gt;&gt;&gt; Addre=
ssing drm dp/hdmi connector related kernel documentation<br>&gt;&gt;&gt; wa=
rning and add more information about these values.<br>&gt;&gt;<br>&gt;&gt; =
What are these?<br>&gt;&gt;<br>&gt;<br>&gt;There are already patches for th=
ese issues.<br>&gt;<br>&gt;Please check latest linux-next and make patches =
to it instead of using mainline.<br>&gt;<br>&gt;Thanks.<br><br>Just had a l=
ook at the latest next-20230908. Changes of include/drm/drm_connector.h are=
 <br>not present. <br><br>Thanks,<br>&gt;<br>&gt;<br>&gt;<br>&gt;&gt;&gt;<b=
r>&gt;&gt;&gt; Signed-off-by: Bragatheswaran Manickavel &lt;<a href=3D"mail=
to:bragathemanick0908@gmail.com">bragathemanick0908@gmail.com</a>&gt;<br>&g=
t;&gt;&gt; ---<br>&gt;&gt;&gt; =C2=A0drivers/gpu/drm/drm_connector.c | 2 ++=
<br>&gt;&gt;&gt; =C2=A0include/drm/drm_connector.h =C2=A0 =C2=A0 | 2 ++<br>=
&gt;&gt;&gt; =C2=A02 files changed, 4 insertions(+)<br>&gt;&gt;&gt;<br>&gt;=
&gt;&gt; diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm=
_connector.c<br>&gt;&gt;&gt; index bf8371dc2a61..084c95785dda 100644<br>&gt=
;&gt;&gt; --- a/drivers/gpu/drm/drm_connector.c<br>&gt;&gt;&gt; +++ b/drive=
rs/gpu/drm/drm_connector.c<br>&gt;&gt;&gt; @@ -2203,6 +2203,7 @@ static int=
 drm_mode_create_colorspace_property(struct drm_connector *connector,<br>&g=
t;&gt;&gt; =C2=A0/**<br>&gt;&gt;&gt; =C2=A0 * drm_mode_create_hdmi_colorspa=
ce_property - create hdmi colorspace property<br>&gt;&gt;&gt; =C2=A0 * @con=
nector: connector to create the Colorspace property on.<br>&gt;&gt;&gt; + *=
 @supported_colorspaces: to get hdmi supported colorspaces.<br>&gt;&gt;&gt;=
 =C2=A0 *<br>&gt;&gt;&gt; =C2=A0 * Called by a driver the first time it&#39=
;s needed, must be attached to desired<br>&gt;&gt;&gt; =C2=A0 * HDMI connec=
tors.<br>&gt;&gt;&gt; @@ -2227,6 +2228,7 @@ EXPORT_SYMBOL(drm_mode_create_h=
dmi_colorspace_property);<br>&gt;&gt;&gt; =C2=A0/**<br>&gt;&gt;&gt; =C2=A0 =
* drm_mode_create_dp_colorspace_property - create dp colorspace property<br=
>&gt;&gt;&gt; =C2=A0 * @connector: connector to create the Colorspace prope=
rty on.<br>&gt;&gt;&gt; + * @supported_colorspaces: to get dp supported col=
orspaces.<br>&gt;&gt;&gt; =C2=A0 *<br>&gt;&gt;&gt; =C2=A0 * Called by a dri=
ver the first time it&#39;s needed, must be attached to desired<br>&gt;&gt;=
&gt; =C2=A0 * DP connectors.<br>&gt;&gt;&gt; diff --git a/include/drm/drm_c=
onnector.h b/include/drm/drm_connector.h<br>&gt;&gt;&gt; index d300fde6c1a4=
..556d66dd122c 100644<br>&gt;&gt;&gt; --- a/include/drm/drm_connector.h<br>=
&gt;&gt;&gt; +++ b/include/drm/drm_connector.h<br>&gt;&gt;&gt; @@ -498,6 +4=
98,8 @@ enum drm_privacy_screen_status {<br>&gt;&gt;&gt; =C2=A0 * =C2=A0 IT=
U-R BT.601 colorimetry format<br>&gt;&gt;&gt; =C2=A0 * =C2=A0 The DP spec d=
oes not say whether this is the 525 or the 625<br>&gt;&gt;&gt; =C2=A0 * =C2=
=A0 line version.<br>&gt;&gt;&gt; + * @DRM_MODE_COLORIMETRY_COUNT:<br>&gt;&=
gt;&gt; + * =C2=A0 Represents the count of colorspaces.<br>&gt;&gt;&gt; =C2=
=A0 */<br>&gt;&gt;&gt; =C2=A0enum drm_colorspace {<br>&gt;&gt;&gt; =C2=A0 =
=C2=A0 =C2=A0/* For Default case, driver will set the colorspace */<br>&gt;=
&gt;<br>&gt;&gt; Oh, you mean to add description for colorspace-related fie=
lds.<br>&gt;&gt;<br>&gt;&gt; Thanks.<br>&gt;&gt;<br>&gt;&gt;<br>&gt;<br>&gt=
;--<br>~Randy</div>

--000000000000dfd2120604fb73e3--
