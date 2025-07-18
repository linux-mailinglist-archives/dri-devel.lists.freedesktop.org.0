Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7597AB0AA0F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 20:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBBD10E008;
	Fri, 18 Jul 2025 18:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C1NYKmxU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0F210E008;
 Fri, 18 Jul 2025 18:19:29 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-60c01b983b6so5221223a12.0; 
 Fri, 18 Jul 2025 11:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752862768; x=1753467568; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=74K7xsG9MSz6N4H1ymJC7EYXlz7ZOsPuNwkmBaXHlTM=;
 b=C1NYKmxUhRotvqaUwMKzAQW1gsj+0/bKYak0Q7uUwcgzBKnP5LEKmFc3Nuiss1S0OD
 yOqdhNwMBrv/uA4a6+m2efyT1jYTwaGX7pmMRIplAfbb/bUw/zLzMCnNHQMHpxLH9JS6
 DbrGIihh+hrIycGh8g/916XlyWxt0+bjekOk5K8zonSeXwksuYFqV7hxFP7kPLrk3Fvk
 uij5+0T6bNrfJY2rTv1ABNauHIUnTweywGYY/ML6McSVzyMBBe2UUFKtCesL7wX8S88N
 dsOI975UqzpH3oQf/GgNGMON1Txu4oq+ew1+6KRl7wyK9PMMuM08kEB6jrjDEMXd8BPU
 NWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752862768; x=1753467568;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=74K7xsG9MSz6N4H1ymJC7EYXlz7ZOsPuNwkmBaXHlTM=;
 b=fvMAOzJRMLRlf64D0NtSpYZGGO1LYIUdX0Rm1WLSCF4Ee2BKHRgvBn9x5GK7ihiq1/
 dspObEjkJVdTsKkUhn1aXbk/K5sKL6lc5TSgoaAlxtH48NUgPnLkutv9P/MkAPg4gufy
 iJR8ZglzakRO77/No0PMN/IZg42gSnqOP5qY4csi7uze4U+9QzbzPVycSd5COdOuSom+
 RCbNTcZ8PoHPyMjhHhuqSRuJzr/5VM2r5wQa1yRSxbFmAFRH8UQk1Z5Cm3o83U7R8aDS
 ZEAaXHajCRgSqxWqA6GgQ0E8n1Cwcwy/OxuekbkvkBP/96hWiMH8FMSSVsUpZ22uD+Cj
 5aYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb6uTA6AYFXGiLX9+RterUHEq1A83Vs+ICCLCxgIw9+aJPn/r8R1Fum2HAM06iSm0D/HzjkMB4+5PM@lists.freedesktop.org,
 AJvYcCXhXieYquZ7IZ6MV8rqBSbMQhRPLCjrt+f9Eb+gyfT2ONzln5MpYTSHRHrXRlyYPnaluY88+DVkboo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytxrlKqSkpv/FKQLkwzsAGBk2OUwvT3For05kQUuuS1lDUPndz
 zPBp1Nzz19prxYWionyh2vnWIH6jg6ZPKIqre3DM8GsLIW9/7EjXVIEk3pngH4bAlYYy5Zgj0OI
 o00dkwTfJdgf+ocYjH3Lqp1Z0uXy5QQ==
X-Gm-Gg: ASbGnctis19O+mQMg8oJmOHtJjCKR+CUjykOXJHH6GXlNvthkhK28ou/n9BQth2hE8G
 ocOuxxkVE8d8PjqPwtgSVY6QJiTF+S4SiDIZWvBPLq36lIFlrhm+rTHtKfZaWXFrlT2wHsAkipm
 Qop258JxcW8Gowiz/vgNCb7T0IZHWYAnNqpx0Tr9DVFjRA2xeJQo+ypOd7Jj4M98j/1pITOzI1O
 c5fSFAHKGcq7SZLqhcvRwP+dGiysg1yuomNHmU=
