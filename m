Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288EDB16E6D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 11:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FDA10E73E;
	Thu, 31 Jul 2025 09:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9/WzznN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3672E10E73E
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 09:21:29 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1fcQ2027103
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 09:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YKaZRpzTXWacG09Osv90jCxKbdHhzZHJjXyXniyeau8=; b=W9/WzznNX7wf3bVn
 78X4fDfQWP+G4fVjX5RCjLLMJDMwYF4oThT6Dw1aFomF3a4dw96Dw0bhCC1qWO7d
 4ZRyIkPpan7q654q4SyCbxCzfrRUUYLH0BVjKGuFoh6JVMZSeFC9YleYNCEEHb3/
 W6xjDHor/kEBI7SeO+m/ch4PzErSvcaq4xhg1EzYvFhz76odXn9nadDYjcW0H66F
 GFKLMett4EVPpMiLM6M3abB5/7VK/LvvizszwxxNJz+yw4R0tmhNvyZlAVw8vMcH
 psHHoLtx+gdjjdp1nZ1+FZBTFMyf4/IV5PDzK1ElfU44LBg4N5gvPdh3e/JtvhSV
 WJWocw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jweujsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 09:21:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e33e133f42so23949785a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 02:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753953687; x=1754558487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YKaZRpzTXWacG09Osv90jCxKbdHhzZHJjXyXniyeau8=;
 b=mUaOCEcE7T3LAIEwzXLZ/IG6XZJguFfGs2i6KkTKzMcaZKujwAfOJD9HzGYn6U+/ck
 Aw3aDMCy4B1mM6ND9ULzQJUJThcc5EuToL95M1V6aqoHdHefi7Y2MTe/XKN6E0NpwPrS
 cc6gMj1GPkLQZjCTw2o9acTSvLKaquSxG499jykNs6yq22oww3tu/nmx/I62/JEQECr1
 komV25Bvo9wUafVBEFuUTbXsRxyynHXucQHriMIvs7t26vF1kkVTWUDuG0rkMlF2pMHz
 TcXOdHCh4PKLj9vF5wTu/q1UUacG0fi0drPUObnk8v2uFuc/dtxw0aFg7NUAYye3yYml
 hY2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP9c4l2lQGXzktwRgNZL0yOKB02oTVHIoSTqHQcI8lYfGZza02wwqwRDfR0hXIRD8nVQ8Fa07HVZ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxO9iCausiH49B1pFV8sr962X3+LA2rkwR6hQrJgGAdkwRfAuiw
 CGbC+PicMYNc+IgZwW1Oz9AfsB4ibz9FF94Ic0GtCR+w0jPj/gvvhIa63jWw15ja27SUuInLMzv
 xfZ6oNOLRgeinZo4bsRuUWeeC/dYbLrPWnqmNDjln8bF2TH9lru0i9nQJT0dhCOWKq0T5Hng=
X-Gm-Gg: ASbGnct8s/RK5pCCh5GOl4ujZbDCfpSV+ZLvbnzOUgJ3QWE/87rKKbgbiiJfBAn6z9e
 FvIhof9XeLmH42B/4JFnSyq0Ri2af4mH3F1CiW7Pc39vp9O6G/gZuEa6hcGrshaUsVcbqcelXf2
 bi8mlAWqDUvgIqfO61pIJTcETMGW23LnJLQ2Ce7UNqGT6ZIRyhb+BI2bOLbANDu6o2I+sORT7ra
 iQg8khCVEx1W360aV4HuzLfuzKeROlqcT2VtDBduxwjGmCMZK21dKrjKmTyXtt6sw+7IR1rchik
 MgAOeVwPuW2897xgr8Y+b9o4pHof1E0dygTixi6SkWarEWN/EaPQlXXajisuuMyxvhv5rADWEPF
 hOHA4JKuIylcj8vhPxQ==
X-Received: by 2002:a05:620a:2546:b0:7e6:39a2:3ebe with SMTP id
 af79cd13be357-7e66ef831b1mr477644385a.1.1753953687514; 
 Thu, 31 Jul 2025 02:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEalnbAwcLIJLmez0p2ygenNgK4rxww+Q/pnP8/kWW85eDmOZo38Kalj+JOb4MmxyAgyaqYWA==
X-Received: by 2002:a05:620a:2546:b0:7e6:39a2:3ebe with SMTP id
 af79cd13be357-7e66ef831b1mr477642985a.1.1753953687115; 
 Thu, 31 Jul 2025 02:21:27 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a14a0sm79370966b.33.2025.07.31.02.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 02:21:26 -0700 (PDT)
Message-ID: <b34ae465-c227-41eb-8492-4a2e761cb3f3@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 11:21:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2][next] drm/msm: replace minor->dev->dev with dev->dev
To: Colin Ian King <colin.i.king@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250731081854.2120404-1-colin.i.king@gmail.com>
 <20250731081854.2120404-3-colin.i.king@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250731081854.2120404-3-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ggwtvmh7hrP2sQq-4ycrdrgtpVCHE-nY
X-Authority-Analysis: v=2.4 cv=Wv0rMcfv c=1 sm=1 tr=0 ts=688b3598 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=fM4dGe8XGJNefiYG4oUA:9 a=QEXdDO2ut3YA:10 a=LXDWoPVop_EA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ggwtvmh7hrP2sQq-4ycrdrgtpVCHE-nY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA2MyBTYWx0ZWRfX70XdK/2u6MWr
 F10ZwHUW+M6hf2QZACC7PH+Emelqb0PgFgmjdQKEmt+KnkQkFysoHGF6sK5wDZ4WFu6ZolK2AMl
 lmI2Plb8pIlH8LQVY+avngqQmzbKKlxn0W7LNMZlSpcww5S5VQIntpcaUIn+M55HVKuN51wo3nZ
 vPfB5ip09qbAOdcUWfY97Q2yvFEDXyfmHWmHSmx5zs5fP02g8wnbn5eaFtsPRdMFVbUxuTphpxZ
 sKwImSZIGzMNlK3uVtyx3fxzqv1PglGfmZ2WLjqE0sXJTk1Q0ZELOUciLgMce7gCWr7tL1ikCYX
 rg50Epx5VVslUQmMprn88MQdQSt4BjzqbjyFQBmviinBRwgiCj98WZHX120ZsAO62ccOnXHXysK
 c6TIZZsCpBtBOFSeGjZegLg/ExroqQ7wCY9s2PdNC5YSxgfaJ0ECqUiRToFfH/qSUQPZQzF7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxlogscore=747 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310063
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

On 7/31/25 10:18 AM, Colin Ian King wrote:
> The pointer dev has been set to minor->dev, so replace minor->dev->dev
> with dev->dev in the DRM_DEV_ERROR messages.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
