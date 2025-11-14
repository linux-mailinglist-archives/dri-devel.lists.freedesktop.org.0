Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76074C5D926
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBC310EA95;
	Fri, 14 Nov 2025 14:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqL1QxTF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HwtzH6E6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA4E10EA8B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:48 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8ahPE1537328
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QUtZTR/LX8xkNad3zOXNntb+ZjNzmULI6QNHH4u1910=; b=OqL1QxTFd7Rl8e/v
 ayPe7X835uwAcXp2YY1fUtP6/80nOY/RlY5caWAgKFOAjhtAMtT3UWJaPiNmiDE3
 ND8AdAvjes3opZknWLkwM/U1BmZ1lMOfp57q7osKudbRYg4vgF9FjzS1jM/tWiK+
 wYqC3vMZcTzfT819kODmY2WjR4tSz87R5KIiFZm5xHTFifkGAmdbn5OSjm3NyUJ8
 ejz4AcbdQlcEVxlre/zDX3u/3OFjnrMO9OuLzhnUTCJpdCa83nSxs1XlZVx8qUB3
 yCugXlzowM6Uvvu0tKYAxgDVL/MwX7+R2jJ3fuD7XLrQ3sZQApmsxdi76hXQ+JKp
 AamNvA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hte9w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e8916e8d4aso81432831cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130407; x=1763735207;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QUtZTR/LX8xkNad3zOXNntb+ZjNzmULI6QNHH4u1910=;
 b=HwtzH6E6o2h7Qf1LQPUP17DMgacDmy7nSeCIjisBuk5ddgXJ0y2wU8brt3L3wo5Yz5
 2UEQDznI0UAchRjInelCo8FbIG822yRVcVTMIL8eKKL7b4IbzpAJJ2tn8LpZemmPGP0d
 vQHkPosi0AJZRJQVoelua0LBvp5+rjpxk2+OhcsJAtSFUqnbD01WP+nyTXUDne+XNiby
 SorMnHUzM9f/aR9hg41yM8O5cmYYR9ExCSFgASbCwDpsDwJULq4tqwPc2I6vDy6JTZMb
 eSR0F/EgkSpzwAxvYobOaa/9Wmh1s6qfd4TMJpalWXcOxzykM4/XgbdP4vrHDUObbH/D
 O4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130407; x=1763735207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QUtZTR/LX8xkNad3zOXNntb+ZjNzmULI6QNHH4u1910=;
 b=iwXk7uy+6gJIeuy3TOC9OFFLpt0b5q8EuYYiQgX83Ed5H4RtkZ4hDaPu91LY4nV7c5
 xNzhJJdI/657FKx6ctuidSnf4avVLz7cNEAFi4gIeZqimTmOyFC9PGyM5pu/ZQDn4MW4
 J1y32ilQ4i+BV7neCaR0qf/IG8QLC2Ghsu38DV7SSR1Rh51a2G4bJARBEEicNwLAUw6F
 Ildnb5sqx/ga2sdvd/wHLwU6ii/502zgEMyOhOtdaQOZRy4X2qhi/+FcbyFDQpKXqrit
 uwNBiHqsxcUX8ZmYfycP7wzmScjD89ped+FURlQOqEGzNGpeMWHC8LETmHDEwp6edRxI
 oSnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh1oGtouk5sUWd4cv/3oe3AWl4o+w1JqwXZoV5kWRpjKxLnRCNkeeb8SMy0WbB85GAaYNd99NdiUY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOtKKxUKOP2J4h+vmyjGhJE2jsb1VjMVDC8fT1vRh7kuPsDf76
 u5+X3ITQmG2tQBHBQ13BVXkf7whfpTTQJAzx+FF1G/52vrOnKaLSD12etIPbhUL+n23mbt+rcBI
 RIuNgvg72N5NNFUsdxZepqtwtlptjk/AsIEsN53ew0K/4QuUuDFl7DJYDDYnKbU4Fg5joLJA=
