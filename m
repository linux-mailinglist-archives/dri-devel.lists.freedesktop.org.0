Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CD4CE0027
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 18:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71C910E6FE;
	Sat, 27 Dec 2025 17:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qjy2qRXg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aufqzuQk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B1F10E6FE
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 17:16:27 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BRFgc8B272216
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 17:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=OHTNwSpgqtc4hs87hHEPCYnK
 Ihd4r2jq6fJZXGf24IA=; b=Qjy2qRXgD7naCyrBml4c45ess+keCYkLSFQ1ciUJ
 SmvxVMzBcqIKffWVfVFA+GNnH8ucUFS+jGmtkKhO75UK0MxbZPc6D+AuXZ9zyVDS
 bUPy/2AliK47N5MiziAOfux1Xyf0gxM0TGlBqYIUOJ+azta+dxl2w7N7CaKbyOg/
 WypP5RDCxdu/OUwyLzmzCEYg9XKnR0Tu3RKHFZMrd+n16tlFXUUCeKxqNyjjKqde
 owXKfvFRLc8Yt+hG2yHUbp3sBuw/nzq31AoLE8Q++BJigUAtVFv9Y4zG3NYJ273P
 LvwznRCcedLdws3+ggV9bPs5XRUErWtG/70h2HqLzANj0w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6dr0ytg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 17:16:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4edad69b4e8so170691241cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 09:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766855786; x=1767460586;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OHTNwSpgqtc4hs87hHEPCYnKIhd4r2jq6fJZXGf24IA=;
 b=aufqzuQk5McdMoWc/rmPPqQhWGKzdvTJvTzl+BXFd6xWscBJjkui+P8H5+GpLi4okh
 miRIBlOAKZjgDuQFONNMOPN9pTAW8iYnmgjpf1RG2wkrFQbPUt/trQzDT9a+tldzj/ft
 bjTUf4FBHLDdfYyJNoZXNfaYAn/gO4XQSotlrlpDWOjtM1u2AcEp9a1CF3AHmKboFrzs
 vut/VD7G+0JbO/2ArOCCmOeNWjLGoyiXsDXvytNVK/NwrnBI04ZStW4HrB3eQLd27Rau
 o0WEZ1FURxmj8sWNw4cU26UzjSgYoZ1PeulCS37CgT7nINcyK/hEJaHZdfsII+y267vV
 Deaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766855786; x=1767460586;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OHTNwSpgqtc4hs87hHEPCYnKIhd4r2jq6fJZXGf24IA=;
 b=jxsmIv/cbEa8cR2xqS+JHu59XKx2nN384RvZtpxGXWb7NSnPXK1mV6ySFZaF/100cS
 PEYQ0pXN2MlonBIVV227wSbBIIVe2preTuXUdZfIhEOIWAw8H3SGf6o6AtbxsHXVNNXT
 umOQfyR2S49rqEMRhYrvFjfCct/2DuuYvdJyi8mI/n1G9u+ng6bIjIMdAjU66SwHOkkl
 +rB3s0Qez1VvSL8iKglrX4ULw4GiiSKvkc1wYFDL3Ow4GXbgjCVuLjS6WSh8lxLanJfX
 cmFo6PtulklLeh5RHZEVGsfHXC4opNXHTp4FRiK4on37LYm4plT3JTm0HJgy/tRRU2XW
 MlIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOkgeA+R0dXg162PO/AOlJABby7ZV+lGVs7FC2CnKHp9AyK6rxkd5hy8V1loqvJATY+iZAYJLCSJY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6wa+VT61QKd0tlzsSH5hPjiT8oRotyOJTJeAeJ178pZJy5tu5
 B59vfJ9wjgMvlK6+6KTkovjQC89J5mLeKhUe3B9t7I4tRUFVvX0KTWUSjZfqsj/0G1TTCNNjNKY
 KwRYoqXL4bLwaNYH30N9kSdhHhCT/9k/zMp6l+ATIPvbmBFxSjXQNKYT+SMmbw+oWETQNuds=
