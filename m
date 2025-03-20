Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB36A6A430
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 11:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969C910E5DB;
	Thu, 20 Mar 2025 10:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTndezSm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A2210E5DA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 10:54:45 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6Z11F014468
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 10:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9MSSpvRG+TcV9gNCepPHrW84
 i6zOiyJTCdB87QHlGkE=; b=QTndezSmxaQlMikf3B1wozAHStIREKiRVGk2iEnt
 qyPikNFdl/tDpwOfzEh/nbbo9eRkOMm5yIwYizDD67NSX7J0Hjm66O1bvQDO6NfA
 yUk1vZGxUZ2PgoY7XWE8cdNEcHIiG9KLOwIJPO7ZcUkZ0QHxqFvFTBZ3AUXbOPht
 wnLVrkt/FjAtymCeUpJk3Lmlba54awBkpaSpEK2pRj+QWvg8ZARjoGF6xy9OOOXx
 tg9E1zpV29QqyWeOLgXXU9gsGhr2WIeE6/Nnxdrmot7JnEIj5rMhLhBg5IUX+tVF
 XU0b+l7AfnkPlbvPkqip0KbIISOdMmb1oPuX7BRgl70bvA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtrufm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 10:54:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c0a3568f4eso67365685a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 03:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742468083; x=1743072883;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9MSSpvRG+TcV9gNCepPHrW84i6zOiyJTCdB87QHlGkE=;
 b=LZYkXrwGx1VG5xAI/isF2+lqf7FUPcsz5+HSLplAAk8qZAtRj0GJ9aLoK9mo8p+ICo
 4FWZprMLHnf1QMw5ZLmn+41g0PzQi2xOypsi0QIcNOcfqXBYfqRl/a7gOlO9Wewsgdtl
 MUoq4659rVhZkccP8OAXOeYDAiKji2kiekG6fSEtpwmNxbWATfjx26pJEsy29ZQEgNmd
 /f97Q/lHZ2TJFFwe/gVxtscZam77hfK4TjXx5Ksp1biBLNoVaznolxLNdvKIhl7Rj7N1
 /bFntk8YfBIPY10Im4pOri5P9N/zBlNMDl8T2w7aiMzWWpALaQ8d6MBevlA1UsSxtogS
 pkCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4YjHfix3DguWIkAL0njbF1uGqv2uKQCMQudNLD4qJmG0kxYg7PPGrswBO+tqk2WwtvSYa9WtUd7c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxexs4cqRdEie5wzlLYwMY/CJbgMjGe6dl60HGViGmSO8G7a+nc
 vLCezPBiHo60l+jxYXilTOfBCBc3aUk92cNQuk/mbr5+dVfwMbnp4IC2cJVbn3NqD9ZIrgU2C1h
 +TktfKMrFyH0ceOgc9vgBe5PBd6R99IW5yoJ515TPBpabaICeQSEGaYMghMF3XzmRKSc=
X-Gm-Gg: ASbGncvSVu8E1DZ3AQ5w9WBpDvrmRvTQazf7/kWd3eKIoIAm/SAdIa27bPRaJQvAncq
 LSrdTXLc+KJYwE1h4GkxuyTqCb32HRUecAsjaZFcaZbSctLGBkia8+WVqmMkg9GG51bRPV+xaeg
 kVGmMWco2bc8aROm8uwSmBBsBQjs1//4GZ2BL74hoLA1pDQpMeuaGlDCEZP594QWTcMBU2BKR4B
 aSSWeKI1LGnGfMN/ZuywSVA2nR2syXJ/stDn1PrNAzH+v9eMD+XQFjJiNSBdWXdLGCFo8sPVhtx
 ephU9jvUqn9bSEugGUcmdp+pK2MKK1LKvp2fR11+0p2bvKushJMORHc4+8Ya3UlnBCnMdA9Q5EU
 t+ms=
X-Received: by 2002:a05:620a:280d:b0:7c5:4463:29aa with SMTP id
 af79cd13be357-7c5b0d06405mr416387885a.40.1742468083466; 
 Thu, 20 Mar 2025 03:54:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdFV9xVqcyjUuzTORF88R0q5+1pBPTL/vZj/baesC3onvB7C6vsCaH9ilw1XKWAk1ufOuWcQ==
X-Received: by 2002:a05:620a:280d:b0:7c5:4463:29aa with SMTP id
 af79cd13be357-7c5b0d06405mr416383885a.40.1742468083112; 
 Thu, 20 Mar 2025 03:54:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7a8516sm2247703e87.31.2025.03.20.03.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 03:54:41 -0700 (PDT)
Date: Thu, 20 Mar 2025 12:54:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
 quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sa8775p: add GPDSP
 fastrpc-compute-cb nodes
Message-ID: <mgtqgzra5n4tihgyrvb26pyzfcsupliorc4hvrmh6j4l2zw2gv@ozfjoxdolle7>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-2-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320091446.3647918-2-quic_lxu5@quicinc.com>
X-Proofpoint-GUID: Zp1p0FAGCp3ppS4jjeOWGW_IbGAnjAH1
X-Proofpoint-ORIG-GUID: Zp1p0FAGCp3ppS4jjeOWGW_IbGAnjAH1
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67dbf3f4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=X77NXM8zCmOlsI4LSM8A:9
 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=705
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200066
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

On Thu, Mar 20, 2025 at 02:44:44PM +0530, Ling Xu wrote:
> Add GPDSP0 and GPDSP1 fastrpc compute-cb nodes for sa8775p SoC.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 58 +++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
