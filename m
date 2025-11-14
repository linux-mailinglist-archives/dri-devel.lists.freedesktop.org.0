Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0EEC5D8FE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9066D10EA8C;
	Fri, 14 Nov 2025 14:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1G6oICf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eBqtei/d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080C410E248
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:37 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8GQ6c1488582
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kpz0T1BtBZTq/unUhKaDeyfGkp7eC3qvwU10X/7O0C4=; b=F1G6oICf9R7etJDc
 qzB4xoNt6ifFDqcCuTHAYPnE2IehvNOrF8OGpNAFvkyZouQatra5WZ8GhnAiM2tR
 Rph1Nz1fGAIif9/PNR/eFPtrDoSQhp7FXvO8++w0S9MpHyk8efx7hVlDhZL1MmwB
 NcOP1Uqvl07rHt+dlxBAfXOZp35dSvcgd6d1F7oGh3ZIJhtYMbB7B9fuplELHGAd
 Kan41oCIfMcdwaTZS597Uokrcc4PVsrkn81+6MLYR63vURQAkJR8seQXw2FJUHwF
 qeDM/rHP26NxrszfQT6yKGoRPMDXnT7M9Zsq9s1b3ZGJBfw4whgsZXR1uz1WS/fT
 ZKaYnA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hte8h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e88c912928so55882071cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130396; x=1763735196;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kpz0T1BtBZTq/unUhKaDeyfGkp7eC3qvwU10X/7O0C4=;
 b=eBqtei/dirrhyfwr8gERVXVkQCYPyf8tnJeVNSRFxo9kdzS6VLH7GdRSfzJHZVz1Yv
 NEDPxzjSYCK2/zW3g6cOhX8ueHTsfGZExfaLP0tUkxwAD1Dpe0q/kSiEAHz4OzyMXyZ9
 6X3Xex4vlll2InVQGJWzJloqkBem18PaG6ToDv+u4mOEin63LTJM71hKKbmUCOSMfx53
 vHALMQWmQYjB34oXELuIH6XnuxJ5I9NG/f8eVZZhTNFa8+HWl2rsRfr4c4s6HVk1Oq9n
 +Aj/UuLpp+XFtANV149qblQq1LnV2sPiJrGWLTACD2+Nc/1y8jutZssYNV86DhyNew9W
 22rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130396; x=1763735196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kpz0T1BtBZTq/unUhKaDeyfGkp7eC3qvwU10X/7O0C4=;
 b=AFNrbP1EXKbsF2GYV5wq5uXAMmKeHOWtwtGjhNNjRlLVhnB3iQK4KifCXD8XF8obIh
 m5O8SmLkXBcK1JNycxYYmDSOJ44AT036RZgVXhzo6jbHNL7IyBW7McFi5k64Ix9uu0cU
 lBHrGXrtflNepwDn8I+PBo1KH2S+p83kCTfChYL/gbvFtsbV/VEImzzpuKQO+tl/z5n4
 99Q01yCXcmoqI3eth+0IZic1jwOwxibhf6rYrByDK0wYS0RCR48q7d/DKTsKSumDuQo2
 dDG+W9+YlFHB8jeuVcNxbtXYxKvmh+n+iQZJe0bE4ivHwlRv6retTnR7ukfQukiyzsBG
 n7EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6+Ct4pNNwiafEOj6PicYqDz76PLcV9ojuDrY8P9BWGYMlQU7DHU1ozRYw+BX7fuPLDv5NOBv1beA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz30wQ5xYX827U7zKVPA5V0om9irhqocAk0N182eUkLmfSNQZAb
 VS8CAXGoZMKJSxxc7qhTqyRllpMGJH0Iv75YdwVar08o4di5/0CblZ5iaFMzCU0RzMOR2WC6B6G
 H6MW5ucuskl7MOua4OPT+LK8uIuhNeCq3J4VfZrEDmbirtJQ9CbhbxTxOjPNYZnl6Q7KoJpo=
X-Gm-Gg: ASbGnctXrtSPLl6lF+v/F/COpVc05E5a8nErKUjkiWFyvy0I8RGxQZkcLEzqBRFeeQU
 FVfdKx0yH5aWjCu5HZMg1eN6P/TiOodaGDMlPkJMT7DY/DXdZIe5fFX51LM1wYpO4nfoKwKIwh+
 pClu/ueXDHHq2JvLEF3f44yMK0cHbDvcMb+GbaQcs5SRfrzR4S79g2yBKBgc0M95rQFT9jviMN8
 aF744Oyr8+PYS1X1ZoJqdW2FeUWVYLOfP8iLeA7ET4w92mh79JG/m4HqaVDmuFEjJC0DWlRI+hm
 uApWDfcftlLoWOeEVFSOIBIhUAdMpbYSfkB0WgrGhoFJt1vC3kV/LEeYKs7DuMwpGAf+FfiF67e
 GxLIBwJ1NekuGGnVcp7dLHXlt0ILvyEpqeYYA5HI5VHuzdfEgZM0cmv3rctzIjYi6IHmcw8bpQc
 SU2BTi22CCyfHD
X-Received: by 2002:ac8:5844:0:b0:4b5:ea1f:77ec with SMTP id
 d75a77b69052e-4edf1f4b087mr43272861cf.0.1763130396592; 
 Fri, 14 Nov 2025 06:26:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHc1fFvTd3StWO42NTuZKKYem/traozFFvdrNGkyOZ3EfhLQasWqywNOo+OH3TvkuUZYjw+3A==
X-Received: by 2002:ac8:5844:0:b0:4b5:ea1f:77ec with SMTP id
 d75a77b69052e-4edf1f4b087mr43272321cf.0.1763130396056; 
 Fri, 14 Nov 2025 06:26:36 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
Date: Fri, 14 Nov 2025 16:26:29 +0200
Message-ID: <176312947284.1737000.13215688004444717499.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
References: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: USjhdPikriFp6rBOLpiymJECumkUSC9r
X-Proofpoint-ORIG-GUID: USjhdPikriFp6rBOLpiymJECumkUSC9r
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=69173c1d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=cUxZTqMetSfSej92E3UA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfXwHVTA22t90Vj
 DYtIxu302PBXNuhtwwi/KoUsgUuHwDhfxYvZPWbjT+5CbltxzPvHfM7D4KxOvy7jUyKm9ZJHNQW
 7xefI+TD9A71gE5wIzkzPKC7jYmBc2jmVTMnQvUiFJgsHGzrs5TeovTk+4PNCsx4yQ1eyYCGEMH
 z+EDFFIgE4URkVFYZYjexLd0duNeuQyediaavLCWCI9d4Pe+ffKyH/QY0oWpxGYaKpDzS9+66kh
 PR4ilfdtEhIde8+NfnhltXSMvqwEw6W+iVwsBz8Jd4tBOCY3asi30yPlLHvTPA84CQCuXsP5vHS
 vkTql1wTjtcgdD361G1X+DGOpXqmES3KTr+6XOK5OE3HasWua5g/sMXh1o3nMiCLLJSd38ywOoQ
 osdVzXcD0VU8qhdpId3IwGxsV15rlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140116
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

On Mon, 27 Oct 2025 15:35:17 +0200, Dmitry Baryshkov wrote:
> The commit a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for
> HW blocks") dropped all dpu_hw_foo_destroy() functions, but the
> prototype for dpu_hw_dsc_destroy() was omitted. Drop it now to clean up
> the header.
> 
> 

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
      https://gitlab.freedesktop.org/lumag/msm/-/commit/34ac2bdebf44

Best regards,
-- 
With best wishes
Dmitry


