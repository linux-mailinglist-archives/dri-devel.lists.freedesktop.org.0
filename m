Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAC3AC6F8E
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 19:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2384410E004;
	Wed, 28 May 2025 17:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LwSquHgZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6472310E004
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 17:42:50 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SA6i99012585
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 17:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gkJ+K1owqVTCltsNXWWOly4cngF2CqphP5rA+v7Jo/A=; b=LwSquHgZC2/RHb/4
 f1cy9txM9mcVsCwWdlKRR3CVQVmYcuqpJORPRS6oAUI4QXntAruTqmzUW7vqCYna
 MQqPv5mUk6eFQh5d3o27J+rxHU/dYR5B/Hu5QY5ntkcfYKLMd0QCHqkX3MmNpjeo
 HygR5ajbfWZp3jot5dmydi+9TPKqPkc89HgeoigAhrMrMn4gR1bHpMj/R9OqWc3Z
 u8bODXgnDX3eWj6UfO3hlSPZ7W6VNR3LPlC991gdInW8ReJmMutagn5GNGUvxkxw
 lyXCQ+RdfEqSRFsB/JLK0iTWevxXZwdLGe7qQjjSaCdSwyQu6UaNVEtIzEi/9ZSf
 CEaQcA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691dk5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 17:42:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3113a29e1fdso14309a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 10:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748454168; x=1749058968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gkJ+K1owqVTCltsNXWWOly4cngF2CqphP5rA+v7Jo/A=;
 b=EWkIotO+cE9Sx28dy+3aRa6UZoCgWv/BAe1bJpqeKIfn7cICPepIwwj5bN+k5z/Jcb
 OMZsQZ1kg5sqeklqWmNrolrUBD/NOYCb7rtFfZY2IeudsocIBTdUZAcv3alms8eXzlcf
 CFdOqmMjefXkbNacPZ1uVrL9dcfBQ1N1TJenoio8XPdlI2mNUS3kISP7AECOIiDlHEXu
 Orzoo2A6+GDrKwmbOKWyaTBtKkOdtXjL647kT4+0eIM270QE5VZbQXTSlODRKOToB5hr
 w1bPGF6nlnKhnQOdrmVDELIbm3ZzppegcGrGT+pQyUqqZz7GvDgPg8Fp1fUXoQBfB8q0
 4gsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3FVd4FFjeTpxd7Ss9RQR+IC7ujl6wt442g84H2gwKDRa32CssSsYrB9U5lUgdRb+5Nal5MPFOR18=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMdbReRgADkPK4vg/Ghfz8PcfctiXTc+J4EL3soo0Mxaz4pWI+
 Q9Qi5bjWW7kmdu7wGv+3jVsET5jcV/T7TEMwg5z/Nqi4PjbpM+3yscmCXXbIlfcW2FGj60edqHE
 LXJ0aplcwIYM9fK0GwfFy/KMKalpKWm5vaWkzzUESEhXVXcD4PHbJ1rc4Zos/rM9GdTySQIFijf
 wMHLnsVE6pwmh5vMY0A88dIzULHmhvsqNHMEniR4zMDQRyIA==
X-Gm-Gg: ASbGncvf+DUQLVig6RgoA2B9B/Z5ZhSSt90B6gn/UcwyhPVQU7fiS2bjiAGg/b5JKjF
 Z5jko7lycAXEdnBIi6oT05S+FPMT0RH9yLkm/6hgudltJOg7+SeosN9q+q3bqlS4nklzEoJC5bO
 3XQkuKc3ron5xUO9JEU+COMgx3
X-Received: by 2002:a17:90b:1b0f:b0:30c:52c5:3dc4 with SMTP id
 98e67ed59e1d1-31111c49d25mr29158166a91.24.1748454167779; 
 Wed, 28 May 2025 10:42:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElJOznSIDBxQNtBqnZZvLZ0mXq7SapcvIwfl9dqbmTLqAGbsjluuJN1LIxWmG/4IMkLD9QesITMfYmRatftoQ=
