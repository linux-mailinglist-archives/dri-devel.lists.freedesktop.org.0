Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAC9D235E2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7813910E70C;
	Thu, 15 Jan 2026 09:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M04mlgd/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HDWQV8yl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F63A10E70C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:12:21 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6ffsn1744856
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 j2NDP/EGkgTdQmx4cjpLRwc8p38qoVtAu2G7CGSyXyw=; b=M04mlgd/lD8pKUj/
 oYJUwnoCnCrXay5CUrW/1uqZbpWgajlc+SMS0Y+8MutyuRq6Yy1LJLQLFyhFtg1e
 0SSiAqJ9spE5TfIR7WFw3vzr6YPNZG95bihuHh3G/Pp8gXptI7/vX464/ZMCjN6t
 z2+vR1gEF4bduO8BcjP1XBdC5L6CalSs0dfkNNuc8PBydr3zco5w8AG7fdEOHs66
 l9M+YeKmyFvLrTFy14edI6GWLzD9qdT2suAmVLSM7XJ0UasyhumQYIRSboCfb/Dd
 zBYsEMHUL+ZRJau2d70RuYLCJmd6m/CVYIzKLMZAZ7Q2bjCpBZrC05iwYoy7H6+i
 AWnAJQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2gg84-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:12:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8bedacab1e0so24966285a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 01:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768468340; x=1769073140;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j2NDP/EGkgTdQmx4cjpLRwc8p38qoVtAu2G7CGSyXyw=;
 b=HDWQV8ylP+9VnDcz4gL3mGHQ5OBAFqAUHeSpFVTxvXafY4cLT6ouaosGgPHuVbr4y9
 d2jBbMvTJJBmSvLqp/Lj+Io/DU1B6DRBsYYnQaIS6Yzo/qHdCKTh7cqhzFbU5sr/1uIl
 xHT7oWLcgmuTa0/wwwtAfb55JbbsAbti6m76P75P3up194SpbCJJhtHDIN9hl+RoYbZ9
 44yAm+dbp289tNxzyqrlqhfdeu/tDW9kTlGSQ/hxc8OlHjsIvQBa8CeSWH13/YB3EdeR
 xuM3BdzU5ZhPeQgVYv0r3vR//Hje0UyzkSZsWdHYAfJP0bKCLEnE9aKoNOC2RuDjuJUS
 nLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768468340; x=1769073140;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j2NDP/EGkgTdQmx4cjpLRwc8p38qoVtAu2G7CGSyXyw=;
 b=Q8k7KOV26qlYgBJyQXD7CKZS4LnSPue32R2lZxNCrF4Rt38XmyHJ14vw+c9hjFSU2/
 mTTY0hgfFakUHMjs8u7XGi/hYEdnaUgI+IqK/rsFvswlOdq21Qq/etfapTHnyxXS7Bsi
 HufoV+hfk2NtGHtPiJnTQrqTiOlLP1IMkCcRDhH+gE6PFtUFQIC8qjz8qwhozeVTjGrZ
 mtaFa8bT88UqKm2er8T27BfYn+2YgZoZJgmt5PjOlHiGtgFpY/sBhnkQez2msLQD97cj
 0jPUKBKlfsD5CWgL6ESaLAlOQXPzivFm8VLQ/7MJoU3wb/quhGpA9yDiF/piNbYL276w
 OSxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyK5KOUPTN7Er5eiz3z01BPwJRqR0W1HTc6qdXBh85rfRAlvOcc+vY+z7gHyIxHaakIGPHQzmkU2k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/qWsPwiOiOZNJvwColvbPGnRPiKu4vOe7spEhHVa3TQQ37yev
 t2mARhuaZQGePpOAEfFiLIRDJTX7zD0/qEZLSF7M/1SS2UAGyd7ah2NCAJyoqUCg6MmdH++Yhex
 LG0PTS1h9aZE9z51A8b6uTpmaY4Y8WuPwSCJawhvjwl+dzgWuRRFzYVtbAZu3pvCx0TgSpwg=
