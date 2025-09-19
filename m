Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7A6B8AF5F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 20:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD6210EA6D;
	Fri, 19 Sep 2025 18:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IKcLA+o5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4F310EA6D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:42:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JEAm7o029614
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=X04daQs0/GOlbdwQIFR5tVab
 ojXc3GMFHaojbKi4+xU=; b=IKcLA+o5Fpr3sQxqhBg9BBKCSXhcI66u0QHDblww
 a+94BmfJz9SvdIE00ph9sTH6gB5RjBEHumfnAPQfjnQHKlmxq5XnTZsAvQOLGVjs
 6KBsDKSjbJpsFjMjLaw/qiKR/DKQIjNX2XmEigi+wF/xqCh763yw+ytvN/rpQyMo
 Z9YN7w6zNmA39B5GrPo/AUyDOxhYcmdiYMKKdN3ckv9x4p4cKu+tczpJ2xGtucx5
 TFhUZXhx5bKK6w8Ofij7/saDweOwwBCjTkF/eyG+j60rtjbp5Pl3hhdpAt+B+HZ+
 MNB3onauJNaNTUEe2JylgaaXyfpyFpQZn2xlveCVZKrt/Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy13fhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:42:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-811917bdcfeso528446585a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 11:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758307330; x=1758912130;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X04daQs0/GOlbdwQIFR5tVabojXc3GMFHaojbKi4+xU=;
 b=k7yIfgL5w10Ubxm00hDhuk35vbuvuGu3QUHxr3oW5aojzfyztdBmxUBQlRnl91n2aA
 QCImSJEAYXoVumfkbSq7bYpbbBA94ag4ic6bp/F+sfKc6/ggCQvgOWOhjVgr3niGABxA
 2bXeKafnrr+SmBLkYLS+Zt/+6GCLE0/2SNCCgPesstwt8Rp5vvty1ZD/X03utEjy3vl2
 +Vtlp0nPhvOOmTRlVMIroVOHwjx2ppp2etlK8GDsK7DhXyJ+KX+5qLv1UtaFR0pZ/pGf
 ReWCh5n6+jHMp6OBggziPtSr1kRHfdXoZ5Vbdbm6QgKZIgVJjg5iqMbJ5NwHZsykU7rL
 Z4aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX74SsGhYOzAEl+E3w+0QPJf+j7imUMX0hpFb2Ou6OrQsF3+zqZAoXYGSfgogXukEWGiv+0EpcxA28=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3Aigk9niKvmpa3/d0/+x5p9+houWbpYUFsZiS2ySa5/xQIUGP
 OEWbesmVh22TLR4yhW/hjngONSActiolthKrBXlVMAfNoYmbPkJODyaVgCtnxYSBsF0RbfSqrcc
 QvCNpAHlF+aeYiPxuBB2wRPREeEshOVRbNjmyzMfqPKbAto9nhHyTy7p5nqcrxrMpcDHqMgY=
X-Gm-Gg: ASbGncs//oA0M3SoniymobV/LtNN49TVpu+bbFnbKJBSTnYLIzgSFQPlJBxTC/xND+8
 2jFInygBvSqwpJjZyzy5S6oKyVOhbbzwZhDTGrwkNFchlDZIIOcgsIzbj+Uajpgn4lfnaRHSceY
 hzvkIORNcCJQ0iiLBEZfWB53X5irlSOir6MRBrUGiCihkr3gRHoQ1KCMBh+5KrX3m4ZxLW03bAP
 SGD41MK9LvUvtbTQIrCH+o97Rx69Dwf5CSyJyK4RW12im20nOPF5mAUa/XFms4IV+n/NToOPt+L
 EnQ/Mt+/3a18xGuTHkh5Y4O0qICKDiX0PHkYWIDscidJdF/36I3tYhoURjwbgcW9WK7n3F5YuqO
 oSVSMsdjaKky4SCCzzoJS6NDjob8vuEr8ev8qotJowOJzUUILXqqg
X-Received: by 2002:a05:6214:1c0d:b0:779:5204:4916 with SMTP id
 6a1803df08f44-7991578ca2dmr53799736d6.19.1758307329641; 
 Fri, 19 Sep 2025 11:42:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/Tk/CHfkwfvHsGusufr2dlS6ih3vdDiyM2Ldlo0VTKbs973sYQp68Zd+i6oMsC0C4qDrZ3Q==
X-Received: by 2002:a05:6214:1c0d:b0:779:5204:4916 with SMTP id
 6a1803df08f44-7991578ca2dmr53799496d6.19.1758307329170; 
 Fri, 19 Sep 2025 11:42:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-578f06bf6b0sm1360169e87.74.2025.09.19.11.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 11:42:08 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:42:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
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
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 11/14] phy: qcom: qmp: Add DP v2 PHY register
 definitions
Message-ID: <bqgcuch65lczmc3asccgddt46h7ebcioyjs2pwsco6wivyjc6z@lehfge4cj3qk>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-11-eae6681f4002@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-11-eae6681f4002@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kqQZXpM_gXXY6WjOZZGn6N--0GMnohzt
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cda403 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=R7-NhU-lAAKmNGUam_4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: kqQZXpM_gXXY6WjOZZGn6N--0GMnohzt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX7mPp2HouJcA8
 eHdkFl9CmhQ+qds4nG/3ymxlMoikc1W+HWnvmtj97EFsWM5QLH1yU4R7IPmcsDF00t0jO2bi28U
 /rrwvyYMz6lV/FWCALZI9icfOR+HgH7xoRlKJKUCs9lbsrotVwOL0ibkhr49cCBGj125BAtVeXF
 3fIvQ7ELDUGCwfiQhznR0UbA/fDDBSepZ60e/mAZILOWqAwl6PPWhdrWIb8GPVrLx9Slyhe8Nh9
 JzzKLH6JZafUFXEsm2muIIEWgJumn0KSZUFMiPtjv/x11774uu1vlZRy8vRjs2LsLCFq1OT3RAP
 lX8dZoKb8flx3N7vzqlWW0yCbxfT1LZeCGnzTFtNj8r2E8mA08QRs2cHK0z0QUiZ6wYrkjmC3iw
 ryT+3fLR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
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

On Fri, Sep 19, 2025 at 10:24:28PM +0800, Xiangxu Yin wrote:
> Add dedicated headers for DP v2 PHY, including QSERDES COM and TX/RX
> register definitions.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h      |  21 ++++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h | 106 +++++++++++++++++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h    |  68 +++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   3 +
>  4 files changed, 198 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