X-Google-Smtp-Source: AGHT+IGwAL0QIL1OXzPtmtjtPdJ5o+m2l7uXeUnGXEH0kmtpLo7mnRs7gLDXMvUVVKUsf9oyz1Gvp732AxWj1qd5IoA=
X-Received: by 2002:a05:6402:2553:b0:600:129:444e with SMTP id
 4fb4d7f45d1cf-612a3243e21mr7033430a12.4.1752862767584; Fri, 18 Jul 2025
 11:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-7-daleyo@gmail.com>
 <A9DB4AE061FD8BB9+3519a519-1a29-49c1-a07d-28a0577677cc@radxa.com>
 <CA+kEDGGaKrYO9Pu3un_Nq_6AOZC5L9sG+CEwh2ZEzWFeHGqtEA@mail.gmail.com>
 <eb0f5be5-3a6f-4969-affd-c01a6216ad0c@oss.qualcomm.com>
 <CA+kEDGE1kb12pW_OH1n4LmB9PVtgEsft563p9Cx_Mxev9Em3Ow@mail.gmail.com>
 <jsynzhzzt4drqcrvbuprjnvu33go4gow3l3hxgafuczdn67uhm@2eq7c5rzflr5>
In-Reply-To: <jsynzhzzt4drqcrvbuprjnvu33go4gow3l3hxgafuczdn67uhm@2eq7c5rzflr5>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Fri, 18 Jul 2025 20:18:56 +0200
X-Gm-Features: Ac12FXzzYWrZjR3avCafumkyLvX__-G0ym7_pt9vsNv0Ix5JqyoJp0mkxUi2sRg
Message-ID: <CA+kEDGEFgUFkUozUYq85XXj8ZPhx=mCMJyjp+bE3+gvYpFTQUQ@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>,
 Dale Whinham <daleyo@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary="0000000000009a1b10063a382a38"
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

--0000000000009a1b10063a382a38
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Friday, Jul 18, 2025, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.co=
m>
wrote:
> On Thu, Jul 17, 2025 at 11:36:38PM +0200, J=C3=A9r=C3=B4me de Bretagne wr=
ote:
>> Le jeu. 17 juil. 2025 =C3=A0 23:10, Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> a =C3=A9crit :
>> >
>> > On 7/17/25 10:27 PM, J=C3=A9r=C3=B4me de Bretagne wrote:
>> > > On 2025/7/17 04:21, Xilin Wu <sophon@radxa.com> wrote :
>> > >>
>> > >> On 2025/7/15 01:35:42, Dale Whinham wrote:
>> > >>> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
>> > >>>
>> > >>> The OLED display in the Surface Pro 11 reports a maximum link rate
of
>> > >>> zero in its DPCD, causing it to fail to probe correctly.
>> > >>>
>> > >>> The Surface Pro 11's DSDT table contains some XML with an
>> > >>> "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
>> > >>> (8.1Gbps/HBR3).
>> > >>>
>> > >>> Add a quirk to conditionally override the max link rate if its
value
>> > >>> is zero specifically for this model.
>> > >>>
>> > >>> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gma=
il.com>
>> > >>> Signed-off-by: Dale Whinham <daleyo@gmail.com>
>> > >>> ---
>> > >>>   drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
>> > >>>   1 file changed, 13 insertions(+)
>> > >>>
>
> [...]
>
>>
>> > >
>> > > Is it a feature planned in the short-medium term within the MSM
driver?
>> > > If not, would a quirk like [4] be acceptable upstream in the
meanwhile?
>> >
>> > I'm not a display guy, but this looks like yet another block of code
>> > begging to be commonized across DP drivers,
>>
>> I agree 100% in principle, but the 3 implementations are different today=
.
>>
>> > so I wouldn't expect it to be a big blocker.
>>
>> Well, it is for me :)
>>
>> > Adding a panel quirk doesn't seem in order, as the panel is /probably/
>> > very much in spec, and it's the driver bit that's missing.
>>
>> I agree that a quirk shouldn't be needed. I guess we'll work on
>> upstreaming everything else and keep an out-of-tree patch for this
>> issue for the moment That's a bit sad as this will block regular
>> users from easily installing / testing via the Ubuntu Concept ISO
>> for instance.
>>
>> Or could the quirk be accepted temporarily with good comments
>> then reverted when the driver adds the missing support? I guess
>> it would depend on the time scale of this support landing.
>
> Unforutunately, there is more than that. We should also be writing the
> LINK_RATE_SET register. So, just setting the max_bw is not enough.

