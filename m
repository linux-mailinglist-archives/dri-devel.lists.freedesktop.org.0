Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0569EBA1B40
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 23:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5995810E9B9;
	Thu, 25 Sep 2025 21:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SpaBbqkK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE60910E9B9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:55:56 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIUbdh005116
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=a4ka2QLj2dY6T1dJyHEA3YJ/
 IzOlBv0wCYfphXRfYzY=; b=SpaBbqkKOy16rASA7DbdkbFw3KD6rcnU0gSxUHUF
 lY/Q8ztIO9imzJT/UI0c7DxYFgUtMxMUa3zjSpivmlL/bSpUZECRbouC6DOA4NL/
 de9raH2ZzvwUBijW9Ss3lHS62mUtu3g7pCsSoJV8Wu1yAcbaJL0/iO6Nbqm6Z5n0
 FG/11qrHgE7sDjnLZTCqlO3l8ZHirCqwPtyBbV29wHC04gOPtLhxm0dj3iYDF7VX
 J3dmjhvAtjxDFwrW/bnSIvYq3AHKvwBrOj3kpzPK5vJ2jhNCa+0QCMyJrHXQH8yf
 4XV1I1a9AUnBQdh+P+TAfH3jkoUyuifYye5PtG2iHJCuyA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db320fv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:55:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4d602229d20so26782931cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 14:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758837355; x=1759442155;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a4ka2QLj2dY6T1dJyHEA3YJ/IzOlBv0wCYfphXRfYzY=;
 b=smXN7FRpAFT7qe+hFv8IOHHw2ZmE4OBAO4x5i9Lqlf205OhibRY3qsaD1HXbr8pbu/
 VcU78JHUBO1uHpT8WI2349MUm+4S7Zc77AT8V6RM7e/UsrLk3xPIBoFNxr9ZWZudePDj
 k8zM0m03enRx1dhDbNzSHhUFOnBQKul5jjM8eGkjDl1PbsBEUhTV8rn4qiljQonZ1s2k
 LzI87oPiHYOElxhzGOL7IkzgtsyTCz/yipqgeha6iB/0hvNUT052MmcDpJorS4sEvfkl
 C4/VcdxZfwLDqxmHOpjrwxFdOiTp9+SbjrX1j4g3EKk117JFr6WiRvXz9yWW9jeESnaZ
 LmvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc+M+HE70K+cK/NL0bT3mW9eWyGUDXkXskSd6BeVW9g3k3xG/tc+123ivUHhgjkIq9aRTMlcEb6QI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5L0Tkg1w2TO5xJ7WF/D2ohjS7PPaDHe7/gC6WeXoWP6XiZQkV
 wJw2ILTbdtlpDM7OD4TiTGAmC7EZQiT2LJo1Swgok2d+E40s69jaEM4zrP40aULIHreWIfJBnV/
 7qsDjtk6wEFVMtegIAMnul+CvQyXhZfEIuSGZ09Bj7/6UkWHCzlXImtWIAZxM1fQmNIrT7Es=
X-Gm-Gg: ASbGncsHYvQUDxRxw/zR1qlq40NDhziW9MwuYhAGInZHKp/kcyKr6XZYIblFs2h5/KN
 lZsiNS1tIOTDSFM87P4uGSzOI6+C0v6+CmzuznIsHNxsrYAgirNlsd7P1ahghNL+SHvPZP1g+Tt
 nawGJOzu+590s91VHWDpqfUnb5SdmcBUvjogfrMByWUvr0w8ib1DNp7Sh6hKMncubdsJoXrzPXt
 eGf3AdN91us8xnjp5Ur637K1SPbY8kOqwinW9jHtnuRCqSXtwb4STyykQV0hiwSrkAciMq5W/ck
 AwC17b/wA6D+ir37gC4dqrEe1GKr2z3iUQX6yrXiXCUf2FoMLgYY3UlaT6PHX1R3tdlKzSANfeu
 zod5aQBIgrMlRzo881wx7aRaANTHspe1o5PedyIXclzi9Evukb+tP
X-Received: by 2002:a05:622a:7717:b0:4dd:7572:2165 with SMTP id
 d75a77b69052e-4dd757228f7mr2467971cf.35.1758837355048; 
 Thu, 25 Sep 2025 14:55:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYntiu6xF3k5Ru1LTdNfPxLb5elSDEpGFN8h/DlxytsTv6aBQLG8p6laJbBjAkaRxRB3PDog==
X-Received: by 2002:a05:622a:7717:b0:4dd:7572:2165 with SMTP id
 d75a77b69052e-4dd757228f7mr2467661cf.35.1758837354550; 
 Thu, 25 Sep 2025 14:55:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5831665624esm1154346e87.69.2025.09.25.14.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 14:55:52 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:55:50 +0300
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
Subject: Re: [PATCH v6 10/14] phy: qcom: qmp-usbc: Add USB/DP exclude handling
Message-ID: <af7y4m6pcaeavwyxmswkjwugya3na4r5uaq2hi7cevt4bu4573@3zzfjxpc6t62>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
 <20250925-add-displayport-support-for-qcs615-platform-v6-10-419fe5963819@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-10-419fe5963819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ao6/yCZV c=1 sm=1 tr=0 ts=68d5ba6c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7a1U2GcbA96CJLvzQ6EA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: UwG2EJArX_LQCRxkibJlJ6NkApxGYqSB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfXyRgNyw2GoPMJ
 0N2MHSW5OQK+jwqy34atrMPW1Ljhy7W79XoFQJH+iDbBey+fqhK1Wmlm0d2vSNCxVP0JAAn5Si+
 DgRKLuEV4twiHkgBWe03WVMYP9+9ARBi9nI3oyNhyetAwDMHaJ0XJnkpyHYkPjEK/0ijC1LELYl
 fnTC21jf0dWSphKEEdh8E43PtxajxZSBUmHWXIFSB29nMHu4GlTyYDQcNRCmznDwFPXXxQo4G1q
 FZao3SVdPxTJZaq+/D8uUvr4/puh+oPTs56+EgLMUjoNIebmrn7kUY7N5f0XgGkMSqAM9ruIYjb
 jjREKnGZ3WRN7m/XMBWJNYlqcch197DDkr69iVJtp+4Nji9Au42Z/x7t0QO1GWpqixTeeODDzyQ
 qu25Tph6UDhmS+L1w0Um3D4vedY0uQ==
X-Proofpoint-GUID: UwG2EJArX_LQCRxkibJlJ6NkApxGYqSB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172
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

On Thu, Sep 25, 2025 at 03:04:56PM +0800, Xiangxu Yin wrote:
> When both USB and DP PHY modes are enabled simultaneously on the same
> QMP USBC PHY, it can lead to hardware misconfiguration and undefined
> behavior. This happens because the PHY resources are not designed to
> operate in both modes at the same time.
> 
> To prevent this, introduce a mutual exclusion check between USB and DP
> PHY modes.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
