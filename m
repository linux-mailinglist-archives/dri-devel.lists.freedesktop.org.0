Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO+UFN7AnmkDXQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 10:29:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012B2194FEB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 10:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1327D10E260;
	Wed, 25 Feb 2026 09:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="noe0ugw2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEgjlZrL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9855510E260
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 09:28:57 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61P9SJLb1363686
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 09:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y0rSTNHrb7cMCGYYM8naR9bjvD7jQUjTiqevbIkkW84=; b=noe0ugw2ojIXxQdJ
 6XGLle5/klBjdpbs5FfTHOP62cJzb7ZJJYJYxlAdzbS2+eeaDzl+PcChB/9ar6YN
 Xr8+D4qVTcbrSqcWlXkFOQPk8JksJ7VqAd8CGKzxSzRaJEYIDIEnlTW6Qgfl/x+X
 u26g7lmLOW6vfPrd9JJfl0Mrniu7PWzeKTI07VNfDMtA/5lAP0OE2DElwnDa1nA7
 z6y6IH7hqtuIS/eepQKz3MGIj/ZxXfrZ/71worXXwKIAkd1C1gsMLvAnGWEslQNn
 /lOrUNAu+EoovTdYaNb2xgInXk/XrcHZiK0Ax+GRZFuNzBkrWF6y0B3zGxyNf6oE
 aENh1g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chp159f28-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 09:28:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-824ae2c9ff4so20897291b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 01:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772011735; x=1772616535;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y0rSTNHrb7cMCGYYM8naR9bjvD7jQUjTiqevbIkkW84=;
 b=DEgjlZrL9mkF/BDybVNOkdNiSK8sQyIfB466HbArvb71Vpki8R7VKyAlWzttUWR6pQ
 k09cYVPVopNgEloAOgC1s8IxOIFbWyG14Fchl4Y11UZCIsT+Q1LxPFDfx9pxVqRqaRvV
 2Oj3mqhcYxXvmz3i3s9Rq5gi7O0U1ObOPD93DqjBckFu/AkNZmn1dS/lHjqoA1uUqfMF
 dJCm2/TNR2AoNLiwelchQhaY/5yr9Or5vQU26toKK9XxiBQkJ9SbM0MbUVIiL+Qvi6zd
 DRF5HH8RjWDY4YVn6ldUCbGcUnDnRrU3keeZUVc9yDthgbEITEXc2wSfylC7GplX06VO
 /QxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772011735; x=1772616535;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y0rSTNHrb7cMCGYYM8naR9bjvD7jQUjTiqevbIkkW84=;
 b=jqEWPRo0BzCmRQg3sm/OkwvrVZAEN1s8En1yHvFRx2beZcIjaWybnG26M7m5ki2xSc
 CPk2U9bZDo99vQ+i3gBhSd0Jbijl4i5Z9QymJuqi4+Pl928ppZ3v6RwdXSxwxZPQ3fXm
 FytuJfX0QRgfZEEZR9iflp2mVb+AYFjY4dCpql3N7BzB2jUfQGuZN+WA0ch7Re5Rs1NT
 iCnTzdUO5hM9RMgs6X58RLrfjsqw9P01Nr6g4C0NYcbwDHyljd2ewyW0NZ77leGKWUFC
 4GktWQMILjHS4zftYy4nLtvr7C4u744uRFre0ezEr5S1sgCauuK4XFIHEIqwi37a1Fmc
 m47Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmMqm9556BFb0hCAxjJ3hXbCZilLL10sRmOpevGUkON6qwfP+rqGKyxPbRHXtlX+Q11LrzXhHmUcE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxta8BrhiqrG8NOyTLa3kI5ng7DLCZueTi90lFlWbzcsnu5r7PH
 +YAhjLebc1yg8RVaoBFjK595W4iekb7CwsylnpsGqX1zJ2ip9FV/dTGL0t/5BiB15sHi1zf/Lz4
 fKU0D1NsVwlPQ+zNy9D75XbxGi0MjUfDo2QXR/Ajop9ZVC3S9v5rYJvpvjp7yIq9X7sl2wpI=
X-Gm-Gg: ATEYQzw0GF0x5Wz4fMHioI0onr8Er8nG3gCT7GPdX7bQXYnoAWxCfTGhbeAcZc6s5/I
 VU3nPHqaNp0m9j/NwsFhKismvN5LP21qkk4eHVcMv8eoth3W6LVpwQygfJeTtXy8uI4TzKvwtaX
 e7M1XRzMiBMGDYQR9Nk5XceJXrg75mBHNNy41uc4WDd7tTxtcYBk2RZN9vmhz/Po3klBkUn2M8r
 nP2M/8k8d+WKHo0EBioqOA+eT3x6Up+yTPK1yRQVQbpdcgHZfm6N8M4IdJ46DrHdvZ4qYWdo3qM
 p9rI/U84Yls4t+0JLQkkiMyu6Qw8BWJL1JRSllWz4pmN9AkLPenlYl5dxXzkdQe33vsspeyrzMw
 MFiOTxqC1DjNa4SiU8mshyk+B57HX/Jg66i/eKtT1xit0xGo9+g==
