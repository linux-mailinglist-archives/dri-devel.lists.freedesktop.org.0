Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1C2ABBF16
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 15:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B30810E240;
	Mon, 19 May 2025 13:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7VCfql2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E5110E240
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:26:49 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9Pfe5007110
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=oGkk5uPJENlcrR8ExGnK93Az
 4FZA48X1UVpf5g9eL1k=; b=I7VCfql2kc7qjAhj9U4Ib2pC2SRvhWpc50xCFtgB
 FZEbxxfJw7SgxZZY3MV/GJ6hS0Qfq8uC388znSM6gF+ciCv++FeiWFZP6H+axZbP
 sHQCInrP5gs8hJBIK0M7tgN4GgofOSI8Q5fXWFIgA6P4cbNCRkRTPLGXH3cJbjrA
 8X47iE7CVVWug/XC7DOs8I7+cJfDrZH53KkwJHstRaMHM2r0O1Hefo2N9ou+OmPG
 zE69BHQp7mLZbOP9pcQxWsQos+tybqsG0Neot7lgA09Fs2Wln2+yi1jpxAtYB5sS
 vggNG1t/KHaPtgc8vQZcAjXL5qahu+8DEa7CmRzoU6UzIQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4vgm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:26:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f8c9552514so30263356d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 06:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747661207; x=1748266007;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oGkk5uPJENlcrR8ExGnK93Az4FZA48X1UVpf5g9eL1k=;
 b=XZ5t6BYVvXpzdjEA2Pn17FE1vUcbKK7cWXQHHDNQgS/XnOKZ32JdIQoXOWO7w0Jqbw
 fqOoKRnGdrW4GQxB4vdI82YDy7gOOK5DS3L5USTO0ipX4IaFjDsO9Ln6hkGwt43UQgfM
 /PSKXySd8IpHLSmLSeRqU8lIRrpvyckgFoBJrsaR4BzvP6g5kwweVlzzBplqon7KImH3
 qd/pRHdeAMHUcf4j5lUi/DRQLKrERhAwRdv3jLLUlYu3XW9g4v/Z0/4YizOrTNE0dYox
 rQZ8CueKjwQxTOqQ2WSULD2hdYhfOoZ4QF9LWt/urvpqbVqOw2UvSL3CTWHsbc1hBtM1
 tMvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd1L3Y225AVFwxX7Sxv2zmRxqEHukCgfEYHgfJZkCFEAhoKRUr7Gc9N/ewje6JghH9I3GeA1l1LRM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza4PvgYq/xTZhvabX7RHZnubBKmZ4NLpWNDL2gFuLg/uZAjcoL
 yDCSHMjkKl5dKit7i+h7/RWWYCTqYcnvqp3kXXS8iNAzHhivFWYEn5lJu0hrndTkE+Vd1PpnyYT
 95RdYVrA2O2RT7RhFiohH84MmSyZ46HThAEkUKT4zveq5gYFGw8FYMdufaaT7o5eSroFYZAhX8d
 5Wzkk=
X-Gm-Gg: ASbGncuLPxJHp26tkM80iPUP1pmaGwQLXLPkTshlRqaOC1mSg53VEa85WqoRVsW4fZM
 eA854aor5zX3a6fK+ofcW9Q1MM32IYLfPAazqmyc7ncyp/JF4CWDYkB55ysxPmoPMRN8Uq4rzOt
 NlM9G1JbiBe4ak895xYslv3ctu54xojgF4NqEK97Zz4fW9vMDs2fOvkS0VJa7YSWZgfC02BKWch
 Rpo1la5bw3ep/KMC6aaDIqICg6i47rXIrMNTDDFm36SH4JJxvVOvITvsOM5+X0NyScuWRoT8cWl
 ivhE8uXNyrn8is90hA2DLc3ePSpl2pDbbj1FuiuopoH2W3Por8bz/GwvZwB1y6CudfcRi8LLwPQ
 =
X-Received: by 2002:ad4:4ee6:0:b0:6f8:c53f:48e with SMTP id
 6a1803df08f44-6f8c53f0bc2mr146769426d6.0.1747661206755; 
 Mon, 19 May 2025 06:26:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0aOVnc3nCtR9lGsacqR42oc4D8WjdNAyfE+YftMATKn0uQn4ucAG7wCIoSsvdjD5bfEC09w==
