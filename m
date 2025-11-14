Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F342FC5D90B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F8B10EA8F;
	Fri, 14 Nov 2025 14:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dS7q16wn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N/n+Izfa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B2010EA8D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:40 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8RvZs1427916
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4EsW+1nGdAeSSGtBuZuhNLO3vZUOsv37M1jtdJjYvwk=; b=dS7q16wnLd7iT/V3
 FisIduZEwA3xpsrWi//qFrErgYdFsdjFbfIOY7cT2h01IH3s9XWx3wkJCrDHgbic
 GMOy1KwH2nAfZ+KLvHJ+Zv05qsqIcexx1jIlUqEGLXhVzTfTpYIEh74cOPLNwm6V
 lBwkNj5IHf0pqlCHPqNNUShpR44cG3ynfS9KwmfMLOpoXDx4ePfcNWE6GI2WdMve
 x/R2E8X/KUhUKKew/ILD+K3tk4NBgy2FVIIsUcXb9A/zCCqlTFQ1txSpmJMEh3CJ
 l/easeOiKau6/hmjlfxYz2LZj3FOweDVg3xZUx6kOdzbRzdJq58UiGHiK8/sPlla
 z+KR2Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g2dhq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e8b33c1d8eso61072411cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130399; x=1763735199;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4EsW+1nGdAeSSGtBuZuhNLO3vZUOsv37M1jtdJjYvwk=;
 b=N/n+Izfa6Fcz3g0TDYMIeW9pS6iLqHEEcmHR55Sgbx+zo2ehLVxel4rEo0Js4252dd
 3ioxZdwUvATLGsQLAF8O9HSPtezLxOJXpJrKpxp3ZAPznHv2YtvVrGluuwfRVylYy9kZ
 XTdDhMI94nB3vwe36EvPLxglgHkQSpjKMd9E8KJszrNiq45GCzjptaN1liMT+ezw38cC
 D4nMtFElURJD4rzR88UrmecEFZ/yW0HI3SX8BOSnIfDjJZ7b94kqMmaXqzZD2AiS9/e5
 dqq/tDYTsxSh9WZDNM3Cw4+OURUXQIm/rwEjKvPmj/Bat4ak5S3Hiu9HfSzrxEi5eSvQ
 UtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130399; x=1763735199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4EsW+1nGdAeSSGtBuZuhNLO3vZUOsv37M1jtdJjYvwk=;
 b=F+JRC00lOZXInX+FL0SIrBQFN02TqqtwRfMgTqqdbvHdXe0FQjA2hHd40Se7peHYCz
 jVc4S2NiyHz851OcHvjw4jAryzwQqITPizR/w0BimGmawrrc0OoWly7MIRRnetfapE0t
 NPNXtECOe0sBiydBzvvtnH9hXmzUBAybE6GotdF3nwt+p7hkomE3XIMsg2SLzkglEcLq
 Ict8pYORGDAj6FXau7UxWDG/ycyfKO8c/HW2cYgUviDCEncgc3JQ3jQHh978vg0Jtyg6
 nCIgUCwsgx+4GTOIiuVXVbKyIjTkfliKYi+sVRV9FsNTIkXl5hx+B+89Sgt2ClARRUn5
 wWyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkVraKPNbpkqviTGZFVYPZIH/s4uyCseZ881z1AUjrnf2ciy/6ZnhIgIyt5eOWj2fX7O1cw0JfVXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy82d9kM1hkfaHUzu43yNxtTnK5LpDrU+f0ZumKfkfddB7wjsXH
 rycxA741UvLdNpY2ZwDGqBbrdsl3kmRoOtXihIb8B2NDc77EJVkH9NkEYR+Uh1tKf23KzEw672e
 NWKeSNFJC6gJDNKDhyQv232pzlLLb7IQSolOZWMT01ip91ZRUApGc/2N9oVIdUrFG28fodvA=
