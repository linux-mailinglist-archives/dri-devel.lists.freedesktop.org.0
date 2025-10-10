Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABD1BCE35D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 20:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031C210E150;
	Fri, 10 Oct 2025 18:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X+JWwdZd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB39510E150
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 18:24:51 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AEx40Y002873
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 18:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9upVP/EYtvQuDS97rpn85pAn6Fk2yzF+mqttaZezhaA=; b=X+JWwdZdAeZ3rDg6
 97b9XDrZ/xBR0ZSPHDZS3h2jz4QC5InXWMJqQ1bQv0nAWAQNMBTcASa84rg8MPxQ
 EgJKPsqcBKkMoofLZu5cj57izKqDqDlRvIpFC3qWsPzAj1onspnHiqMCWOxWsrDQ
 qRW7dRCDAlThIgGOwZN1sYVe4twiXPXggsd4a6pFiDQBItqzAyL2nr2psV6iZuWO
 USVwvIUJZPpATqCcYysbx1YyaenK2g7jK0qs2/EWieXSkkej1222AWQKWr2rpDV+
 dBUX2oxt54stYhZd/BW8uRvSIU93lesPCGWqlxrIAUO5lrZrwRH7rfqDmhlpHqRy
 VjhQUA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49pgdsuv0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 18:24:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-85e23ce41bdso104098085a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 11:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760120690; x=1760725490;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9upVP/EYtvQuDS97rpn85pAn6Fk2yzF+mqttaZezhaA=;
 b=ksxakT79XGcA1yZR5VnYwc/tkGH+oAVbbfLp3nMjwIX+TWMWr8xHcalyaHJjKyVcIR
 xwN9fuym8lVUxRApSt5GnATq4IZi4ZRquMe9fGfOAHRQHIwO9EGxlbHdjhGW4o7OrREX
 usm3potQ6tvkjJbUkbZRPB9AIjAGSneS1x3qt15iTedJT/vVrhMtj8lRvwcGkD16ZhWx
 sJWFvCvEDrPJ6FEl4pOk/5hk8mDuoyCpRQkD+7Qz+aP3kHbsRN/NlH923daUoLnIqlwe
 62PNIg8tk2zD9ZPBo7di9xj570QciwVwwRKumpN60c3HhR5sqyUhUslnyim5iHqhAfd6
 z2cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC+ud0f+tBpU9IGAN3kxGjOFv4WI62O+lt2TUF69qy0toOgeWVaUE17n7ROa56VoDKay5Qk6KoUv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzW2Fjx8BOMgS+l1ROiIntsHo4fWwJRZwRlywzrifEFlzzob+Fq
 zQpaQy1pdQ39ss2zGIDYYYzRLwFApZutIchlyXt5GZFwhOK1cprb1nrcNyzYQJMjv9KH1Y7iAc2
 KFZ25oyWR8rr8l6Yy2kpmmVCC/1Hppyvaa5c65GsAHaC6YQpTSl9td3cTITX9nzI07SO4Q1A=
X-Gm-Gg: ASbGncvCrVJtf3Cn99AUitqLZh5iMNhU3uwRIKMUu9W+1kHY4zp8PcLsZPcoBDIlK5x
 ktsS1fKqn61dmw/1Dw5IlZG1ta1yq4vpCwhXH6i22uOXJUIJJzF0PXOhpcknGlz29jwMDxbq2cE
 HgIwLFSDORL9vywcgihK+nYcreJ7tueKBIHgXsM9uUi8NS7JB2pOdUIRZX3b4RYb0rz1URXi1dN
 /gQT/whcMFn7K+MfI+DKO5Xye+rqmj1gZXChUVvSb8vlRJNuNeEoHsjAVrfIyCP0vvBgbNYyZng
 JDf30EZG5ZCC8pJP/jzFngAiLuewp7ThnzFcNDSa2l/PDi9caY1DS/BSRd0eJdbOKIimUGXKUvT
 A8RoB+jW6U09l4n4So03AWA==
X-Received: by 2002:a05:620a:3905:b0:878:7b3e:7bbf with SMTP id
 af79cd13be357-883527ca0b4mr1292956285a.3.1760120689955; 
 Fri, 10 Oct 2025 11:24:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJDHOXXLxWpzMVsdELZY+jNe3rRfKX4hd2hb4fDYH/CA8/2CoNx4Yo+5Y9x92+KWGKQNrRvw==
X-Received: by 2002:a05:620a:3905:b0:878:7b3e:7bbf with SMTP id
 af79cd13be357-883527ca0b4mr1292953585a.3.1760120689465; 
 Fri, 10 Oct 2025 11:24:49 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d2ce9sm288483766b.35.2025.10.10.11.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 11:24:49 -0700 (PDT)
Message-ID: <7f10f4b4-a5d6-47e7-9e27-8b6e48866e8c@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 20:24:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] drm/msm: Workaround IFPC counters bug
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251010-ifpc_counters_fix-v1-1-9187962b7d20@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251010-ifpc_counters_fix-v1-1-9187962b7d20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qXEPjvx_XEnRqCC4Gh6p8vaIKHoZnua1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA5OCBTYWx0ZWRfX+0CcdEtFChBZ
 yWiXGCoE4fFYuA5iUT+wmGzvTvkgQyPIAglasU59yFDWLy1256hSLgesxgXtg8FH47T2FG/8N7p
 ls85243VXWD8PHR2G6QS8YsbCtL9cek8p7PHtmdnaMd97gAKYDkvzE6ZG5HdG9kEgbioFhSHqrW
 eEyk+rGGyBOI2lT4GfzWXdmvn8UIiTG7gi2RlwMg84I58dPF99GeqaoS11D3YCpUECxlZXmvwrz
 hkR4TIyh3V4hCUl2W4PHkWw2GTtWr+IBOaQ5MdfW0QuI6heeLzE2dyR+9qoczcfQKSOEju/FPgN
 WzUX7S/Z1Nh6OkuLGCmpCRAFzJMfB4teCrQTGh10yNOqc0f8/fIPwAuduX+32hoWTbmUUeCy33X
 R6zCJ8uJLpBXOYYRHJ0Y5Txo5EOAvA==
X-Authority-Analysis: v=2.4 cv=DISCIiNb c=1 sm=1 tr=0 ts=68e94f72 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=LTEgcuO_lhVDbfJd3wgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: qXEPjvx_XEnRqCC4Gh6p8vaIKHoZnua1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510090098
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

On 10/10/25 7:49 PM, Anna Maniscalco wrote:
> When keepalive vote is set to false IFPC will be re-enabled even if the
> perfcounter oob vote is set.
> 
> Workaround this by not setting keepalive vote when sysprof is active.
> 
> ---
> I have little confidence that this is the proper solution hence why
> this is an RFC.
> 
> Hopefully something better can be found.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Your sign-off is in the non-git-logged section here as well

Konrad
