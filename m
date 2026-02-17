Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCs+DDpJlGn0BwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 11:55:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D653C14B0A4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 11:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEB310E1DA;
	Tue, 17 Feb 2026 10:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjpket2t";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cABxVOgO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144B210E1DA
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 10:55:49 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61H8wYRO288180
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 10:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zqkImrZ3d6J+orJLxyPG7cK4X2BClCQg2tGoIiWRLY0=; b=gjpket2tJkF7Ry6c
 4Wxoow40RYWa1aGiYUPjFUiolbC8H6rqJ6xSGmY7S5fnMe6U+ZTnJOGIsre4Lxn8
 NJ/Zkz4nigFnnK1IqbRum3Org8EoX5Bc+JSHwp6ZDBEHq4udGF6ql2RZfrn6gX1i
 bjbNcshnjtxaPglb1ahI4lOIt+XidFv/rO5vdULJDlI8UfeiGDUeQTOqiSk5eT95
 3GceHAb5m4skPLqWBzmdc7yXp0H0c6+SNHNRBjEPc9uupIOQWSoRQNAwCCXKHiVo
 dS+XbCZ40Qd/pekF3d3EOjS3y1dpdk+xVfvtyWHYk0MogZ1P/TyQvEUNgVf5brjE
 wpxvgA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrsyus-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 10:55:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb50fb0abdso281988685a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 02:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771325747; x=1771930547;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zqkImrZ3d6J+orJLxyPG7cK4X2BClCQg2tGoIiWRLY0=;
 b=cABxVOgOW7372gfnMWfpnQL0f3RI5acJh5EZKV+7gYbjY+pyl8lZ7YX0wkM+QIYcbN
 4HHJNYtuqCSpQVmT4GbNLHni1mLPKV6R+8gT532dt5/tOOZLoYFQZU4rnSd8Yfe/XzLp
 xQJR7Kd5SH3EK2sXLoffg9oLj3aLm6dxrmChnRywlulON1j08dU5HQOhciYyykmvkjQZ
 UbjpjgMxAwLMt3tcWU6h2ON7tcO8YGM59TFReGdgbTbuevCKElvPLEhFHZzBe8DE3kTE
 h/aZ9QeW96n32FgWy5oJqsPu1IZl85uJK9JerYjX4WjtTrlYMxek4Fo5kbDC+Sa4CXTJ
 uYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771325747; x=1771930547;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zqkImrZ3d6J+orJLxyPG7cK4X2BClCQg2tGoIiWRLY0=;
 b=dVHvOddtmI81n//sH3nyu/l6XpmxTU2TEcjQW0OOJww0aLH+G3jt1oRssr0UDoNXMd
 VquqxcCvRBNxQ/TYyWBUCtwhgCn2jh7qyieANIUp1Eas1UASiQ5bWjQ/kXa8/BmOv14w
 JqlGN5C7eoNHxCTfLz0T6anETh4A/N0AVLvQTgJE6FZMulTg9y7h76tQg6w9t3BiDcd9
 tjvLYvGL5eaqcwpUM1ooUZ/3TS1tQ7XwiYT72AscPl7ksNeepgnvJ20ISSw5ymYo0u1n
 lsRYuuzpsy54dCWTEn7Jv0R68YHG/etgoXXWIjUOWUakbg4fKT2vPtWmkxad0vA22Mdy
 3OyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYs7jMYKxK2iiOGsnwYEl6I/ECG91eGVacCeOLDElfeWO2pbhQNawz2cL5EKReNnpDq6IWA/wJZ5M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx86AXNF0cKJAKr3DkODPJAL+SXdkXdDGU2gNmfNFYW4qF938PZ
 tlKqdwdBeETOtkO1ARz+gJkkG6+5CqXVrahJPorBM0M4GAwtRPXY/u05eIWNBF+KMQ2T8VrQ23P
 gOGffyBpHfs+ZaYJKYao66uEluV8TlR4YgljRIFuo0hyyZIm/80g+YON9rYAGzIWApdJ3gYE=
