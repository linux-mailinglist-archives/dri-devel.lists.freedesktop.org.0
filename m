Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81727CDB25F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 03:18:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41DB10E318;
	Wed, 24 Dec 2025 02:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8/7f4N+";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhgpvGtK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F141010E318
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 02:18:37 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO0ffY7559790
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 02:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tQh2uyWtEkYSbjZSvJtcdk3s
 4J7dVAuke1UBIGUMQ8Y=; b=o8/7f4N+27ErkkhenfoZ0tzOz0EXDlwC+7ogtcdt
 eIS/92TzYJEtVLZD3RVoziDhGaPScTu5iel4sEMlG1mSLQHWkCfSAfihwWOWOx9j
 BcoLko+UQ5MNIvAP05Rpcm030xdgdelXhnkKW//g4tzNAl1OLcXVq8W7bsVi+SzS
 kqxOFzHPAI9wFczpD2RP6j5v9vhADcqdWAZxpAdO/gcdElEVqVVndNuUQAvSGOUu
 mu8K30g00dppK+mPXMzzOV09a8EJBJuNfRdJmJzboTTntxOakFNBu2X/lb6OVWaF
 95OI7eaBZ8cDAxSPu6nV4mdYxANdsAQpZu2e+mDFRAmO/w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9ct3ja-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 02:18:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-880501dcc67so208901146d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 18:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766542716; x=1767147516;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tQh2uyWtEkYSbjZSvJtcdk3s4J7dVAuke1UBIGUMQ8Y=;
 b=BhgpvGtKayzBa5c8jrsnjkm2+JR4ft7VDDmQTn8MjIx/3ujUo64O+0F6YBUF6uSef/
 nkby5llFmNKwK8NkcYA41p/XNYl791W8i38MgSPNidQ1B65FuZa8oZHVho416VpA4azE
 ej0hEZv81CFB1Kf+BvrQzBAfqgfaGOQ5Quhpi7blIOA6wQJHsh3Rt+4FdDqxzb0JNgZ+
 ZIXNmE+PamVYtWvgXMIuf6PQNJ3C6nvyESek1lAvzlM8hs0J0w9v1DzCI5DuUZxu7EKc
 Gv7KYUuOVQtgPdeL0QIuME7Govw19TZzOlm4IVQbSZWHnFHET/3YdtDRawGBBsy2qvyT
 AbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766542716; x=1767147516;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tQh2uyWtEkYSbjZSvJtcdk3s4J7dVAuke1UBIGUMQ8Y=;
 b=koIFU2xWS60bMO+5cXNHfu7B9MSwhjguAWYgEt1e2lDvF+cUbfwBMqWPRf6+1ysyw8
 LhtvStNuf/k4Dc0DL6sD9LUdaLcUcaXfBUiEff88/0kIgk3e0YmlWJ/Ntdrmuo2696c3
 iJQu1GjuotoY4rG90w7JOjW7QfcalCmkHC8vEsE84Xh4Gg70ynm/I+askGFZIxMFv1DT
 LyruVSH4toqF2c+CLt6MujlM6Sug8iIX1N+6O7+bp9AG2WzZzywL1zSzF8affB/IAqBu
 6iKih6JQwyWZKzRB2ZncxWSBrxGOXCo8ukr+O1GJjY4MXkj0kJ3yNwEbPgB0IZ4d48z5
 oIPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMYrQvASlNjGfh1LhrkDJZ2oMgHvi5KoSz3CDy0wjLQDaD88MRLR5I+fvTD2yyT47/U2Agu4bYFOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyo4sbyhEu435JcmUAqXxtCg/iwufoISMDXVUewgbYwMQPtm/Px
 Egy+Rs1V+pjPSKkb6Omhu+V+gvCHi40Dx2sSauRJQfgApp9wWvNm5WaIMu0neZ2t8NjAgPUewav
 0eJQTqKVS0Cc6IJ1z0d+jp+th53iTf6H1s4LIzF5IAsaOtm6+bzGTmrLuaPJfKp1Qk0K5KrA=
X-Gm-Gg: AY/fxX5nrcXQWX7AEymc4ldfyZSMdEE1FTHSkLXLfcl4kJwJ9sVMr/BVCBwNAyYqKga
 etDmwvJzjVCuxiHpPrCR95/AW1WtXKQE/Rf9Z58oPc2DIvAWBlXBZeGLIjWkX82h0eVvdTx3bLy
 8dh8P4hnnjlez2AhfQNnsFGRa3N/R9K80SGL+4G01iR+HXgEGzUFUs4tLC4TfU8vSo0SUPVutdT
 kiS9AH92eVCM06O/Cvkc10xwLX2hd+LfKBCtaY/JQ1UU5Yi1x0JBX3TISSoo5q0GYVP/0So3qu+
 IhyyYqzBWl8zJWimDw0j4hV/SFI9RPRTix9W5R/3JLuRIU4H7OpEsX84skwjsZHmFZdu/wmMO3r
 am/J2EG9b2dN8S+iOfxbfz+AFGYBGR8bZiSq9jfX+bG3eKPULnQ1pKsPZ7Mesb9XenXBftpM=
