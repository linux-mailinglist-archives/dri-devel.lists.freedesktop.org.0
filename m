Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2296D02A0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 13:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D66B10E21A;
	Thu, 30 Mar 2023 11:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D097A10E232
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:09:57 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id c18so17698036ple.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 04:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680174597; x=1682766597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t0rkIZY3O/B/p2Ezr8FRIFleghoZRYVaBL+ys1poDDI=;
 b=B/r8lZqi8Rz2e1A6uRzfKVFPdomEky7k68pupksU1nDL317QoZDAvxBz+y6EyFNByS
 d2qTNTH/SIXT6lQvykgV4pptB+zsHnE2hbYmZ49SBhi6pv/qilPBpS65e04ibzzEp4xk
 Q0XixVz3VqFG0jp6oBAIuJqsFiYfN3ECoTVlrvJcm7LCWvE/bPpxrN5QZ8f/SeMQxdWB
 /4AO5dpV69fQRUK3U/jtu5ybDF+d4KmCPGh5X41o05U9laUgsVl/OI7PwTbq7umEYwP8
 kMPX6j5T9v3VYKjntbmVyScBotojEfGtgGcB1ZG9GkLvIp6wjqHBmjfgkKhUCLFfw5ul
 lPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680174597; x=1682766597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t0rkIZY3O/B/p2Ezr8FRIFleghoZRYVaBL+ys1poDDI=;
 b=PRsIgP5XJxmPLM7yR3TJf16nBKS7a5huRIzi5ubKQXFW3ekSc38+JQRetCEY5GUd0e
 grI3bl6vSXOk73lls6wTpAt2wjWflueX0cpQvYCtyZcR0aKvBAy4uHaGXxmWhAQ2lTY4
 va1Q8pnhlEyx/AKmm31GazRK3R6QPHWCfj4H1/TXbMwWoByUAA+t7vOoO89lH5U7VuTD
 BPbXV2vL0ps7p09yCloN9im3gO8zNInD1yKN/Hf5KYxbwknB2JoiRaZ6fKtCjjd4uh83
 lY0H/ASjSR2OH+eoM0+ZXYe274eV9qDB7O9AVuLRvwGztdmlkOsSIPvjXC2TAeaG5ILV
 JIkw==
X-Gm-Message-State: AAQBX9cJJLeZ4jhK+Lx8JT0CsQrD85dMb+E5M399SyHFiR/xx/eJaEaT
 ZfXABBZlhXhTEKdydT+ghky6uER12HdtU1t1Gxc=
X-Google-Smtp-Source: AKy350Zf/XyJ4RpHApDgYWO9FKBL8kuFndbl+vrb5NsTjg02WRHH32778W+DXM/1yQQzbdgHMQGRwXO9rXUFiy2/b/g=
X-Received: by 2002:a17:90a:690f:b0:23f:a26e:daa3 with SMTP id
 r15-20020a17090a690f00b0023fa26edaa3mr7068320pjj.9.1680174597353; Thu, 30 Mar
 2023 04:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230329144155.699196-1-festevam@gmail.com>
 <ff66c8b9-c7f7-1eb2-c730-4812b7ff6824@linaro.org>
 <CAMty3ZBHvR8OxgNgKG--TA_LQF41vjPiruHx-Pw2PwbjNKMFog@mail.gmail.com>
In-Reply-To: <CAMty3ZBHvR8OxgNgKG--TA_LQF41vjPiruHx-Pw2PwbjNKMFog@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 30 Mar 2023 08:09:44 -0300
Message-ID: <CAOMZO5BwSFZr7BDaU4KDkwvTcW0U28FeDDaF7eDrhgvgdN47Mg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: exynos: dsim: Add
 'lane-polarities'
To: Jagan Teki <jagan@amarulasolutions.com>
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

Hi Jagan,

On Thu, Mar 30, 2023 at 4:55=E2=80=AFAM Jagan Teki <jagan@amarulasolutions.=
com> wrote:

> I have a previous iteration of this conversion. Can I resend it on top
> of drm-misc-next?
> https://lore.kernel.org/all/20210704090230.26489-9-jagan@amarulasolutions=
.com/

I tried applying your patch against linux-next, but I get the following err=
or:

$ make dt_binding_check DT_SCHEMA_FILES=3Dsamsung,mipi-dsim.yaml
  LINT    Documentation/devicetree/bindings
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
/home/fabio/linux-next/Documentation/devicetree/bindings/display/bridge/sam=
sung,mipi-dsim.yaml:
properties:samsung,power-domain:maxItems: False schema does not allow
1
hint: Scalar properties should not have array keywords
from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
  DTEX    Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsi=
m.example.dts
  DTC_CHK Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsi=
m.example.dtb

Could you please take a look?

Thanks
