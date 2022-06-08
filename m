Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6791A543E24
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 23:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F331A11A2F4;
	Wed,  8 Jun 2022 21:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D7A11A2F5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 21:04:48 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-fe15832ce5so3088654fac.8
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 14:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=76kDmXTl6n20l0N3wMIAHBopXj92kDXl0aNreW0xlog=;
 b=ACuv6dIrKUhatTPgkh9ihw4JDfAtZuexalyvUFBehcn/g+w/cHWDoutvKBlHUMd2kw
 peSHMKjHkNUiammMRf68xcZ2JmCc/DhEmaL6TiakXagb0GPM5zat5pp83dPEot/afrw1
 N2gj2q2+Wy8zKbhtuhcf7H9z2iAhobZcKb7GM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=76kDmXTl6n20l0N3wMIAHBopXj92kDXl0aNreW0xlog=;
 b=LEFPC0cg6bYKSdoJW+zFIKGrxhi8FZDq6r4QQoZLb1fLBbfKDbPL+Y/46p7SKWvVDQ
 QZRrbZpxFQU7XKj/bVoqlD6GJ+s8Xi/aXBIIMeGQAWL4eW/chlgOTLkK5p88TGZ2/aq5
 JekDaiHpAL0zsQm1yvauLnIC3gdjX8oRN9l32WremIWX9sAcfiCI0gAPreVU4gPkEYDB
 T2Z+eXxkGoLSwZ5B5glbMA45Zc12JbGatrSk1cZRUviiQEWqc1MPVTFswh4Q1eR3VjBP
 Ot3YA8hPnEqRreugCPH/laKA4pxkVAmr2PSz3en1hCPJ+6jMAE+R4efMPIGCpt8zJUC/
 cnCg==
X-Gm-Message-State: AOAM530EMuanaZfLzdKiiNNO1IU2GAPKlpMNxStgzKafwTxRvqwIrLK9
 r9xTjQFvtZhu4eS0TSVUf6CrfDlbaJFIDftLHcDhhw==
X-Google-Smtp-Source: ABdhPJx5QgouVrnNVjSRQ5Ti8tygKWrwahuC3IBuZEnkG6Id6JLff5As9nN3YO6dFQR/ervQ0uOSDKBZDydn+sTQqj8=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr3386036oap.193.1654722287412; Wed, 08
 Jun 2022 14:04:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:04:46 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-12-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-12-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 14:04:46 -0700
Message-ID: <CAE-0n536e0+huMmmiBaXMZ4v_GiOYfrEh6Zp1b5piLpv4WMogw@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] drm/msm/hdmi: reuse MSM8960's config for MSM8660
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-08 05:07:22)
> MSM8660 requires the same set of clocks and regulators as MSM8960. Reuse
> MSM8960's config for the MSM8660 (8x60).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
