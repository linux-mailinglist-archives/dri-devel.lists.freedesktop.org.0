Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6445ED289FD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 22:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7909D10E7C0;
	Thu, 15 Jan 2026 21:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pihlr5hR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhHv+Z+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A2810E7CC
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:59 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYGUQ3113503
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i/SNuK0OyUKQkfb9yXj9vuwgdkG5/x1BB9qp3E/bVDE=; b=pihlr5hRNDMlH5Eo
 HDO4aQ9hlDtN7ejwdyrQ7/7aRLPYDdTqkDXA5N1fcEBNCfZr641KSZRgcJW+VLQJ
 ycPuC7fHqqSV1G6C5zN3krTtYrr7SzrhSSV5cb3yERut1d7FvaUsVquJW8jQY60W
 9XOA6lJKHnSz5N6GjnmzTXrRRJugsqRUEYjTbiF48X1HWlpasMBMLLx6I+asSv/S
 GG3siMQ58K8JMg0VJ5o+XDLwGitJZhVtk78IAb4z2Zv7lBVmlzOmB8WbxI2Ep6eQ
 qrZ6C4V+F9BZ6Z2lzCWAn3y4ky4YmOVSea++Cb144CWdjQzso7/RidLkJ/yUOrnX
 93XtWw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq2pm11vc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c52af6855fso193413785a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 13:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511158; x=1769115958;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/SNuK0OyUKQkfb9yXj9vuwgdkG5/x1BB9qp3E/bVDE=;
 b=BhHv+Z+aH2S7lKvnJorM84G/UnQR92rUiMygLADyiVCMgNGPQW+V12Fxu1f1yL1z2/
 yIzYQ63BQfL81PfK2Ikt45S5UwmmIEY54TfqsTypBpJj1KdBC/a2eKuq/YTkrpUnkHAo
 JRV1HC8t7x9Q8gg6pVddAWGqwHa/BOl1BUUIeK0Kkp9YSkU9152oQmRJUqERmgkpAxds
 hqvrxSAhsASpntwMmErU6RCs3ZmyN0JI8bm1cDJWWCKUc0SRTGbT2Qb9BuKhTNYEdEHY
 oPDpLpFHE+d9VdRjeNr6qyNBDLyb2P2ySDRxAbj/oVEXyxNSZLDnPo51oipsFif+dL5h
 O7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511158; x=1769115958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i/SNuK0OyUKQkfb9yXj9vuwgdkG5/x1BB9qp3E/bVDE=;
 b=gE5ZO5u5YQ1ImiOYGUaAYEw1O0zoJoWL9BwwfAomtIqVhEMGexBKPvD6nmLvRyuLFB
 vYqAAK8npihUTe1oQ5ujoDWpRnm/lefncbZr2LK9ox2atGm7l7xRUi9ZcFlzw39lpTD/
 AjtE7nvu6g9CBXt764i6nTubAz2nO5R/kq3/qDM9YRVweJhAuBkJUKsdO83NOgFEMN6Q
 UT9OoVlJ7mWDSnzyS3wgwjxWkNmlKfymGeLy44zwj3QqnBip+zymhfHH+N+LvdiqWSey
 btTx9QXncvN0ruB+IK+uvEMApbfgAg7x9t66OR0Y27L6CB8imHUN9PNg/CsmlKRyxrJf
 TahQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIFtdNB2oHq+Ez4LkzWhN/ttSoDMsBWpvTip7kQBhBPVB2p1nNe1YaDPFJfN0WcJanPPs8etC0Qnc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwryZSHSaaKX7pIWE16KlbXomr59pCDWmw1WDTJYnvV3CaH9V6n
 0UJg7BQ9e1kSQ2djYyAJzeUNnFJRgny2cp8zpdGzci3zIWK/LW3EGVue/0L6aFk1DFaJieVCdqI
 hgnalMmD5PzTltjPQLM1pJbZXwBzPUN3iaCOLZTh4+UhgmvelmKUtQHqnxA1iSieAjmsR+H0=