X-Gm-Gg: AY/fxX7MGCeZTro0gx1s1qvEd+yFWl3zYG1q/ZSbbNhn+SLgNPKSkl+lWnDZ+Yq6a6S
 HSLnTzZnyhDL6Bnz7ORsqGVmgCajTtIKTUZrZXo9nONMn8pKq3ewB9Q0EEPuQBRvrObxx0DtuHW
 EqSdK5muJt7YCV6uyq96ZaYa0qda+A4OB2rk0mul453BZrqD9ABr16OJClkBjiO9WkYSmMejJP6
 OfkqjH0VdsU0WfuPqrs3YQdY4OzaTGULDwEiA0Jy6ei+J0g3iCv1NGFuPs5mnJJwtHtZTUoFiu3
 /3r8PbCXh96lxcL38G5SYGAZvVkptxy0VwX3i238pEA9Hi6SZHgWjOvXx8I8fiwbXxh0A3eCqQj
 JARDrkrFw+YcSmLlJcd9EFtn0UsrxSLTeVUczoJJDHlWIxWlm6dsLMSS60tGlhnW1F/E=
X-Received: by 2002:a05:620a:c55:b0:8c3:9ae3:1a78 with SMTP id
 af79cd13be357-8c52fc117bdmr570866685a.11.1768468339830; 
 Thu, 15 Jan 2026 01:12:19 -0800 (PST)
X-Received: by 2002:a05:620a:c55:b0:8c3:9ae3:1a78 with SMTP id
 af79cd13be357-8c52fc117bdmr570864485a.11.1768468339393; 
 Thu, 15 Jan 2026 01:12:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6541209cadfsm1972784a12.34.2026.01.15.01.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:12:18 -0800 (PST)
Message-ID: <63065e3d-70bf-4178-bd92-04c6ba1a1340@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 10:12:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] drm/msm/dp: fix HPD state status bit shift value
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
 <20260115-hpd-refactor-v3-1-08e2f3bcd2e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-1-08e2f3bcd2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NCBTYWx0ZWRfX7ZtigTCUk8hE
 s0EvaeiLhUUJ8tuHZ7wWrQeDxDEY1lYwU2MG9WXYg90ywDDO5nEaedKtkKSvHrk/GCRb2x0ktz+
 tdsnk4d8UVZClh5D7YxgkoxQ6n4fYAb1vkPQ1gpS6yivc7NJIHsHHfltAAo+Odz7NQ2QHTrpTav
 k1MVimEJV+3Ep9kJ39hgC8iRaxgZM9IXM3U5I7wpHwuAHOclpST1ha5uLuHRX0dP0p7SMZw4Jjn
 QmOd60gm7aHDqEVI2U2oZQa6xaWSIQy2VtVqbbbc8LzFyO92Kd9KFvuYk9b0hpof4JY4D34rxkT
 LWiNntXPZLr0ermrTGGukKpXytLIkYJKmTml1lXbskQwzp1PlTzTK1Z5EYQrqTYaRpiakwftW+G
 DCjSKisT8vs6SBiLLHlL82vtP2s5nPT3kw3/NC3G6y/UxfzvUSlxXcoegvtQwKDsY+Ddx9RsQDu
 SRxngO1/2e9k0BWoipw==
X-Proofpoint-ORIG-GUID: PJgXTWljjrFElUTgP1SSWcDH6QWbJMs4
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=6968af74 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tINfiVESruKu4bDgj1EA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: PJgXTWljjrFElUTgP1SSWcDH6QWbJMs4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150064
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

On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> The HPD state status is the 3 most significant bits, not 4 bits of the
> HPD_INT_STATUS register.

/me stares

BIT(28) is indeed not defined, at least on Hamoa.. Amazing luck things
worked..

> 
> Fix the bit shift macro so that the correct bits are returned in
> msm_dp_aux_is_link_connected().
> 
> Fixes: 19e52bcb27c2 ("drm/msm/dp: return correct connection status after suspend")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_reg.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 7c44d4e2cf13..3689642b7fc0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -68,8 +68,8 @@
>  #define DP_DP_IRQ_HPD_INT_ACK			(0x00000002)
>  #define DP_DP_HPD_REPLUG_INT_ACK		(0x00000004)
>  #define DP_DP_HPD_UNPLUG_INT_ACK		(0x00000008)
> -#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x0000000F)
> -#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1C)
> +#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x00000007)
> +#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1D)

This file could use some genmasking..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

