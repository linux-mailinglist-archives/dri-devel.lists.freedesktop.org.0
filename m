Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CABBC0E083
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EF610E49B;
	Mon, 27 Oct 2025 13:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oZGbVqtd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB8910E49A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:29:46 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RBK7YO2547940
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VV74qFJFxgTw/EeIwCONHKOh
 1+oiVvn9rVjApUsNyoA=; b=oZGbVqtdCtjLIsgOy8MmyvH+myvMqL/Ou0HfCbxZ
 z4zhPDUqsto6nrU3BGjpphoTxrCI18x0pnvm36fBy1YS4ikSb0ow/gKB5xZVxjLn
 dj8i1Nd1GwZUHESoTfzqFtZumXtALQNddY8ZR9QRAlrTPNl4EztPfJV+iqv+GNVk
 exvhoMz3laqurEH0MIsIEtgKOoZZ0DuDMbzd+FSEen7gBWNsU/lUolio1pxZPCaC
 9Q29kZpqoIVYp9ZBjcqXdbpSPRLj1UfQhqORAM+MBejOusZ97n6CrJWqihT74x2h
 RWd5xuazULbzz3I3J8690qWzQz5HaX3NeuBNOD+/lRI5rg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2gb42-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:29:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ecfa212e61so31491241cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 06:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761571785; x=1762176585;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VV74qFJFxgTw/EeIwCONHKOh1+oiVvn9rVjApUsNyoA=;
 b=Y8vXyYFZHsDxvf1yGVzNu47uVJFmpV3JHnOUMIoWtfFE7P82gpnnlsmd2KhGYJzhUM
 bqc66Sk0ESmgRSC/gvJAheB1l8GMfEEK+p6vACk8cVtH/ClVmWI7V2Az3Ym1Mxvm+eua
 2UtD/s+Z8Oll5a9gc0QDxDDEPjPbenNqk+3On/BWoN+Yo3b0L+T6Gady3RFn/dyeOxdS
 FqnaD3HnxeCHs/SHTdakAYstrXEhd4UE69xGo4+0JQ0uyy0TCHSBsn7/KAqsunUmN3LI
 zG6u41IiDb9iMcly69m0eHyUrYr7C2Dm5kMFFwvGewqxYZXSQHKjOblM9DJHKjS5Pgji
 GBYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0iiH+zC9Ow9yYM3k30Px4mali62lOgWYLzZumvFnTXoUJ9RBg94ke0f9ZAWlU3/v6BeAiUxGn3/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpoAH4+0tO2JTTf4P2e3WThOaI4/UO9U+TIHNTZu6a/h7EFE2n
 7IanJtph+8eTFYm+K3CdNQIx0Rhh3es2xeFtg3spdWYMWOjYhTZ0TxglEszCEWbB7iHalDgd/4w
 NCEy2P5gSbZDuwkJp/n2xa0FKfZ3QvJxeRkODiu/v4Ge47+zdqjMk/oKLm9bB2Flrh6QxhFA=
X-Gm-Gg: ASbGnculmK16NHSw5LmLHfdinV7q3vZ/9Rumv5xj2hfHabNsqalh+ISJHXoRrJ9s7oS
 k0TF6/w7+Q9+y0T+SNgWRZnXU+3qQZQSuAGUOnMn0Pp5UXdjzyBe/2Yz4fqjmdWvAQbZ3GSF/H1
 YvmqInKF5lwRFbDCh+ZTtu0eh5331vdel6V0xrQ4p8gqYZIP+Mdtp5+5eWVWZMEjSW3YoGgyL69
 O3Jav5Wd2Yh7zeC1t0B/+wHKVv4fIyWs5umAdC6ivvjZL9fF3YeRLHJyo3SeF1kf0i0hqXGRPEz
 rPVeRoHGL7kSdrgzybrjSGA8EhrCrpaGUybQqQOw41Kz9fMvFt8rK7msWdPAicEFLPDwIUptoyW
 x0GmqTnhwVUk9OuxLHDWLj63iykMEyG7KRnb3udNkHngUa8/HOsNfOy7i6nBlNbnj3C/1Y9JZ7W
 1QoKeriP3YMVKU
