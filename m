Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 823F6D21486
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 22:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A8710E1C8;
	Wed, 14 Jan 2026 21:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oasis-open-org.20230601.gappssmtp.com header.i=@oasis-open-org.20230601.gappssmtp.com header.b="vy9ULI9Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E362B10E688
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 20:30:45 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-88fe44cce7eso1604136d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 12:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oasis-open-org.20230601.gappssmtp.com; s=20230601; t=1768422645; x=1769027445;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DH3Ity+JT/PeWLvKF6DGnQYLs6nO/Lcbt3oEN+D0rTc=;
 b=vy9ULI9QOaJ2ATk2YdTtYzd08wNDhwpasoisNLCtvZPSOhLAQgBehLpYpXr1rw1seA
 U7jizlSFP7+gZlNXpNpmDNEYNaAxyqUnzW+C/s+BCetBNQXYJcwTJjq0IznTc2e1lNyW
 WkivXcRnvQ8JDstE77X9OXyLFLeV/08sN/5AmvQasehmHYuFFespG5qX/ZpbqR48rssr
 8O6rRk4M3OiOOE0uEm6yAU29N29cOYT5UImJOpjcMtAlCWFCyve7d+kUgtlKG7tUXI0v
 oQg1JnwNqoU32nGR9Qmtx2rMr4SEKXanO6LL1alHg1LH4KkF6FqtjJExSONmKLpSIS7C
 lgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768422645; x=1769027445;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DH3Ity+JT/PeWLvKF6DGnQYLs6nO/Lcbt3oEN+D0rTc=;
 b=vUJixP4cq8bUYArBG1vAN07eSeo0WE7ehrGMIxYXeSUsIifgEILiif1u8hkS+5l8Ov
 GgVLTRgZuTzwWN/EUmH6Ojra6dexHNMvFNMAPZaZHjUi9QDfEpNt/NZ2Hz4pWzSSL89a
 25SLGQGZWZVdStJwnIsRpaN6K8CM3JZ1uN8twXiYEX6erNIIFLEInAHyUhz6yEpIml0V
 /Fdk5m2p2L+K3ZYZd2ED9/JAtgceS4cuXna0ka35FcsIXFtfU3FjdZE4Z2HXwnbIYvch
 Q3p8uEJ7dLdT+mXan/62ZmX7FswAmwO5+bIij1kyKeiW4X7R+AbGLEsi+hMBnsp6Fsom
 5a/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8/TOPA92aC4AKjKPWyP7lKxhopL4I7H6nvHxAHksIQ//IoTPhx2qlufflMRuVJlqPi+9JPB8Xfd0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7XBWR2xyURMY3XcOE9TNuiqS8MtYDn/BeMp++kzunQYHOT5rD
 W/s7ZJHKKM/fDZRZ+q09qH8fBm9AzNauNVdU/HumaVZyIbTt1VrjWA/zxezZJGe9PH3PzJt3zj0
 nwDhAZxT6QZohWn2jpEUjKIAMBFyB6KnUooQXTMeFlQ==
X-Gm-Gg: AY/fxX7FhF6I041k3/3bhh5cXPy7884ozRlcUYvVea0wrO76aCbIrBKMnt62IDPwqlD
 vJaMdDve27TwHlen7UeT2nozB2mUvgmFRHCUlY4Cu/ts4RSlqahzuHJRI0sGxpKM8SlaLaZIz6s
 EG+cDUxaqFCGQM4tEgX0n32/z0duFRz1olKMEsbnr2sigFI47SIH7zCv4Qlb1uiI2e94W84B985
 CrVrc4jaZXVDcFMTfs9aB4abHFOMz4CxOa3m+KdMQJO3dSjJAkom7vHcEIN8sgyZ9+VWSg1SA5y
 28EyW61gutE3fMeM5uGyo0mgn18AjtIHvgNT+QjUdAsvxPY6KjU9oe7gxGem
X-Received: by 2002:a05:6214:1bc6:b0:88f:c670:6aa5 with SMTP id
 6a1803df08f44-89274315bf7mr45960766d6.9.1768422644405; Wed, 14 Jan 2026
 12:30:44 -0800 (PST)
