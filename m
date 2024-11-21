Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9729D539D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 20:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4F110E351;
	Thu, 21 Nov 2024 19:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ekYF7WHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8782610E351;
 Thu, 21 Nov 2024 19:53:16 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-83ab21c269eso48765439f.2; 
 Thu, 21 Nov 2024 11:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732218796; x=1732823596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=diAZCrMsMB3HqFx9gMbdYj2qxdjUwPEtwF8yqOBUtUA=;
 b=ekYF7WHxJLFxmXSmy+A/83oBHRRJQ9+U2KHbbXoXifvDSrApYsYARembUH/BSshTl0
 wVpwwDG80QJL66vRtF8wQNrB3lt+m0+xm6Z95grwmZFIjcSlWqYPxC5AhYWOeIK40BdA
 6GM/Dxf62Vjsjm7IeKa3Dky0CDjnvQAp0Yc41Xi1okjXxa9pffRc8FG5XeoOPQSp2pBP
 12BLXotQVqKsDwOQb5QMVWYhmUOAtILBIdTv+BDnkIioon+I/pYH5waLj1r1Fv8BNctl
 obnjmrPzyziWoUD/v4OtqTfmJlkYEAydVsbM65rmjPbXGe7XPjNmzeazxr2+AyapYQBT
 qngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732218796; x=1732823596;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=diAZCrMsMB3HqFx9gMbdYj2qxdjUwPEtwF8yqOBUtUA=;
 b=fd/qrBa63CY87IC9WDWyWr00UFbbC2SnPTJGnV/ov3FbvmNUy7z8c1i2BITwkcgj9v
 jLBC+OTPwopvt4HhNKEWfINmARiYB0aqTSj0lcFNCavW8kzmUQNEZGXv6L9ddf1xvbe/
 IymbewMgJEcSoQSPICGibTTKJNynYmWHBIPPYReu4AhRnKINf+Imlofq3AV97B97wveD
 6Gf2eD/vEua7jH24H7934EfuDLo0QMEaJ0rKRHzEsaO7DbzkHhp3jWPmldkUn5ge3rhs
 Y3ULMeJ6mXvSCYT3vYcXoNKBCZyPuWhnu6J5ImKSX1pb459GO9uc7OBIFa+s4CKVa/DD
 F3Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyXjtIWgQ80qOnH8Osioce/PMyF6HAS4WZ3DHkpMcuW763/8TDLQT/4vx+V1wj3psReFqCsWvO1g4=@lists.freedesktop.org,
 AJvYcCXth5dl3PH0Uv1lfZpBryDZZYe4T8Qs5p7aZH5dA7mDsDGEPjDAzHo8CLL+z6bEZh9vBCZ6tw3lYiWS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFDflQjGzQhuZFLt4+llK6FIaWrlc9ScCM5njyjn4MJudSbsWQ
 OfUIkKjRpwJM176HUrsoNzxGGnwkVmm5H+KWn9pi19pk1hb2/aeePig2wLwjrilSUw47xWlkSqj
 o5lD30qbxBeKDYTzbQteIYm33lWY=
X-Gm-Gg: ASbGncuqL97jqW7rYXQkRWamQWpkvhaNlkFZPGPTxC/40gsdG+EScCwe6b7KvCIhPnG
 azaLGzt/8VUZZKpSfqPrxodz3Gh9eBpoev59DRNcOgxQCVCjICR5Leny7U275sQ==
X-Google-Smtp-Source: AGHT+IGVvKdxeJ2KfZ5TpOhV5e8CaKf2OdRVRdRq27Mf98UYeu0Bs53rOSroYiruS8NzSiyjkP/fPk3EC6WgTw+tzqg=
X-Received: by 2002:a05:6602:3f83:b0:83d:ff89:218c with SMTP id
 ca18e2360f4ac-83ecdc8f12dmr23501839f.7.1732218795759; Thu, 21 Nov 2024
 11:53:15 -0800 (PST)
MIME-Version: 1.0
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-4-4deb87be2498@linaro.org>
 <CAF6AEGtBVDERQjcoXriKK3d2VZy2QMUxZZJbFdSgbpvue=0QNA@mail.gmail.com>
In-Reply-To: <CAF6AEGtBVDERQjcoXriKK3d2VZy2QMUxZZJbFdSgbpvue=0QNA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 21 Nov 2024 11:53:03 -0800
Message-ID: <CAF6AEGtrs8175V1+onoH4p6u4benT_tzz-Gg3JkNA+WE9Ltcsw@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] drm/msm: adreno: add GMU_BW_VOTE feature flag
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org
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

On Thu, Nov 21, 2024 at 11:50=E2=80=AFAM Rob Clark <robdclark@gmail.com> wr=
ote:
>
> On Tue, Nov 19, 2024 at 9:56=E2=80=AFAM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
> >
> > The Adreno GMU Management Unit (GNU) can also scale the DDR Bandwidth
>
> nit, s/GNU/GMU/

And I guess you meant "GPU Management Unit" (presumably this isn't yet
another recursive acronym

Same comment in the next commit

>
> > along the Frequency and Power Domain level, but by default we leave the
> > OPP core vote for the interconnect ddr path.
> >
> > While scaling via the interconnect path was sufficient, newer GPUs
> > like the A750 requires specific vote paremeters and bandwidth to
> > achieve full functionality.
> >
> > While the feature will require some data in a6xx_info, it's safer
> > to only enable tested platforms with this flag first.
> >
> > Add a new feature enabling DDR Bandwidth vote via GMU.
> >
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index 4702d4cfca3b58fb3cbb25cb6805f1c19be2ebcb..394b96eb6c83354ae008b15=
b562bedb96cd391dd 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -58,6 +58,7 @@ enum adreno_family {
> >  #define ADRENO_FEAT_HAS_HW_APRIV               BIT(0)
> >  #define ADRENO_FEAT_HAS_CACHED_COHERENT                BIT(1)
> >  #define ADRENO_FEAT_PREEMPTION                 BIT(2)
> > +#define ADRENO_FEAT_GMU_BW_VOTE                        BIT(3)
> >
> >  /* Helper for formating the chip_id in the way that userspace tools li=
ke
> >   * crashdec expect.
> >
> > --
> > 2.34.1
> >
