Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68974B3DAA7
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19BE10E387;
	Mon,  1 Sep 2025 07:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f4Azyq4T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567F210E0C6
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 17:33:13 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e96e1c82b01so2601880276.1
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 10:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756661592; x=1757266392; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iSs+3BSsT6KjUP79lOtcO25GNLDKcfQaco0GogBThYM=;
 b=f4Azyq4TsP4RTCowfZkuclNZGlfWDoGzG23trdOoSqM7uq8cMmyctK+imZzfUkyzjp
 sVqDGfwxPETaoTZQ4MDxO59Z5vm1+aw468rib0fiE2BLH0S7DGf/Buak8ihIT4VgvVxj
 Km1g60usiVCoosuizVdd6nIbws/OXzL9oLpTGBJ1dKDLhDLs+MkelC1M5uTAcI8EchH+
 LkK4UX4r9cSybL5Tk+Fh3DYdRNq71SJ6djGQkGxVquLVLyUbDPEbAK6swii898IqT1Hq
 ZlI1A/uoE3y25D6dyl7p64cyWRHwkRvtWvVsawArLXwkFD9czA4eHPkyN0OecqNHAmAN
 sJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756661592; x=1757266392;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iSs+3BSsT6KjUP79lOtcO25GNLDKcfQaco0GogBThYM=;
 b=wIQZKibJNnfE0ZYJ8XV3DVVZOBoaYYIR69mTjyvDW3YhApgyumDKgXyWPTZrn4TOwl
 q6aCeSvnuQIogXmfajLQphUAhFefpe1NetWZs059V66k3jQ9zpNdUxkbTaz0YqPgld5K
 wKB+tSqhsrWVjuUSV8ziNepyqUDYZLe6e1eQTMsWekZp0Rnp1qUTVDhWxbSI8R1TPt7M
 Fv7i03sJDN42Ke1sHF/lwj0TwHdOPaJOSxqMWNxFLUsF7woebUPHwH3QpoPFYV3t+zDh
 g6MX5F0tUqqegH829KTvPbTQCxtyjq5Mt5jGGFfrOCGnJxpYe8NF/1d8Fqsw2M3OWA0N
 l5mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwRYuN6WAPnWwozajTiKXhWoiw/+QuSXCoHRvnO/Ak/XSZERRQx+HHF4YDwADm7vWFMP6b5kJKnrA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJIi0v4QOm5cxJh2Dd7e4Q6SSso1JQ+Wvh3L6U0xWcgv8QqzYi
 PPvdjUa/UUFz0ndNlvxpVdqLDzLhsZqaiqgRRb83KCtCat0YlN9j+xlP3Q71LnKuBZPXSfZMMuk
 Z72ICRY1soJApiQEl5ki5ux6lkd+Cn18=
X-Gm-Gg: ASbGnctFvJs3isnSYY71CPubghfdULY6iMXqJESJ3SvH1kjKo6xiS59VYQEODD2e/rL
 Y+hZeEP4+cKeLalAlqsrzRbKwfpATr8oT+9OHs3lyqS+dNy7eROqQddkGzaha93yagojKawt7CL
 p/njm4DcveNS6OoHB6IR3l1QEb4/Qm4G1r9YVev+VBYy5ue07xsD7wXnDHOSCYRrgvUK7CThAG0
 pRclIL5QdARLG49yoBunKYWpBJN0zo6Z3345SIaY29E2s1mmuNv
X-Google-Smtp-Source: AGHT+IHkZ9pxFAYUF+l2+iSwm3NS4Is8qrg9Kr7LXE3WZ2gDJen3UFALMyKG8DzJTbSaq4Az8s+4IQqfDlUoJD/ERf8=
X-Received: by 2002:a05:690c:4c11:b0:719:4cff:16db with SMTP id
 00721157ae682-722764f3ccfmr61399927b3.25.1756661592233; Sun, 31 Aug 2025
 10:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250831141522.7813-1-mohin24khertz@gmail.com>
 <72852085-9f20-48b8-b51a-c41df915bff0@infradead.org>
 <CAHTVRczWCe9opsNr9w-xobzUYjpWEhHNY1BEnt3DBfganwik=Q@mail.gmail.com>
