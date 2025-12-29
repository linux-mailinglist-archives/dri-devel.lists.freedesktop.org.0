Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47360CE6C38
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 13:47:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E20410E197;
	Mon, 29 Dec 2025 12:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7HY5ZZc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTSq9Jhx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE4710E197
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 12:47:43 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BTAxp5Q003811
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 12:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oTngEluiifgHJCxbZ4TtrQRAEGD6uxeXD9/zWx6/skk=; b=i7HY5ZZcTyXTIXKp
 k5rwtPoup9j3d7prC3HZI1RxqebGuUlfHSWPE+DpIrAuEoRvvL9eZs8Azku25N10
 kHIwt59ZYfSz3pldnjYZCgUAiwTMq5NIMQex2NZtqlKzI2n+sjl9VCZZcFy8J5u/
 4ifLZLnQb2hcUeN1zyFhzz9grMJm/BhSb9wYC3YhfJM2YDrGC3WoRndunEQBJIvD
 t38O6ytQhOGyDHKr+JwEoEbqkc+M0CHOdu7DlIdRlyFPxoObTwb/+7M5smj21Gz0
 zGfXjfltypW0kNPJxm87/q2WLA1L3+S9sMdoQd6oxD6Mp5nkeKtKiTb8ush05Zzx
 DMe+Ww==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7hscc19-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 12:47:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee07f794fcso36144611cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 04:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767012462; x=1767617262;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oTngEluiifgHJCxbZ4TtrQRAEGD6uxeXD9/zWx6/skk=;
 b=dTSq9JhxPtD0NzkjRXiW+2NUf+9tnAfMZPU/5wmFPrC5CQm78jp409dH7el3+O1ozn
 5ZFgj3hfaQzY0C8sZDG7/nniNB7h/OwP4EJMgXlDxycn69Dq8RhA8zzM/My6p7Vipk/N
 Rz77GRO2zc2dLhUheq+3M5UUoezqw8tTSy2EFVT32R7I1JPoU7OxXs32BPu2SgSOx0cM
 5sDI14Wi7rtW3tDJZTLSobtufGdH1ntJsHMlgOC0df6IjmwfxOJzLQ2cw+727V6BKlyI
 bVbBFySj96M0d6WqzVZlb2dvEZDG8GF8+WW7BaUSVgM90vcmcgmAhmHZ/QP274RjHnv/
 TyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767012462; x=1767617262;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oTngEluiifgHJCxbZ4TtrQRAEGD6uxeXD9/zWx6/skk=;
 b=ei3rBn4NJffSrs6S7MvXIbjCt6axla2uJWEbLg8m4TCNw1vZyU/4nFSVBb0X93PSDN
 bF7ZdZCyfgz221eplkKx6x98CknkWkZLETzrbMj5Yp0C8mIiENQX9aRO0LSUvhGMXDXg
 W513KOOZq2LkztT+WsDOrKUkySHqH2k6GlS4iSMJe6b62eyEr6X0C4UL7JFhuH9QCbBn
 71p6XWd8jp6RVrQr+zPn7E+WkiZVbnEUW+hPgsVeTqlQhpXH6LzTinVBHceWrUIdVcMz
 doclF3oBl+ArJNCmZfRXs0GrQsZU+4mmVC8t/NPaCbXK1LrcAH1s2ilz9Vww6LJfKst2
 ySpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1H6kGsoPZ2qjwhWe//Z0qW4dp6gVx9QRu6q8wlT0ehhPpu6ew2MOBTE5Nv3E3zRtE2RdsxV+516Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqyuGwoBGt393el9RqNyAW9Md8zvsQsS1uLl7kdINE/HjH8nrB
 /qZgbg9hjk60YNQPXQqd+6jJoG736TS/zRi2bnZQDLdcjLlRkjBGZnbW0CCWq+upTAjzM5YH7PC
 kMfx7qSQq0s8lkXNDuAH2+iHDr/iSAtPCXFtAJvEQQKhxKaSNi0/I5UEaUFYzCqxtiWb2Nsg=
