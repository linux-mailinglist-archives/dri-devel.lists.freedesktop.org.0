Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F130EACBA83
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 19:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCC310E56D;
	Mon,  2 Jun 2025 17:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqAM8tVu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCF210E579
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 17:54:21 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJYKB026750
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Jun 2025 17:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 u9XvunIrclrT7hjhuIP9HfHbDT2S/9yYDl5lq8q+7mo=; b=GqAM8tVufg5aWU3o
 Zmu0odxQY1VNvlCf+uN7AKQEugEbd9BIpuad2THHcb7yvWnSxFPzI3kQF+qXNr+w
 YnHlHl3D+4JJLYYIbRe27U3EpVQr9l8YYZzA+8aU/PeaI1TGmdPAZmCcQIZt8qGD
 xKD1w+vMDs8BpCD0OzvnMrmc+Es2BMt1gAo5Nwp6X/7l10VHrLYcdrnUOoSKUlVp
 o6mTyJLFQEGuhuArQ+0llqFUQvDjPI34JOPMdRI9RIxcLwzzQeQPGwpDHMfFdzvC
 TgSjunoWGpVLzrEi2uBAoho4FY6naTF2EzeoTkEuZSc92FD/ZPf3tiIdHvg6zNVh
 HSoddw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8rr2ja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 17:54:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2358430be61so15300795ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 10:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748886855; x=1749491655;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u9XvunIrclrT7hjhuIP9HfHbDT2S/9yYDl5lq8q+7mo=;
 b=Qm/EtEuxQcaYj8sGsJpGZlZAqz9YTSvtR5VilZOHziaRmXX+9p+sp0ls3Swv8n+R5A
 z151vTZkS6gSWVQWHdhToskYzYk2Uo2K4SiZX/9a8oMq7K3a/qGFOK1AQOkag1KZa9tz
 63CTb6RN4lNIx3CWqNwMfoNsSgyg3OE8FFtltYwzbN4wsZIBVEjuMwblXIi551vfXZMf
 suTTiF14bR4oSg5ATPn6b+1aTLHJCakX/fLcxeA20d+UypsO3GgRuAJNULzTE7CJbrmn
 oJDWMdTQk0p5KLQCbM1rU+4QgsJTNQTF0TUrhzBIg6Jgo9BHv9eG1050HYDocHekfqs0
 ToAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6ReaziJSWoNvNnc7kyvmvxoyIw1p93o68lo2rWGEiK6jZrSze4FtTjl8yaz9I+ImqOfg4SF8bPj4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycjqUlFaP0VBEBtXcXC5lM6ghXDR9jkzJvH80/go3g4kmJ5mbr
 WDjgG/Q6ayXKzKWQBOZ5zvXR0Kq1Ub4YgRlQwS3M55fUrAr3i/8B6evDZDRRq8BgwzBTgHwvC6o
 NPP81rj4DtzSKmmivbiTyrGyuJp6PrKaGelDl/oeOX+05KDRSFAU0aoRxVa0j/OQFiaXHOvw=
X-Gm-Gg: ASbGnctZhxQfAIbqR9vwY1Ixx9IltwFVJmS+euDsQNnqzwnMHTWjLxnVdZ0afM/VVE0
 d8fEkYGTfngglb/BFcULaG+tvtN9tRvgNPsxzZf0KbPERJtFqcNj5CzN4rE1Rvc5V9bbZYaOM4j
 Fwhp8SoWmBKf0Sbj/R133dlheQBIBbV4aiuq18lNlrA7jb+mWTB6iQG8r7XmlrMow+R5BxrxXoX
 nl0Et00D8XXS/tSMRSd2buWncdBbmnFPxP37jFmrfAkeaJfdT41taYy1+h1e2Iou/h1+zWMOXSA
 ZUe1MNfCvyLo+ylRyA2SeZDbO41GGpEQ5bLhMviZp0qvT5CHUtqqcmBfpQSlnB0NnG1AtA==
X-Received: by 2002:a17:902:ea11:b0:234:9068:ed99 with SMTP id
 d9443c01a7336-235395b1df0mr187796025ad.24.1748886854604; 
 Mon, 02 Jun 2025 10:54:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnVKXZ0LTtvyZS3lGmVIwCTIOA+EO1ClF4BKT3ba4Q6ILhNwe3yQldHpOCpjXK3ErOrV831A==