In-Reply-To: <CAHTVRczWCe9opsNr9w-xobzUYjpWEhHNY1BEnt3DBfganwik=Q@mail.gmail.com>
From: Mohin Nadaf <mohin24khertz@gmail.com>
Date: Sun, 31 Aug 2025 23:02:34 +0530
X-Gm-Features: Ac12FXwmDC7mzjt0ep0Efm6EakpiWk4YaEOvl0FTLUM4yHeepQu1UjprExPjaKo
Message-ID: <CAHTVRcwjK0nSXTfVw0ntSUd2ESuLk6JDFR17w8NK2WnhWf6jPw@mail.gmail.com>
Subject: Re: [PATCH] docs: gpu: fix spelling error in drm-uapi.rst
To: Randy Dunlap <rdunlap@infradead.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linux.dev
Content-Type: multipart/alternative; boundary="0000000000003218c8063daca6ab"
X-Mailman-Approved-At: Mon, 01 Sep 2025 07:02:45 +0000
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

--0000000000003218c8063daca6ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for pointing this out, Randy. I have checked the lore link and
confirmed that the same typo fix was already submitted on Aug 21st. I
apologize for the duplicate submission. I should have checked recent
patches before sending. I will verify existing patches in git log and
lore.kernel.org before submitting future patches.

Regards,
Mohin Nadaf


On Sun, Aug 31, 2025 at 10:45=E2=80=AFPM Mohin Nadaf <mohin24khertz@gmail.c=
om>
wrote:

> Thank you for pointing this out, Randy. I have checked the lore link and
> confirmed that the same typo fix was already submitted on Aug 21st. I
> apologize for the duplicate submission. I should have checked recent
> patches before sending. I will verify existing patches in git log and
> lore.kernel.org before submitting future patches.
>
> Regards,
> Mohin Nadaf
>
> On Sun, Aug 31, 2025 at 10:05=E2=80=AFPM Randy Dunlap <rdunlap@infradead.=
org>
> wrote:
>
>>
>>
>> On 8/31/25 7:15 AM, mohin24khertz@gmail.com wrote:
>> > From: Mohin Nadaf <mohin24khertz@gmail.com>
>> >
>> > Fix typo 'unpriviledged' -> 'unprivileged' in DRM UAPI
>> > documentation describing error codes for operations
>> > requiring elevated privileges.
>> >
>> > Signed-off-by: Mohin Nadaf <mohin24khertz@gmail.com>
>> > ---
>> >  Documentation/gpu/drm-uapi.rst | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/Documentation/gpu/drm-uapi.rst
>> b/Documentation/gpu/drm-uapi.rst
>> > index 843facf01b2d..7435664a1ffe 100644
>> > --- a/Documentation/gpu/drm-uapi.rst
>> > +++ b/Documentation/gpu/drm-uapi.rst
>> > @@ -535,7 +535,7 @@ ENOSPC:
>> >  EPERM/EACCES:
>> >          Returned for an operation that is valid, but needs more
>> privileges.
>> >          E.g. root-only or much more common, DRM master-only operation=
s
>> return
>> > -        this when called by unpriviledged clients. There's no clear
>> > +        this when called by unprivileged clients. There's no clear
>> >          difference between EACCES and EPERM.
>> >
>> >  ENODEV:
>>
>> Hi,
>>
>> There was a patch for this on Aug. 21, 2025, but I don't know if it has
>> been
>> applied/merged anywhere yet.  It could be in one of the DRM git trees --
>> I don't know.
>>
>> https://gitlab.freedesktop.org/drm/misc/kernel.git
>> or
>> https://gitlab.freedesktop.org/drm/kernel.git
>>
>>
>> https://lore.kernel.org/all/20250821025957.22546-3-rakuram.e96@gmail.com=
/
>>
>> thanks.
>> --
>> ~Randy
>>
>>

