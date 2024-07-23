Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ED993A0EA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 15:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8261610E5BF;
	Tue, 23 Jul 2024 13:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bm+POFhW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC56610E5C1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 13:10:52 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e0875f1e9edso2904092276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 06:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721740252; x=1722345052; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9S9caq5ixK7RVU119zrmlgox7IJy9AQQzneZ4xlUEts=;
 b=bm+POFhW3XdqWWS5NEuQEIxXtQPA6NqM2e/3knIbpJETp4TxOBki9i41S5+dKAXocK
 yry6FmGWhJBKln3xopwfHwWahQgPw+GsO0bFWhNWFV4Ifc3mz/WeOf2amfrFMV0lHlJ/
 zuw5RVLGUnRlxmRHakRqhQS0+5VZ60a2FElHmZnlm/WNyqct+6tjSss0Or+c/Z/hyX0q
 GnFp9r3rhm4g5ZzLZ5UfH9v5Q2A5wp36ChEJd55ed4aRsBDPt5DS+T2JQ+x5cAdaDdZ8
 uOlJ6i8eAmA5XsT08N4sOJMDTFfSenCfx0aIvEA6UDjJvpb8drh8XCXoxmsBzN3U5Jik
 3Slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721740252; x=1722345052;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9S9caq5ixK7RVU119zrmlgox7IJy9AQQzneZ4xlUEts=;
 b=BW1844/5Tx36RBOrTwMiSp2KyjOuxlmkw0+QFCfdkJxSfGX2yTpeweszD5+7ATRLLI
 gFWlac8RLuAgnTAUZ2eL3LIFkqFi5O9kYZ6+Ut+XrGXFbZ0BUMyVyfY84WWCv9/C+0IY
 hDSZn5vAEVO3GuS8gRH6IpXp0oWho7350VFHAINCCc8swrCOqwwqtGIY5NTEvKk1kozA
 hyXScIf5IQnGvu3AA1Qzp85i/HqCbAWakL4yL4Aj7oXJfFWKJol+hO9yzVbyDyD2R7ZC
 9Nm7x8ong6Pth1G4CwXEpcqK9Tyqtt0oUUl2wJv/pPSnqW5m9lNLAkuo5nB+c6OFT6+7
 Kqow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlCLwIkWUlDfT9lnGqsF7bYgI0UIdCjkiu1yUkbwEMX0knC7sGFfSeFLObdEsF+xNvn+h+ZbQv9VINxM2+7r8DYG7nadfqG0Wn+GRo/Xlf
X-Gm-Message-State: AOJu0YwUDEemMM7fFsrRKzO4/+TNlBpTA9ZhoRzHlVU8dF1YAscQmt0d
 G9k6+FniC8cpXZ0jSgkMjKXg0lbAyls+zo2zXSFhpIMzNmgtw94QxtjcBSZWJ7zbQdxQBrOVLtL
 dQEOL/ArCKt9eRcmbVUyuu2CvmqgOwDAKmSRIlQ==
X-Google-Smtp-Source: AGHT+IEvHl3fw0AI0tCkrIySzqAkFe181rizQvmQiBdjgb0qmyADd+fwF1ufcs4Jld9VZVuq1IfAGCuddousT9eYlYU=
X-Received: by 2002:a05:6902:e01:b0:e06:df51:fda0 with SMTP id
 3f1490d57ef6-e08706a4dd8mr13265905276.42.1721740251724; Tue, 23 Jul 2024
 06:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240627-hdmi-tx-v5-0-355d5c1fbc3c@freebox.fr>
 <20240627-hdmi-tx-v5-4-355d5c1fbc3c@freebox.fr>
 <d9898342-2439-4d3d-8e3d-5bf0a7a40245@linaro.org>
 <b6f6c845-6094-44ce-8ad0-ed4f6d353cec@freebox.fr>
 <CAA8EJpqrAFKCr63JHEpZ3b3zdRfoNXoJP6SqKDOO4sqc=c6YdQ@mail.gmail.com>
 <44101ecd-61f4-4609-bb22-12b40b692552@freebox.fr>
 <CAA8EJpprtmefNM_CJFRbYVNxOWUVVWbedBq44r7GXOdDrQ2WjA@mail.gmail.com>
 <04ef978f-2bfd-46cc-a9f7-40a6f1c507f8@linaro.org>
 <7d34a857-6495-482b-9070-1817c88c9913@freebox.fr>
In-Reply-To: <7d34a857-6495-482b-9070-1817c88c9913@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jul 2024 16:10:40 +0300
Message-ID: <CAA8EJpo_ki3fxR4dmobMH_CiYWfb2ZOHwiY8e-McKR8xqU9jbQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
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

On Tue, 23 Jul 2024 at 15:57, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> On 23/07/2024 13:45, Konrad Dybcio wrote:
>
> > On 23.07.2024 11:59 AM, Dmitry Baryshkov wrote:
> >
> >> On Tue, 23 Jul 2024 at 12:48, Marc Gonzalez wrote:
> >>
> >>> On 16/07/2024 18:37, Dmitry Baryshkov wrote:
> >>>
> >>>> No, that's fine. It is the SMMU issue that Konrad has been asking you
> >>>> to take a look at.
> >>>
> >>> Context:
> >>>
> >>> [    4.911422] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> >>> [    4.923353] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> >>> [    4.927893] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> >>> [    4.941928] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> >>> [    4.944438] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> >>> [    4.956013] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> >>> [    4.961055] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> >>> [    4.974565] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> >>> [    4.977628] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> >>> [    4.989670] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> >>>
> >>>
> >>> As I mentioned, I don't think I've ever seen issues from cd00000.iommu
> >>> on my board.
> >>
> >> Interestingly enough, I can also see iommu errors during WiFi startup
> >> / shutdown on msm8998 / miix630. This leads me to thinking that it
> >> well might be that there is a missing quirk in the iommu driver.
> >>
> >>> I can test a reboot loop for a few hours, to see if anything shows up.
> >>
> >> Yes, please.
> >
> > Yeah I do trust you Marc that it actually works for you and I'm not
> > gonna delay this series because of that, but please go ahead and
> > reboot-loop your board
> >
> > 8998/660 is """famous""" for it's iommu problems
>
> [   20.501062] arm-smmu 16c0000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x1, cbfrsynra=0x1900, cb=0

I think 0x1900 is WiFi.

>
> I get the above warning pretty reliably.
> I don't think it's related to the issue(s) you mentioned.
> System just keeps plodding along.
>
> Regards
>


-- 
With best wishes
Dmitry
