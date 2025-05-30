Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03543AC953B
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 19:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E75710E882;
	Fri, 30 May 2025 17:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7lEtrD/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCBE10E87E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 17:51:03 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAQ3Yt011636
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 17:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iQNFg2RO+LuLXzx8pk9NGhNaS/HpbKAbCtu9O+9m2sY=; b=W7lEtrD/CG96Vxv3
 GiGPxu0NcoUR+0qAucrXHsDZLUtNGOWZI5hvunacTBqazvCX6E7EZ3qZFyl9FgFh
 nIr7efHmJKJU0Yz3ZxlofhBdxURc/wCcyEL74ST+mY7qQLAFm50RGfzsf43gqZJQ
 QgCLTo8SXpOxjARtnRrEYSd4LJO3dxVm2yIK8A0lrC3aa6WvVE59F0PNVprr4ZTi
 MHhaXpz7lRNni9UXYOUngJW05NddlRJxe8J31JLv0x5+QfGgjSaLbr5++SmzWLVw
 aujBuH69n+w/zjOOqv9PWxXwTtXQGVl3uO2tngANh4NUW/U5zzD07TX3tQbIObPg
 NlaejA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g9a272-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 17:51:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-742c7227d7dso1815106b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 10:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748627461; x=1749232261;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iQNFg2RO+LuLXzx8pk9NGhNaS/HpbKAbCtu9O+9m2sY=;
 b=oGeASGUpmhn8+mdsGFscqyHXAV0+3JR6cQPH/UKdKJEhnsONmcPI+vrwv0vi7h1FEX
 KaXo3VKjbMX3HuJEMcjk1J41kYbvlD8exE1H54OiFrre+HSVC/8OFi2bEeJKhNI+sT4n
 653c6a6MktUpskji2pLV9xvJvLabi2GW0rR3cywZoZeyNpWE17iWy0CamAocmAiNrSLM
 hhukdFVV39OCEAS0FVZQYfN7f4qznybbRswUuLcGZ+SnhXcDZNtWgV8hRfej+dPxr7zx
 vS/DOyKf3q4Gb+mHQFxrFRgZfDux4UGv1QiEskZ72FRVg3jR7xUvn4u0aH5/+pBzpgBT
 xM5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRsi2HmQmKkIYD4yFY3qBeaLcFKys7fbL/U00Seji9kczmnznPFRveglFgEBmPhSVioGqbPa1yERE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYVKTx/b7l6KvTMjPBWUaqJMuYp/5E+AfYjfPmDm1N5BzwMaDF
 9e51ALQ0J/e/GctkUFrFylYa/XWf35bqjFfk/IhKPGJYyfuZxP8FLn2iereAD/VqgcmbYKorH+r
 XDKcvRZPSxi/msSIF6Lg4GLq9febIVYB/uftb5+TJgxQs6g8VsOtMinnwkgzrur6jDLymk6E=
X-Gm-Gg: ASbGncsTr+Uxr5K/aZv5/LQ+AuyRki4pF7UnESHPDSCKZXu1xdQCsgb0aVT8d0rxbXv
 nEMbetiXSLCVmNaBqkVP0GieqdNglxVxg4lKSYTyM2RFTZkwIUdfUIYi1BlmPNR3Y1PWNqF3b2+
 oFuATzGV9VIgEmOFncwaU8IdNy7aMlqR6sHgnU2GqUYCWwBgPjQVx1fayxnXM5BL6nAeF9hTgGp
 d+poJTLL73iSC66tnDen+UgnUJzVtkeDFx22v9K/6yfs8TlJlUlKtK6WEefw6J/ySgLyHLPP+D8
 5orZwrw2ENxN4KwjIZU1YA1Qu1OZJkO8zj7c90g3nJV9orvKdKCQH/HHbv8FSdqpRKRFTA==
X-Received: by 2002:a05:6a00:2e04:b0:73f:e8c:1aac with SMTP id
 d2e1a72fcca58-747c1a48890mr4146205b3a.2.1748627461436; 
 Fri, 30 May 2025 10:51:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0/DxhVchUsP3GUuQR+rz8hEa1EHtonG4n9LVY8g10f4TVSCbT7ApT+IY723JWbTdA27KRXA==
X-Received: by 2002:a05:6a00:2e04:b0:73f:e8c:1aac with SMTP id
 d2e1a72fcca58-747c1a48890mr4146178b3a.2.1748627461002; 
 Fri, 30 May 2025 10:51:01 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affafbedsm3439014b3a.102.2025.05.30.10.50.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 May 2025 10:51:00 -0700 (PDT)