MIME-Version: 1.0
References: <CAAiF602+5JxVHEfZo-JaQ8rT3_E-ZLOw6unSpCY8Y_Fd3YJWmA@mail.gmail.com>
In-Reply-To: <CAAiF602+5JxVHEfZo-JaQ8rT3_E-ZLOw6unSpCY8Y_Fd3YJWmA@mail.gmail.com>
From: Kelly Cullinane <kelly.cullinane@oasis-open.org>
Date: Wed, 14 Jan 2026 15:30:07 -0500
X-Gm-Features: AZwV_QjZA9Okvv2vsjRtCDRkDLaInnFL8MemiJoube7Q50K4kTsXdJMYBgMeepw
Message-ID: <CAAiF603uQQ7duYYDVhDJTy6yn-wOjUj2W5kpwVCuqftOVeFxUA@mail.gmail.com>
Subject: Fwd: Invitation to comment on VIRTIO v1.4 CSD01
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000886ae206485efb82"
X-Mailman-Approved-At: Wed, 14 Jan 2026 21:11:25 +0000
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

--000000000000886ae206485efb82
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
From: Kelly Cullinane <kelly.cullinane@oasis-open.org>
Date: Wed, Jan 14, 2026 at 3:28=E2=80=AFPM
Subject: Invitation to comment on VIRTIO v1.4 CSD01
To: <virtio-dev@lists.linux.dev>, <OASIS-virtio@connectedcommunity.org>, <
virtio-comment@lists.linux.dev>


OASIS members and other interested parties,


OASIS and the VIRTIO TC are pleased to announce that VIRTIO v1.4 CSD01 is
now available for public review and comment.


VIRTIO TC aims to enhance the performance of virtual devices by
standardizing key features of the VIRTIO (Virtual I/O) Device Specification=
.


Virtual I/O Device (VIRTIO) Version 1.4

Committee Specification Draft 01 / Public Review Draft 01

09 December 2025


TEX:
https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.=
html
(Authoritative)

HTML:
https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.=
html

PDF:
https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.=
pdf


The ZIP containing the complete files of this release is found in the
directory:

https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.=
zip


How to Provide Feedback


OASIS and the VIRTIO TC value your feedback. We solicit input from
developers, users and

others, whether OASIS members or not, for the sake of improving the
interoperability and quality of its technical work.


The public review is now open and ends Friday, February 13 2026 at 23:59
UTC.


Comments may be submitted to the project=E2=80=99s comment mailing list at
virtio-comment@lists.linux.dev. You can subscribe to the list by sending an
email to

virtio-comment+subscribe@lists.linux.dev.


All comments submitted to OASIS are subject to the OASIS Feedback License,
which ensures that the feedback you provide carries the same obligations at
least as the obligations of the TC members. In connection with this public
review, we call your attention to the OASIS IPR Policy
<https://www.oasis-open.org/policies-guidelines/ipr/> applicable especially
to the work of this technical committee. All members of the TC should be
familiar with this document, which may create obligations regarding the
disclosure and availability of a member's patent, copyright, trademark and
license rights that read on an approved OASIS specification.


OASIS invites any persons who know of any such claims to disclose these if
they may be essential to the implementation of the above specification, so
that notice of them may be posted to the notice page for this TC's work.


Additional information about the specification and the VIRTIO TC can be
found at the TC=E2=80=99s public home page located here.
<https://groups.oasis-open.org/communities/tc-community-home2?CommunityKey=
=3Db3f5efa5-0e12-4320-873b-018dc7d3f25c>

--000000000000886ae206485efb82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">---------- Forwarded message ---------=
<br>From: <strong class=3D"gmail_sendername" dir=3D"auto">Kelly Cullinane</=
strong> <span dir=3D"auto">&lt;<a href=3D"mailto:kelly.cullinane@oasis-open=
.org">kelly.cullinane@oasis-open.org</a>&gt;</span><br>Date: Wed, Jan 14, 2=
026 at 3:28=E2=80=AFPM<br>Subject: Invitation to comment on VIRTIO v1.4 CSD=
01<br>To:  &lt;<a href=3D"mailto:virtio-dev@lists.linux.dev">virtio-dev@lis=
ts.linux.dev</a>&gt;,  &lt;<a href=3D"mailto:OASIS-virtio@connectedcommunit=
y.org">OASIS-virtio@connectedcommunity.org</a>&gt;,  &lt;<a href=3D"mailto:=
virtio-comment@lists.linux.dev">virtio-comment@lists.linux.dev</a>&gt;<br><=
/div><br><br><div dir=3D"ltr"><span id=3D"m_246052869587821151gmail-docs-in=
ternal-guid-f6a972b0-7fff-ad21-49fe-70c594d02e18"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:=
none;vertical-align:baseline;white-space:pre-wrap">OASIS members and other =
interested parties,=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt"><b style=3D"font-weight:normal" id=3D"m=
_246052869587821151gmail-docs-internal-guid-525989c3-7fff-0844-0483-60dd162=
6f22d"><br></b></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style=
:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;wh=
ite-space:pre-wrap">OASIS and the VIRTIO TC are pleased to announce that VI=
RTIO v1.4 CSD01 is now available for public review and comment.=C2=A0</span=
></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt"><b style=3D"font-weight:normal"><br></b></p><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:n=
one;vertical-align:baseline;white-space:pre-wrap">VIRTIO TC aims to </span>=
<span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(41,41,=
41);background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wr=
ap">enhance the performance of virtual devices by standardizing key feature=
s of the VIRTIO (Virtual I/O) Device Specification.</span></p><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><b style=3D"f=
ont-weight:normal"><br></b></p><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(34,34,34);background-color:rgb(255,255,255);font-w=
eight:700;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre-wrap">Virtual I/O Device (VIRTIO) Version=
 1.4</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;c=
