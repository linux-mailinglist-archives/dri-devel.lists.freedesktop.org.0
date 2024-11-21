Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AC19D52B5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 19:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6693A10EA23;
	Thu, 21 Nov 2024 18:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FrdOXStx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B4D10EA1C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 18:44:47 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2fc96f9c41fso13796351fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 10:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732214685; x=1732819485; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Lf6pEyNqxMlUop78/qMKAZ8N3+EDKOTAPwM9hjCyqUs=;
 b=FrdOXStxveM7MkKfv/OrKpHCvMhlbhjQkHsyib9K8z8kTAMeYKMwV1bhh5wvhpU2X2
 Z64lhY1M0lqoa+Fp6k6jYw3QGQf+wNnEyHEqekSDD3wfS7RW8kbvj48B/zJnJoR4wG3X
 ysiq6BolUtrGOD1xBYQWs6HDIRzg6ODRxGlSuBRUP4FYXsohGZvoDBnuGiqJAx05H6kI
 L5SUAaVTnerfn5gvXg0IIksURyURIqS2HbEX24rDpn0PzmZobrHTuitHMHN4LK6baHYh
 2YCReavU+IbjVzM5BnuxOjIYCGuB3xdZFHlMyif7oY0aTed74Kt5lIKMcuV1meEDFvFh
 /ePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732214685; x=1732819485;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lf6pEyNqxMlUop78/qMKAZ8N3+EDKOTAPwM9hjCyqUs=;
 b=CDEqe8zPjaXf+8gxDFyaThNeHmQnpEUYLndtl3He3ywHRKa+rMDHWBNE6jlgrdNDgl
 gN/5wU3Gl9hEqddvrAub5JbFXqwZOx5p4w0qm0SbMl+jMJi+woK0qWW4HL1Mw35OzfXS
 qorwoJXZMBQWlCJVz9Jazrb2XaPyk2s7BIaJbzgZ2CDPR/ZaWl7XrKadpq5ZrAtnumCZ
 64Y4TTw7q0VbrAfdePiCU8ZDMQ9Ceem+uDp+hOIZDSk9VT3Q8FCtyOemGvZoAwazVEOL
 uZk/exFQP4uEawOecEmjuV7WtOoM0M+UwENkySXCXYeG2zGVfWzXYa670Mok6ww1mUTI
 eUug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMiAkvCPxgNjC5wt1glPaEqSYgBXvFYfTYwyzaw8C21RTUil2sinX7AdImmET3XE6MWsyJhnCCswE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyFSy0GPXlXD82UK2gsPSQqOb0cNS53lXGdROKqdDr9HU3PMuv
 GFSV0LioVRJ62OIo0xySLKayIdzJCFIlAMqBXT5HJvQnIBGo59bBO0QGBC80FC4=
X-Gm-Gg: ASbGncvNHl4WwmxbonYo8H6KHqld2codjriRRpf2CkKK4XuW+fyuPlAVqKBzVjGQI8j
 kC1w6tsftg4VkvshsEqc00C9x3PK0XLBYowBisUTyyUSoEAOCSkBMHlXIC9l7Qn+SV8bjt6Emk6
 XOWE0CdCAHoFvfJsShEnWGKW+TcbmCgE9ZKxXRoCVDZupiKAncwYEUAg6D9U4++oHdQ1ajFTqK9
 lBe/IvnKpr1ntcAuu7yA8Xac2pQ/5FM8Frl1szFhiHgdKDKQBnXmX1LmwBOx/wwdcFy9NfN7mjg
 kWHdcV051GBlaYWfxGQeUATdASJ8Gg==
X-Google-Smtp-Source: AGHT+IHi1NhWVZuelCT/g+ME6q6BNS23Y6fXekmq883H2WMs3ZLySQ3u7RX7hB18doxDPGP3Av5AMw==
X-Received: by 2002:a05:651c:1612:b0:2fb:4da8:1e6a with SMTP id
 38308e7fff4ca-2ff9697ce2amr15005151fa.7.1732214685212; 
 Thu, 21 Nov 2024 10:44:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffa4d40257sm177041fa.46.2024.11.21.10.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 10:44:43 -0800 (PST)
Date: Thu, 21 Nov 2024 20:44:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 04/11] drm/msm: adreno: add GMU_BW_VOTE feature flag
Message-ID: <4sxmrx3raiz2n3wz75n7gc6eekuh7nnox3xbau6dbyqyo3mzj2@jmml4c6lesgv>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-4-4deb87be2498@linaro.org>
 <iw75ptavkqw3vybfov2f7koz5nh5lfzxcou3wey7rdsqt2gj5n@7luy2kqrzkj5>
 <8218a053-6b69-4e1f-adb0-4c11930412ed@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8218a053-6b69-4e1f-adb0-4c11930412ed@linaro.org>
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

On Wed, Nov 20, 2024 at 01:37:48PM +0100, Neil Armstrong wrote:
> On 20/11/2024 12:19, Dmitry Baryshkov wrote:
> > On Tue, Nov 19, 2024 at 06:56:39PM +0100, Neil Armstrong wrote:
> > > The Adreno GMU Management Unit (GNU) can also scale the DDR Bandwidth
> > > along the Frequency and Power Domain level, but by default we leave the
> > > OPP core vote for the interconnect ddr path.
> > > 
> > > While scaling via the interconnect path was sufficient, newer GPUs
> > > like the A750 requires specific vote paremeters and bandwidth to
> > > achieve full functionality.
> > > 
> > > While the feature will require some data in a6xx_info, it's safer
> > > to only enable tested platforms with this flag first.
> > > 
> > > Add a new feature enabling DDR Bandwidth vote via GMU.
> > 
> > Squash into the implementation patch.
> 
> Which one ? the flag is use in the next 3 patches

First one which uses it

> 
> > 
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > index 4702d4cfca3b58fb3cbb25cb6805f1c19be2ebcb..394b96eb6c83354ae008b15b562bedb96cd391dd 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > @@ -58,6 +58,7 @@ enum adreno_family {
> > >   #define ADRENO_FEAT_HAS_HW_APRIV		BIT(0)
> > >   #define ADRENO_FEAT_HAS_CACHED_COHERENT		BIT(1)
> > >   #define ADRENO_FEAT_PREEMPTION			BIT(2)
> > > +#define ADRENO_FEAT_GMU_BW_VOTE			BIT(3)
> > >   /* Helper for formating the chip_id in the way that userspace tools like
> > >    * crashdec expect.
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
