Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 573E9799D84
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 11:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC90410E16C;
	Sun, 10 Sep 2023 09:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D9E10E16C
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 09:39:27 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-64f387094ddso20854156d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 02:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694338767; x=1694943567; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5L39h5d6cXoxFJ8AhsOMI72KVyCYbfDHOL2vNRG9ons=;
 b=LmmakNo0DuOoj2PUAG7uIRZoqCGt0yXRArXHTIaVmW5ByVmsPBa5MQQ05ckpAL0mAX
 8Om2EHaq6Q9kZU29UKYEKiImxzk6bh59x9y/OvWzSPJrW2llVXIB6wQb1i20rRImX7Wc
 eV8/XnJybsPdRDSaiLn+THw41ha9NTOh2tD3Ny1XQnRAVYkHe1jCyWR3Jf7ye+SpS0nm
 cStj7K4KG6AGRGwJANXsK7Ik8qAgIccTtwBQDJE90nOSHUjMUfZAXnAYkXVDtceICPNq
 ReYLv2HxC7DZPCNgoOaFr3IHA7TpXh6X0VzD1NYvvBczNG5OtgLRLbyhGQBGy3Lzz1MB
 f3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694338767; x=1694943567;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5L39h5d6cXoxFJ8AhsOMI72KVyCYbfDHOL2vNRG9ons=;
 b=roGqU56EBmzz7uaDtiE23Bf8dcviz3MfyqdV1W6XcfmvjEokqAL//8P216Buc1mt48
 CNZEBnrQKoSWiXyZcsReZvclOWTrHlok4KzEGFeA9Oh8/68bfRCEPaqwm6GImp7Ozowv
 twpBNdtSdX/+ano9gI7LdXiitc9tzT90Pfm4uIgkh3g106YOmyF5m7xRqkBLYPo7Y+El
 oDp2W1hdRrliAXDhsm1FCG9K0tiWuz28aqhJm7/idYCZi23A6M0rMGOCh2AWZFZfvNZH
 yoWu9eIVB7UcCQvdZGokSeTJ16xYycUuYGLdb847xP4/KTlGe5GG/jVS8hgk08MQWt1j
 9rTA==
X-Gm-Message-State: AOJu0YzC5V/VRXzlnArRG5t7RZziw63FVc3JINEzInHzzZrCwX3UyyZN
 3ZwrrcOa5Sxkza+jf6xwokVKTt0j9BMz98UJuMw=
X-Google-Smtp-Source: AGHT+IFwC8F20IzLE6xemeWxhxzhlTHumksqBgOy+4H0ViGOtpcXKRVsAnDPya8EJ5Lyy+j/hHQKLT0Ft3h3TfKZKec=
X-Received: by 2002:a0c:d984:0:b0:64f:70a8:60d0 with SMTP id
 y4-20020a0cd984000000b0064f70a860d0mr6002049qvj.4.1694338766826; Sun, 10 Sep
 2023 02:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230909110343.8103-1-bragathemanick0908@gmail.com>
 <ZP0-DaW3lIeaZ8xY@debian.me>
 <3ae5be2b-8075-5a4d-65c7-7282a44909f3@infradead.org>
In-Reply-To: <3ae5be2b-8075-5a4d-65c7-7282a44909f3@infradead.org>
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
Date: Sun, 10 Sep 2023 15:09:14 +0530
Message-ID: <CAHZF+VYn1oWgreweHkr1UsjLEU3mcb-dD5dCQZjeQbT=xKq0sQ@mail.gmail.com>
Subject: Re: [PATCH] drm: fix doc warnings related to drm connector
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: multipart/alternative; boundary="0000000000005371c40604fdfcd5"
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

--0000000000005371c40604fdfcd5
Content-Type: text/plain; charset="UTF-8"

On Sun, 10 Sept 2023 at 09:29, Randy Dunlap <rdunlap@infradead.org> wrote:
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

thanks,
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

--

--0000000000005371c40604fdfcd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Sun, 10 Sept 2023 at 09:29, Randy Dunlap &lt;<a href=3D=
"mailto:rdunlap@infradead.org">rdunlap@infradead.org</a>&gt; wrote:<br>&gt;=
On 9/9/23 20:54, Bagas Sanjaya wrote:<br>&gt;&gt; On Sat, Sep 09, 2023 at 0=
4:33:43PM +0530, Bragatheswaran Manickavel wrote:<br>&gt;&gt;&gt; Addressin=
g drm dp/hdmi connector related kernel documentation<br>&gt;&gt;&gt; warnin=
g and add more information about these values.<br>&gt;&gt;<br>&gt;&gt; What=
 are these?<br>&gt;&gt;<br>&gt;<br>&gt;There are already patches for these =
