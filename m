Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA2sOSCGpWkeDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:44:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9806B1D8EB1
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96DC10E4D2;
	Mon,  2 Mar 2026 12:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUoRwYfs";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ThqOGDxN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC8410E4CD
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:44:13 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6227mXQU2612430
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 12:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pahk4TifdBrvSEGh8Fb3x77ODbPcW0N2RJ5yY1oXuqA=; b=UUoRwYfsG8b904Sf
 8nvtZlsVaFgVvM/hm2ATYKhbDqcTerzW2uA4dMWIiZ8p+vaJKHMoS3LsK6u5RvfH
 SL12qndnqyfBvkt6ZYISKgnxkJs6jCuIWADAYPTO6iH+AvcEkOiW+qjP5OFPcbHB
 PuBHdRP878DXXGCTAMA3Z2cT9OFqrRMVPy1KgXE6xWoL9C3rGAjk/1n/nRcqN1cY
 TpVGSHvO8V/cL1+XohE5gFD0lGfw341BaaP1Ja5pIEBZlk6BBBD5SGNKzDK7Qq8/
 02PUpisINlZ7LsHnnyimdNSbQTkk9nP0NPUGxo8tZcKDPMwiUPPUH8Nwi7kwVGI2
 t/p/Yw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbauch5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 12:44:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb485c686cso389764885a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 04:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772455452; x=1773060252;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pahk4TifdBrvSEGh8Fb3x77ODbPcW0N2RJ5yY1oXuqA=;
 b=ThqOGDxNkRyoy8vNzls8Q3MGq1D21lueEFaQa4glSRgO5aONFf6G3cAI+n9bSOaJh3
 KI2JM8Bgeh5W8J/7Dfad6oNrCiqAq9jM3Rs/ay/RRtnqJsoz4Ju/V8KqAKoCkPEYeNtv
 GOzOTB7X/LfX8vi8CR0ZFV7GmkWMyW/2jH3KEqdkQSQk7qrPMuRaNXfTEr9SLCzasXAw
 5ohq4ePJp/OfaDVHBMwjKmeYu2dYCfymfKqr6jNIceugzLCn3Albb72+GRsaOToK9skH
 1XzjYWFXzNPepG4jxoqC9/9bPD6Ezj5s4Tk+6poLwrKP+YyYoSFDPK1FFfDQWskolIuv
 3QUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772455452; x=1773060252;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pahk4TifdBrvSEGh8Fb3x77ODbPcW0N2RJ5yY1oXuqA=;
 b=C3iWxq++gD1CAvoIsIa8sd1+tmqgltM5mp5HjpSwjO/+hIZUyhe3e3xZKGOIP5itWJ
 XQjV+PMPy3jZiXLHxl/7nxR5X5f5fYvyM10Vs5uIP3Yl+SyJFlsi0sFN/JvblrZBO1HL
 RBBDUkCpGi/G25e4sFAipencLFL+ri9vGmW6L0b1KsWyzYuorCGx1cyz7ekf4J1Gm1ow
 TgKt041YiEBBYy6FbfwHakMzYRLA8gulKx1uzYoWpRd68I2MOivEuUjeOB6vcQ/ocYK0
 6d2S7i7sRRXrzRl9rGYfySotQcr8tOaTvfthFGPP+A7el7AH3hY7LJ1Xkw5jw4lPFGL5
 woJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3uBtTvNg4FntfqinZwspVW9BdI3jhm72oZctk0Bf8+7k79TXhdMXl6GispqK3zX2U9NxebSjoDiM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxG0Gpq/SPejf4z3N8yY5yD/eJewunKtp0/5/y2FY6kTHNHMzJR
 8GM+eKovBYmRx61BS/77brrzfzdFvhi70D7DNqCXBgJZLLWrbNmj8ZVsFHgprApG1sRyjBsTlQt
 xUmuKAgzMgF47EfPynzNAErUT7sJlSygzrWoquGdEJP6CEha5bZ5Nm7zPynpV76wwGQRbCEE=
X-Gm-Gg: ATEYQzx9LUX/zmEDYrqRsrlidMCbsetNVHuSDwo+38CMshcpcAI6pLnucqjhu5IfMcQ
 HwNIppNFdLUuFo0jdwuvJEwIFdmBXMl8c/XkLlYApONzPqW5TnyhP0TtgNtbS5TM5euzH6MGZpC
 37V8n7cp/SlgOSJcF/J/LA3BhO/+H8uNrYmyAg11Uz8cA4gKAhBM+cDfK09j2nIMlYx70CNmYrE
 ot410os6Z6PQI2XkpYjh4C89r8LtGv8CNe8YXtv1XQxg9z2SgICAmEBTHKny4f387aLc+EuENHC
 WnFVIgwrsl6Z6IVdqjOe0/tp1VXAhnYrAvgyk1HI/7WpADYGWmIxTWnQvQwG7AbDK0+gOkmkI52
 XhA7frJd2LuCt+IXVvV1d8oFPf6OW+IgU3TzidW4GWFqGHgjz9EZpzpKpctkT1R7BxCpJa2+j/N
 scDK4=
X-Received: by 2002:a05:620a:4607:b0:8c5:33bf:524c with SMTP id
 af79cd13be357-8cbc8ee61ddmr1276843485a.6.1772455451739; 
 Mon, 02 Mar 2026 04:44:11 -0800 (PST)
X-Received: by 2002:a05:620a:4607:b0:8c5:33bf:524c with SMTP id
 af79cd13be357-8cbc8ee61ddmr1276829785a.6.1772455447431; 
 Mon, 02 Mar 2026 04:44:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ae95114sm470916266b.49.2026.03.02.04.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 04:44:06 -0800 (PST)
Message-ID: <e9e4e0b9-fd8e-48ab-8e12-c62e0f6ec17a@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:44:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] drm/msm/dpu: drop VBIF index from the struct
 dpu_hw_vbif
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-7-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-7-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfX1a6ZLwFYzmD2
 LbiBnpazEKGagIt/KR6N6TG1vmj5Qfeom/qsqv2WySE0BbIY2fJna91ccQphWT4RmWjn0NdCnPV
 YKTO3rS0RNWQjvQ8QCIiyLwzbqlNsW0BKP6110LwvrPxBZcMOYkKjg1zMLustuaeS76q9WlrM5B
 08Tgd0Jdh0MwcUryPFOOGOAfjdy4eHR1RbPU9kCjOs9N94AVRjm/01Zh6qs1UxpItPzkK2D1feH
 CtraRCeJTH2VkBUYMRJUYc92AWn/d3NQmdP9vsu3fB+WGlg2ZteIjjQ60cL4MdNW1sUPCI4EuA2
 owKyPgMGVX8XjP9/ovaZQlLeX+hlhzrWbkLHCg11z/CULbUs5JVowx2hZtqjkyo7VvJvbXVSXcD
 O6eXlXpH/kg5OudlHMmBwBh/RpbvGxzjE1/m08LGs3s4nd65pAVgRYSBgzhwBmtoEsZSBRBNg3d
 alY0HpfA9QIwN8zvVSw==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a5861c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=htV9gPYb1xck4idZc-MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: BKVbkNe4lhhYyiXO7Zji3YXEEWqTFxvI
X-Proofpoint-GUID: BKVbkNe4lhhYyiXO7Zji3YXEEWqTFxvI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020106
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9806B1D8EB1
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> Since we don't support and don't use VBIF_NRT, VBIF_RT is the only
> possible VBIF type. To simplify the driver, drop vbif_idx from the VBIF
> instance structure. As the last users of VBIF_RT and enum dpu_vbif are
> gone, drop them too.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
