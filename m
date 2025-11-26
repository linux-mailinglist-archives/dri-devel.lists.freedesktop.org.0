Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43F6C88159
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 05:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF3F10E512;
	Wed, 26 Nov 2025 04:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0ZDSvcU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEyEmp4t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C3010E513
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 04:45:54 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APHAfrx3890211
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 04:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GqL06KXfLzDGypNHqQzyTKRnoJEhHxiqndXjTZfaMJw=; b=F0ZDSvcUNLM8J+U4
 Dq3EBRXiaxt3T9a/+z3R7ddORvUgPcl1xWFYDFvc3d1i6jfA2AAX3jvCjoE4c4Yb
 yEjzgzwe1aPKofzpwb+tWCUjCojC+bCDDW19pPnM6t8iqnmfQmY/R22fPuV6mjFs
 vsWTlYqMyaaa/K6LQdwPEjH+qHGg0ZY3BIJiAng149ufxO6Zmn0lJ1d9ba9oT+hn
 +LERVxckkBPn6Dm4eSFs7yzs4s3uAOirvAIs4AHohsFA+BDQH5Me7ww1xkwvaLgd
 bt0W0WQmvJcP7EINcio11AjKmOnfUON6gtRh+8E3ZET6x36Ri4OYvDevOcV2EZN/
 Da/ZBQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angme9h0k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 04:45:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-29844d9e030so9993395ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 20:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764132353; x=1764737153;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GqL06KXfLzDGypNHqQzyTKRnoJEhHxiqndXjTZfaMJw=;
 b=DEyEmp4tb1T8XXMQpDZIFYGA1+rA0Kt+mR8Io46IuvDn36xWeKYb0GHPDJBv7jhfph
 A4AyfXw26XJGZq+yJgyuPBwHa4xAoHyW+rDj4KA8026SMVkHQwh75n8DvVgjEO96w5Zs
 K3QDoeQDJbtN6HGRWlOCdOfjRQQ10EPfapcGykaKa0eCCAy4t2pkDvpjOOMzhCS3fek7
 dO+05UKFtdvQw5OzUgMKEpjaP3Rc/Wfat+JTDx4lD85fSHFsjL0lrKrxtOvZozTBt3GT
 qP7pTpTTj/zvC1Ka49ji+2ZyYXLv6wYk7oqWGy18mDy99VLVhOMdtLGSftxfuKI8kKNV
 QCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764132353; x=1764737153;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GqL06KXfLzDGypNHqQzyTKRnoJEhHxiqndXjTZfaMJw=;
 b=dIiHjNG6iIBkvU+tfd+bxpQlpvan5gIe7kH8+UfflKQEzVJRslFPbrp+IEaMbSoJ6P
 3TDsVr+pxnORum5cZbgazhwfutpCzyGum3kuKYIT1Bo0XGyQzcIPu+qCYZmM7libBoer
 AJZrimH9vjpqOwN7gHIumfJ2rdXFvIWHssIsRmF9gSo1Env9t8spFLMulO3hR7lZ/ONh
 b+hqw4JhL5htoq2dvs26VQsjs4POHoWGx90kj7VELfXgyzYQHv2Ul3i+eEhx/sjmaDj8
 mV1iEETcnlqnkpkQy3oibU6VL5XjYjVhR5aXuZKLxyL06J8p6QkoUTbnBagqlua9MuTN
 Unpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVImedlRXc9CChbb/+fIZokSkSHcxmYezMiqulBS2rN6wjtmIuEK2AjdRieKiRLy052OazE4DWM+xs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5wpJoKaMzMPNd/K6JQKy34X/vx4tyD0IsORCDhoJI+0QUQB7h
 FyWBy23jA3Ocp2YquPrkSd+VdWeckQ7tJS1w81hpnm/yRZfopjuQYDb1c8txf0SCw+Pq9Mi/Ten
 6GyOqoyGPLK3vjeo9f+yxGOSqNbdgpapwcoQGdMEpSYYcUXizNMcFMb6KjPNSrO65MYdu9Sw=
