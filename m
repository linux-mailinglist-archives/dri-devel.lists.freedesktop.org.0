Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 984DDB1F33D
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 10:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B054010E146;
	Sat,  9 Aug 2025 08:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MAGfaBA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999E110E296
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 08:20:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5794CuQJ031205
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 08:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2H9KRizh8IleLkCoQjNl9JsL
 yZ+FWKuglV3/DdZPO8Q=; b=MAGfaBA8T+Ra1m1wA7iBsHcVPnWichOrkJ6Hwa2P
 MDJWxFoJIyAChoNv7Whs+9DgoVdmCqEWVu91q0gSjXWHwtBMxxa7RuLZiUtG8Fag
 QMcPIvqAgLjCrqE+tFwUV9trMjCN/M9RtQpFw/Z9rPC9azPkItP4yxOT2P00z3dO
 +CHGX8SCr3dCjUy7dEKxEjs01qM7fNulbQI6Js+koHbfqr0p4BNRbI0ecCQoCLI1
 1GsUbAyQKCLD1ohKLTUErVQCdGt89ERmq7byNZcOKB6YrpPAFQHOFn8Zqzkt/SJk
 EVpAvcE8TihcMBj3HLOMv+ayG5eEIRvv2Pku9ZniMjOZKA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g098r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 08:20:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b0b507d014so20819161cf.2
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 01:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754727639; x=1755332439;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2H9KRizh8IleLkCoQjNl9JsLyZ+FWKuglV3/DdZPO8Q=;
 b=lKfdPeo1oXZps6pw/UkMoe6GnonYe8rDy1Y/yJhxhdulZ1jRMVYDYolRwkXpYBkjgR
 Etmcvvrlp+j/ppBrHAdP4CK/rxUBXUSedWUnhOh/VE+fh12W0tQjgxiznnbXAVLJ4WOJ
 u9vQbzXrvwulf5xRUqpXlxsfN69wgttgD1tQHOePg2Rahjt3cQqbPqFtw+pOkmTvuLeX
 z61YA/YJNYzD/2J56x2iKp+4SMJraKwo4gF1olRxaJP2EFQ7mrdsvLfoIN3XnWad6MGo
 mjQ9O+wvQqOiQE/ZLf19xBfhnEKNBAq+4rMN7WMoazZFWpRInld8hd+5G6KSyOeo2Lbu
 YIDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh6KBW39ga2bwLkH2mQW5elgWfVoU7SY1F03JhCu7eEQRwupKemtzbWv/qHW5l0+0JCKAaELAZaw8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzocFWQQb99i47Oai8AlVVGL+0acx2CuLsmQ87+ZTvbWgqOFllI
 KNuQVpZzo3XImxh7YsTqXf8KTFBq9bKkYY0Ocm0rRYN1Q+0n3/p5jqvp9hycT45ouR3YB4fbQ2s
 2qOvvS3KIgBD1RAngq5JU30eYgc8PpLR6f16NnQeSScVgH9fSIK/M/aric8WaVEHMoD+s0J8=
X-Gm-Gg: ASbGncvrpcpfOfXb6CV5AgFLBeHfTOhNHbrSw+BqBoCIE7VEqqj6RD4U1GgrgZu9nft
 nKWalUN7uUzMjKvdFr176hX1LbkdOwtZ6T/aoUF064a4Zr5sw0h9PtPXhlhdVgHpwMcXfzPvToH
 hVC7eTg+Gk9suWBHJBiHOd4kAAOR8EPVzHNTwfd4pRRAW2tcQESJ06HYU34MKSANKdymEilWbGv
 PlJK8cJehRCydAnQBMnHkNhG3VSp/55Rc9XJhfCVrZAgGsYVpOGoviaOio9xGlzEpAfdVoNoL2n
 AsbW3XJlegvkX0FQ9qPPVeaA0FSi0rM/48K+4YP0O2G0Xzpe/rGWG1XLxdCmoxNpT5uYy2uB50u
 33cqmHwEsx1fUMlWc9wpAPzl54MWZ9tNOv/bQehPpq3xn81UIB3cF
X-Received: by 2002:a05:622a:20c:b0:4b0:6d53:a0fc with SMTP id
 d75a77b69052e-4b0af4deaafmr103917361cf.7.1754727639473; 
 Sat, 09 Aug 2025 01:20:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaybZqS8e1II26PBLtR2MEev8RqN/YcLWWOjMTMd4jMxYQpAM2kTd+wUuQlaFFQ87m9qtgiQ==
X-Received: by 2002:a05:622a:20c:b0:4b0:6d53:a0fc with SMTP id
 d75a77b69052e-4b0af4deaafmr103917111cf.7.1754727638990; 
 Sat, 09 Aug 2025 01:20:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cc8d64512sm146866e87.11.2025.08.09.01.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 01:20:36 -0700 (PDT)
Date: Sat, 9 Aug 2025 11:20:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/msm/dpu: avoid uninitialized variable use
Message-ID: <fcgmsw66wi6eqtcwhcz5yc6migoauygaztqumztseo7uu4a62g@bg5xnnd4eosw>
References: <20250807072016.4109051-1-arnd@kernel.org>
 <ouan6tfmoefwuvs7wmhpzjdwmxfhqh3ad26j5tmwdugnq7ieda@ddw6dfqtq27g>
 <20250807143444.GA1009053@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807143444.GA1009053@ax162>
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689704d8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=yl-pN8RVu-4QMKwhACwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX2H9AkRSzPjyk
 vD6Qvibs9Q2+aQD5jPZ45Ty55ZyDogvBjcCcI+H4pxp7gpmqWqHFq73QRsFoYhA5moQytNCm76F
 EQwGolwhRMm6NyFXMNWE3KNK+Xs3EQOIkiQSq6Hdo1QziHHNIZAodMbhy9w3S2oxbdsq7+Yo2U6
 qx/fEazOo+EEJNBe04ls6sZpNRV0mA8guyrRa/k/jI+BwuxxUk09G/aSHBwFMjxZkptfeJOr9er
 F/x+PYf0PVjKdeMJ8G5PTye6+UzcmIiZAhj/5rk1vs3N7CxpdXiBp+zbt+NAec2gk28//qwaUeO
 aOYz5IcMbhBBPBgxJdSCTBmXvCihpmFAK5uhgGqP6I6xDnu2/lpQ5k2koLQkqfwd2Pb2gmTjdZ9
 OdYOVgeO
X-Proofpoint-GUID: O1QvoSgQhUDCrO_exyPtsaneMTFvmAUo
X-Proofpoint-ORIG-GUID: O1QvoSgQhUDCrO_exyPtsaneMTFvmAUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
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

On Thu, Aug 07, 2025 at 07:34:44AM -0700, Nathan Chancellor wrote:
> On Thu, Aug 07, 2025 at 11:09:38AM +0300, Dmitry Baryshkov wrote:
> > Having no plane->crtc is a valid setting and it is handled inside
> > drm_atomic_helper_check_plane_state() by setting plane_state->visible =
> > false and returning early. Setting crtc_state to NULL is a correct fix.
> > Could you please send it?
> 
> I sent this fix three weeks ago, could this be applied?

It will be picked up for -rc2 (hopefully)

> 
> https://lore.kernel.org/20250715-drm-msm-fix-const-uninit-warning-v1-1-d6a366fd9a32@kernel.org/
> 
> Cheers,
> Nathan

-- 
With best wishes
Dmitry
