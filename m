Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D340F302779
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 17:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA2A6E17B;
	Mon, 25 Jan 2021 16:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6D16E17B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 16:08:20 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id f1so15983490edr.12
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 08:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XVuo1CNDgmB8ofiVYTMh67fS/hGq5CkB2yY740Bhv+U=;
 b=BrkZjm2lYitKqMDZHdqu8OB8THemccW2wg2Gz4Y6UwHQXhnzoKSxfF2A2kCNCh+xmq
 Un14PgLoNU2A5HDsqxur67TxoRYhlWIKGShFZxkHI+htc1f4K6wPQ+yb9BbIvyxu80ET
 o55Fb8XlaD9Dsl2Tb5lhjHvfYFH1/EbphwuPwIGubPxnBo6ZViiNXSzVQVhboyAMoB4v
 t+UtyaqEN+c48Pnme4kIOtzSZC39linqoAGP+d5wsH9h3ezcbpxxN33XkFLDPRF1iBvO
 mXK14Vf8K7A2Nm2ZsdEEGNqNakVjfUeXC3PgV33+J4KunRC1OGAPRPOHXKrorwq/vprZ
 cI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XVuo1CNDgmB8ofiVYTMh67fS/hGq5CkB2yY740Bhv+U=;
 b=dPww4Wmjyo8ES5uZUC824RhDqX3i2aV0MaV7SV3fr24NTQ1aoMgYBb85WhwVclkmnM
 60qtzEMcm/bCTvJnIAiY8Pw/Q4Vu5R8mU/iFm9Ezq8LCta3DhMkEnwQTUfQ7SxKm5wcR
 QCIc9fo5ZWM/uPRk6/2pUPnko8kQEeDvZEoVAr1q3UCMq2ioDpsblTCyDF2Tv/8H7xLn
 St9AFLYZccSeVL0+1HRcz12E4kfcw0cdmYgicaO2ecKC8DzMuULGrCBqYexhHj0l+ReN
 cWxZi3uvLz5w3vO9p9aRGKYnZz3CQT/pi/vTXMG42ZpFBSCOuiCFh5meGxl+w3St6GR9
 IIXA==
X-Gm-Message-State: AOAM530CGI/9o3x+5uLDQdCsAMS6TwVK3ak+XmsmqXlTwgS6DcOdZomm
 yG5Dcnuff5nfqJkkZYq0l1X3R1vtEwdsofgh6lc=
X-Google-Smtp-Source: ABdhPJzxvrHPehMOldWJ/TGXvbbz1R9WRsEJsljBfrIRndM6XPj2/eb93tbJ98hM4R/k14CGDLYbYrX8b7uq+o++I1U=
X-Received: by 2002:a05:6402:b30:: with SMTP id
 bo16mr1125583edb.84.1611590899430; 
 Mon, 25 Jan 2021 08:08:19 -0800 (PST)
MIME-Version: 1.0
References: <20210124044010.18678-1-mario.kleiner.de@gmail.com>
 <86DkveYU9PqmKT4KfDgHvFG_SytoDc4EyfmehALDIJBt7oH3Arn8O97o-pQ3yRU-kfHi-RuwA9zdI-Kz1aZUQBuOSnqmz1GdrRUNPNRsEu4=@emersion.fr>
 <CAEsyxyj-dHAk0qkkpOsycqfpPi_FW5zh_58hs1gi+6h1M_b8-Q@mail.gmail.com>
 <yEq1_Ipkzm_vP4BD6cKlonRVfMbfGXrlvxOG4XDkk_wg1UkPCdLj95I8pknonGjf2Bs1zYeErr1WXerrQjprE3k1vswj3E2Nzq-imF58ytM=@emersion.fr>
 <CAEsyxyhXhJohDYuDDLoQeg-QqhnWQ953GRO0Kf6Puj=f_NkU4w@mail.gmail.com>
 <YA61Aa07PhDucMyG@intel.com>
In-Reply-To: <YA61Aa07PhDucMyG@intel.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Mon, 25 Jan 2021 17:08:08 +0100
Message-ID: <CAEsyxyi2mM=cOT0zRRtm--A=t9p0WsGnpcs=7z7wyoZyHpExTA@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix HDMI_STATIC_METADATA_TYPE1 constant.
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1833043540=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1833043540==
Content-Type: multipart/alternative; boundary="00000000000015782c05b9bbbf63"

