Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 350EB799CD6
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 08:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4E110E164;
	Sun, 10 Sep 2023 06:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EE410E164
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 06:45:53 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-7708bfce474so197312385a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Sep 2023 23:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694328352; x=1694933152; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sZfQWbGAj1DkhCKxqjczTrzWInqoQboQbdbdyWNQN/U=;
 b=khcYet4p0BhK5aaSYa13WUyzSln71jZXxU0dO1lMWC7eLbqm9w9IPIkA4wuTQhqUdK
 8SdbZeMSrmopItsdd0jTjic0lrzWN7pi9NmHB9cv/ucjg12sbM3iNuU7xE/VzCnQxD0U
 kCtBsYESLoeYK58l/c2vm/6PUywTHcRArvuXvx+j1VDP0LKe8RrqV5sC2D3tqQDj3JOT
 lNbsPN0tm8P4Wd6N2E1F8tSoyRbThK8fS7YYZ156iFmXzVvFopu5DGWBf6KaoNqCW6of
 GrNTuIqsp32SlJd7OUqTQjtPbHqb2g4+B/AWG7c2D85/drhO3Boh2a193SgHUoByRpjY
 z+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694328352; x=1694933152;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sZfQWbGAj1DkhCKxqjczTrzWInqoQboQbdbdyWNQN/U=;
 b=SoBb9iOoqzk8AAthcwq2SW9pJskW46Ul4XFiu3l+vgsI/LmktkfRT0l9F6Edfi827R
 l6fONFNBeEIVVIMN6sq8mYldi0XOxIsoCFSAmtt/SdbL/ALc5PLA9Y42DazQRpPWbOGg
 7tu+0EqN9QbrGufxGro79MXQ8EkjVhJqQAvhJvTgQhn4/ruXNWgwZtt2tVupL5AVOgrX
 oQbczyL+Y/VXJsA7dIuBfuTo1wkl19wt757VlbSXhmMfUfWgksIiv/ri9rAG4sCbfdFw
 L7bSLIyenxTwc3sFM66LcgQI2rtHBpJw0Ynd2drnz69g/B2uoEfEMritrtTMHr143sxG
 t4cw==
X-Gm-Message-State: AOJu0YxonONNNwG8w0tiJweGJLkEMuSsuvlGQ9pFfw3DS38f0IS50H1S
 7qGCXhrL+1JpzuC/SBj/dtmXQO0aPURXvV4PwOo=
X-Google-Smtp-Source: AGHT+IF+s8AFxOidE/A9WAC4m8I9XQH0TrmHOCpV62tnj/qio93DNU+E//PvEOIoGVq8cFPoXHt8PXWv744YZNAa2gI=
X-Received: by 2002:ac8:7d4f:0:b0:412:da83:484b with SMTP id
 h15-20020ac87d4f000000b00412da83484bmr8894823qtb.10.1694328352002; Sat, 09
 Sep 2023 23:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230909110343.8103-1-bragathemanick0908@gmail.com>
 <ZP0-DaW3lIeaZ8xY@debian.me>
 <3ae5be2b-8075-5a4d-65c7-7282a44909f3@infradead.org>
In-Reply-To: <3ae5be2b-8075-5a4d-65c7-7282a44909f3@infradead.org>
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
Date: Sun, 10 Sep 2023 12:15:40 +0530
Message-ID: <CAHZF+Vaf4vJtyFCMGP7DP_rGGtEsxbHQqB50S-46_a4H0_j3GA@mail.gmail.com>
Subject: Re: [PATCH] drm: fix doc warnings related to drm connector
To: Randy Dunlap <rdunlap@infradead.org>, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch, 
 Bagas Sanjaya <bagasdotme@gmail.com>, mripard@kernel.org, tzimmermann@suse.de
Content-Type: multipart/alternative; boundary="0000000000008dd6ec0604fb8f41"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000008dd6ec0604fb8f41
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
--

