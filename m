Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B8DA6A0C7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 08:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587BA10E59F;
	Thu, 20 Mar 2025 07:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k0MLyUZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E5110E59F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 07:50:57 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6Z5l4017483
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 07:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Gu2816Jt4ReGPaLriIq4oPFm
 MPGW55e3kLoSVqwZcBs=; b=k0MLyUZJOv822aTPq2xgg2OwhZrRJxCw3+XAyPRr
 3Kt98IUrQ2FxbiTyCmhllWt/KtY33dRc1fwPQGdvswN3Crth3uQ7LQ6CJGYZspwi
 /Ha118fR6BJdL1h/uWzEMsO7PXQXdhvYEc7SFr0D9pcB18q27BKwPzCdBwcZp2Xf
 Yl/wwfb0Jh9RvD+EqIMkqOuY/l/RxypOpLT0VsvwVLjYUwRJE0Wf1S4jI7ddkp/t
 DCsfTqmQQ7bVbDoF3m4dstKw5GhqRIZmC169U5w8fxmPba6G1SWZvgP0Gq5VCo7x
 vJXlkC2t40fiohwngP8zs7x/N++ZauDcSuwgpjLC98M/aQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exxbqxyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 07:50:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c59ac9781fso106502585a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 00:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742457055; x=1743061855;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gu2816Jt4ReGPaLriIq4oPFmMPGW55e3kLoSVqwZcBs=;
 b=JDK+dLoOaOk640KWowbaYuyBD+F6W2lLYnC7oicKpLJynYZScKUmIxH6yAZCzTI9pg
 J9zZ4+h/Wdz2++243ij54Ob4oyEgAJPK6aNBxtIe0PmBRUT9MyX2zCUAKgEAQ6UdNS6N
 pPKxQVipNZi3E+lLzNVfk8O7ObTgt+ibpaLDc9SUuUyQrn/pGicfYCXGspzYwPNGopJT
 iCwmd49h2wEjFyWmh4808/OV52jYhoUhCDkm3AY8Q7sK3rEaBqGs5GF9NZQ+FmnMcRyK
 Guld1fZMg9gZYICfwbKBw+tMDWprIAGGj38yFaBpnodvprwZcTgGMzErJ9PymKB4xeGl
 gjBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKhIFJ1rg7L0b4RzTg95csvtQjNO1dUaXDJ23qVrkWKM6O97f8oD7iW8XFyA4jJ0Rk4677/xlFiYA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvMceanY5qWYKrlPtAaWIfhQytj9Bnu4h147FetlKxMGXT4N3n
 Y2VJkYOt2eWne1Sc74n7ysDG2EpsLe8xrwM26mzg0m3yNYjmwfb37M6x8fqPdV0ZmavcF9DX1J3
 WxHdAIlKLXNB4rm+KHMnSahUJ4XYjQOs5m77UNFC/NzW+jn2zVJoGiG/xfwk5jtumH/g=
X-Gm-Gg: ASbGncv1ZZp2Vzhl7b8Bj9/I77bdhbsD0s/ugWoTMKDLQ8nkb3bxaPbYO8VDuucGMKV
 UCFyEzIW5OPoRK85P5BU7TNOhTXkbM4gFEz/Yxj4zwoFLbUM8MTXVoUFT9jc/znZvt5i+5o8QzL
 CE1M1E74gdbjIbCfDr+VDDtc/PN7BJ0t9Hr5eELULYWfbDSSpxihmdefQKs8WixPv/tbF/lMbd1
 UIrfXcLNIxHyp1tSP5UtcP3cU2FoThbesuddHm+yvu/La5qxyMBhJrF/eff+CDx/TyUg3PidBtP
 znlzWOOoSDzOs8f4KhEF4Bup8sFlERLHbCABl/IQEHKYGYFMe3160+Eb2dEDFNd6CFBCQHVxVKx
 yOcg=
X-Received: by 2002:a05:620a:15b:b0:7c5:afc9:5144 with SMTP id
 af79cd13be357-7c5b055171cmr269772785a.23.1742457055543; 
 Thu, 20 Mar 2025 00:50:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu1vRPJVn5WHYsHx8Ll03Rl/WJrMi//xMYy3u3Rawd1CXYt0rpjvKqQwuOC6NKpUeYzg1IlQ==
X-Received: by 2002:a05:620a:15b:b0:7c5:afc9:5144 with SMTP id
 af79cd13be357-7c5b055171cmr269770485a.23.1742457055241; 
 Thu, 20 Mar 2025 00:50:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba8a8d7dsm2128708e87.234.2025.03.20.00.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 00:50:53 -0700 (PDT)
Date: Thu, 20 Mar 2025 09:50:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
 quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8775p: add GPDSP
 fastrpc-compute-cb nodes
Message-ID: <uyjmsdhlqiuosmkrdmgltpimj5gfhrlp3an3glzh7gvmphjztn@5et56n4wfrnt>
References: <20250320051645.2254904-1-quic_lxu5@quicinc.com>
 <20250320051645.2254904-2-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320051645.2254904-2-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=QN1oRhLL c=1 sm=1 tr=0 ts=67dbc8e0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EE3GnvNe1S1ur2Q-TqUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: e_9x8ZyON2KfiutD2bgGwspDEYMysdYt
X-Proofpoint-GUID: e_9x8ZyON2KfiutD2bgGwspDEYMysdYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_02,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=803
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200045
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

On Thu, Mar 20, 2025 at 10:46:44AM +0530, Ling Xu wrote:
> Add GPDSP0 and GPDSP1 fastrpc compute-cb nodes for sa8775p SoC.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 58 +++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)

It doesn't look like this patch has been tested for DT schema validity.

-- 
With best wishes
Dmitry
