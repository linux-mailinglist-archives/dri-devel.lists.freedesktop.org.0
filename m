Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7854CA3127
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFC710E906;
	Thu,  4 Dec 2025 09:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="p2SR/SmD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANCCTFPD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FC710E906
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 09:47:32 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B47U2BP996654
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Dec 2025 09:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pUBfY5jIY1RcuIaYXy/4WSKR4pFxd1tabpa2Ll11nlI=; b=p2SR/SmD+5jskdfE
 NhJBNg/7+rTeMIaxexwvb/pi9N/rbxkNnXPtljm7hFYwK9bzYkagQXFy7FbSq86t
 /pNErXxwuO9vF6liQsqVRpxZBLsPMxEiwWQuOusYb4vKe+exA6RGIebkZVN5I2xL
 Bgruh3zseW6yNvkjD2ae3++7tKRdcbXgzUMfeLHCbEPJ9gZFO7c8wWdJNNYsU8iP
 XxpPSo6QYO1b06IdqOL1OASdmIFTs6YCnm1OggEMK/KTSSVLRUNlmUGsS9oROQTT
 UsGZyEY351Nyv1vE0FZ2f2OWVwRW8vdurF+vsFcNQsAfvwlpnL+XI71fuJbwG/yK
 dpuM2Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au5yc0fy7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 09:47:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b2657cfcdaso91507785a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 01:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764841651; x=1765446451;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pUBfY5jIY1RcuIaYXy/4WSKR4pFxd1tabpa2Ll11nlI=;
 b=ANCCTFPDGNNBoHIjYvf8f+g455kIPI9N2fVtzFexZX42AjyoddjQ5OCbREmiHNYlHv
 NBDyLJN9VPWYN0wZgtA1qtWsVp19vHUkIChbjg2yGaCSUZ2GbD/l8g26DmwvRADxlwSQ
 gcyHxKKk7fa0Xu/N5PoZaUjjzlNzQaLhDuZGJr14r5cks6kFs89N9noEz4GpcQo/LNDH
 saj/0AnPmnaCLeMMa9tCFq5NcFLL/yaIqn7LBA2Fd89pEtWPI/OPXAbS35/rHx8Wy3mp
 YqkYRPR3xVDIzcggUWiWG57ozIioRWC1FLRB1ehS1Bd9VzgSHHhncSbjvhg7xJK5OroM
 mKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764841651; x=1765446451;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pUBfY5jIY1RcuIaYXy/4WSKR4pFxd1tabpa2Ll11nlI=;
 b=r0/b2Q5YGMCFINLoQ6WhpzILSCmenx9A79VohsipFms2PdBK6yhDuKOZKXNNZxjB5e
 RfH728TRJxHjndvj+dPeNL/FsDnLv3Kt9qe/ki0Gg6YOu1qcDDOYhik0WjIyWD5B2bbs
 eNccHp1pvgQsKmVhkn+aCGc7/EWIyGkicc2S9vo38wJ8eBcK9vRadgz4bRYh8N9CHaqP
 1+khPeAJ+EBrF/sDugmj/JetsmSlHmgMI47PvkrTgKPL7Sgr8eMfhK4SzhWyjGHlfuGs
 zBAbB5r9XRbw6P9vf0bsW1mZbT+hzaD0v2eUAweh4Iik2HJ55y/IBU/7UylEWNFI8MEr
 FUOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdSFrt68zbzof/DZM7vyJw0ric2ZY2yX/l8mNSUVbJjSEDYhwIFA/vXxjn9YScOABg4u2tQsmvpE0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2sM0MjqsKszTcfwqMD+SibJOvOXoM8YJHB/vRnbA5l1v28R3n
 bG0NSfZf/iF9DNNzh4pzkIVFEcX4B4QEF8VHxTeA2DkQKswk5ynAYUWZhZR11/AlATwUOmMRDIx
 CZiZTAkBmXkW7GzOjgTZbUqFHdmnrFa/cjmEkvrpf3LPcrDDFLLVgcVr4Uy6OVQQr5S2X8A4=