X-Gm-Gg: AY/fxX4za3Qz1QBoWR+CQ0Z2pNNYOxwGi0+u6AsvBZ+mzT+nfdkhs8ZnakkG/qwbh8L
 zfOYLtYK5IOzhi0KhO+jlVviGT50Wn8pUBa+La+qwK90tD0Fysh7Ke5sb1AEs1FU7O4POGFmgDY
 anslFBNuhTIkCe+jHh4zFFMRbD4wVgvbUG6gF8PFwXAZRdWOzy/tELqyt4YjY1+FasLkOAMFq3n
 ZAbfXHfcYXK3tK6eE2O8KJv+KNst0v3VM/FHkVleVlJO0FDeHXA3DTQSgu3tqea5acEGvXa0dMC
 hMvbjt8nMXdGpUysx9IxYvGNoPPb9IzgzaxDOuFyuvXMqFgB8kFk8xBDm5/JKzE7TfuYNkEZciF
 HZxn4+EXhXMBGbYT6sUIj64y4QYod/hXx8zhVgdpyjVHi7HN6CosVMaWSdMDv+uItlZffnzYvbv
 KeMJQ2gXiXgy+yAiPf2WHpjQ0=
X-Received: by 2002:a05:622a:344:b0:4f1:c1fe:ba3d with SMTP id
 d75a77b69052e-4f35f3a0de5mr436647071cf.7.1766855786207; 
 Sat, 27 Dec 2025 09:16:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaVfWYayzuAPhuBrKQAY3il0uhSUminJczgemb5HUYr4w8B2G/OkItgknctxpCiE2WadhZRA==
X-Received: by 2002:a05:622a:344:b0:4f1:c1fe:ba3d with SMTP id
 d75a77b69052e-4f35f3a0de5mr436646781cf.7.1766855785788; 
 Sat, 27 Dec 2025 09:16:25 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812267964fsm67171161fa.42.2025.12.27.09.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 09:16:25 -0800 (PST)
Date: Sat, 27 Dec 2025 19:16:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v7 3/4] misc: fastrpc: Add support for new DSP IOVA
 formatting
Message-ID: <hvjbohxvyogsxkt2wrzdlzlbodjtqybyxyt7bbp67xq7qbs4iy@atbtkdltnhzp>
References: <20251226070534.602021-1-kumari.pallavi@oss.qualcomm.com>
 <20251226070534.602021-4-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226070534.602021-4-kumari.pallavi@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDE2NCBTYWx0ZWRfX3Xtojd0T8Mfm
 eTcFoQcb7iDYQ+dhsWrgVAR4iDv8cjOgIIIFOOERmPnvPzQC0mIBNMugmhJmIvrLyDlQeVh48uM
 F/ZrKYUq5vWywuhWBGEQW6qoadJUW7ocu2fTAZUr0n86PfXqCEk54t5s2UBf2Tn1dVGtdo2/5w/
 fndGeQxLgRFNKyVOvREY2N+MU7Pc24jVR2lvceNzu2IbYie/GqRYuqJL83wSY4prxhAhel2r+FP
 IaheuKkmEWruANiach6Ch5M+btUhxKChEapiU37Khs1dkYNLQbCTqD5xhIYp9UtL2ksOMOSHC9X
 nnu+UypeoEt+zZ5W42ElIgP0p7Fpp+uQzWV6y4Xa923TkpzLZSJE0gLbRfQWy3PsVXYq5l1zYhE
 n9YFW0TQskaV8PE8OChv5kmweEJipyVZ8HFVR4ZTePhzKh/kWp3bm5pdqyaDBmOtICbiung6j0Z
 SSHDaz2wHuVsUNCEe1Q==
X-Authority-Analysis: v=2.4 cv=VdP6/Vp9 c=1 sm=1 tr=0 ts=6950146b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TmOT9BjTXP3hLH6PdvYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: -BhnVX48PRHvCyxJIiOPmMTyS0QSP1fu
X-Proofpoint-ORIG-GUID: -BhnVX48PRHvCyxJIiOPmMTyS0QSP1fu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_04,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270164
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

On Fri, Dec 26, 2025 at 12:35:33PM +0530, Kumari Pallavi wrote:
> Implement the new IOVA formatting required by the DSP architecture change
> on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
> physical address. This placement is necessary for the DSPs to correctly
> identify streams and operate as intended.
> To address this, set SID position to bit 56 via OF matching on the fastrpc
> node; otherwise, default to legacy 32-bit placement.
> This change ensures consistent SID placement across DSPs.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 62 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 51 insertions(+), 11 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
