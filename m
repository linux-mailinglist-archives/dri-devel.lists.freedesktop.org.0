Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 269DDD23DA0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 11:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F77110E734;
	Thu, 15 Jan 2026 10:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPzvQv0t";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RaFEu0kq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E831010E731
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 10:12:08 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fjMR1850838
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 10:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7KiZ+TnHo2tA4f2TfOgmaOGzuxQPX0E0QWOJIMh7jkk=; b=CPzvQv0t+5jnexkT
 oncy2Dbo1565GT+hNtQto9snPQEMr9aGXSogDWnSmLM0rvXtqjlcj4d0P/Z/Ll23
 Ipu4g6vGVDgmG2Y4Yb5iSF2c+JoI6CwccJM4MCiMLQ//wBdV0f0Jwa9SCcYwMRjw
 b0Y/3nXzcI/O0L/Z+l7uhJKy1MPqXk8AeomlRxG2RXUUUfMmIc2I1uoluqxt0KeD
 3NClpsRLn3DRfEfVEvNfi6mWT6kE9d66PC8aToyA8JwqNXLXA8QRKps/W/Ksgao4
 scn9KUBEUpSES9Za7PTZCv/fVf4XliY/U6KQxeibei6uQ8mzf+fYHlzZB3TWi4wI
 Pa7Rww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bprej12d1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 10:12:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-501476535f8so2366741cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 02:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768471927; x=1769076727;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7KiZ+TnHo2tA4f2TfOgmaOGzuxQPX0E0QWOJIMh7jkk=;
 b=RaFEu0kq6JqmB+su6wb4SbI17MkZxicuaLJRFjLXFu8u1xXHNi22msy3xd+0I17bDm
 JRY23S5GEJmm9LD09Vu5QO+HfFVDcFNkg7nEfItWDY81xPVj9e+MjL3k//eavW7KXuHH
 fAS366a0Hh6MMjea8r/xIHsgxjgUsGj1hFMY4tXE99XX0tUvGRonX2STADNifVQROGA/
 aYk37CaFoqkqns62MQ86QUxwKHdUBBjSo/iYmJnSBRXcRSCoWjhJ/qSvBGSoC5qyQXXd
 q0akxs2TUkfai+iwM5B5Rv4/W6xW7zDNdIHY0IhCplsbf102XcoajPcvsd8XHD+mTOrg
 2IEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768471927; x=1769076727;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7KiZ+TnHo2tA4f2TfOgmaOGzuxQPX0E0QWOJIMh7jkk=;
 b=iHw4t9q+godmlZsXMHwt+wSl5bx09QqBBSyTDuN37F+wMJsGQIfBjpkuJcOTu0y+la
 Nk7zleOj3zeHsQ/GlSaw0AMznWVdreUJX/BL003IMETELrWfHRyNfv2EUfxJdltf5sRz
 1Ops1k+HK6YvYVp+06OFQRicEPKiObYeE7Oo1ZAi8dZeoW8/GSssruqjYo//1IAv39rh
 IHMcr9xdAhqsmFI2FpzPV9nActBQUX1OkoFPVjy7iCYguIWq0YFEhbj8T9BGYYrN4Ja2
 lr9sFZRHUhfGO1nWaLEJIIyCtqPdZfe2W3MTqZsjUrxgvFQPjrbxzo9avmm9rsaNLF+l
 +Lyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXua+UfzFKOkmE79TOudM/UZQ+RDZ4HbWY4eQv2u4XmJUqcPjTLBeYIxldjjpIhZSh2V7X2Vq9tEc0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzauA84YciQiAitx2HDpcP0qjMAaRWuxizCWwy+0MqmJQcqZ+H0
 2dh18HaXnu+CLfHm7sDH2jwtn6Qkdw7Ts6RJ0onNMaVN+sYFDcqBK6dzdTBLpsewX1TuyNA/wz2
 43QW9TruSRGYLoVzEtPOIbPtyS/zkp4w926AepbQiEZwT724yRFSlTNXKRtrQ+0F7ooSClic=
