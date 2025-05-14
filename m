Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE77AB7720
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 22:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D76C10E73E;
	Wed, 14 May 2025 20:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fonrt5dx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8FF10E73E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:33:26 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKWukE020194
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dRKzmwRDtNONnFtD+GVYYT/F
 68o9yjtA9WFV64BwRvQ=; b=Fonrt5dxtERAHoX+tk4nVcXN0KbJukF0i8LppNj8
 BiiDSM2ha0u32DOZgPVwFc4q+5QUKgVxB7C+TqRcNHBeqyI/0MJ3ZC1SJ+VF32nm
 lIzXZa6eze32HAtcYmhuqfLo+z5RPR0w49fdVo035mksSwAxbSAVxmnF7F583VTA
 9G8tDkdTF5ueqE3Gonx25GL4ekwcqtRiTm83oUZzQdTvM6yGErODVlYfscips3Kz
 F2J/OwsqeWVGBba18/Ldn3v2aO6nSXAuiFFbSDUC8wTAtmEnjLpFESa33Ho+ANlJ
 K35mkOngTMGL3IHCyzr5IPbutTfBWDg7W5gbx5cWh3vRIA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnkyqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:33:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7caee990721so48867685a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 13:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747254805; x=1747859605;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dRKzmwRDtNONnFtD+GVYYT/F68o9yjtA9WFV64BwRvQ=;
 b=XXIyET9Q72FLcMr/oy4ki6Zv5j+eI9idEleFQBml5Mk+wKD+opb+75yHkxvT+1iBu2
 WbdcKGA4gW4yiBmldQV6mMBxEUpr9AXBFQigqN+VRuYtlZgXoE1If/f4OngMn3zVPuWA
 74qEv0TCROivsMYrsHwNOlvkIGP26Rw5YC4UUjdELrDBbJ1ukSsa3fXAaz5a3RYHOZqW
 NGWZTLMQVTZ4uN2jf55ClQvIz1ksIQpEmrnrMO817e3k9ZXUJKZlB6xlZKw5RcAoDkGp
 n4UKOXMc4RnmU/p75b2h+UtKcKq9R+b9vAEy/MSebGIMWONRSgGrnOqgIXmVTfUr+eO+
 s8Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsjQNmmsts6Z71lVgWxLBnQS+SNf3IsZNZ9lbqph+OHvp79v+lhbkkxcBzcolYCHVwKDXRChkIWJE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGtwBK4hh1Iy794lbwHBsvsoHMx+kX3g1QjAGcvvoLeTzLevov
 kq0y7zSkjMJso7ZKclASI/LogEqFWDMRtNVLfn2pO5FGEFHkVLWLNvMZdad0rUU8MTHPBa+rIq+
 l0VCBxGg+WiVVxXpSJIYwHJcSPsqPbWs32A+XVjDZ88pbToNLVYeG1vPzq7RUWyCk4J0=
X-Gm-Gg: ASbGnctgOHq9O3MxWxULKHAx/uei3KkoFtSJ4O8bG1c7ZVM8iBzqCxUzmHtbEYhWRYm
 840rYXyNdi1Jzvdf5kYd0a9XDbhZ6PEgooKyvhdCektSds4SMyWpjl4+OophCHyUVmz/SHlXwmF
 2brrA6oAGnacEhnK7Etk5WbsOgJU9HImd3oqm9Ks+m69thqr0UtDhSlxGZJ2DSCwN4/4rq6K//s
 6upzk4VjJjUUzMmZFVAMDb4Bw+A5P4xdbnAeOIRP4KIlAZpRDiBLMPvq40n146bGfpFutxzujQw
 mB4niB1VWA6725c0k0NKhUdhjySDHL1/v+LraZLKYMvvRH/hLpJS1WyeXYPYCEEnZ2NzipDCDU4
 =
X-Received: by 2002:a05:620a:17a1:b0:7c5:5d13:f186 with SMTP id
 af79cd13be357-7cd287f8e7cmr618136585a.10.1747254804689; 
 Wed, 14 May 2025 13:33:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsUrt5xuy6IhXhWS73X4G6t/mH1OxTdsbAV8OsEnGFxtr3ke2Igx0BWrmUw4ortNrnKDd8Gg==
X-Received: by 2002:a05:620a:17a1:b0:7c5:5d13:f186 with SMTP id
 af79cd13be357-7cd287f8e7cmr618132885a.10.1747254804305; 
 Wed, 14 May 2025 13:33:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64b6e08sm2379780e87.120.2025.05.14.13.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 13:33:23 -0700 (PDT)
Date: Wed, 14 May 2025 23:33:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFT v2 14/15] soc: qcom: ubwc: Add #defines for UBWC
 swizzle bits
Message-ID: <rxoefvyob7enrbtdpmsevw5wzatk4dwa5jomscqpxim5sjmymd@dblxslxy7q5v>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-14-09ecbc0a05ce@oss.qualcomm.com>
 <c3txdoumutgk4exshhyi53ef4xziu5bbe3ib67hw4gsvulh4yt@522qphwu3ocx>
 <c8517af1-5fb9-4350-814a-85ce26e5e334@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8517af1-5fb9-4350-814a-85ce26e5e334@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: P0_5PX2vK9DgMhd05eW2q7ynFahR38xB
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6824fe15 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=V6yTId3DeqrxdCHudOoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: P0_5PX2vK9DgMhd05eW2q7ynFahR38xB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE4OSBTYWx0ZWRfX2ZJ2t1zJnxZp
 qJGkDkiAyOtPcZ23Yqih1OEs1dwr9Ie/OxZwt0R0amM0talmaxa4Clxv+/GYiFmr0x3E1TPJdlM
 Wl7JK+lur5IlMhX20CMxYWqH7uuTtyu+8Fw4qYevTyUPrHwYQyrIvy7jSPxpvLNlRpaqH6bYH9o
 TSd5yZQUPfpKabSVUCDv47BlQnyq1pKyczfyY+Jz4aB7drcccSsOUNIyALpUUZoFDmVM1DWH6zt
 JECWfQFUr7m7OkMOZWGRbVsZU6MS5Fm4q+Q6MIjZ9zxDPJV7MpSDaODMs7xw4lIseSS51QTMluC
 KB0R61zNmNIydHrChG39BYxAv2sPuld/C/Wt9Sd02j7oU7W2g1shB+YQWH9Olc3YEiFT5dLFGms
 /QSB9OrSCGV9WJSNSUe4Mrt1nlVp0oDWuk6NM4DjXwvv7zWXbTojg2AyDbF8XGLCmsixNW/e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=803 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140189
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

On Wed, May 14, 2025 at 10:09:35PM +0200, Konrad Dybcio wrote:
> On 5/14/25 9:24 PM, Dmitry Baryshkov wrote:
> > On Wed, May 14, 2025 at 05:10:34PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Make the values a bit more meaningful.
> > 
> > Not sure if it's more meaningful or not. In the end, we all can read hex
> > masks.
> 
> 0x1d7efc35
> 
> magic constants are no bueno

Ack. Then please drop UBWC_SWIZZLE_ENABLE_ALL and list all 1-3.

> 
> Konrad

-- 
With best wishes
Dmitry
