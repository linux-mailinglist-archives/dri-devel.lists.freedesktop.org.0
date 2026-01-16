Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECDDD2F32D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 11:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C98D10E84A;
	Fri, 16 Jan 2026 10:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjNX+hYk";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORP1eXaS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6A210E84A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 10:02:32 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60G7U2Fn2819045
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 10:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OJbND7y7LhcOSnxt8iwVxIRRefUPRDr+wQGssLa1ix4=; b=SjNX+hYk+L++tlmX
 2gEpuuzA2Y6ksLIaoiZLTpjWm8hDcO6wMAWAXcYe5bY3e3w22TIPCFsjklvPapC3
 DGL1YTSTbOS4/rAgGuUEJpMQdwLBRWNZ5a82ftzt5gMdqEvSrSbVGSNQ8I1aBOdx
 Zz7nnOHaNz+maOiksL+acfOG1KxBQ+wLCqjRHRWGDTrKk4Mzb2ILskRpRRo+T6IQ
 hyAcvtfJB6VgmMYlqQaS4uugCOzdazPH0wWXvpM9ftUiE1b8JNAd2fhQ+sUmPHWB
 oab9AZTeEj7wa+P7tAay+ypYUTkZ1ZkNWtXqqQe7X6nuiqbHndXqwRFmzcIXLWVE
 TGd/Mw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq99ahqsm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 10:02:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c52de12a65so46231985a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 02:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768557751; x=1769162551;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OJbND7y7LhcOSnxt8iwVxIRRefUPRDr+wQGssLa1ix4=;
 b=ORP1eXaSke2yyNNw7Lsp60COOr5rA4mUVtMIy1rF2N7NK2PhK78Va9wOHmUYDZ5kcC
 GRgO/PqGwguhmxGyhhfUa1lfcGUGHvYRi2xldPs4XsyCvBZlgQ6r2tMOcgSaKgfs0GTx
 KrIO6b572G6ig7ha/u9m1oUgNekKTuvdsiosxLYPKCTag5ICxnpiaWdwysWkoqb3FPw8
 8SorQ+nESMA/NyNk/Rm9XgRtiZdj/9mVbQvl9yul6aaGmEmDb8WtLdFqg2cvTU6iUwTB
 lxu+RE59Rt/14VhGeVNORvFp+hJCUnEACqgFpw4++MkC1GMtPekBfQHlmzt3lQUEBq1W
 27iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768557751; x=1769162551;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OJbND7y7LhcOSnxt8iwVxIRRefUPRDr+wQGssLa1ix4=;
 b=Udjs2SNv3M3S/MMH/E3Zgn+Xs90cLbZdRMf96cb9mUhlI49N7EFIgopAZnbVTTb1dE
 EmVXaBYwhKoGcwixo0tgMHITrRj5wBtRLhphLp34jr2sPrZHtOeJzImGwL7HCjx/my24
 jlu/oqRb5mw6y2Jnk8yBNs4wv2G+qPyBaAS8trcabs5Njn+E7PMw8jrozPG5lFeClWVA
 lKS6gA2R5a9fWynj8g/dTd4mB/xEr4yOqxmdRDPE2gtXlTM0TFtK4vGoOgiIsLeycSL+
 N01XciXUG83W1nVGbvlMt2/f18IZIhduiDaSEgIfF2EQvN7tpzbobXOpww7KpGjyZ4lA
 TWRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtIc0XnvWnNMdA42XUFh3fLEH5sg2udc/3aGJ5xzlW7eM5vba/ntMCKgXCZd4pm4hJN7DFQXHzjGI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzKnJh5Vudtm+ARIbKdcRdaBOBweGyt4oQbLyqdSK4awvD62Gu
 fb74GgMaMZcuGGZLFl/8pyKa/57NLIAHjoSUAlCwbtG1fNWLV5KIfJCeq0hfzcfNIiH2ELPCbxL
 k/4i1jcrrgZJrLomkTey8DC5wP/ili5CiWO2XHY59Fa5O1HQcnhFiTT+xXWKABfHwUYjnX4s=
