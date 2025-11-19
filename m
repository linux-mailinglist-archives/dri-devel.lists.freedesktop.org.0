Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85068C6D1C9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 08:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA92010E591;
	Wed, 19 Nov 2025 07:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WL+x2GdQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MGEQxs8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7242C10E591
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:29:37 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AINt81m2755265
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=R0I0UG4zGGjNwh/RIuy9/Cv4
 md8bLt+9za1Gu7nmthw=; b=WL+x2GdQEMmowdQurSYGLt+bx6s4g4MN0XdG5Jtm
 0gkXU76EjdeWu6aznZqPR3MrtazsOfncLPxCUc0gnMtub+xmM03z9ruxCdYziC7I
 x0ayru3OONZQuHHuBtxkMrvPh5VPaEVnSaWO1O++fJbWrj/MoA94xFJeevTe2zKT
 +JfAPvOSlyciRedVdqFz68x3PUa+uBnpn93Iv6GHp3vKmAHZ2dcN1A2N7VQ20a/p
 qVnRT7E4LctLhnyVspOA4hMd3DAPbXvkRlXzun+8yJDRobQEhFr4hVQShxhPTwkW
 9w4muAmwEk33omR5A5AgN8TCJvdDpeEWKscEHvBurgRmGw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj3mj7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:29:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed6ff3de05so204563971cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 23:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763537376; x=1764142176;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R0I0UG4zGGjNwh/RIuy9/Cv4md8bLt+9za1Gu7nmthw=;
 b=MGEQxs8n7ATS4xd04/8sOWgmZ7/Dy6AV6r7ismvDzZ7pUJSFJpDC8COQx9PHra2N7h
 pKpK+wHiJsUDO9MpTmdb5UmHf/XhQlbv81LjAzVoxdut/Z3BkdF6pRG+Dl9QZoc4o9kQ
 7LpEi3UJ60Jo3Ji2LETEYAouZiYDEKuAKY5qTZHsjmbeZW+/HEX5t3mHC+UEwiVQkO6f
 Fa5jft43sm5P8mgBjOYY9knQj+gTBjwxeOyrYsiGVE+mf4SuXeUPRbLChm4KxKyP89lk
 tamTjGb0bCx0dcf7ltl+hp29pviiXLfpvD0ZhXoyP3Y5jOpV+8N0jpVe5mAfdxGj6Urg
 PTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763537376; x=1764142176;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0I0UG4zGGjNwh/RIuy9/Cv4md8bLt+9za1Gu7nmthw=;
 b=KszoIBkmb2kPenrzJhHhEXG9S8R3yULqSFSDUzI9e9eGNBA/rkqO2Sc3pAdory15w/
 vapBjvwhl+le3tPzR4salJjg/NtNlCVYJMiRZS4NQSZAlW7A2sa9uD9x5vVui3wjlw5s
 BcgsGymfH4FaZGR08JJ3UUlDIGq+NeCMR81F3y696M+MGXQ1+63lJfBCYRxeF2gxWF6j
 o37nVpQpBzBqGQr/bhVhhjAU2dXROCfhW0Z0hmFGmpPYDnBUT14fm+gA6MFSYfNbbnfl
 3XZbcUHEvKrt9N+qYFoEoEjI9DLKWCWNeV/I2CqkSnlfJ80EbHiNwGd5WTsGNGZXT8Pi
 LiUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxbMCYIAyhtghKTH7AU8kvDc7CrgEohpEWhylBm/bjivj3QEfz4ipKqrxqGDKfi79KBTIbVcq4Ii0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzC7ggG2nf6QuLUDYeXCVldGZoP86yiZRvVEbWgVGttIKKYMdc1
 wXq7IgU4hKE37YwXqGMEJnJY4bwkB6sKMoUFBVeGkqzbo10gSza1kOnhBgdT9QTQXX5hG6QyNSI
 ZZj6W0xfbcOZDZSKFiXgs5sT1YNPXm/uO0DeaPUEKpGKp33KI+sduleZAOf+qJjsJxvEp7CI=
