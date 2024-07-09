Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 345DC92B9D7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 14:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CBE10E53A;
	Tue,  9 Jul 2024 12:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qks9nUjU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4701510E53A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 12:46:05 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e03c689addcso5399509276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 05:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720529164; x=1721133964; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I9BG/BrQPycsfSCXIsExfIO9vtBWQyMhcG9F08JT+wg=;
 b=Qks9nUjUZsVow7bW1zxu30bBF9QTr8q9pBAeVQNcBjNlW2rjiYxrhDIWt43chz2xS1
 IJSkxTItTqwx5yGVwYBgQTGNEWkYNjXjR3Pp8Q9J3TaApYS7+x2+PqowqkUDy269hBiU
 u549fmD+zB1X3UUBnIgpAmlAqx168DwS09eKRR7PgCD2YIoA4BuTF9kGxQIA6BIjCObu
 fnAx/dNt4EU7eb9Zcw9oaWUWISirF6GCMzF5P5KJfDhvwi1LNj7DkhjlOcB1cMRK6Srj
 1xRkXcStOJD5ujSqYSC23xQqMeXlVovjPjcL2jWHI5jpmSF6AddON+YE+40thLu5hQKC
 jH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720529164; x=1721133964;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I9BG/BrQPycsfSCXIsExfIO9vtBWQyMhcG9F08JT+wg=;
 b=jErsesxX8hr7hqFyJtamfhlnNe6/6410rVacXTGHZOtrov0gKdJH83rTQnyBt3YwFk
 V3hUXjIzpSLriuXyDpNQnBJ869cvGm8cr8W6KYn4t2VOG1DPE+QS0HnWFMoVudWroSat
 +ChZAp09Ds90lZmI13lgOsf4pWD4ABhyuFp4RApnTRdhSbpHJRFQBXVkea8hGMIdRMpp
 XHzjihM0k5jydOWwPqWRLFqdwpmSocF07PVE1RSKM1qLMtg9uADSQYzJOVwm8/+rAnM+
 juvpLlV8Qoy1NI/Yw4ClnLCbTgy2KVHaDbg97ZLVQF2aKEnBkeLArSal9RwqWsafggtF
 r1jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq0Fa2nnOgC4yG4ZYdzhHHA1TQ8vtJeZnerLnb7Zy1n2GJ2CAQoy5sxR+ILjFEYI0iXZQlK7/PhvIXM2nBPoGNqkyFhBYYk7laHzaompqa
X-Gm-Message-State: AOJu0YwU4LJ2+1Kc/sjuf+lSPeWV/9bSwQFMqjwcNJY2cjP+JKU6zZjw
 NBxQHX1f0jiVcbVn3/8gkl0DvlJererzSHO+UFRMvFKLNCTkEYeczeI23S7o1AFyk6CwuLTgJJ7
 5gY34ei6mcPN1Ikpsk+goa60+vrE=
X-Google-Smtp-Source: AGHT+IGGl82wMiShxFArVBOXzy4SGD1pNQXCWOYdqfIm1wNpqFwUU+8M6OzVm7FpGFY0Z6Bv1js7ca9wa5IHZxBem9Y=
X-Received: by 2002:a25:9cc9:0:b0:e03:61d4:ab35 with SMTP id
 3f1490d57ef6-e041b227162mr2855747276.53.1720529164151; Tue, 09 Jul 2024
 05:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240708151857.40538-1-stefano.radaelli21@gmail.com>
 <172045725750.3389992.15451403448241421795.robh@kernel.org>
In-Reply-To: <172045725750.3389992.15451403448241421795.robh@kernel.org>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Tue, 9 Jul 2024 14:45:53 +0200
Message-ID: <CAK+owohBrewYFpDKjsE5iWC5OQ3p6S_9fwj7DWa1Ux2h8CXcAw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: ti,
 sn65dsi83: add burst-mode-disabled
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Marek Vasut <marex@denx.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 "Noah J . Rosa" <noahj.rosa@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000a7b45d061ccfe9c0"
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

--000000000000a7b45d061ccfe9c0
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

Thank you a lot for your prompt feedbacks.
I'm really sorry for all the mistakes, it is the first time that I try to
submit a patch and i thought I followed the guideline but clearly that was
not the case.

 @Marek Vasut <marex@denx.de> About your question to why disabling
burst-mode:
- I agree with you that Burst Mode is the preferred way to send data. For
that reason I created the new flag in a way that, if not used in dts, burst
mode remains active by default.
  However, I decide to introduced this property because I have noticed that
some dual-channel panels work better in non-burst mode (even if less
efficient), and since the sn65dsi84 datasheet allows this setting, I
thought to give this opportunity to users.
  What do you think about it?

After reading better the documentation, I understood that I have to send a
Patch Series that includes binding documentation, the implementation and a
cover letter. Is that correct? Should I start a new thread or should I
continue this one?

Thank you very much for your support and your patience,

Best regards,

Stefano

