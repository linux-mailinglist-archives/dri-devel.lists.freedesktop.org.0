Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CD95B3ACA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 16:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677D910EDDB;
	Fri,  9 Sep 2022 14:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0305610EDD7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 14:37:50 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-3452214cec6so21478907b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 07:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=q+vcfFI0rraNJVqnE3EAFWof7tptBIHjl+9SqKL5vlw=;
 b=V87SX4pgqJB2WTwsEfWPON0Alrbd1hWivATCwNpqaJVJ5v+L5ZTs+jKbXCO9+EcKXv
 bZB5AFDmkOoLlo+H0cxeh2fCLts91rlpLIPM52tAEkkLIKYw5ZnVNvffzAyyZDI9PT18
 3OMZOCEAhqi8UOL3khPaleXufjzr9HltNbRhRMqPakPlwlH5jx66Pf6JwtMphA1eLE9k
 Pbs4V0WxcB6TAfcFKF5fq+VHDqUaTnmjgtwaim9H4L1pn3KMvj+KmR2xoc81/mbqusGX
 kfW5rfUur3zxt8+X9MpWs68VF+yRfwKuN+fvGzr1S2Gxp5oP4So0WCwHrXl6HnqDsnUO
 rC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=q+vcfFI0rraNJVqnE3EAFWof7tptBIHjl+9SqKL5vlw=;
 b=EwBgC7UHV9fO/M6lRgBLBhiI3tI7ekEsE4hpARmzNaFMJBMoM4D8nLsV3HJlezvH2L
 Hnr/JOEs6LFYj/stPM4hMpg6CEcVna40KSur3DsjdrXGbSJTd4qKTQ+qaicUXQOFJONJ
 NjpJC68waL0wVREuQnNEFbNov8uY1MX8Mw7B7tsZUwEihEQws2G3yN9NoeFX9oTIPzqz
 f9TStPCsvq8eWoyckFIPXPNwwtyctCC/N4vTIeGrY22W+mZdVMzMUu/qmlAmy7G/a0uD
 uUZn7E04vN754xpRXty6+4igFzgtau5N3gDzViVrIj+dtZDgLq+RusY3yVBYzkRPYP6L
 oqiw==
X-Gm-Message-State: ACgBeo1myEyVWZ/wa8WmIZ9/4Bxe9fyr5xVdACVpIoKKI2aswt/oAQDn
 YIOYRN3f5hGoxkONGurYet6udB5J9lmX/Uqvhqk9da4OUPU=
X-Google-Smtp-Source: AA6agR5B4E1vA2dXbqbzSySK3EYC6rWoEpx4zzr+Bw4Q4yHNllx8ZMpcEdlRtRi0Omtty9MAbSSz4iR83LeRUQH965s=
X-Received: by 2002:a0d:d84a:0:b0:345:1ef9:e814 with SMTP id
 a71-20020a0dd84a000000b003451ef9e814mr11703241ywe.303.1662734269965; Fri, 09
 Sep 2022 07:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <c796e05d-6c74-3011-89d3-226e54455f06@redhat.com>
 <bZJU9OkYWFyaLHVa4XUE4d5iBTPFXBRyPe1wMd_ztKh5VBMu-EDNGoUDpvwtFn_u9-JMvN8QmIZVS3pzMZM_hZTkTCA9gOBnCGXc5HFmsnc=@emersion.fr>
In-Reply-To: <bZJU9OkYWFyaLHVa4XUE4d5iBTPFXBRyPe1wMd_ztKh5VBMu-EDNGoUDpvwtFn_u9-JMvN8QmIZVS3pzMZM_hZTkTCA9gOBnCGXc5HFmsnc=@emersion.fr>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 9 Sep 2022 15:36:06 +0100
Message-ID: <CAPj87rPsS4TagVKQ+abMvH7APu1--Kjmt_U6_c=H1TWA5aDFdA@mail.gmail.com>
Subject: Re: Meeting (BOF) at Plumbers Dublin to discuss backlight brightness
 as connector object property RFC?
To: Simon Ser <contact@emersion.fr>
Content-Type: multipart/alternative; boundary="000000000000847d4d05e83f7dfa"
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000847d4d05e83f7dfa
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Sept 2022 at 12:50, Simon Ser <contact@emersion.fr> wrote:

> On Friday, September 9th, 2022 at 12:23, Hans de Goede <
> hdegoede@redhat.com> wrote:
> > "people using
> > non fully integrated desktop environments like e.g. sway often use custom
> > scripts binded to hotkeys to get functionality like the brightness
> > up/down keyboard hotkeys changing the brightness. This typically involves
> > e.g. the xbacklight utility.
> >
> > Even if the xbacklight utility is ported to use kms with the new
> connector
> > object brightness properties then this still will not work because
> > changing the properties will require drm-master rights and e.g. sway will
> > already hold those."
>
> I don't think this is a good argument. Sway (which I'm a maintainer of)
> can add a command to change the backlight, and then users can bind their
> keybinding to that command. This is not very different from e.g. a
> keybind to switch on/off a monitor.
>
> We can also standardize a protocol to change the backlight across all
> non-fully-integrated desktop environments (would be a simple addition
> to output-power-management [1]), so that a single tool can work for
> multiple compositors.


Yeah, I mean, as one of the main people arguing that non-fully-integrated
desktops are not the design we want, I agree with Simon.

Cheers,

Daniel

--000000000000847d4d05e83f7dfa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 9 Sept 2022 at 12:50, Simon Ser &=
lt;<a href=3D"mailto:contact@emersion.fr">contact@emersion.fr</a>&gt; wrote=
:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Friday, September 9th, 2022 at 12:23, Hans de Goede &lt;<a =
href=3D"mailto:hdegoede@redhat.com" target=3D"_blank">hdegoede@redhat.com</=
a>&gt; wrote:<br>
&gt; &quot;people using<br>
&gt; non fully integrated desktop environments like e.g. sway often use cus=
tom<br>
&gt; scripts binded to hotkeys to get functionality like the brightness<br>
&gt; up/down keyboard hotkeys changing the brightness. This typically invol=
ves<br>
&gt; e.g. the xbacklight utility.<br>
&gt; <br>
&gt; Even if the xbacklight utility is ported to use kms with the new conne=
ctor<br>
&gt; object brightness properties then this still will not work because<br>
&gt; changing the properties will require drm-master rights and e.g. sway w=
ill<br>
&gt; already hold those.&quot;<br>
<br>
I don&#39;t think this is a good argument. Sway (which I&#39;m a maintainer=
 of)<br>
can add a command to change the backlight, and then users can bind their<br=
>
keybinding to that command. This is not very different from e.g. a<br>
keybind to switch on/off a monitor.<br>
<br>
We can also standardize a protocol to change the backlight across all<br>
non-fully-integrated desktop environments (would be a simple addition<br>
to output-power-management [1]), so that a single tool can work for<br>
multiple compositors.</blockquote><div><br></div><div>Yeah, I mean, as one =
of the main people arguing that non-fully-integrated desktops are not the d=
esign we want, I agree with Simon.</div><div><br></div><div>Cheers,</div></=
div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div cl=
ass=3D"gmail_quote"><div>Daniel</div></div></blockquote></div>

--000000000000847d4d05e83f7dfa--