issues.<br>&gt;<br>&gt;Please check latest linux-next and make patches to i=
t instead of using mainline.<br>&gt;<br>&gt;Thanks.<br><br>Just had a look =
at the latest next-20230908. Changes of include/drm/drm_connector.h are <br=
>not present. <br><br>thanks,<br>&gt;<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; Signe=
d-off-by: Bragatheswaran Manickavel &lt;<a href=3D"mailto:bragathemanick090=
8@gmail.com">bragathemanick0908@gmail.com</a>&gt;<br>&gt;&gt;&gt; ---<br>&g=
t;&gt;&gt; =C2=A0drivers/gpu/drm/drm_connector.c | 2 ++<br>&gt;&gt;&gt; =C2=
=A0include/drm/drm_connector.h =C2=A0 =C2=A0 | 2 ++<br>&gt;&gt;&gt; =C2=A02=
 files changed, 4 insertions(+)<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; diff --git =
a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c<br>&gt;=
&gt;&gt; index bf8371dc2a61..084c95785dda 100644<br>&gt;&gt;&gt; --- a/driv=
ers/gpu/drm/drm_connector.c<br>&gt;&gt;&gt; +++ b/drivers/gpu/drm/drm_conne=
ctor.c<br>&gt;&gt;&gt; @@ -2203,6 +2203,7 @@ static int drm_mode_create_col=
orspace_property(struct drm_connector *connector,<br>&gt;&gt;&gt; =C2=A0/**=
<br>&gt;&gt;&gt; =C2=A0 * drm_mode_create_hdmi_colorspace_property - create=
 hdmi colorspace property<br>&gt;&gt;&gt; =C2=A0 * @connector: connector to=
 create the Colorspace property on.<br>&gt;&gt;&gt; + * @supported_colorspa=
ces: to get hdmi supported colorspaces.<br>&gt;&gt;&gt; =C2=A0 *<br>&gt;&gt=
;&gt; =C2=A0 * Called by a driver the first time it&#39;s needed, must be a=
ttached to desired<br>&gt;&gt;&gt; =C2=A0 * HDMI connectors.<br>&gt;&gt;&gt=
; @@ -2227,6 +2228,7 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_prope=
rty);<br>&gt;&gt;&gt; =C2=A0/**<br>&gt;&gt;&gt; =C2=A0 * drm_mode_create_dp=
_colorspace_property - create dp colorspace property<br>&gt;&gt;&gt; =C2=A0=
 * @connector: connector to create the Colorspace property on.<br>&gt;&gt;&=
gt; + * @supported_colorspaces: to get dp supported colorspaces.<br>&gt;&gt=
;&gt; =C2=A0 *<br>&gt;&gt;&gt; =C2=A0 * Called by a driver the first time i=
t&#39;s needed, must be attached to desired<br>&gt;&gt;&gt; =C2=A0 * DP con=
nectors.<br>&gt;&gt;&gt; diff --git a/include/drm/drm_connector.h b/include=
/drm/drm_connector.h<br>&gt;&gt;&gt; index d300fde6c1a4..556d66dd122c 10064=
4<br>&gt;&gt;&gt; --- a/include/drm/drm_connector.h<br>&gt;&gt;&gt; +++ b/i=
nclude/drm/drm_connector.h<br>&gt;&gt;&gt; @@ -498,6 +498,8 @@ enum drm_pri=
vacy_screen_status {<br>&gt;&gt;&gt; =C2=A0 * =C2=A0 ITU-R BT.601 colorimet=
ry format<br>&gt;&gt;&gt; =C2=A0 * =C2=A0 The DP spec does not say whether =
this is the 525 or the 625<br>&gt;&gt;&gt; =C2=A0 * =C2=A0 line version.<br=
>&gt;&gt;&gt; + * @DRM_MODE_COLORIMETRY_COUNT:<br>&gt;&gt;&gt; + * =C2=A0 R=
epresents the count of colorspaces.<br>&gt;&gt;&gt; =C2=A0 */<br>&gt;&gt;&g=
t; =C2=A0enum drm_colorspace {<br>&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0/* For D=
efault case, driver will set the colorspace */<br>&gt;&gt;<br>&gt;&gt; Oh, =
you mean to add description for colorspace-related fields.<br>&gt;&gt;<br>&=
gt;&gt; Thanks.<br><br>--</div>

--0000000000005371c40604fdfcd5--
