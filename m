Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F422FBC6643
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 20:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E54D10E8B4;
	Wed,  8 Oct 2025 18:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPKn5zfy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC6310E8B4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 18:59:22 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5PNw029339
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 18:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0UdkETRPI6ZWbVUbfsUgaXMe
 BnN/d50E+m0AcvlG3Bk=; b=aPKn5zfyCDXgHyxBiNSZBLkmEvt47oUi2RWDinGN
 uQyvvHaFX7LMl4N+6Xg7E0U3ZeVF21BWfHPP8/CZu+uu5h34dEKRoIbzQB8J0TiE
 DvOiVboPksV3SiAiPr6QtYJTignIEKkUErz5spHye4nfnnfOqKUBBAQoGQyTMiD3
 ZI4+mGUQUxc6mOcJVvXDWreZvdia3EDeMCn4p3gz5nnLqZMjoF+PwYiZKnDaCdDW
 hHwXINXjJlzCADrcoRbbyK468HCH703v1rkrq2SgJvhihFsk28r0YhAFs2+8Iok1
 tSkAzrPEffpnZnS+t63g3pd0//gAPGz7VU8cmZOD8FpGTA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sgaey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 18:59:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4d77ae03937so4748331cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 11:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759949961; x=1760554761;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0UdkETRPI6ZWbVUbfsUgaXMeBnN/d50E+m0AcvlG3Bk=;
 b=cfLADgxH3+7IMApdFRiGngdcLnaVDV6SL0LRtLKajoubRCncF0brNT11Tifwdx4i7X
 yCZ+PQF98jFK1oAov5yfS7e8VkUbnAXMXvVq2lGytMtd9uRhtpHN6whY51rqyKCy1qi3
 sNJRZ0oMRJu+QD7XHo8ZW+4EJU5x8JeqOduuMqik4WDo/QO5Byh/9qgvClNg+65XRCXF
 AGMm1xLF0CXHrthllmw+zD+wb1fqXMcVVLd/Brv77kmYt3E7O/nlU4vuzfLCQqhrDvQj
 a2CYWH8Hz3RqCW4haWroQOZHseROb2ba1w1FlU2EoHUpk9hIyVTirN8MUumKSnxFu9HM
 9wyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+qIzXieJY5bF7HhNo/b36ECpZNA6xYjx2/U03e8kqKEvsui01aycOznbXo/F622SvXmM77qdEijI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyH2Sjh41APnZa8vvKN88qkbIYs4+MvKr7EpudX5mkf2dnqZEGq
 HyfFUxzxDAnYfLC3kz1Jvqpok8ZRD5R4OyGAsmv0KXM6kwhUdnjirEy1xTYcrHQlur2Cct2h8KA
 3YZDRldIjjMw8pFxko9PCrTL5lXG2pkiOxYr9KtYcK0xyJAhVUQvm06mlIh3cvoLePjp3klA=
X-Gm-Gg: ASbGncuxnMwjWHkRE45f66M7uIpOIXQ6wE10krLQ17mUj/2jDOshwFC0LXCgwaHx+BS
 W7lgxnvXJ7BDQ0PKqVhoM4bvCF0ELObwJGorI4QQ6d/2ed8i+3bNhzh3eeauMsY7ZkCVa5r2NDE
 PljaKbPTts6rH/BygLjvIZIYHI+GLmmhOgyaSZN5lfIdg1o/W71LBBOcY0834lzs2pSpiaqyJ0V
 KizLFqKGyENe6UWtDx7nqlJylwlfO2b6mSOEVPFvuLNf3PaXoOU4jUtUX0zx20z80I12Jy1aJ4r
 lukHqoka0mJEzoTRCvTR2XmT5bLNYf7RGS4Po0X5Cu6zSwQF5wqS9+VErlDl4YTitLTQYQcBKPw
 Qzj8nQFWMQYdIsarWV9FJ+hHShAMjm4uoA/Tva67+fUi6BuO3Vcpj/oaCTA==