olor:rgb(34,34,34);background-color:rgb(255,255,255);font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre-wrap">Committee Specification Draft 01 / Public Review Dr=
aft 01</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre-wrap">09 December 2025</span></p><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><b style=3D"font-weight:normal=
"><br></b></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:norm=
al;font-variant:normal;text-decoration:none;vertical-align:baseline;white-s=
pace:pre-wrap">TEX: </span><a href=3D"https://docs.oasis-open.org/virtio/vi=
rtio/v1.4/csprd01/virtio-v1.4-csprd01.html" style=3D"text-decoration:none" =
target=3D"_blank"><span style=3D"font-size:11pt;font-family:Arial,sans-seri=
f;color:rgb(17,85,204);background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:underline;vertical-align:bas=
eline;white-space:pre-wrap">https://docs.oasis-open.org/virtio/virtio/v1.4/=
csprd01/virtio-v1.4-csprd01.html</span></a><span style=3D"font-size:11pt;fo=
nt-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ve=
rtical-align:baseline;white-space:pre-wrap"> (Authoritative)</span></p><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">HTM=
L: </span><a href=3D"https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01=
/virtio-v1.4-csprd01.html" style=3D"text-decoration:none" target=3D"_blank"=
><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(17,85=
,204);background-color:transparent;font-weight:400;font-style:normal;font-v=
ariant:normal;text-decoration:underline;vertical-align:baseline;white-space=
:pre-wrap">https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1=
.4-csprd01.html</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:400=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre-wrap">PDF: </span><a href=3D"https://docs.oasis-op=
en.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.pdf" style=3D"text-de=
coration:none" target=3D"_blank"><span style=3D"font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(17,85,204);background-color:transparent;font-wei=
ght:400;font-style:normal;font-variant:normal;text-decoration:underline;ver=
tical-align:baseline;white-space:pre-wrap">https://docs.oasis-open.org/virt=
io/virtio/v1.4/csprd01/virtio-v1.4-csprd01.pdf</span></a></p><p dir=3D"ltr"=
 style=3D"line-height:1.2;background-color:rgb(255,255,255);margin-top:0pt;=
margin-bottom:0pt"><br></p><p dir=3D"ltr" style=3D"line-height:1.2;backgrou=
nd-color:rgb(255,255,255);margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-weight:400;font-style:normal;font-variant:normal;text-d=
ecoration:none;vertical-align:baseline;white-space:pre-wrap">The ZIP contai=
ning the complete files of this release is found in the directory:</span></=
p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
"><a href=3D"https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-=
v1.4-csprd01.zip" style=3D"text-decoration:none" target=3D"_blank"><span st=
yle=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(17,85,204);bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:underline;vertical-align:baseline;white-space:pre-wrap=
">https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd0=
1.zip</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><b style=3D"font-weight:normal"><br></b></p><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-weight:700;font-style:normal;font-variant:normal;te=
xt-decoration:none;vertical-align:baseline;white-space:pre-wrap">How to Pro=
vide Feedback</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt"><b style=3D"font-weight:normal"><br></b></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">OASIS=
 and the VIRTIO TC value your feedback. We solicit input from developers, u=
