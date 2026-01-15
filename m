Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 119BED289EA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 22:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EF410E7CD;
	Thu, 15 Jan 2026 21:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFamVdnc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQe8asV+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B65910E7CD
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:06:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYFCb2174565
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1xvDJAqNi/XjSB0Ms1xbJnTiHcWmVJrN6o3B08nqtYU=; b=TFamVdncmcNm8ThG
 3v3aaGVFgrxTO7VopiZrStqVvwa8H4o4foFB7+MwTXnAl8A5GcWxEPw6B7KZyXdh
 T46EA5O1Vw3Lk2xz+LHzuCcSXzI5t43IF9M7QzZYVwOzqRTnsA6V/pB1eyNUu0Sz
 mXjpQfN/3bpXePjDZH77rBIVKzkJRmud6K7BbH+bByk/JvNB4iKdwZxFomNsCAi2
 6UAIIdnofd/95OMzoY5MyUrGE936IgUyZMAk3P0SDgc77S3xseSqdEsNLkeXMS/X
 DQ7BI/u4S2eyJfODa4Ykh0Yt7FVYC1LRzZAQSoNpgok57pr+4+eUeKQPNc67p5n2
 vyK+KQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq1xh97n3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:06:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c6a341ac9fso156020985a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 13:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511159; x=1769115959;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1xvDJAqNi/XjSB0Ms1xbJnTiHcWmVJrN6o3B08nqtYU=;
 b=YQe8asV+qC34+gxn73oL/F66eD5dey++Yfdbi3/hcgGgKW/FrVQ/d4Qp17/+7O/DkC
 qWxrvan75Z3sn20DMOwKWb8nAkig/oxrWN1GwKGJO72At4w3h2VDZaltLGgCWVGZZmY0
 yRAaBzV5uP+0/NOKpzSoinAuBGFf5BalV+mxXcQEAzdA2QKG114CDOioI47z6JU3gkN4
 zAfRzirAbylbvfptIeggZPPw0/wk+SK6Q9QkiIxgoY90DWzjXy9dW8FPQuAl1f2Dwq2c
 NBzRjvH1Eamnzz9IFiKRnUH56NQw+NT1kQJNaA8toTUkePklkxaODUFr9q1K4i8uG2pg
 dP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511159; x=1769115959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1xvDJAqNi/XjSB0Ms1xbJnTiHcWmVJrN6o3B08nqtYU=;
 b=aoT0HLqOFAysQwN3cDUISROo6v+SgRnTaDb23Rm+I8LLsygbSvSbfo+27BAuiUD/qf
 K6twhhvaz18sEnOsvsckUiGmJdhszF0OAXPxvXYzU2+Nda73BezEO1jr1lnLaLz1Cioi
 SRLz/JNLeNs1t3ayrASuuvc8FD6wGaThLGJy0np4unmXOJ49LoDvYhSxwGvOvBRFH9u9
 X1BPrSuOCuwaL9UAZC+K+biDJQMnckIXs2c44rGGF215Gqns0PHOngi8AVhdrirEfMxH
 uGo6hNIJfyon6eOte/ZzkpgA/G/BX4Nvza9xPVoeJTQdzx06quiqatLz3WMnF8ex8OIz
 jXFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjRtAz7ilu5SQhyr4keYwNFJqiAKPkLKPmXp7iXRmx8IDaWRd7DTH0EKJ+ZzADr4pTx/noebRGRRg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKLm5Hd0HiZkUYCsTdcZatS23gjS03qeLc6Z5MuVIIDbRs5+H3
 RnKQG1kA5BxaUkS0F0tc8V+8mJiUGPhksOcYsN6oDCJ4CgxMy9Ru3em57mAV+wsYvd5q36nys7t
 8e5gPkWB40WhAUKcb9O0QQ23GNFbK1J8BXQ9MUf/QVh4MQSoxrnLzd7ZV7i7H4f6flsOrxUk=
