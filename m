Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4BDBCFA00
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1362910E03D;
	Sat, 11 Oct 2025 17:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pn0h0OcI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7B910E03D
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:07:09 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59B3XuD3025747
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=mFycPb6v8NKaDe6FYB2/8x+o
 vkGxvomJsSjcJN9pEKw=; b=pn0h0OcIRdlCvpvf8AjJVH6nVCXg8NEJeCQW75q2
 dsToMtpqSi+FaPkkcRIipiaBow3F8Mt0xdph6Ty33wqPLR2jpF+MAGyHWJFRDBVc
 2g6SrzzItdXMZJs4RIo5yF3mVzUscJ5f/jt/1v16S4qXdikK6xk/2yBSH6l5Grxa
 AQvyG2gx0K+oz9bWCm3Wd2g2wskZ6FpJ08hr+IkKiXAJKtNQQ2ZENVco/RnbZkqP
 0ycpTVwbCwXLwDB2OXc/DxiGSnhT3vqtijHOw7tdwBYTXNeYQdUS2/J9Fih49Fi9
 a/UE+LUVGdC+a4YIb1jekPmVYnHt4wT42DujL4yWW+rGPA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qferrxex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:07:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-85a0492b5feso2700188185a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 10:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760202427; x=1760807227;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mFycPb6v8NKaDe6FYB2/8x+ovkGxvomJsSjcJN9pEKw=;
 b=aqHDlWa/Yww8YqhWecKQ1vwANIfCwqwLxpLWG5jfxMYxw/CvoxIBsS7Y7+gFIv04a3
 4yagA02sRGHG7NV5sTd7BFR6iPofmUhBUqai8PiPDzl33jF9n10xk3vwkaqsflLIG+5K
 uCqO/9mZFzqT/J0SDU7pL1t8lAIoqnse6HuZ66/lhF7rn5AkOKRiaQKn75XbN+/6h0Oq
 BtIgZa+UJjGzn234lC1aDiaF4pYlD2xHG+cywKxGmKgaKQj5C1StA/scOA5ncUA7kjI5
 soJnSOgqgVfWKnKP5YoPtj9DJVKwF2J8GKjMrw7slRf6Nr5in+DnxOX9Av9YRxKSiZG4
 E8ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMebaaQF4RDIMPGj6EhNA8+knGqUlJIYie0V3QeV/LGHT7Mrp8qEo8JeKQQiZJiyJLf1QFXF+aMA0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8YzAlpAHrCFnmhTrnWXIL7ioiCnA38lb9iX/8GFuHevXlyfum
 pxdZzs4KcoibeA8wh2XPbcYgkGtPPk6Z9ZOZK2dkFdPXTZXjYV4xb54y8220XsMyZpFnnBVItyH
 A1DpJm1R0imN9SraoMhZKj56TYTF4LZowbc+7YiTefYzNR1YZ1Wp7v2bcwrvDmxjs380Orqc=
X-Gm-Gg: ASbGncsEJnWtzAawIXP8WDIG+kbFNmeZkQnJhO1bsRMeSQJcAWlLPIjDwBjDQ1/dTOv
 AEzzO/fnKwaHH0DVVgfKOz3Ux5DzKa7iX1NGcQB8DKrKds8DgR5jdwAl6ESHUBukezFggM8RfwE
 cPN87/0pbWfeU4zMtQIBZm77IZfUqgnwUPIj6ktCbESmx1EpkPVmPQFJYbNBCYZXXHyWh3v/XsB
 SUjvdMJGSLiaFRHFHesS9wwmsAEkALuWXZR18hqvJKSgrEoUGGt+HszT4GUgJGcs6A49tWSR75C
 UWuEQbK3eew6ws8qH+9jM79RSr+AiyFi7TK0u/mna/p1NjZ6So+Rf7VKzEd66P7ZP/le2Ve2/XH
 dzND1y5A2eEpDbpFaukfzmO0ylrJHfTTKu1I7ZMhnWOINB7hwB3Zh
X-Received: by 2002:a05:622a:4a8a:b0:4cb:102c:56b2 with SMTP id
 d75a77b69052e-4e6eabf437fmr231238631cf.0.1760202427575; 
 Sat, 11 Oct 2025 10:07:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGnG/nUOQfuTmf4P38ClaQ0pqxIsVT4KwQ6QvBre1kD+zoeTzKlRbXjaxIWC6ayUXFmCULHg==
X-Received: by 2002:a05:622a:4a8a:b0:4cb:102c:56b2 with SMTP id
 d75a77b69052e-4e6eabf437fmr231238041cf.0.1760202427149; 
 Sat, 11 Oct 2025 10:07:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59092ed98d9sm1244485e87.24.2025.10.11.10.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 10:07:06 -0700 (PDT)
Date: Sat, 11 Oct 2025 20:07:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 4/8] phy: rockchip: phy-rockchip-typec: Add DRM AUX
 bridge
Message-ID: <jcmn6n4nbyjsmpvg4q47wxulgddizhiwax4dcb4dokrvj23eur@g3nvwkssg2li>
References: <20251011033233.97-1-kernel@airkyi.com>
 <20251011033233.97-5-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011033233.97-5-kernel@airkyi.com>
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ea8ebc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s8YR1HE3AAAA:8 a=-wB9imSA1xWJEod_rSAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: 4zrqz5yCyw4ePNQjn1dO3CzSj2CsN6yl
X-Proofpoint-ORIG-GUID: 4zrqz5yCyw4ePNQjn1dO3CzSj2CsN6yl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX9e5V0k8V5Eaq
 6E0JnuWynVBrJ943dzECIZMYd4eY57kk7E2oyE718tXDxpTZrjtfMAfo0zyXPAsiypbii59Mqdb
 zVFSvhDJ3boj3au6N+lnOPenOzbe4vGUjzLwsVJJgg1ST3pAkknpgAWrinaYPHCIR/5yn+Dgsf0
 wnU374cnrKTTI0mXQA99Kk2XpSwwUCiua4U5Ig8nNHk2TbFsq9vk3YSm3JH4HQFTWRmexVpz763
 EiACslxsFR/rKiQ6gXdcymD1AGrZc8BJSGgikNfs1ZuWkV/mwpzmSjgPOjb2M9tliXLqR/ZEoh3
 VonTn5fj/ZtTrcDjMJY7WAUvHjHwF++StTeGFDUgQ6twKMSPeSEGcbOoE+moGwhj1Wg/9rZ8rmh
 d2T1T0XDZBcQDZgnrpIbN4hdDI23ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
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

On Sat, Oct 11, 2025 at 11:32:29AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Using the DRM_AUX_BRIDGE helper to create the transparent DRM bridge
> device.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-typec.c | 52 +++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 

        depends on DRM || DRM=n
        select DRM_AUX_BRIDGE if DRM_BRIDGE


-- 
With best wishes
Dmitry
