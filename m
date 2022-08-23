Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6145759CED3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 04:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE6818BED3;
	Tue, 23 Aug 2022 02:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE13A12A615
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 02:55:57 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id r10so8745349oie.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 19:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=T+S/nKyRsVKnDI2NI2XWxFbudSWc5/W62WtWCj7xI5k=;
 b=FyTH6s+w0NZh2OcFL16yY9rrPwgEsLeMGuckTfZFJvUpiQgZhvKwNJDT6oZiYYI1Z6
 ahxK6O/w05oVFZ4wDew/xvyytGyxYN+aSDywQsmGUSyGn5wO+1YdQUKE/fCXgrv+Mdeh
 DuW/vVKva1riddVn6fvIhACtHvxgTngeF1ltc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=T+S/nKyRsVKnDI2NI2XWxFbudSWc5/W62WtWCj7xI5k=;
 b=6PnykCA38jIwb/98C13hAl0ZI2l5tZgyr12S6ehcWuGV4pmPWTtfosfhKZkuGwztYq
 Gm+nO75QRa3f9rIn3UZF3Z+yBe6Yq970voh/thwDzb4tvIc9e3SkONv2Sun+pfSRMvZX
 lCSXy+j5VLL889anV9Hq8vi9jGvzcL+bCVpgQFf6O6tmY+TuFplCsVER8XmhYAtUdQGS
 /Gh3CC4JlP2mLZdf9U44lQREuDko+nd14Q2RQhEIF63a9tlPsI7uQrb7kTE3T55WhJs6
 Svrf6rd2Osy/ka2pVO4HEsHlHJnB9bQdwvvSaTCF48AQdGYJ3DRgfUdJxgu5EmRdCd1F
 MhRw==
X-Gm-Message-State: ACgBeo2h6O37aFfdNBKQZllzdO/mr2u7boNoNSJCVXLlj0NmDXfm1I61
 PJUfDAXu7E1HqgTZvz2DO4a/wnDhWh3iv38bczVzjg==
X-Google-Smtp-Source: AA6agR5B1RXiqU24b10dVaT51Y2w8Tu58T9a6cri/gxITu0yRHhbmrCSL4kKosa2BPr7V6Lbpg9/mCneKS0FOSLLrzY=
X-Received: by 2002:a05:6808:1142:b0:343:86a0:dedc with SMTP id
 u2-20020a056808114200b0034386a0dedcmr510821oiu.44.1661223357058; Mon, 22 Aug
 2022 19:55:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 21:55:56 -0500
MIME-Version: 1.0
In-Reply-To: <e9760ee4-421a-5c87-4370-50262930aea1@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
 <20220711231638.GA449827-robh@kernel.org>
 <e9760ee4-421a-5c87-4370-50262930aea1@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 22 Aug 2022 21:55:56 -0500
Message-ID: <CAE-0n50OhC=+twQiei8fdXjCAV_XpAW-7N2zDFQMu9Vx7Zyy+Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] dt-bindings: msm/dp: add missing properties
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-08-22 11:46:39)
> On 12/07/2022 02:16, Rob Herring wrote:
> >
> > But this is the wrong location for 'data-lanes'. It belongs in an
> > endpoint node.
>
> I rechecked the existing device trees (sc7280-herobrine.dtsi). The
> data-lanes are already inside the main dp controller node. I'll take a
> glance on fixing the driver to check the dp_out endpoint (and update
> existing DT to move the property to the endpoint node), but to make
> schema compatible with the existing device trees we'd probably still
> need this property (which can be marked as deprecated once the proper
> endpoint property is supported). Does that sound plausible?

It would be nice if drm_of_get_data_lanes_count() took some port and
endpoint number instead of a node pointer directly. Then you couldn't
mess this up as easily.
