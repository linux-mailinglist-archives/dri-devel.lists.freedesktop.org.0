Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965FE9D556A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 23:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BA110E168;
	Thu, 21 Nov 2024 22:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PcQo+XA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A94310E40F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 22:26:37 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53dd18c4494so965060e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 14:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732227995; x=1732832795; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=67XPB05AyK/btByIcMqDcORxZdqhCZravm4pxfm3Pu0=;
 b=PcQo+XA7wlq3GbgnbjdeEYuequTPhP75e3DgkzP6lMPCeUGyPp1eRXQp60/N6pK22U
 CJE7lKymTiy56TrnK0KmavRZrW83DqTtqvbhwH4JB32deW8VNNc4Wfastwh1iPzIn4Ma
 BOrEbDJqJLDunm/c6oOwk30tO9a/ibs4TGV+ZJ8/zjkJM+PmPpVgSCxfCjd3peb2H6si
 S+pFqch5xcpfJCY1IPkTVTghxdTTWRTtOCkLk2Bifrcp5USsH5L4RA+nGqkaJJWmBNCh
 +M7teoTWk0DbBQGU2q/E8CPU8Caz+wI+o2vPTgDe+y+39FO2wGsNQXUuUYmIXb1N9AlY
 1ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732227995; x=1732832795;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=67XPB05AyK/btByIcMqDcORxZdqhCZravm4pxfm3Pu0=;
 b=gUEX1aBosGqaKZ8NqYWYuxOrA3d/JFXephl5J09WhFOoCPBTWrtFmcLPuv6Od/j1vU
 nWw2J3VuzX7bgl4UnI2Y1Q90R5oozDG0Rx7IGBlG/Sb5RB6NL08uJVjznrOpgt/JL7Cr
 JK+HZbdeXavL1yg05mQnvFC0ba2J75KR04yJLj+h5stb/3GiPNCK/yHIj47PcXfHYiKJ
 v2Gtt2pDJVWW5v4ASgU0FPNbMbKgONKkfKgWEDOIjHs57F+c8G2YX9s5yP5/09Fi7FHL
 OpryKr2PRbKH0JCXkxUhYQC1B+qENFLVDbae/caV5llYBjg5IELKWiSB1lCtTcuy0bEs
 +L9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9yomelvOdJ6xM7EsyDk5bKGwp010GwAp6LvxMdnCy1Q1pW/XmCMFUWL4NQzBjKsUyaP2WKstBRLM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/E2OUn0TzEEA2KuApFvUItItduE3XkiJpJ49ldkVjDScLd2q8
 temVvkPOis/L7yUsl9mRmCumS4daf9YJ259RjsH7YnDc3lp7FAJ33fJY83u7gT0=
X-Gm-Gg: ASbGncsSJ93ohiKdR25D+ia2cXv6M40hMz/kKWmtm8aya+QFAH29a78jA4v+649kk/4
 JH2VpS1zjgB/1YjHGjZK3hyROIAQRXqACWKRAhYEDMdJWcbdaAjJCBqepGZb5nH5kBMwB8hoyQn
 MwsJMmKdJdY2qYlmrRbY3IDtrz/QZhVVQjdFaQ9MvNZGBJTTH8PJSVgI9ZxxKssG9Sc861lweSF
 bmsiKHeGxEh9tNfd5GHSUKNnwSJLQGOR/ekYA3Ncvs0oq12nXvxtW4KcDYikANHBgwo3/MBeSdL
 hEwBxzsm8CpavJ7NX2Gtw2WvALT/Dw==
X-Google-Smtp-Source: AGHT+IGyBizlR5e3z6q8Kh1rpMDNes/K8kFNxBRPrj+BG0t/rWUv5BsFgygFTTFBPiukIv0RjnFnNg==
X-Received: by 2002:a05:6512:3f0f:b0:53d:c2cd:79d7 with SMTP id
 2adb3069b0e04-53dd39b5b70mr266678e87.53.1732227995234; 
 Thu, 21 Nov 2024 14:26:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd244574esm99474e87.33.2024.11.21.14.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 14:26:33 -0800 (PST)
Date: Fri, 22 Nov 2024 00:26:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 03/11] drm/msm: adreno: move features bits in a
 separate variable
Message-ID: <ch7vrgkjnhabjdw53l3tjqv4p7oyfcfsgctlfb7gxpm5qiqs6k@5vkjha5jkfy6>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-3-4deb87be2498@linaro.org>
 <fkezpguictntg2wkouwqipnaaiauo6vu46n7a2xzvlorzvyeaw@bbcpj3bs5eko>
 <CAF6AEGs6zT_kaTXNohUaA7KWZxZTr4byaoMoLAceuyqA7S+2CQ@mail.gmail.com>
 <dtt6d427u5yep3i3b3zxxef7uh572aeu3vtatmjvpbqfpjbvjc@epkkr7oumncn>
 <CAF6AEGsr2WoOdytWzDU_TJJh4myPj3B943LMisxisnA45rLFKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsr2WoOdytWzDU_TJJh4myPj3B943LMisxisnA45rLFKA@mail.gmail.com>
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

On Thu, Nov 21, 2024 at 11:48:28AM -0800, Rob Clark wrote:
> On Thu, Nov 21, 2024 at 10:44 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, Nov 20, 2024 at 10:54:24AM -0800, Rob Clark wrote:
> > > On Wed, Nov 20, 2024 at 3:18 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On Tue, Nov 19, 2024 at 06:56:38PM +0100, Neil Armstrong wrote:
> > > > > Now the features defines have the right name, introduce a features
> > > > > bitfield and move the features defines in it, fixing all code checking
> > > > > for them.
> > > > >
> > > > > No functional changes intended.
> > > >
> > > > I think it might be better to squahs this patch into the previous one,
> > > > it would simplify checking that we use .quirks for ADRENO_QUIRK_foo and
> > > > .features for ADRENO_FEAT_bar.
> > > >
> > >
> > > IMHO better to keep this separated
> >
> > If they are separated, it is easy to overlook presense of a statement
> > checking .quirks against ADRENO_FEAT_bar.
> 
> Maybe just drop this patch.. we don't really have so many
> quirks+features so a single bitmask is fine and avoids this
> wrong-bitmask-problem in the first place.

SGTM too.

> 
> BR,
> -R
> 
> > >
> > > But we don't have _that_ many features/quirks so I don't find
> > > combining them all that problematic
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
