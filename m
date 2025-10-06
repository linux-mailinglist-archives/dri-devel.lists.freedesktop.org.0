Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B634ABBDA2A
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 12:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A859310E3E2;
	Mon,  6 Oct 2025 10:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvzBBO7T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E0810E3E2
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 10:12:37 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595Lv5Ys011725
 for <dri-devel@lists.freedesktop.org>; Mon, 6 Oct 2025 10:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9DjbUCmcg5sdBYa+VdHMlxmG
 F69VZ4TGKs8z0vOln+c=; b=LvzBBO7Tq6twkF4N9J/m+/YuUV4rwSzLlYC/Ifla
 9RZ4gWdS6Kg+7bQar5P2YZmvUZgOzJE82hLZi0lVm5i6oM76F2LamB+hvpcgazMp
 E5GA1m/kZEVrdKXlQC1naEH7QLGgNCvvmfkMthYsMh9wVmdm5IKB0KMuqCq44HcM
 FJctnQqcBCbrgCTjD77fd5C3SctiSipcXD2jly3UBsea0OpYS/0RAkJ0TqgVDk/9
 iYEY/eZFWZfXtOiTp1de9j7E/TOtlc53XbdadMLJ6S8iP8VlLfIiYrpDKeD3zduT
 ZbXovSucBY2cWrjowhyY5g96rXsgFSJyVwlmJSSj9Ra4rQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgkmkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 10:12:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e1015c48c8so107862761cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 03:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759745556; x=1760350356;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9DjbUCmcg5sdBYa+VdHMlxmGF69VZ4TGKs8z0vOln+c=;
 b=Hl8mTYMiML7SxQHqzBp/fWB2U3Rgg3nqGJabYG+85e2PcutP37lPx6fC7UUhln7xV2
 HUhW/k5wZJQxbzVv88K1fSBeyhsoimLPWZPI+nw8c8yprAmwH2Du9bTzOOWv0AJNdLh+
 qDixaQ5ZtL0oZCCW6pZYg7PYy4r0WjwdzTk1JrA/IBaxH2EjJ05yPuWjRHGfQ1cWMq0Y
 Jyo8jgN6AiCgjUtfMY8+OJvjJ2CkiJi/Z+RXknUJuDNuAshYoCL9SvutG8CAeaiancud
 Azk/cAWwEoWkl2A8M/g433eGowR26esmo1CWGj7Z4IY0ebHoZK2FYRUjZHYfOTb0sP1X
 xpig==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5rPSwiBpWVZwV+CPhRwzIMtV/uYLQqxjkdN9CH3mZuP2LrHMNlC1J3kAMABKKDRLRmByUF5rjjm4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yynp3pPRoU1sk5mpfm2EbtnGOM32fNgxnTWXP9NyFYQErdtF7A8
 1Op1+P4O/3dJzUm7uR4ohSv0Gmu2sOnTxazAT7TiidF8/Mwpt8discOaXtMrwR9H9eHciU/wqVB
 gpBDHTR8VhWyLlSnZ/jrs7PqWprZZ5KF7ZD4ZXtNFHSz1VYjaGpig4vontehXKoyVksonR3A=
X-Gm-Gg: ASbGncvb8VyIn5SlzGqZlnaSw7dRug04djesS2Xf6+CItLMYgPUj5x73efi6U2IPKy5
 hv86CP4ZWQEBbQzRsz/Ojr+7qUTPNyaa9oW6hEMsn6j2io6f9chwyrzUmbEMSBYOyOOsbXMZMN6
 xrpWQP2S1dqSrUAIh+XuT06P0BpZsr7Yt3tgTc9AAKaIQcX0UTqPdobNey4TYwqmmhSNE3U9ySE
 msBnx4bPg/GN4f7ffBeebfvynb8ETCmnVCyPQZcKGFHAQdxheYyhtntkVpLgEIxPlPz16fPd0wo
 2o2gV7V88zW5srkdkmMqhWQyL03WD22pCC61LFhQP3MI0mgW0icLjLmKvLlgp2z6HGn1L+TcGEP
 Ieg8rEa1z+CglwWbGREwnU79seQjIKmTBbKfl2lpZW0T8Kp/3TTf7nlMGxQ==
X-Received: by 2002:a05:622a:130e:b0:4b5:d6db:eea1 with SMTP id
 d75a77b69052e-4e563c5da0fmr209850471cf.39.1759745556279; 
 Mon, 06 Oct 2025 03:12:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVYsEsv3GQHoe9XDvDjqIIC4TE7FK2OBx7RMlbBeqiTU7xwK2kdO72i5DVh/m7khG5Kv9KDw==
X-Received: by 2002:a05:622a:130e:b0:4b5:d6db:eea1 with SMTP id
 d75a77b69052e-4e563c5da0fmr209850151cf.39.1759745555626; 
 Mon, 06 Oct 2025 03:12:35 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-373ba44441dsm42561471fa.37.2025.10.06.03.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 03:12:34 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:12:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 4/7] drm/msm/dsi: add DSI PHY configuration on QCS8300
Message-ID: <knlsejrmxfzgb7qdy5hpiawuxfg6b5hltjpweope2hl3dm6liy@y5yop35p5afe>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-5-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006013924.1114833-5-quic_amakhija@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfXxkLUemxaQCGm
 u6pDub5U6wHg0/jaSrLQJvjOW6UL5kuRxvCRKClUmNFtj4uuvCWJdH5UGDt7LxmS6Gcb55sdfYw
 4R4C4webzj3+e5tNGQPiKKoBRz0+BFS+HuiFzHf9P7arGQH9jIro9kdqbkAllStJ7X1BQtTrMW8
 YIh9gmDuG49qxRcPVWdYovR79Tt4PGDmysL2blaBCZUWXWNm6JlL51RPxiQRtnV79oIjHyVJR32
 T4x6AXO31t18kvK+MFRwTckP/yxsojx2Fs8Ed59CndbM1t2uoIRMDVW6HqqergmUnEBBi9gEOWF
 KIQiDl88qc9Sim3qB844pF7FrxGkmfGQoLRVc7BJAxwEw96Oy1Dwtjw7uFGeDz9zMpHkXeNhxvN
 pG5eHKzz8hH+V08kSngVHfwvrRIY7g==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e39615 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=tMqVXGxUZ0RuQ0S_Ei8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uH9iDAeR7_6rY5cIc19GPioDjaIbUecy
X-Proofpoint-ORIG-GUID: uH9iDAeR7_6rY5cIc19GPioDjaIbUecy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019
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

On Mon, Oct 06, 2025 at 07:09:21AM +0530, Ayushi Makhija wrote:
> The QCS8300 SoC uses the 5nm (v4.2) DSI PHY driver.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
>  3 files changed, 26 insertions(+)
> 

The whole point of having the compat fallbacks is to remove the need to
modify the driver. Please review how platform bus handles binding to OF
devices.

-- 
With best wishes
Dmitry
