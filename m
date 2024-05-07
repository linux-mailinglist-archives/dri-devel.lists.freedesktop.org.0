Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE888BE90C
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 18:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB67C112517;
	Tue,  7 May 2024 16:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RBgbUsgt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E47B112517
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 16:32:18 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-434d0a63151so15561851cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 09:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715099536; x=1715704336;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DFavUp82x9+EKSXtviTqGgqyKSS9fBB+WIBnwLG/9Gg=;
 b=RBgbUsgt8RzFirrjLqE5A59ZdHyZhxgLQZdl/X7jQpabqBR9yv7Da5vPvBa8UE1IVc
 tH/w+qaG5/AxgfHKZH8xcgxdtkROwtoTfBHyA4vAuBtJWE0pj07IaOT4IE21DNTis0sr
 NkLWkcOamq91o88Nn0Jx++CWD0NwM2r3SZCEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715099536; x=1715704336;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DFavUp82x9+EKSXtviTqGgqyKSS9fBB+WIBnwLG/9Gg=;
 b=v9JoKcgj6bkFVWFJwhaD4mSz7yvH0qS5Myg7BUASh/5PIH4l4/N6g43+mcVwkt8lUm
 QX3Pg/CTT2PCKuXxw8R937/6qP4qJ6khOP+C6VBLICeSyPetfzAk3nWME8+nuC9acT5e
 4taSueD2sNdcUwXpNgI0W165yazfTbCyqPRDAKS0MYJif6H6+7cLQbspyIInVk7gYnkw
 Axp/wHRvZIU37c9NIqwC3WtTeZZzLw1beNmMMUZlWWR52YxNWXNQkio4gzcbSyDur5ra
 B3TaxTrAGvILshErq5v2gO6+Cv73Mc1mlbALgvtRVgVVNkj7gzh7qVrBonMrMphIO5fA
 HvIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRgoSBQUOvPybf32Vq471fWkcxVnqWibzdZLFXwKPVIu1vxSoBSa3/ddczgN1CeGkGsEt7GgD0jpXwzRNPJjELAf0bmif1fSADgwZf76lk
X-Gm-Message-State: AOJu0YxNX0ypRZHmFV3dgMf7qFS6rr/H+wCzsmTN0iQr2xF3KJDPO/vj
 gut8VdmJk1zeLzek37j2Kwalcoo5yi/32xlyIgMaRGAqgj196vFngK+BrYNMhpxnGSxvvi3duoU
 =
X-Google-Smtp-Source: AGHT+IGZfBel5NGkfe/5IdS3yTDzQl5mPS4eeE3YLtvmLzDZenfx1OYcoyI9JJ0Eeim7iPw+akDmKw==
X-Received: by 2002:ac8:58cd:0:b0:43c:562f:e07b with SMTP id
 d75a77b69052e-43dbf4ea2c3mr2014901cf.7.1715099535651; 
 Tue, 07 May 2024 09:32:15 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 en15-20020a05622a540f00b004377f87147bsm6578292qtb.69.2024.05.07.09.32.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 09:32:14 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-439b1c72676so610021cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 09:32:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXmjJsunDHUjya5pEuiCo8HamN7fTexPZ0iIqoBNfOCoIfDyyY42tKO8QjkyDxWISO24t5Hr8k+c+jhRpLk6yd9iMoRtLqopTcjCJZHcAE0
X-Received: by 2002:a05:622a:598a:b0:43a:c1cd:2f4c with SMTP id
 d75a77b69052e-43d9835c8a0mr2999981cf.5.1715099534265; Tue, 07 May 2024
 09:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240507135234.1356855-1-yangcong5@huaqin.corp-partner.google.com>
 <20240507135234.1356855-2-yangcong5@huaqin.corp-partner.google.com>
 <171509488827.493449.2668049686067198439.robh@kernel.org>
In-Reply-To: <171509488827.493449.2668049686067198439.robh@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 May 2024 09:32:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VNNB=jtyM1BMTUTzyTjOUqDxobWTYz9RAnCmYha-DG0w@mail.gmail.com>
Message-ID: <CAD=FV=VNNB=jtyM1BMTUTzyTjOUqDxobWTYz9RAnCmYha-DG0w@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: display: panel: Add himax hx83102
 panel bindings
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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

Hi,

On Tue, May 7, 2024 at 8:14=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Tue, 07 May 2024 21:52:28 +0800, Cong Yang wrote:
> > In V1, discussed with Doug and Linus [1], we need break out as separate
> > driver for the himax83102-j02 controller. Beacuse "starry,himax83102-j0=
2"
> > and in this series "BOE nv110wum-l60" "IVO t109nw41" panels use same
> > controller, they have some common CMDS. So add new documentation for
> > this panels.
> >
> > For himax83102-j02 controller, no need 3v3 supply, so remove it.
> >
> > [1]: https://lore.kernel.org/all/CACRpkdbzYZAS0=3DzBQJUC4CB2wj4s1h6n6aS=
AZQvdMV95r3zRUw@mail.gmail.com
> >
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > ---
> > Chage since V4:
> >
> > - Update commit message and add fallback compatible.
> >
> > V3: https://lore.kernel.org/all/20240424023010.2099949-2-yangcong5@huaq=
in.corp-partner.google.com
> >
> > Chage since V3:
> >
> > - Update commit message.
> >
> > V2: https://lore.kernel.org/all/20240422090310.3311429-2-yangcong5@huaq=
in.corp-partner.google.com
> >
> > ---
> >  .../display/panel/boe,tv101wum-nl6.yaml       |  2 -
> >  .../bindings/display/panel/himax,hx83102.yaml | 73 +++++++++++++++++++
> >  2 files changed, 73 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/him=
ax,hx83102.yaml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/d=
isplay/panel/himax,hx83102.example.dtb: panel@0: compatible:0: 'starry,hima=
x83102-j02, himax,hx83102' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+=
$'
>         from schema $id: http://devicetree.org/schemas/dt-core.yaml#
> Documentation/devicetree/bindings/display/panel/himax,hx83102.example.dtb=
: /example-0/dsi/panel@0: failed to match any schema with compatible: ['sta=
rry,himax83102-j02, himax,hx83102']
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202405=
07135234.1356855-2-yangcong5@huaqin.corp-partner.google.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
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
> your schema. However, it must be unset to test all examples with your sch=
ema.

I think several of your bindings patches have triggered Rob's bot.
Please make sure you're set up to test this yourself and make sure you
run it locally before sending out the next version of your patches. In
general you should get in the habit of running 'make dt_binding_check'
locally before you post any bindings changes.

Thanks!

-Doug
