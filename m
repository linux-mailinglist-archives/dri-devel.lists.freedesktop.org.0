Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A4ACB56D6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 10:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCC110E7A3;
	Thu, 11 Dec 2025 09:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGMORa3h";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XBuW/zKV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83D810E7C4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 09:57:19 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BB9ZRFE1054789
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 09:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2YjurWD8jh8UqL9X0F1WKQTe
 /Sb7eB2QeGBD5SBBMi4=; b=LGMORa3hIe0vRuX9KJi4+Vn1SOBH5IGz4RmQag6W
 h1EX1o3Ga3xKpb+G8FkdG1MbCFtO0bxLygomtve2Nsc4XZk/DydoTYmRtPBP/imw
 qqmarpbO0fOo7DHkT6c9qu8GvsFJuNpAldoE3ozfYkYjaRtXv6Lj0/3828V+3IAU
 NYuetnZjYgc1TeYBX5abJXlKZrkvdpsOIRMdSSS0RZjzc3yJlE/B0ErftH6Lqd0a
 ZTd4B+k5axibE9SmIOEEhXtBeaRs0Yc3ZTm1s7Be+x6YRGwier4GcNKQtXqrVcnI
 tJgP6pY8JMlFkTOBmAW8qYNfGt4lpiuQKTqTiU3GlITuaQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygsx1wvg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 09:57:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed6e701d26so16446351cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 01:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765447038; x=1766051838;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2YjurWD8jh8UqL9X0F1WKQTe/Sb7eB2QeGBD5SBBMi4=;
 b=XBuW/zKVnT61/s5E9WflqV0OU4OlnBypY4iGqdVKeEa/0q4Umm58xFDtzuGTZbvEek
 hNjXntRrSm9SrRUbqnjx90O3MvoxLDuzTt79p2WVIITTiTNNwrUGOYBdbNqD/J7BoGLs
 YAkspAQPkPb6zVbCISGR7t+FGB3p4w/v9ia84LdPp34lw+5bnoSS5syrmV13McYOkbZK
 x1AKCtN6LNlv0dD4RadYuE1gzOE42TzY790O4o9mt1631IwhFH3K6SWyPba9sDIhsrus
 Wg8ck0WTJNsi1h8VSp5xtxNyx6Qh9JmPz9MUcbLfP/OLe0Lgx8zOK6xIAco5Qj5QQ6Zw
 hNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765447038; x=1766051838;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2YjurWD8jh8UqL9X0F1WKQTe/Sb7eB2QeGBD5SBBMi4=;
 b=vxOoNZX22hv0YNHNQC0kolAIBnBNOXXvMxvicrFGTCmoN9hMvkEyRMf6KWicu1s6YO
 pT6Or356rl3QxvuSEU7bl9dsZ+CeNLU57p4suScH/VIVNI6j7FwuZoAg068bYIj4qS7M
 eCau4MyZuSsHMt2RmkUCJHUR8tsT/BNluTDN+ks5ykV7gPc3RH0pK1RWDLwgdR4awHgp
 2C/XDDOx3ReR4FjY0XlYLn97oqbfmurxccrqFZQzt+4q6TA+8WKamhRjRYHrlKyGLKtg
 nlK0v9FUnF/belkS54IzT9cSEZKzEKsWv22gvUyT/S3tA0DVuSAZuGrplb4S1yBc5rcw
 tGAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9pFh8Fn9CjTcCb6xOkuDr7FZtlxnKufELYR1cKYAnBUjBYSrVXSuxnM2LSxjjIGNygRyZzK3UYWk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUqq7JnAC7BaVFDEeeIcC0WVfeBeHe/Mx5ob7p+HXNvPL84qHe
 zfeI6/QATJg80VeXpiEYMu2Lo+8GgCHdaHOjLd8kQP4spMJ94nOHTYN8xkpfhfTGLUyVb3WJaZa
 eoJNC4Bv+N+ieOnmkW0uriYgjIFvk+yuQzTXgvV8V2csf08x7P0vxGPlOEDxYfD+9jSjbsIw=
