Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C13A939E6A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 12:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CB388EFF;
	Tue, 23 Jul 2024 10:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Mz39thGr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37AA10E53E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 10:00:02 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6678a45eaa3so50841807b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 03:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721728802; x=1722333602; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zZ9Qf7tzxpC5iei1isMPCv59BXDJInOL01TWRb+zzks=;
 b=Mz39thGrshj21COOJ7itnvygs+RmaLH+MY/nzrj5GFlZV7VTM7rtKljDh+lTWLxj7g
 v/bfaat2DLH98AuvJhubzYqyAuiitkrqbPF9TE5Sr7UCVi1ty4VJtGF6vch6fvKL/2wE
 WVVkHHmFmpcW5aIg1c0W9jV8e1VKrhrBhaNQbmevQ6tooJGp8auGZYGgXpwAiB7l/DYh
 mz1sM5tDAn4P+VG7is0vyR3EbONV+3J+h4mcHnwt0dzTV6YgtnuGSiQosZ/isahXi1pB
 ElBICHKJ+N56z4XBBoJbLxVL0g6FJCaSGX1T4UPXjH/yMbqTGcrM3CgHa/ZkjUnXg//q
 qi+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721728802; x=1722333602;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zZ9Qf7tzxpC5iei1isMPCv59BXDJInOL01TWRb+zzks=;
 b=bFtzmkAic1Y20MtcMiL+tnx7PsP2Z1BXdCsoi6jwQWJDgF2nh3Dik/FJL7QDzx1P2k
 O1qXP7kGYrerXttYTtERj9F+V5LjxQdwiaAP2YOCWEw96l3OUP3c6+KQ2tA3n3Saqydf
 cDIT9lkUqj6roInRsgTuH0WgnfmpJ7Aeb2dIMBtKYqKkx5ZPbX6Gw9pvYP5BJrrr1bqu
 B+iGwVcKMqWL9k6msxfRtR8y8gza+cfFk1QAQdiXSNrkS+Wi1RL2BnmaICO2gwnr8mmR
 qEqDuiv6QswQr7XiNrQLOSfMt/3Iu+YIhK9lZDJX/ghQEaiZvR+D1Eyjb6d3lzpV0AEq
 mHmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXehI0VrV+thOKIAuF3wQ4g6UaCJSdfbVgRGuuN3zU/E4tneHOy1xwZZKX3CSOlP1e3AGMXtYrkKLOGWHyRFpDnSMKDdFVhA/CPFqmfZD1Y
X-Gm-Message-State: AOJu0YxaE6yCsQbH52hQJ5oY7v9FLIA1afih8wtZlEfOxT3TxjkKq5yV
 0mcrsGIl52lJ3l7rndkcdSSR9bndPrMGI5VVegNQ6wlXO2L9LMAeXjJUrTUL00thvvSbG7B0jyg
 cqfOGNMPUTbxJ5WIUqIeNQKJfK0J6emXNKPVmfA==
X-Google-Smtp-Source: AGHT+IEK7eHMKU1XQHiBgtOg3dXLbIEHt6ytDKj/LYQe0cCDUemYTFAfT3Z9In6r8gnhOF50cJznogYo2H/FLxdYzK0=
X-Received: by 2002:a05:690c:2fc1:b0:665:7661:2b7a with SMTP id
 00721157ae682-66ad8dc2403mr100520887b3.25.1721728801875; Tue, 23 Jul 2024
 03:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240627-hdmi-tx-v5-0-355d5c1fbc3c@freebox.fr>
 <20240627-hdmi-tx-v5-4-355d5c1fbc3c@freebox.fr>
 <d9898342-2439-4d3d-8e3d-5bf0a7a40245@linaro.org>
 <b6f6c845-6094-44ce-8ad0-ed4f6d353cec@freebox.fr>
 <CAA8EJpqrAFKCr63JHEpZ3b3zdRfoNXoJP6SqKDOO4sqc=c6YdQ@mail.gmail.com>
 <44101ecd-61f4-4609-bb22-12b40b692552@freebox.fr>
In-Reply-To: <44101ecd-61f4-4609-bb22-12b40b692552@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jul 2024 12:59:50 +0300
Message-ID: <CAA8EJpprtmefNM_CJFRbYVNxOWUVVWbedBq44r7GXOdDrQ2WjA@mail.gmail.com>
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

On Tue, 23 Jul 2024 at 12:48, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> On 16/07/2024 18:37, Dmitry Baryshkov wrote:
>
> > No, that's fine. It is the SMMU issue that Konrad has been asking you
> > to take a look at.
>
> Context:
>
> [    4.911422] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> [    4.923353] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> [    4.927893] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> [    4.941928] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> [    4.944438] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> [    4.956013] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> [    4.961055] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> [    4.974565] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> [    4.977628] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> [    4.989670] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>
>
> As I mentioned, I don't think I've ever seen issues from cd00000.iommu
> on my board.

Interestingly enough, I can also see iommu errors during WiFi startup
/ shutdown on msm8998 / miix630. This leads me to thinking that it
well might be that there is a missing quirk in the iommu driver.

>
> I can test a reboot loop for a few hours, to see if anything shows up.

Yes, pleas.

-- 
With best wishes
Dmitry
