Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B532EA3C616
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 18:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D83F10E34A;
	Wed, 19 Feb 2025 17:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RHNmOecF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2E610E34A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 17:24:26 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-6f9625c0fccso58845837b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 09:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739985865; x=1740590665; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0cr90zEajdAaEBjcRfisPPDqVdNWUpvTZCFRKVO9Uh4=;
 b=RHNmOecFP6Gkzig9bO8eLaOJnvFbm+KbSbgV4oLyOkO1rntFLbDxIFx31G8IIs7lGE
 tsyno61vQyGhRvYfzkUUtzAhFjQLXQA0nQsFO7XQFn2C0lYUhtCAnn6PTHF31shzRDg2
 UsmDCU7B27Zgl9CTCYJG4l06yH4hUlBJrPk7AT+pdMKkhPYDKjtnroPWMegDKhldIUTI
 qRsM7e9Oe1oeAlu0QVJekmMqCBYgzW4egUXdZZ8TTQ1aat30BGJdN4e3EtJ/EoS3GqUs
 Ss9yff5JC/kh/VWkGZJkswhYD1e2P7ievJAqlYhKds33qO5MksvcDeG/L9FSbLY9UT75
 AluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739985865; x=1740590665;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0cr90zEajdAaEBjcRfisPPDqVdNWUpvTZCFRKVO9Uh4=;
 b=NF1RrVzwnZ7UOeebos0ftvJRoImiszBvYg/gyNkmWJ4kDTSjTReOawOzj6Mi5usm4Y
 xNg5ONbmROxnfPgi54t7PqaQb3E45jcgoUZJwslp338Hj031y9DqAXdlHkW1BudlAMVB
 kdaV9T58MtPppSaShE9JAuNAyylEnbWItYfzfK4ny/z3KUAk4mf94fA3DS2vUSWd2aoH
 5zaIEgvAXKNCqCyQyULaXPLQYbejnX0SNPDAPMycgYX5HGGX6rW5QB3R1ZMuU5RZttGA
 UgAGriSl7LyCQYxCGSJ6maYid/0hvlPX/5jJ2PzQF3gVl6IHJHvdVTZqWCj/eRrgdoGV
 YLUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgGK9shiJELGiS9oDinUu6kO50jIA2OQSTE+044jsDXdOzcLxvgNpAZXduk12YbPJ5UcvYM75Ct60=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnoPRzxOBg145cINhCJvNEZg8NiF1XQBDFOYsOJJ6MToy+UfW2
 38kY7cA5aV0bOuEFpaSgW0vvQq8k+69kcTunvIg/aeZ9LZ0fVuOsvjZsCrnEw2azulI1qA9IQUD
 Qf3RPhRzaMOQG4kgrVMN1lPLCZ8WwzBJACNn3ew==
X-Gm-Gg: ASbGncsenv0YCi0UsvvE9jFx1GcA7ZklBnhMAQoCX3/mX6jYS6Ys+njJa7VB6mTefcN
 wYY+uf6Z46GY/dhUrO1+GFbKgqg/n7C99RiK3MOhgUWVT7P1d9oXS6d0Z64Ffuzti+nUbdJMD8c
 qjFJauMsEmUc8=
X-Google-Smtp-Source: AGHT+IHPYcZfjn7eucK8FvixqCR2I2msLnTZntlahztuzdBpXoxW57EO45la9a3FzKXUns8U3FOZ+w7YFPg8lisWjjs=
X-Received: by 2002:a05:690c:7445:b0:6ef:7dde:bdef with SMTP id
 00721157ae682-6fb58359ca6mr143804167b3.23.1739985865461; Wed, 19 Feb 2025
 09:24:25 -0800 (PST)
MIME-Version: 1.0
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-15-d201dcdda6a4@linaro.org>
 <qlotuliwnm5spneolztca7avmh2a46pz2xqlxzqbw5kwa53m6q@oyhnzz7fhay3>
 <4b2426d2-a7bb-4c19-9ebe-77f6a90caf5e@linaro.org>
In-Reply-To: <4b2426d2-a7bb-4c19-9ebe-77f6a90caf5e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 19 Feb 2025 19:24:14 +0200
X-Gm-Features: AWEUYZmAr3QYLaFayeHeppxyHSH1mnwXmz4zOX0FGc46bc3FPvsfNyKPQb2_VV4
Message-ID: <CAA8EJpquBhQeac0E66NqeagkxP-qY0whmah2ND0xziUQdxc_7g@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] drm/msm/dpu: Implement new v12.0 DPU differences
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
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

On Wed, 19 Feb 2025 at 19:04, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 17/02/2025 20:18, Dmitry Baryshkov wrote:
> > On Mon, Feb 17, 2025 at 05:41:36PM +0100, Krzysztof Kozlowski wrote:
> >> Implement new features and differences coming in v12.0 of DPU present on
> >> Qualcomm SM8750 SoC:
> >> 1. 10-bit color alpha.
> >> 2. New CTL_PIPE_ACTIVE and CTL_LAYER_ACTIVE registers for pipes and
> >>    layer mixers.
> >> 2. Several differences in LM registers (also changed offsets) for LM
> >>    crossbar hardware changes.
> >
> > I'd really prefer for this patch to be split into a logical chunks
> > rather than "everything for 12.x"
> everything 12.x is still logical chunk. I can split more, but without
> guidance what is here logical chunk, will be tricky.
>
> For example 10-bit color alpha looks like separate feature. But
> remaining PIPE/LAYER active - not sure.
>
> I can split them but I would not call such split necessarily logical.

I'd say, the following items are logical chunks:
- ctl->ops.active_fetch_pipes in dpu_encoder_helper_reset_mixers() and
dpu_hw_ctl_reset_intf_cfg_v1() (with a proper Fixes tag?)
- 10-bit alpha, border color,
- active_pipes
- blend stage in LM + set_active_lms

-- 
With best wishes
Dmitry