X-Gm-Gg: ASbGncuf0DvELjDpps4q45DPktAeANzI6cLStZZjkPKpK2Amrm0EhkYMSNed2kRNCBW
 kFb1WZ5qE2LAP9QlpFfTJ3+QZDbhwei6NlF4pIJRAmjsz+lZgMZRQwC/ngy044yDF+Lx0ZwuRv4
 F53ORJ7AyDtUSso+f8aD/jtG0f26tvRowuuzpAhBHiCYi0SJqeGTiyi/SLnwdjW7M6OTrrA6tsw
 FWzg57q/NLRfJZkcEjkvDs4EWCqRXQ3G0gLSgOD2TG8+z/Bgbayx3dqV50Z8Iu5++9ghiOJlKMK
 OucFZILMCHioFmhdjBJBsCIp4j9lyrsu0PlgIH7qkCmZV94hS55IiRIsOpSdwk3333YbxYjjZEO
 NSyvuPvioQXr4MqhMia5i8wRytYIT2rv50Ff9pWG4xMdm+wnM2B41Z03BJSS6eqPYtOt7isDAwj
 Xio9V+fXrLKSB8
X-Received: by 2002:a05:622a:58c:b0:4e8:a332:ba93 with SMTP id
 d75a77b69052e-4edf2142ac7mr47937061cf.76.1763130406211; 
 Fri, 14 Nov 2025 06:26:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7ZNsO/1TvO1h0/niYYuelt3zWYP6cQK//e3LNf7oVm47FCgH3fT1GElj2eHRDmKTUxYXD0w==
X-Received: by 2002:a05:622a:58c:b0:4e8:a332:ba93 with SMTP id
 d75a77b69052e-4edf2142ac7mr47936021cf.76.1763130404998; 
 Fri, 14 Nov 2025 06:26:44 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v7 00/14] Add DisplayPort support for QCS615 platform
Date: Fri, 14 Nov 2025 16:26:35 +0200
Message-ID: <176312947282.1737000.4785941412056554129.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
References: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tPqjYtpxYPsCG8kyWkIJSM1UDIAEBrDU
X-Proofpoint-ORIG-GUID: tPqjYtpxYPsCG8kyWkIJSM1UDIAEBrDU
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=69173c27 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=BS4b-AKSgWLh6_M-HIAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX0xoeLZubc8rw
 G4hq+ObZhB56qgRBMsyrEuMUEiNyiQQK17g86NIj2CLvswKPpiQacnfmTeVWn8+VRj+jtOUei5w
 0iJ7QRtKf0EWnajiHwfYONkBX98GqGJJJcabMTgSEgbk2+dy6QtMDgnW4Yk/4nrUO6bGaWwjlPP
 KdxQXB+/gX2KIPBGK4YEMWYWZg/C2qNgmiNcZdLqRc7CC4rBuZJAnnpJ0DTnoZPkl54P1lT91Hg
 ArZCcr7rEaydStwocVEGMJnF8X6/vZ2BBBP2KZl7C3hhmYefm5fL8pNLdFM5ck2lwNTGgHRbtQb
 3DQjQaGs0ECQ703vazKrJhIa1dDefZ19KgflS44c7jRsiTLzAL8YofVMwLET5/DNcns84OVN5lY
 m94VPuzf9vidT6yZY/81AWAs71GqQA==
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

On Fri, 26 Sep 2025 15:25:36 +0800, Xiangxu Yin wrote:
> This series aims to extend the USB-C PHY to support DP mode and enable
> DisplayPort on the Qualcomm QCS615 platform.
> 
> The devicetree modification for DisplayPort on QCS615 will be provided
> in a future patch.
> 
> 
> [...]

Applied to msm-next, thanks!

[13/14] drm/msm/dp: move link-specific parsing from dp_panel to dp_link
        https://gitlab.freedesktop.org/lumag/msm/-/commit/866aad5cfb55
[14/14] drm/msm/dp: Add support for lane mapping configuration
        https://gitlab.freedesktop.org/lumag/msm/-/commit/36d978701203

Best regards,
-- 
With best wishes
Dmitry


