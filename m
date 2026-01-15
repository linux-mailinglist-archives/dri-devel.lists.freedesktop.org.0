Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E0AD289C1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 22:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA9310E204;
	Thu, 15 Jan 2026 21:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcyP4ZgH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YlbjJF0h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6E510E204
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:52 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYAId1722641
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=; b=LcyP4ZgHar0lfCNc
 erfRehhLm+Jly3LD5YZe+gnbNWLMPpKpCHqXWqbxOusksc+bO9tXicyW7jh//NJi
 usIGfOEjO9AEv9gpfGj/98YCcHfrTukl/zYmQLydJsdQKttHrSPAJdyOP2ZwhZgo
 JBQMEwdzMGLiVdBk1W/SXyZVvNdc5NRZT+FM7qpEx7/7NvdPOy5frXysA8s0gU8J
 ZqNYay2ewVXzcLHlbBz3ecFwu6edWv5ajyjydAsDG19/Yj+LuCA7AN0opCmt5loq
 k4QJeBZL720AEGIBMtghVzSNUa8Qz2OgpGPhh0XGju56X61amGvdnRG64wNypL3C
 6E2Taw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptna2fkx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c52f07fbd0so603666285a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 13:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511151; x=1769115951;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=;
 b=YlbjJF0hDygUkW0QjjDZxAr3dsCfJsq7QtH4pWYx6dWIa8rhN6Q2ICAfAXWaALD9kn
 7CZPAKnmGs58vW2b3QHr14rD+wYitDaiQIWJIlE9k3hv/Fq4S9vSmPtBO3atv0zg1RjD
 xTySKhd7qNgxhke1Z09iyNoGRKeplTKzQyWNDYczHMftqaSYwKe5Pv2wqfh6xVjMsLeA
 h+2OKdlg3/DPOLQ+/XCPn0jWG9SDWh73k0WyigYNoUN1TUvxSOkDLny//VRNvuLcf0jc
 b/vtoyF5SIE9SFrGhPjebnylhlAzwS1q7N1wNb29LyMu/h2YHRk8yjccgEtuSHsGVtyR
 Ntvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511151; x=1769115951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=;
 b=vqJYrOKokonN1V61rVstwTnw0xLRBRV8TkdK5HC9nI2H4IxtGAQMk9DXNoMNHWO3IM
 W3oOdBHm8du2PfI2/G+qfxXKxndj2X0UO7levQKVawukC5TUn7ukj2WMhiaZ8ar4c79c
 nQ51WS406YDfjJXDG8Q973aFFoykOXFNfTU03A+M6IEgnCbdD9DO0aib+ycA+lzp9MoI
 ky0SrHCQsx3Z0xloO+sATZrJgy/J26VNdtW8lKQib6iejhXz8wYzxCK0A092eLQSNQfo
 DuW2UnZouyipd0zLosOfD4Vn67uLDkQaLNcDG0xv3H1zPMIzcCNE+KUv/uavqYF1WeU4
 hJAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwLab94fez6NgxL5DHeQhGAoHwH7vIQn2tMn53H/zKceJ03Cxw6ENdZJFpmyOuwLnQqWar/yZKQZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+VRVt4RZfxlDzPQQPwxTIZi0OSC7v+R/QR1Z/M4fS+xetS88y
 8U+t66SlX5nUIkI068VZxXWo5SfT6CiIbMvdwmnRPLPltK45T2umVaCcD70dOJ42hO7xfXGcnfv
 DKeCQRJ4KcnwJ3VrseD7iKqFBBu8TJ3p8F0InbSJAt1N0FaftuR39hqh2EB/lFnPUtm4D5pc=
X-Gm-Gg: AY/fxX7wZG9UzwIE2mnnzzRJqBiL/QpEkIsajcQsGSEdXzahtq0RT/x+sU9EqeajNe+
 J5mywlfkv1UNloIyiVWYfnBr59jn7k2AJiwEI/Nap+629hPEcRTukFCeIAoxn2pklQxIOoZ3lxZ
 u2tlCa4Y4jxkccZ9d9Ht4tLvBVGiDpRtOcoSyZhaVIGsMm5CUUcRx6bcQpBBfLzKIyeUJppuhCK
 EX3lXjtG4sQ7obt8LwvM+FRvtckT195XHHa/e4v8vVBGJC8V+eTUrSRkBy13FfJOS8nhNBS9j9t
 qUWgRahxD0EITkVWCB6G2wI8dIm3N/vCGq2j1qEH5sMCJfDZp2X5tdW3KwUyjhurrzHGcdWnTMj
 Jdf7VZihjk0J5w2+fHV6Hbidkra5JXZbI/xqsyXU/2r3BZCeOUyo7Jp0MgGRtV1pT+V9OtbdrXq
 vj7HUlPfdG09xZVAae9QFNHgQ=
X-Received: by 2002:a05:620a:1723:b0:8b2:dfda:66c4 with SMTP id
 af79cd13be357-8c6a68d2f67mr120083785a.8.1768511150973; 
 Thu, 15 Jan 2026 13:05:50 -0800 (PST)
X-Received: by 2002:a05:620a:1723:b0:8b2:dfda:66c4 with SMTP id
 af79cd13be357-8c6a68d2f67mr120072385a.8.1768511150340; 
 Thu, 15 Jan 2026 13:05:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev,
 Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-actions@lists.infradead.org,
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>,
 Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Michal Simek <michal.simek@amd.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH 00/27] clk: remove deprecated API divider_round_rate() and
 friends
Date: Thu, 15 Jan 2026 23:05:48 +0200
Message-ID: <176851027322.3933285.17869583744437773979.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PYuR80AST36K0n3zDoWzECQkDqpn8RK8
X-Proofpoint-ORIG-GUID: PYuR80AST36K0n3zDoWzECQkDqpn8RK8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX+62kjBBlK6vB
 XXRMG7ESx5d/r1Dtuvfw3VAK4IERsYRhM23LuEpiDD8i0mHh8/85loBZ/FeN5DkfFVO45Z45YVK
 x7mHbJs5s7OGXzOcbcykSVdQXZMHC2W4h1uYmIou6p4//ot6AxsPN6KiRj7rNZm+Ep1YBPFKKBT
 exkq8s1UZqBpVis5muptjjlcvaaM3aSK/x64wBp9BWAeDylCND7lwAjlSdFM3UgtlTqshScplJF
 d7KIGSo1INgBT1qSK1iB+hzE3B+HQYCKwrS0/JJI0qDp1tbQ/o4r3dyTDFpuY9wvBs5SJa0Yd6r
 PqHweyzA4NvH5GYK4/S3zdhkb7xJsN1RXb98rN0QHLV8knz2v6mt0kZpawJYgl8mXBcOg84m8bT
 P7AYRHcIc+NhY8Z3KrY71ZypbWvBtupjXNkOYw69UWm6HEOq1Xtrhu/4eUEEzlI5YynUChP56sN
 gd8hSltHJddjUZT7HMw==
X-Authority-Analysis: v=2.4 cv=fsHRpV4f c=1 sm=1 tr=0 ts=696956af cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=whp_R4xS9ENlu3RGya8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
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

On Thu, 08 Jan 2026 16:16:18 -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.
> 
> Note that when I converted some of these drivers from round_rate to
> determine_rate, this was mistakenly converted to the following in some
> cases:
> 
> [...]

Applied to msm-next, thanks!

[24/27] drm/msm/dsi_phy_14nm: convert from divider_round_rate() to divider_determine_rate()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1d232f793d4d

Best regards,
-- 
With best wishes
Dmitry


