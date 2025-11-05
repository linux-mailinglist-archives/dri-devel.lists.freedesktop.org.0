Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A13C33882
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 01:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199E110E685;
	Wed,  5 Nov 2025 00:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GfDnKDcm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Icm6PrK2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402F810E68D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 00:52:16 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A4Kftpk2967375
 for <dri-devel@lists.freedesktop.org>; Wed, 5 Nov 2025 00:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=mF+cLKKVRQFP3GvNceM/xWFx
 mZNCdYIyW4EQECMmO9I=; b=GfDnKDcmJbgEjVa1R/Xi+95GqnRXT7sVjR2jfZIN
 Fqc/jht0INTlofOpx+e4LJlUoiI1KbPU/iViAXvdmmcPcEtlAgdaix2pFl749Y5i
 Gqtntd8ZRhkHEpuDHWdfegIPe63fJBVO9sKlhqOUWGXhyf25o+lnvZw1Duz3rmDs
 pGluoIET4yW2TdnZb4sXhZbjDyO3jc1rjJriVDVOFGYD4k+DZ6ph6Bb5wX/ltIcT
 hCqKqRzCIJn9Juvv/LietW0Edeha8xrOzH6kXvURaXOLrC1+Ub19y8rcagLPVab4
 m3vMNetuG2Py8zVt7gcTR2kgXG9pCbM3duI3XggfTycvRg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7heaj2yx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 00:52:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e88947a773so285551091cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 16:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762303934; x=1762908734;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mF+cLKKVRQFP3GvNceM/xWFxmZNCdYIyW4EQECMmO9I=;
 b=Icm6PrK226AJc8nu/u2JGLJgIBiH1uahtKRyfrnXGYkmQb9hqhlhRq7kxu2mlxNhQ/
 ySVUlD6Qv5KikvagY7NULkfLieqfxjxaNRpZO0QrThGT8JlkFzuOiqGOUUysAQp3jEKq
 hjsg/Ywcz2vCBqiU8VM4mRkeVLZixBQDeHQVCwEEc5YAXacCi/rJz0atRViC3/Ph9Y0g
 YK7eB4hCy2xTv6kGYxymn4C/UlIPlwy2g3Sab041A17KvecKO/06dpQ2ffalwBgXMlUf
 ILWODyX6ODoDIJS2gIxhguY4z0+fGWVVLSC9Bu4SCent7hDS4OJgVLJvGAMbS76jOsMC
 bJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762303934; x=1762908734;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mF+cLKKVRQFP3GvNceM/xWFxmZNCdYIyW4EQECMmO9I=;
 b=OSxnWHc27TC+YnnK9Z1Q1YqShDOc6jBL8jVuuRqYeWnpTExF6/bb79RZyDpwk31GEY
 e7evuvwXTaZA1yeM+b1IuFS6DmvHbY5hIA0VPVRscZ+qfq74JKSaq48gTRfBLgfKmVdi
 u2FG41783LKvQp15mfHGNmVyHQ7ib8EViSkNUsUTIfqUHPIvlVu3yIvD3BMeXdd9ZSIQ
 tvV/GlhOXxa5+AGX+GyI/dmgNWRAd5Pc44YYx3FtKWDkb2PMjGWIVpsAD0nTy/vAVg4Y
 7ApyWdatIfkIhtAGb+gBOytugZNY6zT0jcjg9knJypj40BLDQ1uAFtgKsjVF9/Y97wCL
 2pRA==
X-Gm-Message-State: AOJu0Yyyh4G5xV77zoMpp8mgygRfazbCJykQt7oZTsYPt0tGeenBisjH
 SLxAhQ0IOYyO3R1VMXYudKGrjWcpPHan+lj7SjTWN/s6dsT9uqCZPPS6wts+TlHyLc+gZDVJ76m
 rmhOEueVxX8dShMn2Cx0HHnnO7zP1QQzXk0QAP0GJffx48UrbnVDe5nwX4wdSOw2MtoEEF6E=
