Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C0AC0E0A7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0708D10E49A;
	Mon, 27 Oct 2025 13:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YpQxaR9N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E3810E49A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:30:51 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59R92B6N1258841
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VuMvAMd2Yn5uPAiVWdHf+qc3
 ZLlZWtjBdo/nxvtzJAA=; b=YpQxaR9NbkuVebTOxqLZOKApJ8xkEoYp/PY3AysS
 RJuRsULcLLPC70w1zr29miA5OJze9zBxX2T53Ayx/QErjy2BFl9qK5jJmgOdRI00
 rxUbNn4VGB50UexWm3YXEE7JqQJUwlD+iK32YOlh3xexsqpJQTpQ8SJdACw/SlNU
 qFOtCSKe3p0wf6T68HNljU86vrqd0204RCMg+5EDVm/QmkHv7s83BPxGwB1UU+ek
 pmu1zlIKtXiR/icB+rltZMLYZd39pQ3kDXQe6hkpvNRQhkhfrLjX2pxBFHLzp6lC
 6kwAq72L6rmLSENFaVfgz2Jxb2+cajhz36Mi/BQzV0eT7g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a1ud1t45a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:30:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4eba120950fso62930581cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 06:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761571850; x=1762176650;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VuMvAMd2Yn5uPAiVWdHf+qc3ZLlZWtjBdo/nxvtzJAA=;
 b=TcKtKRpsA5pIjx3B7u5Y5A+YR4g0yy6eGSZDoM6I9JbQZ9jYDKz93ChVe2Q76RWM1N
 EAItCVW0jUHKJM5f4TWYDphvhG0Ufop+36pqZPe/Zo/vQQc71ewSv+lqplnVeHhjS16n
 tfJKcJvv6Z93Q5rC5FQfm5aMf0ABvNS1K2uJ/F6X8H8EoB12RD0BgcJP1ToZnDOp4ZOS
 SKhKzyKA3JP+k9tZrwHpBCbjO1PlOWoneRAo3lG/bVLmHZ82gxndx6F2XX3SzAeqEJNk
 iS1HrGl8ZjrPt+uJe8RcnXTNYu1XbND9ScHvGiu8GI73MUvXDQnGiniTGMvDwLXHWCbI
 znpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmwyrOBnBu3wjVSrgiG5GEWoQrRMvQSbWvofEg+aEFabyCnZT2Z8bRbRc3zP3mVXsecKGgya5b+xY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj8Lgq2OPi6vkLN3sl4iP+RLt98W3/BW734Adb/7UgtrNvLBBc
 W93Hz5L8Ud+hto8vqKaBQ6Lu7ftT95H/JAXRt+nhcEg8foBFTYo2tWR8Bo6BzgHNWGBv4ceB9w6
 DmVsSzndhPQExJKFuGKUa7l7DUDKIE0QJWYuqAO1tCDC5BArA4+LQZibLkFZB3nrPXQ6tAKg=
X-Gm-Gg: ASbGncvnBpWsJQ/q+e2BI4rZODejuMlVOVUz879PhBy+KYq3jh1Sipwqn3DB/gyZKrK
 IomK0jvCyizFX07ZjsrqVuD2lAgR59wkGTviO/j1xtmVWcyG0nYS1VN7ckj21/2kUeHLLWoigda
 BXvwqYl5U2p3958te6JiqG2X+N8Z7cbqO1xOtUUD8CDbtZOlJ/df9FUIVsbrNFuL0gjSVR+/dnl
 Cjs2H037tjCPdmyiACKt1GBnrEJwUXxRhXvnYyVZLCPtJHhKRZuTZPgvAB9jmmGvbfUtzM6BhoK
 EG2LrqKQh+4lAYdji1xmyBQg3LOKpcTGBPh1UuzJkf3FgdsUoO160GeXydjIwjy8cmZ0i5Pav8m
 9NNVkE1sjxDpRQ7FxSWGpCdtYhVxrCg00mZmpWQTIB6BZ3HX4pJtGFY7q9u4kv3HMTGKhtBs2x9
 00ZYu8qghzJcFU
X-Received: by 2002:a05:622a:4c8:b0:4e8:b88a:c6d7 with SMTP id
 d75a77b69052e-4e8b88aca6dmr348436041cf.17.1761571847851; 
 Mon, 27 Oct 2025 06:30:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxmrtPppf/+owHCkx0AjMgN9OBqs2zLqs2+SSWeaytTVGUaHm8qCALLSko1kZT3wz56Y32Sg==
X-Received: by 2002:a05:622a:4c8:b0:4e8:b88a:c6d7 with SMTP id
 d75a77b69052e-4e8b88aca6dmr348433731cf.17.1761571845947; 
 Mon, 27 Oct 2025 06:30:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f7444bsm2344459e87.85.2025.10.27.06.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 06:30:45 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:30:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 10/12] dt-bindings: display/msm: dsi-phy-7nm: Add
 Kaanapali DSi PHY
Message-ID: <2pyurzgalnjwsxqw7qhfguebps45ne6iua7gvioagz554ra6ru@nhe4tnmabqp2>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-5-yuanjie.yang@oss.qualcomm.com>
 <em666johhzrluo5z4t2nu5jo4yuowegaemlrursvczx2zze5o5@uakt5j22ygwm>
 <aPsYVUjyPru5FwPe@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPsYVUjyPru5FwPe@yuanjiey.ap.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNSBTYWx0ZWRfX1/4F9bgJXHC6
 PtHGt2tx82i0x810cOk76YIxHAwq7hMQeuVA0M6vyUtVGKUAT4NQ7jZ/8YUcyvoT5KR1o1um2Aw
 TsMSYN7oNQ0S3Bww2pgbommv9OGCzCV7Cp8+Mvk9wwgwdJbx+f+P2OWUIysJPwrqys8Xd301TS5
 P5PsrklUlT1CTEWfV2/K8L0n0BgzRRNeQfZdhQOPuyxlRt7/yZxz5XpMELUvaf2TcDOmxPdw6wK
 dAQcXDV3qTjc3HhG6/QdwTBp3TgJbSOOLlp/JxAotgSwpBqJoPE6/juf/28EMUgOD7iXrYLJmpt
 V5d0fwVmOVQ11hcipBClhMyEYUNLmCJEGdRiqU2BaoeAr1Px6R2e5oxEIYX4lNYE6ngeR1DE2iM
 LTZiWeXfoz3PQ74HGT/08uz0hm44FQ==
X-Proofpoint-GUID: WG5EUGh4nFdtSmg5xaV7w3vOeZ4HTSXO
X-Proofpoint-ORIG-GUID: WG5EUGh4nFdtSmg5xaV7w3vOeZ4HTSXO
X-Authority-Analysis: v=2.4 cv=UqNu9uwB c=1 sm=1 tr=0 ts=68ff740a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=dXhcXtSbZMlcZ2ZPzDcA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270125
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

On Fri, Oct 24, 2025 at 02:10:29PM +0800, yuanjiey wrote:
> On Thu, Oct 23, 2025 at 03:16:31PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Oct 23, 2025 at 04:06:07PM +0800, yuanjie yang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > In the subject: DSI, not DSi
> OK will note.
> 
>  
> > > 
> > > Add DSI PHY for Kaanapali.
> > 
> > Why?
> 
> DSI phy for Kaanapali have no significant diiference with previous version(SM8750).
> But some register change make it imcompatible with previous version(SM8750).

It's either "no significant difference" or "register change make it
incompatible". You can't say both.

> 
> I will give this reason in my next patch.
> 
> Thanks
> Yuanjie.
> 

-- 
With best wishes
Dmitry
