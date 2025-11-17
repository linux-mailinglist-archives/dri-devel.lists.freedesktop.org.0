Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E952C64EDA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 16:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA9D10E388;
	Mon, 17 Nov 2025 15:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aylnC28c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034A110E3D8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 15:44:18 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-43470d98f77so18887095ab.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763394257; x=1763999057; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GakGLx3BRYbnpcXKQqj2rxUbKKiFxYQ8pO9cOSBXY70=;
 b=aylnC28cv2IZa4wC6pv6RnOKQ9gp9WxSnfOPdQLePytDmw4woc+IQzdGmXIyQfReHH
 Sz4xYhbbpRoHiIfor4IM+4maC5ufHUTfgvKDDUfzlLzz5lP0URezvDFZ2HYEnsU1oDeq
 EEi7wcOgk+84rfTxVrGyHqMm1hL+2L91Vpv4NDGUCLr6qKKo3D5fc3KAMCwoqB3y0/1K
 ErVsoRy6cS2n/Ome/HSKk0r7agr3qsWytALHgMph/KQTu6Y1y7jStBK11VY97g2vpb++
 uadtaxMCLVfL9Ri8ztkG8KS9cydvsmrVKLQSPLNRSJdrtwxkxy2e/hQ9DHabcTTzyrvg
 FcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763394257; x=1763999057;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GakGLx3BRYbnpcXKQqj2rxUbKKiFxYQ8pO9cOSBXY70=;
 b=rNNjS0+oI3R32huUQCTjmn2P4xG3rZMSjwKqAGFy5BFAEKXZp5rK0fg3M8+SkTrVul
 DmtEAeLQafNzwxD2nafsR3QLdoZDocgYum50EmT9GXR0jHOrVDessjdDNHHYAFRg6KTF
 ztgo2cB4iWD49D5W1kKf5bPr6NijoAtx8dkJsCXJPH/07qHK6IkV5jQ6jy3eNtLJLMvi
 5WgAnPLOkOqYdP2XhuZx04NRGr7DPNWv37vSDtMh6nUYUALm0uGUyCpITtWDZmOG/M8M
 ahfLCLvgDbgHSVyZ+OtmQXXkl5icxVJImr21Xn1+sToq+RRH45R6OhFmelNlCWuCU5nH
 u9yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWvyyxgReWaebCyKlJNXrTefnr8+NDT1v0R9rXmO/viKFWeXujBlvco8rk93m2LJLCx+hcUSRgCAg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycXZpFDILLsyoVn349AoeHItsRgOJ0y+rSsMR68Gb67WSfqCsb
 xc4eBAqgrKyIBZDbSx9aiFjo/ZMBEsV05xrCPmjZ9uLb7LHZyRi+xxSt9Hktxj/FFed6W2tHrI1
 aBOHOgQZ1odBPCAlZA+gQZFoU4qrsHdE=
X-Gm-Gg: ASbGnctMzC8tbGAeloozJ6yK+Regt13CteVDVEoBhr5DsDz9BdBK0jlVxZ6NabZ15pF
 kn0xR6rOj98uesj0xBZPNpfkry9HcCdZGtDra/FOLzwupcFYuv0yegpSDpszuwrFP/cMoJB3DGS
 lCQbkZrp8lNo3Nr09dEXhtlJA1756lccfeqNyd+4h9uxjs23IFCXRxXaiOnZlkPjwNwnrBEMYmL
 Fs7m3a22jpoeoiw6DbiC0Ss9eDjWWbigAm83d02OXOXFV0yMuVUjW1PC/rXjleE5DLYGE0=
X-Google-Smtp-Source: AGHT+IFbdBdmra1r1MTAuYm3h2YFina8VK1yyiL7rlrlzpAiB2tUYzJNKmJeOBR2QgET/eNSGZvdZJ+H1CdvND+9bDs=
X-Received: by 2002:a05:6e02:1808:b0:434:74a6:48f1 with SMTP id
 e9e14a558f8ab-4348c94f0b1mr136903685ab.27.1763394257015; Mon, 17 Nov 2025
 07:44:17 -0800 (PST)
MIME-Version: 1.0
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-3-92300c7ec8ff@oss.qualcomm.com>
 <ff634b09-c28c-47d0-a57f-6203755cedb6@oss.qualcomm.com>
In-Reply-To: <ff634b09-c28c-47d0-a57f-6203755cedb6@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 17 Nov 2025 07:44:05 -0800
X-Gm-Features: AWmQ_bmyUIznEYyCXfUeRMdsertmn-wYkkRaXSqTVS6sR8e15JC5caO5D32ua0k
Message-ID: <CAF6AEGv9OVHBDF+XVNRr+ZtWijs+MDNUgw9zg0HbebuCQbHcZg@mail.gmail.com>
Subject: Re: [PATCH v3 03/20] drm/msm/a6xx: Skip dumping SCRATCH registers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Connor Abbott <cwabbott0@gmail.com>,
 linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 Rob Clark <rob.clark@oss.qualcomm.com>
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

On Mon, Nov 17, 2025 at 6:00=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/14/25 12:29 AM, Akhil P Oommen wrote:
> > Crashdec doesn't require SCRATCH registers anymore for a6xx and newer
> > architectures. So skip dumping them during recovery.
> >
> > Suggested-by: Rob Clark <rob.clark@oss.qualcomm.com>
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
>
> Looks like this changed in:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/95104707f189b2e1b06c855=
b563c1203b33da354

Crashdec finding estimated hang location based on CP registers dates
back prior to importing that code into mesa ~5yrs ago, fwiw.. and was
improved over the years to better handle IB prefetch since then.
Fwiw.

It does mean for gen8 we are going to need a CPU based fallback to
crashdumper to make smmu fault devcoredumps useful (since now
crashdumper is needed to capture CP regs), but we need that anyways.

BR,
-R

> and needs_seqno is never true now?
>
> Konrad
