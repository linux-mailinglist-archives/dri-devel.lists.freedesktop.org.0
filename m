Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CABAB25C80
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 09:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A869510E7F7;
	Thu, 14 Aug 2025 07:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1cxzIob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C25310E7F7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 07:03:48 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMHTj1002874
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 07:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LF4IE+UwqtQfgx5vOm9pwD60
 Wb8Rm7zswbtxjHM+xig=; b=n1cxzIob5U5KJR2OWy/pE3dMoARe+ewMjBiKHBbx
 SzWOvMOscxaJTezwTN4nlDLQWVJab1jOhoNFyuaknnh8vT+ZvKNLQLo6fVIJCjtC
 SP0VN19y+Bo4SoM8ig2Fw/2K8OB8T/UAng0+68LGzVFUK0cGDYj5yBk21RY5jQT4
 4sTEfSB1wAdFhMW7GVTzXHm98SdGPe0c08yxa+NUMAO02QFLdSzhLLB/ImqKQuy1
 D7ZSqUiH/3o0az8ItkSnpOUTP2Q6HJIuR69ttfj9u39kIFoFcjjZAJgaMcyp3EG/
 fgDjsXv4u3fDWQmpmQXReqMNm5F0ztFcgP2uONlTJOIeQw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv6q2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 07:03:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e8702fb9e1so143584885a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 00:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755155026; x=1755759826;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LF4IE+UwqtQfgx5vOm9pwD60Wb8Rm7zswbtxjHM+xig=;
 b=TrmYg8Vl798FvECI6Y/HTbnmjdhmqNTwzvDakXsBcc7G52YD3VnXBRG2Akk9fZGNrn
 d0iDZITR9CA+b+jLE7COgpyQ5sT6j0BOHPA5DpixZ7B9YLSajjVUctYRZCB1NuhNuQ+Q
 qU4bUMtbSti/ylJKIu8VTqCQP/m/paMzMqMFmnxKhJ4+A975sTGOqzPLgHPlk2skrQdm
 zoJ0XpmmE9xyB2JQrTqtl3s5gtiTFFgC8WY3WgXRaamNBXbDtZo3jHk4OwaUeyy5BPPX
 CzbrBkE8H65ELhyIewinsxU+UeaDDw3r4o0lcEnwOGG3taA3JQE4myl3KagL/ZvPBJXv
 dmbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJCk4h2Q9ZFWR6AOns80KL/MuMynooUJiXuT/uiUXBfXF8grR/3x2QrvqgWD9UUF11MjViO8DFGNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyg21PRaV5ZQoAzyecVeNgwuAzPY+LPUkr397NhELPYn0X3V8na
 +Fr6Uqz96rNDwk1NMCKMSMuDvuXIbS1xvwg2BEsyb3lr0sEmtVW2W4o/TKVNPe10r7MJR8rZmWR
 VdlOS2neTCqpG+cSdigBh7Q9DBKphIgG9IJPGQQfdhQLClz8b6J7NWrhj+VkCqMO0NAoU/8s=
X-Gm-Gg: ASbGnctUki76BgGrm+fkTmKvFuoqI6IijutKMu3HavIEtlPVR0Mhx7aUVXhLFQH+Zer
 jTl1RzI0MwjNm8+wN6/b10I/EOX9XHS7fijqpaYH0cdNGtlcyviWZ3oZaF3lhjycQk+26BQSCrZ
 HwHfia6buYFMb2bDFRxHGdJRRNWhA882AUb2ncEFXX1dfxiLSxlnilKMBgB+qs53mQgKy3Z6H7T
 Rqm4uGUKvlGQuDB7NGKxaE7lSpP0yU6PSEFDzQnje7iW9gDCIUZzBwHWozMsH6A6SeHFzExrEje
 bIYaqa+DM3aVgtsT/LXhQFAZvgpLltIP70WGnvRkqy66rozj65dL5mYtayZ+tcXueM9XwJ0LfMy
 tNwKOrbSgGtijy2T7xk91K0LzjRgeKsdhBHAksPwVK+gp1b4mPIgI
X-Received: by 2002:ac8:7e95:0:b0:4ab:b1d5:3b77 with SMTP id
 d75a77b69052e-4b10ac12fb0mr31956291cf.45.1755155026237; 
 Thu, 14 Aug 2025 00:03:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb9AznY1bE/2T3os5xRxJ28Ngs1U0GfsgKPw61bINS+BdKmMzoT7z6J2yBVZFHfwcAp5+2vg==
X-Received: by 2002:ac8:7e95:0:b0:4ab:b1d5:3b77 with SMTP id
 d75a77b69052e-4b10ac12fb0mr31955861cf.45.1755155025816; 
 Thu, 14 Aug 2025 00:03:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cca1ae1acsm2393274e87.4.2025.08.14.00.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 00:03:44 -0700 (PDT)
Date: Thu, 14 Aug 2025 10:03:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, thierry.escande@linaro.org,
 quic_vgattupa@quicinc.com, quic_kuiw@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 stable@kernel.org
Subject: Re: [PATCH v3 4/4] misc: fastrpc: Skip reference for DMA handles
Message-ID: <eyqm52g3oymidbylo2jp4uihp7luwhoet2sj5oxoz52bcsnhhx@vusta6qaws3t>
References: <20250807100420.1163967-1-quic_lxu5@quicinc.com>
 <20250807100420.1163967-5-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807100420.1163967-5-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689d8a53 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=7U_eyDcXjddG1dUirncA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: K0_JF15v8apYKvFOTctRW0VyfBPNRaV5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX+yzfE/O/EcRy
 IIA3x32nYi+xXHiB68Ur9xYV8WOMZdXHaPF8O1Kg/KDjSNtRHoAX9edbWGy9XhUc1vY7GP+9De9
 GxJGZhYBCapNC/R/m9KIZ8f1iu7xjcduJh2yPUzL8UId7iZvypkv4g5KuYMN0lz6CRewu/u0Y4E
 Y13SIax+tVLNYA+GpxOHsjWy1yAJPAoY4zQZjbDf+UHpwPTlB9Rty4C127arRZrHbph6xzdKRIF
 doOB7MVLMvLSqUU6TzLe0agDE1nCA1HokLIMc6kqDzQMmAp5DbK+7qIe08J08zOVNazCAtV50CR
 IMnLJxx583sSkiTm1nHQNVYrMbuUyOHQiz++kBI/vksWSUYqjiPGrx74xcglFRWi1BQz00w1Q8m
 p4tNtPTu
X-Proofpoint-GUID: K0_JF15v8apYKvFOTctRW0VyfBPNRaV5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
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

On Thu, Aug 07, 2025 at 03:34:20PM +0530, Ling Xu wrote:
> If multiple dma handles are passed with same fd over a remote call
> the kernel driver takes a reference and expects that put for the
> map will be called as many times to free the map. But DSP only
> updates the fd one time in the fd list when the DSP refcount
> goes to zero and hence kernel make put call only once for the
> fd. This can cause SMMU fault issue as the same fd can be used
> in future for some other call.
> 
> Fixes: 35a82b87135d ("misc: fastrpc: Add dma handle implementation")
> Cc: stable@kernel.org
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 45 +++++++++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