X-Received: by 2002:a05:622a:1b24:b0:4e3:970:661a with SMTP id
 d75a77b69052e-4e6ead91fe2mr67087761cf.75.1759949960509; 
 Wed, 08 Oct 2025 11:59:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaXzhWAKXAgn1FOnUImvO0Ih0s0vnFPkEOMy8MA4cgd7lRzHdrWt6cw5JjIrgIzgwo4fpdJg==
X-Received: by 2002:a05:622a:1b24:b0:4e3:970:661a with SMTP id
 d75a77b69052e-4e6ead91fe2mr67087441cf.75.1759949960070; 
 Wed, 08 Oct 2025 11:59:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5907ac00be6sm263748e87.23.2025.10.08.11.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 11:59:19 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:59:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] drm/panel: Add Samsung S6E3FC2X01 DDIC with
 AMS641RW panel
Message-ID: <6yp5udhm2g42basxeyjnn3onfons2k2besxfqwemnqrafsai6q@tfr74bfz7s7t>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-5-21eca1d5c289@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-s6e3fc2x01-v2-5-21eca1d5c289@ixit.cz>
X-Proofpoint-GUID: fex2b_WPz40Z4KiRVWHaJ9dYWsAb_z2G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0IVOZFGQJV61
 yXSerPtSVThn+8YN+EL39w4hTA64GUK9lwtm14ckJiubSnaVvMeKRQzlM79Zv1ePbyoPiNzH5+O
 l1l6R6JgHBtZEaRKzCvZnX4UEyFCXcUK6t6CVtNabtC9oUsQUwmuuDQcTY5o9xpn0Hagz+t9qUb
 ybOhFBgbha9mddrmNjTqrFKW4aLyfA7Y4dlDh7/+4EzF/l9bjPcACa8A7XFvhnkdq4AXyNRZvgS
 xrMsTCGIYY63szY1KqsEpNd1d0FAk+wbLjq3FoUnO3neWU3OsP9ybseLC+UbmFr+RdfBg4KHBrS
 m/cOBiByMuAdyHOCnl8SRxtZofDN4ZL37RPyiNTQ0hnsM2XyeAWvNXavlxIUQLNU3jxD0Jz55Vk
 EB2VQZmYnG5D4WdiN44vp/OdODwhWg==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e6b489 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=WFa1dZBpAAAA:8 a=bBqXziUQAAAA:8 a=SYGtE8pA4Zq6nJvkfUIA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=MZguhEFr_PtxzKXayD1K:22
 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-ORIG-GUID: fex2b_WPz40Z4KiRVWHaJ9dYWsAb_z2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Wed, Oct 08, 2025 at 04:05:32PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add panel driver used in the OnePlus 6T.
> 
> No datasheet, based mostly on EDK2 init sequence and the downstream driver.
> 
> Based on work of:
>   Casey Connolly <casey@connolly.tech>
>   Joel Selvaraj <foss@joelselvaraj.com>
>   Nia Espera <a5b6@riseup.net>
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  MAINTAINERS                                      |   1 +
>  drivers/gpu/drm/panel/Kconfig                    |  13 +
>  drivers/gpu/drm/panel/Makefile                   |   1 +
>  drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c | 402 +++++++++++++++++++++++
>  4 files changed, 417 insertions(+)
> 
> +static const struct of_device_id s6e3fc2x01_of_match[] = {
> +	{ .compatible = "samsung,s6e3fc2x01-ams641rw", .data = &ams641rw_mode },

Again, why can't we use defined compatible here?

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, s6e3fc2x01_of_match);
> +
> +static struct mipi_dsi_driver s6e3fc2x01_driver = {
> +	.probe = s6e3fc2x01_probe,
> +	.remove = s6e3fc2x01_remove,
> +	.driver = {
> +		.name = "panel-samsung-s6e3fc2x01",
> +		.of_match_table = s6e3fc2x01_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(s6e3fc2x01_driver);
> +
> +MODULE_AUTHOR("David Heidelberg <david@ixit.cz>");
> +MODULE_DESCRIPTION("DRM driver for Samsung S6E3FC2X01 DDIC");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
