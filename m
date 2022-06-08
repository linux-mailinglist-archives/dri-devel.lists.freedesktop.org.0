Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9858543E2D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 23:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C8111A30B;
	Wed,  8 Jun 2022 21:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C8E11A30F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 21:05:20 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id k24so2919322oij.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 14:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=VA68tU8Jc9kgWMO703PZLr2L2nKtPtdGngJzNOM+IbI=;
 b=R64J4Id6Un10yWpmLrpwQ9IrFKHeIuM0yd5slKvFvXUBYFTeNDbJsc0DDII8S7f7Np
 yihilvK2WcDSltrO5JTXZwCXSX/AZjO0NzoCuddVOypOsjOlyXpaZ2QTSAmJx73BO4XI
 3gNfMVKMHjSVb5mfuvEMbwIDzI614AuuJuFzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=VA68tU8Jc9kgWMO703PZLr2L2nKtPtdGngJzNOM+IbI=;
 b=ymG0wJTNKnsErhpBDNuSZJa17isaz/GG2Sid6ujEbk82E6kZIzq9ZUwKv95i9QfYkP
 LZaWExRMWUViJVrvDMj8ThkJ+V1FlEC2uRdnfz4fFjVb+JCHE56LyxsILuZN2nQEtcAv
 yiJk2sEFISfSy3Mh7bluNbjpCfcm9agCqBcFmQI6bJHlCPoiwv4/lmTaLGoeF6A8oMve
 dbifHRI0tOnPw083jX5+O+lshpR6Q9CGHzZj5YiHeM8b5SEnxcPFtEm/eRoQUby+50//
 OVKFI6gmhcrExbS5spnpzXHAYZdR7tn6GJQqxNdZASRB3HV2nyDPMhja+3YweAio13Sw
 QnzA==
X-Gm-Message-State: AOAM530P7XIv+usPihZjup67J8RxK1N0yKF3pItRdAVrJClC9AbQJAmo
 tIuZfedPg40U4SZTIZZSraPHUIA8cpCVra1vpN+bXw==
X-Google-Smtp-Source: ABdhPJz4xugE9u2X8gXA7bGWKinzkwl5XrS/bCZu4dvnfeiEvjtwL5S+Oche29KAAYjoVEaJe1AqJJnc9xwa8njrK60=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr3370939oil.193.1654722319945; Wed, 08
 Jun 2022 14:05:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:05:19 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-13-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-13-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 14:05:19 -0700
Message-ID: <CAE-0n50eJxs13GObtbOfPAUFySUk0hiCzXKrhF5QrBYdV+vrvQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] drm/msm/hdmi-phy: populate 8x60 HDMI PHY
 requirements
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

Quoting Dmitry Baryshkov (2022-06-08 05:07:23)
> Declare that 8x60 HDMI PHY uses the core-vdda regulator and slave_iface
> clock (this is the same config as is used by the 8960).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