Maybe I've misunderstood. When you say max_bw is not enough,
are you talking about some future driver changes or about a potential
shorter-term fix?

I can confirm that this initial simple patch (and also the updated one
reusing the quirk list [4]) is enough to get the SP11 OLED display
working whereas it doesn't probe and remains off without such a fix.

Thanks,
J=C3=A9r=C3=B4me

[4] https://github.com/JeromeDeBretagne/linux-surface-pro-11/commit/d265cfb


> --
> With best wishes
> Dmitry
>

--0000000000009a1b10063a382a38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Friday, Jul 18, 2025, Dmitry Baryshkov &lt;<a href=3D"m=
ailto:dmitry.baryshkov@oss.qualcomm.com" target=3D"_blank">dmitry.baryshkov=
@oss.qualcomm.com</a>&gt; wrote:<br>&gt; On Thu, Jul 17, 2025 at 11:36:38PM=
 +0200, J=C3=A9r=C3=B4me de Bretagne wrote:<br>&gt;&gt; Le jeu. 17 juil. 20=
25 =C3=A0 23:10, Konrad Dybcio<br>&gt;&gt; &lt;<a href=3D"mailto:konrad.dyb=
cio@oss.qualcomm.com" target=3D"_blank">konrad.dybcio@oss.qualcomm.com</a>&=
gt; a =C3=A9crit :<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; On 7/17/25 10:27 PM, J=
=C3=A9r=C3=B4me de Bretagne wrote:<br>&gt;&gt; &gt; &gt; On 2025/7/17 04:21=
, Xilin Wu &lt;<a href=3D"mailto:sophon@radxa.com" target=3D"_blank">sophon=
@radxa.com</a>&gt; wrote :<br>&gt;&gt; &gt; &gt;&gt;<br>&gt;&gt; &gt; &gt;&=
gt; On 2025/7/15 01:35:42, Dale Whinham wrote:<br>&gt;&gt; &gt; &gt;&gt;&gt=
; From: J=C3=A9r=C3=B4me de Bretagne &lt;<a href=3D"mailto:jerome.debretagn=
e@gmail.com" target=3D"_blank">jerome.debretagne@gmail.com</a>&gt;<br>&gt;&=
gt; &gt; &gt;&gt;&gt;<br>&gt;&gt; &gt; &gt;&gt;&gt; The OLED display in the=
 Surface Pro 11 reports a maximum link rate of<br>&gt;&gt; &gt; &gt;&gt;&gt=
; zero in its DPCD, causing it to fail to probe correctly.<br>&gt;&gt; &gt;=
 &gt;&gt;&gt;<br>&gt;&gt; &gt; &gt;&gt;&gt; The Surface Pro 11&#39;s DSDT t=
able contains some XML with an<br>&gt;&gt; &gt; &gt;&gt;&gt; &quot;EDPOverr=
ideDPCDCaps&quot; block that defines the max link rate as 0x1E<br>&gt;&gt; =
&gt; &gt;&gt;&gt; (8.1Gbps/HBR3).<br>&gt;&gt; &gt; &gt;&gt;&gt;<br>&gt;&gt;=
 &gt; &gt;&gt;&gt; Add a quirk to conditionally override the max link rate =