X-Gm-Gg: AY/fxX5b6JcMXtLyGLRv+qBUgxw4SEy8yCgizWek2p3sIa5UOXY2IRV8SF/dkANOeOi
 VxV03V8W8mQIouqY37Aey0Y8MP6w38x1/jy2FymmqhRmcm4jVcXkhYLE1SX+68aIR/P6qmyrIC0
 wZss6774N/N1nLoCsfhApHia9CND4g3JVBdMShgw2ZqYAGg3XjsRacykrYmzQzz57l2dRngnJuG
 Wy1XWuLB5S10B7F++5R5YTqkDSJMhnbXHLMK3tO8Yt/O4/l4gIejh5IR0Tseys6pBNHROoN9M+d
 bfNcAfxV15NuXq7/Tm118BrzUX/zcGF5wTiDzSoLfExPLEqDE0+NlFu90bhKyk1STkgkNDcs7uG
 n2TN40GgHaMov/j+eKnegytvhpvmk4+An0jUneQUV27b0rbwAWq5ReK6IlspzWpfQO43Ig6rnDs
 ZEofbQ089BCg7NxJ3ewy9myfo=
X-Received: by 2002:a05:620a:4088:b0:8bb:9f02:489e with SMTP id
 af79cd13be357-8c6a67a12b4mr109694885a.74.1768511159526; 
 Thu, 15 Jan 2026 13:05:59 -0800 (PST)
X-Received: by 2002:a05:620a:4088:b0:8bb:9f02:489e with SMTP id
 af79cd13be357-8c6a67a12b4mr109688885a.74.1768511159042; 
 Thu, 15 Jan 2026 13:05:59 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: sean@poorly.run, marijn.suijten@somainline.org, andersson@kernel.org,
 robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, Rob Clark <robin.clark@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/5] Add DSI display support for QCS8300 target
Date: Thu, 15 Jan 2026 23:05:55 +0200
Message-ID: <176851111172.3933955.12274071236835720436.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260104134442.732876-1-quic_amakhija@quicinc.com>
References: <20260104134442.732876-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lOtN5bqfeO8SCIzKIHnGERClAub9861J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX/O4gB0z8QB26
 WVRp/Q1g1fJ3fwypNUH89Z+NkIVw4Vwu1dkCu52uaCd4l9CJm0XdmkRr14uWEkIBN1kl+iKijVv
 QMe6Z0tVaoy8s/hHQbX3u17ekLK+CtSLWbruWOdNr6exwUE0iFxkA+bbX7rLGJlTVSJt65VDJfw
 HJRrEe1Uy9PvJ5p6IASCKzZSLe/xyPo3a2YEafniNA4B3h4Qp398+EZtS12obHnTIVdm82zt8zI
 cqnLRSDC6l4sMiHVW72x0wG3UwWP7zflmpeSi5QGOGLEcANaRZMxMhKc3K/R8gt9Uncd8Adwnzn
 PXZhvjwTcgQp/wFF6pUbZJgtjDurCEu9HZI5RDH+QlAsq5h2iUTG0cXzHmW4y65vUmMzteJ2bjw
 0uWQEY9JWTvWdMlv6Wn24ShmE/Q11jGgX5KyZ7n8U/6fc7mtVFmTZmlkAtJERzp2Jkyy39Gd7ZQ
 35Kuvz+0b7L8fWI4/yg==
X-Authority-Analysis: v=2.4 cv=TdWbdBQh c=1 sm=1 tr=0 ts=696956b8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=s_x85DquI-FxRm-hfV4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: lOtN5bqfeO8SCIzKIHnGERClAub9861J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
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

On Sun, 04 Jan 2026 19:14:37 +0530, Ayushi Makhija wrote:
> This series enables the support for DSI to DP bridge port
> (labeled as DSI0) of the Qualcomm's QCS8300 Ride platform.
> 
> QCS8300 SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> 

Applied to msm-next, thanks!

[1/5] dt-bindings: display: msm-dsi-phy-7nm: document the QCS8300 DSI PHY
      https://gitlab.freedesktop.org/lumag/msm/-/commit/969c948d1392
[2/5] dt-bindings: msm: dsi-controller-main: document the QCS8300 DSI CTRL
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c42973f92974
[3/5] dt-bindings: display: msm: document DSI controller and phy on QCS8300
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f5aa414e5c78

Best regards,
-- 
With best wishes
Dmitry


