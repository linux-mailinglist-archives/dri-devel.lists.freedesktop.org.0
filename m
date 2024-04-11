Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 165D18A2110
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 23:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2206D10F3C1;
	Thu, 11 Apr 2024 21:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iCtq4tpl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2AA10F3C1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 21:46:45 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6164d7a02d2so2326277b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 14:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712872005; x=1713476805; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+Bv9F7Hojq/Cfu3ER7cqazK0eiROWzKe2VDuRs1xH1A=;
 b=iCtq4tplxkXEMtoimU2t5EMFtU1jHcW1tFxOhg9/xetAX4MO5zu/FDfOk6soYJvjp7
 sNN55OQOtwijElczEPq449wf+5xaD6uz94HVJXnpzRFto2EcGxjJ0MTBD1Wtsx+WNa/C
 jqWy8xEzXGZLdNIbc4IOQzIx+9i0Ibf0QQquQzeyDS/xEqzqPvCdhU8eWMkluMr6c5/p
 /2cmSwoyF4aa7v5/XOM5qdGi8pivpJGeDhc6UwKyil21iVCNkuhXS6zM4N/d9WSmnhxq
 V33u2ufIcEusV3GjL1gErAb6i3ZVH5bGc+7ki/ZrhmI3feHOtRYxZya9l4RUi+qyr0F+
 ayrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712872005; x=1713476805;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Bv9F7Hojq/Cfu3ER7cqazK0eiROWzKe2VDuRs1xH1A=;
 b=nARnMoVA7yzLQVfDQSjTK1XY+UjE7vxyFa7aUlbJgEQmTONpDrDqd/LBPZ5Y3Xksd6
 hNuu4ZtR1mf8SmTrcUzYucAT5rwIykGIaC8CyHa195ijUEWlaz71y8VftLQAd8HM46sf
 ksZIvOmCx+k794kmc5KdMPjRsAcEsCbf4XQ+S+KCd5sXf/iGPWCzElHBDVAkSbzYh8DH
 tBWtq1dyQpQjRAMPujbxjpgP+17MuNuLAb2F5BrlUF65jLKbeYzC/e9jDbLtnk64C/a/
 RELllUTaOigpqkw/j4x/8LyHdG/2fyI+ykJaOy1yII0ku8wyq6ZEuda+KzPWiq6JFSZ9
 JVXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmh7HSP7d3ZvI/Pmbz2LCsLTdsPxpZ4yWlu62uzuDkUrYrEyG1pg8UbrNSi6jopDdQb0Kqvc7a2NxnN0cqT1jyP2jUbrlCX+jSfhaT8ATp
X-Gm-Message-State: AOJu0Yzq+CV+QleLnPDgXlirNzQWUc7+Dsul2WemfJh6cubJ7dl3kpdb
 NgcA8+ONjD7mnutA3o5t1pj0lxpruZLFrhgtNm+hOM8UEazDW9cgGMybCWpBLNPuoOHpxmYx8rN
 jttdO5hHDBpDh3OoGyFn9LatSVz55cflpwP9Q/PdQEf+QpllY
X-Google-Smtp-Source: AGHT+IH3nG+5ooddR3TkR9saDOqZj8XET0NZKBgRR8e9Tshi5Wd/hYdbU8WpoZKw3lbPWRjF2Tg1FDbxOHJcQIzTzvU=
X-Received: by 2002:a25:b55:0:b0:dd1:7a16:7b4 with SMTP id
 82-20020a250b55000000b00dd17a1607b4mr793294ybl.31.1712872004952; 
 Thu, 11 Apr 2024 14:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-4-ce2b864251b1@linaro.org>
 <scvwfj44z3wpp7phvesfwjuv5awtlkwby2vvrpaq4i5fircrt3@i3ebya4iymf3>
 <730d6b9e-d6b4-41fd-bef3-b1fa6e914a35@linaro.org>
 <33qyr6cfruczllvavvwtbkyuqxmtao4bya4j32zhjx6ni27c6d@rxjehsw54l32>
 <321aa524-ab64-458a-b4c0-70294cc5467d@linaro.org>
