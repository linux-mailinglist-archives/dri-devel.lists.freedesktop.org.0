Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E22C7D176
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 14:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261E310E02F;
	Sat, 22 Nov 2025 13:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="huLfRaLt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGbwuo0s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601DF10E093
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 13:26:15 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AMChcaN2700318
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 13:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 p816i1l2ZUk+XpL8HTMV728bxJNiG/n+hICNaw4PPk4=; b=huLfRaLtCRg3wG5i
 9Jz6fXdrwLCSsGeNh/djN062Os8Cw117+qSRGjvkb2tmDKPbuwMDABxuBqUCwGY1
 MWYh68Z0tHsspNbr9d0Is5h3G3EzIBDg+d3O2KolmRv+JlASsmrL3uf16xzK5w9p
 ok28lGtmSCNMbYpcRDnTYJtR9OOwM8zX+ocJ18isrNg7NDVL/ZP26uTiObQHDHMZ
 2AwSWUqQPYwOfK0I56OoQoPIbhdiPMA03vzBVmkeIV7Tk1h/ZfbwrjKdkFW+XqNr
 l2p029gfDWlKkz0TRzhAifTMtC2Ac8x6mnHm5D8tkvmWDCni8qYVEsL/Aou7UJnZ
 I6Gw/Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6cdrpr6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 13:26:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-87ff7511178so7984776d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 05:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763817974; x=1764422774;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p816i1l2ZUk+XpL8HTMV728bxJNiG/n+hICNaw4PPk4=;
 b=aGbwuo0s6/NsIckNh2UlZYP/8FViNDbJvU+UIOkulD4fJf1F6rpSrlJJYHZLTk3pAG
 s/LCNqFRs8YFdffZLLiRD5zRU4f0IlVp/TXhyX3xpojTrZkNNb9AGZIikU8olthwRwl4
 D7CwV0zmtNBT2u4mH5CxyBisWhztMnOHF9HTzshh8j+UHdVKPAWXvLN5anEA0b63KuHa
 Kw86+qo10sFKODTQJBFmceJNLNAhTjUlTkzKhfW5ex6XD3lzl8AeZwsh2Oy/stT2YNW3
 MfkwkXAwb1WcRFrg5GpXSVouiU/Qqldu6Zymc2WUi729IxuiQMI6Vom+Nsxk05tKu9WT
 FCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763817974; x=1764422774;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p816i1l2ZUk+XpL8HTMV728bxJNiG/n+hICNaw4PPk4=;
 b=Q8Gec5wTvBEAK9RmQm44YS2klXgKcUnamFC4rUOOqFjK/xwx05+w+LAiKuaOK28JAy
 CZ90qBRJAUPrGMva+9/ASLZbCvcRrO6IpKA08Y+3B8KlcUYkJ4B3evGdwtgyOC25d/a0
 5wtG5dTyp1YMIbtCMczB5SOyJj5BP7xeTFC68Hj4rfF9XBYI1eOczPqyWp33zGoeUD/B
 Zgc1MWoiu5NquaIw4af6Tthq5ZCpp/JP2rteMKTbpPgoSCYX3bNNF6SZHShVU8XlhnoE
 /7HcwF690209SI7hytoC/xSF8Zrnaccyucf4yOFH68Xu+4Ta86VoyFouywl3OpQJhoFr
 8s8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6rhJrFdQO0pvXTKizDkNtJuSSY6vZ9+RqSDHF+bApMqit3p4TPdXoj2PjH5Vxmv1fmzL8Jlo84/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytmWfGfnLRCrFmujlPl8IAJ29VbL10Pqmp5mrfQcQ1E4KnbxwI
 iUoVZgdQWprfBjzL6UOeNco4/7oVRddkHhngJ0G4eW1XV0WD9pCLlLab8cczS3mlhXQh/oa8mba
 Un4EZaeG+bBC/WRI7Xq8f50Uapi0JDbp/4pG0SlhIdx8o9/w/UPbR5DdVm+7UTgscwrTJ1FA=
X-Gm-Gg: ASbGncu1vhyMi9x2yk8BwZC2O7HZb8BAwCYRyovXm1Po/2VR9SLT/PdZlL0kx0oAMwM
 dU8xGWD/PNxtaUySu01rUf+qpSm6+QJolKCZ5rOFts4vWpIEKHaeLAKMveMIkeZ81NbjSQTxEB/
 KKSdv3JqsfwfTnxAMypAy+zkk4X2PpDTCX5BSWg+AKtOT6KkYqXZVH42ZbbnwjmDN+uO3NLfYqY
 Hj6ELKf4jZPm9bDofd0TxG/9u2uh7/fBKhGeEcMENI50YpalDKl1BqnDqm3m+AhX+ambw2GiMXY
 rrdpHwNgQDnuy12VVR1jKXSb/7rAjX/N+hU5ReMtwiX6qEmllHmvXefsnSDP4agNw5rJV7jaswI
 kg6fW96eIaJuXasMrclyXRMb/PvAs1w2Oysz/2bkITW1lba7ZC3AUcBmq8kTww/bHT3o=
X-Received: by 2002:a05:622a:1306:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-4ee5b857d6amr46533761cf.11.1763817973715; 
 Sat, 22 Nov 2025 05:26:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBwKWs6nvulDhBOSmKaGQR0LDQ9X8bhB7WLU/5pQciACkOc9xbwVxBLOHfNzYoih13QUt6sA==
X-Received: by 2002:a05:622a:1306:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-4ee5b857d6amr46533491cf.11.1763817973128; 
 Sat, 22 Nov 2025 05:26:13 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654fd43e2sm718730566b.39.2025.11.22.05.26.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Nov 2025 05:26:12 -0800 (PST)
Message-ID: <bb816e13-23b1-4a2d-a384-84efaa3fd575@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 14:26:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/a2xx: fix pixel shader start on A225
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
 <20251121-a225-v1-1-a1bab651d186@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-a225-v1-1-a1bab651d186@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bsdBxUai c=1 sm=1 tr=0 ts=6921b9f6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=u8D1gFNLbthjCoXLUvsA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: KPQQXi91f0vEhm17MacaXhc1gDrubYed
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDEwOSBTYWx0ZWRfXyNJCs1PRM2uy
 BTInE0pUZfxlu1TUeulsIYRaWLN4uKJLXeNnP7ljGkVCzJbQ+A4atuKN5OBlNYtCa1K4tpC4Z7w
 nJ+yam+RKeICbKPpl/054zBgzKE7I6+/fIoiwZLz0waA8MAZFsJqyOQz0BVLHIXuy2tQFcZR1lh
 98c+EwRlLCMm6uqE0buUPy2COprYTgHvGKOlj/8EVTXGHLOaWujxwPEprxm4dlYeYHsjFx/Qram
 o4QWD/uZCW6jpVgF7OTYW9yranc4AG79IRk2sRogSQEzjiOqlUxZ5cSmTCeHug5vp8jOlsphexI
 YGy1W2uV8svZqUu+GqG5soFpo66TqFiXiqD70VcB6RmtyL0aAyJXBjjFEUUrwze2CQThmYVmhxK
 mDHmHHy1wIG0UVbxEk4hycEbOKUOXg==
X-Proofpoint-GUID: KPQQXi91f0vEhm17MacaXhc1gDrubYed
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220109
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

On 11/21/25 5:13 PM, Dmitry Baryshkov wrote:
> A225 has a different PixelShader start address, write correct address
> while initializing GPU.
> 
> Fixes: 21af872cd8c6 ("drm/msm/adreno: add a2xx")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
