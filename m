Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 736B0890DAE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 23:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B50E10ED1B;
	Thu, 28 Mar 2024 22:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OvzjuBoY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CEE10ED1B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 22:36:18 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dcc4de7d901so1369826276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 15:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711665377; x=1712270177; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LjY+wgOUFRoXu57CnEBA1CkVg+Yjx2wYh83Heq0qxKg=;
 b=OvzjuBoYeT5vRYhb4iOaccNfA+gpTArWodjYRNL+Ao90vwdUReYeateL0c+VZAci/i
 90PFi52MeRACtJnrXGJE1lkNuxCNyk7c9GARlKc6SdPRUYr0ey1iiYsTv9bfZ+oxOtd5
 kVRXVq58+/CA7MEQT9QVh7CIb7od9012PqwlJkw2aBBtI/PZFczynWxRdWN1MNHkkN08
 JOp7Xnfj+QljzOv2e1XLC2U5NcQ/OlsM+X2KLdD2Pw9h7BixtltBYWSF0Fs5pEVppAee
 q7JS6R46QSR6Aha0Qrjm6OM36jLOnqWcAFcMxH/ePmdPCGRCdZavfGgErB6r5SDeL1ih
 zRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711665377; x=1712270177;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LjY+wgOUFRoXu57CnEBA1CkVg+Yjx2wYh83Heq0qxKg=;
 b=u476t8+MkQUBYUguYED3PdVA4hIAn/Jf99NokKSNDkc8PCE4aDYkkf4dnIPICAhw8l
 bCn67PPXpwiwDjXrVrh3FCzT51LrmXZDAy/8/sV0k3vzhxYd7cd+7dwkALI3XzIlRnv7
 5ZNOa/D4rbhnpmfjGW0rHOIDVJ4n6bnJkZXRNbBeLZYh7IdlRlMHq+FUeq4m3Y1pmnf3
 CrBiaD+l8tL302u9rmNigDycS23j2hn3WwlaVBjFMlPiXwvTsLjyElqbg8KUqBhPWMyf
 96XXUap0ydPrnAUUetBgXBiiJwPzNKVTp8h4h3GlI7rqm38THq/+o+f+cKato/a4poaV
 ILHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViCeWNU1lqSgfXl9KVyGY12TkvagembGdMCOSp2gOwotH2TGcRfrxwELc+2PRu5Ra/atOdep6U9H3lSJhXMbbZL4c+y5I0+jOC2jD+3nGk
X-Gm-Message-State: AOJu0Yxo9J1oXUa1pcdH/uK72XvfFsOLKt7SS/03+ygx/Et+cKUn9jOH
 PJRuaCKoSEBGTQkCtu8vR1p5MngtZ+1GvHKfj15KzLPojK3w0FEU57YnuC4Eu5QHn92pGjMKZ6A
 pkoS0Y+1dcEPBtkdH0H2d+20PWcYzsl3myGC5Nw==
X-Google-Smtp-Source: AGHT+IHaI+kjiLOUYNKBR/srDk7VFG1X/iL9Lyrl5XxlS/w0akawROX6LC6YYP28982DF251YeuCQALSFyoyvb3mAX4=
X-Received: by 2002:a5b:183:0:b0:dcd:24b6:1ae7 with SMTP id
 r3-20020a5b0183000000b00dcd24b61ae7mr643047ybl.63.1711665377097; Thu, 28 Mar
 2024 15:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <1711660035-9656-1-git-send-email-quic_khsieh@quicinc.com>
 <6641b5c9-1685-3d90-ac15-0b2e9d546bc5@quicinc.com>
In-Reply-To: <6641b5c9-1685-3d90-ac15-0b2e9d546bc5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 00:36:06 +0200
Message-ID: <CAA8EJpoXgtodevy_AHGRR8o3yB08dK1oeHdWUrnx13rsYgY=Dg@mail.gmail.com>
Subject: Re: [PATCH v1] phy/qcom-qmp-combo: propagate correct return value at
 phy_power_on()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org, 
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com, 
 agross@kernel.org, abel.vesa@linaro.org, andersson@kernel.org, 
 quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com, 
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, 28 Mar 2024 at 23:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/28/2024 2:07 PM, Kuogee Hsieh wrote:
> > Currently qmp_combo_dp_power_on() always return 0 in regardless of
> > return value of cfg->configure_dp_phy(). This patch propagate
> > return value of cfg->configure_dp_phy() all the way back to caller.
> >
>
> This is good. But I am also thinking if we should add some prints in
> this driver like it doesnt even tell where it failed like here
>
>
>          ret = qmp_v456_configure_dp_phy(qmp);
>          if (ret < 0)
>                  return ret;
>
> > Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > ---
> >   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
>
> Also, I think we should have
>
> Fixes: 94a407cc17a4 ("phy: qcom-qmp: create copies of QMP PHY driver")
>
> If there is a better fixes tag for this, please let me know.

Fixes: 52e013d0bffa ("phy: qcom-qmp: Add support for DP in USB3+DP combo phy")

Otherwise LGTM

>
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > index 36632fa..884973a 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > @@ -2754,6 +2754,7 @@ static int qmp_combo_dp_power_on(struct phy *phy)
> >       const struct qmp_phy_cfg *cfg = qmp->cfg;
> >       void __iomem *tx = qmp->dp_tx;
> >       void __iomem *tx2 = qmp->dp_tx2;
> > +     int ret = 0;
> >
> >       mutex_lock(&qmp->phy_mutex);
> >
> > @@ -2766,11 +2767,11 @@ static int qmp_combo_dp_power_on(struct phy *phy)
> >       cfg->configure_dp_tx(qmp);
> >
> >       /* Configure link rate, swing, etc. */
> > -     cfg->configure_dp_phy(qmp);
> > +     ret = cfg->configure_dp_phy(qmp);
> >
> >       mutex_unlock(&qmp->phy_mutex);
> >
> > -     return 0;
> > +     return ret;
> >   }
> >
> >   static int qmp_combo_dp_power_off(struct phy *phy)



-- 
With best wishes
Dmitry
