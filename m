Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DF6AC1226
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 19:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB7B10E929;
	Thu, 22 May 2025 17:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V1PJlNUc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B37610E742;
 Thu, 22 May 2025 17:33:19 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3da73df6b6bso25698665ab.3; 
 Thu, 22 May 2025 10:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747935198; x=1748539998; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yZCuz5KOY1Rb1fNXfa6wWyj8KY6lp+00rvWft2KvMXY=;
 b=V1PJlNUcitkvyUWSd21jsg4i8Oke22fdkxBtpAt9DW6U5DlBvfBhrpEU1trBbtpY6R
 CatepA/Olb3KRysmDPb49+xJxr22MMBvNYXdeRWRE2qARJYJnPF3zGhsnqCkBhixVlrw
 9HcrEtEIxyQacN8/1shRx+s7SVWy+5RNZuvRzdt1qOZykhyBpqdEZRQAm5w/48frk38r
 LTIZf1Y08RrcSY5T2mb/w1E4kZjgHcJjXnGeuIbAu4Md1le+vD4tQv5AcUd+kBBT7w72
 zfwxbhdE8HjdM05nJKEpZksKV0qFcFcCEpTocugnpM1GAtnWuAFgvCnbsD/ftnU/4OXX
 ZvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747935198; x=1748539998;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yZCuz5KOY1Rb1fNXfa6wWyj8KY6lp+00rvWft2KvMXY=;
 b=mF/ko+gqTBY9Pv50UJZ6z1qNWXaIra8JA2XezoDP4z/F4JRW9yO64JI/2nw8QF8kYo
 9XJ/pRqtG3MaW0MifIFt2yDVqMMVC/1uKCBIAwMveeXomJZShmRAFPaN5d10PG/gB2VH
 fcgi1M4eFbGdignTP74uzckygDkM6mtYUafOO86JW4ZQuzrUiqK2WOd78Fo2LdD6vDYg
 xiw+S+JKiJzkiHNQKQhvp8YI6V/SEiTWiQi5nl+xb0kzhKToSDe8vwjYIa/mSEftg7hK
 onD5ofa/SqwEUKdiWmfvSMx6o14FgNoATteYmJmIaBvVyKZl0jE9N3c/3qG61RESIqu5
 YUxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW098/6xMo4ftwiNEY6hYT5vFJWOkBv6yp/nOJRXOk5R+//8EJ1GcnVGDIY+JjahtprY4YgmMbZSVft@lists.freedesktop.org,
 AJvYcCX0sPzhe7X64IVgQiILHkPbgjO4HEiPrjCprGqlJuSx3dnKnxHtCVi1G0dsQCHZUrlJRcgizqZnusA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBQ4zWgIweibk8bhQU6Qlajmbqv/JuSIy9B3M98y3LCfiwze5T
 +t3RPx9dr0RhBLD3qamPBq+8JDiDs7rTIjMawaEAr18zzld24RtIpyleJS1IjyBLEUnyMasvlIo
 iBl5QvAas4SPFNY+cbbZm4O/8NAT9rtQ=
X-Gm-Gg: ASbGncthWatsmbX/Xt5gwo7ivTwWfGOic2pz8KE3ojOywVQyZrbz028mEr+BIrjEMFS
 4w0F5WOCairtdIM4PK+5wfoCLInzksHVn3LjYG+Tm/kLmU2Ho30FIlyeky8pQyM6PXpeyOVkiFE
 Vwitu4NAchpXASaFchQV2z+d8zD+TZpXK2qM3VGmuwe1+ibvS4dBBDgrmNP2xHjJc=
