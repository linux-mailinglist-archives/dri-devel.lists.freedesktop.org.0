Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F789790B4
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2024 14:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF18810E137;
	Sat, 14 Sep 2024 12:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VHd+rnyt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A17610E03B
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2024 12:05:00 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e116d2f5f7fso3262776276.1
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2024 05:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726315499; x=1726920299; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v/BwEPPxE9nFO1CcsZ05pg5b/eN2UhsgUftUMF1y+k0=;
 b=VHd+rnytuI1cfgsxjpdTIchKZWK0TQ08j5G4UGCegcSLH1+wgFe1V6fkWlkaQXLtfS
 UFMG6ufcYMlyr+Gd3pkFKa7dRXFZ0gYgLVEfaVUEGFJMINYq0hg8FNnIR8DDMQ9SPuHN
 28NGUWJu6TBdmqj9XbP42IKW32PW7pcCKn2ndVwkBcpkeGS2vb1Tk/Pp2BoH/YDRTuGk
 HUg2tpYjH7ytn+T5l87gekz1kswWBxkmfKnxlABa7fpH0GnHOv1W3sLZG4o1zG1KjP09
 z4CqD8c2thXYvLfFe9X+o78IWq8EChebdiqu/g93yFPMOO4D46qYhWgOEjExjuYu+np4
 0PCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726315499; x=1726920299;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v/BwEPPxE9nFO1CcsZ05pg5b/eN2UhsgUftUMF1y+k0=;
 b=Y0wO/08dyH8fnwVt9LMh56D1kZjNshblkiP8+aToWyA0hBXDT50kmKkM5vjsiAtXMD
 kIvyFOXBjW5iLbUcxbQGQl8zfRXQOHFirElLJrfvhb632bB6T4hWYUXEGGezsgd0An5j
 zsZdYH/IDjdDjKNEJbiStzef3qZtyeoCEMiN79WfwG1XsCERxrH0n5n48c2Fq1zXX8Sl
 uD8hlSzNfNwB3dLeugVPaMg/a4FgXQ6nSfTBatd0udMQt06pxYg1ZDMNHHbWAzm6FPkl
 x4ZVxKjvqewadkFvxi+TVM9GEYqtnjvXPyNpUcaYDjzx3b9DeSm7+v0LQP49KUliZNRD
 r/Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4t3UqsvtbJO4WFZ4W19sNaDVONzhItaSSDn+Q6nlwab0DkdblRFRuBAt6rnvtLLyuxiIDx3OIeDs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDftjrT5ToCUXf2W1VFLuLMWTKr+5P5Nhr7SG621xwNKb5UP6a
 NfC/gtrSb6yzGgJoRyFXccwE2qqibxsUb5em0kIUC7ZcB33hWxpIFHmePawqdyFa4K7FwL2v1OP
 P780p70MePVKBfPhAEsvbqVzpv1BYEZdx1HGGVA==
X-Google-Smtp-Source: AGHT+IFr6ztHkdXR12yHJt9BqfgF+oj8X/upMI/MFEq0hVIM1jdcxlJa5xJkzkTkMIDH+Ri6BPcsmXHfSOGUlyxg2dU=
X-Received: by 2002:a05:690c:660c:b0:6d0:f91e:2ffa with SMTP id
 00721157ae682-6dbb7015a8cmr71152697b3.3.1726315498811; Sat, 14 Sep 2024
 05:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
 <20240913103755.7290-3-quic_mukhopad@quicinc.com>
 <9fee28de-24eb-46b1-aa5b-6febc2972a3c@kernel.org>
In-Reply-To: <9fee28de-24eb-46b1-aa5b-6febc2972a3c@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Sep 2024 15:04:48 +0300
Message-ID: <CAA8EJpquBih8jO_Tv8RFLVYN0c+N7KC45VztGSJHV87x22tdcA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] phy: qcom: edp: Introduce aux_cfg array for
 version specific aux settings
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>, vkoul@kernel.org,
 kishon@kernel.org, 
 andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org, 
 robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, quic_parellan@quicinc.com, 
 quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, quic_riteshk@quicinc.com, 
 quic_vproddut@quicinc.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 14 Sept 2024 at 14:29, Konrad Dybcio <konradybcio@kernel.org> wrote:
>
> On 13.09.2024 12:37 PM, Soutrik Mukhopadhyay wrote:
> > In order to support different HW versions, introduce aux_cfg array
> > to move v4 specific aux configuration settings.
> >
> > Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> > ---
> > v2: Fixed review comments from Bjorn and Dmitry
> >       - Made aux_cfg array as const.
> >
> > ---
> >  drivers/phy/qualcomm/phy-qcom-edp.c | 37 ++++++++++++++++++-----------
> >  1 file changed, 23 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> > index da2b32fb5b45..bcd5aced9e06 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> > @@ -90,6 +90,7 @@ struct phy_ver_ops {
> >
> >  struct qcom_edp_phy_cfg {
> >       bool is_edp;
> > +     const u8 *aux_cfg;
> >       const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
> >       const struct phy_ver_ops *ver_ops;
> >  };
> > @@ -186,11 +187,15 @@ static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
> >       .pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
> >  };
> >
> > +static const u8 edp_phy_aux_cfg_v4[10] = {
> > +     0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
> > +};
>
> How about we only abstract the values that differ? It would seem like more
> platforms reuse about half of these magic bytes

I think it's easier to review and compare the whole sequence rather
than numbers here and then numbers there.


-- 
With best wishes
Dmitry
