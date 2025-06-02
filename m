Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FF2ACBBED
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 21:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBBB10E580;
	Mon,  2 Jun 2025 19:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HBdzeICx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF6810E580
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 19:47:12 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJoSY011688
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Jun 2025 19:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pv4Gvylo8FY7mjR4b9XsVtGARKI/SKacbF8jlSXtk5Q=; b=HBdzeICxNFwLE18Y
 C2Dg/v1rBYEUP65eqI6/FaYeqN/Ct0cinNTX1DiNk8746RkYf3qwc60F1L6Xq6FN
 Sc27EgduGLIQUcF6RuWGpDGKtwOw1s7MyxyXLKjGDJ1uz24utW+u9Ym0PXDgZMGo
 hNsvdLm8kWcDYwShwLPTsiSFKllzyssaU8CZO2r7oVXPCMZbDibSngGPL72Gnw8m
 qRPc1tg2Dy8LaS/2yQOQUYSTdCfdoorX8Pj8h9je9YWc1zJxRp7yFAam/6Ayn4ra
 LFMx8ZbsePRhPg73AIC17G4G+ZMMy8uv94974YqwHVAP/27uD4KOYbi4EkfJCfgj
 QOGmpg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8src2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 19:47:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7caee990715so1425614385a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 12:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748893630; x=1749498430;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pv4Gvylo8FY7mjR4b9XsVtGARKI/SKacbF8jlSXtk5Q=;
 b=bPpesSMHY35NPzdvc3/weskQwPt/k08Beq/6+ldOBZ61LoNqRv1UrGrXknnzqpts9o
 Qo64nHLThe330W5bPVHJ/pCuzPi6fO7VlLgD77Pdaobyg0SZ+V8vqryNtLFpApyvdiQq
 53q7C+Ts4KJkd6xKfs2ltJ8MvS+5KI8HxHwIksCtrEG9ipUC7e7sWADzvIglIarFCRLS
 eRgfF9VwuxTy0ZoftYtPg4sezNveRhxY4rZqCN4V99F2rsHzGON3Fi304y8WWDvs/SV0
 ntlBSx8cwxiEvldcm+7M2E4H5BmhiCviS3TIoNgaXgjTy/JE/0W/66wy6Mn5wp+GtQAw
 9JKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyjmReZyhmZVgtDJ//Pm2re3SDWpLJOT/lGBpJUrmAul95TIQTt5W6lIC0bERdwnEeG08Drs3fp3Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSY0FR9AWB2dOFtREXcMRu5W+5pt+OlsexyVHm/q4Mpw+1Ey0Z
 dp+ImQLf1iIXph5uyPNmku9li4Bp0P3u+Ox9ZlKiUezSG2qwKsVRNz0f7NjCbDvdxsn0pIwDlAJ
 XVDlQusHLgit12Rq+NFsm6vTu3hMB9lN0HwjhybL8dcHl0AfJnR3oHHKgYcIUBD8ki+MVQEQ=
X-Gm-Gg: ASbGncsC5o/3ZaJ5/8Nkb5Lo2mBlymTLS/dGuycfE9hulIopZ3uBYfofY1eYg6w99sP
 HjUc12RL56xXzl4mAL6y6UtRC/pmDfa9cYvLTNaHbtz+gPJQkS7KFJnpv/7tQeH96ceFM2Fyn6n
 yBdGkhTyZzjkcodQ+nihAP9I+wPWYvElfS4PRIL9p+ZdT4boLpPNWUihtb7Bh5+BuOsB+HXml1u
 P++DrfmCEIEvyyVRLhuG1EWvcQjfe4pCMUhne04g7wFu+WEiHe03aIwbAlgAFAC1cetiTweyM2/
 g7T44Ra+jtxpvW6gfdXN+yBo506w9m8i5tuBqG6qLXZrDNj3m4q3zkEL9QiH
X-Received: by 2002:a05:620a:600c:b0:7ce:be04:f838 with SMTP id
 af79cd13be357-7d0eac6350amr1384507285a.18.1748893630141; 
 Mon, 02 Jun 2025 12:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEny2RN/ronKKFErzwQjb5Z23+FdZnMifLiGPoWjy39vEUqYNoTBvVufGWzNLvyNJaCwLvblw==
X-Received: by 2002:a05:620a:600c:b0:7ce:be04:f838 with SMTP id
 af79cd13be357-7d0eac6350amr1384503185a.18.1748893629760; 
 Mon, 02 Jun 2025 12:47:09 -0700 (PDT)
Received: from [127.0.0.1] (85-76-98-209-nat.elisa-mobile.fi. [85.76.98.209])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a85bd2790sm15451371fa.102.2025.06.02.12.47.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 12:47:08 -0700 (PDT)
Date: Mon, 02 Jun 2025 20:47:05 +0100
From: OSS <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/4=5D_drm/msm/dp=3A_Return_early_fr?=
 =?US-ASCII?Q?om_atomic=5Fenable=28=29_if_ST=5FDISCONNECT=5FPENDING?=
User-Agent: Thunderbird for Android
In-Reply-To: <3f386e7f-5e22-4c67-bb3c-202f13c94d56@oss.qualcomm.com>
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
 <20250529-hpd_display_off-v1-2-ce33bac2987c@oss.qualcomm.com>
 <CAO9ioeUPJm1MbqAVJfcQSTAmvY3-TmvtZ+=Js1mZ53JFYHoUhw@mail.gmail.com>
 <3f386e7f-5e22-4c67-bb3c-202f13c94d56@oss.qualcomm.com>
