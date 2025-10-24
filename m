Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295F8C04402
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 05:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78A910E04A;
	Fri, 24 Oct 2025 03:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSkLe2wE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38D610E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 03:28:07 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FQm8003445
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 03:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hZRKGHf5eiS7medbsEc1yTLg
 vLooHsK/MU89hBujSiA=; b=kSkLe2wEBX6htBZhmJddfIpPgH8+2BOgJcKUnTPn
 LA7b3rz7bThHoqr5R3H4BHfAnHL75uEabGJ7D7mR1QR+Ns3xXgWtrugaiV4V6gNF
 5KRbQ+cavGnM4Od0PZUl9GIBFuedmlbwW8DOJnE6jW0H7ugjPcZ1t6LgmM605il4
 qqhHDdV/3qZNooHaCR0TteVcp3JaVzPKYRaVEsCWVeqwGZSbX9LIlAXM098HszX5
 9tll+BVOkuhWRdEU7yFPdzRkhZJQNkdLk9Q1Ml1YAe/mddkZzUrBrfcBsx+ZlROm
 FAX7Ju381ZYHpsYyJOxhel9T4MY4IFug5XCl57pHafLXEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27jajk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 03:28:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-88ea6169a96so838889685a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 20:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761276486; x=1761881286;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZRKGHf5eiS7medbsEc1yTLgvLooHsK/MU89hBujSiA=;
 b=GE1bORn9gaXsP+8ON5d8vXuZWAYqn/h77HrMus1iPDkRqU0prhlMG1N3U/QUUoJQ16
 0B65QK3KzJQLkC3qLum6vNQxu4dE2IULVq/pzoplOYe+e7oOfTcINvMdczfDJgGTPacW
 aRsN72E9oUomRcvr4vNSZYW5JsIJJnEpj2bC1inMyz9tiFFrpBBw58c6l5AUgeuYEab5
 jgJiiwj/6C6jMzxQHPGPztPsXzxoSJJP/6cII+c/CUPCjt3wksn59i6vAv67+fB01og6
 lH3+q+mo1kyVaPCMRYoC33SGBLJckZbODJuXho7O8VEPYijpGZ9YgPD1imJBZKz5gpCy
 8DvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/j3CBVoVCJq/LLYQJKftshxqZYRq1tnrCeCq+Xz2aD58IAC40tOn15XJOREhoLYbD1mnVw3wVR4U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQWuo67yEwa1m5zf8NnScgdSwLAugsqZ+dVd6EoucUyl1ilFgt
 kmETaUdTDhtdUvpNP7DSCU2dsvHypyxLuCNNlVJkyhz+vFwbRde6DzfC5iHUvo0YGHMgAtL5hny
 1m9dwTCsQPthCFKgCNGySbM6+s/2+RJKACbxkWTeyW27Aem0Jdv5gN1WCkHy0b2LT34ziAZQ=
X-Gm-Gg: ASbGnctjwiMiT+4lcI+kE539exYi3zMYX5o6dSoIEEbYf2SGTIN8aCevkhK2my0QjVQ
 5u5SedR+NlewqtP73uGzLyobjMgf2O550JBzxWIPokPV13Ll0OwyPlgkIAp87larDuL4zYE/uvB
 084xqyHnm+61IBC6kBkTXkBFdQXqm1N5oqcLjkJca6yII712ORxHhvh1vCVs5qUayHWehk0zb8u
 sV1LnKxZM9iSxH0sSv+JVefnfegs5AbJjYxYllw1A8Jrqz0xHw1mkjb6khVLqPk/t31FQMnNty/
 qT1kREYsjIRLAqYDkbE53eKOaiDXYL2leL8kcC1nL4exKs6tovMhGXLywYQvSXub3gDDqmHTIXM
 KyEksWQkFdqnQoYFViYEcoTglTDYsBaziott4LhO0t4htW6pkoLYADsg5RLKk
X-Received: by 2002:a05:620a:6884:b0:868:1899:b3c4 with SMTP id
 af79cd13be357-89070115826mr3155294185a.48.1761276486152; 
 Thu, 23 Oct 2025 20:28:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnIyfQMj4mmjccKB+vbnKu6/RWvsqjZb5kPuk+y1TdkZQGLJl3cVSm65rC7YNEyAuhfj8+ig==
X-Received: by 2002:a05:620a:6884:b0:868:1899:b3c4 with SMTP id
 af79cd13be357-89070115826mr3155290385a.48.1761276485620; 
 Thu, 23 Oct 2025 20:28:05 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89c1169a47esm299748285a.37.2025.10.23.20.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 20:28:05 -0700 (PDT)
Date: Fri, 24 Oct 2025 11:27:53 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 robin.clark@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX8jGMrWjCOxsc
 owT63UeC7g70d3J9uRusSZ7/VQqCqhT2QnU9KAe5+udQ6pWNfTqNXtsrQV6lbht6aGgj5CwkMS+
 Z6OuB9h7b+jYlZub9OUb/3qOAb8ZR3Zuc31/8tj+EYxVLy9OqD8/ZYrZpJAReK0pi3vpUEA7org
 HgoA2+jp3pOPX1bsroKnbpgucymLRplkO0XpTm5JJznqlcy9JbYXO/R7zXbWAggWsZpYUALCjoj
 eGV5y7CUrO+tN25RBN7fccxJbQpnAuOhVHI08ALQ7W8O5yVFqT8+8rT2YsrGFk/HcK6tyN7p7WN
 GO2IxVodB94YvZ2puyxBLHNSxNDJyVaYNW4jBmzZRwLqbHNZDbvEUgjBkyaW+UHLK1Qnywy6ccy
 GVtaX6XAKvjz03SAYrbN/ypNvE+ROQ==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68faf247 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=w-wrxfCwE3y99oquOGQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: VE0amv_L5K9VHz3GS8kqItAvhyt801eP
X-Proofpoint-ORIG-GUID: VE0amv_L5K9VHz3GS8kqItAvhyt801eP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
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

On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> > On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
> >> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>
> >> Add DSI PHY support for the Kaanapali platform.
> >>
> >> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >> ---
> 
> [...]
> 
> >> +	.io_start = { 0x9ac1000, 0xae97000 },
> > 
> > These two addresses are very strange. Would you care to explain? Other
> > than that there is no difference from SM8750 entry.
> 
> They're correct.
> Although they correspond to DSI_0 and DSI_2..
> 
> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
> new features. Please provide some more context and how that impacts
> the hw description.

Thanks for your reminder.

Correct here:
io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1

And v2.10.0 no clearly meaningful changes compared to v2.9.0.
just some register address change.

Thanks,
Yuanjie
 
> Konrad
