Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCA06EEC3B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 04:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B751710E865;
	Wed, 26 Apr 2023 02:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B933010E865
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 02:06:43 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4ec816d64afso28166659e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 19:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682474799; x=1685066799;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=utUfWrMHit0AThqCANV9NV1PNt+aeHf9ujwE1UaOGKo=;
 b=Mr4VJc1DpWml0O+kNPHdOhHGJYiK3ltyDmMsitO03YkLSsDjj/Mf0zufM8Cdmmc0JN
 Q+vVUnzd/Zw/MxlEwNQcJc8Dw2i6AX4pHb9qxkd5af1QLuEAmzAkrKMEyiMvj1eTocez
 MFcLikyD5b+VsCFYbHqvKiUYjSR36ASHa5UzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682474799; x=1685066799;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=utUfWrMHit0AThqCANV9NV1PNt+aeHf9ujwE1UaOGKo=;
 b=I0AHe/ApSeKEx5tT6vBqvI13tC4NIoXSIw49LhWKk7AIog/iyv0X5JfGb4WHEzNICC
 +sh0H+Tdfj8zLf49IGHlW0T9zxd/6UCBHLKSeMYBppgtYFbQ0gQg/7OJnMZo2LKGal9b
 dG/y03cqqsy9kGOb6cUXgkYuIHK3MZTrJVJDbpupDCH0jeE+2DZ9x2dDKZqPR/6/Zp2c
 a3zGGRwXCbaiU06W0G3+M1ZUtOxf7mr6Z7jo4k5OQSycAkilNnxAioJgwq2uh/PadisH
 uFbF3YOmgmXhfGxVbua/tG33JssQP8QZLGrSlZQnFu2zpHM/u0MmOn14Taf/9efGTGtk
 ny7A==
X-Gm-Message-State: AC+VfDwG1SaCn9NdSEnAnmJ3BMTrtmL9G4mpwRdZHoqteidBG6sNnKz1
 HUAA7sRxbpeeEhngBirppJFR1qtRH4XFt+W4QTnYLA==
X-Google-Smtp-Source: ACHHUZ5LvkJzGYMHa2mljsaAf1dtcn4AKfQxXxNgrnu/lYn6s9fSieMSxWE8ilul2GRTN3irsoRJiw==
X-Received: by 2002:ac2:46cf:0:b0:4ef:f064:263b with SMTP id
 p15-20020ac246cf000000b004eff064263bmr184712lfo.12.1682474799756; 
 Tue, 25 Apr 2023 19:06:39 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51]) by smtp.gmail.com with ESMTPSA id
 y18-20020a197512000000b004efd39ef3c2sm1911573lfe.179.2023.04.25.19.06.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 19:06:38 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-4efd5e4d302so6372e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 19:06:38 -0700 (PDT)
X-Received: by 2002:a05:6512:3d90:b0:4ed:d7d:d141 with SMTP id
 k16-20020a0565123d9000b004ed0d7dd141mr94580lfv.6.1682474798152; Tue, 25 Apr
 2023 19:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230425073012.11036-1-marius.vlad@collabora.com>
In-Reply-To: <20230425073012.11036-1-marius.vlad@collabora.com>
From: Brandon Ross Pollack <brpol@chromium.org>
Date: Wed, 26 Apr 2023 11:06:26 +0900
X-Gmail-Original-Message-ID: <CALWYx-a90Zee0_js5h=53bxsN-BXxumiGid-qc=9405ZkUE-gg@mail.gmail.com>
Message-ID: <CALWYx-a90Zee0_js5h=53bxsN-BXxumiGid-qc=9405ZkUE-gg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/vkms: Add support for multiple pipes
To: Marius Vlad <marius.vlad@collabora.com>, yixie@chromium.org
Content-Type: multipart/alternative; boundary="000000000000b05a3a05fa33b0c2"
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
Cc: melissa.srw@gmail.com, rodrigosiqueiramelo@gmail.com, mcanal@igalia.com,
 dri-devel@lists.freedesktop.org, mwen@igalia.com, tzimmermann@suse.de,
 igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000b05a3a05fa33b0c2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We're doing/planning on doing similar or related work here at chromium.

https://patchwork.kernel.org/project/dri-devel/list/?series=3D662676&submit=
ter=3D&state=3D&q=3D&delegate=3D&archive=3Dboth

Here's the stuff we have now (we're currently rebasing and touching it up,
myself and @Yi Xie <yixie@google.com> will be taking over this work.

Our plans are to add configFS changes and DRI VKMS changes to be able to
add and remove virtual displays at runtime (among other things needed for
our own testing purposes for our Exo wayland implementation).

We're still learning how this all works and comes together, but it is worth
letting you know "us too"

We can chat more and see where we overlap and can learn from each other :)

On Tue, Apr 25, 2023 at 4:30=E2=80=AFPM Marius Vlad <marius.vlad@collabora.=
com>
wrote:

