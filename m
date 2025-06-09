Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E61BAAD262D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 20:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557C210E436;
	Mon,  9 Jun 2025 18:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EafUsoQF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BA710E433
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 18:54:57 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599tvOH027295
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 18:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bdYSp294Kmo6eHdYI4u8F4yR
 kn866GRiB5ZbygzcprE=; b=EafUsoQFjER9dtK/DAMY4LtUOOHr+2JZ1yPJzRdm
 q2RztNB/stSra0seTjs1t/+iKMNLnLqWprO/h/B2HRCkBMpcBFmcF9gJUFTu9GGg
 U6kSzocK/oO7znsssoliJgh+8iqOomiIoX4F1piOPOg2osW2vsoyrwlpIXyEMshl
 53isUTrcBzHn55p/R7TFzfcrEJni4fLX+BOaXvl33+H4ulKCfv3P+D1MJBzFrQ+g
 mRCRSEIufOza6QUatZCtFy7/2YVs7VM7rcfF31ia5hFHL5S7lhlCBg+IOXxZbOlI
 KNjMI0ny9yuHkgdY+z5kRcwZE4GW3eHjSdXQceHJaY+2+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6jesbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 18:54:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5e2872e57so833654185a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 11:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749495296; x=1750100096;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bdYSp294Kmo6eHdYI4u8F4yRkn866GRiB5ZbygzcprE=;
 b=ZBdTfjvw2MKOsMvLuWtR90i3Qtf7LtFUDDbVI13VDGmbljZMb4t9zoi5gvDOsTLvNn
 ExODEmSlwQtxm/nw7Ls6SbhSVjyEFrer8ZdYucUzlNXc+CV/GV2fTLCUUKm0VbkgDnRQ
 vMvtHeolEioM4km8GG3btTSc8u0syb5RoU4+yvns/l2nR4cG0w557qVlIFlt19zbvC3k
 z8xSgy9qgAnG7nQmR4jcDQq0/oBdT6fv0OQCyV6PIA91cRMVTs+zXLaKXRVqvUd5xKPD
 V9zqFqKIIC2uhTh36CaJ907dHiut55vHREYjjQpXD8eHjL8PHX18ZLJdnbovsxUaqB4J
 ugHg==
X-Gm-Message-State: AOJu0YxYI0OPLVWd8zLh6xM0hvx0TVfKNaK1IYL0OuO+d7VnZPoS7yDO
 JuSz0D9JAuu83S9QG3DJHRGWJDi/9uOfkBJQNmhLIPkDUQdp2+eRGB9RFNDDhbRVjr5aaBWM2yI
 tledj5J25cBgC2X0dp2rcF0j9ETa1izHTmA2JSkcfG8HaBn8nIZqtXLXUx1zaIgHx8WngCLM=
X-Gm-Gg: ASbGncsom4Ys8WSl4EePvct1h5eWGwd1z0XoIFrJ/WVe0pgf6kX0RhXCYZbVNyWfOxn
 OZTccDSbd99xCHkPVreGjflKCahI0aWKbppAkYVlCEATGAH022CrhYQ2jz/PEIv/TVvObzU5Wa/
 8cQQuUtILUlzUPsIRnK2MEEi1xJammlGr00wEHcVICQOhGLZVAMdgwFmtSiUrtIM0XDcAsIJS86
 ohCqhKowF+aw7s7ATyhAsAzE/1QIZhBhKfByUrvoyygFmiaQiKUS3UxPi5JhVgM5BBm/FJCkSqm
 JVuNbpB0PpcwKULDnnIHTn1+liWTERu7VEJGvspuvZuVtgwTZQGU/XGEJoJ5V4DE0wg0XDEiVhQ
 =
X-Received: by 2002:a05:620a:6a81:b0:7d3:8d2e:1f69 with SMTP id
 af79cd13be357-7d38d2e21bbmr731860385a.17.1749495295547; 
 Mon, 09 Jun 2025 11:54:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNLps+ki1+SdzxXPF5sfV00WqC348swYXpemcq1eg1DxuJ4nAqN5qEFtZ4+PjRVI+oaARS7Q==
X-Received: by 2002:a05:620a:6a81:b0:7d3:8d2e:1f69 with SMTP id
 af79cd13be357-7d38d2e21bbmr731858585a.17.1749495295248; 
 Mon, 09 Jun 2025 11:54:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5536772a1e5sm1291949e87.141.2025.06.09.11.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 11:54:53 -0700 (PDT)
Date: Mon, 9 Jun 2025 21:54:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] drm/msm: Rename add_components_mdp()
Message-ID: <c4myfvymbbg7likuahefxtuscskkreflyonx4moul4dqnvmjog@mzzz3qrlsocj>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-2-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609182439.28432-2-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=68472e01 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=-2mmMjQWwNZ6YRhNbUMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: oTPEVUH9LKSbZmmySYk3l7dV5HzyUlKW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0NCBTYWx0ZWRfX0O7PvDqBLvwM
 eGZ5EbDjIZ0aS/mUHO2mfw9OO2TQnYahtUaWJqpxJ2hy+Io9brrCJ9k1psNq9EaNMCEMOei3yA/
 3svEJHsnW9NigFWNrLlg2Roe0iv1ygTnzrQWBenT8K+CYpiCJIuIu3IRo6OH4CZWoyoE5OXaum2
 Z63Q047MhiQrR2CEamg0BjXK9DuCdwZ8dw3bppNRJjC2NfUXUQKPO6nocEIEdrH7l9BfNz8paia
 ltcjL0bEbDmF9SYrKzwOSzJb7+bg2N2CNR8L7Y3hpEbsRT8bhtjbo5l8DtdOpbDLJONs2blJFBC
 JsvJ7l9pPzDZficsOeh9pkX2G4tOvJFyv/02JsdK7VzB0f0lENI7SkUkt7IHytuqHwc6VYEzXW1
 RnMgsUX7h9PVulHFrlRa0SHU+cqHw4zoVjHOS9ksyNPQvgPGZpOnDSxSWcc8T2tBNueGu55g
X-Proofpoint-GUID: oTPEVUH9LKSbZmmySYk3l7dV5HzyUlKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=796
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090144
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

On Mon, Jun 09, 2025 at 11:24:35AM -0700, Rob Clark wrote:
> To better match add_gpu_components().
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
