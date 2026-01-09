Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A57D08205
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 10:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5CE10E84C;
	Fri,  9 Jan 2026 09:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxoQLUak";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+mecLIt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF4C10E84C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 09:13:01 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60952gsP3542105
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Jan 2026 09:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1P93m0XTzLapwNrcaQ2biPDhM8Asz8miZJjKBvF7vq8=; b=YxoQLUakCVzeOh88
 ZqaK/OwdfAOF9sIZtVbbMX1FqVVQRdPVRy6AA/h/jNUsiKRnj8fw8zBmyc20k/3I
 gfkZ4sE1wlKql3l/BpUpXDKIOrSKKYiF0bxso7vZcnl2zK4Dx6sYxeoBprpe+IYv
 RQHzKrsshZaR4ZdtvawBNBJtgtJKWtxdvuvqajbUJeSATPZNQTMJ+jfGqbDhBOwF
 KKl8qlzD3tEo1F9xwTZimAxNBOMMUfd2DtakIxa3FohJyBz4F3KKeWAtN/yqxv8b
 8LFSP/Cz1LwjmALIpsQLPUuu+l0MYZMlZly9QTGkSyjKZmMziEKrB5X1PPVqJEKc
 NMvsKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bju6b0ph4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 09:13:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b1be0fdfe1so124788785a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 01:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767949980; x=1768554780;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1P93m0XTzLapwNrcaQ2biPDhM8Asz8miZJjKBvF7vq8=;
 b=C+mecLItBAaBsyn03A4FJ1O3XTZgDbL8ii5rfyk9iszEp6fIMwXCsKGgx68EI69pA8
 oqzutONyQ370gj/n43zps3P+hgn3n0C2ainuVKV02nJVKq4wp+QbyrOb35mcFOk2W7g5
 s9MBVMk2Vwa5MaOY1eNX0YPhpdP9plDTVSPt7/PgE3VNzE9qKjiXMuAGRyEuSYFpYfCc
 iz0vZnCN8Ts2E7OHGwWRhXAWjm/KZepKxTIwc2eFlvJ6QF6+7aI+sYhlp3G3WAVrXp8r
 NWkpGQCznlE9s+wYbXaxpXH8LUuy74ln14XujXDQsdAq970N/DrmdaBmzG9k2Uzdm8Hz
 cLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767949980; x=1768554780;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1P93m0XTzLapwNrcaQ2biPDhM8Asz8miZJjKBvF7vq8=;
 b=vRykaW/8K4UOiTI/9ZwTkRukCrF9J4ORixRoC2L3PVtZE5r/qykdefLTDQlefHP1rt
 f5EQlOhArAMXtRAHQ6y/q5Cf4OJZVYn4qTlJv+CAkcTdC2jojQ1VfFcLHcL2xcBgtCM9
 4CNBopl/Er7PHfJ6M599mkVJj7L+0V8+xnD3Adh8qgWxjj+ukkfu4Q+bb6dRhhg1pKLr
 mZRKfZu1NzkF00Q7sH8NkfB7zzhiESKV+NzEMjjATV2KPbYwpSyZSBGXF+y+ELtqSsv4
 1pB4g4dYCYx1v7hlV2r5GJSwR5n4p1YGGG38Sx5fY/MqO2uLB7QeRvSw6iO8yHwzKL4Y
 0AVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQZa6drbRTkOVXxzOITpnFVoKjRwX+XqO/hllsQc+BccmUaVmU/nJ717gFGOaY1JCG5KQje/hYwys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKDfT7rjC+140DQQItwxfmtN/n0/OOvPpSdn8UOF6+rc3sFqFX
 Q5dV3Sqi840v6pynUagsz1n9ZYjuiSMoGdVxzzUYR8Ll2XVKoZvhRup5oqvPyejGPlaSy73OHMG
 pyh3FLwKAt9/d1LddgR5JMOkpgQ823JPhamdUyvghFi5l0H0zJ61cQQT4hwhjl4V2Zzw3/J4=
