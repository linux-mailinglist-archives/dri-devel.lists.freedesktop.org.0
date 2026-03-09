Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IC7JAzBrmmKIgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 13:46:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441A82391AC
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 13:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9202C10E4ED;
	Mon,  9 Mar 2026 12:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROReoo0M";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJD2PGuH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCE410E4F4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 12:46:01 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6298WGSq3773410
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Mar 2026 12:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Y4ylvvIghDzwrA7ZoAXsm0B3qXsBRXCNb46+t52arhk=; b=ROReoo0MXa3SHxcQ
 h+ABp1i2quDUQ+GMylGjYGSws9QPYLqlo6eah4K/5vXekTfTVenTiFNRY1qHUnwi
 c3dZLFdMKaY2BRUwEpw7N8856E6iUObrdpJ1az1B9kRy7/THYJyapnsFv9zLsUB9
 RCXgRJQvKlELv1XOGlB5CWXKRD7HHcyI7HJfxqls3sn2amMSNcJGWxMhiA0OXQxy
 nq/1YIIlO27ttp3JtcS5X0Yu6FQPw3cHCDCA3JtK/2DcZmYFjTJhFN+K1YMm4ngf
 ffDs0esZXRmbfpSrzWJgj8Gdr/Z+aEZst9kH4yZE94kKH0EYgf/fomQQVc8lq7EU
 e4pM1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8uyr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 12:46:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb39de5c54so764831585a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 05:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773060360; x=1773665160;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y4ylvvIghDzwrA7ZoAXsm0B3qXsBRXCNb46+t52arhk=;
 b=OJD2PGuHAUarqsj3W047EsY5BCbr2H82JshpAR6rzmhgX54Asx/vRte/znQ7Z2i//4
 qMcxS0xBN0ZYsnmOoPXgUVsA9m8ctUD7NPDCUG4wYW/u278a5f73tE9B8QrdZPu6tMl2
 vCVm7Uzc1Q6CC/h4bU+knPa9Pg6CGF5fP8tMQnw4VPNmeuWSWPldA1XtnLx3zu/wRGoK
 IHfFcHR44dKYU9tYjKNEltJs+BIag9zvIc7XCbJb9vltF6wC3SIDvekXgeItUFzLXGht
 iF0wkEdSZfwchCuq8YFEetdXagZYK+ZlSGhMdWHo5/rdyt5mwwbDYbVW3flgHtTDXGYr
 My/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773060360; x=1773665160;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y4ylvvIghDzwrA7ZoAXsm0B3qXsBRXCNb46+t52arhk=;
 b=r4qEl2DMFPjMQ0BgKU72KrpmmQN7gZ6lPoiJS0lBCCrg11B53a/0f932IFGCcIoyqx
 fVkB9xHlAHjrOI6II1kVBFVmpws5Jy1hedAZujczcP8oNR/MCsE1GQjJIl7NsV3+g9kE
 FUvEz9LOqVrvcvLTJ+7mkF6d4uYVlFTZEqaV+q9G0iiAAi1VsLIXlXWbX7fdS6W2r/gt
 xQBxEymDzYxceQTfe7rb1929fVIyOGGK7oE8HIQQsUc3qQKVXz1q+IkNSSm7Yn+0tr0B
 Hf//kR17REHLt8vzK5pk9EPHmYYtqlIw4JVNgsnPy3kNSYH7vx6vmFnTsBk4OrDRWb7k
 eg9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlPJLs8HltTYoMqJ3o94m+aCcjQvfmAeh9Y4jdlbh+lMNcxu+vpLAMYh8Gn1zf3mOtqNIWqp8+PVs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza2MvFFDwqfkszzlAwPEkML3IOkEntiNq4bCKm5Xy6vGbXF57X
 yR6rExaEJqgKyoN9M4+Hl+aKEx15vMHZp9u3FPUoFJxKWx0k6vRFYtVRSTPVUaITs8f6lmGoXUF
 nXDfOWsFAApb1Ktg5dbhaC1eMb5KBi/dS5Wn7k7uT2s+THjzeq/HUVIz0RVLn0hMmjCwW8N4=
