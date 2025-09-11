Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 336BBB52E27
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 12:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9F210EA6F;
	Thu, 11 Sep 2025 10:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKIp3dlw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2EF10EA6F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 10:18:14 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2J1lB026485
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 10:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yQ7eGaeHD2W25fWHu/CUEy8t
 9Pdt7I3zN4P62KgjDEM=; b=BKIp3dlw/AbYH7/fl8yZAJHngdV7TvUlSGJKmXv/
 q8f5IZc/orfHnbwpVQ9WxNe3uRSosOpPXBVi/d2nVgTfjIvZEjESS/edsY5LM6aT
 1+LyQbxQnwqnLdJcnXzRVwcnionrK6L82iFpH7vdB1vLxHgOIRiHi9vpSWKmeYz4
 g4CMW4pfh+dSElcFQfaI4JMOA5JrotRr6BbJvnrWkLFLDXMpAaSVf4zJxd0I53jn
 ySTEfjm8rjtjoljwI7l0v8X2t+Rjd2L5FqLL5gvIvM9EgvxELZL3ltl91p3e7Cml
 Ge9aHw7RcPANLYlh8+eqw6L7kDg6w2SRqko0UHpAYFkOcg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0y5r4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 10:18:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b49666c8b8so11206221cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757585892; x=1758190692;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yQ7eGaeHD2W25fWHu/CUEy8t9Pdt7I3zN4P62KgjDEM=;
 b=lPRn/HMdextJcPoe/JMGX3q2XnrjBzbEedxcDLTbIHD1KLBuk7dbthDW0XRBtuDMvl
 a9rIBZBZ3mxVskxiDg5fKLQBTfrsCRXjaq70RVWRfnk5s/0XfVGYhO0+Zoo5UJU5wCWl
 ESsFEqZoaZTxAeYhWhuvvefErb6D7CqrBFYSUjq1jUWaSPasRWRRTEJ/t8dl235nC9fC
 l7fz1Ec/mtsZMiMQTtphno+LixtHmZXsf8DlYVFK6tNwwBNmalkPNUzrtrEwCP++cS8r
 KU6t7OEh99L/fpssaDXhFMmKHWEBfjn3Uvt+NHFmU82x24R1eUq5eqOaBMGOBXFduzdD
 IHGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpEnqS84BEGvb9de7DQTU62rxtCKVYPPeHqbVlBq1mO7vrWBum3ibjyphlJs5quMToCwaeGSPJTqw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwGZD1ng4R+jA677eh5wJm/JbY1T8B1gp+BJcskKR2jY2Z43bj
 6VMOtk+4Z8lxSY+DznOOoLco2sOgG7EeKG09zcijgJwQ42/ojofQ7QHfy+gZ2G7cV9J/UOHdv0n
 IbcNKU+W1/ELRez6pDlEZOHcIlKlx/F+uTdOUOAehF1tTCHGhRNUoo8Mj0ThZgHAGfUj/anQ=
X-Gm-Gg: ASbGncueRXvubSsRpCP65nA8yqozBaEwGOxM7kTAM9gOjmYaJ4U+cMJaXUGfyyyTEai
 3x0tax/jWpWw2bSS/7ir6kxfX2SvVGbNvppHquZlgzuCdwPqVLbe2HyU9sm3GIDf+Xax0V+xmjr
 ovRu+rKyBwTUfF6r5I5VNvys0Ei7Z+dR8m2HKgwbqGOX24uXkmrUMzP9BO7QUQ+q+P8jP4DOULJ
 jluiPR9seMAd6UxE0k1jO5oaGgBvXenRN5/RHjW1j8OLu1LDmloHDww/CJX1khDlkPR33It4uay
 4QD1/vjhU2f5TLZAdNqmhxNi/MdZjrEcUGXoUX/TmQmD5YU4wDZQpODY+rd5WpJBvuoGQTs+iE2
 2V4E4VKtu3jQkWz73qi+Cempp9VPTX1OeZrh1xjafr5/SEAeM7+rR
X-Received: by 2002:a05:6214:f63:b0:70e:d82:703c with SMTP id
 6a1803df08f44-73941de3724mr196743166d6.49.1757585892540; 
 Thu, 11 Sep 2025 03:18:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsOmB2XFPgQT9DyUDIQt1+knYeWF2UKGh5Y0A8jWm74XXGJpVfSrAl9dFqT+4Zyq2jcp1Neg==
