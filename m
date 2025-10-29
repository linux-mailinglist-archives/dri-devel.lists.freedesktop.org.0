Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8EAC19349
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E3510E779;
	Wed, 29 Oct 2025 08:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pm4Jitwx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E3NywDRF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2C710E76F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:52:32 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59T4v4kL3755383
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PqVjiwHHM6HMBkqOPTdcX/9mwjZ2lFutTM2OIer6Fqg=; b=pm4Jitwxgmbfq5Yk
 AasOjN7q/v2x+NXM69VAfxotSlzOJ3yPVR3gMAh/qwfwVS4ONfe+XFPkobkocvBL
 wa2sssWwW/XSozkqOKE0n0BYdvQ5FfFEHFddKkG6FX8O1ZNebjghUqNIiyp9VGBC
 FqFoh/U0LPvJH1sVd59EctQ1PlDjjsFXlF6lMbdXadktEDb1l+2JLCe98UYl/k9h
 LV7i4HhlFVuCVE+1vEqBILYqd1olR4sq6JzI9fMPnmypikSMSffrkrQ1HBrig1Cv
 eSh4fPnszeyGdrOG6n0kqKdCUyckTVgnufhniuORGJ4hCtCmWtwLB4L5nPtK9q49
 f3EgSw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a0hv0v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:52:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ecfa212e61so23052701cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 01:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761727951; x=1762332751;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PqVjiwHHM6HMBkqOPTdcX/9mwjZ2lFutTM2OIer6Fqg=;
 b=E3NywDRFrXPfoGVoqnwut3fhdvmXBM/7Bo4wsIW6K8okD6Tt1PatpNY6RgAdrifpb6
 54XSz/VZk/3sWzVLm615pK/DT3j1fBvFPGSaYQ/69xeYxnz2A4VPnkFljF68NsU0ZkHA
 ZQFyxvKSJwfwDVjlFyiHli0w+9V5eHuKOxzYkwzDNQAZ1GPcyoeiBsuQDhMqsGIuQa96
 BGxH7DZZDwKR+KsfTFMNc6dfJAfo5W9T2B5YhONM1zrBJFmUULl0aEOKi949Wi/nJgu5
 xcOxxXB4IbM6J5GveOgAzDyICE9zB+WpnkdBcuQMZNoPY4k18bN46bEbziZfC5cRV5+f
 OQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761727951; x=1762332751;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PqVjiwHHM6HMBkqOPTdcX/9mwjZ2lFutTM2OIer6Fqg=;
 b=ZZftzDWFWNsDL0yXP21SUp1VE5tG8CW5fDlxbUw+cAK0M7digtJq77LZgVW0b5Is78
 GPvWhgVEObmizObTJnL4+RigNHMdD+iazpJ0nOH/H7//CNrwx9krfKXCQaIGFTa5n9ZN
 XpuXkuU8KK/MHBaeWyPdl/t7NZvyNdfD3K7HUQn+nOSN1xMhQxexc/Xtq7g3eXIeKteC
 pgQ0MAvB6Ans+gCx32kvj/66b+NnDlEs/oR1ROoAdS9Q4VLTSMWphGScQeT/1jzlIy45
 NjQhq8asq8yZnOMI53gDfqaX77hfIKzaPQiH+VBGfrk0tze2keBcDiFAEPhZiL1i9esh
 L84Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYT61yYNLkepdJj/aK+1AysFeyFEvStFRyslpIbSKdEY/Ql2XDYbr6X4XHQQIBmKMGOMn0B9d0Gpk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+giCHiR0aRjbsbfsPJu1lrdM8P2bUoFjwgN+ZYcrgoa0FxW4O
 YW22/BULbC9ahkGySIEWQITphGJTX4QPpb5T2kW0jk6+W7SZQm6O+86GH+FhKbVYrAemzbTQOYz
 t/smMNp2Q3jLnUQATibGIotiVahLUmaWjYIeavI4SzE/5ChwgeRe0yZATkrXRZBnfvy6PxPQ=