X-Gm-Gg: ASbGncs7AFN5Rc3Z/6w4zE+eGSjPCks9PzE7MjII+CSEImyMFbpuyuJiSg5lA9gp7Ue
 5m8u2KWKgqBs7oYVnfmcAbqSDhBhiR9k3DzM2smlNpGHj7VaXIXSRDxToTPApyxkGBGUyEdWrL7
 sBGuYXD5FyjCP0Yuu05+hzVAknTm0R2r3i5dyfbHJejZh+ofr6BOMM0Jp4eHna8yxGyxPbM2/rj
 iIB0ZwcnWpmMhelLu0fcNahmLnqJV+zJrdNOpARjBi7L0W7rKwy5vkeawSlUFoWO0MEMTXbEDCk
 BSrNqyVkmSZAGpC4unWYRg4KqIMaiY9fEbBkFOniH9jLxr66l1ZjlgEUtdGnJm0Quzi/wwIalwp
 7oUXaeJ1n9tG5AF3tBz8ZODZJ9lOACZtVzm5IB4Vn1qvcx1fh2aFA3jMv1cGNSPJ6Ly1u/lqKq1
 qVhfhL787hNYtmQt52Ys5cqn4=
X-Received: by 2002:a05:622a:15d1:b0:4ed:2edb:92b9 with SMTP id
 d75a77b69052e-4edf215c83fmr244115011cf.81.1763537375837; 
 Tue, 18 Nov 2025 23:29:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFictIHYpBDF3F1JcOpRfw7SDn9ivbKXF+srwLX7+H+SCRJ4BCDfaThoIwHFC5rvT+6K9oHOQ==
X-Received: by 2002:a05:622a:15d1:b0:4ed:2edb:92b9 with SMTP id
 d75a77b69052e-4edf215c83fmr244114741cf.81.1763537375408; 
 Tue, 18 Nov 2025 23:29:35 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b33acsm4552020e87.33.2025.11.18.23.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 23:29:34 -0800 (PST)
Date: Wed, 19 Nov 2025 09:29:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 6/8] drm/panel: sw43408: Switch to
 devm_regulator_bulk_get_const
Message-ID: <nrudzu7r7mzvjni7xt32owix7dd2arpimelk2a73h6eviekptw@fcbvniyakvg2>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-6-317a2b400d8a@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-pixel-3-v3-6-317a2b400d8a@ixit.cz>
X-Proofpoint-GUID: 8q3-h_uATjRkWyI4ws1QkmePwiwU4qwW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA1NyBTYWx0ZWRfXxvzWifWK33Wb
 N+OYTRdjelvV0eFTOFuZ4a6tqOujT+tyUZArZT+ljtveChkEaxVQmQkUr82Pc3hsuqa1Yflbbyg
 OFgbSw1hSq4dMeLQ4prTr4OkZv3Kih010jrVLsFG6uIF6SyAHjY1U0SFT+xKY7zKrEBmbJ5XqQb
 2HBlqOBhBO8SJEuSgsTxDT8pQIqMU3pRGZTiCSaFB6eUE9gS5VsxdN4pQhRQRiUoKX/ttK7n5Px
 5Bg0n3DDKUugJPHrpNnO00XaV5oxNX/0ipqft+cCnhKQO1GN73zwGfLvSJuPjNDJwAQaIdQkJEA
 HVyx+hAPGpfCr1P6MXig1S3EDC3Fcceero6eVZwuEeUg0dMEC+MIZ/1THuN0oGLUGXQRYsq88nj
 5e4mw50Du6ON8jtbmA0NAwMScwJsLA==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691d71e0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dnSpDUa8s3b1Pn1JWGwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 8q3-h_uATjRkWyI4ws1QkmePwiwU4qwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190057
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

On Tue, Nov 18, 2025 at 12:30:41PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Switch to devm_regulator_bulk_get_const() to stop setting the supplies
> list in probe(), and move the regulator_bulk_data struct in static const.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