X-Received: by 2002:a05:6a00:6d49:20b0:827:2c87:9485 with SMTP id
 d2e1a72fcca58-8272c879ec1mr292161b3a.32.1772011735258; 
 Wed, 25 Feb 2026 01:28:55 -0800 (PST)
X-Received: by 2002:a05:6a00:6d49:20b0:827:2c87:9485 with SMTP id
 d2e1a72fcca58-8272c879ec1mr292148b3a.32.1772011734794; 
 Wed, 25 Feb 2026 01:28:54 -0800 (PST)
Received: from [10.204.78.182] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-826dd8a1145sm12759019b3a.45.2026.02.25.01.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 01:28:54 -0800 (PST)
Message-ID: <5fc6f252-a161-4deb-b88c-da7729f5a8f7@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 14:58:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: enable separate_gpu_kms by default
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
 <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA5MiBTYWx0ZWRfX3cD9k8OWwBJr
 5zcKNsAHA7fouNd9zYagKXmkBdzZ811chJFoTfFfRSyTrNVamvHpz8fpXiU7ey6/RkMgQkZ7myh
 drS5ZaEjBKpIU6OyWfHAupYdBM4rLcBDJ8xXlrTIHjWPNzNSsHEtIScFqlPzf14ng0YHiyBtGeR
 ppaLsxnByDE01NV5XmTJ6K5iPaIleBIwJfd+iDDL5qFh6Vu0z6fl5YpYBvBcswnYNLzYVwtetvU
 8KHR3Koq2NdTe0butAl6izlyfLOTZ8bbElurZiTPagkmqRjLdvYE58z4TiLntDSGp4sxd5lHsKt
 Dg6ujfqgdKlz458XwaUjoHajldYJ/WpEIjDwVdza0+w1EYkUOKkfFuCN0TakTp+pOCX5boFiCHT
 HLmNkc7rS6OYWdcPk4YgsS9HoZfiyCkAGStbFM9+JOqLuxyuURwpRLia04/1ovSIaiZ/xUmNp+e
 5KlQ1XLr5gU/Z2PAGdQ==
X-Proofpoint-GUID: NzacHUJOdO2HS5uMEfaY-k4csb61mQMv
X-Proofpoint-ORIG-GUID: NzacHUJOdO2HS5uMEfaY-k4csb61mQMv
X-Authority-Analysis: v=2.4 cv=etXSD4pX c=1 sm=1 tr=0 ts=699ec0d8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4FoVbHgPJPfqMihqj2kA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250092
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[mahadevan.p@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mahadevan.p@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 012B2194FEB
X-Rspamd-Action: no action



On 2/23/2026 2:02 AM, Dmitry Baryshkov wrote:
> On Mon, Feb 23, 2026 at 12:40:10AM +0530, Mahadevan P wrote:
>> On targets with multiple display subsystems, such as SA8775P, the GPU
>> binds to the first display subsystem that probes. This implicit binding
>> prevents subsequent display subsystems from probing successfully,
>> breaking multi-display support.
>>
>> Enable separate_gpu_kms by default to decouple GPU and display subsystem
>> probing. This allows each display subsystem to initialize independently,
>> ensuring that all display subsystems are probed.
>>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> ---
>> Depends on:
	[1]
>> 	https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
	[2]
>> 	https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma@qti.qualcomm.com/
> 
> What exactly depends on this patchset?
The dependency is as follows:
As we separate out module loading of adreno and mdss with 
separate_gpu_kms=1 autoloading of msm.ko fails. With change [1] on 
bootup, msm.ko is loaded and gpu card is created.

The main reason to bring this patch here in upstream is for enabling of 
dual dpu configuration in Lemans hence added [2] as dependency.

> 
>> ---
>>   drivers/gpu/drm/msm/msm_drv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index ed2a61c66ac9..65119fb3dfa2 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -54,7 +54,7 @@ static bool modeset = true;
>>   MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
>>   module_param(modeset, bool, 0600);
>>   
>> -static bool separate_gpu_kms;
>> +static bool separate_gpu_kms = true;
>>   MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
>>   module_param(separate_gpu_kms, bool, 0400);
> 
> The patch LGTM, but I'd prefer to get confirmation from Rob.
> 
> BTW: have you tested it with X11? Are you still getting accelerated GPU?

Yes, tested today with X11 app(xterm), GPU rendering is used.
> 

Thanks,
Mahadevan