--00000000000015782c05b9bbbf63
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2021 at 1:09 PM Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linu=
x.intel.com>
wrote:

> On Sun, Jan 24, 2021 at 10:04:54PM +0100, Mario Kleiner wrote:
> > On Sun, Jan 24, 2021 at 9:24 PM Simon Ser <contact@emersion.fr> wrote:
> >
> > > On Sunday, January 24th, 2021 at 9:10 PM, Mario Kleiner <
> > > mario.kleiner.de@gmail.com> wrote:
> > >
> > > > But it still needs to be fixed if we want working HDR. I thought
> > > > libdrm copies the definitions from the kernel periodically, so the
> > > > fix should propagate?
> > >
> > > There will always be user-space that sends 1 instead of 0. This
> > > shouldn't fail on more recent kernels or it will be a regression.
> > >
> >
> > Yes, i know, regressing user-space is bad, but in this very specific
> case a
> > "good" one, if ever. At the moment, it wouldn't regress userspace simpl=
y
> > because the kernel doesn't actually check for the correct value in its
> HDR
> > metadata handling. But the value itself is sent as HDMI HDR metadata to
> the
> > attached HDR display monitor, so if the monitors firmware checks, it wi=
ll
> > classify the wrong value of 1 as invalid and disable HDR mode on the
> > display, which is certainly not what a HDR client application wants. An=
d
> > future HDR standards which will actually allocate the value 1 to a
> > different mode of HDR operation will switch to the wrong mode /
> > misinterpret the sent HDR metadata with hillarious results, which is al=
so
> > not in the interest of a HDR client application, or a HDR capable
> > compositor.
> >
> > Iow. if clients continue to use the wrong value 1 then HDR display will
> > break in various ways on correctly implemented HDR displays, but in a
> > mystifying and hard to debug way. The kernel rejecting a wrong setting
> > explicitly and forcing a bug fix in the client would be a blessing in
> this
> > case.
> >
> > I spent weeks last year, going in circles and hunting ghost bugs relate=
d
> to
> > HDR because much of the HDR stuff, both drivers and monitor firmware
> seems
> > to be in not a great shape. "Less wrong" would be a big step forward.
> > Especially with the cheaper HDR monitors it is difficult to see when
> things
> > go wrong, because we don't have good expectations on how proper HDR
> should
> > look and the lower end HDR displays don't help.
>
> This is not an uapi defintion anyway so fixing should be fine.
> I don't think we even check any of the client provided values, or do we?
> EOTF I think we do check, but IMO that check should probably just be
> nuked as well if we don't bother checking anything else.
>
>
I think we check only EOTF atm. That check does make sense though, as
userspace getting that wrong will definitely knock out even low-end HDR
monitors. My tests with a - supposed to be pretty good according to tests -
DisplayHDR-600 monitor suggest that that's pretty much the only thing the
monitor actually uses, apart from CRC checking the data packet.


> I was in fact going to suggest nuking this entire hdr_sink_metadata
> parsing as unused, but looks like amdgpu has started to use it for
> some backlight stuff of all things.
>

My gut feeling says we will need this info in the kernel in the future,
independent of current users. Probably especially if one wants to do
interesting things which combine HDR with VRR/DP-Adaptive sync, or future
HDR standards (dynamic HDR metadata?), those infos in the kernel may become
quite useful.
 In some way it would even be nice to have all that info exposed in parsed
form as a connector property or such, so all clients can use the same
parsed data instead of reinventing the wheel. So I'd vote against nuking it=
.

Thanks,
-mario

