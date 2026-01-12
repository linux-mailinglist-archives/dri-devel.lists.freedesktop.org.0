Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329E2D12227
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6D010E37C;
	Mon, 12 Jan 2026 11:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N92VpAJm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUuCcF9y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCD310E0E7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:03:16 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C8BkRS1238549
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Dh7GwtFX/nRTX/eU/m8L3lQyGYVksdn9wMWspYflDIU=; b=N92VpAJm2B0J72Xz
 ZktU0OSwjYr40awJYJIiU0YSL63Z6jPC10H6sqrh9GaUnWrtGnKWuAX6CggLNoWy
 yBrm6x1NOjdvs0un5q049WP1IGK1ZOGkD6IRdsDUc3AI/DAked3UKd1oX6wOG/ly
 RmC1XpK2VevFfqM/FiS+uqJda2Ij7ina/r14ks4TVFtzm8xQXsrM9Qxuh8xQv7A8
 Goi+ZuqiMPK6f+G7jXWCwX7Ha1ux9ec+FE4DL5udZTJEfos9q7L1vWemr7tc1BxQ
 xVo4UBaHieS+0XX9Cj124LA8WKgJ6rBEoffaDRmJMulRYWh3dTVPphGPLnNGY2Dd
 qYQWRA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxfvm78-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:03:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee05927208so23007391cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768215794; x=1768820594;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dh7GwtFX/nRTX/eU/m8L3lQyGYVksdn9wMWspYflDIU=;
 b=fUuCcF9ywq1geFdu3IwNyZe8rXT0PBz1hrsFYyqQdCbdym4gP4Z9gI0+oEC+fbg3jD
 NYsccIURC2E/QthoZrFj5xFwGeHtUMGpKd9HIVQaXZa3Pq0bHmbw8qdAzsog4iOKRfHf
 5LNOl7vaAiV6gdtOTOBNthSIR7apwlfRQMneO5Km2WRxUoQ2tMKL+OUtfjkWj1nbpLDp
 dxRG+Zf5V241yt+aA10NT+/C/4mkHxCvIfNmjEe591w/UyxrKYrVbqwooU2v2aeZdx2k
 CQRgAUXCKJsm6giWXgCYXdEx/sf/QSrCduONYrIymqyJ8JyfDXa+FHlh9j55LlVJYzQm
 11aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768215794; x=1768820594;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dh7GwtFX/nRTX/eU/m8L3lQyGYVksdn9wMWspYflDIU=;
 b=N9znHgFGSUc25lml4piQ0jIpmS1Fdx/CulylZltUYKHcQXr20kHJFbtLjNj/1ygrTf
 lf3XdlKwtb1GpXus5nNEN3ZgCoBD62iOBTT6a0PR6mpAIHeHoXswB3Bg+VU6gzt7g6wY
 jg0zzchXqqIIiFoc0r9AqUeFZ/lTKogNDp2oRrojPRmk+kPUhhNPFgHi0Z41ro4QaYw/
 YgnZCIo3O0FDhzleV26ZlYb1MqoFeanWAr0dU0Y/Zh/WdNRp+56r1XW0SlLicBbh7Jjn
 aklr76EosJc2FAQQ4eku5hCbk/otkmahHAe2+fF9V5toPzwoto+7yLurVTSfqPBIrzj3
 DVog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaOe6wa3GBK6ARZfjh/mAj7Apqz0gj9fmJin2L3LYyxiA2xN/xdQrFU9rlRzdPb2xF+ETtJgnL94E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7eMtkBildx/HSe5PiHftrB9HTIZLh8NIrHtQ5n0u5DxqBpL9Z
 lws8vvXA1O44ezldWfWIwKsk6gZkaKx12qI/GzSlw4kjOve6NZ1jk28GNvWW43g6LuX0AnagLdL
 G5EqegJyZc+6qpwrgx+q0qiiyeY8JAKsnnxroK7qhu9NT5LbxXOoNfrMStrUQNbPBdIvdeyc=
X-Gm-Gg: AY/fxX6VbvLKf8+Z/jCFGLBFYbA7zcF6FtjsaJvLHyDk00j7WZ2ZPStPnx1IkJluwAx
 pVBWrSMKJEX40kMIwz/9rXyMzR/E56hltzTq9K+m+YKIpkd9XxbDe5mVT9fCpBZZB/Zvs/L9v4I
 3uw+oVOvhsQ4RS/4iWdAI4aZ6UDz2+HiQZi6SUarU68IsZP4nxouTmWlHA5tttS3YbkXgWLtuHJ
 64i1fYJIZ3My4apcTv6JT4muKB3PaYjWAQ4oLbBOflOG/67t05H3ZSkeMXEOjlJVX0ji1theylS
 VT7jPlb47sxFovWAZSRwkPysvyGtT5ybyguFzUN6iMcnoFWXoyPEsX0HNgImiVaQSfprqFhjk/J
 nuH5ArLPWeQX/LyS+fb0b79wq0DaNR84IF9x+lVzIaJL4+q8n6QjkyTlavZJLYiHVheQ=
X-Received: by 2002:a05:622a:5a8f:b0:4ff:b754:3a52 with SMTP id
 d75a77b69052e-4ffb7544295mr183416031cf.0.1768215794611; 
 Mon, 12 Jan 2026 03:03:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPdWC6RVtIWLJZLBsPSoSldl8ze1rlBRJp0qiP2IpWdz0SLjxgaaX3bN1FJ0pL6PgEwpUCsA==
X-Received: by 2002:a05:622a:5a8f:b0:4ff:b754:3a52 with SMTP id
 d75a77b69052e-4ffb7544295mr183415731cf.0.1768215794228; 
 Mon, 12 Jan 2026 03:03:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b872642beb3sm153934766b.46.2026.01.12.03.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:03:13 -0800 (PST)
Message-ID: <5865a207-16a3-4448-955f-beb769c1931a@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:03:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] media: iris: don't specify ubwc_swizzle in the
 source code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-6-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-6-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ddkamJK-kJIY9wkCEHiNpU3YN-zC7e0L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NyBTYWx0ZWRfX6d0pweM87jm0
 d145x5mkZA8oggpYc36OOwNYJcK/9V4us5cSoSod4RpTVgZ4hDaOK5tPu8/XiRnRBVelAPx1fwd
 HhBfyLa0MGnHZ1Whg3Oh9cIddc1Hjlg3wo+r8IZo+QYGg6ODSfu4OQ9L4+sgGwVqIINQWMJkq+r
 Sp+OsclcOcpy+GBkAJe3aeEQ0MkfJOQhv4W94rheWseI8dAfAixGd4678dH2D1lpEYte+hWT0U1
 j4kv8z9isyfvs41i/75GsjCqUw9OhcbRmbnd3Y7MzJWNfGjG/kRMltXzrHxrvyzWgBLZa0dfa4N
 DdvXrcEI1ySVYBhbsXHZGpR1OsYxZ6/p3M9FDOeiiYji3nvMVw/ZZTpyM+CI9W77sR2KYMLgxKF
 t0Wpd6ja4gcY/fYsji/rkGYVB1xaBAoV4Zs84QZzT2GFGpylY69YD2/m9p29y7EsPoWvOublSA6
 YGXxQ3pBVlI/zLp1v3A==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=6964d4f3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ss-qTuU1ZYQsC6pQTdcA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ddkamJK-kJIY9wkCEHiNpU3YN-zC7e0L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120087
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

On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> The UBWC swizzle is specified both in the Iris driver and in the
> platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