X-Gm-Gg: AY/fxX7xp2ieFPV0DrhkW/43P4xWFKrzFp+1Rds0sPo0seX06IWyayLvjgcda5Ik9bc
 NDRXfKSgwkLdINfYHBYVtSYplh+3Dn6d2twwZGuCXilxVmnPZ9Tx7PwcwLkROQ5yfH7Q/HQKqnd
 vBKLyWuMwN4WX+fhc94tc+047NWP2rSHYBUNNVN6Wl2bTmDV3yVTjV++b+MSg0lEi3dKbaoWBMj
 BF94uDfd9qlXdqy5UJz8Fq0a87Jz1riw9upF7lxc5WyFEhA70Pc3br4aKKoKfQ5hgCRGHPnKsaN
 Rro/XQrz9LYVGHI6Xug8MIH6Fwjd7iZJiFCp2+Y8x7nipgprdcXMNvv5N9FjyOcVyZ1hJIXrdPk
 mrqwWuEqUZOfo8xHfWHWsF8l4fyQ5GlC0OGFvKVlQXUPdvGp1lBSfwkA8fn6x2ZutD1VvKExDo8
 tf9m9MEx/l0aM6vQLxQYLcy00=
X-Received: by 2002:ac8:5987:0:b0:4ee:43e1:e591 with SMTP id
 d75a77b69052e-4f1b1b4813fmr74174171cf.58.1765447038323; 
 Thu, 11 Dec 2025 01:57:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHb5hUtfkJ4sz6QcApdznwiz9dx/Ohc/0AOpeR1lWkGWc4CTx0nRmG0uVUSAUkJYXAcmZnc8g==
X-Received: by 2002:ac8:5987:0:b0:4ee:43e1:e591 with SMTP id
 d75a77b69052e-4f1b1b4813fmr74173931cf.58.1765447037842; 
 Thu, 11 Dec 2025 01:57:17 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f2f379bdsm724574e87.2.2025.12.11.01.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 01:57:16 -0800 (PST)
Date: Thu, 11 Dec 2025 11:57:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nikolay Kuratov <kniv@yandex-team.ru>
Cc: linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Jessica Zhang <jesszhan0024@gmail.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add missing NULL pointer check for pingpong
 interface
Message-ID: <72epnkogfsguqyoefmfawqw7gr2molejceqe6rvunpcfrw3s6r@75wvtvd3btjd>
References: <20251211093630.171014-1-kniv@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211093630.171014-1-kniv@yandex-team.ru>
X-Proofpoint-GUID: 3RFMr4OCefcEXndZ1b4YNud1JvDFGexu
X-Authority-Analysis: v=2.4 cv=d974CBjE c=1 sm=1 tr=0 ts=693a957f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=6R7veym_AAAA:8 a=EUspDBNiAAAA:8 a=q4VHR2A0D8CO_ZJfzXEA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=ILCOIF4F_8SzUMnO7jNM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA3NSBTYWx0ZWRfX+rcATqFJGPg4
 k4yPNeyx6ra2d6vrpf4GK5Zw0yZfo0t2GFoqx7KqSJN+IfjA9qm4n/R75Ux9Ro3bNH+iZZeSV36
 JstC5eVrJPjRUFH1/I6geZGiRJXT8hHv83QqAB4w4G3gifGjdtnk4mpCSSxmiXuPdc8mBCaBtqD
 qQ+Z+IDu8JQ+K3/b0IgNHyLv7nf9fQX8l2bqQQe0JE9AlM98TnODpS759Y84KyeL5F0Qmufz7MW
 eE4HCZbEpfUleW1Hvfe4WRjDEtSapsg8qkjanvdNy4LHdAcn3KneZiOPfVwGyXm3foj9sp1jkay
 63I2ltiU+q9bBuIYRovaVcnzZ7Gw8a8Ja5FDXDtbSYsu1CEsZX9zaqoVd/joBECxIRvvLPSpruQ
 sxabqqyUKYCZOOsPP/X4+H8MSNJj9A==
X-Proofpoint-ORIG-GUID: 3RFMr4OCefcEXndZ1b4YNud1JvDFGexu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110075
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

On Thu, Dec 11, 2025 at 12:36:30PM +0300, Nikolay Kuratov wrote:
> It is checked almost always in dpu_encoder_phys_wb_setup_ctl(), but in a
> single place the check is missing.
> Also use convenient locals instead of phys_enc->* where available.
> 
> Cc: stable@vger.kernel.org
> Fixes: d7d0e73f7de33 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Nikolay Kuratov <kniv@yandex-team.ru>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