--00000000000015782c05b9bbbf63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Jan 25, 2021 at 1:09 PM Ville Syr=
j=C3=A4l=C3=A4 &lt;<a href=3D"mailto:ville.syrjala@linux.intel.com">ville.s=
yrjala@linux.intel.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Jan 24, 2021 at 10=
:04:54PM +0100, Mario Kleiner wrote:<br>
&gt; On Sun, Jan 24, 2021 at 9:24 PM Simon Ser &lt;<a href=3D"mailto:contac=
t@emersion.fr" target=3D"_blank">contact@emersion.fr</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Sunday, January 24th, 2021 at 9:10 PM, Mario Kleiner &lt;<br>
&gt; &gt; <a href=3D"mailto:mario.kleiner.de@gmail.com" target=3D"_blank">m=
ario.kleiner.de@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; But it still needs to be fixed if we want working HDR. I tho=
ught<br>
&gt; &gt; &gt; libdrm copies the definitions from the kernel periodically, =
so the<br>
&gt; &gt; &gt; fix should propagate?<br>
&gt; &gt;<br>
&gt; &gt; There will always be user-space that sends 1 instead of 0. This<b=
r>
&gt; &gt; shouldn&#39;t fail on more recent kernels or it will be a regress=
ion.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Yes, i know, regressing user-space is bad, but in this very specific c=
ase a<br>
&gt; &quot;good&quot; one, if ever. At the moment, it wouldn&#39;t regress =
userspace simply<br>
&gt; because the kernel doesn&#39;t actually check for the correct value in=
 its HDR<br>
&gt; metadata handling. But the value itself is sent as HDMI HDR metadata t=
o the<br>
&gt; attached HDR display monitor, so if the monitors firmware checks, it w=
ill<br>
&gt; classify the wrong value of 1 as invalid and disable HDR mode on the<b=
r>
&gt; display, which is certainly not what a HDR client application wants. A=
nd<br>
&gt; future HDR standards which will actually allocate the value 1 to a<br>
&gt; different mode of HDR operation will switch to the wrong mode /<br>
&gt; misinterpret the sent HDR metadata with hillarious results, which is a=
lso<br>
&gt; not in the interest of a HDR client application, or a HDR capable<br>
&gt; compositor.<br>
&gt; <br>
&gt; Iow. if clients continue to use the wrong value 1 then HDR display wil=
l<br>
&gt; break in various ways on correctly implemented HDR displays, but in a<=
br>
&gt; mystifying and hard to debug way. The kernel rejecting a wrong setting=
<br>
&gt; explicitly and forcing a bug fix in the client would be a blessing in =
this<br>
&gt; case.<br>
&gt; <br>
&gt; I spent weeks last year, going in circles and hunting ghost bugs relat=
ed to<br>
&gt; HDR because much of the HDR stuff, both drivers and monitor firmware s=
eems<br>
&gt; to be in not a great shape. &quot;Less wrong&quot; would be a big step=
 forward.<br>
&gt; Especially with the cheaper HDR monitors it is difficult to see when t=
hings<br>
&gt; go wrong, because we don&#39;t have good expectations on how proper HD=
R should<br>
&gt; look and the lower end HDR displays don&#39;t help.<br>
<br>
This is not an uapi defintion anyway so fixing should be fine.<br>
I don&#39;t think we even check any of the client provided values, or do we=
?<br>
EOTF I think we do check, but IMO that check should probably just be<br>
nuked as well if we don&#39;t bother checking anything else.<br>
<br></blockquote><div>=C2=A0</div><div>I think we check only EOTF atm. That=
 check does make sense though, as userspace getting that wrong will definit=
ely knock out even low-end HDR monitors. My tests with a - supposed to be p=
retty good according to tests - DisplayHDR-600 monitor suggest that that&#3=
9;s pretty much the only thing the monitor actually uses, apart from CRC ch=
ecking the data packet.<br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
I was in fact going to suggest nuking this entire hdr_sink_metadata<br>
parsing as unused, but looks like amdgpu has started to use it for<br>
some backlight stuff of all things.<br></blockquote><div><br></div><div>My =
gut feeling says we will need this info in the kernel in the future, indepe=
ndent of current users. Probably especially if one wants to do interesting =
things which combine HDR with VRR/DP-Adaptive sync, or future HDR standards=
 (dynamic HDR metadata?), those infos in the kernel may become quite useful=
.</div><div>=C2=A0In some way it would even be nice to have all that info e=
xposed in parsed form as a connector property or such, so all clients can u=
se the same parsed data instead of reinventing the wheel. So I&#39;d vote a=
gainst nuking it.</div><div><br></div><div>Thanks,</div><div>-mario<br></di=
v><br></div></div>

--00000000000015782c05b9bbbf63--

--===============1833043540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1833043540==--