--0000000000008dd6ec0604fb8f41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div><br></div>&gt;On Sun, 10 Sept 2023 at =
09:29, Randy Dunlap &lt;<a href=3D"mailto:rdunlap@infradead.org">rdunlap@in=
fradead.org</a>&gt; wrote:<br>&gt;On 9/9/23 20:54, Bagas Sanjaya wrote:<br>=
&gt;&gt; On Sat, Sep 09, 2023 at 04:33:43PM +0530, Bragatheswaran Manickave=
l wrote:<br>&gt;&gt;&gt; Addressing drm dp/hdmi connector related kernel do=
cumentation<br>&gt;&gt;&gt; warning and add more information about these va=
lues.<br>&gt;&gt;<br>&gt;&gt; What are these?<br>&gt;&gt;<br>&gt;<br>&gt;Th=
ere are already patches for these issues.<br>&gt;<br>&gt;Please check lates=
t linux-next and make patches to it instead of using mainline.<br>&gt;<br>&=
gt;Thanks.<br><br>Just had a look at the latest next-20230908. Changes of i=
nclude/drm/drm_connector.h are <br>not present. <br><br>Thanks,<br>&gt;<br>=
&gt;&gt;&gt;<br>&gt;&gt;&gt; Signed-off-by: Bragatheswaran Manickavel &lt;<=
a href=3D"mailto:bragathemanick0908@gmail.com">bragathemanick0908@gmail.com=
</a>&gt;<br>&gt;&gt;&gt; ---<br>&gt;&gt;&gt; =C2=A0drivers/gpu/drm/drm_conn=
ector.c | 2 ++<br>&gt;&gt;&gt; =C2=A0include/drm/drm_connector.h =C2=A0 =C2=
=A0 | 2 ++<br>&gt;&gt;&gt; =C2=A02 files changed, 4 insertions(+)<br>&gt;&g=
t;&gt;<br>&gt;&gt;&gt; diff --git a/drivers/gpu/drm/drm_connector.c b/drive=
rs/gpu/drm/drm_connector.c<br>&gt;&gt;&gt; index bf8371dc2a61..084c95785dda=
 100644<br>&gt;&gt;&gt; --- a/drivers/gpu/drm/drm_connector.c<br>&gt;&gt;&g=
t; +++ b/drivers/gpu/drm/drm_connector.c<br>&gt;&gt;&gt; @@ -2203,6 +2203,7=
 @@ static int drm_mode_create_colorspace_property(struct drm_connector *co=
nnector,<br>&gt;&gt;&gt; =C2=A0/**<br>&gt;&gt;&gt; =C2=A0 * drm_mode_create=
_hdmi_colorspace_property - create hdmi colorspace property<br>&gt;&gt;&gt;=
 =C2=A0 * @connector: connector to create the Colorspace property on.<br>&g=
t;&gt;&gt; + * @supported_colorspaces: to get hdmi supported colorspaces.<b=
r>&gt;&gt;&gt; =C2=A0 *<br>&gt;&gt;&gt; =C2=A0 * Called by a driver the fir=
st time it&#39;s needed, must be attached to desired<br>&gt;&gt;&gt; =C2=A0=
 * HDMI connectors.<br>&gt;&gt;&gt; @@ -2227,6 +2228,7 @@ EXPORT_SYMBOL(drm=
_mode_create_hdmi_colorspace_property);<br>&gt;&gt;&gt; =C2=A0/**<br>&gt;&g=
t;&gt; =C2=A0 * drm_mode_create_dp_colorspace_property - create dp colorspa=
ce property<br>&gt;&gt;&gt; =C2=A0 * @connector: connector to create the Co=
lorspace property on.<br>&gt;&gt;&gt; + * @supported_colorspaces: to get dp=
 supported colorspaces.<br>&gt;&gt;&gt; =C2=A0 *<br>&gt;&gt;&gt; =C2=A0 * C=
alled by a driver the first time it&#39;s needed, must be attached to desir=
ed<br>&gt;&gt;&gt; =C2=A0 * DP connectors.<br>&gt;&gt;&gt; diff --git a/inc=
lude/drm/drm_connector.h b/include/drm/drm_connector.h<br>&gt;&gt;&gt; inde=
x d300fde6c1a4..556d66dd122c 100644<br>&gt;&gt;&gt; --- a/include/drm/drm_c=
onnector.h<br>&gt;&gt;&gt; +++ b/include/drm/drm_connector.h<br>&gt;&gt;&gt=
; @@ -498,6 +498,8 @@ enum drm_privacy_screen_status {<br>&gt;&gt;&gt; =C2=
=A0 * =C2=A0 ITU-R BT.601 colorimetry format<br>&gt;&gt;&gt; =C2=A0 * =C2=
=A0 The DP spec does not say whether this is the 525 or the 625<br>&gt;&gt;=
&gt; =C2=A0 * =C2=A0 line version.<br>&gt;&gt;&gt; + * @DRM_MODE_COLORIMETR=
Y_COUNT:<br>&gt;&gt;&gt; + * =C2=A0 Represents the count of colorspaces.<br=
>&gt;&gt;&gt; =C2=A0 */<br>&gt;&gt;&gt; =C2=A0enum drm_colorspace {<br>&gt;=
&gt;&gt; =C2=A0 =C2=A0 =C2=A0/* For Default case, driver will set the color=
space */<br>&gt;&gt;<br>&gt;&gt; Oh, you mean to add description for colors=
pace-related fields.<br>&gt;&gt;<br>&gt;&gt; Thanks.<br>&gt;&gt;<br>&gt;&gt=
;<br>&gt;<br>--<br><br></div>

--0000000000008dd6ec0604fb8f41--
