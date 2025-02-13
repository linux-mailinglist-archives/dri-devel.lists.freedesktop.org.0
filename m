Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CDAA34B92
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9929310EB4E;
	Thu, 13 Feb 2025 17:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N68kDozZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B7010EB4D;
 Thu, 13 Feb 2025 17:19:46 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3cfeff44d94so3470065ab.0; 
 Thu, 13 Feb 2025 09:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739467186; x=1740071986; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bm4i25adIjcurhFNxqJaA0QU/KW7QorJTeiX3Rr0sNU=;
 b=N68kDozZib2ZKQpv85NXXXUkIWXj68ARsHEAwNdsCpopVCw3kvCUKnqESxuzzyziw5
 pzqMpMgIxE4WF85x6FLuBjGzkK1DmBGnJXtzvTiByK35FsybmmV6Je727AeKJ/gZ3j/Q
 VBK9vdQmeysYB8f0h50q77nATRsijIJapVMJyge21zbADQuoskrhGdexW4uW1z5IUDL+
 SqklJPrw+9h+tA/oEIvnvLtNMODG6xElCKv+7p1qpaBTU4Vek8G0d9P3Hft7RjOvjgI2
 CklPGjx9B/IqhaOV1tQKehthVTEp6A3JNP7+pBj/oN0Shic+vbE7hT1rZKxy2fPdBIKE
 5+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739467186; x=1740071986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bm4i25adIjcurhFNxqJaA0QU/KW7QorJTeiX3Rr0sNU=;
 b=MoXphH+FzOBtchqaW1vzo05ZOYPWx/UQ49LrA+1qj1S1CCsfGHe5x+cVxmxMu6GjGN
 oD5l9YFKqbLGJZWv/bj9kltl176bKCo047bnjMTyJchZlteLyfd8Nyn96im/B4jT1PwK
 lvEHFfqUlqi46uq8NugKaQJOBsM2P1/KodPfd6yjY7ta3yRgOWAiI6KNUbNl6dy8Llcy
 oVtlGDx53nEZQT+FZZB4TsUU/eby7iyZBPLxk799B7tq4VBaX5YNWLCQWqGLlE1QI2PG
 R9OL7kNmsZzxk92cUIKPo5luk+0UM7ByJ1Kt9p/ZDLRlvnYJD3Yzb8Im0W9aAqt7JS8+
 AAhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFvNiutzt9oTNtu/JmUNfZmvxjSE9WD8bl16v/XrSZgHVra4b6KM9OEnltpcXsZDCCoiIihM0t6gXf@lists.freedesktop.org,
 AJvYcCVI2o3FXF5tOAys71Ho/YZ5RL/w+6oxwDwaahSXddiRAM7CS4cOPTlFavuS9OBTFjdVpzCYUzUl33c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyodLLWYAp998bhmiimhgXmUJzRpKvKQm9QfqlEAkJTfoQHtzHh
 YRbgZfXWsYmOTcYUoVDOyUtEmM/yF3miN9WcWodOMjupahoJey3JnLN8tOhnn/OwpZcIXfocJgi
 uHGEU63aPCTogEoMZS37zHoXPG9M=
X-Gm-Gg: ASbGncutylK3nCX00yzvfsNJ1mQ45myUnt/mhzHq8t+8Gq7L4TxKeaIWitsTSOz5sRK
 O367/qxgH0jLHe/HTmHw93uuKQDhEnt+r8eRCVcEbqeBjIlhmLKnLK8scnTrV9jX4GWqRQ+IW8S
 +xDg8yYipTV0ulBUWWmU31ovGVQ8Y=
X-Google-Smtp-Source: AGHT+IGqHQH12TvcCqVq+sp2eFfkb9EhVfx2l+V4o6YoWca7+UnyXerhK5x+zq5ExbjI4QLtlq14D5tMNCuvWBn0ZEY=
X-Received: by 2002:a05:6e02:1548:b0:3d0:10a6:99be with SMTP id
 e9e14a558f8ab-3d17bf4afbamr65658425ab.12.1739467185761; Thu, 13 Feb 2025
 09:19:45 -0800 (PST)
MIME-Version: 1.0
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-1-993c65c39fd2@quicinc.com>
 <2bfaa1ce-0233-456d-ba2e-5b14533f3812@oss.qualcomm.com>
In-Reply-To: <2bfaa1ce-0233-456d-ba2e-5b14533f3812@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 13 Feb 2025 09:19:31 -0800
X-Gm-Features: AWEUYZnDTxYvSDBQbxqoooRBQlXE-HeDdCw08AnRZ1CWeRcQsd7VBQ4oaCG1vUE
Message-ID: <CAF6AEGv6q59dpktR-zR7+4nuz05HMrY7givk8-E4rwCyJ0zNjQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/msm/a6xx: Fix gpucc register block for A621
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>, 
 Rob Clark <robdclark@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2025 at 8:36=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 13.02.2025 5:10 PM, Akhil P Oommen wrote:
> > From: Jie Zhang <quic_jiezh@quicinc.com>
> >
> > Adreno 621 has a different memory map for GPUCC block. So update
> > a6xx_gpu_state code to dump the correct set of gpucc registers.
> >
> > Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
>
> So GPU_CC is outside what we consider GPU register region upstream..
>
> And I've heard voices (+Caleb) lately that we should get some clock regis=
ter
> dumping infrastructure..
>
> So while I'm not against this patch fixing a bug, perhaps we can get rid =
of
> dumping GPU_CC here in the near future

but we'd still want this to end up in the gpu devcoredump...

BR,
-R
