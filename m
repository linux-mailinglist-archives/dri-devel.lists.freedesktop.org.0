Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C82886F6FD
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 21:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF9310EC87;
	Sun,  3 Mar 2024 20:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J3LfmBc4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D8B10F0EC
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Mar 2024 20:17:41 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-d9b9adaf291so3282298276.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Mar 2024 12:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709497060; x=1710101860; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0oLMJ7QyQW9M1dcmvX6Tku2vCY05PL1Xxf4L46VwXmk=;
 b=J3LfmBc4wUx0og4RrH/QZ8wlgmyVUiu2ePCb6kaUNjUFQFfNLb+LrXHJQKTcUy4YKx
 rGKaVeP19F2FxZn+rLlji4Oamjpk+re0diM6ph2DmyLJ9JPaakHyEb8ycqc1j4PMh335
 Bf6ndpdnhC5kiYZDIUVcMb2HsTqSf4lxJRP0HRxqDhWqKdUjrev6uDACN3VJ+A0wJ1q9
 pPnoXJuWvLkV6tn0G/Z5o/4h5TZSIdXXMaHBhYNCyY6l9FHBwENi0zPPAvIpSAUkQxQq
 n6BL9n1ZJkUIqUfiPUAbAwV+5RxPYYLSxwaE9/WtLTWni+mxR6ZyYlN8lVpXLNSQFKsZ
 35Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709497060; x=1710101860;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0oLMJ7QyQW9M1dcmvX6Tku2vCY05PL1Xxf4L46VwXmk=;
 b=otZlxY1C0VF3m9Rt7UkCwbfN0/ZaVcO79kfISPlMApF7U7QM+DfgThiZAfOkYFTYuP
 tzGpsVZ5oppubtIxnjIbKTVFfLLH8BSTGeq0rTe5tBAiQLvSZZSgEkCtZPxVq8NW37FZ
 9sU5ySVdWuYogAZjh2UetSlCeuMFMPv3MSEy5k9+LTrRLxiBNtl91VfFEzkxnAkmypfj
 1YwxBW/1hWu4dMgRST+5n2KPwljR6L24ozSmOXTASSIA3f1Zvr1jMqAsYQFwkeDkdNnR
 tKHf0WWrkeG8W3H/mIQAa5JUpRi0fEsHPZFsAL8JpLbv/gMf1YcLJn23ZNPTX6K18nXi
 idqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHY7VkmOX1j7xW63ahek4zCIRABHnWi9uYAn+8jcD0aT/OJ7VVN723VZRkhRDb3bX849jzttFbplJlqBcxYzvQn4YIU20PX791kH/NM+Of
X-Gm-Message-State: AOJu0YwuYPzocIG1J43WnVIo+dyPeXvwbHl5oMGnkslO/W7FvQXRO3Cz
 W3M1oXFbSmGSE9a7yo47o8oe4QjWI9NW51z7NPTN9eNMv6rpTHOa0FOnzhv1BMye43ufEd68P/t
 zqcet8/IF2a81QH0AMRdUi+ubffuO/7yePCT2rQ==
X-Google-Smtp-Source: AGHT+IFPY9ZyADmDsmR9SjEm5ehQQZqmjmvwRGcwPSo1nZrtoYE3mGo81maMBFS4xRF5pgWyRBvOsVR35VN7iVyETrc=
X-Received: by 2002:a81:4744:0:b0:608:b5e4:9576 with SMTP id
 u65-20020a814744000000b00608b5e49576mr4921561ywa.45.1709497059898; Sun, 03
 Mar 2024 12:17:39 -0800 (PST)
MIME-Version: 1.0
References: <20240222-x1e80100-display-refactor-connector-v2-0-bd4197dfceab@linaro.org>
 <20240222-x1e80100-display-refactor-connector-v2-1-bd4197dfceab@linaro.org>
 <a90dcd83-d158-4ec1-9186-0658c108afef@linaro.org>
 <20240301175205.GB2438612-robh@kernel.org>
In-Reply-To: <20240301175205.GB2438612-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 3 Mar 2024 22:17:28 +0200
Message-ID: <CAA8EJppVhMyA_QK_RzC_+M3dniBrm5wxUKeoeh0Dg2w++JoZ2g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: dp-controller: document
 X1E80100 compatible
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Johan Hovold <johan@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Fri, 1 Mar 2024 at 19:52, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Feb 27, 2024 at 04:45:25PM +0100, Krzysztof Kozlowski wrote:
> > On 22/02/2024 16:55, Abel Vesa wrote:
> > > Add the X1E80100 to the list of compatibles and document the is-edp
> > > flag. The controllers are expected to operate in DP mode by default,
> > > and this flag can be used to select eDP mode.
> > >
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > index ae53cbfb2193..ed11852e403d 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > @@ -27,6 +27,7 @@ properties:
> > >            - qcom,sdm845-dp
> > >            - qcom,sm8350-dp
> > >            - qcom,sm8650-dp
> > > +          - qcom,x1e80100-dp
> > >        - items:
> > >            - enum:
> > >                - qcom,sm8150-dp
> > > @@ -73,6 +74,11 @@ properties:
> > >        - description: phy 0 parent
> > >        - description: phy 1 parent
> > >
> > > +  is-edp:
> > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > +    description:
> > > +      Tells the controller to switch to eDP mode
> >
> >
> > DP controller cannot be edp, so property "is-edp" is confusing. Probably
> > you want to choose some phy mode, so you should rather use "phy-mode"
> > property. I am sure we've been here...
>
> phy-mode belongs in the phy node though. Not that you couldn't look in
> the phy node and see, but everyone likes all the properties they need
> nicely packaged up in their driver's node.
>
> > Anyway, if you define completely new property without vendor prefix,
> > that's a generic property, so you need to put it in some common schema
> > for all Display Controllers, not only Qualcomm.

Is there a generic schema for DisplayPort controllers? I think there
is none at this point. We can probably add it, declaring is-edp
property, link-frequencies, etc.
However Mediatek already uses a different option to specify supported
link frequencies.

>
> I'm trying to unsee what the driver is doing... Hard-coding the
> connector type and some instance indices. Uhhhh! I'm sure I'm to blame
> for rejecting those in DT.

Once this patchset is accepted (in this or that or whatever else
form), we will cleanup most of those hardcoded types.

>
> I've suggested connector nodes in the past. More generally, whatever is
> attached at the other end (as it could be a bridge rather than a
> connector) knows what mode is needed. It's simple negotiation. Each end
> presents what they support. You take the union of the list(s) and get
> the mode. If there's more than one, then the kernel or user gets to
> choose.

It's not that easy. First, probing of the bridge chain differs
slightly depending on whether the controller is eDP or DP controller.
eDP should use AUX BUS, while DP (currently) doesn't use it. More
importantly, error conditions differ too. For example, in the DP case
it is perfectly fine to have nothing attached to the controller. It
just means that the display chain needs no additional handling and the
HPD pin will be handled by the controller itself. In the eDP case if
neither a panel nor a bridge are attached, it is considered to be an
error and thus the driver will return probe error.

> Qualcomm is not the only one with this problem. Solve it for everyone...

-- 
With best wishes
Dmitry
