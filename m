Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D0FAC2804
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 19:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D56110E004;
	Fri, 23 May 2025 17:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RodJLXA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C5310E845
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 17:00:06 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCgYEm028470
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 17:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=maOR1rPHKMjhU6q4YVbFSzEd
 jGLm86V7mh+z2Dssfhk=; b=RodJLXA7sxKKqUjE7fZ1XL8GGX5MZDuJodF3bNjV
 +hBLj/uhAA9Aaxbc7VEGvBPlHkRTYN8TpgwfDdMGgYu+9syM/t4JerfrgxDosajl
 VHJkJaGGS848/wrQjLJarXprVSKC/8Fn4F81gViF192SAP/+juDbU9jCt4cZvRVC
 to6DXaz2FK9PoVNmY9k16l74amWNEK1N3OlH6x+Th+IQL1U4ac9a6+sQCRahNh7b
 tVoTtayd2cj+QgZhRFrXnXwlAByXS7VDe66fk3fCR/1os6m4QMc/QdPfQaGN0ZX/
 u+wWy/xpMkh2TH5CoUVn7C6edA6obfN3CA3q40EC2UMlMQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95ts0n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 17:00:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f53913e2b6so582726d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 10:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748019604; x=1748624404;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=maOR1rPHKMjhU6q4YVbFSzEdjGLm86V7mh+z2Dssfhk=;
 b=qc7GflgQblaImV7ft4MzR8hxiB3+03aehDdyKbPB767XGr+2Tk+uGJlVjxablt0SvQ
 +9KYnxmlGkZLNpIEVil3tuwrMxzlaKEwfbMM0w66oIs4neL2n1dv1baFG4k/atGbDrn+
 VANGl0MwjFJNk5Qse43om+IuIdxd1p19PdLFEqQBuYouupjqiqUQO2ZEbHmT6uctuSvZ
 G5kxYt5QToRcaENyhMsQuyIuyFvHrL9O9aIYZ/AnVUYgC4tN+lCSFcXkmh7P0KrXBUtt
 qhyKSs0MCc7dJ/9Mq7OGuGb0p6MMa4A8kg8J1C7CgOL+VQ5WRKG0Uty1mynXa2yPIMTd
 Pmzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUirVeshQdApvLAyAzSfMYi08lsX66qgr/vV41FiW8nU/kY64A0HBSJLRjA734vz5p/KC7ipWWJhgA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc3jdHHAd3Jje/+neAKbD+r5549t899ryxkn9wXA2nU0GUNSJ9
 xvVKT/njrWygwaXYNTNvOwUqMDm3GsqBrLZRl19+zxMmB1uNblKpGMTzxLbfe5yUlE8KWorevWz
 PkI+PRQ4wfkHAnbCdIAqIMlBSeYuCFFyb0DwjAVYNbIPI0jEEjhiSzZLQC3xuCEvgGUg+4Lk=
X-Gm-Gg: ASbGncu1+crjR5TZi5Uu2yPxrvZIMkHzN2Sl/+G2qFMzK8N6EqTQDOx0YAyk3Z49Tjv
 8d5wVrAHexmxK8K8HQ0qaepGdwcectxBiNe+pdfGWH/nb3OJRuurlYuSO64aVxRXHz0BLWidPW0
 TOoa3lj97rZLfuqVp94q7Uz2GdnxxdwPe6KbrvB1PedIPWopus/LUd9LMs8w9N3gvjUMiXn71S3
 jj15ZM+vmRB9FBDHPRBZ+xPcnsnLlLYaEemTIMQ5i0Amswhyh0jtfD/OnqiYYPwM6sJS4ZcrzuJ
 uR3BVXjzJv0n352PcBFuPAG2OXMOfGUmX57dpQytGximgXKUhFHqnL1qPSv3pkLTh7NDkJ5rJaE
 =
X-Received: by 2002:a05:6214:2025:b0:6f5:4079:3189 with SMTP id
 6a1803df08f44-6fa9cff2ef4mr5010276d6.2.1748019604278; 
 Fri, 23 May 2025 10:00:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCYdw0GZtJvLCfXO1X8zZftyGhiXHFblI6F3g2GPsnCAihhW1dYilfd6/MVO03PSiywr0fMA==
X-Received: by 2002:a05:6214:2025:b0:6f5:4079:3189 with SMTP id
 6a1803df08f44-6fa9cff2ef4mr5009886d6.2.1748019603916; 
 Fri, 23 May 2025 10:00:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f3666fsm3935508e87.104.2025.05.23.10.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 10:00:03 -0700 (PDT)
Date: Fri, 23 May 2025 20:00:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: msm: registers: improve reproducibility
Message-ID: <76xrcy5lvic7mucwuph7a5mgq47atuoocukanjf2q7g5ov6ffa@wbfks6f4hvpk>
References: <20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=6830a995 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=dkGs_W1-f6rb9hiwgxYA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: oEieza8LJc2-tngaKoAfHufPV1yV9GK3
X-Proofpoint-GUID: oEieza8LJc2-tngaKoAfHufPV1yV9GK3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1NSBTYWx0ZWRfX1uNGjwYncw02
 iMJ5hME5276C/zgIHtlOeY3/tQh1omYlsMqzvyimlskVxv/xuHfxN7kEJEWIOYMPPDEPZCGmgLN
 r3zIWVXQne7DPmWD/bkoaguDwINM+B3Rgw4rAjuBXnxCElnPkmHFs/fMnBBNXYjowWZ77vD7i8f
 hu0L8ayAiYZFtcKWBFKr8wDu9vRZgxl/JLey+K5i9QxywBlqpf406ZjGH6+4WLOpvKeT8mh1aJ0
 BLtRD0JBnYzU1zbrB9jdETAsFArfc1QxHdF3O9+Rdjx9D9zV59G176xVQPXRVeOwASEFOTyxo87
 7aPMYJq68l88hx7wq/+6a/eKdEjKGvgRtTf8tIy+fVZ4obyAIqpEBaCJMMm0/pB8BgfWxk8BkWE
 E4hUbBqm4n6MNg3uKvhd6+LGNUpPFEVSRKqpuKZTpCgeB3SplAHyvVQIj3dbRDUM+sUuhPg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=421 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230155
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

On Fri, May 23, 2025 at 06:36:16PM +0530, Viswanath Kraleti wrote:
> The files generated by gen_header.py capture the source path to the
> input files and the date.  While that can be informative, it varies

You are not the author of this patch. Why did you drop authorshop
information when picking it up and resending?

> based on where and when the kernel was built as the full path is
> captured.
> 
> Since all of the files that this tool is run on is under the drivers
> directory, this modifies the application to strip all of the path before
> drivers.  Additionally it prints <stripped> instead of the date.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>

-- 
With best wishes
Dmitry
