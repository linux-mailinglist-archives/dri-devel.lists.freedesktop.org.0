Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AA1D10F40
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 08:48:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B3B10E2F8;
	Mon, 12 Jan 2026 07:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqWbJ3oi";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c2iDauCw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01AD10E2F8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 07:48:24 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C7Om9X555754
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 07:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JuB3r/Y5lLhIuiZRcf7qYlhL
 UOF2SFsE6ltBh2xvbgw=; b=PqWbJ3oiqSwLgFWgLPX5+k/+hATqo5Tv2rHvu1Vo
 MOomrSXOvpDHoM3YEGa3XAUZXhFyfM4yylZ2lG1B8s2uAcikSN0NFOE+ega1MZVI
 0WwXqqyfnIJ78U1e+nxaLOiUqIlYimec8HeCWbElyUiwy/N03+3MGMksHrvqZFVF
 8xBevIB4Wb3cArqArhrJRVW5bZP41X85zuXTzDIkEpJKz/B+7ZL9iDb6HKJf+6lL
 t3vPQUr8vRs5mdAPN9XhvLGHSBfISQEnLfNP4KeipInww0f62ykOJcS+rs/5ZHn3
 MCCw1qTHlOpAz84YG78W8/DC42mEgx7/cIakULlS8Tj4RQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw02a0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 07:48:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c1fa4a1c18so1484720785a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 23:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768204103; x=1768808903;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JuB3r/Y5lLhIuiZRcf7qYlhLUOF2SFsE6ltBh2xvbgw=;
 b=c2iDauCwlQzjOYbuXunFAbcLxL1oBLjooncEYHxuwA/heLWP5bxOwTLaI/yJVgh1IQ
 6Wa3YGPbvIZOPtzwIcaPKRnBxzjH1pO6sWi0A0EO2C/HeLNxD0jtZouFj/mkdH/4aF3e
 DjUhmPUUHAAW13VS+m6PnF/2JbDmfhcf56ttdJolEj3tJPQJkXC+m/clhnzPnY361AxB
 f1u737iZIiudEOMO7T/mJK6uJMvWe025uNPvJ+jSuMNyfl2qdhZxf3HiIGy104AQs4ix
 0usxypJ0kLxKWrsuDy2V63CJOYly0pmlGnw4PRj/IU0yfpkhmCRZ6wnDVQT1GalYbkco
 rYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768204103; x=1768808903;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JuB3r/Y5lLhIuiZRcf7qYlhLUOF2SFsE6ltBh2xvbgw=;
 b=IE80svPvKCQA5oJikpihP8pqbSGuvNtvagQ6XT6Qhfa4BpFURoswFRafvJyEOJsAXB
 P4cnDQ699Sj5FRSOhRDD89fw8rkwzI1vahtsm2QTcfZLegZbQOTLQ9fHIUpBZVlmpL86
 qO1pyxM30RbLJJDGqf1EqM1bGMiQItQoK3rN6Hi99uLvKvYHY8xH58bASDIsF+N9xeP7
 2xHu/Sj5kMLijv1VHHa0Y5dl+kVvJSmXL78NWirrlEFbPaSQSltSQVVomcAgGlWoFMR8
 gZ12hyPytC7U7dUFUp/BpukA3etvf1XjaNJQutbH0c4GkgJa+BfK8gXmnnAT2zciw1ou
 U19w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUpXVyCiV0s1nAv9D3W2+yrMy+5HQ5CS/krYqdEDTU1k+u23HmbrYngCzMY6PKE0ZNCDNmQ8jd7Xs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqoHUSVC9P9/+sLcjyVVHe5kTVU72oJvpX+XtoeepBEkH/hRH5
 Ktypg3zeQl++Ec8OHb7iFIHJb4sbLT9m6nLhPpPQNiABbarxAp9CjA8dFV0SYbWhvyBtWAxRCpC
 tXXtY87e4kBsq1zc256yGj7igNorhJZP5fUzrcAABNmJEH6hvDNLU3lHeR0Oe+CowQInE3HY=
X-Gm-Gg: AY/fxX4wkUBuo44soIPHAJk5QsfYQgswjW1rB4nMruMhHEuhipg68O1mTt2hyN3j50B
 VjBy74DipGWqXfTwnAfkqx46lJAd82fmfxdZi4xEnwHHh3kqlIlvw4hLagN7LL8nnptLR0+erPe
 zUvjiPB+DWN3PTNcdQvYw9R1UeUrgmZXOkHqKJAn4psGqRsO7BFi3ZWyp/SZOOZwTWazNU/JvHA
 qp1ALuOh0u9BVN1KRJ41+43vaY3xxqR3W901jBRYZe2iAN/RTh4G1g6AqEkavbfJQVezmBO/b2m
 1nn2BF0d/9riwWF4096whQLDPsf/N5pX2BzF/K6GNh6xGkahB/Ma8KpCvrLRUSJTYWY+lRd1Dd3
 yRVGpK6o36ZZSB+LSRRMPxeEqvRQZ32hrDDmmU/Oaynmy0x5SGweoTYjMDgcpeSBLXhpVLueLsx
 gbU1IXOAg0aHA6/Jxvi07QYy8=