X-Gm-Gg: AY/fxX66hdSXzhEUeRVAdhc9wpZN+sh75yrvmC1n74TD409GGZCsbzfPlJDarQPRNcd
 JyIrT7CcT2G3a+r/XfSyLyaL5XZHhJJVLkiX7WxUPl/ZZekpPHAPKriRVykh78uZ0cuynpC1eXl
 ACY/V4W1Ic1j26Lk4b7+1GmUkLMhnwB+YDxi6bdhFsdxqjuuyEAzWCljH+misnOKKeYHjSrr+hZ
 3/oW79q+E+kFCkLjJyi0sk+WYMhLXU+CTetJlPyYZmE6lB/CKmvBofDwsGJrdT75kWmRdf8xe+u
 KI4cTJy/lg1Flm3dlZAeCJFG4GMZgnzKDbK60HhRRzvuZZPjoFpLA10b+8RhzsycDXIzUet4PlR
 ve/c6hxvHG84ubhZwCC+1B8eQX1PD7PKPlcaN/QnxHm0FulbukBJ780YgenkwJufgDkE=
X-Received: by 2002:a05:622a:1454:b0:4f1:ac43:8122 with SMTP id
 d75a77b69052e-501481e98a2mr65006211cf.1.1768471927098; 
 Thu, 15 Jan 2026 02:12:07 -0800 (PST)
X-Received: by 2002:a05:622a:1454:b0:4f1:ac43:8122 with SMTP id
 d75a77b69052e-501481e98a2mr65005841cf.1.1768471926686; 
 Thu, 15 Jan 2026 02:12:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a563f0esm2816455266b.60.2026.01.15.02.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 02:12:06 -0800 (PST)
Message-ID: <d98339f8-7296-4daa-b625-0908ecd3e65c@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 11:12:03 +0100
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
 <17990836-4278-4c5b-afa4-eb631930ba2a@oss.qualcomm.com>
 <22a3ab11-9151-41cf-a0f2-8509abbd3d27@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <22a3ab11-9151-41cf-a0f2-8509abbd3d27@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfXxNkJV9sc/mpI
 7jmcjrojqF3NRiEmrgEHavTLFZh6gDxS9WpoK/V4sA17ISn3C4y1EXrwA7wHtFKiA66+8ICgQfs
 PXIzLb9g+vrsVtJVTm5vSC7ooo/4km3AIlS19OPXyf+ttqHH9T6yh4nL849StnR8H6kPgUFNUxi
 ZY0RUwIJ+83dD653kvsujD5RLdOf2ZWmuZTVBSm6GIUndNvWLWnW+BXgNyk/Gc6mzYWq9cp5gKF
 Z1ZCKzmce2BeB2Shwso9d84T8/WFFeA1+ojv1jT9gOXgTWleWkOJFgkVpBicmlRKnMmLPcR2gsS
 7oXeddbFLY7oIlJekBZ8SEmpvExGCjVnnBcdqY9RF8ct6xTmLg4dP6zfcE5NPT0Zv5RdGPrlh8j
 tSe0ih2O25x1bfFifVgWIr01VmQL0mIm8ZPUWqXpnF/oM9wPYs9/74xSqkdhsM37Kaowd8tj+dH
 mNfefVf6ciKNzyBZmiA==
X-Proofpoint-ORIG-GUID: hIAK7fBEt2UrHkEJCqt5w3J9aKIlG096
X-Authority-Analysis: v=2.4 cv=Rc+dyltv c=1 sm=1 tr=0 ts=6968bd78 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_hlmpyr-2oR44aeFeVMA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: hIAK7fBEt2UrHkEJCqt5w3J9aKIlG096
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150073
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

On 1/15/26 10:42 AM, Dmitry Baryshkov wrote:
> 
> 
> On 15/01/2026 11:41, Konrad Dybcio wrote:
>> On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
>>> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>>
>>> Currently, we queue an event for signalling HPD connect/disconnect. This
>>> can mean a delay in plug/unplug handling and notifying DRM core when a
>>> hotplug happens.
>>>
>>> Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
>>> handling.
>>
>> IIUC, the drm_helper_hpd_irq_event() -> drm_bridge_hpd_notify() change
>> also prevents us from checking *all* connectors if we get *any* HPD?
> 
> _unnecessarily_ checking all connectors if we know that HPD was here.

Yeah that's what I had in mind

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

