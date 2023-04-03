Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBD06D4952
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 16:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4781710E15C;
	Mon,  3 Apr 2023 14:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2499210E15C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 14:37:01 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5445009c26bso555365467b3.8
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 07:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680532620;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=opY0CnpCl2TUFSQwRkx2YgWWlRNGdg8wXm3hOTsdndA=;
 b=mucEXEm7Z0gG1+z8vtgoSN1UvxLmgwQUPa4Ef9yzRBaCKoP83Sc42BnrJv3A/EZ8p4
 yhxB6VVXZipyGm/anOLC8oOheTLMRHL4o8W/qI69nHCk8s5iZzHZKa8fUH0a5k0n2Jp2
 COZOC3FzyKTE+etbPDy6Qn6MLWrULMvecpcwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680532620;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=opY0CnpCl2TUFSQwRkx2YgWWlRNGdg8wXm3hOTsdndA=;
 b=TdUUtp7AiEM4/bCsLeQ8m6lGGOwn1j1T/ma8I456k8ZVsCVOqoi69nRP7UTUG6+q1k
 x/YX0VGiy5Oc0XwQHaxOLU+n56fk0AeWIAjHOOHyAZ8KHcJdHl+HUw6S6DM/5GIsOPxr
 b9DRmH1t8JLv24Rkkm2oVgQCTe2obRfWAKKjo+Ojj/L/TnCqc9iW8q+izHYkf0EhxPvo
 3pi72VjCZ5enYKGx2+FSFTra/Lj/6k3Oqa9RIYuC937kAp4ZytpFZ+spfvozNL5pHnNS
 UfRghh016CBk5TOLJYZ6Vfmq1eQSmpMUKtz2oXJAthELJP9R8YIFz6xlq6rKTJkitZTH
 Po6w==
X-Gm-Message-State: AAQBX9d62QQFrskVqfhy8PO3vFUYLnZJidgoZxLLM7+J0rmPXZw8pq5K
 TDPG+2Vnx42IRe7WcVW3GzIhnejsE+38OepJ0Fxhqg==
X-Google-Smtp-Source: AKy350YndvfOE5H1g0lwwP52fPFaE7plvCDKzpKwLibQV9vvaySn0o5cIbhpFAA6zhyu23MQPfggf1c1fC72Kc9jqJI=
X-Received: by 2002:a81:a789:0:b0:549:143f:3d3 with SMTP id
 e131-20020a81a789000000b00549143f03d3mr2606494ywh.0.1680532619988; Mon, 03
 Apr 2023 07:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230403124458.198631-1-festevam@gmail.com>
 <8f7f925f-638d-737c-bf47-2a66ce0eec59@linaro.org>
 <074183d480cf18948aacd98be60308f8@denx.de>
 <2ed6078f-7982-a5aa-863b-e61f8e9f846a@linaro.org>
In-Reply-To: <2ed6078f-7982-a5aa-863b-e61f8e9f846a@linaro.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 3 Apr 2023 20:06:48 +0530
Message-ID: <CAMty3ZDKTpTAHxqt6320NRVoABwUMOJjBPpUmPpZeP264wLeFg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: bridge: Convert Samsung MIPI DSIM bridge
 to yaml
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
Cc: marex@denx.de, neil.armstrong@linaro.org, Fabio Estevam <festevam@denx.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 3, 2023 at 7:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/04/2023 15:25, Fabio Estevam wrote:
> > Hi Krzysztof,
> >
> > On 03/04/2023 09:49, Krzysztof Kozlowski wrote:
> >
> >>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>> Signed-off-by: Fabio Estevam <festevam@denx.de>
> >>> ---
> >>> Changes since v1:
> >>> - Added samsung,mipi-dsim.yaml entry to MAINTAINERS file (Jagan)
> >>> - Added Marek Szyprowski entry to the samsung,mipi-dsim.yaml
> >>> maintainers section (Jagan)
> >>> - Mention that i.MX8M Plus is also supported (Marek)
> >>> - Remove endpoint@0 description as it only has one endpoint (Marek)
> >>
> >> Where is the changelog from original submission? How your v1 differs
> >> form it? Or did you just ignore all the feedback?
> >
> > I'm sorry, but it was not my intention to ignore any feedback.
> >
> > Which feedback are you referring to specifically?
> >
> > Some more context: last week I sent a patch adding a new property
> > for exynos_dsim.txt and you asked me to convert it to yaml first:
> >
> > https://lore.kernel.org/all/ff66c8b9-c7f7-1eb2-c730-4812b7ff6824@linaro=
.org/#t
> >
> > Jagan pointed out an earlier submission he did in 2021:
> >
> > https://lore.kernel.org/all/20210704090230.26489-9-jagan@amarulasolutio=
ns.com/
> >
> > That was my starting point.
>
> I think I saw v11 but maybe not. I cannot find it now. But anyway if
> this was the newest submission, it already got feedback which we do not
> need to repeat...

Are you referring to v11 based on DSIM series versioning? If so, the
DSIM series from v1 onwards never had this patch of converting .txt to
.yaml that series instead added the new dt-bindings on top of existing
.txt. The actual conversion patch from .txt to .yaml was initially
sent as RFC, so Fabio's versioning seems correct to me.

Thanks,
Jagan.