X-Received: by 2002:a17:90b:1b0f:b0:30c:52c5:3dc4 with SMTP id
 98e67ed59e1d1-31111c49d25mr29158130a91.24.1748454167347; Wed, 28 May 2025
 10:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
 <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
 <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
 <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
 <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
 <152f5150-30b0-400c-9816-13e4710a4156@oss.qualcomm.com>
 <kbmqr7gjkd72hgorbhbwb7ttvmecfbb6pg72st7zwt5ogxju6p@itycxk6vriy5>
 <CAF6AEGsTtEA=So1CDhvg8H5+Z-RJ9OnhgSzDoa+zkWSPO3cvnA@mail.gmail.com>
In-Reply-To: <CAF6AEGsTtEA=So1CDhvg8H5+Z-RJ9OnhgSzDoa+zkWSPO3cvnA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 28 May 2025 20:42:36 +0300
X-Gm-Features: AX0GCFvWYL_b4RjTkVuHpDMO4jnqnz8wYBbed_Z--BZyI6lmIjmBVVwjVONW_Uc
Message-ID: <CAO9ioeWk1-dUQYDS1oQNc-QaRu5MG_C=JRx6RPiFE-OQjB7g3g@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Rob Clark <robdclark@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 jens.glathe@oldschoolsolutions.biz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=68374b18 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=yeHvZfB8xrJCexBfAjMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: vDV6D5jVv-Iyouz94-FzM65TaobLdAIb
X-Proofpoint-ORIG-GUID: vDV6D5jVv-Iyouz94-FzM65TaobLdAIb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE1MyBTYWx0ZWRfX7wHBXnPaFbKI
 aCtypkjlI14VJ196CMBJAfqe2/0flXUNLoTJItAVUy7JLr5KOuPHAXIpraD++VNMjCt5jYNKNnz
 HkSHBtbB58p0/Aq17nqGExhIJnvAaDBv45v10wOTNpUABe5wR6Ld8Cf0N4UhYVIAWjxKmkfqvYn
 QMaIK8P1bRtlamYo5qsXyXQNA2wYtiM1x0PiiV0ApH+rHAmFC9/vlVBKVo+Oj96xhGbO4U2Nf4v
 grd+7UF5kzVZ2nrG0TMgb2GBwx++73vSMSvDRWlFZtuEZG86r/wMrolV132DtVX2pXWSmRxfOPy
 +HqfaQl0R2BAvAdLbwKwS5djT6qzUUaWc3BI1x+r2WRtVVhaDQIrFsooHeLOFqB7l6tt4nODdV9
 CeuWyhofSj4Y1h3aK6Wv6AqxKbzOE0JXEFvr5YrljfcYMSDtjXxqU3oeVlHazcLlF0T1oHgN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=963 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280153
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

On Wed, 28 May 2025 at 19:50, Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, May 27, 2025 at 11:18=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, May 27, 2025 at 12:55:06PM +0200, Konrad Dybcio wrote:
> > > On 5/26/25 5:28 PM, Rob Clark wrote:
> > > > On Mon, May 26, 2025 at 1:36=E2=80=AFAM Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >>
> > > >> On Sun, May 25, 2025 at 09:43:36PM +0200, Aleksandrs Vinarskis wro=
te:
> > > >>> On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
> > > >>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >>>>
> > >
> > > [...]
> > >
> > > >> Yes, please. Don't set okay status for the GPU until it gets enabl=
ed.
> > > >
> > > > Drive-by: Shouldn't the dtb describe the hw and not the state of th=
e
> > > > linux kernel's support for the hw?  Ie. if bad things happen if we
> > > > describe hw which is missing driver support, shouldn't we fix that =
in
> > > > the driver.
> > > >
> > > > (In the case of the GPU there is the slight wrinkle that we don't h=
ave
> > > > a gpu-id yet so there is no compatible in the dtb yet.)
> > >
> > > My two cents are that it's okay to enable it, at least in this case..
> >
> > That would most likely make display unavailable as DPU driver uses GPU
> > as one of the components.
>
> Hmm, perhaps we should allow the gpu to probe, but just fail to create
> priv->gpu, similarly to how we handle missing firmware?

Ack from my side. I'd also like to remind you about my split-GPU-from
display series.

>
> BR,
> -R



--=20
With best wishes
Dmitry
