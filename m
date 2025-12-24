Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D78BDCDB0F1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 02:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB06310E2F7;
	Wed, 24 Dec 2025 01:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O3XjD/zl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfRM1fUd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E434010E2F7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:15:22 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNFrNII4135043
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=b4q0D7NkeNz/Vq+kmGDFUVuJ
 8S7w0kBYhBpQhZWbzPc=; b=O3XjD/zl/pWBG5d40SNIh+N9S6utwvTCmK0gMBVS
 uMA5ts8b315DU0AcfQmIl8VyF96ATYFHHLpSxLDIHkIYtJj+57k3Jttxh7Ft/nou
 ufRlBze29hhIu07OoQKxZezL50bcfZg//VLkReCj9YVWdVT261NCU7H7YfBv21UN
 +nvmzyJYfu0VTf/dNmbI9a/ECrvGW21AGm1XsGgCjQXit/RK58MmjKnkoapy2Qe3
 bj5nYkK+0upQ+4ORZLLCTVaExCY/LLYsKwul1ijvoSmT+Fq+fFD4j+MyEkMnTPmI
 4OfekECQjsaqpfFfKOY8hsspUDSNTFj5hfmyaNaErvENHA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46sf4f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:15:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee0488e746so118948921cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766538921; x=1767143721;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=b4q0D7NkeNz/Vq+kmGDFUVuJ8S7w0kBYhBpQhZWbzPc=;
 b=gfRM1fUdt+/GZdcr74b+UGefU2x4Ud2IiICqz04CclT6nEUoFu/3m2TQrxwO2p37nN
 /bWT7K7jipF56uJ1xs/h/BAGboqNAoryeiOTfRBnYZmmzbOwYJyUmciB32nL0NIrDwB/
 eQ/Gv6Bmg8lWSreceu9p5ki61i/fhE/yfylpWHKsa8i9KEbwbEExXB1SmmqKETy0y/hK
 4YBbwneVcMMqFz6CvG2R6BTwXfVl6QcrxBVj48A77uB73dEoxkLawROII33AVq8oaWtN
 tvqj3frHSzDrEvv8uWdEvCTG7gZS6RsTzM+1T2gKhI1BdbiFFtH5EmAeNLEiAiN/YNCr
 8Jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766538921; x=1767143721;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b4q0D7NkeNz/Vq+kmGDFUVuJ8S7w0kBYhBpQhZWbzPc=;
 b=guhkfwDggTjeK/uviHl0dnZChPRbDasl+6FPalMoYayTX9SfnsdVgt0/dn2CyPCvFQ
 6vNxL6XbUQ8vaVmswUrCwX0j3IMRTVA0Kwv3LHZA2nDU9xQhhq/KYwfh3jINr0KocnT0
 giVFeI0cqY3rTuzbu3qArD1GVIzO11iq7P6nsMBG5Adrf7wObyW+HK0KvIBr2PsS4I/m
 Tj1qkt6OZ9W4LCXbVLaOL9XBg0DVVs+O79KTyqnPJw3QQ3kMraHvRQ6EcqejVgXHvm9P
 CLwzrmKnLmVjHXxy4hnUAwFNCo0URGREkyLoru32g2jtXPwfs0WC+qxhhoogC2rUYp6M
 +Csg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTVTqtA7xRS2poLYdMBdsE/fUPgxWY2/mAG9p5y3svxASUKAskV0RDKePqbXSd5R753TVblKe+v14=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz3QaLIjahg2a69pd7JkRzZAS+B+P1VF+cjlrHDoTL1pW77qfH
 BhubwDA8jmjCIrRSu4BsWjr5vUI/y8dqo+EmuZhPI7ZAulAiiGQJkauG/yUDeicc8oK0obyDOGz
 tnVKiBjPnLhioJpaeZWYQZFZmCAyMIiQfPk8AnmuviUBp6x7JbdO7QCaFrhFn78Ok/R+MwYU=
X-Gm-Gg: AY/fxX4ipcuI5XCOM0xjgE37jvOKlIrIa8DZD726YAtS/pedlP15XaGgEWqAWuakEtt
 k5ICVbeM1txhWIus4QYMLw0KWfLpfHmeB11m95GkdfJgoBvuB7CGIHj0uMvL2atUW4g1iShCXj5
 lw0G4lBJMBaexDwEjuOd1E5D0W1wCB4GkwXXgPr9ERHsSqmtMYOKsbdomxYnvtGIzzIsRh/dyBs
 Rqu60xibpEavX9g1yQW2PNkS765hJ9kxmwrqOt3IqqBsi+nDffwwLnfN/Wr+Oxbac1N8p1SpAca
 cj0hOCNQWgarkaa2av/WJ4VwfgDBaG1KYxFM5cZfqKhBbUbzUrcNJ0Ljf/MTF0Zp8LnZ6O6ti4M
 cK0yKLZpLPZY9FWEG/DZpmYRD7JgmcEjjXwbL2numnDbIjvAsTyzJ1RPQCI6zy59nzpXy8OvoGz
 DBDBcPC4y0BCamLQ4e0yXXMqc=
