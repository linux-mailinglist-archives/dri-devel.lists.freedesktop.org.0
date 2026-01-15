Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62F8D23A48
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6A910E72C;
	Thu, 15 Jan 2026 09:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIzrw52w";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGtT/0NW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293B810E72B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:41:33 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F9Trd31913686
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aaG6GhBvvrLNb8hNHGF7AbN92F9BWAyA46Rmsn9GNog=; b=BIzrw52wb284a3RZ
 ueDn6nL/2Yb8dg2oJuqBVDzBL6UHUPm0g3GmwUNP4HR0aHfe8jGK6ym9vD/m3J+C
 Dbm1M2QPulN+FLFgWlzlCB+w3QbbX6HluvfSq5+x4DIxuUlVRe1nYmi+SiLRMWli
 05w21tPq1bcKc6s8NP6y1d4tUkxAHG4r9bpu0kQrd+ZqISmydPCrtlAxC5YluTY4
 NY1//bGkqDingIxv7cjGAOl6RLsPx0Z948k5GKwA5SVuVGaa9w7laUiQzsIPZDm5
 i9nCJgn5FD97M4NZ5a8zXse9Txg2cwyyfxcaUVihxuh92PRtwtS+tLpY/MQjIp6r
 qYEGyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpwnkg0ye-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:41:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2fdf3a190so13816085a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 01:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768470091; x=1769074891;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aaG6GhBvvrLNb8hNHGF7AbN92F9BWAyA46Rmsn9GNog=;
 b=cGtT/0NWpEtgcn+Dv12LiiCl4dciUqiJbGdOcUN8PgP2fJHcL0WXKI6REZpRbden5R
 CZcCb4Qu14bWcoYIQCP6tQD1LWHpPdGBflACcPIoTSdiQ5tMuDLNxkgzfkX3kY5yHR/a
 L9GkBiw7jGDIMmNoHONTidwxnLvpPwH/SmmgcfP8v/HKGfRWgnvHbshTje0jLZ/2Qgfc
 ry7LCUhwOa/bmM3DLpYKtyyYkQHr9TvoM9P71RYtEtPjs7CPpTMIsZnVtzLmv1pBr6XT
 0jS/jGPM1S9rv6iz2dHK8vRJ1GO7WNeq8OeNAL1stM+U/jVp8dLxqI02P5akjPtk2vsh
 LA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768470091; x=1769074891;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aaG6GhBvvrLNb8hNHGF7AbN92F9BWAyA46Rmsn9GNog=;
 b=IACYnGWHcgUgwOuzGd3idIKJ9Nd2XUBJ+cV95jJZdHfAMcwAgud7ZifvWlQz1Y7apE
 uHOmuxIF33n/lutuOTs9uw6HsvgBYZCR/Ssm35uiLQZ2Fk85KqUrqNy7jRVZ4t6/texL
 XKcNXNex12wcP38Q3O+d4Rk2VZ88kWu4Me/XR4Qkyg8+GoE4YeXHmXT1U6udlArWmfv/
 cx8zVlMnb21Ap54Ff93SiOZoOAYi6wiLqkPyADg7OLLdWKO19tYT16vYdQC1DK6fUzuU
 7zQMGO+hijpGtsLFIFBsd6fbI+p/3gmYSvPvR9z4FrbT01cCa/NWGOBO0UG/yCG0Q6HG
 aIOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh5s5FxB8y2yTCgUztCilfeuJrv91T9UxN9CTcouxHWYJuBbE5XzuI83+dQjkjq96ab+UrRi1xz7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrYb7OKkwyKRpQVsnknp6pouIEQBMa45US/P+N0YbTaFP/4MIn
 NywswJX2fCIeP2bXFvYxICCP9iUJffzS00kkMqXm1qHCbeZ2syJQWGP/oxPRZSeje6vMB0EJuGS
 D05DScBrTo9xsVVsbTahscWSCfyZEonuhqvLPvD3slAN72le3U+CEt9coYOatybj6FrN0joo=