X-Received: by 2002:a05:622a:1190:b0:4ec:ef49:1b19 with SMTP id
 d75a77b69052e-4ecef492b41mr65596071cf.5.1761571784917; 
 Mon, 27 Oct 2025 06:29:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2ciuf1XZlemNcLVcB4yTtYI2v5x4NM+7pH7d4hnFEsjbYGGggzRsDo1URSo4Ky4GlyXwgvw==
X-Received: by 2002:a05:622a:1190:b0:4ec:ef49:1b19 with SMTP id
 d75a77b69052e-4ecef492b41mr65594691cf.5.1761571782964; 
 Mon, 27 Oct 2025 06:29:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f74ba6sm2304297e87.90.2025.10.27.06.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 06:29:42 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:29:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: yuanjiey <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <ehgdx7av3jewowkvtsqrbnsphgxm5hryl6n5otnapi4xneldze@gcwvpssisv2x>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
 <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
 <0291d0f2-483f-48d8-8c75-f1bbcd1ab18f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0291d0f2-483f-48d8-8c75-f1bbcd1ab18f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9bbSUzuoaITaiNzm1awUl498zfs3XfzS
X-Proofpoint-GUID: 9bbSUzuoaITaiNzm1awUl498zfs3XfzS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNSBTYWx0ZWRfX5iboMzPO1j53
 cbd37+tOHi1r87Vlqr9cErxP+q1xOklne+BACt/Y1lxQnQmH5LjJAh5GtlnpTuTMYuX1QsytOUV
 dHwc8sLQ4gY9pogz58ZaXHNNXHQVoFQ9ekXj+o83evX0FSUy/o9bCU4tGdn5PMtJoVk6lvdOBIF
 1BurUdhdc4WY+eH4ms0W9g6WplMxgrIOTqQ0k3zlKQb24e26G5yKF5p3QcWphqI9O8NY/YjDj9p
 eUIkdsyhYw5e8FH37WJi0RGO9ccIUDaQnJkeqUAn33W4LfV8fh2UC1T69+D8tXZOffgCvRJkFa7
 4yjlZDP+grqaoT+6HgtBVJJAM71hkzFVwghDPjxljFdybaCSQTk+8OM9TJC1+yQBu6DxG1adY6m
 hsoczP3fDxz77y7kRKiSVOtV/CerSQ==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=68ff73c9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=r5vzRnyTyaal3BpozBMA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270125
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

On Mon, Oct 27, 2025 at 02:20:26PM +0100, Konrad Dybcio wrote:
> On 10/27/25 2:14 PM, Dmitry Baryshkov wrote:
> > On Fri, Oct 24, 2025 at 11:27:53AM +0800, yuanjiey wrote:
> >> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
> >>> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> >>>> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
> >>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>>
> >>>>> Add DSI PHY support for the Kaanapali platform.
> >>>>>
> >>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>> ---
> >>>
> >>> [...]
> >>>
> >>>>> +	.io_start = { 0x9ac1000, 0xae97000 },
> >>>>
> >>>> These two addresses are very strange. Would you care to explain? Other
> >>>> than that there is no difference from SM8750 entry.
> >>>
> >>> They're correct.
> >>> Although they correspond to DSI_0 and DSI_2..
> >>>
> >>> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
> >>> new features. Please provide some more context and how that impacts
> >>> the hw description.
> >>
> >> Thanks for your reminder.
> >>
> >> Correct here:
> >> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
> >>
> >> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
> >> just some register address change.
> > 
> > Addition of DSI2 is a meaningful change, which needs to be handled both
> > in the core and in the DSI / DSI PHY drivers.
> 
> DSI2 was introduced in 8750 already, but it was done without any
> fanfare..
> 
> I see a diagram that shows an XBAR with inputs from DSI0 and DSI2,
> and an output to DSI0_PHY (same thing on kaanapali - meaning this
> patch is potentially wrong and should ref DSI1_PHY instead?)

Most likely.

-- 
With best wishes
Dmitry
