Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55285B54B87
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 13:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8CD10EC29;
	Fri, 12 Sep 2025 11:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P23j4hUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF52310EC27
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:50:02 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fLAn009110
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YzF2SVlfGn1ORuyJ7oHhWEvFtpmrZnuITZV7ypXxf3c=; b=P23j4hUnFVWwLMnE
 F6LQig/a0wxm5UQUp6+G2DMXP9+ABR6T/n+Vrkeyh7Gij5PeMMKBvcx6GqOfsAOq
 RYbkeeSi3QkVqV/wERaGFMo4O5LNwhCqJRp06Hka6FzLMCwTYGeNUczVcetKbIaq
 wsyqNdMz/SfG++cNyEF0jGuoKumN+3/tKNpvVrQVZTVCKDSO5XPqeWDesXYXMzxr
 KFK524t9rz3YoMeCM3MdmwdpgYwzdzFNckeEBUaYUDPvCC018hCc/OTh2udHLqH5
 OrxfprTgNkVlRxle6E87JTcncVrGwf9w3pYId9ESgnvabCpdkcB6cGjvqKUHqJxj
 zp8ZEQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj13g1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:50:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-25e24e75b1bso789655ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757677801; x=1758282601;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YzF2SVlfGn1ORuyJ7oHhWEvFtpmrZnuITZV7ypXxf3c=;
 b=UJJeNOGHv9C4+0EWrIigg9oNdsNoYC9GDBQnyZcWv3kaXQ8BIQTLKWQdrGwjMoIWuu
 St8EFYy3OTphMLF3Y+EHfr5ARJZHuaaFdXqEek7U7dSmPpP6BHFBf7/7UrjYQXVc4EI4
 gSZVb4iUO6LtzrZcRBUnVJ5pvhTaLgSTszvShiTXBKecKne72JdzVsTzJnXWNLc8niPA
 ruI0kEinOWICMLWwiu5MInHzUu9yMkjmWXwWARQ9OrO16oVujLYu4n59xRqRQ/gtalur
 6BF2OMB7Y+Exmc4IG/V355f3pTvXAuXCUUsLGUjSjmkRnOfRmZac5kdQOrsydPBPJgh7
 zKXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBYrJRL/7BQhkMxaIaafi0QVsw02Xk79cn6rT7SQaTOmhl7d1Weeg91MMi3qkxZtLbc0RWtfqEs3s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyobm4qcT3p4cUxHAsSfbmVDHlqUukFzq+1wMhJywggYMmQdXs/
 fZrI2Yk/EiDfsrtgD6AsNOqzCSbdwtHLYiX/CmxvIf8Pf54S6oSgYIYQdgfzMSk7P77o7u2OXDP
 XqBTx4z+yYTffe+7YVDJZAGzqlzvg68YyuYYJSygXDSX4SR5H7twsm/K4bWkXsgtwsUkxmXk=
X-Gm-Gg: ASbGncsLoEbh/LnU53fgRjywB+hd/BddFSGDLQioVuP0wg9js80S3kC/w+Q5pN6tUaT
 bj8PpxIA0kO9QvaJb2fxKWXZQLGq8WdUowkBM5Q+9MhZr1jQ13ZaeRvzvfs6ta0iDBkdBArJIWp
 XJNtRmkDdbW5dKdRxUcJaC5q3yTjr5/o2jUrNW9G5s6fbIdExWGgXfIWuEvFcMli/nJVVTqTKpy
 fpLKWxbjePkqkl8/Xfs6mImVgXKLRC3ZxWx16gTwruwfyjrO+bIvs8jH5aWZy4HeYpEkDfczlGk
 cwVpRmVN84M3tbgSx20vEZ2slFhFXsx2nJ38hUUZUCoTQKn8mSdXESOTSUzXqvNjKkZgc4jkiqW
 UnbKXdIMTGu5eIGwq8Sj53vCmUMjOiQ==
X-Received: by 2002:a17:902:c406:b0:24c:b36d:637 with SMTP id
 d9443c01a7336-25d246da083mr18921295ad.1.1757677800634; 
 Fri, 12 Sep 2025 04:50:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWi4TjYFXB7GnUvOOedYDlXm03TtmgN9ypPJ2FZ+xs8IcitlyLZkYRTQqPLihrLpPvtOZrUQ==
X-Received: by 2002:a17:902:c406:b0:24c:b36d:637 with SMTP id
 d9443c01a7336-25d246da083mr18920925ad.1.1757677800095; 
 Fri, 12 Sep 2025 04:50:00 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c37294b5asm47417025ad.50.2025.09.12.04.49.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 04:49:59 -0700 (PDT)
Message-ID: <5d25d05e-d545-4b2f-98f5-40bfbcd24d7a@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 19:49:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/13] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-6-2702bdda14ed@oss.qualcomm.com>
 <ejwrkogssqdzxraacvxdbasxg2ud4t53rb6da2g4vdryyjuzoi@evdibveq7w46>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <ejwrkogssqdzxraacvxdbasxg2ud4t53rb6da2g4vdryyjuzoi@evdibveq7w46>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PFPZ_5hDcgMD5HQVUerNaGzvDcX_Fl8R
X-Proofpoint-GUID: PFPZ_5hDcgMD5HQVUerNaGzvDcX_Fl8R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX46yDs2p09h9o
 +jNB/5HGfG+j7y32Xh2BM81ApLOEFU4Kzb+i0u113FwMERimmEX7zmo3T073rL6THOFcS8plOBJ
 92z3JRiBT+m7bFEBal6crbkuAOaidEIPKlbjyPW/r2BA/e2KUkFbc15qvQYRmwtfcVH9TSAOYkh
 WLOt6bYRfkzaBEWJDLVWsDaUA2VXM74mLXhP0oZdQ/6/I/EkVQyJ/JzP/HeQEDOrS8hqEsFqsCJ
 F/0E56Y/oKAfq015bzIpNkOEIuQi/cihhCwjyAFn00lY71+AAPFg0CVsxKYMlyhu1OgGB3iPqfW
 LdXhptH9qq6rh2PS/nTv8Pjrbgy5dCs82wIx0kKg5uCcH3f/EYndbZjjTD3SIAm3sRuT5FR9wuj
 FiU77zUW
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c408ea cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=vDXniOzG41h6BQfMLKwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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


On 9/12/2025 5:56 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:03PM +0800, Xiangxu Yin wrote:
>> Move reset configuration to be managed via qmp_phy_cfg instead of
>> hardcoded lists. This enables per-PHY customization and simplifies
>> initialization logic for USB-only and USB/DP switchable PHYs.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 56 ++++++++++++++++++--------------
>>  1 file changed, 31 insertions(+), 25 deletions(-)
>>
>> @@ -1147,11 +1159,6 @@ static int qmp_usbc_parse_dt_legacy(struct qmp_usbc *qmp, struct device_node *np
>>  
>>  	qmp->num_clks = ret;
>>  
>> -	ret = qmp_usbc_reset_init(qmp, usb3phy_legacy_reset_l,
>> -				 ARRAY_SIZE(usb3phy_legacy_reset_l));
> You can not do this, it will break compatibility with the historical
> DTS. Legacy code should continue using the old list of resets.


Ok, then I'll update it, since qmp_usbc_parse_dt_legacy still uses the old
list, and qmp_usbc_parse_dt should use the one from cfg.


>> -	if (ret)
>> -		return ret;
>> -
>>  	return 0;
>>  }
>>  
