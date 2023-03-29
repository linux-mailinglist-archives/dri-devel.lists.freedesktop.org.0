Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E19366CF3C0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 21:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00C110EBA8;
	Wed, 29 Mar 2023 19:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD69C10EBA8;
 Wed, 29 Mar 2023 19:52:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 03B2E61E05;
 Wed, 29 Mar 2023 19:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CE4C4339E;
 Wed, 29 Mar 2023 19:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680119545;
 bh=mjLUdufgtgjPzwdtcadGyC411S2foJg6r/cD6VhlXN4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qh6CniKz4OR9ie0HZ4eBHL2PCwlZwptw5bOansqcfWqmKbNn0DRr2Jn1rF4Ht+X+B
 g+oOvlU+yBojkq/J+BvLZzSDIm7J3wffF/AS8iWHWDOep0ruQENOFj/NxPm0d/TWGk
 mS4aimJ4z6asp/R7d5fWDpg8rdDQRrQ4RhfR6dFa3noH4lWOUJzZuODvGaUAm8qPRN
 9gMiEg+sjFjEIWjJ/Cl1qg/ungMxT7U1gg0rGzNva14P2UZpbViHR/m3CfU470jiLt
 ucQVGcw5GrvTOLwGk+bxEHymd7l/mPMYUThEL6G+smkxH84D2PIBCHTmCy5YLZvO6z
 hEjwPoTibmorA==
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-536af432ee5so314450717b3.0; 
 Wed, 29 Mar 2023 12:52:25 -0700 (PDT)
X-Gm-Message-State: AAQBX9cfhZHEdmb5vUeM9KBmgigY/GV+QzmAWDCGFKk8BA/U4a/PbhDJ
 2JErCfeKHT2yuXkzgj759+XXipui/BFIJr+7Dw==
X-Google-Smtp-Source: AKy350YmTOlpc30ipg9mtdb/RKboI8SpnHxYbSbWPKuwuA23l/hU01zX5J4huXLPc4DktXCK19e9vRvERkA2b90bHlw=
X-Received: by 2002:a81:b50f:0:b0:544:b8d8:339e with SMTP id
 t15-20020a81b50f000000b00544b8d8339emr10288144ywh.5.1680119544920; Wed, 29
 Mar 2023 12:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
 <168004255469.1060915.1800625604847213121.b4-ty@linaro.org>
In-Reply-To: <168004255469.1060915.1800625604847213121.b4-ty@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 29 Mar 2023 14:52:13 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+VoBkpCT_iUD1Nq_SazCVDa49rn0qtX3Qnm1KBB3gkcg@mail.gmail.com>
Message-ID: <CAL_Jsq+VoBkpCT_iUD1Nq_SazCVDa49rn0qtX3Qnm1KBB3gkcg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] drm/msm: add support for SM8550
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 28, 2023 at 5:38=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
>
> On Mon, 09 Jan 2023 11:15:17 +0100, Neil Armstrong wrote:
> > This adds support for the MDSS/DPU/DSI on the Qualcomm SM8550 platform.
> >
> > This patchset is based on the SM8450 display support serie at [1].
> >
> > In order to work, the following patchsets are required:
> > - PM8550 LDO fix at [2]
> > - DISPCC driver at [3]
> >
> > [...]
>
> Applied, thanks!
>
> [2/7] dt-bindings: display/msm: document DPU on SM8550
>       https://gitlab.freedesktop.org/lumag/msm/-/commit/4557e40338d2
> [3/7] dt-bindings: display/msm: document MDSS on SM8550
>       https://gitlab.freedesktop.org/lumag/msm/-/commit/0e4205eb8663

And now failing on linux-next just as my bot reported:

Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.example.dts:2=
4:18:
fatal error: dt-bindings/interconnect/qcom,sm8550.h: No such file or
directory
   24 |         #include <dt-bindings/interconnect/qcom,sm8550.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:419:
Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.example.dtb]
Error 1
Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dts:=
25:18:
fatal error: dt-bindings/interconnect/qcom,sm8550.h: No such file or
directory
   25 |         #include <dt-bindings/interconnect/qcom,sm8550.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.

Please fix. And quickly please. Fixes in the DRM tree seem to take
forever to get in...

Rob
