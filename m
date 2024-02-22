Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5C28604C5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 22:26:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E0610E9CE;
	Thu, 22 Feb 2024 21:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bDgWjbpP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0190110E97B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 21:26:02 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-60821136c5aso1835127b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 13:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708637162; x=1709241962; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cAL1eQi9fwO5M4iI6CPGCaZqqkkbT0pjcXeRhNKkMT4=;
 b=bDgWjbpPphlAgLgI+TtvQdYGIsJBCKq1t7eGXarVQUNqPYsKBeZyMTaMReEYjR0PYY
 KJo7fo+HjzAJGbUAJelVbgKIC+dYvzjXuSBi4hG4ZVc4UHjc+iMTBvYZ2FMnIwPAOsst
 qsY33B0LT3dFN1MSdkPTWqg1VzX0UXpy1TTCNU4wTDEUGj9jxmMx4K53vtc+s5Z3CqCL
 cts0AQbWdFMVLFWKTDTpihuQb9cID3iZGydU7rrP9qn4ssQ3pFmdo8rZjDKtpqkdLA85
 HTOguH3pCDQff5Bf95n2NmPHj2PX5BegBbQcYbP/CYbDZWxnT+QVzvzBLCyebv4acVt8
 nF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708637162; x=1709241962;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cAL1eQi9fwO5M4iI6CPGCaZqqkkbT0pjcXeRhNKkMT4=;
 b=PjoRbKExtM2LvwLqc5xWRCy6YQe63Xw4RJJsqCzDoFfHQD2p07GaOMRYw3If1noaK6
 oOkCKZykJCpwDhKAXTwJbbmqEGjHXlxkukeEZcfXywAOvk+4ExJgi4VDunEj8QWd7gcg
 YPkjuMNWf1JBjVbKjoeZNKVgasuIQf0jyFOJRRZWsjRLMEPNQu3n3UtOoH0ylgh40+Uf
 7GWi0vY1DNq2cu5Fl1xC/A1fNesIgFysbLfObtf9TcHIAlbstKRNZ4PeFP/CtSmlpxKZ
 Om4nBpp8+r1Irwnx6VHDLtTJazLHRIEhTV+RE1Tb4VRM6WGhSUshgQdj/yjs8yqjjHdd
 bpkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWx/oH3fHf8bcb8mSFzKSprzV6dFs/1B1dwekORR3+xqvmkbpDFXIyVmpBd7YeAlnBXOELYtRcEQoKTxfRyrJ3IAfsmIjiJWGOHdybAl23
X-Gm-Message-State: AOJu0YyKhR+qslqLs16h4KREfkvq5OMw/XW1K0YmdfSFm39UqI2f5B+a
 hFu2mvRX8znaqUcW29qyH2WGrk7gLFFejnWUHg4BV202jtiYsESnpC0E0I1gHDER6c5q2Hg+V51
 z9MIyPY6aRkR56bRcE0En1bfrCqGKQKSzJhJQZA==
X-Google-Smtp-Source: AGHT+IEFcsXBVJngj+jrntUh79Ngs62jpMD1Nkrbl1mK5ryjeqQFq5MvMKq11CjEr4oUdruoFkkp5lRGNDbdtOkU36g=
X-Received: by 2002:a5b:a49:0:b0:dc6:deca:468f with SMTP id
 z9-20020a5b0a49000000b00dc6deca468fmr412118ybq.29.1708637161970; Thu, 22 Feb
 2024 13:26:01 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-1-dc0964ef7d96@quicinc.com>
 <CAA8EJprXXjvanBU_HGv7X_dS3nyZ867AsvKj5+S3pnWcpsk1ug@mail.gmail.com>
 <20240222034727.GG2936378@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpotx0PiJ6geGUerOihnH3v5a=cm4ngpHsU1aKDOYtoAeg@mail.gmail.com>
In-Reply-To: <CAA8EJpotx0PiJ6geGUerOihnH3v5a=cm4ngpHsU1aKDOYtoAeg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 23:25:50 +0200
Message-ID: <CAA8EJprvVB1sU-LxirZ+myeYj2Cb22snoO5YWGP5YELR8YkGgg@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/msm/dp: Add DP support to combo instance in SC7280
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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

On Thu, 22 Feb 2024 at 06:01, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 22 Feb 2024 at 05:47, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> >
> > On Thu, Feb 22, 2024 at 01:38:45AM +0200, Dmitry Baryshkov wrote:
> > > On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> > > >
> > > > When upstreamed the SC7280 DP controllers where described as one being
> > > > DP and one eDP, but they can infact both be DP or eDP.
> > > >
> > > > Extend the list of DP controllers to cover both instances, and rely on
> > > > the newly introduced mechanism for selecting which mode they should
> > > > operate in.
> > > >
> > > > Move qcom,sc7280-edp to a dedicated list, to ensure existing DeviceTree
> > > > will continue to select eDP.
> > > >
> > > > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++--
> > > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > index 7b8c695d521a..1792ba9f7259 100644
> > > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > @@ -129,7 +129,12 @@ static const struct msm_dp_desc sc7180_dp_descs[] = {
> > > >  };
> > > >
> > > >  static const struct msm_dp_desc sc7280_dp_descs[] = {
> > > > -       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> > > > +       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_en = true },
> > > > +       { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .wide_bus_en = true },
> > >
> > > I think we need to keep .connector_type here, don't we?
> > >
> >
> > No, Abel removes the need for that in his patches - and while that logic
> > is slightly broken in the RFC I think it looks good.
>
> Let's see v2 first.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



>
> >
> > Regards,
> > Bjorn
> >
> > > > +       {}
> > > > +};
> > > > +
> > > > +static const struct msm_dp_desc sc7280_edp_descs[] = {
> > > >         { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
> > > >         {}
> > > >  };
> > > > @@ -182,7 +187,7 @@ static const struct msm_dp_desc x1e80100_dp_descs[] = {
> > > >  static const struct of_device_id dp_dt_match[] = {
> > > >         { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
> > > >         { .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
> > > > -       { .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
> > > > +       { .compatible = "qcom,sc7280-edp", .data = &sc7280_edp_descs },
> > > >         { .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_descs },
> > > >         { .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
> > > >         { .compatible = "qcom,sc8280xp-dp", .data = &sc8280xp_dp_descs },
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
>
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry
