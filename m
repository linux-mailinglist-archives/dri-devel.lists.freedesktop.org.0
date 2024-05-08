Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903358BFC7D
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 13:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9C110FB39;
	Wed,  8 May 2024 11:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="cyinPoiU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D6610FB3B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 11:43:47 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2b38f2e95aeso558317a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 04:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715168627; x=1715773427;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VzEeV8O7cqpPCMasGDN5yB28tX49+B8gmMSvUBqc6vQ=;
 b=cyinPoiUmcjOHXL7N88Djc1saXvsD0L3E6AZMDJXneQprVVaDp8M9seyEhIHJqWjcN
 LzoLb72vvvDvpgmd+ZyArymEg5M0h73bMV7hAFidBjQULkwYr3qmR96JaLcqpA8IG6kk
 qI4fv84jFZAjhNdsRecKcv2GL5LOolLmK8lh6leZQUIYjJqNNny0oXSSgtDhQ/1IyK2y
 5LAQthaITKuF9crXIdSljhjOXjqekXTVg/DQuJEnBtkLLVa9WyKbK1AF1OE92y8HQ5XD
 yBTciywuVXD9ENhICMrw3IhYHdNNDhNl+fLBQzbOsBblP0xd1sk8EWwqku057eFW91ox
 +4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715168627; x=1715773427;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VzEeV8O7cqpPCMasGDN5yB28tX49+B8gmMSvUBqc6vQ=;
 b=noeK4zLyaonrxAB0E350Q3H+BRhmkIsyOttHR7CK0AbuOCAGbfTzF491/JzDrN8u/i
 DbDzXGiK3lx7dVxDUUOFGu7RCH1zYEf60Sq5VI3GbTVJQUDbWVfqtM/vMwq/bwUFPP0t
 wfnKF5pki5uA9188EgLtHauW2wbfSuIR37QgdVwYlynozvl76RZICFdHd/AHhZTgqiEz
 IKxLlA2mius9Vb2lMtEsVNe4ES+G0N22GcstI3XqlPvqOamVhve/rhL9CNXyqhLQsNou
 62qxfQXupvdkYjKH4BhRDCNMhR+OgdCw4XCZaXpIPHXVF1OzPGC14w7sz6s/0GD0u2LW
 kwtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsX3nT40oYD/O9tJYxLUDt+Pq4exo/TGzZXag5OaLCQVARYcK7eJ5AigpI3h5kijRyvVWy7lka/dGlrJjL0i0d2uxE/mFB0fgRmGOAIBqE
X-Gm-Message-State: AOJu0YxLVlhDM8/U3jvOZ+W+HG5WYJoHR/T+NS88NVUsG08X2n8OI+is
 02CgJ2+W7lX8F21McECGKVbo93EHSLmjNZ60viT88RmUsg0RHn71B4wxIJ/LqcLmQvpfBl3PXPy
 i3CXqHXF+21c4T+ei6s+/OWUFs6YuwGzrj6XT8w==
X-Google-Smtp-Source: AGHT+IEO3bd85u0B2AuxdYue4avxAitA4qBL7f0hd7JLyvHCW/eV8DnhuJEJqXEQqub2JjhK5jzqGCHK0lLkb/fyC7g=
X-Received: by 2002:a17:90a:fb96:b0:2b2:802f:e90a with SMTP id
 98e67ed59e1d1-2b611aed27bmr3178106a91.24.1715168627082; Wed, 08 May 2024
 04:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240507135234.1356855-1-yangcong5@huaqin.corp-partner.google.com>
 <20240507135234.1356855-2-yangcong5@huaqin.corp-partner.google.com>
 <171509488827.493449.2668049686067198439.robh@kernel.org>
 <CAD=FV=VNNB=jtyM1BMTUTzyTjOUqDxobWTYz9RAnCmYha-DG0w@mail.gmail.com>
