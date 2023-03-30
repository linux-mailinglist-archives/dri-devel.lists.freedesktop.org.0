Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F096D0717
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 15:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5117A10EE41;
	Thu, 30 Mar 2023 13:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1C610EE2F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 13:42:04 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-54601d90118so199264347b3.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 06:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680183723;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X+8nDQV8WyAMGcMV8E7jzqCDnqvFEFAghtcnwD7ujG4=;
 b=mLMExJoF4PGUb5r1ARvsMCskqu01O1GrOaR3OBiaZLRdKtDDgCc1b0EGv9zHEqnemU
 5se4KLUK2YGDLDK/ZUK3kp/6sW9MFEfOKRaUadskgb3YhCs3zc4hSrRqMr8PsiGr4jZU
 Ig5sQsBRvUp+TJNNv+26ekVHa/83Okz16GKB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680183723;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X+8nDQV8WyAMGcMV8E7jzqCDnqvFEFAghtcnwD7ujG4=;
 b=S6A1S1ks+UZVeepaJxHNwxDhBHxUGGpnxiITACXWPTsKGeIJvL10rQ7ng080GWM7hg
 hgcLbJcsa5Ldftrd8hD79knxEe34MWkhW1T9TpSEzLfQP1LCMymxKO+C8t9mS6gGOXeO
 9LvBtYG9aBGO3PYSOz6Kn7PBqk9tvP4rQLq8a4LJJOd2GxG1ZrzUFpyx1Ixg9P2yZWFt
 gwzqVDru6v+Z57V3h+f9Jb/ZdNJqOfSgsmpRhMvFQSNR6m9JyerfTv4IdixCW94SCxPy
 04Qvm8k2g+PTzHlHAxMJKl0YebmSJ8Y6farc2bSYYm4d+3ns9HSdIxRXH0QNCBdBz8wW
 wxhg==
X-Gm-Message-State: AAQBX9dsz3Y6EiJbFe4EYuv/t2A/6N1mGFlXBNA+pRJL13E8diPCxUIY
 0xmjLq60FHZZpa5a37uyfbpLBxVxP0I30Y9NFI0NBA==
X-Google-Smtp-Source: AKy350ZVcQzRTyx6h4eVa+NacLvUw4LkPo4Rkn0pPCq25Y6d+1SyB2YL5XdN/iC/2EfH4VUWdCTmgaUjVQs3yt+0S9s=
X-Received: by 2002:a81:e546:0:b0:546:1ef:54f9 with SMTP id
 c6-20020a81e546000000b0054601ef54f9mr6321590ywm.0.1680183723296; Thu, 30 Mar
 2023 06:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230329144155.699196-1-festevam@gmail.com>
 <ff66c8b9-c7f7-1eb2-c730-4812b7ff6824@linaro.org>
 <CAMty3ZBHvR8OxgNgKG--TA_LQF41vjPiruHx-Pw2PwbjNKMFog@mail.gmail.com>
 <CAOMZO5BwSFZr7BDaU4KDkwvTcW0U28FeDDaF7eDrhgvgdN47Mg@mail.gmail.com>
In-Reply-To: <CAOMZO5BwSFZr7BDaU4KDkwvTcW0U28FeDDaF7eDrhgvgdN47Mg@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 30 Mar 2023 19:11:51 +0530
Message-ID: <CAMty3ZBZC_yKR0wszA-ax2-hKoUDHBSg8G_unvYL0rU8742yvw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: exynos: dsim: Add
 'lane-polarities'
To: Fabio Estevam <festevam@gmail.com>
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
Cc: marex@denx.de, neil.armstrong@linaro.org, Fabio Estevam <festevam@denx.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fabio,

On Thu, Mar 30, 2023 at 4:39=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Jagan,
>
> On Thu, Mar 30, 2023 at 4:55=E2=80=AFAM Jagan Teki <jagan@amarulasolution=
s.com> wrote:
>
> > I have a previous iteration of this conversion. Can I resend it on top
> > of drm-misc-next?
> > https://lore.kernel.org/all/20210704090230.26489-9-jagan@amarulasolutio=
ns.com/
>
> I tried applying your patch against linux-next, but I get the following e=
rror:
>
> $ make dt_binding_check DT_SCHEMA_FILES=3Dsamsung,mipi-dsim.yaml
>   LINT    Documentation/devicetree/bindings
>   CHKDT   Documentation/devicetree/bindings/processed-schema.json
> /home/fabio/linux-next/Documentation/devicetree/bindings/display/bridge/s=
amsung,mipi-dsim.yaml:
> properties:samsung,power-domain:maxItems: False schema does not allow
> 1
> hint: Scalar properties should not have array keywords
> from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>   DTEX    Documentation/devicetree/bindings/display/bridge/samsung,mipi-d=
sim.example.dts
>   DTC_CHK Documentation/devicetree/bindings/display/bridge/samsung,mipi-d=
sim.example.dtb
>
> Could you please take a look?

I will rework this patch and update the next version.

Thanks,
Jagan.