X-Received: by 2002:ad4:4ee6:0:b0:6f8:c53f:48e with SMTP id
 6a1803df08f44-6f8c53f0bc2mr146769056d6.0.1747661206344; 
 Mon, 19 May 2025 06:26:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084dd21esm18791861fa.63.2025.05.19.06.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 06:26:45 -0700 (PDT)
Date: Mon, 19 May 2025 16:26:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: Ayushi Makhija <amakhija@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sa8775p: add Display Serial
 Interface device nodes
Message-ID: <4cjz3wu3osafi7sffluslxea3e6vkdw45usg3djpclw5lv4fvg@ofoqbmwjdmjh>
References: <20250513102611.1456868-1-amakhija@qti.qualcomm.com>
 <20250513102611.1456868-2-amakhija@qti.qualcomm.com>
 <tjp2pfescczqikbu2tzylx4ecb3n6trixvhbdwbpz6y4jc52wk@fmkdxrelun3i>
 <38a94e78-9793-455b-a5ab-6283d397b759@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38a94e78-9793-455b-a5ab-6283d397b759@quicinc.com>
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b3198 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vtArrIq1twOU848iWwIA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9usUZB8cXEo79MQoh91fFP-zK9LXO5BB
X-Proofpoint-GUID: 9usUZB8cXEo79MQoh91fFP-zK9LXO5BB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEyNSBTYWx0ZWRfX91rh5wYkstwt
 wdMXNC0ug52LdKlgO35NpstlcQGx7vmoy6m9sv0fbHL1RRc8CrObAnbUWGGuG1L+XLa+SKAmFT5
 XKE4ZVQJT5nE0xiDLAtS66HROKsf4O3/wDc+tkMUYvCWa2FfuGEUmEb2T5Ez1meYLrcasLl7AVQ
 YgozAy/ET1MgD/bQ0+qUKEE2lQmyCpy7s/aKmZcTOmRwjrwqSupYM/EWG4WAAxyM2Yn9RgP9e+Y
 zF54sacbagYQPC+0KINEBD7qOPLVhigMQCTVBwCmSUktkyVq8ldi/Xm75zwah0JP+vzrxJS2bCr
 tAWEiqZQxkwBf7EPCVuIyrO0S9O4cU1l+2pK9mb6fPrBV0U4HCvLuSwkJtntsK3bZNZJGiS8BpL
 le7rUAXbnGOZXt2m6okwlo4z8jVtKfbfH0NKGvuNKFjciGGqkVLBjaSycTvDvOBK0/BUZ4hQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190125
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

On Mon, May 19, 2025 at 04:30:55PM +0530, Ayushi Makhija wrote:
> On 5/19/2025 6:31 AM, Dmitry Baryshkov wrote:
> > On Tue, May 13, 2025 at 03:56:10PM +0530, Ayushi Makhija wrote:
> >> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> >>
> >> Add device tree nodes for the DSI0 and DSI1 controllers
> >> with their corresponding PHYs found on Qualcomm SA8775P SoC.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 186 +++++++++++++++++++++++++-
> >>  1 file changed, 185 insertions(+), 1 deletion(-)

> >> +
> >> +				dsi0_opp_table: opp-table {
> > 
> > mdss_dsi_opp_table: opp-table {}
> > 
> >> +					compatible = "operating-points-v2";
> >> +
> >> +					opp-358000000 {
> > 
> > Is there only one entry? Usually there are several.
> > 
> 
> Hi Dmitry,
> 
> Thanks, for the review.
> 
> In the IP catalog Clock documentation of SA8775P, the same DSI clock frequency (358Mhz)
> is mentioned for all the voltage corners (svs_l1, nom, turbo and turbo_l1).
> That's why I kept the single entry opp-358000000 for 358Mhz and selected lowest voltage corner svs_l1.
>  
> I will address rest of the comments in next version of series.

Ack, thanks for the confirmation.

-- 
With best wishes
Dmitry
