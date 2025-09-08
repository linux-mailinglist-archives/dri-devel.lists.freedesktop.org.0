Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D86B496E6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 19:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B41410E094;
	Mon,  8 Sep 2025 17:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kNExVKAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB39910E094
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 17:24:36 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GRevh023845
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 17:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=C0cWDImZ8z70BOaSp+butwsw
 MvwnEMiQkgeS6sxwcOI=; b=kNExVKACiI/8ETgDMI31lk2JxzI6rbCTpVc70DAq
 hs7Q9p17Co3kdezKORaRmp0hcRQY/ZSC/KknqKWQWQLxzTlkEGTv+cWYb5zTv2Ic
 4pbmVc/ZLlBw3nWg1kb06Yr97QsM/43pMQ0QDDR3Wg/amim2c7Jmke3GM9r9gybV
 7ba4pRa+5gM/lTJYfrWIgtiIZAT0LRKEadLPHMHQIvmTxWOFQZnoylbcWncToReD
 DUbQSvuTYgl+SPfZlsmNywoTHbRC2BbMTKk2iJ6fr9MxdVgB53Cv8nEIb0X6e0Ew
 cqteyTo5TeGXcntclkolad0xK40rcPZ0Tfmtpst557Z+KA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0nent-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 17:24:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b5e9b60ce6so108725351cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 10:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757352274; x=1757957074;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C0cWDImZ8z70BOaSp+butwswMvwnEMiQkgeS6sxwcOI=;
 b=wd+RlWLZhYXpuKWED1aI6Is9aPM1/b5M4cvVwE1GX9M+3W1lsNSv7IBeQ5ticALBag
 i1YJmoXXFy7zSV3a/l9Y9+yWMKFh+MhHh67sRR7YFp71Fn36f5x2WYvegNUpi1+lKt+B
 PU//Js9rLx0SnKgT6tWOH9R7zT5CWbl/cNU6q7WqiJUBadO1GzY8Gy0PpKRXWqdIygDm
 Uro488jNWeNdYUUZzwHmOUfJn5M7lN9OHc/GeCJG6oTQboCm959c6GZjyb/c9UQh3e2J
 19XZ55vWfIULB0+zCcqtytrfeH+yw2Wi+3Slz0rOIqnQ2gHt+qzuybGbpu2FvXBDmGNg
 YS1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPfjwGN5TY9Df8xuKl3YXzxazO2DXOIsMYgDkwLlmozgqKiUo3Nh4ifW3SybZrwjsm4LY5KlCJxl4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcetCuBQh/ltqQEpsu/m6JrpujVs9Y34HydrtcnwwqOxZh8oYG
 C4ZG8rW3IObNDoHmUfVyIaQY0qu3szQGLk/irlvQmGbx2MEqlfB9bn3imFI6kv2IMviRMaX/a70
 uIVrPDuOyK5/p+LpwaVv8NB8JmjFT42sTdte0q7IX9kFjkO5J+FaVOpXV0OJjiP+lzrzVf4s=
X-Gm-Gg: ASbGnctDrCMtFfNLaQQyHXLRjU2brov3ntO30SkBlmsvmw/iX1RaopD9PKpylLBf2uL
 BKeoApTA3SHnXi/Z+vXyjraXnezm/GNeMp1A9AvGljSmZ1OZJtXKqII599tGb9riq4YRGGxDts1
 PUy+XNaNjNpD4LJoHiFCM9xPfGVYGsCgSQRNV/G2SS0MWU9FSolmhzIuprK8VAGxVW8xq/TwTCQ
 ZzmTaji8cA6BzRoQilZ6jVTTFJ0+Q6VA78svu3yKqQ9UsEKh0QYfj31iHgGtbjTAy3a+hmh+vw7
 hnlUPJiCKRMeY7+iOFR0eZFwEPpPtPS0LvdkSHcgvIIEKCRcihCNGEVP70sfZLSo3n6ayxmFVXl
 E0n9Jt86PBsvfNu4PBjqNN+uzUWkwxo78kbY79g4ZTeAh1ueGmcjW
X-Received: by 2002:a05:622a:1a05:b0:4b4:9773:5863 with SMTP id
 d75a77b69052e-4b5f853956fmr84823271cf.48.1757352274049; 
 Mon, 08 Sep 2025 10:24:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHroLAl9V5JPPOY6AI+HWtJYULgdQbzIUd5r9lNqCkQrv5cWCcgBxu9k1K4dRxOnxNxznWegw==
X-Received: by 2002:a05:622a:1a05:b0:4b4:9773:5863 with SMTP id
 d75a77b69052e-4b5f853956fmr84823001cf.48.1757352273562; 
 Mon, 08 Sep 2025 10:24:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfcd18sm3718116e87.108.2025.09.08.10.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 10:24:32 -0700 (PDT)
Date: Mon, 8 Sep 2025 20:24:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 lumag@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH] gpu: drm: bridge: anx7625: Fix NULL pointer dereference
 with early IRQ
Message-ID: <alk2ovpplncgr4qf4l37wt74olqs4zpu4pddveml6wpny5jlgg@5kqcrpsk62z6>
References: <20250709085438.56188-1-loic.poulain@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709085438.56188-1-loic.poulain@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7Yh2fBXFFLc159tF5RqlDhFdNPx7z0qG
X-Proofpoint-GUID: 7Yh2fBXFFLc159tF5RqlDhFdNPx7z0qG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXxG8+uQnbFTCN
 /6oOJ0IDnarWyUzn0W+a0v9bI6q5G7HAKEs34f9LqLBtKyDdR8g8/0Lx/ZL0KE0MgUF9yiFIl8i
 AMx6+MNdfYtzj40BZMEb17levQszYyQMMv2nNoSt96liYHJDnvXr3SbBM6VVEmKTK3plmlZ3v4a
 4gFn0TJ3DSgJ/rcQZ+1RWfcnS+0nrj2w5atUvdWer6bAYXp3K3j5YbH2YTlarjKn4cnkxstWvMk
 l9qyf9zj/0AKjqGgtf3veiBVoR/y0dHwxR/Uz6sGVCYve4sZlxm2DaJQOJIVYnUFE7MrLXoGLh3
 CzJpS5Llu/UXwueRusA8mv2lczELT4XNzVYCVVr9MhOugoJnLhODY32UkBhNS90AT7T1m9JluUf
 h7xVE82a
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68bf1153 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=LWE9zbpONBY6LCXfEiwA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

On Wed, Jul 09, 2025 at 10:54:38AM +0200, Loic Poulain wrote:
> If the interrupt occurs before resource initialization is complete, the
> interrupt handler/worker may access uninitialized data such as the I2C
> tcpc_client device, potentially leading to NULL pointer dereference.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I will fix subject pick it up for drm-misc-fixes if nobody objects in
the next few days.

-- 
With best wishes
Dmitry
