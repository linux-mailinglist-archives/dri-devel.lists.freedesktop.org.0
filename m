Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA3AABBF3F
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 15:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE3B10E269;
	Mon, 19 May 2025 13:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1NtbhJ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEDD10E269
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:34:19 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9PoiF019020
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xpmZsdGXKdiDzFuBCCBP+7+8
 PxMeQZauDmsiloV3TR8=; b=O1NtbhJ/GamIerrMd57QzpuD9042qlBgDo7/1kzz
 +CansZR7/m8qmUEUuG4zbrstnGg2HTZoxpq6wuwePFsUmhOUJgkADAaiovVCHgm4
 AKOM9yvbv96aITgFZ1jtoUgxanO32fQjl8ahQ1LqR5wdRwoS0uW0S1cB/cpBLW/d
 QXmZJdyDxnzxjTecFkYNyGixuQPIngctCCt8dcouIKi6SREUaR5w/VQjfFlrzt9Y
 JsQmNG5m41PiDS2jiwnBFhjDSjQ3gZjBWReKWJn96tPmcLpNHPXcytBURly3Gphg
 7uvK141Fv/8rDGkLT0EJVQt0tsvAlwkhrXXQ/8YUtw4+Og==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4vh66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:34:18 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3dc67719da8so15785425ab.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 06:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747661657; x=1748266457;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xpmZsdGXKdiDzFuBCCBP+7+8PxMeQZauDmsiloV3TR8=;
 b=XfiMtnbJ8adSceamH+hnbOWkxPPWmqYpcQ8PnqDZmsXEduYS+moQ6rSzUctq70XI7D
 iv5ZzN47KVe/9JI1VwKzPcBdrAomdw3KX68O6Zfn3nsbzN+LJK1XdRhs8HebJW0Da0Hq
 3JFvD9edm28XUYr/q/yRjkRzkuB6yN5aFz/Og8tAZOid4DdNmcgUSku5Iw5kOkvAiCJc
 pjzzEtmHgAxaiZ85EDSL3WGk0iUBcKyZaHbnxgjNY7bpWToyN7wURLYl90OGEc8F2WEN
 omjSBlA40o/farqfaqZQroOnjtOWGlcDbtiZs8sfpc4TbCeAGJAe2EK/iMi/xRY6RrCq
 1MLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd98xwWxt73QoghmGX42gksHRwyYxEGysp6KrP1AuWNHeIcqPk+WZiX8f4Wsq1S9YQuUWYOkU3vOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGwKO0+RVz4eaiekg35f1AEvF1w/2K1YwKu1JSa1MDPC7bl7GG
 qVO+U9GcvFETPoi2z1LyD1vVV1fVj2OKxzO117CL5VXINIJkOYxeKS7dAigtbq/HZRTl1f6nh/A
 2lX/Eapo3I3JFXOBreaRi/ik5Exxu3j1mtheDfsVxXhhcfPSmEQatOtiQPRZBc8ByuzwjP88=
X-Gm-Gg: ASbGncs6krEOXpDjpqfr+hihMPdEmfIQvCRCQNiqIWqYS/39cHMOhM1AAeAwTTUChqe
 tFZ201aefjYySKfMay5E1zTuiOdUukvGN6vK+H/fJ0G5SApKEHzBpAl3EkEmSEIagMQOFCkr4/I
 YFF+Ktbn+zgItKK7kcHp0G+9M3JmZzRfuwQcYAODXaENfwjYxKf6Jw9BABReKLnckeDVcl/49F6
 LQekhf/c4Q0cz8V+slv73l5UeWP9HHXiooPovdop/qfP7BVsB12fauNYLKBrMJ0FXWGXBLzv1fj
 gSUWo5fn7si/we85bV/qN1+Sv5NgHwNwovuAnd3f+LJ9PxUpaewKlAA/p3sUkPLE0fIxHLidxgw
 =
X-Received: by 2002:a05:6e02:2407:b0:3d6:cd54:ba53 with SMTP id
 e9e14a558f8ab-3db857c0338mr107675045ab.22.1747661657346; 
 Mon, 19 May 2025 06:34:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcs1xC9T+Wm6LLSGkClHv/8oharNk5wTXGyZpzjQtEoc2B8cCPX68CXbbZPZLfmwEF7MSPLQ==
X-Received: by 2002:a05:6e02:2407:b0:3d6:cd54:ba53 with SMTP id
 e9e14a558f8ab-3db857c0338mr107674705ab.22.1747661656964; 
 Mon, 19 May 2025 06:34:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e701831bsm1869971e87.156.2025.05.19.06.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 06:34:16 -0700 (PDT)
Date: Mon, 19 May 2025 16:34:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
Message-ID: <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b335a cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jo6cr0NhVVvRSACVVboA:9
 a=CjuIK1q_8ugA:10 a=Ti5FldxQo0BAkOmdeC3H:22
X-Proofpoint-ORIG-GUID: JoRD_QrSmsb40dAyIeLvq85qludRaTEJ
X-Proofpoint-GUID: JoRD_QrSmsb40dAyIeLvq85qludRaTEJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEyNiBTYWx0ZWRfX4XRLtEh4grDT
 rCGfU+WEFHlFcVog/7JsuAZKvEBTh4OVK9FYoqx2gPGPMqsEzKdkxe6WFem5IW0auHcxlnGDYcM
 LkLY3jWQdUFs46WB3F5udDhbmRe3OMVOU+2rwCi0dsNxDwumyydyXUn2KQnc1/uvfh5Q4mkfbqL
 lKHRhehKWeSXtVWY1tCTAck2fbRpn7uKsojBYpNy8E2j3yx4eDa44wUXO8jV+f2ZEbrLMguTYBD
 GVpZDKJiE1bDuejCnqa/jhsCwSG0qX1LGhFq9OtEnbi7EFwYktGWv261TwOSAoOT1GDfS54jrgT
 iuVWpBAGkivs3Gb+Nd9aqQM3tbCIVmgC4OMGqp/oJevHeEZ1H4e6f8+g0qTXk0UvaI4StIu728k
 DECgcnELY5RHRa8w9v1rrtyIAl/7OcBAtkg7qIGHUXASXUHDqroIWSaxVUJnLzAemTUf6CZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190126
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

On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
> 
> 
> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
> > On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
> >> User request for remote heap allocation is supported using ioctl
> >> interface but support for unmap is missing. This could result in
> >> memory leak issues. Add unmap user request support for remote heap.
> > Can this memory be in use by the remote proc?
> Remote heap allocation request is only intended for audioPD. Other PDs
> running on DSP are not intended to use this request.

'Intended'. That's fine. I asked a different question: _can_ it be in
use? What happens if userspace by mistake tries to unmap memory too
early? Or if it happens intentionally, at some specific time during
work.

> >
> >> Fixes: 532ad70c6d449 ("misc: fastrpc: Add mmap request assigning for static PD pool")
> >> Cc: stable@kernel.org
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 62 ++++++++++++++++++++++++++++++++++--------
> >>  1 file changed, 51 insertions(+), 11 deletions(-)
> >>
> 

-- 
With best wishes
Dmitry
