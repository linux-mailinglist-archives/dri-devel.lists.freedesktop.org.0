Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2F9747DEA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 09:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D6910E105;
	Wed,  5 Jul 2023 07:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2178A10E105
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 07:08:58 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-57688a146ecso74435607b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 00:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688540937; x=1691132937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UbO9S4lwvPNE3Jcf52ucnFTfU6Wmquwwa3yzlNNHBaI=;
 b=h6xk/mroRTKlv2q/1FLjEDzUM+TdGUFTzMhoFvau06Mh4WSRZ67ew2ljHlKgoOyFi0
 JLuK08WV1UfEMocJXo6WlvSq69/P68M9r13kkoRFKb35jAa07oY7eeQ3tDV9XPdMlcJ3
 f/LJNo0YnsVAiP98vquby1lQZM+ZMl2L+K8ONDYkUxhHTd9mqNvweGEODlMVKGH+bljm
 bi0WOPRl4p9en8V0RljhSxmDGNx5vriIYUMs7TDzoCGMG66F2trMSqG+jmrLGHuidU3i
 DWHQlT6haeVpucc7efaaHbgYwuDfb6yk63nWvNV0z8zZihC8y87ozITfvWU6ZeVFpPga
 Ibnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688540937; x=1691132937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UbO9S4lwvPNE3Jcf52ucnFTfU6Wmquwwa3yzlNNHBaI=;
 b=dz/1OrqdNG4kLrkwOWl+blj4UBe67XWUeVyNhenNwqvAY16VDzDGUKQ9D3752oEuoj
 dvQHqofADdRvdJbvkA9stup9E9Pn6QZWPpPsmNuTF3J+xjkjiKm/MRGwd9osDvFotAYP
 JHj5XT625+GNHbD40Pgcg3yvFC2hg5pgUAsGkGqw/0TdZsJGUc9EtPOvZaaJ4r1P7i+T
 vExhJ12y0e+/RTrtO0o6OWbNZFK2s3hEw7Ui26AAIf7mHvb17Z1qzoHR//7czGEo3ZJ1
 LfvO1bw6MEaFZLvcRP8LNyEzgEW0H5UpyjvDRdyT7Qsdzhi9WqeVPiL11+PFKAwqvDo1
 7MUw==
X-Gm-Message-State: ABy/qLaZhS0tEUAiE0dJfYaAIJvFVUsGxPgVrGdLeymsD39iHsHkNbcj
 PUJUkKr5h0U4aIleOIcmXK/QBcVt59JaUaG7nZFJ5g==
X-Google-Smtp-Source: APBJJlGp8/HCSBfh3tlqL1GyBGZQUbgnVRg1OwDctGoNmnuN31GbcNuizAtHQ0RV8++B5MT4SSGoE8UraqnI+9VALKw=
X-Received: by 2002:a81:6c07:0:b0:56f:ecdd:ded7 with SMTP id
 h7-20020a816c07000000b0056fecddded7mr12636427ywc.10.1688540936850; Wed, 05
 Jul 2023 00:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-3-sarah.walker@imgtec.com>
 <CACRpkdaDkchJkP0MOOBWPtaBhfvR0OUEjkHAHgY0sv8T+SDdiQ@mail.gmail.com>
 <8011c1ac0ddaab3d96df9e81da9e41cbf5022a6b.camel@imgtec.com>
In-Reply-To: <8011c1ac0ddaab3d96df9e81da9e41cbf5022a6b.camel@imgtec.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 5 Jul 2023 09:08:44 +0200
Message-ID: <CACRpkdZ5JCzaEWwLS-smWhV1nYzVNs16WOQ5E_Pf3YtE2BW+bw@mail.gmail.com>
Subject: Re: [PATCH v3 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
To: Frank Binns <Frank.Binns@imgtec.com>
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 Sarah Walker <Sarah.Walker@imgtec.com>,
 "hns@goldelico.com" <hns@goldelico.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 4, 2023 at 5:13=E2=80=AFPM Frank Binns <Frank.Binns@imgtec.com>=
 wrote:

> > > Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - ti,am62-gpu
> > > +          - const: img,powervr-seriesaxe
> >
> > I don't see why you need to restrict the bindings to just the stuff
> > you happen to
> > be writing Linux drivers for right now.
> >
> > Add all of them!
>
> The main thinking here was to start off with a single simple case (TI AM6=
2) to
> support the initial driver upstreaming rather than trying to cover too ma=
ny
> things at once. This can then be built upon for other GPUs. So, for examp=
le, we
> can extend the bindings to add a second power domain for those that need =
it,
> such as the GPU in the Mediatek MT8173. The benefit of this approach is t=
hat the
> bindings, dts and code changes can all be reviewed together so that all t=
he
> context is present.

I understand that you want to scale down the problem so it becomes easier.

However the reverse can also be said: by removing the other platforms you
may end up with one way street bindings that are really hard to augment to
accomodate for the other family members later on.

But as long as H. Nikolaus is involved in the review I suppose he will be
able to point out obvious cases, and I expect that you read through the
old thread:
https://lore.kernel.org/all/cover.1587760454.git.hns@goldelico.com/

Yours,
Linus Walleij
