Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED45B4FF92
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F6610E25B;
	Tue,  9 Sep 2025 14:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5Lk80GW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8716E10E25B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 14:36:20 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LmRG011213
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 14:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uA4qgLx/hsEAq7trbdmyQAHvkr0Ta1iiDba8JlHd7Vg=; b=f5Lk80GWY3cCa4Iy
 3vYu2TIZ3P2d5OzGQ6I2sslL/a4uINzFIiwTDgwu7N19jHjWh8C6jgUU42BQoa+S
 orF73ceuoBtiisBWfRowDB1vqMWrca2uFjsw1VC482p4+XRAl8FGr8YBngc0tRSd
 U4JyFwKDoZva9NgyXwlkgPgtepw7IqWe1dh9u2/JojjUxKp2AtMVij9mfaHcRMWz
 aC8WD6FyQSvsfHejLJFuR5l5bb5dC4F3A+HKL3XDwj1Y0jXsuI+jbe7SsHgHVXzX
 t2l8SbbcJtsfVjiqY10MlUj0RkoIWzdFemtawnzVS/bAQjttcAsSfsxEoqZkwX2J
 CK9COA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0rhnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 14:36:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-718cb6230afso124179076d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 07:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757428579; x=1758033379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uA4qgLx/hsEAq7trbdmyQAHvkr0Ta1iiDba8JlHd7Vg=;
 b=o9Ya3yYbAX+Ps4ynxmbzRU8FXj5M+0NL8h2VBJDpfhxz/bnT2HfBbhkCri8Uzyr6yq
 aX3NOpeDTychLEKj3y4PgRR6I29PY5AIIQYSDVjR7m2GtOOjf73d/9CvHOX+RUI/O6mA
 vUaSfY/+0QJn5BqbqrKjq2mjNM9vULXd0350uBSCCdn5d5+dctmZJsmASC797TRMWV95
 xLS3/BkNatOxgduNvhGjECMIpMboAV4fQl9GidF8EIALPStf+LjSFhYxUDxNDDmUR6tb
 ZCAwBCIkJSIDPI6Zi/SEHXzltXNYuekeHrVobt4wAiEFapiqS54TSGzn3lT7F+LYPoHg
 J5bg==
X-Gm-Message-State: AOJu0YxCbEXKsDQ/A9XUZ4NkLP5nxCbiyhJjc1wsuTqHZHhD6xAbRb65
 vuamay3p2FAkFSw6MQqE55lKO0k1Q864r5JjwCTSRjwt1vDUI0K2E7kNE3RlBXIg2ucP8VOYXtH
 hIguML+x7a56Y+uNBLh6m9Zn0zLEQck5J6d3L5v5m9mzb1nPP36+6XS9C5eMciDjORnuGoQs=
X-Gm-Gg: ASbGnctaAW6PaU7wPf0FOWKGs1OZxS0lsi+pKqzEOOqu3RE4rGkTtawOAco4s/iCVI0
 hAPYWPu50sE9gYkgJw8ZiW+IkxbTiRwBHsG0NfZvNQ0rXXw7fpZIGu6Xb9cncdc0NF61YvnYalh
 j9QsCNA4GzFuvgVGjVjn7JXCEZpaK3xS6Asa34PxRn8CKdiUB0pvwS8xipkPmJlI6NPZCr6WR+F
 KVjcosAdKV9/0DT1SSmnfD5b/WxpUCzscVYUQLONjMjlEthaji87Bru8KnFH8m91AHXqrPp+dgX
 lRvux9hsEDIM+K+PgRyqxl0EIK+y6zGFmMBczWw0wGAyFPNb52484zkVYL6WAKj5ADney0tebLZ
 vsTAxDGM+s0pF/iqdAJlKd9EcNhENdyG6EVGGOb1HVuh2+T1GXzGS
X-Received: by 2002:ad4:5967:0:b0:70d:c6b9:c256 with SMTP id
 6a1803df08f44-7394276ff99mr129483686d6.58.1757428578681; 
 Tue, 09 Sep 2025 07:36:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5yengQZlzK1mif7XJLm9HRvGWnVva/ZOv5l3q3bP1SJyzgh4y5P9Co0DzmJNcdBRGugEvQA==
X-Received: by 2002:ad4:5967:0:b0:70d:c6b9:c256 with SMTP id
 6a1803df08f44-7394276ff99mr129483176d6.58.1757428578084; 
 Tue, 09 Sep 2025 07:36:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5680c424708sm567120e87.8.2025.09.09.07.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:36:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/bridge: write full Audio InfoFrame
Date: Tue,  9 Sep 2025 17:36:13 +0300
Message-ID: <175742856368.1251022.1890059906161498952.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250903-adv7511-audio-infoframe-v1-0-05b24459b9a4@oss.qualcomm.com>
References: <20250903-adv7511-audio-infoframe-v1-0-05b24459b9a4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WVGBQR8pLHkBoqRh60SVMdghV8Pbcs35
X-Proofpoint-GUID: WVGBQR8pLHkBoqRh60SVMdghV8Pbcs35
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX2hvIadGeynbG
 Z8dkPk1dXwBL18yV+oazowpQL/PoL1rETftOsoeqi0vDRSUL5zZ7H46tG7qcTgDRvJIpvqn+h5l
 utcqnVTBCbkTKzcK6etiyCLaZ5Byx6IbFR+c6rfrJ73+Ni1G04CIHxA+Licb7ywai3dSL1F3tfs
 ilDsFl785ddj6fe2OZU0jKO+a4kKo6Eo0eXY3JcE2lpXLWA/+28tAjtvR8xrGrj6+CYT6Z4EbFz
 G7slhtvr28zQMOdq46s/nbzbAJjhRrZVnYw7lck6svALGrw9DrClvqaJqFM4KjM1FjiRjizc6To
 25TbWmPvKiKrg96wtJa0QYYYjIW65vkCeXE+oBx/BVHykKqxs79oAIg3vwh3kkZ/VS77dGS2AGF
 1iagttzv
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c03b63 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=4_h7anNqbxI5UNtl55AA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

On Wed, 03 Sep 2025 19:21:27 +0300, Dmitry Baryshkov wrote:
> Instead of writing the first byte of the infoframe (and hoping that the
> rest is default / zeroes) write the full Audio InfoFrame using
> drm_atomic_helper_connector_hdmi_update_audio_infoframe().
> 
> 

Applied to drm-misc-next, thanks!

[1/2] drm/bridge: adv7511: use update latch for AVI infoframes
      commit: 723a170811db366b993437b08f1ca707163f7c84
[2/2] drm/bridge: write full Audio InfoFrame
      commit: f0e7f358e72b10b01361787134ebcbd9e9aa72d9

Best regards,
-- 
With best wishes
Dmitry

