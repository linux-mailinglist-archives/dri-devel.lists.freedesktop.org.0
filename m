Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2F4A73333
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 14:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A834310E0AD;
	Thu, 27 Mar 2025 13:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EJbAq+cu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A63510E0AD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 13:19:30 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-39133f709f5so549939f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 06:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743081568; x=1743686368; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+cDdIOswm/cyDdBII0iuR2QdTuXYbEwDjifjrlArm8o=;
 b=EJbAq+cu5zTD4Wqt6ID4ZrMET+CEgtojoyKpry0oVBZWoWScy7YIa/9xAtNiss18EA
 vIaK+aFoUw3Hg8+IgmwdvJBo/Ofj/Qj9/SSOcTB7FLwSlLKqGIX0Gi25+uU01AiagfKa
 pj5bBNZ5amfLqSVkEwVLbk9bkTrAu01M24ebVxA+75o5mseviUEspVdPTtrFWbPGqa8c
 lqCMN5d/+Pl5cvLU5W0urO9TdyYSXehoAyPv8l6GPGV5BeU76EhK+alJRG8BpH1NoEzs
 tJSo2tQ51acDFHbQYKRm4MEfhSMyE2uuwjreCsZPx3vJOS6B6/7J4ek/AkCnNHhakM+u
 A2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743081568; x=1743686368;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+cDdIOswm/cyDdBII0iuR2QdTuXYbEwDjifjrlArm8o=;
 b=qDPWbl9AsZnFbogZm+l8ahBkTkbIoHlntqf1a9b7LDqxodsXBT6tP41woKCblSI7mn
 qi786w6UM3LtkrOV2xGtDnuqVRj2N6jDtDKDph1MIukPVhufiThK6V9XTtJBHpzviakq
 eMJedvdIcAgsYOAW+W77FjYRnwytarAaftztdD7p1YYpFApEGOdRbjFdByNrDvCl4sBt
 W9OuWYhQh7EOIqgfPoW+wwwbMBE3RQr3JQDca+9sWy4Lb/yrBeN+i2Rxo78jI62/R1IJ
 1B/XAl3MMS7tF/TQU0TSj6P8n2a9jS/Voh6OtnIRSGExY4nDOMCjf65AFdI5Oh8FyWu5
 JQSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgJwAr8Rb0Z5wjm1vrmjcqMLqpiv1DJIs/NJaUYv1hD8qNqdMofrdbADEu5mJJxxb1GGg8flXgbc0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/T77kpYDA1S0oCdME8LZHTdsBBz266BLO5zubtQgYZfpVXjTZ
 4oiHT/bY4P2Akic1vRWg2g46s6AdUPZDxZTZTuEzjrACtDcrsdDtJdHkckOR2m596cQmQHrGH1l
 X8FgBN9XYXR+Wkn7/pF2SlVeBhiwmTowF0/Q7vA==
X-Gm-Gg: ASbGncvxMuxNNt0zub1895nMOhiLa5i8s8tvBUDn5NkrGqHjP/ks4Iob97zLDS6y6Zw
 GDy0ROtxKj454kETWB75j3PitF66q8KXKezwkvhVFUJGgO7+Bf+YztKpCrVyuNu9EbCuwrNBI3U
 tlwz+Mm+v5k5x509qfYEC8cDhZXK2UjJvG/Tp3pu0RlB9nA8KF4/sWkIGCITA=
X-Google-Smtp-Source: AGHT+IHs5VZplywxnxEi47k8pf3rZnEm/7qBpY3Ioc8amqZO6vhJqMiAOdf0vB5bQQTzKsXVOl4SWXK8fz/Hde+Ezy8=
X-Received: by 2002:a5d:6487:0:b0:385:ee40:2d88 with SMTP id
 ffacd0b85a97d-39ad1740bd5mr3141625f8f.3.1743081567876; Thu, 27 Mar 2025
 06:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org>
 <Z+UGqItLubQ9kwF+@linaro.org>
In-Reply-To: <Z+UGqItLubQ9kwF+@linaro.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 27 Mar 2025 13:19:16 +0000
X-Gm-Features: AQ5f1JqvG9Z_EF7biygLKr6lcDhPMwDOinSPLyFBaGcwOFtc4jXqvP1t5fWsCZ0
Message-ID: <CACr-zFAVDhDvWupMMCe5ttpCU8+NSD0XK1tS=TsstM1znhDHNA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/dp: fallback to maximum when PWM bit count is
 zero
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>,
 devicetree@vger.kernel.org
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

Right, the reason this was included in this series is because without
this patch the panel's backlight doesn't actually work. So for me it
was natural to include it. But happy to split it into its own series.

On Thu, 27 Mar 2025 at 08:05, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 25-03-25 19:21:29, Christopher Obbard wrote:
> > Some eDP devices report DP_EDP_PWMGEN_BIT_COUNT as 0, but still provide
> > valid non-zero MIN and MAX values. This patch reworks the logic to
> > fallback to the max value in such cases, ensuring correct backlight PWM
> > configuration even when the bit count value is not explicitly set.
> >
> > This improves compatibility with eDP panels (e.g. Samsung ATNA40YK20
> > used on the Lenovo T14s Gen6 Snapdragon with OLED panel) which reports
> > DP_EDP_PWMGEN_BIT_COUNT as 0 but still provides valid non-zero MIN/MAX
> > values.
> >
>
> Nit-pick: AFAICT, there is no relationship between this patch and the
> rest. So it should've probably not be part of this patchset.
