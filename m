Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6C3BAE7E0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 22:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5184D10E621;
	Tue, 30 Sep 2025 20:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPAcwORD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC49F10E621
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:06:20 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UCQOaH027330
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=nnCDWQBx3MEUkPGk1nPDrYBk
 0/iZtvd9WsbeqrQ9y0s=; b=pPAcwORDhNc5V5kCVRdy1IZmLTHcRoUgyba/fmd3
 LsdcVm9mBl23+/rygXKXLx4xTmFejhl5BRVUieYfVrucQZuz4UUt1acQc6HyTIyO
 RPqAXMPfwf7YaC7RTcJr4ZV3JkbbSxBKxh5pPWHJSWSsno6VL8fubM/sxLmOXb6M
 lWHGcrG0XGpyEMF1ttNJPNALUy6c1JR8Qk24PVus9lvJdbntQaG2hFR+Ln+FlgUF
 AyOiJsXXSybd3jMHrCKtl4KLiRcraBsEtSM4sCTFmWu3LWeBbK5TpP8rLv+3bwAG
 By3BP5CkBKpniG/bunzzytaqAcm5eQROG5ldQf3aestZ8A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf3w1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:06:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4d91b91b6f8so100232461cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 13:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759262779; x=1759867579;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nnCDWQBx3MEUkPGk1nPDrYBk0/iZtvd9WsbeqrQ9y0s=;
 b=Ub/9CZwmnx8s2ejLf26jehPG4v8z5MsY+2lr6f++1KFUr9ID110X7cCwoFVD/ZuqC2
 RF6bJfh0KDxDMc55GAhFCSIY3ih+is35bWB+VmEIolZMaCaKhYc+Q7bsPBRN/PgCD1Ew
 ktQsIcyNtGJxKOgdWFACNOwvIJ+llP1TrGzSqLqiuVLYoJ9munsDd90kkppD4GAohr4q
 UXCnpJCdR0LVgzu4e+yzhajMRYWoojm0ZOsLnZ1vTtzVe5W4oJEsIpc1hzst0sFsZlRY
 3b2GhILu83dSLakbGl9yolxR6U2blIJZ3HW7WftgGF4vJDqJiIYH0fyv3vh4kjWFGj67
 luhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+90uQLdxo/Jytyf/jxl+q7m88KC94qeyM/M0nv5BAGpAN3L95DvTJWoSJIyHzeU0cB3lda+9GZfM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3plHCsFiS7GRCcDqXpyo4+/gHB2ZY9uoG1+3cTpaZniL752Qb
 e2Z65rC+PjaHXRtvYoea4UBSChpfmcnZ65+JEC60LvVYI54VZBich0DfOR5uTMPcT414wiWF7pF
 85v4pyHNcYFwRZ+t7oHP3jKS1SJWGXQtOTMzE6d/yZ44CbGRENf0uMnp+l/80lcEp5rPz5BU=
X-Gm-Gg: ASbGncvBcAjHGql+K4weJ6sdXLJBGkoW/SENqb7kKMTZzT/2Aro2Co2yHwUFcRfctMm
 w67XSCg9Wn5XHpEbkCJ8Klhk0rYP0DfcSJvtx4H8GL7bGE0HPi0kkZEh8/cVnOp8r4mga3Q0Rbu
 Exlql7WXg6/ISoRKp5Y0nOOtJJ7AgpXnuS1jA35JTnjR2tixyu7vpflMQemRylROiNjJqIHI42H
 hOajQntD7+Me+4INzlaNtRkT3eJxkFQtgh3bcozKdHmsw7SiWTE+QiZ8B5GSQX6LHUASpDprsTP
 uU+PldnsfIN53bQ59ZX8auRTeV7ViKE8RHvl1G3SCRYkrV6OkaCSVpa+laIvXO8lHcRgyNW84ah
 83NgfxD5RoQL5fRkCEDs3obY9icGk/sA54OjV9d7Bg7T7iYHkKHd8qSZNsg==
X-Received: by 2002:a05:622a:1f06:b0:4de:8e13:2ccf with SMTP id
 d75a77b69052e-4e41ea169c4mr13229381cf.74.1759262779129; 
 Tue, 30 Sep 2025 13:06:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExAC+gjWYrGkYGyC7iuQx0n8IkXtiwE5ml3GBXLD2rdjXMDvnTqbMjAoTH934KEvOlO8Ctyg==
X-Received: by 2002:a05:622a:1f06:b0:4de:8e13:2ccf with SMTP id
 d75a77b69052e-4e41ea169c4mr13228591cf.74.1759262778420; 
 Tue, 30 Sep 2025 13:06:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-586048c815asm3037274e87.25.2025.09.30.13.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 13:06:17 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:06:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
 linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] ARM: spitz: Do not include <linux/fb.h>
Message-ID: <atoda7fiaw6xxc3arfg2rvczt4ezhravwogbshvca4dsr5kjqm@vjj32eqjxkwl>
References: <20250930112651.87159-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930112651.87159-1-tzimmermann@suse.de>
X-Proofpoint-ORIG-GUID: _U5sDSMh1TuUY63VCWgqq0wQHI0odLvv
X-Proofpoint-GUID: _U5sDSMh1TuUY63VCWgqq0wQHI0odLvv
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68dc383c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=al7qi2xbfAQSSKGDXgwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfXxM2wWEkKRv7v
 8yHB3ND3UygGtS3IK0CGCYNmO6ayD6qDjCqXiEDAV5EwqcgOJ5j0wNSu/bYPFlfq+S65MPyD9P/
 LqCPCQIOIOZqQPHOkYYCvQv7OIaYzPYQEDuif4epWNiH5i9/R/gA52pLu6whrw/GVfF/SEqMab6
 eaRRwQwub7/Y+OkUfO1BpDTeHk/p98SjGwlxVSpOcYo0r9OlUxNMUXqtKG4dencpkLMMWRMTXFj
 Oxxam8Qdk3ICuJOfhwS1QLXWaHIyQG2GqAeQa2m21ezobXdC/UdxzvYhsd0FGaP0YIChGfSOiyt
 bCtkF+/a7FxQ/B8Wrgf8XECdu93WKgfLkoF7d+A3wd9QZojjoDBe9a0Eg5ss9IQufzNNMPihBEI
 WcAJkB8XEbIK///QrpR1LtwlUOTxrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175
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

On Tue, Sep 30, 2025 at 01:26:46PM +0200, Thomas Zimmermann wrote:
> This ARM architecture's source file does not require <linux/fb.h>.
> Remove the include statement.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  arch/arm/mach-pxa/spitz.h | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