X-Gm-Gg: ASbGnctBhdyB4LLL72LbUKFgHKUIOSuPm24YAD5iUoQoi4m29LUTaxuddr+GntjrdfG
 dLZ3lpfBVq7En3ZdA0kGwARWbIFLBP24UvjxJLFAISNV9QK9tpJ6KDlS3Qb91Zb/T63nqJsY0Ne
 i8rnsQK+hxklW08fMAlXVrg9AShpMMWMHHXVSnuZGxQ697IrDqk0niMGgJGE0aIe8O9an9ySsWv
 NSI4ru2QvRXafuu0XqwyKAy9aHlkNTz0/G0PueY40BorCwygh4HuPs6/qHH6Z+Y5ccX3/+vvpjT
 /QKP8RrFV2ocPoCzyyljaEW5edneP2coMVtW1osa8GGtltcDwmBF5y/brsbCc0RUBOaBl0NSnHA
 dIansaEb9AvfJnFnkT+2PYePI6BPIdo+Fi0wqntXNN8+rx3prjBrczXUZpQ0JeYBmnN8p
X-Received: by 2002:a17:903:1b05:b0:295:70b1:edd6 with SMTP id
 d9443c01a7336-29b6beae519mr120353435ad.3.1764132352557; 
 Tue, 25 Nov 2025 20:45:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFui52U3VCAjaLPTtk3SOMAR2H4EmZuFAhCvTFDgv/zFDxoa4lx+TcsfLyVX5O6oR5w/HgLhA==
X-Received: by 2002:a17:903:1b05:b0:295:70b1:edd6 with SMTP id
 d9443c01a7336-29b6beae519mr120353145ad.3.1764132351995; 
 Tue, 25 Nov 2025 20:45:51 -0800 (PST)
Received: from [10.133.33.221] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b105e4csm179391405ad.2.2025.11.25.20.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 20:45:51 -0800 (PST)
Message-ID: <42c9e912-70bd-42c1-aee0-78893d1db3bb@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 12:45:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/14] Add DisplayPort support for QCS615 platform
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, tingwei.zhang@oss.qualcomm.com
References: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=69268601 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=Fkfh_6v1YXoygXURJj8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAzNiBTYWx0ZWRfXxzsZl3ybeClZ
 SBXX2nFrvh1U1FeQh5n5lrXI+x74NqbhXJHA3adCg6TeyEmSDDAi2vK9JnIHBEaB5W7P5bKl+RQ
 9VaM0ZeLl1JAX/Uxiq7Kxem7CGA4hHSJuESST4vsuIV56HEOmkfmXpJPy9E6AdLa22+xXzI5F7S
 4kPMthOXEaRxWNJWlSeLcT5Ja1EJUyGFj2ZHui8EKQ0dXaLHs6uN74/fhtH+UO+ihqZrPrQYUbf
 RReMYzzuZ63pgl/V4Ocbmk1GigRcn0fB63t77LTGToY7m3iVcZrRdr/fxdK9edbgiOJUOQxL9JJ
 XePwwu5uhwObpOYH4gZidrbCA5h5wyREeeahJmjnAiPgTK6XMy6JOWi9xeekn/uPGuoRJ7+LN8B
 ksKK2MzpUSsUZiqiK/S5WGrzdhak8g==
X-Proofpoint-GUID: XS0fJGRrwdDE1T78cmhcUYl_aMlekv16
X-Proofpoint-ORIG-GUID: XS0fJGRrwdDE1T78cmhcUYl_aMlekv16
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260036
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

Vinod,

Please let me know if there's anything pending on my side to get this patch applied.


