Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB11B2DB85
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 13:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B5B10E705;
	Wed, 20 Aug 2025 11:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+ArhmI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE6210E709
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:46:26 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9sfrO010521
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=75L42tl0MI8KDN3dC/5xm80p
 bNugX+cDtHPbn4TsTaM=; b=f+ArhmI1e80n2E11S0VAGAHBmTj7HCLAeDvtlL56
 +k4LpOIw3P67j6da/lsVzoHX+IUnXFXe1GQ1pdLSdyzZNIWh2S5mDJMJXbxxAGx/
 3HtprMmldnr6sfITJY7LfmQwx838XN2D+yhlDylMSYdOh4mkP0NqzRllWF8rZinS
 Pd+IXCpQKKojyrZDd4waTrWOVWtOPAlVlIPrT1srooK9IcXftGSt+1mrG6RpfH06
 KiNEJgkUWbMeaaUG1VzwKUp5aasgESdXV2uURKnfRWWQLhZlEze7EDRAVXH+EqM8
 NNjCp9eOQY4JHk5n397t3haCiQQsmELZeY4aBmcrgFgfUg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a1m36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:46:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70d7c7e9732so8594726d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 04:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755690384; x=1756295184;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=75L42tl0MI8KDN3dC/5xm80pbNugX+cDtHPbn4TsTaM=;
 b=WEJzz5tz4U98M6yc35QQZ0JWK1CCVQVP7J7I7TKQmP5jMiulnYipA35HUHe+Ummzzd
 UdplovlFpnjqR7u8X+kA8OQwMqYHZ/uArD5rLjIKtwK0EWCRrqNupiep6Cv9skOfhk9s
 5vws7sv39cNz/LJziOEPtkQKdvKDnL6AsxVmtcbO7TKGooNIGkC6a/Lb/TcffQzApSNO
 5hK3xdRyfEDCmvzGzFF9Pb/drmb6lqNknFM2qUsqQvqQowX1BrnR5Ti2eZJLsppngei7
 ObKIeeeMwEnUqYp3ly/0zKKn74YUh2b1izggojUKgcjLiXXy0Rz8e2BH7E0/3aY1/VJ6
 FnWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzNfW24wcAoj6oDjo7lgupL4gynmE6T+AT9y2GSdcqOgf2KuK3S3TTA7mG740ZfVl+YMrL12eL+lg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0/b9ts7qSFudaMzlBr50K/M4234l10Lvtz5rsH6ttF00N6YsW
 lE9+qRw7iUKreAXfqWBUVnKCcm4H//NBByqnH8uuBsEJi5u6EVFpaqD09k8/NWY+q1H2GaZTcQh
 Zp56zf5UPBoTMCVqmoX+uOy5DpJdQj5nmy+foG01iiaqDgARsvWYaoNX8EcMGghMQNJ47WOQ=
X-Gm-Gg: ASbGncu9404UvKpwqNNULAXEoZyEKndyHortKty0CL6euhf365UKQp9p1EPvOpnhA4s
 YJ3FgZlKQ5JMga8t7yTxQWaEShCQOK+A1eqTeqK8VaTHNAgafxRs9IRoTnWWU+cPZUG1io5giwO
 HC9VavQG5QTCIjR26s+kbwzVjN6bL2fFcBYU49ne8XjgGk1u6bSaQzCq6fN6tbeT4dgSK7yjwkb
 rZBiHYT7jeT9oMRtjmUNqtG/UyK/rBgovPvFKL1p/CHKH0YtZ/Wuu6zoY7dnvzArvh7/gqqZsda
 clssKoZu9/4iqu7HbPofbSgVC66zPRed3yEPmwVukg0+3wO8YYg46rYgutO2rrlMqJMArIEobJr
 x2aWI+P1fdsfn3uQPQ2DtJu3lzncyFMKm8TAhQMeGfcBQP/+ESX2E
X-Received: by 2002:a05:6214:5194:b0:709:deb2:3dcd with SMTP id
 6a1803df08f44-70d76fd4c15mr24701876d6.25.1755690384311; 
 Wed, 20 Aug 2025 04:46:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH83ZZdKQ60Ug1Lmf0IPGuUmaz4M2F4mxHsaVgPhdq8EvO/IDjNwV6zVABnr6KJ/OabGfXT+Q==
X-Received: by 2002:a05:6214:5194:b0:709:deb2:3dcd with SMTP id
 6a1803df08f44-70d76fd4c15mr24701406d6.25.1755690383793; 
 Wed, 20 Aug 2025 04:46:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3f3525sm2531156e87.108.2025.08.20.04.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 04:46:22 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:46:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 03/14] phy: qcom: qmp-usbc: Rename USB-specific ops to
 prepare for DP support
Message-ID: <ay4ss7cwpiz6zwiwiav4ts5hwhxjpc6ogc2uirwzfcyhi2crln@3azxsu5hvyhy>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-3-a43bd25ec39c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-3-a43bd25ec39c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a5b591 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=H4SNA-w7Ihemelo7scQA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: G1cByeEeAfVVxUOTIjWYaZUjF5tP8Qce
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5qdddQrjDDt6
 9qHyXgAPmpk6BaPGghmDwG9asUWGakFGVxGdMc4JFR7f5JmSj9NJgx5HYNlmOPnEtCGPLa1KVHL
 0sG58Eu7ypHoxIWmOdhQbJdG07A3kBEREDhxKkBHCt/jR7TktrXiVbkC7ThjqXJV0jveu38N58s
 qgM5awvZ15BVC7JzU6vha4Y2u+1jDTibjTt3ew4xzfL9Q8psj6ESWiSIugnbZunDfSKzaXAx/gY
 82UoZv9aDgkTxDuPxAx1kaNnl0Y0z1YP23ek9Fous9smnQwSZl1ffffQq3cYga+LiWA820vwfTk
 SWD8Tly3Lo56V87vwekkIlgQ1hYf6zdNY1RQV7BkgxYql/P0a1//MjrD+0U/QdUX0VvXxk+LbEB
 fKdKee7fSbFkixkW/OI6+FkTjCuWXg==
X-Proofpoint-GUID: G1cByeEeAfVVxUOTIjWYaZUjF5tP8Qce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Wed, Aug 20, 2025 at 05:34:45PM +0800, Xiangxu Yin wrote:
> To support following DisplayPort (DP) mode over the Type-C PHY, rename
> USB-specific functions and ops to clearly separate them from common or
> DP-related logic.
> 
> This is a preparatory cleanup to enable USB + DP dual mode.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 50 ++++++++++++++++----------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
