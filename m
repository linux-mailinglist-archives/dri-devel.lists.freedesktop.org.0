Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5588B2057A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396A010E432;
	Mon, 11 Aug 2025 10:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z5kDu+Wc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB08D10E432
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:51 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9daVd019469
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=Z5kDu+WcZfL2dd11
 PgqCrzZRc4uUMFixmVOpyzB3rAo0AkBV8WuLjnKlPJy/gRNVEoQFZuhdGi5cBPIc
 jmQL+384QDMrL7SA+FGHcUcJSd/pZRzHRDNIHKmgI0fUFVcczcs4jx7YCpJu1N0B
 /nocx6w+j9ptPWlOoHymd9PO6JGV97I5wJh099Xrxuq+YQGFCaDJzx5NX+Xwe5eq
 aLUCr5fHKszEnTHK/Y6/2c5KnMFBSPCAeDlMleneI7jJWg+TgicWGfY3+qgRAh4i
 O8UNg6AEEmkV4R6U7nj7wdwB9QABdVDbeMNSI4Ox7JdcpCRhJCrHkeeDf5zB4M36
 Tm4qfQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g405q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-7073674bc2aso16586646d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908430; x=1755513230;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
 b=Tv39/soqSXzwOWxb3Cq8PF50npwkorgoF7kIXL9Spsw9Un0QhasawrcxPuo/fFLYU3
 1fhkAJ4N6cM9dFDwW4fPdlWDByYnWfo9KQUxY18xUQ4ssuJvRjmZWhTLvRlzB4bOHWe2
 P3i8AVInMth8BJRyFS0fellNIoM4huZxtjuHN0hZ7uxleV/L4X94IMZvG/pBxoN0/BSh
 w4uDRCjCedoUU5rCDN+t2pdQLcl6ekOA7ejDs6/wOy1jfCUkaFVuKitSrbuCnJ46MLtN
 CxvnWYgWTvSaky5Tny0YAQK/NYtZSzE/xbNFZyqd6+REN287RvieaTRHxcawo6fRgKVm
 xCyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6vPyntK42zGgDymC57uLrUARpi/wv4624XF0/ePEDFsK7KrIL7m9dOlv5GvgS3BFfRz+gawV/GJ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdWVRf0q8009p17vJWxUXjoAaFIavWKj58BJ8TEsfjAHxeEdPk
 /EwwN3gH2eHq0WYYAmcGOEceFuQ6ucaCwQK42lIjkUxGUOpdznLIZxJjvyiob6t44KH59m+5pNA
 6GxKjZzmo5MR8kH5lzhlNBkOnDeUnVGt/bl6WpPilFXPFqM+nuKkKh7BcxnLsZZKQZsPm/2k=
X-Gm-Gg: ASbGncvBihBUuyCMYfqaCCcjYnU2vF3ylwmbTCXWyaZa1YnDN9QEn559PTRxn9pjDkA
 j4xD3pdXWQmxgkKffNPRTIn3Xb+VbXSBq6yxEL2qBv/ZIxH3nf2zrAE2+1qbeiRES043xokYFQp
 E/cqJP+WZG2IRAQ+aCOVYn3ozmzwU2FXbirdJLdeSkvEbpd2DKHj9U5AdfysX+kO9ZaLmU2iaaE
 0ZtgYABmt3Wggr6akbxe/pTdYsxH+7vWycJXmeMd1JPOxTwjgh6ccKboYvSq0jIELjWZANzKss7
 JI+LXevJtKpqt80lMAnPudZinbsl1K9251UX0Q5dZnbB3uWR7cDCmqKhI5gFFjr3tPadLLDqm9U
 UxKz5Qtld90MXbBCdPw==
X-Received: by 2002:a05:6214:2128:b0:709:2279:ae38 with SMTP id
 6a1803df08f44-709ac13197emr60600286d6.4.1754908429935; 
 Mon, 11 Aug 2025 03:33:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtwOzDhGMWLmN2i3FgRqYSnMd1Y5AQG8+nCHVP+BeNYZ6Jxlh5UsiiwFp8nO+Ut0MqRtRL5Q==
X-Received: by 2002:a05:6214:2128:b0:709:2279:ae38 with SMTP id
 6a1803df08f44-709ac13197emr60600116d6.4.1754908429253; 
 Mon, 11 Aug 2025 03:33:49 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:33:48 -0700 (PDT)
Message-ID: <caf2cfb3-0076-47d3-b663-ca2c1bd21c44@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] drm/msm/dsi_phy_28nm: convert from round_rate() to
 determine_rate()
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
 <20250810-drm-msm-phy-clk-round-rate-v2-4-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-4-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=6899c70f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX5Y9KFPw+/OLl
 cwwfo9Kq/4ntNdn5ccYp4lMD6tmcX+pVZWiJGXazP7nNGeUMzTkc7xjJA6h2ioF3cfHvMEymg1s
 NhMq29Z81MeRY1wgUQFdO8m/kUcu+zVnjWCjTjxCmwnAuKFWW/IGNjqKSYYvKa3vpTO++mVibyt
 FLPPKnAzHziPCeKCoA6TF+Bi9f1Es7Y/U3J1uV/WF1zVZqujpfMwSraozuGIbjemCjojlrH3lSu
 4XOd7ZmkrsOiN491QrY1revt/FzJPRozTbiSBJ8T+RVfQ9KCiAntPRIPOk8rHKR+6s1KQWPoSF6
 zh++J1BV8yUnV/6HIx87/oXWxuQVFGSxiWql66m/pQ6vXGynf0yqNhhWOFPFR5mrPMdM6SDLGAY
 2A5RnHPS
X-Proofpoint-GUID: -1IWZqAeHXOzAyxF1nnFA4IcUtdUchNN
X-Proofpoint-ORIG-GUID: -1IWZqAeHXOzAyxF1nnFA4IcUtdUchNN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
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
