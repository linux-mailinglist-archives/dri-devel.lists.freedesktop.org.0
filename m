Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C20DAA53DC
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 20:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE1210E7F8;
	Wed, 30 Apr 2025 18:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DaJZQGSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D91910E0A1;
 Wed, 30 Apr 2025 18:41:06 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3d9189e9a06so891375ab.2; 
 Wed, 30 Apr 2025 11:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746038465; x=1746643265; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1yQROOQ/8z6J39sRh6FPaOmwmRuzULCDCO82suAr8rs=;
 b=DaJZQGSy8OPhZhtG/Mi9qp9HRGWB0ipCeTBYxZJX2SEihytyEwbvNqrZ3GXJn5wgcQ
 D+W9V/3e2WcuE+DhUtoPGYKG59fNQAyyV4f6R5ifOiH5Ur28DI7jWTGWWenIr150p26y
 WwsrVRxFPXZ7ymZdSApMQ2aSNYb2BK5uGGc9+u56loy75rBSfbkUAmOEoYWBbHCSct2L
 w4ojHdWtm1YInyE8MECHqOCU1ZnB3TGYo4VWID4Kx6gvOsM6PLCnxyPN6C0a1RBDFO25
 GyMUXR3l0D5yQz7dU1yF/bUKyJc+r/p+0nw1FlAX5RL2TjaO9OcReDch7PEv3+xFsODs
 s35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746038465; x=1746643265;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1yQROOQ/8z6J39sRh6FPaOmwmRuzULCDCO82suAr8rs=;
 b=CTgTv3W0L9uxFiDXsdJvDLyiZUzdEXvChBtSTEkngDpcOxb7ncaOLPfyrPd8l6c+qE
 pbjq8YCaFFAEUr5pouwt/JSZ/0gAwBhPCRrtSKumWitg0vjT0LqutdrqEQAbc7jL1Fva
 xGLjCTI8dY0CNk9yvBNPMfK4uwy3KRakFSxEKi/nVih/c6SMr8/rgmD1DP669HZ9/YQ5
 nk3FtBnjdx3ujBcuZfWZEJPV5SZB+Ujyh3HMg5Uqco98A0U7PezmUEtUrdgD+gpU/3R0
 02Uh/zOpJki5wSXNLTbU3WlL93ZlXjATHIRVUIYKtJZVdxT85H7wCa4hu9Wbq43oUnm4
 0q3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwlmzbjj46aaZwAQq7PUp9+ydTIGC0qSxf7W0CNOThVi/qzER9bIqLuQ34Hxrq1JcTZ6ooCozCkKk4@lists.freedesktop.org,
 AJvYcCXdpkS7wJL69LIRMqzXcEX1LB399UQcm30zytwLBPaq3aHIt2VJH1NKri3nMs/3QnXZAq26/c1Tdt4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+dBwg/U0/hAxGKa06U8cbVjjPX02o6XNLYpnYoLArFfESmFK5
 0dB/ehQVT07T4sXuyigMH8IWGTRzdDD0tMFi9KJw8BeBSm21NRL8F71hneoqTabLydCU35LXs43
 N2w0A2xtYgtUxIoksl7QoI0FAg9s=
X-Gm-Gg: ASbGncvGxUQr7ot72uG4WubMgdZchL903JZYIjoiLuRU6SLq0zXe4Jo0lKgkxh/2nbP
 zdKszlQbI21ab3t0vC2ODywFflR8JcE32YDDxesW96k7qEt0fniEQeFjhk3nTKS3R5a7WNVMCLS
 U7bw96xFKRrCYMD9vLxK/rTSKIq5Yd1y1VYXeDAWDCOINJ+AmH8zgX31XN
X-Google-Smtp-Source: AGHT+IFTdYx2S7PP1ynBVe1/hJjTgkjcofHeE73M1127jD1qw/zLNvWGom/8dxEIbGmOMMDuyfAlou5W4HGP5Ex5D8w=
X-Received: by 2002:a05:6e02:1a89:b0:3d8:1fe7:4439 with SMTP id
 e9e14a558f8ab-3d967ffec05mr40542955ab.17.1746038465168; Wed, 30 Apr 2025
 11:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-5-aea654ecc1d3@quicinc.com>
 <e22daaae-57fc-4523-b594-87d202d255f3@oss.qualcomm.com>
 <aa8ebd50-683b-4043-9494-5675a2d9a01e@quicinc.com>
 <41df5398-79f6-484a-8ad3-f3488eb1b71c@oss.qualcomm.com>
 <hpfqpvkex3dtj6ieosce4phukodnoidh55vxpujyekoehhotqn@l434nae5gzdi>
 <f1fcf9fb-3be2-4097-a372-a76bfba6043e@oss.qualcomm.com>
In-Reply-To: <f1fcf9fb-3be2-4097-a372-a76bfba6043e@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 30 Apr 2025 11:40:53 -0700
X-Gm-Features: ATxdqUFWSHnqCPWBHWWul9jKnD6RyuizSS6isEVI5YuIqPMbYwvAOXoUXQvDslk
Message-ID: <CAF6AEGvGEshZbSmmLZMXGiCjRdDJLa7EKN-gviw4oxcapMKN+Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jie Zhang <quic_jiezh@quicinc.com>, Rob Clark <robdclark@chromium.org>
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

On Wed, Apr 30, 2025 at 3:39=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/29/25 2:17 PM, Dmitry Baryshkov wrote:
> > On Mon, Apr 28, 2025 at 11:19:32PM +0200, Konrad Dybcio wrote:
> >> On 4/28/25 12:44 PM, Akhil P Oommen wrote:
> >>> On 4/14/2025 4:31 PM, Konrad Dybcio wrote:
> >>>> On 2/27/25 9:07 PM, Akhil P Oommen wrote:
> >>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>
> >>>>> Add gpu and gmu nodes for qcs8300 chipset.
> >>>>>
> >>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>>>> ---
> >>>>
> >>>> [...]
> >>>>
> >>>>> +         gmu: gmu@3d6a000 {
> >>>>> +                 compatible =3D "qcom,adreno-gmu-623.0", "qcom,adr=
eno-gmu";
> >>>>> +                 reg =3D <0x0 0x03d6a000 0x0 0x34000>,
> >>>>
> >>>> size =3D 0x26000 so that it doesn't leak into GPU_CC
> >>>
> >>> We dump GPUCC regs into snapshot!
> >>
> >> Right, that's bad.. the dt heuristics are such that each region
> >> is mapped by a single device that it belongs to, with some rare
> >> exceptions..
> >
> > It has been like this for most (all?) GMU / GPUCC generations.
>
> Eeeeh fine, let's keep it here and fix it the next time (tm)

Maybe it would be reasonable to add a comment about this _somewhere_?
(Bindings doc?)  I feel like this confusion has come up before.  Maybe
it is a bit "ugly" but since gmu is directly banging on gpucc, it
doesn't seem completely inappropriate.

BR,
-R
