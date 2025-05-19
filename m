Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E296ABBB76
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D0810E319;
	Mon, 19 May 2025 10:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJI+Wp0N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0593510E319
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:52:35 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9aBJk006225
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=t90+Oj4ygdv8TRDYFavakWSk
 VDFa1fEk7fIwub/y9ig=; b=pJI+Wp0NB2RXPQQMxYMvRcG8eNxK/dg8hXp0e1mR
 TePrIJFwHzp+ZuUtpYTef9/43s9zX8U3U8p1RxX6NBrU51ZOjiBdBODbFlcBJstl
 pwMtanDA9/AwMBhMvWNDPLm/J5AmYWaNRbJl++iUwgsaJmw/1cudLVvOdGyuLFjv
 8AA50mMNeWGJ2oTONYvCXODpP24aK7j2Mj1kb48aOu26sPK47F4g3371DlHjNnqZ
 VbWcjztZkjvxg5+hfEuFil2hxJjrLQctqwLpBWZhcoxtV9Ub3YlBPXg+KQ+Luw3n
 c/Dn70zbbHv6JqaZuquq/rudZZJTAm+sSCbIrO0IhQurXw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4m1cn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:52:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8dbab898cso15633386d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747651954; x=1748256754;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t90+Oj4ygdv8TRDYFavakWSkVDFa1fEk7fIwub/y9ig=;
 b=aSWuf0QBBwDuWaLscvdzojy7eUx1KEt9UUjIx/+q1kEwHPG1p4n/J2YQb9Qivy+meX
 E0SAaBIka5MgCrcwkJvMOKCaLZ00pm6MkrTwRziLU33C7k2xlaPkWebjmBbBggef8C/b
 WAbLWsok4rR38+didVdWU0eYSxZJP65UwfeYy7NzXh51+of1cAZ80mzy1B5J0q3A+2Zw
 5UViAV+OUUC7YIbrOVFXWgABdC4UnezQq1zFHbYZQhyyX1vE2TySNm49GOCg3B6GU8RR
 j4O60ctpMLSEdjrljvoOEOP1VUDz3cj0O+sBkVo4xUhXZ3G4dtlX+V/0V1DyQOYAwy+k
 uAlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbdjwGQe34Jshvj3iZouH1aMaZE+VfuCspwYvOoP6mDf8eMa4gjbNgiJM3cwQ7bDyoz3f8USpYOO0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8qo5EgTUrQMFrfy0dlJu7DcuvS/BvD+7z+bcE96oeLY5HNoda
 abNC+q73UTRZCJAMU1QtWxRPk1ZytDHEON5RsyCGSpd/fTy27UN6yqZvooR6kP0kaYX0VY7YpKv
 JfqapCMFgbDkSV2Ll+ZUaBuXPuCckgX0m4cWoYRALyY/UA1lYlq9gfFmW3t6hrqamAOCRXxo=
X-Gm-Gg: ASbGncsd1tSGZhD55fxs1iDc7/JO6+pIBGyE2zUWJTMPKZa0DmtkS+89ZfrtHEprRSk
 xQxzjiz8+lZ/UQO4Zf9pqP+DuB6ZTuIoWHhpTpzevVJUcvsaBNpJ0It8m6SDo/rNwStS2ibA6/h
 cKt+Q9u/DbsqxKqK+hf9bb3h8mxemNFD/5ZPYwWbZ1eseGlrXy9VDRMNaGkBsUTown+DOkPoi3n
 +w2EdZNt+OiXOfGmFliOnBz3qKwyUmNSOazcTsj7Ui8CLhEeorknnw2Fi3idoU5rKdZtfXW1y5x
 CSxK2je9J0SKkAMXiNOxRYhj/C671pbQ+5qG1+SQCQayXtTWXkH/cE1Tt55lh7jEUQYwilUA43Q
 =
X-Received: by 2002:a05:6214:252c:b0:6e8:f17e:e00d with SMTP id
 6a1803df08f44-6f8b2c59a32mr186698536d6.14.1747651954033; 
 Mon, 19 May 2025 03:52:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEMtoxSIBkpBXUBMHT3joJQj0p+S4dXD/Tq8czhaa/yp5Y0axY0mPhl92SRHhatoGQa6P2kQ==
X-Received: by 2002:a05:6214:252c:b0:6e8:f17e:e00d with SMTP id
 6a1803df08f44-6f8b2c59a32mr186698166d6.14.1747651953551; 
 Mon, 19 May 2025 03:52:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e7017f02sm1800343e87.149.2025.05.19.03.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:52:32 -0700 (PDT)
Date: Mon, 19 May 2025 13:52:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
Message-ID: <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: eSm-DrmLRdSBAHIOGkVUoG8V_K3yTvU8
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682b0d73 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hTWhmv7ANGsBjBJhI4AA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: eSm-DrmLRdSBAHIOGkVUoG8V_K3yTvU8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMiBTYWx0ZWRfX044pf11YIJA6
 4pbJ7NZDZl0hourFgi5Fgd9MdipssZB2nt21gLX9p8xVp7eLbchQ7JOxX+K9RAg+ORr+N/hLyOU
 OZDwA6A2nHX+aem2apTapn+Rc6o4oHBMrerSh5U6n1HU+gR7DbtLexuec9yBAuAQd+j4vi6zPuJ
 ptmxAAYzhS98Vl61WwC6nDdy6btrcuJIHaDfYmZMdtws10OI2VWrSDoWtbNAPAKNyD1FwwTgDaP
 XQy4/6o0uKhrSx1s0SrnzUf6HJiwijPesQhyfghW7TO5bGOs032h8uHGQiJ//z+G8NXkrWZ18nN
 wr6zK4a8cHZcbh8KhzxBMOekpznBGw4gqO4ZJW6JFNiIQPnlBbQcd5mTmxdrjDLaxFp6c8ug4FT
 n8SPzFFcw36lciOQtJkavlVOkgG+doeHQb1m33exmzmPSoDp66b2wfF5wFnj7dvAxlfWo/Eh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190102
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

On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
> User request for remote heap allocation is supported using ioctl
> interface but support for unmap is missing. This could result in
> memory leak issues. Add unmap user request support for remote heap.

Can this memory be in use by the remote proc?

> 
> Fixes: 532ad70c6d449 ("misc: fastrpc: Add mmap request assigning for static PD pool")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 62 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 51 insertions(+), 11 deletions(-)
> 

-- 
With best wishes
Dmitry