X-Gm-Gg: AY/fxX5W/15VhjC6npYm4P/n/MFUd4KRL5djRQz6teSK95L4Kznm/g3jI54jxWExLhh
 cMCIOAoy78/qDM5lyjx3vTQbQs5hZs/oHK0gpL2hz3b9tAtYJZH8hjtLdhby1WfqqPOn5ry4ROC
 Om+NixSt3CvDwycmdWpBlyY0IG344D+THdY2cfPdC/4QKPINq6I8Eeb+0NRons7qeGz5ydx2Ddc
 vbVexFkPvmJf6hBWCZqMwmzx3rxQJibn8mplrOUTnfu1r1tUXTazjr8IY8EbhPVhwpc4/HPRjWP
 AXm/+pwH4p1EgvfF/IIoQVdfYZhev8qH9b35gT+DPjFAfAw0iG9ska+/ZzDqisLcG5j3vg9t6qp
 1IHFizNkrA9XRMXstqCV80zTajNzhyLDw+Vz1oGscJq6CZcjUd6V50j5x/CmICfdeJQ==
X-Received: by 2002:a05:622a:1907:b0:4ee:4214:3226 with SMTP id
 d75a77b69052e-4f4b43e96d2mr289064591cf.6.1767012461703; 
 Mon, 29 Dec 2025 04:47:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7fDCqvroWd8Ztt8XruIl7fotzA85y+lW2vZ/2NRrAM1IGqRpECNpULXx3B51GqsYodvmMpg==
X-Received: by 2002:a05:622a:1907:b0:4ee:4214:3226 with SMTP id
 d75a77b69052e-4f4b43e96d2mr289064191cf.6.1767012461223; 
 Mon, 29 Dec 2025 04:47:41 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ad8577sm3309954166b.24.2025.12.29.04.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 04:47:40 -0800 (PST)
Message-ID: <05f47e46-eee2-43e4-bc9b-4e3b3268dfb0@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:47:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] arm64: dts: qcom: talos: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>, Jie Zhang <quic_jiezh@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
 <20251226-qcs615-spin-2-v5-6-354d86460ccb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-6-354d86460ccb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lNTvbdbs43qGZdxRlLj4CjVCT4JkUxmH
X-Authority-Analysis: v=2.4 cv=O4o0fR9W c=1 sm=1 tr=0 ts=6952786e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=JdhzuzQUjDh6MeSUppIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: lNTvbdbs43qGZdxRlLj4CjVCT4JkUxmH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDExOSBTYWx0ZWRfX0me94w8BstHZ
 8Ifss7LiPzCISvFhJYnHFzSU0pv44i9YSPnm39toxYAAUBDjthGKffLE5cjHuTltTW446xi9yrS
 q0y7JoJj0GKPyTiQJFipsv3weDe1sJiPdlnsoRL95anezOnysRJXt+5ZrDz9znH4uVxsRB+ivrL
 ThIYNQNeuG8Pqb1EgOr7O9iKFF6qKmxXoEq1y0ASZWR/3Q8Z6etvmaxwIL2nm5mK7p6HnVyJhDd
 PQ2wGCXnPkiuOH1x/BdwOrdkEop+wucP95S2kyHWaaNOHk3mYHGir/LGBUjxcYhJLVIfEf21J/m
 88Q1SZLsQ6u778GionB3lpn5+ikdeo7HuHDKfKqz/J0kxM/jSXyLap771TgDJh5xGkk7X1ogDOT
 U8SX9Rox2HWtYddkv/rK0pBG2sUmme7nDgN5N+s6VY/c4DQJ/TUKpiJlaf/JiXk71YU+G1T+oAk
 OyP/mvIpynXureFY2xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290119
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

On 12/26/25 7:29 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and rgmu nodes for Talos chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