sers and=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sa=
ns-serif;color:rgb(0,0,0);background-color:transparent;font-weight:400;font=
-style:normal;font-variant:normal;text-decoration:none;vertical-align:basel=
ine;white-space:pre-wrap">others, whether OASIS members or not, for the sak=
e of improving the interoperability and quality of its technical work.</spa=
n></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><b style=3D"font-weight:normal"><br></b></p><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:=
none;vertical-align:baseline;white-space:pre-wrap">The public review is now=
 open</span><span style=3D"font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-weight:700;font-style:normal=
;font-variant:normal;text-decoration:none;vertical-align:baseline;white-spa=
ce:pre-wrap"> </span><span style=3D"font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-sty=
le:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;=
white-space:pre-wrap">and ends </span><span style=3D"font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-we=
ight:700;font-style:normal;font-variant:normal;text-decoration:none;vertica=
l-align:baseline;white-space:pre-wrap">Friday, February 13 2026 at 23:59 UT=
C.</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt"><b style=3D"font-weight:normal"><br></b></p><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-weight:400;font-style:normal;font-variant:normal;text-deco=
ration:none;vertical-align:baseline;white-space:pre-wrap">Comments may be s=
ubmitted to the project=E2=80=99s comment mailing list at </span><a href=3D=
"mailto:virtio-comment@lists.linux.dev" style=3D"text-decoration:none" targ=
et=3D"_blank"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(17,85,204);background-color:rgb(255,255,255);font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre-wrap">virtio-comment@lists.linux.dev</span></a><span styl=
e=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(34,34,34);backgr=
ound-color:rgb(255,255,255);font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">.=
 You can subscribe to the list by sending an email to</span></p><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(17,85,204);backgr=
ound-color:rgb(255,255,255);font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap"><=
a href=3D"mailto:virtio-comment%2Bsubscribe@lists.linux.dev" target=3D"_bla=
nk">virtio-comment+subscribe@lists.linux.dev</a>.</span></p><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><b style=3D"fon=
t-weight:normal"><br></b></p><p dir=3D"ltr" style=3D"line-height:1.656;back=
ground-color:rgb(255,255,255);margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-weight:400;font-style:normal;font-variant:normal;te=
xt-decoration:none;vertical-align:baseline;white-space:pre-wrap">All commen=
ts submitted to OASIS are subject to the OASIS Feedback License, which ensu=
res that the feedback you provide carries the same obligations at least as =
the obligations of the TC members. In connection with this public review, w=
e call your attention to the </span><a href=3D"https://www.oasis-open.org/p=
olicies-guidelines/ipr/" style=3D"text-decoration:none" target=3D"_blank"><=
span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(17,85,2=
04);background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:underline;vertical-align:baseline;white-space:p=
re-wrap">OASIS IPR Policy</span></a><span style=3D"font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weig=
ht:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-=
align:baseline;white-space:pre-wrap"> applicable especially to the work of =
this technical committee. All members of the TC should be familiar with thi=
s document, which may create obligations regarding the disclosure and avail=
ability of a member&#39;s patent, copyright, trademark and license rights t=
hat read on an approved OASIS specification.=C2=A0</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><b style=3D"fo=
nt-weight:normal"><br></b></p><p dir=3D"ltr" style=3D"line-height:1.656;bac=
kground-color:rgb(255,255,255);margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;font-weight:400;font-style:normal;font-variant:normal;t=
ext-decoration:none;vertical-align:baseline;white-space:pre-wrap">OASIS inv=
ites any persons who know of any such claims to disclose these if they may =
be essential to the implementation of the above specification, so that noti=
ce of them may be posted to the notice page for this TC&#39;s work.</span><=
/p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t"><b style=3D"font-weight:normal"><br></b></p><p dir=3D"ltr" style=3D"line=
-height:1.656;background-color:rgb(255,255,255);margin-top:0pt;margin-botto=
m:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-weight:400;font-style:normal;font=
-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pr=
e-wrap">Additional information about the specification and the VIRTIO TC ca=
n be found at the </span><a href=3D"https://groups.oasis-open.org/communiti=
es/tc-community-home2?CommunityKey=3Db3f5efa5-0e12-4320-873b-018dc7d3f25c" =
style=3D"text-decoration:none" target=3D"_blank"><span style=3D"font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(17,85,204);background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:underline;vertical-align:baseline;white-space:pre-wrap">TC=E2=80=99s pub=
lic home page located here.</span></a></p><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt"><br><br></p></span></div>
</div></div>

--000000000000886ae206485efb82--