X-Received: by 2002:a05:6214:620b:b0:882:42e6:171a with SMTP id
 6a1803df08f44-88d85e98d6fmr208912886d6.29.1766542716344; 
 Tue, 23 Dec 2025 18:18:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHce/OgseXundlepJPywtUfFR71gFQZx99NpJKoPLugRkc5EhYW+YXWFPBqYlzsNAVukmJu7A==
X-Received: by 2002:a05:6214:620b:b0:882:42e6:171a with SMTP id
 6a1803df08f44-88d85e98d6fmr208912696d6.29.1766542715942; 
 Tue, 23 Dec 2025 18:18:35 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d997aef2esm117824486d6.32.2025.12.23.18.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 18:18:35 -0800 (PST)
Date: Wed, 24 Dec 2025 10:18:23 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v4 09/11] drm/msm/dpu: Refactor SSPP to compatible DPU
 13.0.0
Message-ID: <aUtNb1nkpfa8hSCA@yuanjiey.ap.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
 <20251222102400.1109-10-yuanjie.yang@oss.qualcomm.com>
 <bqmk32aahvxzhpzvtzpvxcbstbrozjocmx6enkry5z7owdavax@7xtgdizvjomt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bqmk32aahvxzhpzvtzpvxcbstbrozjocmx6enkry5z7owdavax@7xtgdizvjomt>
X-Proofpoint-GUID: udrD_CnjAnFDUinApPKno_wrqCX-NVHW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAxNSBTYWx0ZWRfX+r3+MARI48E4
 SKthxG/5CbEse+FZd8w5RTAXMBFH2OMNmaiwiL8o47acES9cyOIzfHn0d6IOvjurgj3J8RxfjR3
 4zIYMxbtNK/NWhxlbEfViwQ7NqdMI9vk0qXRI0rxNbfeUqKKgOCg3nOkV7CJo7xdBxoSenWaN5n
 /QY3h4k5rt+btahzaGMgQOu+MnU5tGvbIBKVUhiB1/YF1NCJq2nFMcWHYvaQzvbx3KdCVQc8sE7
 wd/tdLWnkF2R9PiKLAlB/iqyQzh92RCb9I5FIXkR3HpZuRmWRlEqvukrDCzyNgBX6m6hhgPD1v0
 C50u86RhGq1+L81hnwOU0WjP6zpsI0dcgabhGt7S9LNKzJmEuVCMHnDhCI0DWwj20mDknqKKtDa
 r9BlRJGJBz21/JDIKTSwCpLEFO5HkI8iqSgWIVbiYWaSvjVBFQJObUCQLLtLa7pnnA4sQRPwalr
 Mbe9pWL6rLwk8U+NtmQ==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694b4d7c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=g2-dxqoBfl5MPgs3cbgA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: udrD_CnjAnFDUinApPKno_wrqCX-NVHW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240015
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

On Tue, Dec 23, 2025 at 10:26:03PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 22, 2025 at 06:23:58PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjiey@qti.qualcomm.com>
> > 
> > DPU version 13.0.0 introduces structural changes including
> > register additions, removals, and relocations.
> > 
> > Refactor SSPP-related code to be compatible with DPU 13.0.0
> > modifications.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 110 ++++++++++--------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 +++++++++
> >  3 files changed, 130 insertions(+), 46 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index 336757103b5a..b03fea1b9cbd 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -208,6 +208,18 @@ struct dpu_dsc_blk {
> >  	u32 len;
> >  };
> >  
> > +/**
> > + * struct dpu_sspp_v13_rec_blk - SSPP REC sub-blk information
> > + * @name: string name for debug purposes
> > + * @base: offset of this sub-block relative to the block offset
> > + * @len: register block length of this sub-block
> > + */
> > +struct dpu_sspp_v13_rec_blk {
> > +	char name[DPU_HW_BLK_NAME_LEN];
> > +	u32 base;
> > +	u32 len;
> > +};
> > +
> >  /**
> >   * enum dpu_qos_lut_usage - define QoS LUT use cases
> >   */
> > @@ -294,6 +306,8 @@ struct dpu_sspp_sub_blks {
> >  	u32 qseed_ver;
> >  	struct dpu_scaler_blk scaler_blk;
> >  	struct dpu_pp_blk csc_blk;
> > +	struct dpu_sspp_v13_rec_blk sspp_rec0_blk;
> > +	struct dpu_sspp_v13_rec_blk sspp_rec1_blk;
> 
> This is a refactoring patch. Don't add fields (and structs) which are
> not used inside the patch.

OK, will add in Kaanapali SSPP v13 patch in next patch.

Thanks,
Yuanjie
> >  
> >  	const u32 *format_list;
> >  	u32 num_formats;
> 
> Other than that, LGTM.
> 
> -- 
> With best wishes
> Dmitry