Message-ID: <41C69F0A-605F-4B87-89EE-FE86A8DC71F0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=683dffbf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=kLrF3Jeiykx/AYV6VMbcyQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=puQWGBksFvoA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=WDWld9wBFKh9IeGoHG4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDE2MiBTYWx0ZWRfX+uH353CuuajM
 9cA10G1sOZDvFG4ll8/yJkI4iq8A1Xs07AZr7xuA+JxHwSu+RSR7xI1XuM/nvnQYZgTo1Lfv+si
 8Z1Ozs6Egsyh66kpvT4GTgCCiWO4MFn14OcrPy6aWy4JpdAcBfDmApEPsW5g3EHh4IQlpUvGaZz
 bY8FXqp+or05kR42PRcc0aUigJqJH7cdPJQ/6LgVlGV3QiIbbwM7pFfPjVjVs1aFQcxseYs7S1i
 6GLCp+93gCayrPhOLD+C/aQRwnHfQ22UB7QL6O4GzC158YPK44z586hk2INXNIAGy9Wxij4ED4q
 gCgxHLRhkw8oikpUol2qfmQCVjt2HsNCYr17ReHDHl3J4H7LL2Vppbr527vgd8IOdMzpPUjA70A
 vp+KNS2ZoD5qmil4yRnjBFh0OctK7cL5V7/xY/GLl0JtexDElbpb5NO9a4NrmgDj/32U1hPB
X-Proofpoint-GUID: zZCUYjic1992qg7zUdqQz5L-cbF6ugkL
X-Proofpoint-ORIG-GUID: zZCUYjic1992qg7zUdqQz5L-cbF6ugkL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_07,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506020162
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



On 2 June 2025 18:54:12 BST, Jessica Zhang <jessica=2Ezhang@oss=2Equalcomm=
=2Ecom> wrote:
>
>
>On 5/30/2025 9:04 AM, Dmitry Baryshkov wrote:
>> On Fri, 30 May 2025 at 02:15, Jessica Zhang
>> <jessica=2Ezhang@oss=2Equalcomm=2Ecom> wrote:
>>>=20
>>> From: Abhinav Kumar <quic_abhinavk@quicinc=2Ecom>
>>>=20
>>> The checks in msm_dp_bridge_atomic_enable() for making sure that we ar=
e in
>>> ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant=2E
>>>=20
>>> DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY =
as
>>> msm_dp's atomic_check callback returns a failure if state is not
>>> ST_MAINLINK_READY=2E
>>=20
>> What if the state changes between atomic_check() and atomic_enable()?
>> There are no locks, cable unplugging is async, so it's perfectly
>> possible=2E
>>=20
>>>=20
>>> For the ST_DISPLAY_OFF check, its mainly to guard against a scenario t=
hat
>>> there is an atomic_enable() without a prior atomic_disable() which onc=
e
>>> again should not really happen=2E
>>>=20
>>> Since it's still possible for the state machine to transition to
>>> ST_DISCONNECT_PENDING between atomic_check() and atomic_commit(), chan=
ge
>>> this check to return early if hpd_state is ST_DISCONNECT_PENDING=2E
>>=20
>> Can we really, please, drop the state machine? I had other plans for
>> the next week, but maybe I should just do it, so that by the end of
>> 6=2E17 cycle we can have a merged, stable and working solution? This
>> topic has been lingering for months without any actual change=2E
>
>FWIW, I'm currently working on the state machine rework by the middle of =
next week=2E
>
>I'm anticipating that the rework itself will take some time to get merged=
, so didn't want MST to get delayed more by this series=2E

Yes, that's fine=2E I really want HPD to be merged before MST=2E And if I =
wasn't explicit, the state machine must be gone=2E Link training should hap=
pen from atomic_enable, detect should be reporting whether there is an actu=
al display plugged, etc=2E  Current code must be dropped=2E


>
>Thanks,
>
>Jessica Zhang
>
>>=20
>>>=20
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc=2Ecom>
>>> Signed-off-by: Jessica Zhang <jessica=2Ezhang@oss=2Equalcomm=2Ecom>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_display=2Ec | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display=2Ec b/drivers/gpu/drm/m=
sm/dp/dp_display=2Ec
>>> index 1d7cda62d5fb=2E=2Ef2820f06f5dc 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_display=2Ec
>>> +++ b/drivers/gpu/drm/msm/dp/dp_display=2Ec
>>> @@ -1512,7 +1512,7 @@ void msm_dp_bridge_atomic_enable(struct drm_brid=
ge *drm_bridge,
>>>          }
>>>=20
>>>          hpd_state =3D msm_dp_display->hpd_state;
>>> -       if (hpd_state !=3D ST_DISPLAY_OFF && hpd_state !=3D ST_MAINLIN=
K_READY) {
>>> +       if (hpd_state =3D=3D ST_DISCONNECT_PENDING) {
>>=20
>>=20
>>=20
>>>                  mutex_unlock(&msm_dp_display->event_mutex);
>>>                  return;
>>>          }
>>>=20
>>> --
>>> 2=2E49=2E0
>>>=20
>>=20
>>=20
>

With best wishes,=20
Dmitry
