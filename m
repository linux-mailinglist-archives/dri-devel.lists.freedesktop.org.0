Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C656AD213C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 16:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1C910E3E7;
	Mon,  9 Jun 2025 14:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="diua22Nr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8E210E3CB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 14:45:46 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599XhR7014675
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 14:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NBT6vmPj+KP/UP2fTnvuSaVe
 UdJIIkjYpa/Jy0VgFCY=; b=diua22Nrrjz2KtZChNi3CJHaoZfxHmKMpnF2/8ac
 6Rw6LhOiZVXiF/TSccUgnd+psfzrBGQbNoNcgoHQRClthbOfTZxU6uvHmZz8rSJ9
 S/37AYyD+P5ek5YVCw6K2UlOVIOS1UXWFYpnqFI4JKa+3Ntoiv9NS4wmW7g1N1kC
 wcQ1ZQFv7ShlfzRhhAL3ycdOJSZfYrkCcvLEOR6liAoNl2c8+DOtkOTs1+rJWTXb
 gNVyWXs2WRvYEekh+J9DDYAvsD1E7JGAo8kVJw81IdTdOuBR8P7xhmqXNM96hMID
 ufegKKs28t7faSitGANf6SQy9Fb8+vSM1Mpk6LonITL1Hw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475g75tmta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 14:45:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5d608e6f5so1124076185a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 07:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749480345; x=1750085145;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NBT6vmPj+KP/UP2fTnvuSaVeUdJIIkjYpa/Jy0VgFCY=;
 b=gzYVFFzeSb4yAcXpkufkKLoC2lyFRmVuUXFi8YP4XyqLqswMbZuAXBDEZ8crNPafvB
 qlRKhj+qlVv79o9GeIoirfgnW9YQinS/fAQPYsaLCT6hGmioJCw11mSqVg8YkYVSXfKb
 RFnSbIKxw/Wy2nY4eCiFsY+1Udvn9/c/AKOH2p+1ozWWc2NzJdOJ/QHUFzz4jjaHwWq/
 gupyks7NHoyw6zvCpcgF8gcxmy9H8N6sTH6M+Hyw6m4PnNt1AtidzRDdFC+zzm50LFKl
 f7wTnHEfNqHk/a3YS0VL0LlYPwDLBE1N6Ev59vs5JRNEhdAWE7sIcIXTrWBPqwBJqcx1
 ew3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/W3pffPEsJFe+7EpYQnZS1Z4XTwAK7CPNsQPanwbn2abaov6t8FjitK0ZOuSwwVO+4LJmEWLKOd8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykpiXEuYkiuwGhCEqG2CEQl0hGFvGwJxtAcdIB/hsyaEXUd184
 J0S/ihtY/kZz//Sxno7EipPyKCR7txAK1p2F1K+e6dUNAs+B6Wjt38BUzfv+OIej5m3qx9b5D3C
 i/upUYHNsLJD6k3ph60+h7a4b5sHyVJtyQ1QFvHrrciHVAkVa9K9/2S8bPq/d9CIFzkYVsX4=
X-Gm-Gg: ASbGncuujxYFWb0dPoiQFQ2ZJ9gtfxVs2cCbxZvDoyzL9TbUzFC7bv6ZrAtN8Yjh3aM
 leqEZvSB/baGrVNqeiAj5N2M/7N++7cfXQDaGvSjxJcX4g1oEmoMVylk9pXtPSNzeq4VnWFPVqi
 Xt5vVrKmgnqkhJm0Ojy6sl+T4phvYAH5qnaTjZWmBDba9Kzu4GDDI/5VzNtLn5lM882zCkpkQjt
 xCppTYYhWh1AxZuWZ/VS5dg82nzOZJfOue9ACHfGliXRt0ynna7B5zL0ZTabH0kTqvJmCbZYR1u
 OgXQzw7BjDRzRQqfn1D3at25zz6H1GPF85EzQVObsE/1BBC8HWvuEg7Rjbq11E+S7N/lZz4UK00
 =
X-Received: by 2002:a05:620a:1921:b0:7d0:98a1:7aba with SMTP id
 af79cd13be357-7d22987fa6emr1692497085a.17.1749480345294; 
 Mon, 09 Jun 2025 07:45:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGd4u+n8gacssqQ0c7Zyx/dCkKu8dSHgSYT8DFdFzuA7K5Hkq7N50B9znPiIOhz5RFhpAO/w==
X-Received: by 2002:a05:620a:1921:b0:7d0:98a1:7aba with SMTP id
 af79cd13be357-7d22987fa6emr1692494085a.17.1749480344848; 
 Mon, 09 Jun 2025 07:45:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553676d7796sm1188959e87.81.2025.06.09.07.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 07:45:44 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:45:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 37/38] drm/msm/dp: fix the intf_type of MST interfaces
Message-ID: <kbpq6edonoorgukf5mybnvz4sm7aiefqhogp7k5cmyhy454wii@bk3nw7ivssjx>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-37-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-37-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: YoDozxPrKohYItUHm1HzK0gBExmBPmmm
X-Proofpoint-ORIG-GUID: YoDozxPrKohYItUHm1HzK0gBExmBPmmm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwOCBTYWx0ZWRfX13d81D2xXYW9
 vun2FLol5aMRvQ8IBQXR5i4+i3U73vquQo+rdTrCMhaKp5iCMMruabVBDL+onCQX9NEku2xIJGe
 lbBb/MFhBi/uk/zbDcGEKMriYsaW9UEBfAJavPLy9Fd8/BdCod1jRDGpW4sDW1s+1LTKR13GwyK
 sJ9fuxFCUeeKEJjL/y1dTIgYuJ4Thc9vpkwyS8xxLxU5Zj2v7v8xh61DlWU2LzShLD5ujf7pDu8
 wrfRrMA1coGUh7sgA6s4xl2tZ9R4QgnTvX4b3Et4FsRXUsGij89eN16zPNz434cu/tBkkkRKe1z
 PV3kuurAmm1MYsKbY66yJ3vA4hPbLRTvAim/KyibxMUFAkm5VJOZ7SzWCAqCTHkoH6PFg/DHzNp
 jZWxAcnQDJKlOgHSs7V0QeIO/MYNLpD4xFxjWFGUV663N02JmyhtaZ+KvmYEWbHUciN10Us0
X-Authority-Analysis: v=2.4 cv=TeqWtQQh c=1 sm=1 tr=0 ts=6846f39a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=mIDvE2fUgOR8az-e3JcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 mlxlogscore=868 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090108
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

On Mon, Jun 09, 2025 at 08:21:56PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Interface type of MST interfaces is currently INTF_NONE.
> Fix this to INTF_DP.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Please fix through the whole catalog rather than just touching one
machine.

Also, wrong subject. This is not a DP patch. Please fix subjects for all
your patches.

-- 
With best wishes
Dmitry