X-Gm-Gg: ASbGncs9XPAGVQE9emP4svSl7urNVtpvlcXdMJ6fpsIH2k6BpmneSiOGyAGNzBVZSWO
 hiDV3MT3THnRv1RD89xl3z+p5CO9UVu7iVk4ZeDQ71kHxrBlHw/2+xiUjZ09gE8z82NHAhHdqI4
 qH+tnDZ5XQgng71EwpOhmenAOKvk3xNtzbKB8JKdptNyNSqTJ6dcextPzgD4GBg95iugG33Z0Dp
 /S3MaoYu6nXwQpUM/kfMLcJV6iS7dpkjLVA3yE+7mnkqFWGqrZh8IAtqnlt06o3blLt4PYmfbS3
 dY2QwBv6x4X5pGJtnz6uCl12MrznvusDsFTKuX5F4iaMvNyvsr84dZjVOxPzVb9XLQ57nXCiGkM
 rhGZlECxt0vzIE0LmFaWjn1xgBMVFnRxifuToPLg3ixs5OhGtcAsXg7SeW1zG3dWm/OKVDWDoNY
 tBnT2W3G8es4i2
X-Received: by 2002:a05:620a:46a2:b0:8b2:598d:6e98 with SMTP id
 af79cd13be357-8b6181f1c1dmr276409285a.58.1764841650799; 
 Thu, 04 Dec 2025 01:47:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdWBTmtoknkMH8kz6B2X6j3KiGmUlXyUbfopjsR83o2iT6J6CZDZRB/IJn43+50pjA6xjPVQ==
X-Received: by 2002:a05:620a:46a2:b0:8b2:598d:6e98 with SMTP id
 af79cd13be357-8b6181f1c1dmr276406085a.58.1764841650129; 
 Thu, 04 Dec 2025 01:47:30 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9?
 (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37e6feba575sm4180081fa.21.2025.12.04.01.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 01:47:29 -0800 (PST)
Message-ID: <191ee8f8-b48a-44be-9b2a-3690a362c541@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 11:47:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imx: select DRM_DISPLAY_HELPER as needed
To: Arnd Bergmann <arnd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251204094635.1030724-1-arnd@kernel.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251204094635.1030724-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QstTHFyd c=1 sm=1 tr=0 ts=693158b3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=t8mZWZZekR3hrNGy9_IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 9oOKGtJaylpQqafdDrI3GDQ0w5jYEGQL
X-Proofpoint-GUID: 9oOKGtJaylpQqafdDrI3GDQ0w5jYEGQL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3OSBTYWx0ZWRfX7RPzazpDt4n+
 50FBA3DYbg4ZZi5b1dPTlUcdtPQJjnPIiGTTEfB9aisUMfEMS/NLylBEDPleR5dcGr0s+scCca3
 N8pcXXPJU1+OfpRhGxZ4jCKmoOX0fE5uBUe9MtwW9I0lAGSAGgZLR9yQab3YrsuO2BhFJQbJudy
 L+kkFptes+EhtU/jIuN0bxq8o1ZDXlDB6BV4xx7/I0dt7V0CKKGjSYTkz4LHI2zgaNecbZKzbHJ
 mkiwDfeoWZF2NZsqYPBMQzcGyCSTxOTP9uS4LNlFZRNpybPerQHHWrPJlTBdDOq8XZZoqMqHFVQ
 ueQ7f9T+1+ieDkExc3FJNeXE/RlrY6H7ZCEozg/klaD8qhmWqvIZTj9geLWJeqEr8DUREzVTjox
 qFNYh9h9RVf1l/iIIaRyZR9zScWybQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040079
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

On 04/12/2025 11:46, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> CONFIG_DRM_BRIDGE_CONNECTOR is a bool option that turns on features of
> the display helpers, which are in a module controlled by the (tristate)
> CONFIG_DRM_DISPLAY_HELPER. If the display helpers are in a loadable
> module, a built-in driver trying to use the bridge connectors fails
> to link:
> 
> x86_64-linux-ld: drivers/gpu/drm/imx/ipuv3/parallel-display.o: in function `imx_pd_bind':
> parallel-display.c:(.text+0xcd): undefined reference to `drm_bridge_connector_init'
> x86_64-linux-ld: drivers/gpu/drm/imx/ipuv3/imx-ldb.o: in function `imx_ldb_bind':
> imx-ldb.c:(.text+0x224): undefined reference to `drm_bridge_connector_init'
> 
> Select the DRM_BRIDGE_CONNECTOR symbol as well, to ensure it's built-in
> if anything needs it.
> 
> Fixes: f94b9707a1c9 ("drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/imx/ipuv3/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