Message-ID: <3b5fa433-e3a3-4c77-b502-096576ecc2e3@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:50:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/msm/dp: ST_DISPLAY_OFF hpd cleanup
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
 <CAO9ioeUi59PNmRSYzyVbxcifhPKxYbtW9EuouOVXkT84SPOuwQ@mail.gmail.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUi59PNmRSYzyVbxcifhPKxYbtW9EuouOVXkT84SPOuwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=6839f006 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=ryANHwUXtzQLBLkujfsA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: CGIKZ2ZPQtEHSvnJKZMhtaMzItrF2Hkp
X-Proofpoint-GUID: CGIKZ2ZPQtEHSvnJKZMhtaMzItrF2Hkp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1NyBTYWx0ZWRfXz8AaWOnhFZ8n
 pmVS2gk64flyO1zYCHlNMAMJxHlC/S9bnlcI18fkh9jSqB7Mggm8raeoZk+E6Lnl4hNyHNjBzXP
 uQd9a7dbtCxsGPYRGz1ZNDxB1kppDk4gYyyvW3iCG4QJrI7bh4IsY2W7wMtHjFfNZ8djHCVH/4w
 IeECZz+4r+XwvymfjmkOPzeDTR9vB7ajbti9B9eS1jCRcqTq5Ovf/H4h04F9M0Hly8eItVn5ltG
 sqy3DDv3cRGD0z9MPnhV5VMZW9iizUyi7fmAsRrGkuzQrUz/7lKAW0vVRm9Fc1hGFrL8F+gyqgQ
 tD6ieg4UjkoTacukBkJgPDNX6La41ZLbbsAzAI6a0DcFZdmbSu8rDRPbLYqAgVONq+ywBLcw7eC
 x3vxM2XHf/8D8PNEFXeOezHcD/zYz+C8uH9Zbnq+BNTzFu+c1HWKzSENEQU77d51x5lQMCES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300157
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



On 5/30/2025 9:05 AM, Dmitry Baryshkov wrote:
> On Fri, 30 May 2025 at 02:15, Jessica Zhang
> <jessica.zhang@oss.qualcomm.com> wrote:
>>
>> HPD state machine in msm dp display driver manages the state transitions
>> between various HPD events and the expected state of driver to make sure
>> both match up.
>>
>> Although originally done with the intent of managing userspace interactions
>> and interactions with compliance equipment, over period of time,
>> changes to this piece of code has become quite difficult to manage.
>>
>> Although, unwinding this logic will take some time and will be spread over
>> various changes, to start things, this series tries to get rid of the
>> ST_DISPLAY_OFF state as firstly, its really not an hpd state but a state
>> of the display overall. Coupled with this, there are quite a few checks
>> in the current code, the origins of which need to be re-visited OR are unclear
>> which seem unlikely or redundant. With DP controller on newer chipsets supporting
>> multiple streams, this has become increasingly difficult to work with.
>>
>> This series removes the redundant state checks and simplifies the logic as an
>> attempt to get rid of this ST_DISPLAY_OFF state.
>>
>> Note: This series has been tested with sa8775p and sc7180 devices with multiple
>> monitors and also multiple dongles with no noticeable regressions.
>> Both of these devices use native DP PHY though. Hence, if this series can
>> be verified on some devices with USBC-DP combo PHY with the help of the other
>> developers, that will be great.
>>
>> ---
>> Changes in v2:
> 
> The series is not marked as v2 though.

Hi Dmitry,

Sorry for the confusion -- had pulled the v1 [1] using `b4 prep -F` but 
forgot to force the revision number to v2.

[1] https://patchwork.freedesktop.org/series/142010/#rev1

Thanks,

Jessica Zhang

> 
>> - Rebased on top of next-20250523
>> - Change atomic_enable() to return early if ST_DISCONENCT_PENDING
>>    instead of completely dropping the
>>    if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) check (Dmitry)
>>
>> ---
>> Abhinav Kumar (4):
>>        drm/msm/dp: remove redundant checks related to ST_DISPLAY_OFF in plug/irq_ipd handlers
>>        drm/msm/dp: Return early from atomic_enable() if ST_DISCONNECT_PENDING
>>        drm/msm/dp: replace ST_DISPLAY_OFF with power_on in msm_dp_hpd_unplug_handle()
>>        drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
>>
>>   drivers/gpu/drm/msm/dp/dp_display.c | 19 +++----------------
>>   1 file changed, 3 insertions(+), 16 deletions(-)
>> ---
>> base-commit: daf70030586cf0279a57b58a94c32cfe901df23d
>> change-id: 20241202-hpd_display_off-6051aa510f23
>>
>> Best regards,
>> --
>> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>
> 
> 
> --
> With best wishes
> 
> Dmitry