Il giorno lun 8 lug 2024 alle ore 18:47 Rob Herring (Arm) <robh@kernel.org>
ha scritto:

>
> On Mon, 08 Jul 2024 17:18:56 +0200, stefano.radaelli21@gmail.com wrote:
> > From: Stefano Radaelli <stefano.radaelli21@gmail.com>
> >
> > It allows to disable Burst video mode
> >
> > Co-developed-by: Noah J. Rosa <noahj.rosa@gmail.com>
> > Signed-off-by: Noah J. Rosa <noahj.rosa@gmail.com>
> > Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
> > ---
> >  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml       | 3 +++
> >  1 file changed, 3 insertions(+)
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml:
> burst-mode-disabled: missing type definition
>
> doc reference errors (make refcheckdocs):
>
> See
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240708151857.40538-1-stefano.radaelli21@gmail.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your
> schema.
>
>

--000000000000a7b45d061ccfe9c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello everyone,<br><br>Thank you a lot for your prompt fee=
dbacks.<br>I&#39;m really sorry for all the mistakes, it is the first time =
that I try to submit a patch and i thought I followed the guideline but cle=
arly that was not the case.<br><br>=C2=A0<a class=3D"gmail_plusreply" id=3D=
"plusReplyChip-0" href=3D"mailto:marex@denx.de" tabindex=3D"-1">@Marek Vasu=
t</a>=C2=A0About your question to why disabling burst-mode:<br>- I agree wi=
th you that Burst Mode is the preferred way to send data. For that reason I=
 created the new flag in a way that, if not used in dts, burst mode remains=
 active by default.<br><div>=C2=A0 However, I decide to introduced this pro=
perty because I have noticed that some dual-channel panels work better in n=
on-burst mode (even if less efficient), and since the sn65dsi84 datasheet a=
llows this setting, I thought to give this opportunity to users.<br>=C2=A0 =
What do you think about it?<br><br>After reading better the documentation, =
I understood that I have to send a Patch Series that includes binding docum=
entation, the implementation and a cover letter. Is that correct? Should I =
start a new thread or should I continue this one?<br><br>Thank you very muc=
h for your support and your patience,<br><br>Best regards,<br><br>Stefano</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">Il giorno lun 8 lug 2024 alle ore 18:47 Rob Herring (Arm) &lt;<a href=
=3D"mailto:robh@kernel.org">robh@kernel.org</a>&gt; ha scritto:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><br>
On Mon, 08 Jul 2024 17:18:56 +0200, <a href=3D"mailto:stefano.radaelli21@gm=
ail.com" target=3D"_blank">stefano.radaelli21@gmail.com</a> wrote:<br>
&gt; From: Stefano Radaelli &lt;<a href=3D"mailto:stefano.radaelli21@gmail.=
com" target=3D"_blank">stefano.radaelli21@gmail.com</a>&gt;<br>
&gt; <br>
&gt; It allows to disable Burst video mode<br>
&gt; <br>
&gt; Co-developed-by: Noah J. Rosa &lt;<a href=3D"mailto:noahj.rosa@gmail.c=
om" target=3D"_blank">noahj.rosa@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Noah J. Rosa &lt;<a href=3D"mailto:noahj.rosa@gmail.com=
" target=3D"_blank">noahj.rosa@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Stefano Radaelli &lt;<a href=3D"mailto:stefano.radaelli=
21@gmail.com" target=3D"_blank">stefano.radaelli21@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 3 +++<br>
&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt; <br>
<br>
My bot found errors running &#39;make dt_binding_check&#39; on your patch:<=
br>
<br>
yamllint warnings/errors:<br>
<br>
dtschema/dtc warnings/errors:<br>
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dis=
play/bridge/ti,sn65dsi83.yaml: burst-mode-disabled: missing type definition=
<br>
<br>
doc reference errors (make refcheckdocs):<br>
<br>
See <a href=3D"https://patchwork.ozlabs.org/project/devicetree-bindings/pat=
ch/20240708151857.40538-1-stefano.radaelli21@gmail.com" rel=3D"noreferrer" =
target=3D"_blank">https://patchwork.ozlabs.org/project/devicetree-bindings/=
patch/20240708151857.40538-1-stefano.radaelli21@gmail.com</a><br>
<br>
The base for the series is generally the latest rc1. A different dependency=
<br>
should be noted in *this* patch.<br>
<br>
If you already ran &#39;make dt_binding_check&#39; and didn&#39;t see the a=
bove<br>
error(s), then make sure &#39;yamllint&#39; is installed and dt-schema is u=
p to<br>
date:<br>
<br>
pip3 install dtschema --upgrade<br>
<br>
Please check and re-submit after running the above command yourself. Note<b=
r>
that DT_SCHEMA_FILES can be set to your schema file to speed up checking<br=
>
your schema. However, it must be unset to test all examples with your schem=
a.<br>
<br>
</blockquote></div>

--000000000000a7b45d061ccfe9c0--
