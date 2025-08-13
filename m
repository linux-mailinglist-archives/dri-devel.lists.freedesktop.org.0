Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE60DB25347
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 20:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406ED10E07B;
	Wed, 13 Aug 2025 18:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENkavh0m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AAB10E792
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 18:48:46 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLtYG031245
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 18:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=nzjG887+TpcpPmgncHFaqwjK
 5tO/uMDuLQd9TmbYrLA=; b=ENkavh0mabML7ff8x/WXpVF6Riy7+2enLJ8T1NJb
 f8uueFqvBSa01rTEoC0t7WxQjJ6Odt+KNaFJzAzxPlgkAWczkZOdmiNcMFeqdc7v
 8fb9kW5J5lR4XGmWrJ6/IOa936ttVF3KS6/zdSIY3djLlUZnQEBJR55gEDlp5y0U
 acTf9upXDmjmmYM6DksSt4GroChBSNB54XQwQXeXFAD2b7eEYYCax6yMjYffMj5S
 EyK6MhcMf6pPOveP/sp5L4MQBICW0/eGSB2OLNx38pq/tDAOcXLZ4Q1Qklf2hFUL
 Feadq950mZF2wA8vy3Bzt+jNQQcyWFSjOLxW9icf84fRFQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vqv1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 18:48:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b1098f924bso5108941cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 11:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755110925; x=1755715725;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nzjG887+TpcpPmgncHFaqwjK5tO/uMDuLQd9TmbYrLA=;
 b=nT5uak8yB8suW1KOiNJmBiXoscnoZnrfSg6aCqcmE3dGS6W8jUBL7Iq9OUJZaEfx/6
 q9yZI5igUOJ4One3vdapuNzUXsil41TAXEza5qeUeqxomzS0URukJ7rTCDMfXMpPC7E9
 M3LdPdrbhx7CPTUtUCS+3S8FFFWuBd1ix8csibzc2hlG0V4XizNlMobuy2uwv+7i/7Q2
 2+pgKjnVwYLbKA/eHIa1zNs9UVnoaM6M9lpT4AR/1du+oKHvtPoR8tugL9H0my9RBY75
 TYRhYVtG/mcCW0SqhYvJ8nNUr60/D0tDz0hMw0zTs+cYXwsu0kZFtQV1zmtuhdfnkKX1
 oLMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV33y930oxHj/MtMFDUCZWBHySaVEGJTWgkkWle/t0k2lYrgV1xuGtDD1v86wVSv64HVRuImEYdb7c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlZo1N/1m34nogmnGFUzWM+IJ+W3LCc+IBBgyw/v8mG6B1vEfZ
 xjTJ4c4go4kodBvpMCvx76hr0yZhhk1WhkEQOh8WQDggQhhUsdPx1MY0sP+srJ3MRQNEMchrxXG
 PTGA3icyfQeRYfcA6u5sHU2PyZ8J53d+S5dmhjx9eQfKMMiYwUg7lpg60vel0iq7fCiiEhBY=
X-Gm-Gg: ASbGncvJPEa+45BhOsBi2/BLpO/h+4WdUq4NlptmExKuLMaVeGAC8DAoSQvEAaCYOf6
 dCejyA+cffFb9iKegWlCJ20AGiqYW2qj88RrYDF2r3TgXKWH95380Z5ulknuxwDQJVSRJKc9fl6
 8rrzKiPYfwA4sBVeSs2s5SLaYMm/ZiZ1HgVvATKP7lX9Dn/pTGU4NPSb+hXjw62Q1p3n4tU0B2G
 lu9SnzKDetIyAuFSK34XobNh7AgPV06QSUM1B3uoLAdjATG168CCyzKSAbG41oPoCSaNC5ioH7z
 tY4ilgB1vl9FNIMcAftcgf4VbkEJP4pDqRP1ioA2W0WBldQxo4rfAllVNMbryrtYlZaBmKTIM/e
 VHhK96njThLjxSng/n1hegr/BhNzT2WUWg7X7Ga48B6qTFEVy55Pl
X-Received: by 2002:a05:622a:1f18:b0:4ab:4d30:564f with SMTP id
 d75a77b69052e-4b10ac25797mr3389721cf.47.1755110924657; 
 Wed, 13 Aug 2025 11:48:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtZj7q2ie90roefmuQxk12/j/f20h198XGmN/KkyYOEK/ni5a3exApphv1+GAMIRNZyzAErQ==
X-Received: by 2002:a05:622a:1f18:b0:4ab:4d30:564f with SMTP id
 d75a77b69052e-4b10ac25797mr3389131cf.47.1755110923983; 
 Wed, 13 Aug 2025 11:48:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-333f8cb9cdesm316421fa.6.2025.08.13.11.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 11:48:43 -0700 (PDT)
Date: Wed, 13 Aug 2025 21:48:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/dp: remove redundant check on ret and return
 statement
Message-ID: <l67rsnpd74uge4lz2tm4jbrwmn3acxt6cbrj5yasz3x26mt4su@2oqljbabkj2a>
References: <20250813151243.2055798-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813151243.2055798-1-colin.i.king@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfXy1+s3GMyL6pz
 sMERBs1ZsqOVsAgGYZxzy2IO/mQV1e9+PZgYgu6+0zqcdm9ZlK10H24ooOS70zFuiTSDgmgOjpc
 kRrJ31qM9n3YAPNnrzau/zC3HecAfUtg9pwne/IDdd2+ZBs1gJ07gndsFTLmwUpw332GnvvtZyk
 /OUlGE8TlThET0zELqyYaGC2ZgIwfzOVPh6+m/lXJPE7UQ1bORVfVRSr4B7TRiy8GE9ZcLtcM4u
 cAz2o8r0pW8vIIJysP+Y7+kbHO0px1VBArD3hUSbtVlg+r8ClslsXjR2dX+Z2Vg9IzoKZugepFR
 4YkgsBETOfKwWXYvqjBXMCZP+asDUGxEAMS5uJmIWw10DskydJyWcNJoYJ5YbAAPunL7Wd7Jrfj
 1wL+LhwK
X-Proofpoint-GUID: HoscxfmnHau2lV3atGmFG-97gZgkwj7R
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689cde0d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=HYx7VuEMISGMiPhQd08A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: HoscxfmnHau2lV3atGmFG-97gZgkwj7R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107
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

On Wed, Aug 13, 2025 at 04:12:43PM +0100, Colin Ian King wrote:
> There is a redundant check on return and a return statement after
> a previous return statement from the call to drm_dp_dpcd_write_byte.
> These statements are redundant and can be removed. Remove the
> statements and the now unused variable ret.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 5 -----
>  1 file changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
