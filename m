Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C0EB03E99
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 14:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E657010E482;
	Mon, 14 Jul 2025 12:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iV0HXkOD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0459410E482
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:27:23 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9uAU7000609
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=6EgrQ6Evaclca/mv/a+/ccLx
 hAtqa936HRQUO/m+epI=; b=iV0HXkOD2VYKwXwBtVQRczeh4oiytnh9ytNquBSz
 x7n0Yh8bvnNPuGZPy28cMQ0sug9hN77RWUK6i7uHw6hEy9lwrEHYyVxjgxB+J1BA
 3HhiSlTLoetbOSZBja+g2C/hRrgykzfBtXgLb85ncyMlHhJ8gnRJQ8lA8rFE7DDf
 oFfOKQnx76lcX7jMZQ4dW5gV68AlN9sXSJW48UnR3unpSjC2gh9ip7TRceFaUNB+
 s/f+R7eomha1r4I5VpPkpfG9sJrvU5wms/ST0YtOA4SZY+EAtMGQ6s3TnksMubcP
 aFmdqiGz1gFuL6fml9c0XxAzp6hrfKgBC7IOis2uLjDIkA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugvmvnma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:27:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e269587d8eso191433485a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 05:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752496042; x=1753100842;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6EgrQ6Evaclca/mv/a+/ccLxhAtqa936HRQUO/m+epI=;
 b=pNnUCIsyoM7uE7MqkKAvkdJyfGbXvTnH0o4J/nH9U7YFzP/QQQfndOBvHO7WhyqGta
 0t1JWjuxuU3LvUDO/R0WYVJZ/o7DF+OeGkzApL/HUGt8H+Lmt1laE4tgvGf1s0P6eVFS
 wTD+pW64+X/eoGq6vAYzQVSQjb8cqayF5hAXsoLofCL7KZD6MuhdQdUOvnjhU/4iia++
 nsvbo/94Kc79WIyWd0iOp1Slnrj+AsxzmpPi6Nd06vyWJ6dZOESBOokX/IvqqTDHewNf
 JBDw85++cqy3X5alLSHy6YNRI4U9S1Hxir7CnyoWVfuHy+2jp2l5tMmCehxr6GeTddTy
 XTAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHtejsXWyKcirwESxlwNZPZ+lf1SzK02G/MTd8ZGvqRXD8rQN24Z9u6fVbwVcjvygSdy/EaOg99l0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxST0QMrkDVV2wZZOv0znPROiQIzMJKJVR7teYXj3DXeXIZ1pVu
 byRNi62iLzyPgFqNEhs2TGOyYs0Fgv0QzCaTskaVF4JJP+Jz3tD16T9mir7/QLBFlpuV1d8/pq6
 Rz/C+F1ooZ6h8zAIVHhMt4RLUKiaFD6uX2fpTywx3Zl35IHf3armUXrvsmCJ06mGIu1AUy2M=
X-Gm-Gg: ASbGncuebfRt3jVRaJ72YTG1CEAnWMS+Rpmy1xp2dwY7w6fOj4QKQPd6/MMTN/c1pHS
 npng+RSTtOHvsi7EBQviCMzKq4+BQVoPW1OZWme6HE8GAclgjfYiZFAthxa9vTZZ/HvO+DcLQ0r
 u96w/OPCqToBgnjKaV9ot2Z50pzchkUsLVeBEEZY0a18QgPB6TSqrZMmM8rO+JyNqkoQyPFoKoe
 RPOIZmCFHIe9cD6948VWc2/BmL0brXmEw2+H1zS7PBklYHeLx+XknqXlCnK5+GPYsKCksBiyZNh
 DabiTkC2qip66R/kT+bvKDhPDD4s3VVkcTSpjMaCZRF0/SbMuvOcl1P91a7aR3655B3ZPP6FxQP
 n1MlosOOMEi8VhyXE5bFkRluIYLVMLD4Pq3l0gL8TeL/vWYLA+Mo1
X-Received: by 2002:a05:620a:3704:b0:7d0:9782:9b05 with SMTP id
 af79cd13be357-7ddea81b3ccmr2041494585a.25.1752496041899; 
 Mon, 14 Jul 2025 05:27:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/DL8IYvSTdgwjCn0jn6ALMNC2tGNJGfPy5aqEL2dhHJ1me0Kau9nI8+0T6UE91J0zx/Y4eQ==
X-Received: by 2002:a05:620a:3704:b0:7d0:9782:9b05 with SMTP id
 af79cd13be357-7ddea81b3ccmr2041490285a.25.1752496041286; 
 Mon, 14 Jul 2025 05:27:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b6b821sm1945844e87.182.2025.07.14.05.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 05:27:20 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:27:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 04/19] drm/msm/dp: replace ST_DISPLAY_OFF with power_on
 in msm_dp_hpd_unplug_handle()
Message-ID: <rmlgjr3fzb7dmnwmthf5bj67wb6fkcksmn3ouchzsvhhgxiv7h@vwcieejcufr7>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-4-33cbac823f34@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-hpd-refactor-v1-4-33cbac823f34@oss.qualcomm.com>
X-Proofpoint-GUID: -RDcw6PFFwYdtslTjHt2Ob8Hh_JoWysK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA3MiBTYWx0ZWRfX25gsvnt58VwY
 vCEnP+1Aphn29KqXU8/E9V8mBWw1brrPHhaAwL1mcTvXx1H8KT0kclZ9XMQXmR75OyjWba1PBA2
 KBQduGalESu7+QXLSYHs4iy9wGkY29YS0vMKQRAEU69of5xyJD1p8iTYWLR3BI90WLug/DOHAcT
 L7H2XaakqhufSjkWfIooO1EUK8hv13jk95w4PaOjfqHPPomeNFIMm13Ovps95GS71SL9KFfn2dn
 v1w3oAtQlznAf+i+QDvF//TTvvbRWCZDg2qUa1kTp1Zg81YejhW7ruDY7KaW6pAkukGsyKUOP13
 ejrSfYePAF7ErIqDo7BLwNerK8xkL+3iNHO7hZWttI+f09nYZRs0zraIj9xgifKUDopGgrVvVdN
 eiDbXVoDmpq1n2UPZAHLHiJwfd7HKO+2XYGr6N88AQgR39WANft78ItMKVLzITLPg4dP3Y+Y
X-Proofpoint-ORIG-GUID: -RDcw6PFFwYdtslTjHt2Ob8Hh_JoWysK
X-Authority-Analysis: v=2.4 cv=C4fpyRP+ c=1 sm=1 tr=0 ts=6874f7ab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=JFUgQLFdXU3b13EZuZoA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=753 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140072
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

On Fri, Jul 11, 2025 at 05:58:09PM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> msm_dp_hpd_unplug_handle() checks if the display was already disabled and
> if so does not transition to ST_DISCONNECT_PENDING state and goes directly
> to ST_DISCONNECTED. The same result can be achieved with the !power_on
> check.
> 
> Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
> Note: Taken from https://patchwork.freedesktop.org/series/142010/
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please squash all state-related patches into a single one. It would make
it easier to review and more logical.

-- 
With best wishes
Dmitry
