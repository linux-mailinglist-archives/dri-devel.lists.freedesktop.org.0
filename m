Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16D17BE65E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 18:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A20D10E285;
	Mon,  9 Oct 2023 16:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16D910E10D;
 Mon,  9 Oct 2023 16:29:16 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5333fb34be3so8088679a12.1; 
 Mon, 09 Oct 2023 09:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696868955; x=1697473755; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UBOzhrKG0D5wh3WUocJj1AFT0B8v/jEsd27mVVQJ+2Y=;
 b=Obt5FCe3wwHAN40Dwq5I4BBmXxWIfQUMbb5/4O947Cy0IciykgKu3fzylcxd9t6OT8
 c+dHEQLExXIH7aUdmju0xI1ADyQxX1mJ/0NfTkkMs+bYcrrXHwY+xprutdkHII4LaKcX
 JZsFr6C31339YLAvP/HbmWeyH0js/sOGHdZLiN/mZUBB49Hen0EOap2vbmGw03FVejT/
 FdsizCqKd15EEzNMHxdHhMmBp07LXjSghUNetzJ+BfWp98eQw10JRzpAKtt4AhOpDgD1
 T73DK9cLsJblKQcgYUNISTCIPqiCDJaTOnn2M4hVcGvMZ27UeDVSe/YNoBuA+yM3tU3P
 abcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696868955; x=1697473755;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UBOzhrKG0D5wh3WUocJj1AFT0B8v/jEsd27mVVQJ+2Y=;
 b=IbBxn59pjvBNorlve3n0HHuMmXCQERJIQOdknwAkwSprRNiE5G1BUPFGD73/EvXa0u
 igmR3/WHIVH9RgJ5hnBCld4niVYLHeV8QZVY/bum5HodEm22Z0rw3N+vxFbudsw+fJ52
 tzFLe/h0cD5XIYXMM+QqKD71u59YRqRZBzKwseQOLVGihQW4EjripZKKuOH70JfO64zm
 HeUHsD0jEYZFJr1Lk2NuGqryZoIDWryyYQaygJeJSl1mDoxPuxHAwulw90jSQyMZg94M
 4d2R1u8mMVh5W8mskPzD/GYPPMQpLkYqP+S7jZhqcpB24xVwDfmg5TPBpd+Ex0/O7Dx7
 +XSw==
X-Gm-Message-State: AOJu0YydSJd9GWAsqCvYv2m5UZ+WrC2XiZRPzfSG2j3ZzuIa38pNDbqB
 G3cSzHj0sud46dDSrQ7h+yc2jApBgjfqVihLfww=
X-Google-Smtp-Source: AGHT+IEVsgs8Kr7kEZog8a7vGbHydDipO7g7T9pXn0lpmLf84elk6W5IYOijwNe6SG6c/majohm0Rloiu8H1R3AlXFI=
X-Received: by 2002:aa7:c246:0:b0:533:4f9b:67c8 with SMTP id
 y6-20020aa7c246000000b005334f9b67c8mr14880831edo.16.1696868954823; Mon, 09
 Oct 2023 09:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230704174553.216248-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230704174553.216248-1-dmitry.baryshkov@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Oct 2023 09:29:02 -0700
Message-ID: <CAF6AEGtZ=MMf5=aCZFzi56UQiip5paRHH81Pk5fX2Tr_N4=UDA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] drm/msm: move resource allocation to the _probe
 function
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 4, 2023 at 10:45=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> This patchset was left untouched for almost a year. Let's reiterate it
> in attempt to solve the long-standing issue.
>
> As discussed several times on IRC, move display subdriver resource
> allocation from kms_init to probe time to let it bail early.
>
> Changes since v3:
> - Fixed MMIO unmaping in the DPU case.
>
> Changes since v2:
> - Move even more resource allocation in the DPU init path.
>
> Changes since v1:
> - Dropped the applied patch
> - Picked in the patch to pass msm_kms pointer via msm_drv_probe()
>
> Dmitry Baryshkov (4):
>   drm/msm: allow passing struct msm_kms to msm_drv_probe()
>   drm/msm/dpu: move resource allocation to the _probe function
>   drm/msm/mdp4: move resource allocation to the _probe function
>   drm/msm/mdp5: move resource allocation to the _probe function

for the series,

Reviewed-by: Rob Clark <robdclark@gmail.com>

>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 133 +++++++++++------------
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 +++++++++---------
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 100 ++++++++---------
>  drivers/gpu/drm/msm/msm_drv.c            |   6 +-
>  drivers/gpu/drm/msm/msm_drv.h            |   3 +-
>  5 files changed, 162 insertions(+), 187 deletions(-)
>
> --
> 2.39.2
>
