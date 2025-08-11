Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EFEB20592
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75ABC10E2E4;
	Mon, 11 Aug 2025 10:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuQzg8J+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B626610E2AB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:35:07 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dHr6005224
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PE6gchWgUhiQ/wADu4ACCMtr
 JWOkRrEv9QXoDjpuWRo=; b=TuQzg8J+9bNzLvszHl0wheo/9IGGjtChvXLsCwO2
 y73TqgwF55KLwjVWLrhBwLXoggVdelQUYVadf3P9rQ2TlQWKZ8w8SSneV85Ui7lH
 BTwIIkYjfXO6wAbWxelBGfn7KV5OdBcaCuwYBAa+f0L3+M/Bo42bTqJL99e/751s
 GZ32yVAC8gi7Ywwv9hQtlURN4ndCWg5np1NQ3rh9IbLy6j6QJiCZoUVDfntaEVtC
 NXf6yNm5NaUGMWSH7opBibEBjmtgbF0bbcnzEM3NBaQ0lb6F3g8W4/r1qWVstbGS
 rWsMxs1Yo/15XCANUnJj9YB+oem3thraVjryUrp6row0eQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx28cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:35:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b096d8fc3bso106365431cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908506; x=1755513306;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PE6gchWgUhiQ/wADu4ACCMtrJWOkRrEv9QXoDjpuWRo=;
 b=WPU0ooh/SX/w8ip+tHi6+Sy/K805RfCNxwzFE2AbwSvOUNGimf3XZADVNAFGG5168l
 wpj+EhKdBwFAV/VSDAfYzgZPypQGh2+00Q7n5GpBUih2wiL5Aj4QtTZrBhD99NHbpIUn
 RTE8Kjys0IKxYikdu8IZ+Cl2SBvuL2MkjVPHMGp2A3dmt/H8x4twjskVl7JClPcgVSa/
 NcYbUowmnXk872e7HKV3yCYtif1uQo55q3tfi2/ueMSd2cy3BHHpAAIqFECPFELm1gb9
 rV4sMXBVUJj2c2qUKXDdIYBPTvo7+0dB8oRDkKKXjV+wcswkoplzbI2ulDy81+/vDKb1
 i4vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC/+sWhWA65B/qYgcGZ3c7HgA4fJFYzKUGSaL9t+LOvppfaEe6ThLU5Kh0kNaKKtqb8Jx8R1yFlfg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4c5dh2qOkQhzdR/wJLSi/gFKElhM8Y5uYxyExdBSm3mvY4Nlg
 zqyaZtrQp90OxstD+Jg40zu66aFAE9wD/4hQlz5n1TShMoZypvY8oeXiq3dJ0OlU8nUFGEfwd/f
 Fv+ih89rHce3pJjnAqcqmOjBPzaGjMxbRgTPCIqLeDt2bQQkVvRYDiwktEFjrx97IHGLLxpk=
X-Gm-Gg: ASbGncsY/A6a+LVNosxZq3KynlmNkW2RMW6GDPvKUXcH03VQuJDwyzLWX8CzZWY1NCW
 gz2b/GW0i+GOUCfwh/y7/ryhNZ8uq93mfTGChYUPmeujhQyeH1JTRTOv3gthoO+tcMhpFI13m+w
 Yx1zo5NM7L6cEj0qgzys4/0eKvTLvrThuGuE228dz4Lox4PNm9Xct0uJ3vrwEBgMCA9G3VtAq8+
 E+sPnMzy8AmeJEkRc7NMpGr3T+LvJ68HrQUADA8pp2PwGTUOSvi5FldN5DkUmVc6uQJQkukjVqC
 ISb/ocdETHTUNNW1DFnYH1LQVgaqy1yXoXRH4o6h8N+y57TRKTVHf0RR6ITrpPDaJzFx0AfIjdO
 PKKKeklxzYfX9VwCIFZ2ZgVJCPSD5nSlP/6a8BbuMKwpango6oGdd
X-Received: by 2002:a05:622a:1105:b0:4b0:82d9:7cb5 with SMTP id
 d75a77b69052e-4b0aed4bf82mr177683081cf.26.1754908505868; 
 Mon, 11 Aug 2025 03:35:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5z1smTUet+hX/GcT1aT/9S2JjVbf9QV8q4hC/iCGMx16KAq7C3GFwGhrpRcaCu48ZUqvWAA==
X-Received: by 2002:a05:622a:1105:b0:4b0:82d9:7cb5 with SMTP id
 d75a77b69052e-4b0aed4bf82mr177682791cf.26.1754908505440; 
 Mon, 11 Aug 2025 03:35:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cac7626fasm2255259e87.174.2025.08.11.03.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:35:04 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:35:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] drm/msm/dsi_phy_28nm: convert from round_rate()
 to determine_rate()
Message-ID: <2q7yo7ad7xvxkij3jtelrqxxctmaatdyi6zavsfhwq6oga4w2u@woq2yrvdt5u2>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-4-0fd1f7979c83@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-4-0fd1f7979c83@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX24taOB3q/vyK
 9z9YzPHSM9LLDkB7vG73mQZWjHt9ohxUKbB5vA4qT/UAqV9O6lB2bnIUHqUncD6jfqcfURBEP/W
 vADpFHh3jpIk3gVerfPf6sbPbjDVyJsiX+8mLNQRs5P9LhzZyIsW7Q08OydDyF4P227bu8jxZfP
 nLD7GhPeAgf28fgqlPdCqvXXtHr11NmK1J3fn+LWceU7t1fGN12OhPbjrLY8EKz31QWI/E9bvUF
 Wh+F/JjN8BhSoUoa9+GEdgT3jtAbsPWu2SbfGS+s/y06F8FRQ+oi0hBHCd98zzGfcubY/2161hN
 zgRKeF9knHXOOQYrtkD3t945r2osiC0GmIuV7TuOjRyzi67Vn6sX8c3k7PMdkq5HozmqbqJoooe
 J3S2qlMH
X-Proofpoint-GUID: yjQ0ADJT_s9iXdzWL7gRPmdESGzVKw4l
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=6899c75a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: yjQ0ADJT_s9iXdzWL7gRPmdESGzVKw4l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
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

On Sun, Aug 10, 2025 at 06:57:28PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