In-Reply-To: <CAD=FV=VNNB=jtyM1BMTUTzyTjOUqDxobWTYz9RAnCmYha-DG0w@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Wed, 8 May 2024 19:43:35 +0800
Message-ID: <CAHwB_NLhKqqy-Ot=HjiG2oZ6MraYvvMaV_=r60=1yR4164FeaA@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: display: panel: Add himax hx83102
 panel bindings
To: Doug Anderson <dianders@chromium.org>
Cc: sam@ravnborg.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linus.walleij@linaro.org, 
 xuxinxiong@huaqin.corp-partner.google.com, airlied@gmail.com, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 devicetree@vger.kernel.org, conor+dt@kernel.org, daniel@ffwll.ch, 
 neil.armstrong@linaro.org, "Rob Herring (Arm)" <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi, Doug &Conor

Doug Anderson <dianders@chromium.org> =E4=BA=8E2024=E5=B9=B45=E6=9C=888=E6=
=97=A5=E5=91=A8=E4=B8=89 00:40=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Tue, May 7, 2024 at 8:14=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:
> >
> >
> > On Tue, 07 May 2024 21:52:28 +0800, Cong Yang wrote:
> > > In V1, discussed with Doug and Linus [1], we need break out as separa=
te
> > > driver for the himax83102-j02 controller. Beacuse "starry,himax83102-=
j02"
> > > and in this series "BOE nv110wum-l60" "IVO t109nw41" panels use same
> > > controller, they have some common CMDS. So add new documentation for
> > > this panels.
> > >
> > > For himax83102-j02 controller, no need 3v3 supply, so remove it.
> > >
> > > [1]: https://lore.kernel.org/all/CACRpkdbzYZAS0=3DzBQJUC4CB2wj4s1h6n6=
aSAZQvdMV95r3zRUw@mail.gmail.com
> > >
> > > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > > ---
> > > Chage since V4:
> > >
> > > - Update commit message and add fallback compatible.
> > >
> > > V3: https://lore.kernel.org/all/20240424023010.2099949-2-yangcong5@hu=
aqin.corp-partner.google.com
> > >
> > > Chage since V3:
> > >
> > > - Update commit message.
> > >
> > > V2: https://lore.kernel.org/all/20240422090310.3311429-2-yangcong5@hu=
aqin.corp-partner.google.com
> > >
> > > ---
> > >  .../display/panel/boe,tv101wum-nl6.yaml       |  2 -
> > >  .../bindings/display/panel/himax,hx83102.yaml | 73 +++++++++++++++++=
++
> > >  2 files changed, 73 insertions(+), 2 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/display/panel/h=
imax,hx83102.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/display/panel/himax,hx83102.example.dtb: panel@0: compatible:0: 'starry,hi=
max83102-j02, himax,hx83102' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/=
]+$'
> >         from schema $id: http://devicetree.org/schemas/dt-core.yaml#
> > Documentation/devicetree/bindings/display/panel/himax,hx83102.example.d=
tb: /example-0/dsi/panel@0: failed to match any schema with compatible: ['s=
tarry,himax83102-j02, himax,hx83102']
> >
> > doc reference errors (make refcheckdocs):
> >
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/2024=
0507135234.1356855-2-yangcong5@huaqin.corp-partner.google.com
> >
> > The base for the series is generally the latest rc1. A different depend=
ency
> > should be noted in *this* patch.
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> >
> > pip3 install dtschema --upgrade
> >
> > Please check and re-submit after running the above command yourself. No=
te
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checkin=
g
> > your schema. However, it must be unset to test all examples with your s=
chema.
>
> I think several of your bindings patches have triggered Rob's bot.
> Please make sure you're set up to test this yourself and make sure you
> run it locally before sending out the next version of your patches. In
> general you should get in the habit of running 'make dt_binding_check'
> locally before you post any bindings changes.

Sorry, I forgot to running 'make dt_binding_check'.
Thanks for the correction.

>
> Thanks!
>
> -Doug
