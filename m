Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB10C71F909
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 05:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534C210E02F;
	Fri,  2 Jun 2023 03:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896AD10E02F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 03:54:46 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-256712e2be3so1337836a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 20:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685678085; x=1688270085;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AFYRa2oit8Kb04mbuiimeCpNVm02GagiFFjOTHBNe/E=;
 b=DyjwxaLk7AueeisR6yISmADRKlAHBLdbHCQxJgnZxXyaRSC4Ln0ymZBuV5GNb8izsY
 BGgRFHURLha9A++oTaDl4vGKpLH3br3cColD7VPoRCL7FFmmQ9+thgITD2irfws1WyP7
 8z7kq2jO+Q1lqfanDHsw8c6o38bMu2Gv7dWKuEnKtAWBAON6c0cqANMkIkWgoj/La9im
 AgPIII4nTTAZofuQU0B5FcNGpzOg9Q3BETfrB6RZNzGYBOS25Ae8JUsQNwp7oKsq6qqH
 JIp6LFPKgHvj8pR5T2aUYszEbnwhSQQgZ9lqiRwAZqD5xjPaXoxNmbB5bQ3tj+LtzNsN
 BxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685678085; x=1688270085;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AFYRa2oit8Kb04mbuiimeCpNVm02GagiFFjOTHBNe/E=;
 b=RDxAFhLHNoiHuBgclRnD7bSiwPnaDXHJ/ZRFcfQ8v+LqsQf4ERkNldutAj9b5BRyu7
 rJgDntWb8zWshY9p6R5yB5QFcSygVj0ufuNAE1atfXo6uL78o0sHnyq5k7JZ/HhJIQQj
 V8YZLIXNC1qWidv9an3C+rgZZ3MkNQFdKRBKVv1f8Ebo0RWEHkeKvMMqej5L0SrbAPy6
 z5Iy2xCEvRKKBsB1ymq8eTkhVqLMO4HiSoT/MK6qqcE/9LmxtMHhmVph6x88qy5IP+eN
 dI3xb45zW28ZYGAZZdRx93CjhYXg6HUh+QyS31w4fD+HYQjPZnL3CZtjoATzRL422s5H
 3utQ==
X-Gm-Message-State: AC+VfDzxfTN/cIby4zz3KMff0qXoYfNfVTqee5/1u8j5RUtzKy52Pk3G
 wOMi19ZP1HtiBlW+mGDQlRDoixdQq4hW6aJ1gSA=
X-Google-Smtp-Source: ACHHUZ7bFV1KjjBpBrQzVDLhlCusRk+BBNxv53GfvPOJzwSHNjAxytFtkFPQE+TCkYjIZVWXIk2piLSrw5WZpmltkF4=
X-Received: by 2002:a17:90a:1d46:b0:256:bc96:45ad with SMTP id
 u6-20020a17090a1d4600b00256bc9645admr1073489pju.40.1685678085392; Thu, 01 Jun
 2023 20:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230531093206.3893469-1-victor.liu@nxp.com>
 <20230531093206.3893469-2-victor.liu@nxp.com>
 <bd257ed0-71a7-0504-0bfe-14775ac93571@linaro.org>
In-Reply-To: <bd257ed0-71a7-0504-0bfe-14775ac93571@linaro.org>
From: Ying Liu <gnuiyl@gmail.com>
Date: Fri, 2 Jun 2023 11:54:33 +0800
Message-ID: <CAOcKUNWkubMK1MJS73tpbm4bafQv2GAMuq_JOTFbvB9EVDRvxg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Add NXP i.MX93
 parallel display format configuration
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Liu Ying <victor.liu@nxp.com>, s.hauer@pengutronix.de, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jernej.skrabec@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-imx@nxp.com, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 2, 2023 at 1:45=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 31/05/2023 11:32, Liu Ying wrote:
> > NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
> > configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> > field. Add device tree bindings for the display format configuration.
> >
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v1->v2:
> > * No change.
>
> How did you implement Rob's comment?

Should have discussed more in v1 about Rob's comment, but
let me explain why this dt-binding makes sense here:

Both i.MX8mp SoC and i.MX93 SoC media block control devices
contain a LVDS Display Bridge(LDB) child device. The i.MX93 block
control device additionally contains this PDFC child device.

LDB dt-binding [1] is written in a separate file and referenced in
i.MX8mp block control dt-binding [2].  So, for the sake of consistency,
it makes sense to keep this PDFC dt-binding and reference it
together with the LDB one [1] in i.MX93 block control dt-binding [3]
in future, doesn't it?

It seems good to have a separate PDFC dt-binding in case it can/will
be referenced by multiple parent device dt-bindings.

[1] Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
[2] Documentation/devicetree/bindings/soc/imx/fsl,imx8mp-media-blk-ctrl.yam=
l
[3] Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml

Regards,
Liu Ying

>
> >
> >  .../display/bridge/nxp,imx93-pdfc.yaml        | 78 +++++++++++++++++++
> >  1 file changed, 78 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/nx=
p,imx93-pdfc.yaml