X-Gm-Gg: ASbGnctieAA5wBxaeZrd7qiTewqH8Ub1qXRbRXDV2L77/yVakQ4u5fRMObtUfzJkrx3
 EppSGcZ/NPpSjRyxkiFHvX5s5u/FXUPALcnNlsVlCGcJYakpoN8r5st1MzigKNZ2fLRdHl65jdk
 GAmKV1szbUltYI/yxHcmvIZPiVQgqAwMtFCVbSfh3Y10O7+TgImZ2txwtHn11c9UsK7eChyRmGy
 N5BCNDi2kUVBFJwxIDaxJHL5kDT8ZYel+B6h5RcExPngAvKAcO4bHz/zH6YoX86Ky12urvdfl2p
 lkOfSMJ+zH17ecjzq0ixWaxnEfsfjBD5+8xnFidISYQelCtDMJcp86tRigWYjw/8lvKPWkJhnBk
 Ete8f+Y7hj+y/c91e6YXVyCeT9Nys8zPY2fN4AfraSgG+gX8MDmGTxdSjM4FjiLbKof7XCa9Wlb
 eZg5TxWDvdFTKT
X-Received: by 2002:a05:622a:50c:b0:4dd:2916:7980 with SMTP id
 d75a77b69052e-4ed723300demr20380851cf.2.1762303934233; 
 Tue, 04 Nov 2025 16:52:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEW0DgYaDDDgZj+/uKyzHvi8EHOj7DGy29ph+Uz3G6jt85XoV7F46z+h4bslY5sXRqHQFhVIQ==
X-Received: by 2002:a05:622a:50c:b0:4dd:2916:7980 with SMTP id
 d75a77b69052e-4ed723300demr20380661cf.2.1762303933833; 
 Tue, 04 Nov 2025 16:52:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5943443db87sm1187433e87.52.2025.11.04.16.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 16:52:13 -0800 (PST)
Date: Wed, 5 Nov 2025 02:52:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add Akhil as a reviewer for the Adreno driver
Message-ID: <icgutv7idot4h2fqx5iwhghty6h3gtqcsp5vbdgtw6jwjliy2f@536e2qcqpzmq>
References: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GekaXAXL c=1 sm=1 tr=0 ts=690a9fbf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=V8cJkdWAq56nonIdhLQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAwNSBTYWx0ZWRfXwJU7mi484rEq
 mVXK5audsf3h7FMeE/8XWa9yIW5RkLq/5eRsLSRe+4eSU2ge2ukgzNkbB6lP/KHaF6RR/nqN0oA
 df8HHYC7goluJ/8L4NV0DGBiI3e+huT9nNKQ/yBNO7cxghK25xyx9gDgYbPiPUPDggfkpimfATy
 NHZooJWKXccLPt4zGHa0+YUZQBCTBCQdMr3IisSNGdJDkc0EJN9Uj19kZ5AkUJ/Nnvz0znqsPsw
 nAS37i1qZKL9lcczzzgGk89aiqT/gMBrzicozA6VLYEuLFOVBf0GIUolvVCNKqeW0aBmuNmmVYQ
 Uc/Gp0jRCLbu1LO1kxid5oTBw4gXzFiMua3EXm07Wm8Mz6niF+MSmEOOsjSrbc0IecaDc5R5xbH
 MQc7MqBhWN2XGJ3QkfSD/vYVS7nvAQ==
X-Proofpoint-GUID: QvRNBuaPOkhOrsqZomLRpa1kfWkXqfhN
X-Proofpoint-ORIG-GUID: QvRNBuaPOkhOrsqZomLRpa1kfWkXqfhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050005
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

On Tue, Nov 04, 2025 at 02:02:45PM -0800, Rob Clark wrote:
> Akhil should be getting tagged to review GPU patches.
> 
> Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
