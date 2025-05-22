Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A48AAC0B69
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 14:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C1F10E812;
	Thu, 22 May 2025 12:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GYukeLYT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13C610E812
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:14:00 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7cCC4016898
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5E1zkxcDnkBmMlF1lOS5cPZi
 XEh90TLOJgiaJfuSCt4=; b=GYukeLYTJ867gY27ytWcZZqWKLcsz8BQoYjfO6dY
 2WI52UWqH6Xvpdjgj7ux30GLpNwxdQHSi6Wyw3wvaqzk5N6oFfji7IpI97uCxboN
 LtrabJn8UQPZmMCJtlcob5/KBO2lWjwazzKvl8St4Y/RZYSuu1kuDdL8qdLXHBx5
 iOpRwmHL+EL2taXN/57sxsHTOMzpNl+MPaYSDKG4jJ8nq3txWGPgAt9xdKZ45XW4
 Kl1AL98Rt/x4TFhEwN2HfTXDbUG44OmAXZFwYVpUOS0+pChz121DZ0MyZBo7edfG
 suqbyRIVSrPYTeJMFyxdzYmMG1+Va4ZA6uQVygveqLJViQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9x8hm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:13:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-231d13ac4d4so105642145ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 05:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747916038; x=1748520838;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5E1zkxcDnkBmMlF1lOS5cPZiXEh90TLOJgiaJfuSCt4=;
 b=H5CfluWJFHmpNCysnlaV5Nsf+5d9hZ6K4a2Nq1+hiyanvzsE3/uWucYxfE/wrhdUzp
 csMYEA12tjfjFciOLe0DsZ1I4fJEQ0G7t5Gy/PkmefoI2mVEAstP4KL1T2ELoXtXshZQ
 X5P7p63xPbE5jqVACcLREnset+AicZCXLA/91EvJWosIEtf2bo3zly16Onss3rfDWeom
 NdRikCsPQs7MEPa+kF34HZu6Z2l7twEFkGpvo9/FQqWaV8z6MzA5E7Peyx5CkZQVHPDH
 p8ZlXxem53ZeyZU2rqMS5C124Z5WDMBWQg2buLA+ObwBDbaol/kiC7y99wS/pGZxgSkW
 YovA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPnBoB/Yj3L9hbZha+IMoA1ZkXiddKpvjUbqmdU+D3sygpEoaQy/a7uhSojqlU1EZVQKfSQ3m+vrI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzsv7XbPzN5GsZKsnbN2TI8Ue/l1cbxW+VX8GlZ9ednGCDOWTLl
 jfBcd82PNLhJ9fLMIn06blUae9ll9atWL8PaHJfE8Jpmy+aJAajkToJTFombXS6mgfnGL9RlIwH
 V24fp1OwUsWjctnzNnCRBEHG3GDemBkp6PH3dproTt6tqdpj8zCALkPHkBMQWVsZVhhhJLTdqMu
 QSg9VjbzXVX+IoRr+2zOCZNEYozUdJYOWU9JwXbG3BgFj8tA==
X-Gm-Gg: ASbGncvpasBJARCBP1RF+O6INGhq8zw5W2Cfs3YfMG4/eBvbN1KlY/dr3faBOlM0jpu
 GRCW9YPojdNYsPNikSOpuPWP2eTNgEs92AZNy3Tsp5y8oydm8fCKKZ93vJS/SoUfYaPKqfSTYX0
 HDRdspOdY=
X-Received: by 2002:a17:903:3d07:b0:224:a96:e39 with SMTP id
 d9443c01a7336-231d438b420mr365147295ad.9.1747916038423; 
 Thu, 22 May 2025 05:13:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ5VEoVz3hCcxXDIMg7e7/ldmBcjWGXTHC2i7Ve7pS+CwS16G0aa/76B8J7xj+tTqcxPyl5jGE/2dZG9ipeR8=
X-Received: by 2002:a17:903:3d07:b0:224:a96:e39 with SMTP id
 d9443c01a7336-231d438b420mr365146915ad.9.1747916038028; Thu, 22 May 2025
 05:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
 <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
 <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
In-Reply-To: <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 15:13:45 +0300
X-Gm-Features: AX0GCFtWixz9LfvZ3e0FxkpEf3O0Wt5ZYxeW1nkn2H642fUOmtSlAQNXYBwPcWM
Message-ID: <CAO9ioeX1uE3ty5oSezYOLJKqf8G5dLYAS5nRiNvryWTk0RPdEQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682f1507 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=kP8C-QOurGtaE5Th5NMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: -X4Dz9NrOlQhIYy6Z0xZ4tZFyGtCIwfe
X-Proofpoint-GUID: -X4Dz9NrOlQhIYy6Z0xZ4tZFyGtCIwfe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyNCBTYWx0ZWRfX9FUsy+7kNLHJ
 mdC6k82zi7dGbt0fsQSHHDgJszzCZcoz4JTpJ1Wx3qHHQvm9B56BFy1PAtR1vejbyEzOHeZIzbH
 3XCaAjBuXLZ7JM42WhjTZ1RSNjivKlKowhYtAENG3XR4KpYaTQifPXGSBe8clFgXjxAEaHmca+2
 me+mhjocMQUns/yICmKhgr7R2D/b+BLnDHyCTTHTfzWUjlIuXOTjVUwMTl+1ATnnjSrUquo8AAd
 Y6tefLZGcyI1ZiQkF7Fqj+pBlGuMmK73Zhh+7c3De5U5jQGZy1a7ZzKPJ+y2k9qR/RyaLpx4gJg
 3kXrqVjldE7qcUjkjmUszxmWa4sk8R0gYb+2c6MbRQ3IFGgbxQAzugx6Owxhg/mnnHE4N+sqWYC
 F2QLUuvXm1SAxPvpDCBMLXU9HSlncpQNQwOGAYu879ZMv2PVNWtprzQyun7T1qq2bBP6EWrL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220124
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

On Thu, 22 May 2025 at 08:01, Ekansh Gupta
<ekansh.gupta@oss.qualcomm.com> wrote:
>
>
>
> On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
> > On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
> >>
> >> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
> >>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
> >>>> User request for remote heap allocation is supported using ioctl
> >>>> interface but support for unmap is missing. This could result in
> >>>> memory leak issues. Add unmap user request support for remote heap.
> >>> Can this memory be in use by the remote proc?
> >> Remote heap allocation request is only intended for audioPD. Other PDs
> >> running on DSP are not intended to use this request.
> > 'Intended'. That's fine. I asked a different question: _can_ it be in
> > use? What happens if userspace by mistake tries to unmap memory too
> > early? Or if it happens intentionally, at some specific time during
> > work.
>
> If the unmap is restricted to audio daemon, then the unmap will only
> happen if the remoteproc is no longer using this memory.
>
> But without this restriction, yes it possible that some userspace process
> calls unmap which tries to move the ownership back to HLOS which the
> remoteproc is still using the memory. This might lead to memory access
> problems.

This needs to be fixed in the driver. We need to track which memory is
being used by the remoteproc and unmap it once remoteproc stops using
it, without additional userspace intervention.

-- 
With best wishes
Dmitry
