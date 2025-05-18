Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B11EABAEB1
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 10:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B230310E202;
	Sun, 18 May 2025 08:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6HQGQUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A720410E185
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 08:08:21 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I6PwpM009208
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 08:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=wmWqtYSiIFN8TosqyDerhHbb
 O2ZOhkYbAGNp4xpMYiY=; b=C6HQGQUhpXc8KLqtA1l9WP/2uGyK7EJk7lv1rd0N
 EQkn6vk5w0uCA78Pq7uzx474JdTOB8p4OlWmSldjVnOOU3OZCYASyaTxihBxArtv
 N050OZJX9XvpjH2Dhtn1PyIClIkwFwWokPqnmLjsJfWPuhzRrE0eAfdT6BS2MKOL
 n270SXmG3K19GEGIJNtZfPPPCzjzucDYtMNo2HN/XqS7Bc3PCkwB1WVCnoeTG+7g
 OMYotGt9Vch9NOyoDE2egQHJQazTKdAsqW8srx1HZK7aCsR68YCH8SOfyyoowWuK
 4ibcx/vRKNYnEQcxLCFQ0APf/fE+Gy4o6xIfplLjNl2VwA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjp31q17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 08:08:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7caee990715so1014846885a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 01:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747555700; x=1748160500;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmWqtYSiIFN8TosqyDerhHbbO2ZOhkYbAGNp4xpMYiY=;
 b=C6w6VBk5Y/UKioi91A0UzfRXmSW9HaARlHzx2ioyTwI91PY+4VbCKY7BtR3ZdMaBzs
 NNKEIagzJWX84lW0ckqhKvE3lfCJ8hZX1Gd0T1n4+9PtvzILIZdSfFo2G+4RkFVIZN0g
 dPwZk7416xmT4D+m7nZfjn5LZtTcfYbcDpkwR7TIEv1QZKRGl/BkxF/Tj4muAoofIC+w
 ahIYWufOLoiK2eoxXvOe5z9h5UNouLb9Sa0x6JAUJUdFnPwylo25bvPPySi0e+cdmpB7
 UX+80g+67he4MwXH4dpkJb14M8HVOYeeByqePA+b3qdOu9/9TbuiR1nOfnX5MG5dxKbN
 1VEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4mE0wJZeWp+hA5bqSzou8Vj3gfyGvUge+p4CzxDdVunEtmffqUuScdpQhd7xec65Qa75msfm4FVE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyh7JBP+FD43MmhNRSK6TW80dCXecBOlHOQ9EmouMrYUJsrbTv8
 ZMvhiN5ox6Pdvowdp3waoT2ESs12Z0KTJa9tpU1z5AnbtVLb2s4lX6yxiw5rbsaQOvPNve5KET0
 WbOInP56tT2wBwqWXgU04nj2Khd/QC3wWFc06Y7rWuXdlMigszNtOLfYFedq4VSeJ9D4UI34=
X-Gm-Gg: ASbGncsBhSiB0HuSqE4OtAfpAA2Wx7vXlyzbfp8RUgqz21G5l7vs1twocp6zmH+fvX/
 LuG8Kh+CIhzaFJ6U+ExP/osRnMXYudfsQjaFEL0KgG7OMWWkhYte3PzSugEmqiYXGdM9q/ihD7p
 syyszvpzgKjE9lPdNfLM2BY9tW5KUzSS9NENOtrY03kNEy4n2Xf/mHGKpw+bS4MmcJ03V/FZBMc
 aBqVMpdm0YBdExB8g6K9Gz1nbY176OCgp5g5wWOozus/ieG2eD4N4dJBzHIBPmynQeSquuEn3Pk
 dtidhqZAMHdFi4rebMbFYBVFntn19I3IqtbyCUF9hgNnfUTWrkgoFkgpKQjQaGA6/fcEnn2ued4
 =
X-Received: by 2002:a05:620a:4015:b0:7c7:c772:7442 with SMTP id
 af79cd13be357-7cd4672dbd2mr1169449685a.20.1747555699839; 
 Sun, 18 May 2025 01:08:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpEy+h/hpndRg9Hlf+YjYTRJuStQXJvvaWu5c4pVbmVGiqNrKl8iWNu/IBEEtYb6kfTo7iZg==
X-Received: by 2002:a05:620a:4015:b0:7c7:c772:7442 with SMTP id
 af79cd13be357-7cd4672dbd2mr1169448185a.20.1747555699497; 
 Sun, 18 May 2025 01:08:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f15fc6sm1334178e87.29.2025.05.18.01.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 01:08:18 -0700 (PDT)
Date: Sun, 18 May 2025 11:08:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 02/14] drm/msm: Offset MDSS HBB value by 13
Message-ID: <5ixkozv3krh7z7ebebunx5afbvuv3qr62p33ycbtt7zsoahshc@6go6plbcwaa4>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-2-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-2-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=B8u50PtM c=1 sm=1 tr=0 ts=68299575 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JTEDtJd_13X3dLxXeFUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: gIzenuIB6j47ms3yxfnM-IBCQT5ictvn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA3NSBTYWx0ZWRfXxXlJbV3FNqrm
 Kz+AGRTdEyW7TYoaQKBUoNWbZmtt4lIN3G+l5//Gn7p0UkeARAW3U09RGSN7aWquRbE4K5tVRcR
 N84U5u0ZC+ogZlYOCWc3xUx5+UsVOv4Zu96IYcC9aEoHEFcYf5K3XLaU/nDhfE2FetO0C+hyhW6
 VsiAffxleJmDLWixBxmvuTsOr7IuvYaAPJb0G8YwpjQ5IsliZyMMFmtvyqBmHP6Ue2mBKZC61qe
 SbAOVhXV5lYwWmyyiz5i/gHIbSyaaDxu8DY2ryzUG0z/83Mv/h3QJmeVRVkQeuof6g1sqjEHvMD
 vieH0iaQxZv8So3IdgKkOqobge+hrfwvP3hPW57EQE/BcgcJVAPDb3qIJtzcI4qxUywt0EQ1l7+
 AjdLyD3lVrOle90G0Vbet50DApjvA2U5UiuF+zAvf7OhP3mtnkCs3SIqh1pDP7yl1CtkrmP8
X-Proofpoint-GUID: gIzenuIB6j47ms3yxfnM-IBCQT5ictvn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 mlxlogscore=848 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180075
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

On Sat, May 17, 2025 at 07:32:36PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Adreno part of the driver exposes this value to userspace, and the
> SMEM data source also presents a x+13 value. Keep things coherent and
> make the value uniform across them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 50 +++++++++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