X-Gm-Gg: AY/fxX4qhZ+fX+x2J+ZedraZIdHzb4mmQrCdaE66FVefIiAPl7SxFCIgrL0mFraVeN+
 b1k+O2JiISsHzlx6a1k3U0ADaBwUDzxcJynDofpWUBOUN9nV4X6RCbqOK+9WfJT7hS+4JUpZeWn
 ULrm9aJNSqVV0MAq5DW1r/ak0t0O57yfYhrGqCp4Y5ROWtHXLuqSwGrRIuKSn066Ued8Lgn5xGW
 +YPhKZMyseTwHU+Iuleasp+anK4sqGFgupucC/ZGkPow65UKQjv6nNNo3UzslZ0x/ZB9pJsn9c0
 2WdzfGmKNVzAkSC7nsvqnwY/FeZYdNyjN/x3AlC2YGmKIVPHzF62kLOIZN2ibCcTwu4XirnikAo
 7Aggem91LTpGCrmZBJSprmArQ03C7efuOPs7o6MrCbiO7YFnzuPFZWGBDMM9sEozB8MgVkF3t7+
 HXakaBC/+TuoPReN7Gyka3EpA=
X-Received: by 2002:a05:620a:2a05:b0:8a2:7cda:f040 with SMTP id
 af79cd13be357-8c6a678a36amr148004785a.51.1768511157280; 
 Thu, 15 Jan 2026 13:05:57 -0800 (PST)
X-Received: by 2002:a05:620a:2a05:b0:8a2:7cda:f040 with SMTP id
 af79cd13be357-8c6a678a36amr147997485a.51.1768511156597; 
 Thu, 15 Jan 2026 13:05:56 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Teguh Sobirin <teguh@sobir.in>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] drm/msm/dpu: fix vsync source programming on DPU
 >= 8.0
Date: Thu, 15 Jan 2026 23:05:53 +0200
Message-ID: <176851111169.3933955.9170507722560093643.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230-intf-fix-wd-v6-0-98203d150611@oss.qualcomm.com>
References: <20251230-intf-fix-wd-v6-0-98203d150611@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fQOja_StsrMgvuF8V7sa3lFBbdJMA4Xt
X-Authority-Analysis: v=2.4 cv=TNlIilla c=1 sm=1 tr=0 ts=696956b7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=tuvf9S6D2CPeCQ265SEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: fQOja_StsrMgvuF8V7sa3lFBbdJMA4Xt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX7Weopx919Wl2
 ONEGKLaGX8MS7wIvFTYd5f6i3QPKEPugbo6c8PuGnkfoJz6PnRe3kKJKXu+RctJKIlh8pm4aZHg
 rv+rfauuc1DlOj09jAKTiRC6oUZrQLby0YCC2SPfsnKdVOBbtYdgpeuxSkvGeeFR3mOYBKE9IX2
 FnakNsAGYWh/sWgbOd2ox7lEyTOWA3M/KZ+3EWvKaDY8kvkC4mFfVzSfdBFv67KDDdqy7XwzRRP
 Pt2A0ww1sp0bezpI2ck8aByfkRdj/vQqyrQSUwCAgflm4OGK7NuiQlh/WN9UL+OO7hUcfTJwy1D
 HIkbXg/GX+so429kNAsGle+Xpzggt+TJqkZ+9kEjxHoIKuwHsFtMWZSJhuNYYLK70oOuArxY1vs
 rpicsD47Gf2tSIoxQ8eiX80aXZh4hhhJa8O+HwyOImLEuO/5jeqAVwFMHGPz/zjXgBl2kk0Xk9J
 yQuW/K2/3c6gdDCeXhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165
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

On Tue, 30 Dec 2025 09:17:55 +0200, Dmitry Baryshkov wrote:
> Currently VSYNC SEL programming is performed only if there is a
> corresponding callback at the top block. However, DPU >= 8.0 don't have
> that callback, making the driver skip all vsync programming. Make the
> driver always check both TOP and INTF callbacks.
> 
> 

Applied to msm-next, thanks!

[1/2] drm/msm/dpu: Set vsync source irrespective of mdp top support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1ad9880f059c
[2/2] drm/msm/dpu: fix WD timer handling on DPU 8.x
      https://gitlab.freedesktop.org/lumag/msm/-/commit/794b0e68caba

Best regards,
-- 
With best wishes
Dmitry


