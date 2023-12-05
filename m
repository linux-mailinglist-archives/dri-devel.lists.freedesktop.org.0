Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 473178056B7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 15:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E20310E541;
	Tue,  5 Dec 2023 14:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28FA10E53F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 14:05:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 6F104B81719
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 14:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5793C433CB
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 14:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701785100;
 bh=DYRq8RLsYcWifgSOg6Iei0r2anoOEXNBK2BGgxV901E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=skhubm+oujOw/R4+FK7YwiG7T6OmJTh9CR2x8kV4dVZbYvsygJwsH4JDtNnTS52B9
 oAAmPD1EU0e9wkWswCkb17DpQamjGCC4VdRan5d1cX2yUBJU6/0+hw99OqP+AEpupS
 wJ/5+KJADQ/Yze9SHOrqaXSb04E+sD4suAFd0nA/q3e0hRtQY1hRDK9UuTJd+XuiJH
 Lm5iSzoq+vSERjvrwTV9emS0nC4LnW5wYM060gDFpHAKUW9Rx30c3qI6YF2K45Zry7
 glzBpW39GmfLeZc0/RXLsYAjDEiJ5ozsXFjDAaC5onn2zfNF/AQEHiMW67SS/xq+fT
 bUmndEFUV9F7A==
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-5c68da9d639so1342158a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 06:05:00 -0800 (PST)
X-Gm-Message-State: AOJu0YznNfdcvu9dEnWv5S+b6+4IGpoGtw2e1uWez6y3FDwOqRtY46hT
 7SrwaGmmn/lG1L7vX1/FqHR+559k8zryxY1p8IIQrg==
X-Google-Smtp-Source: AGHT+IGnqTG7IyozxLFZZdmSGergagDVidfbs2AdjOnbKHyPk7ZG4BUp+RU+nECdemBQ9hoUFpEMiHBxr8w9CHqqXVk=
X-Received: by 2002:a05:6a21:998d:b0:187:a2ca:409c with SMTP id
 ve13-20020a056a21998d00b00187a2ca409cmr4028396pzb.5.1701785100351; Tue, 05
 Dec 2023 06:05:00 -0800 (PST)
MIME-Version: 1.0
References: <0cdc2dce-ca89-451a-9774-1482ab2f4762@moroto.mountain>
 <170178410677.683894.16036596185582079991.b4-ty@kernel.org>
 <a10a75c7-0626-454f-a3c4-d6031713f26f@suswa.mountain>
In-Reply-To: <a10a75c7-0626-454f-a3c4-d6031713f26f@suswa.mountain>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 5 Dec 2023 15:04:49 +0100
X-Gmail-Original-Message-ID: <CAN6tsi6c7ncaiRAiAvrs_GoUMB8v9ciaMvu7s7hnPA0KN0xkWg@mail.gmail.com>
Message-ID: <CAN6tsi6c7ncaiRAiAvrs_GoUMB8v9ciaMvu7s7hnPA0KN0xkWg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: nxp-ptn3460: fix i2c_master_send() error
 checking
To: Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006419bb060bc3b833"
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000006419bb060bc3b833
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 5, 2023, 15:01 Dan Carpenter <dan.carpenter@linaro.org> wrote:

> On Tue, Dec 05, 2023 at 02:48:26PM +0100, Robert Foss wrote:
> > On Mon, 4 Dec 2023 15:29:00 +0300, Dan Carpenter wrote:
> > > The i2c_master_send/recv() functions return negative error codes or the
> > > number of bytes that were able to be sent/received.  This code has
> > > two problems.  1)  Instead of checking if all the bytes were sent or
> > > received, it checks that at least one byte was sent or received.
> > > 2) If there was a partial send/receive then we should return a negative
> > > error code but this code returns success.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/1] drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking
> >       https://cgit.freedesktop.org/drm/drm-misc/commit/?id=914437992876
> >
>
> Wait.  That was unexpected.  Neil's review comments were correct.  I was
> planning to send a v2 patch which was just a cleanup.
>

Sorry Dan, I was too quick on the draw. Can you send a fixup and I'll apply
it too?


> regards,
> dan carpenter
>
>

--0000000000006419bb060bc3b833
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Dec 5, 2023, 15:01 Dan Carpenter &lt;<a href=
=3D"mailto:dan.carpenter@linaro.org">dan.carpenter@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Tue, Dec 05, 2023 at 02:48:26P=
M +0100, Robert Foss wrote:<br>
&gt; On Mon, 4 Dec 2023 15:29:00 +0300, Dan Carpenter wrote:<br>
&gt; &gt; The i2c_master_send/recv() functions return negative error codes =
or the<br>
&gt; &gt; number of bytes that were able to be sent/received.=C2=A0 This co=
de has<br>
&gt; &gt; two problems.=C2=A0 1)=C2=A0 Instead of checking if all the bytes=
 were sent or<br>
&gt; &gt; received, it checks that at least one byte was sent or received.<=
br>
&gt; &gt; 2) If there was a partial send/receive then we should return a ne=
gative<br>
&gt; &gt; error code but this code returns success.<br>
&gt; &gt; <br>
&gt; &gt; [...]<br>
&gt; <br>
&gt; Applied, thanks!<br>
&gt; <br>
&gt; [1/1] drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://cgit.freedesktop.org/drm/=
drm-misc/commit/?id=3D914437992876" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D91443799287=
6</a><br>
&gt; <br>
<br>
Wait.=C2=A0 That was unexpected.=C2=A0 Neil&#39;s review comments were corr=
ect.=C2=A0 I was<br>
planning to send a v2 patch which was just a cleanup.<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">Sorry Dan, I was too q=
uick on the draw. Can you send a fixup and I&#39;ll apply it too?</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><br>
regards,<br>
dan carpenter<br>
<br>
</blockquote></div></div></div>

--0000000000006419bb060bc3b833--