X-Received: by 2002:a05:622a:14e:b0:4f1:8bfd:bdc2 with SMTP id
 d75a77b69052e-4f35f4839ccmr294274481cf.41.1766538921352; 
 Tue, 23 Dec 2025 17:15:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPlJ0zgIqVmoR8XF7IVmAXnDQqrn9yFgbRvLN/shgnJZxjSn85jMH0OkDGhlGF5xTByPJY9g==
X-Received: by 2002:a05:622a:14e:b0:4f1:8bfd:bdc2 with SMTP id
 d75a77b69052e-4f35f4839ccmr294273891cf.41.1766538920925; 
 Tue, 23 Dec 2025 17:15:20 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18618cf9sm4591517e87.57.2025.12.23.17.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 17:15:18 -0800 (PST)
Date: Wed, 24 Dec 2025 03:15:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 07/11] drm/panel: Add panel driver for Samsung
 SOFEF03-M DDIC
Message-ID: <5rcsiogle5hczm3unxqlhhcg433rpkfhx7herfl6pdgdhh7tzs@ej3ell7c4nt3>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-7-82a87465d163@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-drm-panels-sony-v2-7-82a87465d163@somainline.org>
X-Proofpoint-ORIG-GUID: HzQqo_85F4sBs0n_gE0NxY_SM43hsViR
X-Proofpoint-GUID: HzQqo_85F4sBs0n_gE0NxY_SM43hsViR
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694b3eaa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gKpLsENyAAAA:20 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=tnqT5d8xbY2qSbqZTlMA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=-BPWgnxRz2uhmvdm1NTO:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwOSBTYWx0ZWRfX0hZSftzPBJW+
 xaWVBxppLepsx8I1pRGLAx0t1jluLrGkRTfp8c/6nLDl7woo4T7Eur9q2RKgvOLYfQ/9XK8WT+e
 rHGFOK9x8CyrPdNKJ5wb7B9EI5Ub9XZn63WhsGjL58vYlyzU83w8xO12de5ifh8tXk15L3eNGCF
 ALKKy+yeaOAO+Xe7gsQiJOtaS2vJj4s2AVvZV67SIVGe7SzCqe8LRw1VWJInTTatGFr0Gs5iLNZ
 vcCaukpwKpfgA5ADqidaPe/+LQ66bfhz4vu4ZhAq7Xmh4pqjP51Gk1QEQJAM1ccVCK64Pf++fiX
 bBJxbaZpyriCKUzAEH6eOtxLTLSN8hYPibSzJOzqmpIhgI7nD4WLmRs6ScMLsF0umrYgOCqFUAp
 h0QlXv45Y1VeAAytD3gaynHEJfl1vvp2b+x8WeujZPCJrSRPfqvAp5ynVy9M0Gv54bV+jCQadii
 +974236tX+pTTn/bc+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240009
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

On Mon, Dec 22, 2025 at 12:32:13AM +0100, Marijn Suijten wrote:
> The SOFEF03-M Display-Driver-IC is paired with a amb609vp01 panel on
> the Sony Xperia 5 II and amb609vp04 panel on the Sony Xperia 5 III. It
> requires Display Stream Compression 1.1 which allows the panels to run
> at 120Hz, even though a 60Hz mode is available too.
> 
> Downstream porch values are retained; despite not being used in
> command-mode they are useful to artificially bump the clock values to
> account for "transfer overhead" while that calculation is still missing
> from the MSM DSI host driver.
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |  16 ++
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-samsung-sofef03.c | 373 ++++++++++++++++++++++++++
>  4 files changed, 391 insertions(+)
> 
> + * Based on the following Sony downstream DTS command sequences:
> + * - Xperia 5 II (edo pdx206): https://github.com/sonyxperiadev/kernel-copyleft-dts/blob/58.2.A.10.xxx/somc/dsi-panel-sofef03_m-fhd_plus.dtsi
> + *  - Xperia 5 III (sagami pdx214): https://github.com/sonyxperiadev/kernel-copyleft-dts/blob/61.2.A.0.xxx/somc/dsi-panel-sofef03_m-amb609vp01-fhd_plus.dtsi

Nit: please align.

> + */
> +

With that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