X-Gm-Gg: ASbGncvXdjrj90AFBZMYUnOTsgGjHOhVEqA5Alb2AujjjjCugBXKZSJW2oBJcOrY7P+
 xndx0f51kXcvTIzucANeT0X3mWK3DpOMc6b6FxARy6EfdGxQLPOplHDVYdAzYj3NOCN/Q29uJTB
 zdLoCaGvbewU190v1/43LhzX3uUAIo7hj9/zG4Puae3xrVRzWJz66Ojxvw2U4jU65Xo3XfKfo9x
 6C5DQGHRl6jJVggRzvBwjcOOv+AfiqIA77XtvFqhUXSYP6taVlIB3/uwMqFfShMKFgYbU9KdKql
 Z3Lh8AKTHcwl3zqlIotPah0YmERZw3HbJ+Db7E9uPKqmU8lb7X++8g2ijC6iy76I9qkTZQV4rsJ
 v84MyYCe4na3kT/cZEaTyDWnL0rR/Pb4xsbWsdhBGlhCxQzPj8sxar8LMZY+fGuWH2TjlFGoyKK
 pHLY3xF+pBxzUj
X-Received: by 2002:a05:622a:1455:b0:4eb:7574:65f6 with SMTP id
 d75a77b69052e-4edf2064024mr47931771cf.7.1763130399341; 
 Fri, 14 Nov 2025 06:26:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1KBUfVirzD+NxHR8BcC6E12q6efxuXfJyY9Gp/GWoVvFTtMpU4YGPyfRbSGcbhMc1pkayfg==
X-Received: by 2002:a05:622a:1455:b0:4eb:7574:65f6 with SMTP id
 d75a77b69052e-4edf2064024mr47929971cf.7.1763130397390; 
 Fri, 14 Nov 2025 06:26:37 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Jun Nie <jun.nie@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v16 00/10] drm/msm/dpu: Support quad pipe with
 dual-interface
Date: Fri, 14 Nov 2025 16:26:30 +0200
Message-ID: <176312947285.1737000.3658283659221081352.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=69173c20 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=Gj-FGaxKOcyxjj5NLC0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX2O/Y1cJJQe15
 pX6VVvSkbk9T060/wNtCRUAqhJ9g+PBV4FJudGIlIcCl8eH9xNKhfh7U0ZaUziap8djUblYLMUA
 dszRhroBe7E8dFn+g41cxklMMs/Uy3YTyYCRM4TQCxzZvZn2e5DGdoGwtN/v8BeIdHo/QNAIMRL
 Cht9MYQw7+J0uGgdIyaIQVFpNq9/SmnUnJBY6CZt8CQXENGQwC7ee/VjMX1Fgl44nL0XDVZaEaN
 W53XggRWYN6t7DlweGvskJVLAaZ991banZgmcCChL8VGCZOshpWEOZFqOeq3FOmHbzSML2yZn6n
 OLjmvaeouTVrIcRuPK7AnsTFXbqbXivJsvuukpkAGCb81mZ3sm1wzdO3QyuzO3opHt2NUUax/jH
 Snge5RBvF1zMQtA3LmvEiYZcVpvjSg==
X-Proofpoint-ORIG-GUID: w39S2_3ILiZOviX5djiUnL2faWPtN9S4
X-Proofpoint-GUID: w39S2_3ILiZOviX5djiUnL2faWPtN9S4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
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

On Thu, 18 Sep 2025 21:28:52 +0800, Jun Nie wrote:
> 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> And 4 DSC are preferred for power optimal in this case due to width
> limitation of SSPP and MDP clock rate constrain. This patch set
> extends number of pipes to 4 and revise related mixer blending logic
> to support quad pipe. All these changes depends on the virtual plane
> feature to split a super wide drm plane horizontally into 2 or more sub
> clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> whole drm plane.
> 
> [...]

Applied to msm-next, thanks!

[01/10] drm/msm/dpu: fix mixer number counter on allocation
        https://gitlab.freedesktop.org/lumag/msm/-/commit/74c4efe691e7
[02/10] drm/msm/dpu: bind correct pingpong for quad pipe
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e4f87fdd911e
[03/10] drm/msm/dpu: Add pipe as trace argument
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2c94547e0ced
[04/10] drm/msm/dpu: handle pipes as array
        https://gitlab.freedesktop.org/lumag/msm/-/commit/fb4c972b638f
[05/10] drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5d45171e262e
[06/10] drm/msm/dpu: Use dedicated WB number definition
        https://gitlab.freedesktop.org/lumag/msm/-/commit/aed75641425c
[07/10] drm/msm/dpu: blend pipes per mixer pairs config
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c11684cce9e5
[08/10] drm/msm/dpu: support SSPP assignment for quad-pipe case
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cf63d61337c3
[09/10] drm/msm/dpu: support plane splitting in quad-pipe case
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5978864e34b6
[10/10] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cd432dfed2ab

Best regards,
-- 
With best wishes
Dmitry


