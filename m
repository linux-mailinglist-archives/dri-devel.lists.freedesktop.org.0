Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 063A4ABBF20
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 15:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB17D10E3AD;
	Mon, 19 May 2025 13:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A37TzS4+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E166A10E3A2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:29:22 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9G1Lx006013
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yCXrYhZQYmD6oU2A5edwO+kT
 +iKltb67bwD0nDazFII=; b=A37TzS4+dhndbh7AeY9R61JWnmdiuCHd6GxsSiPH
 XtXyIEJJMSiwm731FVKw279A4Rsl6Xg4QeGmkspitMKEBRQrpyv2aJ3j3BnOPlDG
 HoaJmfoGAMvbOPkR2MuXaXheHpna1xTAbTDny6sux29CYJHHl2qQWWlVY/l2fH8n
 xejI49ABh9sOzSqK7mbT2zcv2PHvTQ+PojrxPATg2iuonEsOFZun7+pBjLrZ8Ho9
 A6q7upTaLmGNzE5kcEkBz0szmeu76F0DD+43Tqno3COzY7RSdnvcr4u4iVglv9Vw
 YVJHzj3uNF9eMLl5sPx6AgXyArGwCOLYzDtkS9D/mxMJjQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnymh3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:29:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8e1d900e5so3369376d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 06:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747661361; x=1748266161;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yCXrYhZQYmD6oU2A5edwO+kT+iKltb67bwD0nDazFII=;
 b=ryLNrCJox/i3XeF8sgdsfCMyzN+2P6uvftKiALMGTk4N52fx+9tWvJIDqiYK9Yxg79
 RTrsSR6ro+ZhxzL6PQ+yu9AjzI05VWbn34G4a6JTmQ8KwsayWfcEPIunu3kYsATfFSGe
 HLaT4vsUv1ef7DZsVGRnertDywjGzTizs2xIAHz6xzJHn1+hihEoi0uYjX0D9RxhV7pj
 5hOZGP1KGslGw6gfnJZKMx1/IQL3HUskR6dyPoQkFJQX8t5dbbGG/EipCbZBKgG3vX+H
 y3omDqOvBQmRVXOaGGgZByFpzkek3FbtYanUbuO8oYkR8vjoTg/6rwKWUyNURYkyCShm
 juxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxytUJe6gE2K1lFKzyGJDs3uuylzmDJU7kTQI+Qbrz/iuA04/p0VMRdkoB8E5ixSswMmsIey8AHbE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFPa1xY7n4g7RvELmcRbnH0b8R4vK6BoJJqu3Rv2rBJG+l5BzY
 hTp1tiIZe6pEiRh5odGA8Hnh+IS0Rtfq+VveSDXFl4DhH3IKiBvtZZrjppHHuovA1QGGqBtB4Ql
 vPXeeUmVYSr2yzvIcaJVY+sKCVpi0nLi/DFsjHLNoIkDuO4LXJ6io/Kki03uOz7nLN7jOdbs=
X-Gm-Gg: ASbGncumYEBqJT5pIKHVGX7mMTHOZ4M/dvUni/lKWteQTgDyhqh7f5uAzRswzL+c3HN
 fx22qqUhqZvYu33z93/00E8cU4PJqjp2mJWaqBWKyOR9HRVI5DP2L6JP5bWI54MaCw/wGpiDUXi
 p7KC9cKjYu/F6a0HWxulXIi1yUMLmfjHOrPh6JIRa3t56f5kT0V/CMphcOnOJmnCdGG9Kp9lqIf
 vqS7fQVlBvdMcvDFmg+6oMv/hu/kB8ztHL6TpKBHyavtMuYutmEDmCqLTTIB3b2yR/1Bubkg1O6
 3E3DyS7Pp1SM3unxKhd8Zct8Dkygap/azwan9wFNKXeSdRIeDnXTQ8tbBnbiHrVA+/PeylIQ3bY
 =
