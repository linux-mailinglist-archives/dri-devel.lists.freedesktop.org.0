Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD039543DFF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 22:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3263F11A0F8;
	Wed,  8 Jun 2022 20:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60BF11A0FD
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 20:57:33 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-f16a3e0529so28805180fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 13:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=/K2iqivXQf9yE5saL0neALjx6ioa+JU7B+6RLTjt2Lk=;
 b=HbZeFoAypR4kLl5P2IhNK1+vyg3fWue+ScLLVz4SVhWGHTw4eA6eDB/JVLWJdtN0F6
 Y0pT5gaclN3YpQrJRN3tXejWnJrVnOKzfu74LcRrILBxAjnwamiLZPMQoGMG6DpVfZoc
 /gWXuMoK82UpAB//e1hMII0FZqkU9yd+u37tU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=/K2iqivXQf9yE5saL0neALjx6ioa+JU7B+6RLTjt2Lk=;
 b=ueRHTHhNtzgBTTSdQmJR+J7N7yLPeEffZOrTs6MIySvtCDHxQSp6/qvZuZwQ1FgTPh
 7vj3Egrk2L8rtGUGQ7iqPxVmxtfSvzo1G36P2rp791FYDwiCIj1W8Ez/jIwEuU1ltt8G
 ROeEqwiVFfEmvjL9pOYbURmW3vGY3kG1BEYRjcyGbzfxL0fnHZj30aVKo1BklWjA0mxE
 iZmU4WLEu7dyjW6CgHwHiesNZhIx0IdOStcbMXK9u+apLnvx5R0zp7swuARurB0Ts5T7
 S6IsZsiNY/A0AkzMqgg1TRrk27kgFYorF4sviXiBl5BgIDEKx0blSr+TsohOcFO5ag2k
 Qekg==
X-Gm-Message-State: AOAM532MNKyiSNgkkJuUyNjWYJvn/Kmx2UN/Qwg889ku/mpfuNCEAylT
 tm4eu0LdYNHtfM1ri74e4UBh7JidCUjv+ljDlkakVw==
X-Google-Smtp-Source: ABdhPJy8aPYqwWHnnjU3tUjw8mNOYISWxggIFluFTX6jVgidDeBAC45mzAKJs28IMnTzw9zMAzZyCdfg02u9rO1qNlM=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1752412oap.63.1654721852894; Wed, 08 Jun
 2022 13:57:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 13:57:32 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-6-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-6-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 13:57:32 -0700
Message-ID: <CAE-0n52XgKVdzokmNBOM_ONAwyVQpu-UQxDgwzXXVMuK+5CJRQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] drm/msm/hdmi: drop the hdmi-mux support
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

Quoting Dmitry Baryshkov (2022-06-08 05:07:16)
> With the last (and only) in-kernel user of hdmi-mux regulator, drop it
> from the HDMI driver.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