X-Gm-Gg: ASbGncvCgybcjjT7BCVcIQdYZoj8gf4X22vdMafqyNp0OHiYDsFFgBA8snP5YETLTi1
 Hp1z+0MSFjBZW34brllg1vTE+VZeERLuN0eQns5D5q00OEJWPDJCB9qUhoB9q03V9mbU5Mis6N9
 WAbEwRpW8xZAKy+D1EyzFrK436XqqnnVfeJzpZmZsMTuv+krwZe5RG/WJEcju0SzkkV4WRm4xAJ
 DDpI8lIev9exKnSnC+PvJVs+3TzfjZspYEr5MdM6nldrrLk5Lg3fRYQ9HdrZpbr4sr8kXBNwF0K
 l2/o2+AzF605LUbTOf3ptFEFw5GNpM8WwSRSynWHucjUrlqSvA5hLyh9b+PMrZw5vYQIFIEazZ1
 KMICJhXu6tyH2DwHRtUIQDvY=
X-Received: by 2002:a05:622a:1191:b0:4e7:24df:920f with SMTP id
 d75a77b69052e-4ed15a6ab64mr21703231cf.27.1761727951021; 
 Wed, 29 Oct 2025 01:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOvmSdC4HmFMkbpQe3HllOymugFZ7rqxM8+XOIFsKpoDo9fMiPWIgDHanhaRSDOhK6KmtM4g==
X-Received: by 2002:a05:622a:1191:b0:4e7:24df:920f with SMTP id
 d75a77b69052e-4ed15a6ab64mr21702871cf.27.1761727950466; 
 Wed, 29 Oct 2025 01:52:30 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ed0817602dsm36760171cf.18.2025.10.29.01.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 01:52:30 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:51:38 +0800
Subject: [PATCH v13 5/5] drm/msm: mdss: Add QCS8300 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qcs8300_mdss-v13-5-e8c8c4f82da2@oss.qualcomm.com>
References: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
In-Reply-To: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761727898; l=988;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=f/HHi/48hqff50ItUhEpqZ+zfupVghiSAFK6cNZOm8A=;
 b=lXTiSppnVE0dqE0qrye4mItP4ncDSpxVMjr9mzUdFBaJRn4RRa6nlFtZAt7flu3pDhV3mLlIC
 GN4wyHDVhcaBZ/+BRwAn+FIKgQypRdAFQgzGBpZhYNA20nxPT5XkuoF
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=HvZ72kTS c=1 sm=1 tr=0 ts=6901d5cf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=w6jnlB3v2fMHmChJ9ZgA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 3y5Hhmq7A2eLkyACBWh4MqLA15vrFByp
X-Proofpoint-ORIG-GUID: 3y5Hhmq7A2eLkyACBWh4MqLA15vrFByp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2NSBTYWx0ZWRfX+Y3laaZAzMYQ
 7cK91L/t6Dwv0/59BCQ38BIWr6SIcgKPOjW++Q5+3B61yOF7ADgU6kxrz8chRre3v3i8qo+ybHn
 FOSRV7uuOO87Zc5jd3pAfD5PyKgF/FMvirdJzlgmXDreoE+m/KhS1mHCSOETeyqvVuLy71ahhwN
 7CnsAPu94gIHgCRLYqi66zs+S92BHk4puu5O9xWM3cgZlFUj4ZaypqmJcXhzR4D/tTV9MtsTgvM
 AAF5cJmlu4/4B4uJyAFOXpgTBvbBEdKo1s559tJQ8DMtUV18UiA0SYLqLi2EJEKK7Wgu+MMeKu/
 cmnPMjYeEwITZ+duDglhSv/87Xveg1NCZiqLejsKp05srmdN/FZgSbBnSdo3DiOmrRf/aXRlPA0
 JSbNKjFpoAIlvucRaElL6jhonjHiAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290065
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

Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c04..db2f0064eb72 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -555,6 +555,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },

-- 
2.43.0