On 9/26/2025 3:25 PM, Xiangxu Yin wrote:
> This series aims to extend the USB-C PHY to support DP mode and enable
> DisplayPort on the Qualcomm QCS615 platform.
>
> The devicetree modification for DisplayPort on QCS615 will be provided
> in a future patch.
>
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
> Changes in v7:
> - Fix QSERDES_V2_TX_LANE_MODE_1 configuration from COM init table to configure_dp_tx().
> - Link to v6: https://lore.kernel.org/r/20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com
>
> Changes in v6:
> - Move usb3dpphy_reset_l definition to the patch adding compatible and related config data. [Dmitry]
> - Add NOTE about SW_PORTSELECT/orientation handling. [Dmitry]
> - Use C99-style loop variable declaration in msm_dp_link_lane_map. [Rob]
> - Update commit msg with issue description for [05/14, 06/14, 07/14，12/14].
> - Link to v5: https://lore.kernel.org/r/20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com
>
> Changes in v5:
> - Add new patch to introduce QSERDES v2 COM/TXRX register headers.
> - Restore legacy reset & clock register logic. [Dmitry]
> - Update phy_xlate() to return ERR_PTR(-ENODEV) when dp_phy is NULL. [Dmitry]
> - Rename helper from qmp_check_mutex_phy() to qmp_usbc_check_phy_status(). [Dmitry]
> - Drop storing struct device *dev in dp_link as it is only used once. [Dmitry]
> - Add robust lane mapping: default 1:1, complete partial configs. [Dmitry]
> - Reorganize sub-patches v5[07/14， 08/14, 11/14， 12/14] as suggested.
> - Link to v4: https://lore.kernel.org/all/20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com/
>
> Changes in v4:
> - Drop patch v3[01/14 & 13/14], will sutbmit new patchsets based mst dt binding series.
> - Update maintainer of qcom,qcs615-qmp-usb3dp-phy.yaml to myself.
> - Add missing aux and pipe clocks. [Dmitry]
> - Drop second TCSR phandle; register offsets are described directly. [Dmitry]
> - Add USBC PHY series related init_load_uA configs. [Dmitry]
> - Drop v3[04/14] qmp_phy_usbc_type define and use dp_serdes offsets to confirm DP capability [Dmitry]
> - Reorganize sub-patches as suggested.
> - Link to v3: https://lore.kernel.org/all/20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com/
>
> Changes in v3:
> - Renamed qcom,qcs615-qmp-dp-phy.yaml in v2 to qcom,qcs615-qmp-dp-phy.yaml in v3 for QCS615 USB3+DP PHY.
> - Updated patch v3[02/14] to revise binding title, description, and property order. [Krzysztof]
> - Updated commit messages in patch v3[01/14] and [13/14] to reflect the DTSI rename and clarify compatibility. [Krzysztof]
> - Added USB3+DP mode implementation in patches v3 [003–012], organized in logical chunks. [Dmitry]
> - Dropped patch v2[03/13] to maintain full backward compatibility with USBC.
> - Link to v2: https://lore.kernel.org/all/20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com/
>
> Changes in v2:
> - Add new binding qcom,qcs615-qmp-dp-phy.yaml for QCS615 standalone DP
> - Split DP PHY driver into patches 4-11 by logical chunks [Dmitry]
> - Update DP PHY configuration flow to align with QMP Combo PHY implementation [Dmitry]
> - Update all hex values to lowercase [Dmitry]
> - Remove redundant comments in DP PHY driver [Krzysztof]
> - Remove invalid USBC type define [Dmitry]
> - Move lane_map， max_dp_lanes， max_dp_link_rate parsing logic to dp_link [Dmitry]
> - Add TCSR-based mutex logic for DP and USB PHY coexistence [Dmitry]
> - Drop patches 6–8 and remove related binding properties as rejected upstream
> - Link to v1: https://lore.kernel.org/all/20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com/
>
> ---
> Xiangxu Yin (14):
>       dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
>       phy: qcom: qmp-usbc: Rename USB-specific ops to prepare for DP support
>       phy: qcom: qmp-usbc: Add DP-related fields for USB/DP switchable PHY
>       phy: qcom: qmp-usbc: Add regulator init_load support
>       phy: qcom: qmp-usbc: Move reset config into PHY cfg
>       phy: qcom: qmp-usbc: add DP link and vco_div clocks for DP PHY
>       phy: qcom: qmp-usbc: Move USB-only init to usb_power_on
>       phy: qcom: qmp-usbc: Add TCSR parsing and PHY mode setting
>       phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP switchable Type-C PHYs
>       phy: qcom: qmp-usbc: Add USB/DP exclude handling
>       phy: qcom: qmp: Add DP v2 PHY register definitions
>       phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY config and DP mode support
>       drm/msm/dp: move link-specific parsing from dp_panel to dp_link
>       drm/msm/dp: Add support for lane mapping configuration
>
>  .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   |  111 ++
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   10 +-
>  drivers/gpu/drm/msm/dp/dp_link.c                   |  118 +++
>  drivers/gpu/drm/msm/dp/dp_link.h                   |    5 +
>  drivers/gpu/drm/msm/dp/dp_panel.c                  |   78 +-
>  drivers/gpu/drm/msm/dp/dp_panel.h                  |    3 -
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h      |   21 +
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h |  106 ++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h    |   68 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1072 ++++++++++++++++++--
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |    3 +
>  11 files changed, 1427 insertions(+), 168 deletions(-)
> ---
> base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
> change-id: 20250919-add-displayport-support-for-qcs615-platform-f885597b3573
>
> Best regards,
