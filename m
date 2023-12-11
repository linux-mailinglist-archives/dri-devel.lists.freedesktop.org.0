Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC0680C51E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 10:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B30010E386;
	Mon, 11 Dec 2023 09:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A537110E387
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:46:43 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5e121d3a7b5so3857017b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 01:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702288003; x=1702892803; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ceCUCLPLXDWP9zuR7v88iAKVRPzXXELnTgB4Os6l22g=;
 b=uC+Y38vf1b9omK+HfgPM207rHqQHY1f44mOT5AoFa9fKYbROKfnbKQAGaurNPwYt6+
 EHt8pjN6jeeXmcmR33Z6z0+NNwFUHr0HABQrGSnBvMCGSW1v5JLqeGjvvVRrbc/HzWun
 SUI847bkOPnVrYoIbZCYQqzb59kCDUpPuyyS8aVjCbjYzE/uPK/hW8kWJABeveV7MaT2
 eYhTJi6t65FjBLCqdEMoq+wBsDj8RqxvqsMWW63c3Vu07P4CNT5bXDXLyf4LTGPlVdYP
 3VJbl2uo9m6ywbN/rPQsiQshcm3nH/53OgH3rT2no6X5XT8CG7oQotdGjDbpd6Oz4AjP
 oUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702288003; x=1702892803;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ceCUCLPLXDWP9zuR7v88iAKVRPzXXELnTgB4Os6l22g=;
 b=R+3I0Woj6+U8l973WIe3ZTeUr8B//jLzR443o1lRTRz98dmE6wTYQDt0JjAYM5f/uX
 hr4ywIECTR57n7JoBQSMWHnE90pbGdUqvP2XHeNqm0Bc6eiOaFwonzgX30XrLrUSi6Jw
 g6oLhPZcFMwB3ys9SUGq53hI/IfU6FbMtBzpuVOVUDA+bNfBvbYxFiI/sxCZhPMKRFub
 22F6aka2Nd/oneqnWB/+uIdQVeX0C3n/Ed593kCkZp4SUVK3lCu9TNivIbCxfAU+jMqf
 wSKByEK2m+EgpVDpANA3Jd30EIxAhA+KL2kBqM6tptDt34JkUf4xbQEOFWuvxpBOKG4d
 8cnw==
X-Gm-Message-State: AOJu0YwEuP95LXHadfGgTjdu33zsGvuRz5CKQ6+P4jJxdC9RlZhNsuMM
 eck9+hWUb6vgjfWxYEfd2jCYj94CHyn64Qef89gf3A==
X-Google-Smtp-Source: AGHT+IFOa8DSXLPHUigw9G0yCtlmvsBIW84hlWI/2hqEX9J672xst4rq91Q4Tzd92Qk+L8dSWiirXnvbHK1KGoEHH7M=
X-Received: by 2002:a81:d550:0:b0:5d4:20bc:403 with SMTP id
 l16-20020a81d550000000b005d420bc0403mr3018887ywj.2.1702288002808; Mon, 11 Dec
 2023 01:46:42 -0800 (PST)
MIME-Version: 1.0
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
 <20231209232132.3580045-10-dmitry.baryshkov@linaro.org>
 <7d459b20-80f5-4d9a-88b0-9e5769d1d9be@linaro.org>
In-Reply-To: <7d459b20-80f5-4d9a-88b0-9e5769d1d9be@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Dec 2023 11:46:31 +0200
Message-ID: <CAA8EJpqpdvV6-Yxf7njg2srqEyiWJiF3fUGFi1XYBAPvUN3SOg@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm64: dts: qcom: sm8150-hdk: enable DisplayPort and
 USB-C altmode
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Dec 2023 at 11:33, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 10.12.2023 00:21, Dmitry Baryshkov wrote:
> > Enable the USB-C related functionality for the USB-C port on this board.
> > This includes OTG, PowerDelivery and DP AltMode. Also enable the
> > DisplayPort itself.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> [...]
>
> > +&pm8150b_typec {
> > +     status = "okay";
> > +
> > +     vdd-pdphy-supply = <&vreg_l2a_3p1>;
> > +
> > +     connector {
> > +             compatible = "usb-c-connector";
> > +
> > +             power-role = "source";
> > +             data-role = "dual";
> > +             self-powered;
> > +
> > +             source-pdos = <PDO_FIXED(5000, 3000,
> > +                                      PDO_FIXED_DUAL_ROLE |
> > +                                      PDO_FIXED_USB_COMM |
> > +                                      PDO_FIXED_DATA_SWAP)>;
> > +
> > +             altmodes {
> > +                     displayport {
> > +                             svid = <0xff01>;
> /bits/ 16?

Ugh, yes.

-- 
With best wishes
Dmitry