X-Gm-Gg: ATEYQzwUuGDMDsY59fzOoN30kLCgrk23IRxWRGRVVG+WpakOXBWgMWJp6QL5UfeV0XJ
 bptWQubepDWz0B0d5KZxXP1t3B9BIbWn45DNrjtSZ83OpPht3XZ4aYwE+4/1tK6voZ1qc69PIFM
 bp+An9L3/qmuld5HDdpRWxPziPib7iFCfjVfX1berhJxxmM+11YSLT+Ibc5GxqJq3HqWW8fxQoi
 DDvXU1zb8mcVkwT01iZ/HB6l5HmBCjFkbWn4P34FOiU/RlPqSVkgF7hYToW6VZ76EgWhJFUgesP
 V0tLDsAzBhFB33LGpv+TEctW+n9SXCuOj9Xmw0hg75+oeEnypT4SVC5ErUQRWMfI3mPlujvlRmc
 M9MLBye9bgxsW2Fti5t+q7OnCO8+zS3X3CS4ey9505NbJKZunn++GPQQbTVUNTUIggpDMIW99hH
 8ufyc=
X-Received: by 2002:a05:620a:6cc2:b0:8c6:ca3d:4e0a with SMTP id
 af79cd13be357-8cd6d350fa7mr1065404485a.3.1773060359858; 
 Mon, 09 Mar 2026 05:45:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc2:b0:8c6:ca3d:4e0a with SMTP id
 af79cd13be357-8cd6d350fa7mr1065402385a.3.1773060359436; 
 Mon, 09 Mar 2026 05:45:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-661a55a660csm3141140a12.33.2026.03.09.05.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 05:45:58 -0700 (PDT)
Message-ID: <9a67cc73-755f-449b-9be7-b8380eaff4e2@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:45:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] drm/msm/dp: Fix the ISR_* enum values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
 <20260305-hpd-refactor-v4-2-39c9d1fef321@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-2-39c9d1fef321@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mP4e-nCTjOwivrBCbSYfWAAuKienlFd2
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aec108 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=hxhQaWjiUK3sto3hAJ4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNiBTYWx0ZWRfXx/IQC7+0lZRu
 cqEl16zGstUS6oBLGtW1J2dbP9wb/Cmy1PxkIg6y9g7FoALjJbGE3vW+RmVEgRBeB4baJ9VRtix
 kf7QpVL/hjU8i9f8G/0HClCDYuBjQta7jt2Z1Sfg3eiq1Mcog8je5QCKBFd1HoaixnV3BSAUMPl
 PibOJIxdKy/2ZL/uXdu/oqkWCbOEW3FwMxrKWwyP2Tr1ZksYY5ALnoaK9Q9jwWacA8I9bLWlR4P
 ljqfdoKowDwakvnqJN/azERmNCxPyQpe0+WzHh79cVxQQ2fxLSkh19mIpaGsoVEVAQT0Hc0F0P4
 pwX6Szu/gE7vd+UsnZSXDIPakXiWCDKFt3OQWejb/X4YMdkYFGKPA9TOkfWvt0SMJ/WQYSaAFa9
 jukgDWyac4bTKKVg57ixHJH1xpbX24vNaj4YQYmSQVB//G0wTvkAVTkRxXPix5nOMqmdExLCMe6
 e3JhTLBRzMe6ZcLvBbQ==
X-Proofpoint-ORIG-GUID: mP4e-nCTjOwivrBCbSYfWAAuKienlFd2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090116
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
X-Rspamd-Queue-Id: 441A82391AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_khsieh@quicinc.com,m:yongxing.mou@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jessica.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

On 3/5/26 3:30 PM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> The ISR_HPD_* enum should represent values that can be read from the
> REG_DP_DP_HPD_INT_STATUS register. Swap ISR_HPD_IO_GLITCH_COUNT and
> ISR_HPD_REPLUG_COUNT to map them correctly to register values.
> 
> While we are at it, correct the spelling for ISR_HPD_REPLUG_COUNT.
> 
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
