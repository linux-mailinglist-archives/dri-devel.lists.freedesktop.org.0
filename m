Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18918B53FD7
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 03:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEFE10E008;
	Fri, 12 Sep 2025 01:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9Iwwt9J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3E410E008
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 01:25:04 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BIPUjP006005
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 01:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=jVL5pFMdzfmtJDJqaALS6MKa
 H/CYA6RWxHVUSd0whRA=; b=Y9Iwwt9J07xqyPZyLzirtvGTfSjHJt09X6aPx4IM
 5POqfmcnjfJVtTO5/hpE5TrcUBPl3rE+xTqDE2rlFVAB/al+OJCeK686UlLyg7xX
 yORbypKnJPaJtWCfJGZKXCouDKsWEMSsOSYPSzyMx9sFPzK44E4DkUp/qgDxvmuR
 pssa7RBjWk1wm7liEMXUMJBoNYJ0HIembptxXEw4L1v0tsamZ3JevPVKWWMAPRtv
 gbnlBfOkH4PEsGK4Spu4aE0xLVq9eYLq5m/J5vjYUGhtFHcw8ZfwBDPniyAaOSCS
 R0eQ8dHfGryL+QgnO9tgEzdSPgc0E/nD7UO3PStRdnuQlA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ahrgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 01:25:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b5fbf0388eso20301751cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 18:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757640302; x=1758245102;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jVL5pFMdzfmtJDJqaALS6MKaH/CYA6RWxHVUSd0whRA=;
 b=h0XpJKfx2IcR4m1I9BjETAZ5qTd4KApPZ/DvfZGNJrz96kBzwa2yzDwDG7vVcWjLIR
 kx9HlButIiNNbAVdqiwzIkTa3/FiF2SLUalDUkmtPdH7uZ38WEtbzl3RVgdw0pObrSI/
 OzYCGFd/o7OO1BHn3L/8wdrcciWu5jHrwhEfQoeq7S2HUfo1aTpbgMSJRrn0oN7X9lDu
 RffrlPWNaYddfmrEVfCewb04BrzhsGD9JBfowa0xKrrVHyFDW2hpSKFDlmFB9EjtZhwE
 kGvoqIfJdwCBDnVUv3NTW9zgK3+HxOKGiVHnomcyLFSWhOGrcU/thLAFN7YhTfiX8Ex4
 yIhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwuL0X01t/tYwGL0Hq57zhiz9oOJF5QMoO2Pkn/wRzIKZYdTL1Py5/JtrjtZZl6d6NKeuzTRqUbMk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgvnXF9N4Ybm0jbwUqo0tgiO3tJJ0Dvp3STdEQUlz+ndjfY9Dk
 ElXEQbFUUwDInJtFWlJIr+Z7SxIcLYndhN1lK5AALjN2+ZTMQS1Fe9CfIcDE8aEU2t99nKpg689
 X4Gj1FsM4jyVjddMuky537+WWjtJA5VKJgnp01SDwMxw/F9XCxYWPDmSUT8zBVMB/TKKBhAE=
X-Gm-Gg: ASbGnct0DASGwl23z45RAnoE5b9Y7vqQo5y6YbRAlyDbXsqOclBR1GPLg1ySSxjr5cz
 KCmvskKUm6rIYhaSlMSzkis7HIG3rcr178+JPOAITWXvBzLKd0Nwsftb8n740xz/SuS3TpyyUwO
 Y5RJgKiqxVNQNKHh5xb4XVREVTck7yOYrf4QwAutOap2oLFWMwjihh8FZsNS1ubX3aBvfezK/T4
 15+t5Psl2mMoaQSmc6F4C4yv+DKbroUHfgbEcB1yq34jEJh2LFlMcabqhBUU/C9bbdIU7clFyZe
 KKV/qiiEaWkvgpH3uTTi5Pc5h8LWdmcmdw8hPfaYkmOhMZq69gM9/2a/+IgiMS2ejhR8c1EVjWj
 xf1hmp6yz2rQRNOYKzFrTcDoLhTj560WbIy0Nidkv8VrNLvRz4Ae7
X-Received: by 2002:a05:622a:514a:b0:4b4:c44f:1a7b with SMTP id
 d75a77b69052e-4b77d0bd2f7mr18789981cf.62.1757640302350; 
 Thu, 11 Sep 2025 18:25:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+QdUbchdxCgWR0jpxz6S1/KovEnrGHT20/GZYw265IPlYpgXYKdIaCAtbH/9CHq+GGr04EQ==
X-Received: by 2002:a05:622a:514a:b0:4b4:c44f:1a7b with SMTP id
 d75a77b69052e-4b77d0bd2f7mr18789701cf.62.1757640301746; 
 Thu, 11 Sep 2025 18:25:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c692daesm788199e87.26.2025.09.11.18.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 18:25:00 -0700 (PDT)
Date: Fri, 12 Sep 2025 04:24:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 04/13] phy: qcom: qmp-usbc: Add QCS615 DP PHY
 configuration and init data
Message-ID: <3ihzpsmf3btzeltxggdnbheji6bdeornravua76adw5dhotztu@e3fca2prl45r>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-4-2702bdda14ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-4-2702bdda14ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c3766f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=LEMoh8uNuNVMCwR6SuoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 86xBiBmXrqqGGozMfxaXuTiRqSnsjU_e
X-Proofpoint-ORIG-GUID: 86xBiBmXrqqGGozMfxaXuTiRqSnsjU_e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX/PKP0QyHeONB
 OrXMnzuq1Czah8Zzoc9c4r83iHnHqQNe0Zqo5AxTtmx6NnB/IPTSxdd5PKUvx9b9gG2C4ZY1DQK
 +r6/rKDAMdZxmD31BJc1dLX5nn9uKfZUFalPMPNX0NQGXE93j4voMAUufDIT6BxRWmjL/E+G4+d
 hJWnuGAaCfQMzWlw68junO7zFBF+prbLnu9K1JpE8dg7dKfv9a1cZ/dJRMtTvEp4LG0dIgSW6Xh
 DETeg8iXT80yNGW6LtoYBbi2xgVtYn6HREp74NLHLTX2H2Ddleh5tm9fQ+KrCPmXd0d63ZfrFxb
 Vi3E0Y3nVttd7/FbG3dDF6lgUfwXNA6PEXdodtsyhgXUkJkDpcnscVjZHzTycD59cxrEGZZ6e9A
 zx3eus6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

On Thu, Sep 11, 2025 at 10:55:01PM +0800, Xiangxu Yin wrote:
> Introduce QCS615 hardware-specific configuration for DP PHY mode,
> including register offsets, initialization tables, voltage swing
> and pre-emphasis settings.
> 
> Add qcs615-qmp-usb3-dp-phy compatible string to associate QCS615
> platform with its USB/DP switchable PHY configuration.

This should be the last patch in the series: once you add the compatible
string, it is expected that it works.

The patch LGTM.

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 141 +++++++++++++++++++++++++++++++
>  1 file changed, 141 insertions(+)
> 

-- 
With best wishes
Dmitry