X-Gm-Gg: AY/fxX5OPQEmM1q+ztq/8CJmCRDlu9ziGviWiy0gW78Hnvsx1vHRSaIbza7J3O/AAz8
 zX8t/xTFajFPG9QRPmiBUqLMojpBZJBnYzQGFK++tfIs1EYjuvLRvvZgeJRoazTgCchMRllE8Z6
 gCu/kpCCVO7wLC/izrVlsg8t961LLkrPuv0bCgg+hp6tfbPllpeXdsTrAKeObvrvUN35MlYqQ+4
 GI3pf3j7ZF5x7MXBrx2TcddnxUkorXSIrFswVoH4hrfEBsq46tIErMvQwUx/qKnZ2XjkNwZ1a5W
 XAhpPpqigkehqqBqstOC/AhRt2p5Xq+CwzhI2yLgdDxTPCovjgETNyQZ4xRduvaMmZCYKzPD4vO
 YDD+0+uGwB19GO23iS4JZftEwfiQ6RUKO3xn5ceY2UUU11zP8a6P5Jn+nlqm+dhsF1N8=
X-Received: by 2002:a05:620a:700d:b0:8c5:305e:ea16 with SMTP id
 af79cd13be357-8c6a67ab9d5mr216409185a.8.1768557751184; 
 Fri, 16 Jan 2026 02:02:31 -0800 (PST)
X-Received: by 2002:a05:620a:700d:b0:8c5:305e:ea16 with SMTP id
 af79cd13be357-8c6a67ab9d5mr216406585a.8.1768557750716; 
 Fri, 16 Jan 2026 02:02:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654533cc4b9sm1984787a12.18.2026.01.16.02.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 02:02:30 -0800 (PST)
Message-ID: <fb19c7cb-96bf-4abd-94b7-9d5eca07c346@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 11:02:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/dpu: try reserving the DSPP-less LM first
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
 <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BeCkLLNh9DzKoOsQ2UXg8smhJrnhG-oU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3NCBTYWx0ZWRfX8K67n8RgGKVY
 nhQai5ImJeSiBaHB248f+MqAdXq+/Q2r5UW58znJXI1v7CTGimd7OdLceEJcIVHDao4EMnhG9Cv
 /EINQodiOP6H0BZHh7fpr50+Ejf+ETlcdfLOx4gfkUbfPKagCW4KKz1F2D5z5Q8v1x+lFgBKEeH
 suYbcIHZv4nVgYYYCyUtTDgTP03Xm/3GZKM2B23V5s36geSdluosmbfYuzaL5Gs+ITn+8XKvaXK
 HX6sZJNsLK1KJ9IfTxiZoY8XgQOtt5FpjtWWJ2kwL6QGDbVjrLlgqYwhS1pl343crYikGjPOpYJ
 MfANRz/aMlHT5hZ6aRGCAeq9XyqxP2Ed0FHACRLabNdSKKZCDwpg+Z0fRwmdFv9q4L5I+IZRGPM
 CN8RWkYXk36qkplw7FetmMmzeBFKPJ5oDda+75RVVVwRV/gOYndEHGzY64D5BQp7q9lo1ecVElu
 Twx61uGZNfAM/efnLfw==
X-Proofpoint-GUID: BeCkLLNh9DzKoOsQ2UXg8smhJrnhG-oU
X-Authority-Analysis: v=2.4 cv=f5ZFxeyM c=1 sm=1 tr=0 ts=696a0cb7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-oCr93RSJmR9oNbpFyEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160074
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

On 1/15/26 9:05 PM, Dmitry Baryshkov wrote:
> On most of the platforms only some mixers have connected DSPP blocks.
> If DSPP is not required for the CRTC, try looking for the LM with no
> DSSP block, leaving DSPP-enabled LMs to CRTCs which actually require
> those.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

