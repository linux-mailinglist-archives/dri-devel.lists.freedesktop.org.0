Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F26DF92ABC5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 00:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119D410E1D1;
	Mon,  8 Jul 2024 22:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QJa+TEMg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F3110E1D1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 22:11:31 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-65465878c1fso34423627b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 15:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720476690; x=1721081490; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=akSjRnSmQJXB8QkjLs5AoCqiPkMwFsS9lxtSRUZRr8U=;
 b=QJa+TEMg4fjIkjNKyTzE8aWV0uz0FPbqFzoUC2ochapZ3yq6R1JTPWWTFB9TZhMsq0
 zgfitlyMdcrjktJhiXsS1zB5iASIB3o3/Pnl8iTAmioj9LVDJe83VPBcwYFAozrirYQB
 Ve4lVmEiMXpTmCOz8oSPGVjw216OXLGrvC0BWUBhEVAcikZZ4InT31V4aRqyfjVhew0e
 A3XB7kWkvmUeNEIMSVb6IBKxcVG4mMeWjB+I347Wd2LBw/l8scViqr9YQCCQBE/v6f5h
 FCpyfQGHXy7NYcPYPJTNpKyF2V5+FlezPUfhJV9BqJ+uFID1MTFnCBH4qfCSxpgCyRN9
 R0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720476690; x=1721081490;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=akSjRnSmQJXB8QkjLs5AoCqiPkMwFsS9lxtSRUZRr8U=;
 b=IHTq1zN1V/Px98Revan2Ws2XssH5smVpIoj7s7VZZ8YA/S161NRdIui54MveRiGjzX
 1VyYFVU2wt+T19D9dN4Ya3gmHRvhxqeACNhdWWzKk5VVV8a/SGZuHD80kq7W8UEUgJ2t
 c6R5YJh+bfCx1o3yBq7S1x7+7ejQU8m0vki84VTTWQ/kPj2p4eyDm1igoYuXSyVG5b1/
 4vKGBMNxtXlGAk6gN2nc184081LTJ5uk1b2wjCjh852vBEywEBEP9HQ1Pf+hnUG3l7bP
 pJzctzTpSwFN1Yo0bXQC7XQfz6HgMGmdrbkFeaS2AGU9C/LPR27xMRI9IQHczOgjwFrM
 84ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaSEdr4XOr6o4Nl9iBT1m/W+qHqw6tqSvbjqs80lJh3UPf8JfCMntP6Foucceiblwe+V/UGGfq+FNtsFTzoaPoCAsoBFPkfcsB+ZLE0UdG
X-Gm-Message-State: AOJu0YzU8n0gVXGI1ssGGs6ACWG+26MAtn1iRMzYB4PyAjLOEm7i3S4x
 0vQwR6lp1iu8FVrqUhlFIi4i6NOlqG7Anx08Iyv/jvP1SYTekzdlzUf97SIKPczPKb+bhy3YmyX
 qeA2MbefT1pEZIZcOhVlGsYM8dh9rFgy01GUnZg==
X-Google-Smtp-Source: AGHT+IGJJD4YdSne2E2CDJPTcw+1HwH33TbgcTt5pV7mkcprUs/4t0BFrxvbt5GIFxFuNWKCvnJHBDIxbicRlCahRC4=
X-Received: by 2002:a81:6985:0:b0:64b:2a73:f050 with SMTP id
 00721157ae682-658ef2494cfmr10696077b3.23.1720476690444; Mon, 08 Jul 2024
 15:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240704-hdmi-phy-v2-1-a7f5af202cb5@freebox.fr>
 <5lbtymde3plfiqkvnd2lrjzxhengmsw242uqapnzpvfd5jrm25@x2ik2h6vrdxm>
 <2d21db63-4371-45b4-ab24-9a725c29e09a@freebox.fr>
 <CAA8EJpqz1SiUdTMpx5hmnax_rBqtpVAtOZsaL8UfHnZ5vZZFHQ@mail.gmail.com>
 <c7da3acb-4456-496d-9876-b05abcc0e010@linaro.org>
In-Reply-To: <c7da3acb-4456-496d-9876-b05abcc0e010@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Jul 2024 01:11:19 +0300
Message-ID: <CAA8EJpoD4og3eb2aFB5HkFh3vAfyhqG=smtcUbmgNeuWwaJtGg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: add msm8998 hdmi phy/pll support
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-phy@lists.infradead.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>
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

On Tue, 9 Jul 2024 at 00:27, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 8.07.2024 2:49 PM, Dmitry Baryshkov wrote:
> > On Mon, 8 Jul 2024 at 14:07, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
> >>
> >> On 05/07/2024 16:34, Dmitry Baryshkov wrote:
>
> [...]
>
> >>> I'm not going to check the math, but it looks pretty close to what we
> >>> have for msm8996.
> >>
> >> What is the consequence of this?
> >
> > That I won't check the math :-D
>
> Dmitry is trying to say that you should check whether the calculations
> are the same or almost the same as in the 8996 driver, and if so, try
> to commonize the code between the two

Not quite :-D

They are slightly different. More importantly, this is a different
version of QMP PHY. So, it's not really worth merging the code.
Earlier on I pasted the patchset to move all HDMI PHY drivers to
drivers/phy/qualcomm. I plan to integrate msm8998 support into that
patchset (this should not be delaying this patch though). But I don't
want to commonize the HDMI QMP PHY code before somebody implements
support for the third version of QMP HDMI PHYs, the one that is found
on msm8992/94.


-- 
With best wishes
Dmitry
