Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B035D2F23A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 10:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D399710E847;
	Fri, 16 Jan 2026 09:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MPe3TG6O";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U5WMVL8T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF3F10E841
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 09:57:49 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60G8HLgY1240968
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 09:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c+uJpy77A6qGXpHZGMOoyXWjGDOHGU5pnw9fJmRASH4=; b=MPe3TG6OQrHZR2J7
 I68gPXZBzRcZb8aZ6IjvZYHhejrHi0r5jdUyCD4zMzYPjMX5ty5lBTadI/aTOlpu
 bYaDvOgfluJvz+YHvNhrpMHyyjXptKjXY+07AyoxGI6ZawllpE00AgaZ15BF1v9w
 LLXbW6wx1N2aK7BSy2zKgc85YGDjgxMkvAQtN6mrid9HJ+u/MFwLzafur0S2BwRm
 RF6rz8UncEviMjabb7wKvXSEnetymItwvSkI8lYGJ7C8rGsL5WlUuzG7jAsStY9n
 YXjJ3xUydfXC5FIroEHx5Z6L28TvvRBhFb8CdGijr8tCbM5pNOhwrAe7XKylXGM6
 wlKt9Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96sspet-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 09:57:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-501423e1faaso5389141cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 01:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768557467; x=1769162267;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c+uJpy77A6qGXpHZGMOoyXWjGDOHGU5pnw9fJmRASH4=;
 b=U5WMVL8T/wmp6JKnAZvCQFRCHFsRJccpz6onI7nlhsSmFf9L0b02lgmgHzBTMm+0Zl
 hkzriOrPbl4SLf9KJp1hio79wXNKtztDOSM4Kkk4YcmgGCej7vuUAyyckk/lQew84S6y
 pbcfAAZ9+KxSjJnGRwmjPx25KahvTF1xo6jYP8B0KBwR3wVecESZBPCSa6coqjO2juJx
 zPHzFmhmFl74na2vyvO2pwBV/Vc3tuGtzrgDbX/6NZO9Zmafa6hxh5yx04WxtXmhxxWo
 lPwwSUEiN1+baDGA003SWjVIS5we/oV+xfLe0Ski61lGOrzs4rkH2gTkVRijKey0KbVb
 stMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768557467; x=1769162267;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c+uJpy77A6qGXpHZGMOoyXWjGDOHGU5pnw9fJmRASH4=;
 b=Y0tGoaSBRvV8sP5mQ4gWEmkKS6W8QvILJoY0+eaqSOwzq4HtH0ITDoz13AiNnD22zB
 pHRoYUDODijZ0z5YZfA6Q78Csf3d8bhUARifYzmkh4GRCZXxkOuWrxyjWTH5bc3Von9K
 I3WL4Bv9jjCVxaH+/4vJYJVyyWQfbjGEfzP3cMXaiehPh2AMhgrvi00sM1/QAaWvm0Ba
 U0OyiN0iRoKp0P7X4hji1+RDG1pOlyWCmIYy8Ak+cRHiM4g0pVnMlXKEGrRh8sv2dOBl
 De/x3OqIudotyyT6ts85lAQ7CrmsZHgDFT9f9LpWadIPDA1omuMq7TP5g59hKEnAaUf2
 oKqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbCnw7WxxInuuBAtqAXFHYh7MP2Q2y9+FyQsHnECIvNlapLmbTmrj6XQLBgKu+EMvpBv5/kczoNXc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9U8MG7qNYtRper+wjlY9ZqzjhC9rqOtQwAvM91VJ1y06EqZoC
 CJeH2HUiwT+ZVWTP0VNdZg5QD/DAsXIG0JOJSav4JMW2jWv3J2iSQkESjyRkk5Ux3tWEk1ACwoc
 o9D5GFNsGFeb2jIdG7kDxAidWkkSI2KgOhi3NSBOP6GFKA6f/bKXZYKqtKpxGay+uoAlW+cI=
X-Gm-Gg: AY/fxX4uloI90n6lNQpNeNE5ChpT1Tml/45otKuRnj/HHXjPtR9oWc35umhKS3PTlYi
 ct5rw/eJtvD4GM0Ar2BQ9JXstc1dC8b87eEpzO4yHsM89lKrFLi2eYkjdRaoJU5O3jdtyq6wUmD
 EZBXoPxj5dfeNJj6PqcEjzLuMD7r7QYkvS3p6awfaDgaaXwHME+XAy8pEGbgQ6IxciPvTT8i1LV
 N2fCrOn0cU7uFlLN+dt486TTEPYGAw4ZzraKxFIciuckoGtMBHDUuN3C40WVRuGmTQz7Wf4HcXY
 SKhxcCoTCy+0z660zZe8kyIDH5SwgrxuRG0bDuN6rn05RBhIyC/tx5al+aDgk5UssQsuTKcq/hv
 WlUeMvT4aEjSqMlHwbXa/Q8XorIkYg11YgQGakJ3FA2ONiv6dkpzN4bOBt+RLWtNTwuw=
X-Received: by 2002:ac8:59cd:0:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-502a17d68b2mr27218281cf.11.1768557467433; 
 Fri, 16 Jan 2026 01:57:47 -0800 (PST)
X-Received: by 2002:ac8:59cd:0:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-502a17d68b2mr27218161cf.11.1768557467003; 
 Fri, 16 Jan 2026 01:57:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65452bce4c4sm1912925a12.4.2026.01.16.01.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 01:57:46 -0800 (PST)
Message-ID: <3019516e-afb7-411f-b80a-716540a3f8f5@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 10:57:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/dpu: correct error messages in RM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
 <20260115-dpu-fix-dspp-v1-1-b73152c147b3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-dpu-fix-dspp-v1-1-b73152c147b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -WiFa-md3SH6HFTdv7XBmCoB7N-RjOBZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MyBTYWx0ZWRfXxaDxtAyvS2zc
 Dtb8uKT0h2N+ibntnbeL8biSMysOO3H0L5wLvgWFj3NP2E97S3mRYdfu/6vHfIhqXR+tn4IN61S
 cwkys0/DJePogxGMc+4GKzVlX+n3g14XUld7WvGEHCPwauy/RoOdPrJt7AxHd1uR0HvF9wECoUx
 C5f083Oud3IwkQwMlgjd1RLxm5DQh1PQFBolbPgrb3X5jTXjLkQcUSwQ8rsN+Chdw0qOrEMCsv8
 zGQwKbXyYhdMmjO3fux5YTLoiTzy9gHEoKHziLm3SdN1RnjnaFZnoA1bxR14Bw6YIIuLGMlt6Lr
 TJO+O88xXm1lcOAEsOswq8UPwWsAiiyeXYFt1NvQEnS49We9UHJydOKY1D+evTFJf0dS11TYL3r
 cm/D2gI3kSD3IEm0sqVQ3FMWf9g06Lr7N/0bqLgv/bQAcj0zhZAF9waULqJtd17Hr42Fd1nNXlL
 dYDNnV/y2If8VX1YZVg==
X-Proofpoint-GUID: -WiFa-md3SH6HFTdv7XBmCoB7N-RjOBZ
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=696a0b9c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=W2xj9Y3iJeoAxjfXkiAA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160073
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
> Some of error messages in RM reference block index, while other print
> the enum value (which is shifted by 1), not to mention that some of the
> messages are misleading. Reformat the messages, making them more clear
> and also always printing the hardware block name.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