X-Gm-Gg: AZuq6aIQy76X1fawc3iHamPLPIfZsiWDiP0rdbmDq4IXbV/+Sfndv7bG+kuv/y928LH
 T7VvC1qZYKyIYufqbDMgZYYHTsjwpIlKefrLoDtdhrMr8LRqxn4xIUEaoECgIfQF0rgZDd5htHN
 lFtqK+ppfID4PEtowgdBHPmXZKsv1QetHZNoKUy6P6cRwRyDEAPb2ICKALwWcfu/zgEUWn2tOII
 KaqZmy6lvbK4E3UC64DSN5Ml/H8+70h5U9cLU3fZCJcV+YPQnj3fFYVuzgTNI/GZkrOMBjdzfTB
 xmL6AY7CDURb964iJAs299sd/QemS3YuncHlv+OlMZsFUuE39FsV4TGovbJ0/u/s1xm0o5tz9TK
 cOfTT60EuVLUJjzsI+AMC5u4udgFcH0z015gNr87MQhcMHUuPDh8Yn1AXZ886FDo1E92GsspZ8H
 UXxKs=
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id
 af79cd13be357-8cb4084bbe4mr1324180385a.4.1771325747303; 
 Tue, 17 Feb 2026 02:55:47 -0800 (PST)
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id
 af79cd13be357-8cb4084bbe4mr1324177385a.4.1771325746709; 
 Tue, 17 Feb 2026 02:55:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65bad3f129fsm2234759a12.29.2026.02.17.02.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 02:55:45 -0800 (PST)
Message-ID: <5dd7834b-2e9c-4865-af6f-c362aa0c8287@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 11:55:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] soc: qcom: ubwc: add helpers to get programmable
 values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Wangao Wang <wangao.wang@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
 <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=69944933 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=gMz6hfKilskiRDmxBycA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5MCBTYWx0ZWRfX8U++NuokbuD7
 5iMpQzlhIcA4/DVWP3/zmVMx8AkJ8iEUq26dAFoOr2EtU+jK/xKrllSOUY6m+HAsj2hKZ0GvOSs
 Nk2modjJwrhRWtOoYC3jNBgnIMFiXj2PJHUUrbg6LIjIWbaUG8PDw+Jgq98HlTtgIVz+dYvR5vh
 QRzpCygQQV4KTiaHpjkoblyX4WOwHW7YU3aCOeAg8wnRDI2UvcVY/hHmuv1YYP+XECTvWnvtCTi
 FB+OHptItq/ka037LXoW9fgggc72KzGtsI2EJR9jhNP50f/o/KaOr/CKuwZYtb88ss31oIymSG3
 KPP0juNAEU/Nls0Gk59eTvqXKmsFpzOhnrCYOKyItpmcTtjV5uGvsoLypqQQyV75bWajIGiBB1f
 xRYc0aZlJ0vnv+tvZnpRrWuqJHdqjcQxhnw3v+YwemVqMQ7Tj5ZxEdZJv3Px85Ea2JtGt/7frtj
 /M6+MZap94Fnk0UVvmA==
X-Proofpoint-ORIG-GUID: wLmYrW0_orG-TbkrL0sDJsfo97PKD2ch
X-Proofpoint-GUID: wLmYrW0_orG-TbkrL0sDJsfo97PKD2ch
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170090
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:akhilpo@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D653C14B0A4
X-Rspamd-Action: no action

On 1/25/26 12:30 PM, Dmitry Baryshkov wrote:
> Currently the database stores macrotile_mode in the data. However it
> can be derived from the rest of the data: it should be used for UBWC
> encoding >= 3.0 except for several corner cases (SM8150 and SC8180X).
> 
> The ubwc_bank_spread field seems to be based on the impreside data we
> had for the MDSS and DPU programming. In some cases UBWC engine inside
> the display controller doesn't need to program it, although bank spread
> is to be enabled.
> 
> Bank swizzle is also currently stored as is, but it is almost standard
> (banks 1-3 for UBWC 1.0 and 2-3 for other versions), the only exception
> being Lemans (it uses only bank 3).
> 
> Add helpers returning values from the config for now. They will be
> rewritten later, in a separate series, but having the helper now
> simplifies refacroring the code later.
> 
> Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/ubwc.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index 5bdeca18d54d..f5d0e2341261 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -84,4 +84,19 @@ static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data
>  		 cfg->ubwc_dec_version == UBWC_3_0);
>  }
>  
> +static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)

Should we rename this to something like "qcom_ubwc_macrotile_mode_8ch()"?

Konrad
