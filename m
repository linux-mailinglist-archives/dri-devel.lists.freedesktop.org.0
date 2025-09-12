Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFEEB5403E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 04:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F2910E403;
	Fri, 12 Sep 2025 02:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZaBtnepj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F8410E403
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 02:15:20 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BK1N4U007124
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 02:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Hkf9o+nS9HTVNHq6n76xt6lAi8TAxB+Rb2oCezdkjY4=; b=ZaBtnepjRSjQgZLO
 qPvFGKhjsOTfW8Iv5WaBy3odjk41lZqUqNiiDifSR+/4AgUhKG7CAW7AhLOe4+tG
 5RDt82j0++qNzCrNelzF8VXw5iqx8m38MqOKFGysZCZXl9yw53jCYaDS1Mz+zLYL
 gAbx72dpYZb1Nx/QuUSxqPJbHWrZSL9z0kpk9kDtm+/5KoToUXcbBfQHfdLb+4kb
 znk71yZ7ekCmjUiFF5EXKRO5gPws5UCMVFhZzpVB5dEXZeZfSu6LRAtNfw93uitd
 w40eVQzp5FwMg+Fhv7P72+e7GUPMPofxIGJ+WXR8ziQZ6xa3kFTsxq4HLy3RDNdC
 Hln4tQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ahv3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 02:15:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32bc6306d47so331237a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 19:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757643319; x=1758248119;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Hkf9o+nS9HTVNHq6n76xt6lAi8TAxB+Rb2oCezdkjY4=;
 b=EBp9h/gFvU665vkWoBw3WlMBFUSa1fuYWTEpCTIDMLCfh4MhEZ+CzvmpRqf/9zJu/y
 7jj+4UsdSgBvV4UmpYN3JLGx1WJtnt8rYaFvb/sUXPV8UAB7lrUckyDOSHg8MBNEhlqU
 VIXdlc96I9Ive01ikksfyKToeKJmMycDCI0+LucKapwWEvmPLx1g62vLLLQxP6WcG3BF
 eSgesJxB2HV9dxULhkqnt6q4rAONmdv7ohXMSSScKMmzHgVs4m1NVdcYzIjpr8i4nFY2
 DJL6tA8OAOLrDx6cGbcvYqbbAweu686nyvXXc/ApKA7qPMuQHZ8nek2t1kGsUDyC/SUT
 awww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHqjrQRV3nBoFMtJkJNJ5By/xtiEMOogImRJdJKQmYapIbW+PcopwHuIdskaCEu+/cIbiIqO+QedI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+rujOHAe+wGsmnUsV7ZIxVXpzMRK9adQhC2Pu675G3mtx8HUa
 kKNp2oV2Lkd96AV4tWBp5RYNYi758IfKhsqMp9wmYmJ3NdO+oViHncd4NzQQDAuZzTIepSltNk8
 CJlzVRmLA+OrP/gkehVyFa0BVG51fHEzQwGdoP3T+Mrw0f8y5uLf+axIuwKb8M+wjkK96wdw=
X-Gm-Gg: ASbGncuTFJb2uzB6YlQkgOCw9Q+TcHE7iCf4uy9CQ1Q0YbVNzOxxylKUblaN/UoD6PV
 22KiCp+bkFJy/GbuaatWELEtOhMTpNwB+a0+auXSnIlRcuYpOC+O6mDgu4FAR9T89oInI44DOT2
 GzcHCr6RmKgIsqZW4I5S3WcdgNPBG1ZrEc43M/At+uv33/orNew8/1rDk0bfsLI26UaeexUWWk6
 MWayL/hJ8EIp33eYkXCqLR9hgUuccgv7JSfLKOyz0so4eL5li0+p3qC70/FuMytUOW3x/k4OyNp
 GRTFwutiYD5tu/G6BsqQLkWrq23oiAA1dmggDqNhmVW9iMylZ7Ww9sDOzFdpOJXiuINRp+VeFVv
 FMp0Cazv3FZMlGyTD7Vt/o3bb9E33MA==
X-Received: by 2002:a17:90b:4f8c:b0:32b:dfd7:e42c with SMTP id
 98e67ed59e1d1-32de4f90745mr761562a91.5.1757643318991; 
 Thu, 11 Sep 2025 19:15:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq4qCtfCRzD4DYH+qfi319AoKpVQ/JAo5O1h9fSmiMtLZQuLKN33nsWtedkSONVwq6ENs6Lw==
X-Received: by 2002:a17:90b:4f8c:b0:32b:dfd7:e42c with SMTP id
 98e67ed59e1d1-32de4f90745mr761524a91.5.1757643318503; 
 Thu, 11 Sep 2025 19:15:18 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607b1edc7sm3597818b3a.66.2025.09.11.19.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 19:15:17 -0700 (PDT)
Message-ID: <e974ffc4-9bcf-4de3-ac09-76b34b47cf5b@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 10:15:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/13] phy: qcom: qmp-usbc: Add QCS615 DP PHY
 configuration and init data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
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
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-4-2702bdda14ed@oss.qualcomm.com>
 <3ihzpsmf3btzeltxggdnbheji6bdeornravua76adw5dhotztu@e3fca2prl45r>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <3ihzpsmf3btzeltxggdnbheji6bdeornravua76adw5dhotztu@e3fca2prl45r>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c38237 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=GWYxvd0U3zBiv3KBAmEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: vixdNWxBOIsbuU90p5ndtst4avRMCjM-
X-Proofpoint-ORIG-GUID: vixdNWxBOIsbuU90p5ndtst4avRMCjM-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX018bj1atQcRL
 xwF7OOOiF5nBORCkxxafPtA5RMiOrWJebKTtJy/rU/d+72hzudBWp8Y+RAlo8995VH5sWGtga2H
 nKi2EgV9iKH4u/LywHV9/zIooQqsbkJbWCggl/QWsB2S9NM5yPbRrf71x81LBIZevpoY+7htfn3
 gqfmmdaZrpcXmF+UuiQd20RksfpM+cCFUXKjbkbKbXaQScHWUYKyEakA+sHPyeXX5DbDxsQzb7A
 1JmlLe8Ic1fs/hFgeH4zJrLf/4pVquEsa9LefFbnknrD4BAMYhoPux+ZSltzrkPx9RzqtvrhdaS
 GU1unuhnl7l023qe/DxQNYWohI8PBO05Gad48h9V40trlPTBu9RQ7hQnS2sJJREQ72SymDToVxU
 DB4UnIT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
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


On 9/12/2025 9:24 AM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:01PM +0800, Xiangxu Yin wrote:
>> Introduce QCS615 hardware-specific configuration for DP PHY mode,
>> including register offsets, initialization tables, voltage swing
>> and pre-emphasis settings.
>>
>> Add qcs615-qmp-usb3-dp-phy compatible string to associate QCS615
>> platform with its USB/DP switchable PHY configuration.
> This should be the last patch in the series: once you add the compatible
> string, it is expected that it works.
>
> The patch LGTM.


In v3[12/14], the compatible string was placed in the last, and you remind me
will trigger unused warnings for the earlier-defined qcs615_usb3dp_phy_cfg.
So I merged them in v4. 

If move this patch to the end, patch v4[07/13] will hit unused warnings due to
missing references. Should I squash patches 04 & 07 and move them to the end?
I'm concerned the resulting patch might be too large.


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 141 +++++++++++++++++++++++++++++++
>>  1 file changed, 141 insertions(+)
>>
