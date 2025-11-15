Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F117C5FC09
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8E810EB6D;
	Sat, 15 Nov 2025 00:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODckJlfs";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4JMYz+u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C866110EB5D
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 00:45:01 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEIQDBM092034
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 00:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kHSr3Uxb5gfTp8PMcc+9CNwl
 Vz3omOLQcZ4QTy5X+lE=; b=ODckJlfsAxbyXTtcs5Zm543nzNcWtRpWXJwR+uMn
 0BqB/hWSyd4H8OuVqMp+yys58KTOTAThFhwxlyoThmB8gRaCIJKPfVhkcmZd5Kxw
 lfcbla9wgB++EGDkSmbCH3068Oov13I5BCMuM6f94boSl5AY/bvN+c9GpsOuxyr7
 MycHmceYdsDFwWcDa2NG0gHfD8rcfCSOQmWn8NIYI/9uFIivvkXUR12lN1VBKjT5
 Y3HSvqZFPm2DH+IcfCemhPBe1GISzlubXCJjqLHl0l7FtUB6DIxhlggAx+QrR280
 zmVmdjj2viq6ssQ/HDura3pZoLrKjHWEt8PvJRHceOdXOA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae6xm9f45-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 00:45:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4edb84fc9bbso117400831cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 16:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763167500; x=1763772300;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kHSr3Uxb5gfTp8PMcc+9CNwlVz3omOLQcZ4QTy5X+lE=;
 b=R4JMYz+uJ4fMfL2h17xR72uCrcT5yU4YZWrNqNECWiQFPdxbkCsdShpaPBX1FT8reU
 YTAWcU/AnNIEayQcCIXq6RhlBW8QEB8xyBRSsmYCAiRmITv3rwyugFu3AL9qSDegYJyC
 7oIXPLu02MbnEWP+HgeiyW6zcYQJDG9F4DYYV6fXddEuV02PJ+C5xdt+IW5MDjyB0maq
 V4riZa0xRtR5xFQ5hEho3lNXOQdIndEMErOM1C/buKjKNl1pEY94D4t1mbxr6mzB0R53
 W5X1HFFjWhclFOhksGxQdzK/YoQthuKvTfUp8sMYc50wid7ls6B7JUQmgdPGzGWdqjPw
 PnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763167500; x=1763772300;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kHSr3Uxb5gfTp8PMcc+9CNwlVz3omOLQcZ4QTy5X+lE=;
 b=XbHh9moq0sRapzR7vDLj/2+cKMabifdLjmeNqbkvml+fVpLQ9DOEFRACspK9/Q9ScP
 nr9DIkkMlNgvyxBwgfh90hU9RQ9h/TgwBKF9uie6DW8gyreTKCmhRWfiJT1hv0vqsllg
 8Ii2br/xSaN42SxvbljM4U8ARi2f3gg//U2lIzLaisTKvh0y9NRz42SAkh0BWdstnghA
 Abic6SPlzq13qKPjfj0C9gjH3rIBmqolMSJqPaVH+b1o/NCvEaPChdTF8TY+FBr/IuNc
 HbiM316WPz2J+uADK0xcDYZA6IB8Jae7GAZFqOHCUdQwv/G3C518gWx1rOXIVXWAkgzW
 C8qw==
X-Gm-Message-State: AOJu0YyZy52ydQtMAM28gyvpHNnR5ZhE/B1dKM0ybGe6Qd5t9dKD9RwH
 MptUO3UQtjZ7an+blBUDkb0UsejRfg3h6ZW8vl7Xl/lbLA+c4f7NSri0bb+OXqXpYettYIFWs8N
 J6pMv3Et9tFhKs415REP3YxJ/YTS+gdG9pkui9vOMderAzfiLZIr+4BgDdB8GihzHykfmT0M=
