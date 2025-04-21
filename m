Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE46DA94EAD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 11:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D657210E34E;
	Mon, 21 Apr 2025 09:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CEqpqg8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB4B10E24E;
 Mon, 21 Apr 2025 09:33:28 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-22c3407a87aso56841495ad.3; 
 Mon, 21 Apr 2025 02:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745228007; x=1745832807; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bCswh5FBBRyF2VqJQOKVkSI9+RFrKt7H073L5B8LSVE=;
 b=CEqpqg8Pqa1qOVKu6K9hBoN8YQ4emeWB4lJi4IKQ212AYAJ3vpwmz/apZCekVtafJZ
 D0Us9nP/a46CBK11Ikj8o4/T1AmMRoePzzFd2N12vPojDDOkiIKJzkJP3ZUDMJWCinFK
 oY0bM2IqqeZSMiXL5CtJMso61X0eczd8RZl4h8wn6mvlSU8OWg4Az//acvHcOdh/gSd9
 WOUL0RsieLJGdi/QXu45esXbSRWaeACtj3bxnq4joYcomfDERPf1SLhvRKgfx1GJM124
 PJxln01ivA5GoKYKzfk3vEy2p4B2VHMRNjCBul8YbnR4D1PkHot3yGEMvOvwiyK9bNbU
 Mq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745228007; x=1745832807;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bCswh5FBBRyF2VqJQOKVkSI9+RFrKt7H073L5B8LSVE=;
 b=GTvoE7LVXiC2xsU9uq4/5n5IQ17dV/OQwxsckbyYzj/gC13BklXfaoPnwuYwjUiYMZ
 WyHU1gDKJL2TlZ2UpJogzkCptypKyDZVt/h7+sz/3Bt9bhu6I1gcnX4zX8tJS4ftISHe
 svdDVH5BDFjbmcui7stLtLKKX9EClzqvUusMoQKlHPy9Zvco6hdlHjZYr24roQs7OgF2
 8mmovUmk1Co2k9IemEHgZOI76ZvMxe92ZACqWoYgpFbfikPiQC/BaS4ypBPBWGj+d0CQ
 3/jczFFSMhR3yCnMzIriuiPJHmM5bQjl9ErMT9mAoLjsZRAZKKC5Dn+JaSKuGxpHiNDM
 9a6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUamYkglQh95XSqPhNboUwp7J/tAvg1BDUR/RbJcN4HvNxm7rcGwTBxCoIb6lQXKlMTPU8YEX4dW0TM@lists.freedesktop.org,
 AJvYcCUstse1Yxdlc1y/sVxJSpHOh43eOHw8j54y0WpGFklhl+AF0FHPmjygC/+Ve1aODYGeS4KhL+VZdFc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuMjgsVR32894Pwej8py5Cl+hMg609itfYjpAERl+rJlievNr9
 fc+nO7Rrfv2W+Y4DMIFd/SicNI2WuKJJlkORhqoNcQW9MvYj04qYOyyBr925uYbuUW5dcfF9Trr
 7XKfSj/ud7CUTwWZQnAQaqW7REwo=
X-Gm-Gg: ASbGnctVqNxZ/+FPhzYEjjvSUt+k/1zcH9wo6g6kiZ032BLKhZWLhyMn0P3GcSxmuuP
 Ha8CAGco6oclnpg57B1MecXfuNDFrswONFqPsJ78Pb+yBd0bMMfhq/Wd2Rt7kBFyrhMf0OeFqZ9
 XqZg2O59dMGJVck6jwmbtXQUfpHTtmzcFxB9bQfVO/sT7Bo4phpnaLKg==
X-Google-Smtp-Source: AGHT+IHrv/CfywC3Z3w3v+tLaCUyWoTMwBYk/eQj5k5woE2zOueaVZuMH+tFBRRVB2z8ZWvLPsMmutvF4JK+qBcJAgo=
X-Received: by 2002:a17:90b:17c9:b0:308:5273:4dfd with SMTP id
 98e67ed59e1d1-3087bbc19c7mr12876797a91.26.1745228007374; Mon, 21 Apr 2025
 02:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250421-a5xx-schema-v1-0-7d96b889322a@mainlining.org>
 <20250421-a5xx-schema-v1-2-7d96b889322a@mainlining.org>
 <nxv2k2ofiao47w7gmqcgfgn57heucs6yp2og3lkzlavjarado7@p5u4663yw3oz>
 <4688d4d4ecee7078e535bb940b6055b9@mainlining.org>
In-Reply-To: <4688d4d4ecee7078e535bb940b6055b9@mainlining.org>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Mon, 21 Apr 2025 12:33:15 +0300
X-Gm-Features: ATxdqUGr9nPPKaBUMkNhLDRXQwqcoCYwQ0iMeD2IUAxFlF5xQe-JH9lP3m5xflQ
Message-ID: <CALT56yOyowxkeu5a7MixkujYh8UmBb8wy-L2y3m5Pp-zEZ6p8Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8953: sort adreno clocks
To: barnabas.czeman@mainlining.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, 21 Apr 2025 at 12:22, <barnabas.czeman@mainlining.org> wrote:
>
> On 2025-04-21 10:16, Dmitry Baryshkov wrote:
> > On Mon, Apr 21, 2025 at 05:09:22AM +0200, Barnab=C3=A1s Cz=C3=A9m=C3=A1=
n wrote:
> >> Sort adreno clocks in alphabetical order.
> >
> > Why? The order of the clocks here matches the order in which they
> > should
> > be brought up.
> Simple misunderstanding from previous attempts of documenting the
> alwayson clock.
> By the way i have find out a508/a509/a512 clock bring up order is
> different from downstream.
> Upstream: iface, rbmmtimer, mem, mem_iface, rbcpr, core
> Downstream: core, iface, rbmmtimer, mem, alt_mem_iface, rbcpr
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-074=
00-sdm660.0/arch/arm/boot/dts/qcom/sdm630-gpu.dtsi#L85
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-074=
00-sdm660.0/arch/arm/boot/dts/qcom/sdm660-gpu.dtsi#L87
> Should I fix it?

Good question. I will check the msm-4.4 sources later.


--=20
With best wishes
Dmitry
