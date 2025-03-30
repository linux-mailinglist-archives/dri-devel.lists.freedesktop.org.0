Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD827A7599E
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 12:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1174110E11F;
	Sun, 30 Mar 2025 10:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fict1UxL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B1310E105
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:36:45 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U6H53l003256
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=fVH5lVnR08zuySJUeq+uoGrf
 ogdD6s0iW5s7dVDfwco=; b=fict1UxLW9xXrMeULzi7aTNRGiMCuVAdVu2AI9Wn
 CUxu4l7FL4W0EFMDbbXhPn6J5urF2TJrWPg9ZXdEMOv1j4FffzrXTFn2hcrRGSRD
 nvNnqa6qPxPf8I/BDwILE1Ndg9CgfpMbLv04a6Sfb8fDUAvbMcEbEN7vL3nLhtpj
 ENCOEW2H5pvxflIvhNgZvNDJnC0hD77ObAC2z4o9y+L0SXoHcVDm4/Aa/YOQVhKz
 k/TYfFO4Mb7BGxCMgYhNAIPoAC/NWcIfqaPZ8SC/Xbacvte86MwEbUHlbILZwqUk
 H2B5pQqDd5jd19wdd9ylTxiUzNh6GdmT5YjIEJAkyF10og==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7v8a6jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:36:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c543ab40d3so533138485a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 03:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743331003; x=1743935803;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVH5lVnR08zuySJUeq+uoGrfogdD6s0iW5s7dVDfwco=;
 b=wUkg36FYQGQb1By3h560sufZCI9LmEE5zf9H7MUtZvVeKHX+wksdIdgGkUIUo4XVAh
 jpeif0KczfmGWLZJcyQDKjQzRNcBvKQCJI1bN5oIX14a0yqz84nPjjJwjBI7A8nSfCW/
 iCFI0fBwI0A7vmkTLXuPGXD7390rEcB1BrD155bBtD/l5ycrABU6wkiccUzsZ9dPEpUc
 JrAg3KnZmv3TmFvLN9P5ZzXFBaMeBYEEG0W0a96PovFPyY5j7AM4S06NhnXenikZ4hm7
 NeTWHVQ8XyopshyZJDr9h2orFn7o65J751TaImA8J/Qc61rtx+46yhVNiUACXnqrdpgJ
 0kIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoWMoVF3zSFYBJmaV3QqXGKGmSOrks0ai8dLTrTdPIuoUCmx3gR0hc8rNiAmppUj3kWruCEiaO7Ik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMGjXZNHBDeSj6eV05xhKAub8eR1es4WEN1rJaBd2w2KsqcTqu
 XaCSGCaUmWyHDJxF5oUxU5IQZtoIiK6Ti2CcFErtlWRm1Gnjr2gSNQQaYmSQA4ZirF3c2mHe6gh
 wNqiQ1jy/XbXnjqR6fp588WaPE8nnMiPo1Xx+az+OGHstTrnGJ4PsU5w/xYvW3uK71v8=
X-Gm-Gg: ASbGncuZYIbDqvLyWO7HFMm1llzAqaz1TxN65lRtVYHH1PaZ0AUoCRQ1RVEmkOq5eJi
 OEyeTA1xffu8GJP96tefMprXM2o1rBr+n8+vUCyJia9F6Q8nFd5gdZDpIaqD6ujZ2pEzIX1OQtb
 2M1Bq3I9epdD1YMmcyyjtlc/QVcEEzDmSx1E7m1L/PZsuQA8j3BLy3IJ4dZ54/t0Bq4bmnxSH1O
 GxqMbTNuXFMtsfj/2SZSxYmXPv7WTE57jPNSv0wYBACXwHIr0RPk3U1w0Q0jx7bwfVzoZS+Beov
 FEYwdxXBAXjATpFeL61pcFQtC4GV6ySRXfjKVUuVTnyHROilh73+aszkucC+p0hwo9dqvP9Id2H
 Vixo=
X-Received: by 2002:a05:620a:394a:b0:7c0:c469:d651 with SMTP id
 af79cd13be357-7c6908950bcmr823933285a.57.1743331003098; 
 Sun, 30 Mar 2025 03:36:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBtS6gPnV+Pz3tdsrxXFX0gc/+BT66q02s4zf4BNLAjJe/IVitafLnQPXX0a4yMcsExGqSNg==
X-Received: by 2002:a05:620a:394a:b0:7c0:c469:d651 with SMTP id
 af79cd13be357-7c6908950bcmr823930385a.57.1743331002525; 
 Sun, 30 Mar 2025 03:36:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b0959150csm848746e87.187.2025.03.30.03.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 03:36:40 -0700 (PDT)
Date: Sun, 30 Mar 2025 13:36:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <mki4de5adulxmmpi756bi5frnsa5yx2ng2vh22q7sz6ijsc5kw@oyvb5xuu547c>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-8-quic_amakhija@quicinc.com>
 <20250312-athletic-cockle-of-happiness-e88a3a@krzk-bin>
 <d64bf3b3-7c4d-490e-8bd7-1ad889aa7472@quicinc.com>
 <4aebd1f6-5098-4548-adae-843db8f45aa5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4aebd1f6-5098-4548-adae-843db8f45aa5@kernel.org>
X-Proofpoint-ORIG-GUID: pW6SIeI10vhTaJkCQljVCONJsGeV6o9H
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=67e91ebc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=UXIAUNObAAAA:8 a=J_IFRixHdDkWMPCtAZcA:9 a=CjuIK1q_8ugA:10
 a=bFq2RbqkfqsA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-GUID: pW6SIeI10vhTaJkCQljVCONJsGeV6o9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=908 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300072
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

On Fri, Mar 28, 2025 at 03:28:20PM +0100, Krzysztof Kozlowski wrote:
> On 13/03/2025 13:10, Ayushi Makhija wrote:
> 
> ...
> 
> > 
> >> +
> >> +			anx_bridge_1: anx7625@58 {
> > 
> > Node names should be generic. See also an explanation and list of
> > examples (not exhaustive) in DT specification:
> > https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> > 
> > In this I have changed the node name as anx_bridge1 : anx7625@58.
> 
> Except that it is difficult to understand what is what, let's recap.
> 
> Original code was:
> 	anx_bridge_1: anx7625@58 {
> 
> You said you changed it to:
> 
> 	anx_bridge1 : anx7625@58.
> 
> and now I give my offer: I offer to buy a beer (or tee/coffee/juice) to
> anyone who will spot the difference(s) between these two node names,
> IOW, tell me what changed here.

Ayushi: mediatek DT are a bad example here. Please use bridge@58 as node
name.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