--0000000000003218c8063daca6ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thank you for pointing this out, Randy. I=
 have checked the lore link and confirmed that the same typo fix was alread=
y submitted on Aug 21st. I apologize for the duplicate submission. I should=
 have checked recent patches before sending. I will verify existing patches=
 in git log and <a href=3D"http://lore.kernel.org">lore.kernel.org</a> befo=
re submitting future patches.<br><br>Regards,<br>Mohin Nadaf</div><br><br><=
div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"g=
mail_attr">On Sun, Aug 31, 2025 at 10:45=E2=80=AFPM Mohin Nadaf &lt;<a href=
=3D"mailto:mohin24khertz@gmail.com">mohin24khertz@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
>Thank you for pointing this out, Randy. I have checked the lore link and c=
onfirmed that the same typo fix was already submitted on Aug 21st. I apolog=
ize for the duplicate submission. I should have checked recent patches befo=
re sending. I will verify existing patches in git log and <a href=3D"http:/=
/lore.kernel.org" target=3D"_blank">lore.kernel.org</a> before submitting f=
uture patches. <br><br>Regards, <br>Mohin Nadaf</div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 31, 2025 at 10:0=
5=E2=80=AFPM Randy Dunlap &lt;<a href=3D"mailto:rdunlap@infradead.org" targ=
et=3D"_blank">rdunlap@infradead.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><br>
<br>
On 8/31/25 7:15 AM, <a href=3D"mailto:mohin24khertz@gmail.com" target=3D"_b=
lank">mohin24khertz@gmail.com</a> wrote:<br>
&gt; From: Mohin Nadaf &lt;<a href=3D"mailto:mohin24khertz@gmail.com" targe=
t=3D"_blank">mohin24khertz@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Fix typo &#39;unpriviledged&#39; -&gt; &#39;unprivileged&#39; in DRM U=
API<br>
&gt; documentation describing error codes for operations<br>
&gt; requiring elevated privileges.<br>
&gt; <br>
&gt; Signed-off-by: Mohin Nadaf &lt;<a href=3D"mailto:mohin24khertz@gmail.c=
om" target=3D"_blank">mohin24khertz@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 Documentation/gpu/drm-uapi.rst | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-ua=
pi.rst<br>
&gt; index 843facf01b2d..7435664a1ffe 100644<br>
&gt; --- a/Documentation/gpu/drm-uapi.rst<br>
&gt; +++ b/Documentation/gpu/drm-uapi.rst<br>
&gt; @@ -535,7 +535,7 @@ ENOSPC:<br>
&gt;=C2=A0 EPERM/EACCES:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Returned for an operation that is va=
lid, but needs more privileges.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 E.g. root-only or much more common, =
DRM master-only operations return<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 this when called by unpriviledged clients=
. There&#39;s no clear<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 this when called by unprivileged clients.=
 There&#39;s no clear<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 difference between EACCES and EPERM.=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ENODEV:<br>
<br>
Hi,<br>
<br>
There was a patch for this on Aug. 21, 2025, but I don&#39;t know if it has=
 been<br>
applied/merged anywhere yet.=C2=A0 It could be in one of the DRM git trees =
--<br>
I don&#39;t know.<br>
<br>
<a href=3D"https://gitlab.freedesktop.org/drm/misc/kernel.git" rel=3D"noref=
errer" target=3D"_blank">https://gitlab.freedesktop.org/drm/misc/kernel.git=
</a><br>
or<br>
<a href=3D"https://gitlab.freedesktop.org/drm/kernel.git" rel=3D"noreferrer=
" target=3D"_blank">https://gitlab.freedesktop.org/drm/kernel.git</a><br>
<br>
<br>
<a href=3D"https://lore.kernel.org/all/20250821025957.22546-3-rakuram.e96@g=
mail.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/all=
/20250821025957.22546-3-rakuram.e96@gmail.com/</a><br>
<br>
thanks.<br>
-- <br>
~Randy<br>
<br>
</blockquote></div>
</blockquote></div></div>

--0000000000003218c8063daca6ab--
