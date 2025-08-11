Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037B8B20577
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD8E10E42E;
	Mon, 11 Aug 2025 10:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMyw98jp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F8410E431
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:48 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dLrC029350
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=WMyw98jpN7dFuV9+
 Yu15OlRj+5Qv7PUFwt0BSU+6s6tZycYVWK/ruJYvkkNgbufHn3KH8UK/yMdoMt/F
 YQLO6mOKbEqbCWadvtBiTKhka5XR0Ad6e1evnoPxHSInZd/l/gb/TUroqcK0T8lt
 vuZn5C7x+86jxq+biDBWIlpqjHsgoKlEwbA8hRSDwnlrOt5XKc764sYiXru2E6BH
 OGzNVvMvQlxPQnYbD8jedvQDZgiwrEri2wLw8Qx8u3XXteytA3tFBgN2F7tosxQq
 CJ+4SnwmZM32zOuMBzpllDQWfMExHL1HZ32Fwcv8fwwOp8t3RFq+NpPwyMCguUp0
 UurXzg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmbygb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4abc1e8bd11so14485791cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908427; x=1755513227;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
 b=UCwR6CgWHjPDCvMPVPLorDuieU13p7fkG6cpVYFelKFeXZsJ9Gd4YWypdpLhDGQedx
 CQjVZ0ZLkSQB/IanbmIrj68hoVtYAxYmqVNzKEmpcDvBenwngYdXxWwQhbLAZV0STiLb
 xprsqY/FTmPBVLP7miXTu6uN7YU/Z+1XXDQFI6MS4AHcWnn3PErKIW9ujiIEs2HmBj44
 GlbRiGwIk0eB4RAQf6Zgfe9B5+yUwmApfXxY0tq2C0BIGdk94vSiYArjHzOOewm3APDn
 4E3nHBp4gzuPN7fAmE0otavrryiOj9IZWhHU8KGA41DhPj751cojvMon4WbertpBAIVL
 raAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcQSk5VKqIp+qK1HYPEUklv80fzj2DQnBzyxEN3MRKPe+6/44pZgfTiLao7Vufv+UTKPPoDmLAjIw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxm6aTg9mtyy1SRG/F4pEyvhxfJICJG0wjQ0PssCXpH3Vk7R6w+
 MY+k4ZaVPZDrDa6xRcaVPMH8NsqHS2vLPGyw15D2hpICXp0sO6N+I/4TeCESUalB12Jv4w7CXrx
 ihnvwjqtdrDgcvfLQTtzDQcjwvBa2dWtx1u6l527bCgg0rH3GP5Ymddxg65J+adJfRMZ6I0g=
X-Gm-Gg: ASbGnctUltq+AfaZacxQWFoQIuiZ4Kb3d0TFldMsVYLD3OUyJIM2OspGST2i09ih7sh
 3tbvKmSNbV5HVmMwc2jeSOgwMqlJQNPwm0qkbTPErSam8T4kog8HDEXB3+aTPVTY7sWiVFVIUem
 eKQ07k484rdAfw1Y/FP1/4cnJpt9sh8+L6cRP/nDI9uquWTuCNgsePlOEfsK1j/aIrvNDXXmPmD
 LYVz6Uxl2LxnGIrUbJ9g3w8gsWpM+83D54MqeUsU4r4fE7RFzM9I/XPrWNi3LlnDbdbYouoJt2c
 RDbsIupiwFaHRDr6CvCpeVdEY5yWZdV4+9tThg4NzcTWgXMUkYK379MW4jru4yK5CoUgf3tSHVg
 oXHTZtkLDE1p1i0DPig==
X-Received: by 2002:a05:622a:cb:b0:4ab:6d02:c061 with SMTP id
 d75a77b69052e-4b0bec78c73mr59284271cf.6.1754908426866; 
 Mon, 11 Aug 2025 03:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7IhssFNIcGhOq/EGToUOu4T70RVm2dw0NQGyrObWdTLIgVbBy5n+ITh6LfbnZCeVTNL5pEw==
X-Received: by 2002:a05:622a:cb:b0:4ab:6d02:c061 with SMTP id
 d75a77b69052e-4b0bec78c73mr59284121cf.6.1754908426385; 
 Mon, 11 Aug 2025 03:33:46 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:33:45 -0700 (PDT)
Message-ID: <727350ad-720f-4751-8348-15914072ddfa@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] drm/msm/hdmi_phy_8996: convert from round_rate()
 to determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-6-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-6-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX0UaYksPEMaCn
 FZib7LaZng9pEDUPOSt70XkU/cJ04bkwWoh6TTsVyfay2FoaiRbQ32YZrlHjsgJSZ3XLlmFuDau
 DN4UCsI9MQa/siw84JrMhox5OCL7DRxW1Xpw3Xjcck7GCe5izKV/p/PkECUQIZvnLcIt9EMNBAi
 9T8QTnlTr3PTekwW2pSrugnnfCOTpdgUy/NQnauQX/MZa7yQVS8fuBv2dfAQa0d57v0/5tDmqzI
 LOmFWJALQYXKjuhhA62xUtzxsqr5RsNw/qrlLWtQUrRwYScCN796fkrc+60nJR7nXtxi5HApuSa
 ekT2vXJwNqObp8GWORcJkifIAJn+6SCCAWrhJA6/vTvDnvAHPN2Iy2rWH+WvLXFyDPTnU1vuts4
 FW/NMc8M
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6899c70c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: HJ_ey17QWbR3Nw2Nx5eB6nvq0fg5cR90
X-Proofpoint-ORIG-GUID: HJ_ey17QWbR3Nw2Nx5eB6nvq0fg5cR90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035
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

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