In-Reply-To: <321aa524-ab64-458a-b4c0-70294cc5467d@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 12 Apr 2024 00:46:34 +0300
Message-ID: <CAA8EJprvss4RTXQWMQpcE6afpc0Q22zzeGxJBxh4s04E=8rGBA@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/adreno: Implement SMEM-based speed bin
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
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

On Fri, 12 Apr 2024 at 00:35, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 4/10/24 21:26, Dmitry Baryshkov wrote:
> > On Wed, Apr 10, 2024 at 01:42:33PM +0200, Konrad Dybcio wrote:
> >>
> >>
> >> On 4/6/24 05:23, Dmitry Baryshkov wrote:
> >>> On Fri, Apr 05, 2024 at 10:41:32AM +0200, Konrad Dybcio wrote:
> >>>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
> >>>> abstracted through SMEM, instead of being directly available in a fuse.
> >>>>
> >>>> Add support for SMEM-based speed binning, which includes getting
> >>>> "feature code" and "product code" from said source and parsing them
> >>>> to form something that lets us match OPPs against.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>> ---
> >>
> >> [...]
> >>
> >>>
> >>>> +  }
> >>>> +
> >>>> +  ret = qcom_smem_get_product_code(&pcode);
> >>>> +  if (ret) {
> >>>> +          dev_err(dev, "Couldn't get product code from SMEM!\n");
> >>>> +          return ret;
> >>>> +  }
> >>>> +
> >>>> +  /* Don't consider fcode for external feature codes */
> >>>> +  if (fcode <= SOCINFO_FC_EXT_RESERVE)
> >>>> +          fcode = SOCINFO_FC_UNKNOWN;
> >>>> +
> >>>> +  *speedbin = FIELD_PREP(ADRENO_SKU_ID_PCODE, pcode) |
> >>>> +              FIELD_PREP(ADRENO_SKU_ID_FCODE, fcode);
> >>>
> >>> What about just asking the qcom_smem for the 'gpu_bin' and hiding gory
> >>> details there? It almost feels that handling raw PCODE / FCODE here is
> >>> too low-level and a subject to change depending on the socinfo format.
> >>
> >> No, the FCODE & PCODE can be interpreted differently across consumers.
> >
> > That's why I wrote about asking for 'gpu_bin'.
>
> I'd rather keep the magic GPU LUTs inside the adreno driver, especially
> since not all Snapdragons feature Adreno, but all Adrenos are on
> Snapdragons (modulo a2xx but I refuse to make design decisions treating
> these equally to e.g. a6xx)

LUTs - yes. I wanted to push (FC << a) | (PC << b) and all the RESERVE
/ UNKNOWN magic there.

>
> >
> >>
> >>>
> >>>> +
> >>>> +  return ret;
> >>>>    }
> >>>>    int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >>>> @@ -1098,9 +1129,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >>>>                            devm_pm_opp_set_clkname(dev, "core");
> >>>>            }
> >>>> -  if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
> >>>> +  if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
> >>>>                    speedbin = 0xffff;
> >>>> -  adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
> >>>
> >>> the &= 0xffff should probably go to the adreno_read_speedbin / nvmem
> >>> case. WDYT?
> >>
> >> Ok, I can keep it, though realistically if this ever does anything
> >> useful, it likely means the dt is wrong
> >
> > Yes, but if DT is wrong, we should probably fail in a sensible way. I
> > just wanted to point out that previously we had this &0xffff, while your
> > patch silently removes it.
>
> Right, but I don't believe it actually matters.. If that AND ever did
> anything, this was a silent failure with garbage data passed in anyway.
>
> If you really insist, I can remove it separately.

I'd say, up to Rob or up to your consideration.


-- 
With best wishes
Dmitry