> With multiple pipe available we can perform management of outputs at
> a more granular level, such that we're able to turn off or on several
> outputs at a time, or combinations that arise from doing that.
>
> The Weston project use VKMS when running its test suite in CI, and we
> have now uses cases which would need to ability to set-up the outputs
> DPMS/state individually, rather than globally -- which would affect all
> outputs. This an attempt on fixing that by giving the possibility to
> create more than one pipe, and thus allowing to run tests that could
> exercise code paths in the compositor related to management of outputs.
>
> v3:
>   - Apply the series against drm-misc-next (Ma=C3=ADra Canal)
>   - Add a lower range check to avoid passing negative values to
>   max_pipes (Ma=C3=ADra Canal)
>
> v2:
>   - Replace 'outputs' with 'pipes' as to use the proper terminology
>     (Thomas Zimmermann, Ma=C3=ADra Canal)
>   - Fixed passing wrong possible_crtc bitmask when initializing the
>     write back connector which address kms_writeback failure (Ma=C3=ADra =
Canal)
>   - Add a feat. note about moving overlay planes between CRTCs (Melissa
> Wen)
>
> Marius Vlad (3):
>   vkms: Pass the correct bitmask for possible crtcs
>   vkms: Add support for multiple pipes
>   Documentation/gpu/vkms.rst: Added a note about plane migration
>
>  Documentation/gpu/vkms.rst            |  5 +++--
>  drivers/gpu/drm/vkms/vkms_crtc.c      |  3 +--
>  drivers/gpu/drm/vkms/vkms_drv.c       | 31 +++++++++++++++++++++------
>  drivers/gpu/drm/vkms/vkms_drv.h       | 12 ++++++++---
>  drivers/gpu/drm/vkms/vkms_output.c    |  7 +++---
>  drivers/gpu/drm/vkms/vkms_writeback.c | 24 ++++++++++-----------
>  6 files changed, 53 insertions(+), 29 deletions(-)
>
> --
> 2.39.2
>
>

--000000000000b05a3a05fa33b0c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We&#39;re doing/planning on doing similar or related work =
here at chromium.<div><br></div><div><a href=3D"https://patchwork.kernel.or=
g/project/dri-devel/list/?series=3D662676&amp;submitter=3D&amp;state=3D&amp=
;q=3D&amp;delegate=3D&amp;archive=3Dboth" target=3D"_blank">https://patchwo=
rk.kernel.org/project/dri-devel/list/?series=3D662676&amp;submitter=3D&amp;=
state=3D&amp;q=3D&amp;delegate=3D&amp;archive=3Dboth</a><br></div><div><br>=
</div><div>Here&#39;s the stuff we have now (we&#39;re currently rebasing a=
nd touching it up, myself=C2=A0and=C2=A0<a class=3D"gmail_plusreply" id=3D"=
m_2404692483624593004plusReplyChip-0" href=3D"mailto:yixie@google.com" targ=
et=3D"_blank">@Yi Xie</a>=C2=A0will be taking over this work.</div><div><br=
></div><div>Our plans are to add configFS changes and DRI VKMS changes to b=
e able to add and remove virtual displays at runtime (among other things ne=
eded for our own testing purposes for our Exo wayland implementation).</div=
><div><br></div><div>We&#39;re still learning how this all works and comes =
together, but it is worth letting you know &quot;us too&quot;</div><div><br=
></div><div>We can chat more and see where we overlap and can learn from ea=
ch other :)</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Apr 25, 2023 at 4:30=E2=80=AFPM Marius Vlad &lt;<a=
 href=3D"mailto:marius.vlad@collabora.com" target=3D"_blank">marius.vlad@co=
llabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">With multiple pipe available we can perform management of output=
s at<br>
a more granular level, such that we&#39;re able to turn off or on several<b=
r>
outputs at a time, or combinations that arise from doing that. <br>
<br>
The Weston project use VKMS when running its test suite in CI, and we<br>
have now uses cases which would need to ability to set-up the outputs<br>
DPMS/state individually, rather than globally -- which would affect all<br>
outputs. This an attempt on fixing that by giving the possibility to<br>
create more than one pipe, and thus allowing to run tests that could<br>
exercise code paths in the compositor related to management of outputs.<br>
<br>
v3:<br>
=C2=A0 - Apply the series against drm-misc-next (Ma=C3=ADra Canal)<br>
=C2=A0 - Add a lower range check to avoid passing negative values to<br>
=C2=A0 max_pipes (Ma=C3=ADra Canal)<br>
<br>
v2:<br>
=C2=A0 - Replace &#39;outputs&#39; with &#39;pipes&#39; as to use the prope=
r terminology <br>
=C2=A0 =C2=A0 (Thomas Zimmermann, Ma=C3=ADra Canal)<br>
=C2=A0 - Fixed passing wrong possible_crtc bitmask when initializing the<br=
>
=C2=A0 =C2=A0 write back connector which address kms_writeback failure (Ma=
=C3=ADra Canal)<br>
=C2=A0 - Add a feat. note about moving overlay planes between CRTCs (Meliss=
a Wen)<br>
<br>
Marius Vlad (3):<br>
=C2=A0 vkms: Pass the correct bitmask for possible crtcs<br>
=C2=A0 vkms: Add support for multiple pipes<br>
=C2=A0 Documentation/gpu/vkms.rst: Added a note about plane migration<br>
<br>
=C2=A0Documentation/gpu/vkms.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 5 +++--<br>
=C2=A0drivers/gpu/drm/vkms/vkms_crtc.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +--<br=
>
=C2=A0drivers/gpu/drm/vkms/vkms_drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 31 ++++++=
+++++++++++++++------<br>
=C2=A0drivers/gpu/drm/vkms/vkms_drv.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++++=
++---<br>
=C2=A0drivers/gpu/drm/vkms/vkms_output.c=C2=A0 =C2=A0 |=C2=A0 7 +++---<br>
=C2=A0drivers/gpu/drm/vkms/vkms_writeback.c | 24 ++++++++++-----------<br>
=C2=A06 files changed, 53 insertions(+), 29 deletions(-)<br>
<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div>

--000000000000b05a3a05fa33b0c2--