X-Google-Smtp-Source: AGHT+IGLp6jF0fhMnnPkzroRSH4KvzmG+rg6/iwrv7HqLvxi39A0Z4DM4iu66szWb0Bixn5K8nL7y4V/mVjNTnq5TMk=
X-Received: by 2002:a05:6e02:349c:b0:3da:7176:81bf with SMTP id
 e9e14a558f8ab-3db8434a2afmr267633515ab.21.1747935197989; Thu, 22 May 2025
 10:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
 <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
 <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
 <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
 <98a4ad20-c141-4280-801e-015dafd1fb39@oss.qualcomm.com>
 <a26213ec-808f-4edf-bb0d-ab469ee0a884@linaro.org>
 <281ab1b6-498e-4b29-9e15-19b5aae25342@oss.qualcomm.com>
 <63105bce-6b8e-4b99-bca1-3741f27ea25a@linaro.org>
 <892fc1eb-efd3-4fb6-9110-2df3349960a6@oss.qualcomm.com>
 <b989522d-bd41-4d76-91a9-3cf680214003@linaro.org>
 <f5734944-1ed2-4acc-a015-0c638c331bbe@quicinc.com>
 <d73c6151-91bb-4c96-ad2a-972ad392624b@oss.qualcomm.com>
 <1903ee8a-f819-4a4d-baee-90f35e0da290@quicinc.com>
 <584a9e49-5106-4053-9f42-e1e176618eea@oss.qualcomm.com>
In-Reply-To: <584a9e49-5106-4053-9f42-e1e176618eea@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 22 May 2025 10:33:04 -0700
X-Gm-Features: AX0GCFu7DKioivEGx1jU548joNSO1hiW2h8Q7AIKCB6hRmaGrivAyhudL8VYukI
Message-ID: <CAF6AEGs0sUfdER+GuygnupituPpVygms-Sc4hw1nYUFwCXC_=Q@mail.gmail.com>
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, neil.armstrong@linaro.org, 
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
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

On Thu, May 22, 2025 at 9:03=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/11/25 11:51 AM, Akhil P Oommen wrote:
> > On 5/1/2025 9:23 PM, Konrad Dybcio wrote:
> >> On 5/1/25 11:29 AM, Akhil P Oommen wrote:
> >>> On 4/30/2025 10:26 PM, neil.armstrong@linaro.org wrote:
> >>>> On 30/04/2025 18:39, Konrad Dybcio wrote:
> >>>>> On 4/30/25 6:19 PM, neil.armstrong@linaro.org wrote:
> >>>>>> On 30/04/2025 17:36, Konrad Dybcio wrote:
> >>>>>>> On 4/30/25 4:49 PM, neil.armstrong@linaro.org wrote:
> >>>>>>>> On 30/04/2025 15:09, Konrad Dybcio wrote:
> >>>>>>>>> On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
> >>>>>>>>>> On 30/04/2025 14:35, Konrad Dybcio wrote:
> >>>>>>>>>>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
> >>
> >> [...]
> >>
> >>>> This behaves exactly as I said, so please fix it.
> >>
> >> Eh, I was so sure I tested things correctly..
> >>
> >>>
> >>> Konrad,
> >>>
> >>> iirc, we discussed this in one of the earlier revision. There is a
> >>> circular dependency between the driver change for SKU support and the=
 dt
> >>> change that adds supported_hw bitmask in opp-table. Only scenario it
> >>> works is when you add these to the initial patches series of a new GP=
U.
> >>>
> >>> It will be very useful if we can break this circular dependency.
> >>
> >> Right. Let's start with getting that in order
> >
> > Another complication with the socinfo is that the value is unique for a
> > chipset, not for a GPU. So, it won't work if we keep this data in GPU
> > list in the driver.
> >
> > Downstream solved this problem by keeping the PCODE/FCODE mappings in
> > the devicetree.
>
> Hmm.. that actually does not sound very bad.. it would allow for e.g.
> new bins to appear without having to replace the kernel.. great for
> backwards/forwards compat
>
> Rob, WDYT?

Not against having it in dt if the dt maintainers can be convinced..

Alternatively, there is the optional machine string in adreno_info.
We've used that in a few other places where speedbin mappings are
different for multiple SoCs using the same gpu.

BR,
-R
