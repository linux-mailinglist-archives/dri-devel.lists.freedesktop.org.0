Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1147570CE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 02:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFE010E09D;
	Tue, 18 Jul 2023 00:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40F810E011;
 Tue, 18 Jul 2023 00:15:37 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36HNfT6q001264; Tue, 18 Jul 2023 00:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=twhIV5rMJdV7LpUzKB05ClxfnLx4U+o8KI49PAs/Nyc=;
 b=P6fXDR8t1vxmndKivKv38AM+0RWgWTTE1S92XtArJJY5gwZVa7ekdgZZ/KQPumrA6n7j
 aDSn8NupClFDykgJkU2JRdW1L+SzBJzsbq+FYpTlIXIli4BCAIe0xmAXYzd6j2rC5ofd
 uZ04o31PWUISLud09Z5tLFJSB+NLlUDwXsMZ0lDcQVFkvT/V0mRp948y16VgejDEC5KT
 pScEKCtJ8QlQKZqoCftzw2ZKYkvd3Cgtzt5wAgAHe9Oobc15YHIvqvuL+yEQFl/alYpg
 s6yxBWsZgi26svucHzvv/nGjzi6QYNxeZ2uCT0q9Zi0WBNAWdBISFmhCp81G6nRZlug0 HA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rweag04mp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jul 2023 00:15:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36I0FTm8012401
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jul 2023 00:15:29 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 17 Jul 2023 17:15:28 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v3 00/11] drm/msm/dpu: cleanup dpu_core_perf
 module
Date: Mon, 17 Jul 2023 17:15:15 -0700
Message-ID: <168963917980.18060.14592621440645488520.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
References: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: D5ofZYYcPva8raKu6XH9yeZ-Y0MIomk6
X-Proofpoint-GUID: D5ofZYYcPva8raKu6XH9yeZ-Y0MIomk6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=907
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307180000
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 07 Jul 2023 22:39:31 +0300, Dmitry Baryshkov wrote:
> Apply several cleanups to the DPU's core_perf module.
> 
> Changes since v2:
> - Dropped perf tuning patches for now (Abhinav)
> - Restored kms variable assignment in dpu_core_perf_crtc_release_bw
>   (LKP)
> - Fixed description for the last patch (Abhinav)
> 
> [...]

Applied, thanks!

[01/11] drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
        https://gitlab.freedesktop.org/drm/msm/-/commit/e8383f5cf1b3

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