X-Gm-Gg: AY/fxX6Vaq3XMqkk259PNh5f71JZ0vEDXpWdNFwiXAvKhTOkV9z1FRqWWOiRzrpnui+
 OnBswOT4YVC/EgTuQYmG6JI8gf5AIn0cvt/Z74WtlXmxxO+lXPfM/MTSdTq14dbLlleDnbkADYi
 U5ArNw+fwcUXLHg+lLHRYOqcdOlhvBp5PsRJiOGj+oTdm6J7UM1aLw1tnd4lpg9fiLCpbuwgkzd
 71yJa/tD6mkHSjVLoPjn3yzqKn/hR8KgUNwkp8OCh0oX3m56YroRkkmDB4tnFRKlCwZIWmuadWd
 zsaJ761b/oG21JcT+AWRL1cXUIF6PuYIKlrosmvp6p8V8d3egAa8XX4GcUFSVXMlM20KQMsPb59
 DKsXZLvniSsuKaZhd7Fvd4yIzeqNybgI0BweBN2/Kd1as3KsHKRMv7FdRytLz5oT9s3A=
X-Received: by 2002:a05:620a:2847:b0:8a5:2246:bc29 with SMTP id
 af79cd13be357-8c3893fd6f5mr926314685a.8.1767949980556; 
 Fri, 09 Jan 2026 01:13:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeBZSG8kdSBLShp1+Wc/UybzJzIr8kq9RYBBSnMDG9wd87B0tyDpTBrTpAW7NtU14bEKYlTA==
X-Received: by 2002:a05:620a:2847:b0:8a5:2246:bc29 with SMTP id
 af79cd13be357-8c3893fd6f5mr926312685a.8.1767949980148; 
 Fri, 09 Jan 2026 01:13:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a5187afsm1043952666b.58.2026.01.09.01.12.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 01:12:59 -0800 (PST)
Message-ID: <faf2dc8f-fd5d-46cf-8572-41879b3f4aa4@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 10:12:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/27] drm/msm/dsi_phy_14nm: convert from
 divider_round_rate() to divider_determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX3862ZObZ+kGy
 SljyPkrsBxS+ERlhE8ADfMxBMVIec0tGU6smW7rDtBAVOiEeD8m2JeMFTHCoLWV02PCrShanG/V
 g2L9XKZ/lavMRnxTwoAGb9VdNEj4G2M+k9O+o/v8Bycbiv0itEw/ciCIQHyrEKazBqcz73E49Wm
 CYu/cQkxIbn5k/Mzme0CJnwo9Ylu6BKG64l4tTTsktSHZv7IJZ+WUYcXGvhQu2tOhibbyschAB6
 k1aZcOkDPh4rDNcVFYFB3J2iu3pGOeDisLirbOFc9aEP2kkYKABpPeGn02tT/6GYVm40I2agLTl
 YS2HMetc1HO2w6C8Nu3BLaGpxgvujY9iCfJNUFW1VKCV4UWNoBpN4JOftuRgT3+uQjeJczMI171
 cS8QlVIOsCI9hfsaqoAxzrpwhDxmuEq/6TTS25HwbOwK3sm8Tyz5AoKqmgGr4Te4/Xa35SEv8Wv
 yzdnV+M9wh3S31I9FRA==
X-Proofpoint-ORIG-GUID: FtCriP-ViW3RZmSbhMDndEmWaf6RoIGM
X-Authority-Analysis: v=2.4 cv=V+5wEOni c=1 sm=1 tr=0 ts=6960c69d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=MmoDKESpECQAgM94Xi4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: FtCriP-ViW3RZmSbhMDndEmWaf6RoIGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090065
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

On 1/8/26 10:16 PM, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: cc41f29a6b04 ("drm/msm/dsi_phy_14nm: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

