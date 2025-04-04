Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9ADA7C64E
	for <lists+dri-devel@lfdr.de>; Sat,  5 Apr 2025 00:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E851110E340;
	Fri,  4 Apr 2025 22:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJ7jtrKI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2B010E345
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 22:27:33 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEZ9W029141
 for <dri-devel@lists.freedesktop.org>; Fri, 4 Apr 2025 22:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VJYsnY+6erBvEBPaJTdsdZJ4uuZYnBabVTtsF30idCs=; b=CJ7jtrKIR3wEzlky
 SmIINczI24WekUtr2AcduCha3aKa/RKj+CSS3dM8rbOS6ysv67v5I7I5VTGYmqCJ
 rvGlcWqb4kV5Q5QVVqRwHyOq1zT8NMH+LvV0iEVJmfcaCAwqS8bIfcx9hSlTXW5S
 B2J59OgnG5H1N3MKRo+WdSjHwi1cuqaBIjWWVsQXlSa/GWaVt7rk0S68h6ahgI9D
 x/yKyOOKquWkLGOrXrMUQj9lFWafRsjc9LKmEwExKOlkwqhG+n4OGzl0r36qK51r
 xQ7485sSh34y6welfmD9hFjUQrpCqw6EcaxW1NfG4QX80oUDI3UXZTIRBFLPjWIX
 5GUl/w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45tbnksyqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 22:27:32 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e8fd4ef023so4291876d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 15:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743805651; x=1744410451;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VJYsnY+6erBvEBPaJTdsdZJ4uuZYnBabVTtsF30idCs=;
 b=A6gAH1Kshdf57Ebsljq5k/iMip9HTlIFUAO6CENR5G/egDu7OMVeb2z01ANKu6OSwY
 DkVuKLdrmlKfYJ1TVIsCQ3qEWzqu1hF7wYT+OBO6ge1PlHNNgi5wdNPaOCcBnpPrNu71
 z49G0mNslwQuwVFwvFmdBwKz5bVYRdfPZuP+x20IjfbrZaTiZG3Cn7km8nyf4GHvpdoA
 KZiV64aIzGnB5dmJYqUbsX5AsVlldtliEjg6zAX3mRDTHGWjCjWjHhlcgjNBONH5x2Up
 zIKml4bC2VcZi7DvQpCJFA9kd6WFAf4r3HbZeuGISy+vAV5QvXvp0ylscIPGMPwhI9M5
 KTkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX9Y5b+aouT/5mVZqlOSM9YzXftRpd2cByWtgFvtzQHRMI9ztUUZ4tVLZcAcV77ZWY2ylXwyAY8Ok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYvVFpNE3GPoRL8qVIELjirKTlUgAmUgg3Fn+8rh27lox8Y/VT
 6gzX8D5ybMyQ6GIgUvq7wov62TveJMaiJyXKiCB+qV83s8e2QsiLwS2GMR0n6ex5ITRDM28sd63
 LmfcFyNChFrPhhmSCF8XRzGR5e0J2g40+787MkwRnSDe/Jvw45/LeXXSUxavZ99Z3gvk=
X-Gm-Gg: ASbGnctfMGKDn5Msh6fwqCLPRXGi6gCAsGvVzOR+r7B+phKx0W1cneO4aF2UN8MY7Ou
 tX+lF2P+Kmg4Y7kzx4ogLBzZ2GLOUxdkso8U5C3YzfT2GDasJsMdKMTUPgXbttPTgJgEer3ZTeF
 DqKQq29L764x6B2xrzezC6W/vUHhvnlsREgKj831cNUbvadNpZqbs0Q6M7z8C9ygPqB9GJHUGQR
 beB7fgebWqCUSsgNb+LMyOYRKWgSL2aRXQDwBylsETAJ/+PKF19JiL7X1WpKb3MyJI6pPd11xty
 hp7PBjxwbejN/iX24Siz2eHkcueQtn8cDPLaTJQ+2VQAbVTzTentuOb0r2Ysoj+pcRmRvA==
X-Received: by 2002:a05:6214:500b:b0:6e8:c713:3222 with SMTP id
 6a1803df08f44-6f01e80f181mr25333316d6.11.1743805651304; 
 Fri, 04 Apr 2025 15:27:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhO901gakUgHiOaTVcE0jt4khKICm8Kfusd7IWqMVrk0IJGAnOO4bP8+VSL6u943JVp8MSsA==
X-Received: by 2002:a05:6214:500b:b0:6e8:c713:3222 with SMTP id
 6a1803df08f44-6f01e80f181mr25333006d6.11.1743805650898; 
 Fri, 04 Apr 2025 15:27:30 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7bfe5d46esm326272566b.19.2025.04.04.15.27.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 15:27:30 -0700 (PDT)
Message-ID: <c0e4636a-2d4a-4e94-aab0-150f88b53026@oss.qualcomm.com>
Date: Sat, 5 Apr 2025 00:27:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] arm64: dts: qcom: sa8775p: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com, Dmitry Baryshkov <lumag@kernel.org>
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-7-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250404115539.1151201-7-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZpFjAt0D95XzDq3fIihU7HkStvizD5Jj
X-Proofpoint-GUID: ZpFjAt0D95XzDq3fIihU7HkStvizD5Jj
X-Authority-Analysis: v=2.4 cv=X9xSKHTe c=1 sm=1 tr=0 ts=67f05cd4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TpLJD_z-7n-X9rO-aHYA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040154
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

On 4/4/25 1:55 PM, Ayushi Makhija wrote:
> Add device tree nodes for the DSI0 and DSI1 controllers
> with their corresponding PHYs found on Qualcomm SA8775P SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
