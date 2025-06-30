Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFBBAEDF7C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 15:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3398310E226;
	Mon, 30 Jun 2025 13:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/x7GnYP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CE510E226
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 13:46:21 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DFRB007227
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 13:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=+sYnLgd8EuSPJsu+25KS1pMeFZ2cMLM0v+K0r09oi+A=; b=d/
 x7GnYPjDfc5+P3s5A4GfdW6ZT7EzDKVz4SYgw21z9BPf71LWmPsRJC1BX1vXebAH
 7fJoLOs2hTPImwXK8p0PwzUvPShJTt6yDQasSoTPdNJeMfdk7o+xhsC5uMwcs4mz
 wUhSYYcWfDXf5QN3iN7OwyvkrIvdEV4AmJsQpjdZ79pCqCJNMOqfixPZ4pybcn0k
 JFkpUWjZm4L6AcNOaMmmjPVsMvzYMgMwelxCKqSOGCDghqNDkQS+dw+LAy46u1lX
 PhWqFei0v7GigR4J5/9BWhXi1lfQGAmyQ5gIb9a+5TP2DwD+60bhavkmiS9GAXt3
 HgYSX25pl1EHBQsQbGUQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5j9c7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 13:46:20 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-40b5955b907so1140777b6e.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 06:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751291179; x=1751895979;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+sYnLgd8EuSPJsu+25KS1pMeFZ2cMLM0v+K0r09oi+A=;
 b=WvyVoNvr+Ljks9t6QCSa06LRAhsMcqZzPFCPZTZr2Hl7u+1Tsrl/BflWBXvFqm2/hT
 HCPJp7RlcpJCOS9CpoT3AkFUhgw41ab53EiFPNnAwptaC2QzeHz08ZqR3yMAs8tLnPyQ
 gc9vXTt6KDjCyCGcM/A7xfAUM3SHueWD9Itk0UKqDp1TrPBHT2KXu8BXEC1DbtNd/+RT
 2d0wudCj215kqBA93PRDxIfj7eIaWxknlu1t3FYMGPGMP/NmqQ/k0QnuE5RvfxmDbQ5H
 GP6Ugmi6qddk2IEsvGrXhoaIkKwdHhQBcpWPoqlMxdsCgR31r66xupM1+2MezKpU/DMf
 7urg==
X-Gm-Message-State: AOJu0YxdvRmhhYWaGkZXbuAmthOh0CJdQ6/FEkYCMGR/twy8BaeH1NUf
 0AYskkPwnnIQyrAgOfnuOSmZaI2Gt8UvYHRRf30iXiVB1camBnFfW3fzF+EfcfjvS6G40IElejE
 ufpPtGleysyMWWaAnx23sXz5DtUe3+scFqAnfOPDoixgGfGQVoKVucO7/1RtBDjMLVxjj9IHgV5
 jRTjd0TNLHD+93wa4Xq0Y5FJ4FR8stbKazs/DSNORfr/WRLQ==
X-Gm-Gg: ASbGncvGW6stR/Isw9uUSGKYyG/KDTLIEDqLDveFSdpREGHtkfz/bPhq74xZHXCWtXS
 JjS8z4LlYtseBzPfZ6LEqvUEXWp7vlkiR7L+gtxaFtVwXPRW0yoYzJOco1ySfOu7nSruw/H72CA
 CNwm2QMNfyE8B3DgffR/CijFkND9h2Q+MTiYs=
X-Received: by 2002:a05:6808:1887:b0:404:e0b3:12f with SMTP id
 5614622812f47-40b33d8ff56mr10677501b6e.11.1751291179439; 
 Mon, 30 Jun 2025 06:46:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC/ZONBovjaxT4as2yCPYzH6bLcayS9bEQ9eiCn71Z5acFjEn88qadQUxBV/FIurbHxcQ5liO5UIZuHKwhFlA=
X-Received: by 2002:a05:6808:1887:b0:404:e0b3:12f with SMTP id
 5614622812f47-40b33d8ff56mr10677478b6e.11.1751291179085; Mon, 30 Jun 2025
 06:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
 <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
In-Reply-To: <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 06:46:08 -0700
X-Gm-Features: Ac12FXz1ANfzhNdQG9PbXKs-9CTqnjt4T4STXGnoeX_oH1xYF5iTCEgVXLupVM0
Message-ID: <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6862952c cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=0RMLDebWjREeJsuOEsEA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: 8BPotE1krWpKJmGi_MfrARfpVi2hwKoO
X-Proofpoint-GUID: 8BPotE1krWpKJmGi_MfrARfpVi2hwKoO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDExMyBTYWx0ZWRfXz2Cykv5GrplJ
 P6TeTq4sJWzcbx3daZvtUmuULSWuf0LexSEDS7mYycPj6K3td18OEcPb9RlOh/iDhtelDK/YEzv
 g0heMmMDo4hyERbguC5AwI/S9M25yiYw/RtUzUeg3BCIY6trd6jZ2ZtgBtHllhNSerBpone7cYf
 XolY0YEuXg7HLgEf/a0HnuGgAKYno/OHjcpwRgRmMMN7jog6+VeLV3Ze/on5Inw479TfUOwRTLY
 UK01iwPpL13KolFELsKFLmLpQbIINncTZMzha7/LoqEdpxPWLgvoiPRFAOwufQED0Pl7qH2SlMt
 vRsA9kvKbINuzRFWayF/cNz0J4bvHKwHlyYDYZ8ykY3KbJtOzFbJtwN45HijOEgbMcC+aDb9ngt
 uXiC6ZHJUxK6t7/xWTywX63mjZlRRJHQugLw95QQkkwCaQEkt6i8DIl3SZcU1ASz49K3yBdR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=801 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300113
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 30, 2025 at 3:34=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
>
>
> On 29-Jun-25 15:58, Rob Clark wrote:
> > These runners are no more.  So remove the jobs.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> Do we have anyone using cheza at all anymore then?

Probably not

BR,
-R
