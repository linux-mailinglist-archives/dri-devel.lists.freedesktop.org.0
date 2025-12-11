Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109B0CB4C13
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 06:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969B110E6F7;
	Thu, 11 Dec 2025 05:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAYsb2lX";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bcVZc3e/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3E710E6F7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 05:24:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BALVKJM4061675
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 05:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7p8dbdR2d+LZMqfKG+PHBtQSgFbWvSxIf5KHLEY5gxo=; b=HAYsb2lXpfOWLr4q
 3KJXfT9rzbImzWUiXZiDW4w+1iINK36EHqDwh8+S2xeJ+g+9EZP8JYXDiqqyi2es
 GXX2kJz5MwXFwF0wBy/BtD9s++sXeB26OL1SuNpXRkbjqtb4UlsCgaEbHNxT1xVv
 aT9x9F9lrJdw3NJnPR6uAFF2dDT1sZVKYAhnSylyMgCo4nVqcx7n06Rf1j/655v0
 W65XOMUQuIYDZfVXDn4EbSSnX7MmOe6EHAxYIFiOflkOOq0u4Hskd7uNgoh1bxav
 yS4pF3QSKXEIDX8JZf8eImAhnrF8Kv/+k5fzoxu+j0eh/vwAfRYlk+tGPgXNGyoF
 kOSiLQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayguqh172-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 05:24:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3436d81a532so1248051a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 21:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765430682; x=1766035482;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7p8dbdR2d+LZMqfKG+PHBtQSgFbWvSxIf5KHLEY5gxo=;
 b=bcVZc3e/w8LJ97nf8J0I0tY56+N8Mn5KIaiG9GzehFDMptOvNL97GBXm5zDaVyHrVD
 tqMRE9U0tvDowwF0R0Nd6ehCkAfj7OBjRK5r5Roz9fiDed590hG6Xi9Mr7wO7KlSPfC5
 OmgDoRNmJn6dTf0ytJVHWk0HuGGQqbW5/FbcIuLmI2KPi6gt+wPMgxVA0E1+sZ0AncoJ
 k2+bk+PLNElyLA5nIomD9bTw/DimNyCuTlOUE5gEoZ3hmZlLjGZ7CgR3FFhNqKasVKvV
 WEaRforJ/jdR3U/Wf4+ratq5WgyeF9g4sNA5fw4D0QloKVBpsPxzHbyyllpEmRY974Cm
 yfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765430682; x=1766035482;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7p8dbdR2d+LZMqfKG+PHBtQSgFbWvSxIf5KHLEY5gxo=;
 b=vG3c4939m66FqIqCFb+vziDpeOmr1sHxwf1JrbYasKo7lu584g8E6v3OfyFdrkRjrN
 xftOzeBLcj4hx/7+ZOIOK7gCXPXiIbKT1/nNVxl0EeojzdA+bBwC6oHUosCo76Hkangb
 NSF3FO0SaGTsYKZpwBNZ74EMxpaktL/La5i0ow8xdJTGPelMvrBSUMxXsY2xd0s7SacO
 YnaYf+AgmNzjoLfJo3EQhX2LhIcMqyJJTEsk5VNnp9eJbbdVl2SzFpjS4Hrbuk3iPKIT
 D0orRHPN6QfKBagN/mLLatsMaxL1GdwO9Ng75AjxEMXr7yynZ4RxD48LNm9wNtOZycYh
 ZXSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCWGdVVAwiQLRF9VAWDNTAUCRLRldicTJ348IEq7SmTJi/Q33avtGYtbcnwrh9AI5jAHupUxSey2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3YX+1gVh8KS3LuFxwvWYJuJ+vyAlICrrI4lpQP+g4fG8iOIB0
 yPyfEsFGz3O/7jFW+XC9Q3ApEqqlOAhHdFaAyeDuKj0C6yAeuqGTIiVPFQeJmd6IKNDH1EMQyAx
 u9KQ/vHBolC55eGcRE8euiPueEB4XTnd8CP3aEwQNHtNFy+7xd093zLdcbsq6TfcfAOV/uTM=
X-Gm-Gg: AY/fxX7MqOOl3Y0rec/vqRP2pGLZrWxNF3hcfj7NG5pjBKAlnuo+wcPzL3Imj/FDBZR
 dYKBCLSkAXO2oxehTapEB9QyeRJHHR9rpSse3QbsWdvEmoED60ylyqh8eshCh7j6urnfT4Eexpn
 BV+Ld+IbVSNGPl1ra9pISDC4AgxWr+V2vjt7VD/jk8TuPixgupTNSdO5UZ23wFBYelxd7MKDOV7
 S9Tqb7o+utcXtM4ct6PCYTZMrAiHyoOPhGIUJZObnoqEluoJ9q+4bnvVvjdOx3Ko8UQeyXvjE8z
 GQ8m03SkPZ2+Hz3cK8XodM3bCLDqy2baK++v426pLDdObqIXyun426UyHCHnLL9k3s1TJjATHl4
 HEk0+GBnSwXUny8MvdzwrO8b/n2mbWv21ifbCYg1Iwmt5gjXm7w==