X-Received: by 2002:a05:6214:f0a:b0:6e6:6505:ceb2 with SMTP id
 6a1803df08f44-6f8b09024a5mr232402166d6.36.1747661360973; 
 Mon, 19 May 2025 06:29:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3rI1V/ERgBIDo4kWBtOHyZPM0eXvcKh2xnWOKsYh+CbN/YsCOa2sGfsQeT+Uoo+59e9dIGg==
X-Received: by 2002:a05:6214:f0a:b0:6e6:6505:ceb2 with SMTP id
 6a1803df08f44-6f8b09024a5mr232401726d6.36.1747661360623; 
 Mon, 19 May 2025 06:29:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e702c9d8sm1877106e87.181.2025.05.19.06.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 06:29:19 -0700 (PDT)
Date: Mon, 19 May 2025 16:29:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations
 to a new list
Message-ID: <tdae3jb7zbkbzvk546j5jnxnfkeux2bwrbz3i5gsehecj65n7v@2hseuptlk2a2>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
 <sgfcaujjpbvirwx7cwebgj46uwlcvgr4cgcnav5fmwmjsf4uku@iytanuqqiwxo>
 <71eb4b35-51a3-411c-838d-4af19631325a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71eb4b35-51a3-411c-838d-4af19631325a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEyNSBTYWx0ZWRfXzkjzVskETyAG
 sA8ZTx5epjqMOiVSksvQPA4LxjrdewkXgaZhV1UeNwZUum1A6sJJkxhJrrR0Hz1G7Ecfw8rr9JM
 xQqAeyJbW4KOhaA5MwvTmPCEeOwVj3k2hLXWrbvf38GCzg0sQr1ieU3ywCmJMSmLm8SQgznhGxY
 GnAgdNgSWhG0lGLws+KLCIsj/AhXTer38/7XDM1HnhZb5cDNdVHAMTv7Olh/BCNPRiF7WexZiOQ
 GlVdhoHnbxXO895G0xMYHZ+u9SBC0ClUajUkNQPtwDmef0Ve5g6VjO4MCjjGM1iLBhQEBxm9qNE
 op4TeFoeC1/iq5jKQbvfdrGJc1nTRGApF7vjaLlp43w4lPi3yi8e0bZlSuWjIw5dA0EgHV6Nbbg
 a0bDZ+ad4ZErQzjkVHoPsrdk9tV938G5VvqfGBZDZO72mgG9hcsix0Yz37s0/BfU3+zj8Zb9
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b3231 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=adbQxVoRvbMUv2LSGikA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: W1LUKcNVF9kCnUqWHYl_jTutbUYBMBL_
X-Proofpoint-ORIG-GUID: W1LUKcNVF9kCnUqWHYl_jTutbUYBMBL_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

On Mon, May 19, 2025 at 04:36:13PM +0530, Ekansh Gupta wrote:
> 
> 
> On 5/19/2025 3:46 PM, Dmitry Baryshkov wrote:
> > On Tue, May 13, 2025 at 09:58:22AM +0530, Ekansh Gupta wrote:
> >> Remote heap allocations are not organized in a maintainable manner,
> >> leading to potential issues with memory management. As the remote
> > Which issues? I think I have been asking this question previously.
> > Please expand the commit message here.
> This is mostly related to the memory clean-up and the other patch where
> unmap request was added, I'll try to pull more details about the issue
> scenario.

Thanks.

> >
> >> heap allocations are maintained in fl mmaps list, the allocations
> >> will go away if the audio daemon process is killed but there are
> > What is audio daemon process?
> As audio PD on DSP is static, there is HLOS process(audio daemon) required to
> attach to audio PD to fulfill it's memory and file operation requirements.
> 
> This daemon can be thought of to be somewhat similar to rootPD(adsprpcd) or
> sensorsPD(sscrpcd) daemons. Although, there is a slight difference in case of audio
> daemon as it is required to take additional information and resources to audio PD
> while attaching.

I find it a little bit strange to see 'required' here, while we have
working audio setup on all up platforms up to and including SM8750
without any additional daemons. This is the primary reason for my
question: what is it, why is it necessary, when is it necessary, etc.

-- 
With best wishes
Dmitry