if its value<br>&gt;&gt; &gt; &gt;&gt;&gt; is zero specifically for this mo=
del.<br>&gt;&gt; &gt; &gt;&gt;&gt;<br>&gt;&gt; &gt; &gt;&gt;&gt; Signed-off=
-by: J=C3=A9r=C3=B4me de Bretagne &lt;<a href=3D"mailto:jerome.debretagne@g=
mail.com" target=3D"_blank">jerome.debretagne@gmail.com</a>&gt;<br>&gt;&gt;=
 &gt; &gt;&gt;&gt; Signed-off-by: Dale Whinham &lt;<a href=3D"mailto:daleyo=
@gmail.com" target=3D"_blank">daleyo@gmail.com</a>&gt;<br>&gt;&gt; &gt; &gt=
;&gt;&gt; ---<br>&gt;&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0drivers/gpu/drm/msm=
/dp/dp_panel.c | 13 +++++++++++++<br>&gt;&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=
=A01 file changed, 13 insertions(+)<br>&gt;&gt; &gt; &gt;&gt;&gt;<br>&gt;<b=
r>&gt; [...]<br>&gt;<br>&gt;&gt;<br>&gt;&gt; &gt; &gt;<br>&gt;&gt; &gt; &gt=
; Is it a feature planned in the short-medium term within the MSM driver?<b=
r>&gt;&gt; &gt; &gt; If not, would a quirk like [4] be acceptable upstream =
in the meanwhile?<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; I&#39;m not a display g=
uy, but this looks like yet another block of code<br>&gt;&gt; &gt; begging =
to be commonized across DP drivers,<br>&gt;&gt;<br>&gt;&gt; I agree 100% in=
 principle, but the 3 implementations are different today.<br>&gt;&gt;<br>&=
gt;&gt; &gt; so I wouldn&#39;t expect it to be a big blocker.<br>&gt;&gt;<b=
r>&gt;&gt; Well, it is for me :)<br>&gt;&gt;<br>&gt;&gt; &gt; Adding a pane=
l quirk doesn&#39;t seem in order, as the panel is /probably/<br>&gt;&gt; &=
gt; very much in spec, and it&#39;s the driver bit that&#39;s missing.<br>&=
gt;&gt;<br>&gt;&gt; I agree that a quirk shouldn&#39;t be needed. I guess w=
e&#39;ll work on<br>&gt;&gt; upstreaming everything else and keep an out-of=
-tree patch for this<br>&gt;&gt; issue for the moment That&#39;s a bit sad =
as this will block regular<br>&gt;&gt; users from easily installing / testi=
ng via the Ubuntu Concept ISO<br>&gt;&gt; for instance.<br>&gt;&gt;<br>&gt;=
&gt; Or could the quirk be accepted temporarily with good comments<br>&gt;&=
gt; then reverted when the driver adds the missing support? I guess<br>&gt;=
&gt; it would depend on the time scale of this support landing.<br>&gt;<br>=
&gt; Unforutunately, there is more than that. We should also be writing the=
<br>&gt; LINK_RATE_SET register. So, just setting the max_bw is not enough.=
<br><br>Maybe I&#39;ve misunderstood. When you say max_bw is not enough, <b=
r><div>are you talking about some future driver changes or about a potentia=
l</div><div>shorter-term fix?</div><div><br></div><div>I can confirm that t=
his initial simple patch (and also the updated one</div><div>reusing the qu=
irk list [4]) is enough to get the SP11 OLED display</div><div>working wher=
eas it doesn&#39;t probe and remains off without such a fix.</div><br>Thank=
s,<br>J=C3=A9r=C3=B4me<br><br>[4] <a href=3D"https://github.com/JeromeDeBre=
tagne/linux-surface-pro-11/commit/d265cfb" target=3D"_blank">https://github=
.com/JeromeDeBretagne/linux-surface-pro-11/commit/d265cfb</a></div><br><br>=
&gt; --<br>&gt; With best wishes<br>&gt; Dmitry<br>&gt;

--0000000000009a1b10063a382a38--