X-Received: by 2002:a17:902:ea11:b0:234:9068:ed99 with SMTP id
 d9443c01a7336-235395b1df0mr187795645ad.24.1748886854172; 
 Mon, 02 Jun 2025 10:54:14 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bc8a40sm74072675ad.2.2025.06.02.10.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 10:54:13 -0700 (PDT)
Message-ID: <3f386e7f-5e22-4c67-bb3c-202f13c94d56@oss.qualcomm.com>
Date: Mon, 2 Jun 2025 10:54:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/dp: Return early from atomic_enable() if
 ST_DISCONNECT_PENDING
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
 <20250529-hpd_display_off-v1-2-ce33bac2987c@oss.qualcomm.com>
 <CAO9ioeUPJm1MbqAVJfcQSTAmvY3-TmvtZ+=Js1mZ53JFYHoUhw@mail.gmail.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUPJm1MbqAVJfcQSTAmvY3-TmvtZ+=Js1mZ53JFYHoUhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nbRzl-OPR0Z2_XdqK4RjX07tZB_GmC5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDE0NiBTYWx0ZWRfX8yA3KXibjYV/
 MPjNjd0kbmEQtf4Z5AUh0OWtKWme6rJTubk3wz5XtwDjiJxDZ7JBfwI/ILcmsFvHShzkdcTz18O
 DzCfhtZpxls019kITGeu/qS3pa5WXFvFL6FNYlW8UwGvUOM5dqerz0yG7aoeduhg7Ol0XBpAieC
 5FuEb1LMdKXlpU8xm7z7He7Wd+WHLKPlmKKs3OuhBX5QzV18B1NesvNrbkBckDqfMZq6I2PJKWZ
 Ywj3CQFAgkneRPhbMHRgtzvxOXbjiw0Bs/OOzXzWyv8fcr2uPLfdgdkv/iPtJj72Cyk2Mxcy2AP
 mat0/oArRk8NILpa0B1eME9LEj9EqtBdx6IQZZ1UCO8MPuE+o5ZCLzuCsnrNTTx1CtyfEQxeDyj
 YMtqNCwuGY+0EgzGYjV/XZQn5fJDTMbW1XlqCeKhBTL7j2Pd8eH+2dw/J5sft5OJ90VZGJOi
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=683de547 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=WDWld9wBFKh9IeGoHG4A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: nbRzl-OPR0Z2_XdqK4RjX07tZB_GmC5u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_07,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506020146
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



On 5/30/2025 9:04 AM, Dmitry Baryshkov wrote:
> On Fri, 30 May 2025 at 02:15, Jessica Zhang
> <jessica.zhang@oss.qualcomm.com> wrote:
>>
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> The checks in msm_dp_bridge_atomic_enable() for making sure that we are in
>> ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant.
>>
>> DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY as
>> msm_dp's atomic_check callback returns a failure if state is not
>> ST_MAINLINK_READY.
> 
> What if the state changes between atomic_check() and atomic_enable()?
> There are no locks, cable unplugging is async, so it's perfectly
> possible.
> 
>>
>> For the ST_DISPLAY_OFF check, its mainly to guard against a scenario that
>> there is an atomic_enable() without a prior atomic_disable() which once
>> again should not really happen.
>>
>> Since it's still possible for the state machine to transition to
>> ST_DISCONNECT_PENDING between atomic_check() and atomic_commit(), change
>> this check to return early if hpd_state is ST_DISCONNECT_PENDING.
> 
> Can we really, please, drop the state machine? I had other plans for
> the next week, but maybe I should just do it, so that by the end of
> 6.17 cycle we can have a merged, stable and working solution? This
> topic has been lingering for months without any actual change.

FWIW, I'm currently working on the state machine rework by the middle of 
next week.

I'm anticipating that the rework itself will take some time to get 
merged, so didn't want MST to get delayed more by this series.

Thanks,

Jessica Zhang

> 
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 1d7cda62d5fb..f2820f06f5dc 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1512,7 +1512,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>          }
>>
>>          hpd_state = msm_dp_display->hpd_state;
>> -       if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY) {
>> +       if (hpd_state == ST_DISCONNECT_PENDING) {
> 
> 
> 
>>                  mutex_unlock(&msm_dp_display->event_mutex);
>>                  return;
>>          }
>>
>> --
>> 2.49.0
>>
> 
> 