X-Gm-Gg: AY/fxX4F2bbmCTnOdgriW1DcE0ot/8DtbIoL9Gp7o0rpUvIE9kEWxEsSIQvipdZ5wLT
 bNHu8pvA0reRiyNC0RfEE4g+1OhAs615ZoBbmcKwAkwJr/bCCB7qstF23gESvZ6HRI1LXc3lJ+P
 LU/4VVXTtgZQAahpH1VhDfhNBTzqdv1O98/GjmaJlLtIzQMFXvAlENzfH4y+GyYcYjXrYu2qXZY
 qjhz8g5AA6HEeGbugyMBjAISYoaWEQI28KAblwxjUuXSI68bLjStUfWxPw76EuyUqe6WZHDkFQP
 Oy7Y3bKESxV4xpNyp8aIqmVS8Ds9ZDYMVJh3kVKTnv0UVeAYqzpUAA2C81JfXXoOD36Anb1Dp5R
 ZEKLWxkD/ROxafAYT/GkEhFv/YwH/nS0fEsW7tELsjbyH8x64hn8EdF9fs0hZx0ZgpU8=
X-Received: by 2002:a05:620a:6a83:b0:8c5:3892:a554 with SMTP id
 af79cd13be357-8c53892a5b2mr244248685a.3.1768470091250; 
 Thu, 15 Jan 2026 01:41:31 -0800 (PST)
X-Received: by 2002:a05:620a:6a83:b0:8c5:3892:a554 with SMTP id
 af79cd13be357-8c53892a5b2mr244247585a.3.1768470090813; 
 Thu, 15 Jan 2026 01:41:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7b464fsm58436331fa.20.2026.01.15.01.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:41:28 -0800 (PST)
Message-ID: <17990836-4278-4c5b-afa4-eb631930ba2a@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 10:41:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] drm/msm/dp: Drop EV_USER_NOTIFICATION
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-5-08e2f3bcd2e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-5-08e2f3bcd2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NiBTYWx0ZWRfX6TRvX6uHyAE7
 0K48sC2M2OhvCI2FKlZhMrzNJo1bRuz8L9vQcz45VMObJJG2EnXg4iLf5vK67+SY9t+qBYtETL7
 mv2z1PCSdMP45w/lyMKjc/+91pCFttjBZuk0NulPWDAS+yAERnJRwDulmrYoNtDrU9kuPjfrfCY
 /c8RlEWVpwDHaA2SmtKIm6fO9DYaZTnxLC7Qj0biWW3qRXBXfVQyU9maKV8NrjvPwAR4R5knR/Z
 1SRjvQdigORQ/shdbRANS64XhY0fgK5wH2OGoM0kSyp9kB6QPSxRXb6hpc+kVVwtJAoiBLdxHho
 44XnkvDwPfZkhaVBmvOSZ/L/pmuMrxuzVmluQkxMaNucZDMOgdCdwRMNCOXUjPMI391zu1mhYjw
 srjhhzsQGm9rKcm9laejN5oCq5sx+qmHLu4rNevYSkbkuxV75r2mS7s0jZNqrVunecuk1dI9tFj
 64CZ9xtqoGusiMZsvpg==
X-Proofpoint-GUID: tzO0sUhaZKMCC-sab6-9tncInQy-8lUb
X-Authority-Analysis: v=2.4 cv=UYVciaSN c=1 sm=1 tr=0 ts=6968b64c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ls25Rwon0kCaizU-UYAA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: tzO0sUhaZKMCC-sab6-9tncInQy-8lUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150066
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

On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Currently, we queue an event for signalling HPD connect/disconnect. This
> can mean a delay in plug/unplug handling and notifying DRM core when a
> hotplug happens.
> 
> Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
> handling.

IIUC, the drm_helper_hpd_irq_event() -> drm_bridge_hpd_notify() change
also prevents us from checking *all* connectors if we get *any* HPD?

Konrad