X-Received: by 2002:a05:620a:1726:b0:8c1:30f8:c881 with SMTP id
 af79cd13be357-8c389368ce8mr2086852485a.2.1768204103195; 
 Sun, 11 Jan 2026 23:48:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIm6sCy6MeebdUj2pS5+5lHZ147IU3S7VxRwrRH4KUM7MSwcRLN7TgNgJMQ3KJQr0fyFtxYA==
X-Received: by 2002:a05:620a:1726:b0:8c1:30f8:c881 with SMTP id
 af79cd13be357-8c389368ce8mr2086850585a.2.1768204102714; 
 Sun, 11 Jan 2026 23:48:22 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb3a0046sm38283681fa.8.2026.01.11.23.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 23:48:22 -0800 (PST)
Date: Mon, 12 Jan 2026 09:48:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] drm/msm/dpu: check mode against PINGPONG or DSC
 max width
Message-ID: <lknvr4qwhsnkuaujuilapcpiykqu7n2bzo7dwimmz5gpfklr57@wod3hszretls>
References: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
 <20260112-max-mixer-width-v3-1-f98063ea21f5@oss.qualcomm.com>
 <2E7090A0C462255A+6658f83c-4e5b-4f49-a90b-54eecd61fcbf@radxa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2E7090A0C462255A+6658f83c-4e5b-4f49-a90b-54eecd61fcbf@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OSBTYWx0ZWRfX22s4vkeq7nHU
 /h2b/7dq+RIMd5TCeAw2rH7U4fdI4fsNzK1HR5iTGNk0Ur1uOPULMvyBOTEF6pKVlPc+y3fh81s
 Zh6RDViezlBuAck3m1VXyIvTyUaeIHNVQMFsV9AX9bo+Es5hkEs9+FSNyhif30QqjMw9S1poK/2
 z3O6fBOeqpE+qBmHigLt/ha+GmlXXVp7WoPtIY4xgtpH9G2LENapWUVXYJItMj7LYHOHyHM5ZUJ
 tlPP9kLvR9BDxG/7qP+5kA0MO2yA/tZRgQD61WjQPv7F6XKBpzSqBK/E7YWysIpHxlwaGtPhPpW
 1aJyoVzKrO6bFr4PyLNTQCNgG7zI2dzN4JIGYAXZLZW+WqJWFey+ciXQ8R47hT0WMb/lTt0Zbme
 W8/8CCNxbI2lDyV7q+yn4ffOrTPdrxKQ2bfmDupqzSJwV70BC9sA+s+sO3RNLMlA7hyqyaqWFPs
 8bhBF1bqTDoX0C1aZsw==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964a748 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=5DgrgJxoGKuf3rDOEbEA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: BaDZ20E_sGQFBp01zOV6M9oKAurny3rZ
X-Proofpoint-ORIG-GUID: BaDZ20E_sGQFBp01zOV6M9oKAurny3rZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120059
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

On Mon, Jan 12, 2026 at 03:25:05PM +0800, Xilin Wu wrote:
> On 1/12/2026 11:11 AM, Dmitry Baryshkov wrote:
> > From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > 
> > LM block doesn't have a hardware buffer (unlike PINGPONG and DSC
> > encoders). As such, don't use ephemeral max_mixer_width and
> > MAX_HDISPLAY_SPLIT to validate requested modes. Instead use PP and DSC
> > buffer widths.
> > 
> > While on the DPU 8.x+ supports a max linewidth of 8960 for PINGPONG_0,
> > there is some additional logic that needs to be added to the resource
> > manager to specifically try and reserve PINGPONG_0 for modes that are
> > greater than 5k.
> > 
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a
> > [DB: reworked to drop catalog changes, updated commit message]
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Sorry for the late reply, my colleagues are still testing the new series on
> qcs6490.
> 
> However, this completely breaks 4K 120Hz display on SC8280XP CRD, which was
> previously functional (albeit with the clock check bypassed [1]). The
> display now shows a solid blue screen. Kernel logs indicate that only one
> layer mixer is being used, instead of the two that were used previously.

Could you please post debugfs/dri/0/state and debugfs/dri/0/debug/core_perf/*?

> 
> [1] https://lore.kernel.org/all/F4CDF36128041430+0d030e3b-054c-4910-a132-72273c541948@radxa.com/
> 
> -- 
> Best regards,
> Xilin Wu <sophon@radxa.com>

-- 
With best wishes
Dmitry