X-Received: by 2002:a05:6214:f63:b0:70e:d82:703c with SMTP id
 6a1803df08f44-73941de3724mr196742746d6.49.1757585891942; 
 Thu, 11 Sep 2025 03:18:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e6460df53sm326693e87.109.2025.09.11.03.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 03:18:11 -0700 (PDT)
Date: Thu, 11 Sep 2025 13:18:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 drm-dp 02/11] drm/hisilicon/hibmc: fix dp
 probabilistical detect errors after HPD irq
Message-ID: <cdmtfluxqes3bv3t7suctbajp4jmpih6fhegkbf7mxvy4umzrd@rtpupear4el2>
References: <20250813094238.3722345-1-shiyongbang@huawei.com>
 <20250813094238.3722345-3-shiyongbang@huawei.com>
 <aayi7zjrmru2ancexrqmcutams6ohde3nrkhqacixwp45dsk4v@7ig6hqzahdxf>
 <1dd93bb7-4f67-4b9b-8b6a-d7c5c77cf807@huawei.com>
 <ce47v3y77uc4dunlwyvmfe6j7d7mza4zfrbvu5dz67t66jdlop@vqgv47saj37i>
 <8bbfd02f-138d-420c-b456-10d0c913f46e@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bbfd02f-138d-420c-b456-10d0c913f46e@huawei.com>
X-Proofpoint-ORIG-GUID: ZTRHbLDvEj5vmafpSPJIV0VDlsR9VVVy
X-Proofpoint-GUID: ZTRHbLDvEj5vmafpSPJIV0VDlsR9VVVy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX9DK+tivT9wT7
 BQWbMDk0J8fSPyTdn46/7RI9P5oTyebAB1J4hk2oOEXMvdzvE07Tf0OvtMTnOuxAQRuhCOYus0J
 tx+AxRLPMdwKwqlRBHGNOHD9K3EHf9AuWRITPKRp44a9kC+iEbi/47AVG4+fO4UYt/M3a4oKWDQ
 rL91lvM8T1eJUUUBo7E1rkayBoAwLA3K4pv9RVFtgoyOAz+wkX+6lj+zWnjD4Ss/ZPLbJ0UGlrt
 0j/1yu+VkDJMcOqoIEDjL6l7OuOjl61cR9GY04RunQTsYwdBCXRPxi+3gTki88YOWu0UpptZwPc
 JKnoNRboUWR21bGEJSyFk5EKVLMgqGAkxOqku8avB5DRkOx2dYoAh2DMbYpPFOq1LNxkbjXEdXs
 HltFuFOZ
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c2a1e5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=i0EeH86SAAAA:8 a=Ij9o4XEmEmbWDCisxXoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

On Thu, Sep 11, 2025 at 05:32:40PM +0800, Yongbang Shi wrote:
> 
> > On Thu, Aug 14, 2025 at 08:19:41PM +0800, Yongbang Shi wrote:
> > > > On Wed, Aug 13, 2025 at 05:42:29PM +0800, Yongbang Shi wrote:
> > > > > From: Baihan Li <libaihan@huawei.com>
> > > > > 
> > > > > The debouncing when HPD pulled out still remains sometimes, 200ms still can
> > > > > not ensure helper_detect() is correct. So add a flag to hold the sink
> > > > > status, and changed detect_ctx() functions by using flag to check status.
> > > > THis doesn't explain what is wrong with
> > > > drm_connector_helper_detect_from_ddc(). In the end, this function
> > > > doesn't use the HPD pin.
> > > I'm sorry about the misunderstanding.
> > > The issue is that after plugging or unplugging the monitor, the driver takes no action sometimes
> > > even though an interrupt is triggered. The root cause is that drm_connector_helper_detect_from_ddc()
> > > still returns connected status when the monitor is unplugged.
> > > And I will fix the way in the end.
> > Can you perform a normal DP detection: read DPCD and check that there is
> > a DPRX attached and that it's either non-branch device or it has one or
> > more sinks?
> 
> I'm very sorry that I didn't get the last sentence's asking before.
> It's a non-branch device. We just connect a DP monitor.

Somebody might connect a different configuration than the one that you
are using.

-- 
With best wishes
Dmitry
