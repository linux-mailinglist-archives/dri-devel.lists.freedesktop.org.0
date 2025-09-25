Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D20BA1BA8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 00:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8939410E9BD;
	Thu, 25 Sep 2025 22:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTArokZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90DC10E9BD
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:03:34 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIUngK005850
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kyKnwB1YFtbc3XyrNI6dEPy9
 Kx88yZomZncunczbfcQ=; b=kTArokZvPkyNBnSUBZNdORv/icUPiZZuXGXxnf+H
 +cf1y/O+bEQ7MfJL+EM7bI2KVC5tvKFLp98NMuW+ovWiwyf2vXV4cwHXyttrnnPA
 +zdRhNAlqrhb+uHCZpq6LJ7T23x0Gz0zj/3RONJP9LgRKR5CfSomzpohHjNB28Yy
 t91xz5SaYpIroEFvLcEkjU3JZzyazldEmmSMLItLhdNLELuicQKvNWhPwZP8BQqG
 bjdvoSBpt6CinR9ieuemi3IryPHLaheSfG2bB0Npwifm2ylGJgisTvN6NSQ+kwKj
 WUg+4kJcbgZFq8d6BGfJoSfAgwbEbB/UzmHwuNW5Ay4k6Q==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db320gcu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:03:34 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-757e4e15c67so1965555a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758837813; x=1759442613;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kyKnwB1YFtbc3XyrNI6dEPy9Kx88yZomZncunczbfcQ=;
 b=iLYfmSt5P9ZFkzDac2CNDVoRDI+wiCMqo0plmGn5nwSHvfyNRAdqVgltzX7lpoiWSf
 PiZa0PhicavFmmEGv44sxoTRvfq3UXoKOD6j2KG3G5ApQdBOqRZCU+MBx2UDzmcWG2d9
 Cqoy/UDjpY3XgbWgKMubLEG8ZVZ5/ScSqxj7pAPL8p5gflDTSipA6WRSxc7SzvcQMezN
 I9Be2LpkBztXUfC4Hmj5mi0hfMsWPAFcmAd/RPq7h11zDO972mz3QXtFHEO2x+L9mxCn
 MF1Bvs22+OVlt/V3xpYwrYanaaGe80X7iOCwAFZy1DjUBdfOQIHunubXTf4aOF/n1rHT
 zpoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV33zOt7r67+bPiPsO77acHeHxyATCiyoNUe/kFhWoCmaHS9FwmevMUkL5twodZtlPsiwxlEdSgPi8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzONNZkVAzSMwyEbl16i1/g/MfE+AqMesPQwtTuU7GTu7H8b0KN
 U9OIXuH4SU/jbPFwvLifAkFed23lbIqra/CYXnZ7goMIsMw27FEXWVIWYFk8PrcmZ5cnBQRpNfb
 ly7cW9XH/4gIDHNQJcEpjUMyIKJ9MMeXs7zdk+JqrP5W0sODwqt91GkkrvbLYbbxp/g0aIUw=
X-Gm-Gg: ASbGncuFOI+nDJMx8nqsrjLbLJfdjJD2RI4c4mSFHe412ILG2LC6eL1nnvyUJxo9RKr
 i3WL0BWOrXGN0ORrIL1jZ5hPBQRxC/PsuQdZS9iGJb+47Qd65jwWDEY1v+nDbBQIXypWCVyouPp
 Zz1csvDUe0Q0TScU1WTq5ewU5a2D101VJAFbgtoQb156sAfKhByrYCEtFuSyqgjeZgAJ7b56jhG
 C6q9kgRNz7r5bfQc1r0iofduQx5TCo4pQQeqFU4ntsh+BWZnnYsoqPYreWS+tib+GnwgCBdE+qz
 XYVRbl/D+uFStfXaW5SzMyG6jbP92ZgtTUS4aHKOp4OSKdiN9xQGFJOpUmB51l30YauFZDW5jQ7
 fJ4PvL1ppj9fe9y9Ph6E991kUHQwUSPZju0LV0LWAL4O1XclZ1HAb
X-Received: by 2002:a05:6830:82d8:b0:745:5123:c53c with SMTP id
 46e09a7af769-7a06016b533mr2209267a34.32.1758837813298; 
 Thu, 25 Sep 2025 15:03:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMVYQTpwJaNnmccgTZ5npi/eB9adT6V58QHAXjqd3PsqhBbecByebxJS7dc9agoabjKnHZVg==
X-Received: by 2002:a05:6830:82d8:b0:745:5123:c53c with SMTP id
 46e09a7af769-7a06016b533mr2209227a34.32.1758837812878; 
 Thu, 25 Sep 2025 15:03:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430be5sm1171344e87.28.2025.09.25.15.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 15:03:31 -0700 (PDT)
Date: Fri, 26 Sep 2025 01:03:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to
 DP bridge node
Message-ID: <oim2rkt3xczehmgg3sszmgobrqs3ov4rxockseqgddzlts6paz@ztyakecujcsr>
References: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
 <20250925053602.4105329-4-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925053602.4105329-4-quic_amakhija@quicinc.com>
X-Authority-Analysis: v=2.4 cv=ao6/yCZV c=1 sm=1 tr=0 ts=68d5bc36 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=En4R4P6zDXfLUnqyaIQA:9
 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9vlw97CqW-ut5H5nBnFr3bJeUAOHniKv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX83e9Ozh50i4o
 ZeauhE5Q6Rw8khG7R1gAHC7OLeCBI9Mv0Xl0sU1ddouoooGCYHo8aOV+W8Ykz/e+8cmKk0BDq9W
 BbtSsPL61YE7s8UrZ0g+27n7FBemXouSrYfbFre8nrX3iVqD8wXIsCC0MbNvXY97nOfmR93ZcyL
 SmQa0tTFctQbNTP7Df7MoUsBDZupr9YBT0ZoFo9im2CJ9pikTY20+x+jIQekkXdnujtWAvNQt63
 7dKBAc+STyLf0HJBzd152QIIv6DK/w98SGUbZQIUlzHjVgIgUcUU0Kf3ycNxy1wrm+rGFMim62R
 OTqE6RKHrLr+nyro+GhLivJ/80ZZw0BHLAWjfSWVaMZHe6bY8GGvDKVLwBLx6bkqr2gUJg8T8V8
 /KgTknOqLutHxTIHLGcki0d7PzP4ww==
X-Proofpoint-GUID: 9vlw97CqW-ut5H5nBnFr3bJeUAOHniKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172
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

On Thu, Sep 25, 2025 at 11:06:02AM +0530, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device node.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 170 ++++++++++++++++++++++
>  1 file changed, 170 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