X-Gm-Gg: ASbGncujdb7Typ6ybJ7cbsC2mnqANRibGzKTnDerzJ58aWnKKpxXtVbBPREvQLaNHpv
 smN62+l1BoqQ6v8X+S9C+R7/FBcNcyz+C85WaaFCHX3NjqT2opYSfQA8TxSRr/ybw6vlOWYrMnm
 RpAUC2uxKKY87ha/TnJtLYq5KMPcN3x2mYRwtkH0EnRWDsENmSuszgXJFD4dnXAL8zH1KlWtQGt
 AECTpoL8/aA9nTCXWNn7BZoUwBAjvfvVHKuTJzRg1qyDyL6RFjU5U5tNeyNLUeu3mQIDiX5aEu7
 4EVscG32cEA7SrC/GIVW5n1Bgxt1a057egZcJ+fQYpvtRmtJsxx0mR/jmVaG3sfTp+s+Jch3Nw/
 Qc6lg7CfI69QXMR8J8l6C4jp8JUeZ035b/BrzovMLTjv1Y0+jVyYNaIlOvzkvO13z6+ikvHZv6n
 m4LIrZj0tpGAwj
X-Received: by 2002:ac8:5dd0:0:b0:4ec:ee54:b141 with SMTP id
 d75a77b69052e-4ede70699a3mr106378121cf.26.1763167500274; 
 Fri, 14 Nov 2025 16:45:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTsDRVIqLn1VpOlz5z6xTpaoGY3LMTcHDBpzhVsFe6h8FITQwTVx2wdmRWmkQbySXE0rNnig==
X-Received: by 2002:ac8:5dd0:0:b0:4ec:ee54:b141 with SMTP id
 d75a77b69052e-4ede70699a3mr106377841cf.26.1763167499760; 
 Fri, 14 Nov 2025 16:44:59 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9ce1577fsm12961501fa.17.2025.11.14.16.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 16:44:59 -0800 (PST)
Date: Sat, 15 Nov 2025 02:44:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] drm/ci: uprev mesa
Message-ID: <prjwrsepfc3b6ozhue5cp66khlcvdrpvpy6jkk23edncmi4l3y@oiddmamgg3mx>
References: <20251114030056.1139570-1-vignesh.raman@collabora.com>
 <20251114030056.1139570-2-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114030056.1139570-2-vignesh.raman@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAwNCBTYWx0ZWRfX0MuzXGEdRXz3
 mNDxxwIRhGOQFF8KE7G1fNXRzMuIHTD0kUXU07lRprY1eU6lPE9FncLRrGlx46XXCTYtags8DYV
 NYmxuGPruorjwt2ongkDHFc4Zwi1GvDsepna92M8cjjCF1p3403C5BmscZW9MEJQUm1SoUrMJEE
 t4psOrR7MVzBOMadhjujIUZBnZEqAUyK8OClY+rd3vb/gUcmFdKJDUZALyigcvIgDvK05MBrC+R
 4AaXkdGbThd+2PDQs7Yt4CShvOPFPKmyXnOCmLwz8lMamXuG2AkHynrM28skDc6feET39LykWw8
 PkLpX00duVZ2fEe5J9ttaZDoQaIqw7AJpA7vJwcseWgXl5XHONYxIQB/vzbDGjS8YCCX9YLDXsN
 AOxOu3adr/bmGXnUIKATs6ef5bgdWw==
X-Proofpoint-ORIG-GUID: 2NEocPNqxuweNXEQctL-5XSsswqHGDgt
X-Authority-Analysis: v=2.4 cv=NZHrFmD4 c=1 sm=1 tr=0 ts=6917cd0d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=H-B6EOQw763qFByNOf0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: 2NEocPNqxuweNXEQctL-5XSsswqHGDgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511150004
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

On Fri, Nov 14, 2025 at 08:30:50AM +0530, Vignesh Raman wrote:
> Uprev mesa to adapt to the latest changes in Mesa CI, including support
> for firmware via LAVA overlays, removal of the python-artifacts job,
> split container and build rules, use lava-job-submitter container,
> and various misc fixes.
> 
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/build.yml         |  22 +++---
>  drivers/gpu/drm/ci/container.yml     |  28 ++++++--
>  drivers/gpu/drm/ci/gitlab-ci.yml     |  95 ++++++++++++++++++++-----
>  drivers/gpu/drm/ci/igt_runner.sh     |   4 +-
>  drivers/gpu/drm/ci/image-tags.yml    |  22 +++---
>  drivers/gpu/drm/ci/lava-submit.sh    | 101 +++++++++++++--------------
>  drivers/gpu/drm/ci/static-checks.yml |   1 +
>  drivers/gpu/drm/ci/test.yml          |  18 +++--
>  8 files changed, 186 insertions(+), 105 deletions(-)
> 

Thanks a lot for taking care of it!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