X-Received: by 2002:a17:90a:d890:b0:313:1c7b:fc62 with SMTP id
 98e67ed59e1d1-34a72837c90mr4460885a91.22.1765430681821; 
 Wed, 10 Dec 2025 21:24:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhGT46louSQjK3U2dWGMtX5pbvQ3W8GUUHoJ7UAbPmB40N5d/xc6A0JwloR+ZMH5UuxPCMOQ==
X-Received: by 2002:a17:90a:d890:b0:313:1c7b:fc62 with SMTP id
 98e67ed59e1d1-34a72837c90mr4460855a91.22.1765430681314; 
 Wed, 10 Dec 2025 21:24:41 -0800 (PST)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34a92660f5csm648543a91.7.2025.12.10.21.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 21:24:40 -0800 (PST)
Date: Thu, 11 Dec 2025 10:54:33 +0530
From: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, Yi Zhang <zhanyi@qti.qualcomm.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: add support for lontium lt9211c bridge
Message-ID: <aTpVkaMJNhTb2zyk@hu-botlagun-hyd.qualcomm.com>
References: <20251107-add-lt9211c-bridge-v2-0-b0616e23407c@oss.qualcomm.com>
 <20251107-add-lt9211c-bridge-v2-2-b0616e23407c@oss.qualcomm.com>
 <30b5f19b-1ce9-4239-bf0a-d83d647608ce@mailbox.org>
 <aQ35tvwp90qm57Cl@hu-nlaad-hyd.qualcomm.com>
 <d2c9cac9-17cc-4bc6-8322-bc43edbf45d1@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2c9cac9-17cc-4bc6-8322-bc43edbf45d1@mailbox.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAzNSBTYWx0ZWRfX7CNmcBIjl+s4
 w/dm/5TynKIZMbukwVT1wEXbg9xY58ohrEp1mqYmPqeWVIQDIwfWfCPbjodzBjpHTJLvSfdf8m+
 zTQGps/aan/acBli8qVOsMlIQbcSHlJqkg2bIDQ0RA5aQ19ru0NlBtl6+Cj8VgAGXGw8kx2RxLs
 VzgiFihcmtwylhK1/tzBj6GU3HCg5PssNYhLX++P9HQafQ9jEX+PnjBX/tWeqsh8r9Q0PLq7UlA
 LF4MKjNo/hiaRFtfEFfE4VEygNK+Uur6AC+KzcU7CLA6QQ/CUQytvTvbV+vI+++6fR7B6aRWtOf
 SDDOEZNjIcM2O3KQ19u+LnUS2mEQkgKipMpcvCtEYl9+RH99W/CqAmxKHbi6Y2LKr7FGoRr+RTn
 xtJ1+V9SHGHfRMNn69vkih4aJ+G0cw==
X-Authority-Analysis: v=2.4 cv=deGNHHXe c=1 sm=1 tr=0 ts=693a559a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-TY5rVZSftfygaBM3lQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 0-Wjg3mmzMoyFERMcqLRjx11ywtGqnTs
X-Proofpoint-ORIG-GUID: 0-Wjg3mmzMoyFERMcqLRjx11ywtGqnTs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110035
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

On Fri, Nov 07, 2025 at 04:11:15PM +0100, Marek Vasut wrote:
> On 11/7/25 2:52 PM, Nilesh Laad wrote:
> > On Fri, Nov 07, 2025 at 02:20:58PM +0100, Marek Vasut wrote:
> > > On 11/7/25 2:02 PM, Nilesh Laad wrote:
> > > > From: Yi Zhang <zhanyi@qti.qualcomm.com>
> > > > 
> > > > LT9211c is a Single/Dual-Link DSI/LVDS or Single DPI input to
> > > > Single-link/Dual-Link DSI/LVDS or Single DPI output bridge chip.
> > > > Add support for DSI to LVDS bridge configuration.
> > > How does this differ from existing drivers/gpu/drm/bridge/lontium-lt9211.c ?
> > > Can existing lt9211 driver be extended instead ? If not, why ? Details
> > > please ...
> > LT9211 and LT9211C differ completely in register programming sequences.
> > Even lontium mentioned that register configuration are different for lt9211 and lt9211c.
> 
> Lontium seems to often suggest, that users should use their provided
> register patches without thinking about the content at all.
> 
> Do you have access to the register documentation, and can you compare LT9211
> and LT9211C register layout? Are they identical or do they differ?

We don’t have access to register documentation. Based on Lontium provided reference code, register sequences differ.
We are seeing this limited difference, we plan to extend the existing lontium‑lt9211 driver to support LT9211C. Will share a patch with these changes.

> > Nearly every function would require duplicated logic with if (chip_type) branching,
> > as register sequence are completely different.
> > Having both sequences in single file is not looking good, hence want to merge as separate driver.
> 
> Can we somehow use regmap_register_patch() and register patches in driver
> data to avoid duplication ?

Using regmap_register_patch() would not reduce duplication. The bridge configuration between LT9211 and LT9211C are different, leaving minimal common base and still requiring separate calculation logic and control flow.

> -- 
> Best regards,
> Marek Vasut
