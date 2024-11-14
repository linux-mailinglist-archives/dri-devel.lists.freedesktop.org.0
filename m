Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DA39C8C47
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 14:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7924110E2B5;
	Thu, 14 Nov 2024 13:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GghzDWtq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A2A10E7F7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 13:57:26 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE7KOAR027048
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 13:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 r5goF3KV2cIAs2QaOfnwRv9qRBAvGbfSx7o/YGvGW+Y=; b=GghzDWtqvmaAP1j4
 vOufLtvEUGYsuKGXjo0khJzFlWa8OWZEbRzCGfwLcxiNEwmPdz9i6O18u0PmdsCB
 Qg4gsypOsQnXSHk3eNJbpbJfSIsRTKAaMN4GX1KSlxBAvhAAzQGk3oPUdVDi0eKP
 8fnqxwXBLLeMSEVgPYggKUP80cCTkHByZe8M4s30d4HeoJm+iCeSeJm9SsMJK7MH
 v8MvMcjVGohDJ6h9Z5wUOpOv85d7Z76mqB5mylAtsLrJqZ9hQ8ctmVo6ennA6UrG
 iYs04Fe9eOtp25pGgtIRYiQcYxDO6vICtr56lh67TktFw09+0gqDu0HbFIddKAQ4
 tzQV+w==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w10juua2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 13:57:26 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-3e61c30daf2so22780b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 05:57:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731592645; x=1732197445;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r5goF3KV2cIAs2QaOfnwRv9qRBAvGbfSx7o/YGvGW+Y=;
 b=Bmjj+68h82Ef6n0eC/y/5YGhFpuCzS0z+I8W9s/1qc6Y5kBV2k42mIfjyno/87+l6S
 RPdRLpVTw0kgXiS44Uvt0tfY6Zq9V7GNWbw5vADk8deAWmufEv6ZpOd1XXQC/4J3VYV3
 +BMdvfB4yUNOvKSk78kY902DSLi1X+P69h4m19xNSzp4F/zORNYqEsOqyNvibojTKWYf
 tOTAsewOgZP4kWn8aBwlW3Ghf8cQXx8/O+OZdbw5CTw6LtwXgzftVLN/YC+7UqI9vqRi
 URIyX6DDDaWoKSTvlFe2627FpcuD4UFJ0NIPtv1tw24LW6Sf4C9ZKQmuOIxnhqw5GYUk
 ZcDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIy/vKE7xANuBit9sT219izKrvRvRu6BFyQWYmJPpryqW+zEe8iQJnQ2Wu2wOniexcRzgc5GoSHLM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz2hYEyMxD3nj6zv4+T8rq35f70t2H/0ygFr8pbrTJxwRmaX0/
 XLx0OGj1rfuD0fnatIUN+6cP1UmSby4jdCKPFBwZ8nQn0lF85js0dVi6KlAFyBe6zH9o3MiVX9O
 iyp8zPWUWNyi6Bjb6o3uKsZWmZIhxFDhriSAyhPgI2LSA/mhKgu17iBK0aQOeHdkMmVM=
X-Gm-Gg: ASbGncuvvm96AMrNfUHv3VwgURhLxsMTilJ8FtImjkKc4lTZAee2PCCtXe3hM3gGM67
 +H1aBy7GmoUo5kgf7/Xrd0dsVsOcMbVjpjaP/EFX1rh3IrR6sNKCJSrgu6GakVgKOgqFrLuVowu
 Hc5BbkSfj8UimfVR9j3IZdU5QYbCTKgFFPyRzUQQUeMJNiR6NGbo1FPmExcvv5S/xDLcb+Y4cpB
 hwZ4N6Be2NwhtWEF9OmQ6nB37r70+okaIFHbulqyXtYQGZM46IUVCdEZHqEjbdaEV9asoIkYlyA
 NMFQ0cOiX0d7EyCA34DpxdIqsE4vyaY=
X-Received: by 2002:a05:6830:f93:b0:715:4e38:a184 with SMTP id
 46e09a7af769-71a1c2ad1d8mr4817828a34.6.1731592645265; 
 Thu, 14 Nov 2024 05:57:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6WOi/e6VYMuaESWh26yXjsRegZdqLm5bTpJ4NEg8Pa4CgUSOaZkbMvHVfXE3iWkVhZnN9DA==
X-Received: by 2002:a05:6830:f93:b0:715:4e38:a184 with SMTP id
 46e09a7af769-71a1c2ad1d8mr4817809a34.6.1731592644879; 
 Thu, 14 Nov 2024 05:57:24 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df2649esm66079966b.39.2024.11.14.05.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 05:57:23 -0800 (PST)
Message-ID: <49b50756-bb6d-4863-bf19-f61057d5861d@oss.qualcomm.com>
Date: Thu, 14 Nov 2024 14:57:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][V2] drm/msm/a5xx: remove null pointer check on pdev
To: Colin Ian King <colin.i.king@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241112182218.1119158-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241112182218.1119158-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZPKIruz_Cv1Goo5UUVV02gtVDz-DDEz0
X-Proofpoint-GUID: ZPKIruz_Cv1Goo5UUVV02gtVDz-DDEz0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=801
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140109
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

On 12.11.2024 7:22 PM, Colin Ian King wrote:
> The call chain on a5xx_gpu_init is such that pdev is not going to be
> null, so the null check on pdev can be removed. This also cleans up
> a static analysis warning where pdev is dereferenced before the null
> check which cannot actually occur.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
