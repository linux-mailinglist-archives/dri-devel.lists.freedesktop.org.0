Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F00C230FC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 03:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A8810EAAD;
	Fri, 31 Oct 2025 02:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eveHNNsV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dbgz7UaF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4FE10E188
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 02:51:02 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59V2m4SJ102819
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 02:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DsJkS4Jj0YiOEfhK6rX+s7mE
 DdCGFC+Wm4+5HWL4rHQ=; b=eveHNNsVfcKDk2mAiXSreXJVEOwKUUuuY6Zts5Tr
 5AESW65mOBYtL7nwuX53K71yGXaxATGqw94J3pUygtlsJHBtQs81RuBEqqXujSe5
 HaabpV7FW9xwhAFIua679dZMrJ33wNgs+vyLMF217YN3vM0pgUl7AMiW04OYP+i4
 AbiiIOFpB0+ukr/+mnEcD/OmcjcNfZvn252BCCMeo8q1PSXQR3sj79AWm0IW6O54
 H3dFQj8yPtcC5X6W2BOPbu8TynatIJn1AdVwX7w3PQikCgIrdyFHyXmmZnAub0C+
 m1udYkR6Upz9OHJhQyQsc8hczsbEEAZYtUYVZ9xekJXoDw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdhnq3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 02:51:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed240c3d93so14885691cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 19:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761879060; x=1762483860;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DsJkS4Jj0YiOEfhK6rX+s7mEDdCGFC+Wm4+5HWL4rHQ=;
 b=Dbgz7UaFl1MbcqMdHEfZlUkpeRro04Z9g6c088qlEh55GIjtzelq3drLVkAiTFTxDb
 DxkrVMy/tuD4XIzXnKsJ0yXywuAyORy2Qkh1N1mo9mx9MRis8tbAbKgsCvMkaES7EzuR
 +wbJvjdDnBrwmiIfBf/9kEGolhe55E2Ui2i8ESW+flHMXV4QJdhlwOfrlSPMeDVy7+9H
 rLU6mH+fQ6iX184zjys+VxQgbpc8bgp0lAPUctpw+XlmvEqogBnuNS7qz8rSz78+n2+f
 LMqjvvmV5HNCTJ4kYddjW42a3Hao5fsYQjSS/bZcPHPlyIFgMmFI3YpdkgYZ1xghsAYx
 7y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761879060; x=1762483860;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DsJkS4Jj0YiOEfhK6rX+s7mEDdCGFC+Wm4+5HWL4rHQ=;
 b=a/TRncjWa5ff5bBYC+Iicy3SOVDk1Klz8WsXkOfqbX5GWSs9G89s6Xu9Ybooxq3nn0
 Fn73lTNKiZ+Q47RGC82ueDU0rpPt62iXSFTTefDf9VKmpWAzHsun3M3RdrNsvb5PHtZ/
 RGsYqagsMQL9yOyKdQdbLuPy4NIr/Pdj8PjmXSalSJlBAbDqff2UMkmq4cemJX2lNAls
 P3IY7zDnUp7EdPAWenwyo5rST3W7z9rrgjg9hIvHgX5rcBQkUY44EiiW3RMJpepCtq3K
 0t83w/0nZIQPHwo+1S8JM3MxOvqxDVUzT4sAmD3nqq+4Z8jltf8fnUkBlUreiyHFHgS7
 UZvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNiDzB2wub4YdkGnsAZ3x7E8CoBWWwPozR2tBGHdbiJA1ZxIir5vTBmU7B0xrpmkwaxs1zELY9VSM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaOMTiJ35ErVeSzYLd0OvO5uRFBJ0te89SUxbqx2m9IuZZ0N1G
 GhkHe2BUEvx+YS7RoC9QJtCUh8lJdAp/cOfoTew3GVAhWQC41PyWojzF0PLnG2VvLvK7VX3wF3f
 Mz1srhM8iy0sqSHrXoFJzGVO8RMRSBmpNxCqr/kSY3w0sNrm/OXWB80l3sgAcdcj626VcUYM=
X-Gm-Gg: ASbGnctPLyc7OwCHSLuBCjckFu0qTtF1EaEPK++gTbYk2PUbGAVmuq4TkyxytDKIs34
 LaLANvD7XW+Tkeg06QArhpbhR6Q8UYnNFg6N6ZGgrJwO2ajOUgpcFX1LzJ+Hy0WrpSbEk/qGR/k
 u91pmZ4lN6c59KE7XQgvPWU9vM6ZjLAl+J229KTLUPNW++jNUNT6Sev6bQvFBSLMBOqNEXMlm8q
 0cYZLjJ7crLWQmfLWcUOxkiIujbjmcvG9RAONrdnOeUoGp9RqUfxzwgCIOgLi4CK1iplzr8sxlI
 i+yCWCii23GWDsAASj9O7oKQK/stp1nYuRQLhdPB9YVu4YShe9laZv4cy9eZKLw6Um/dwhycPXE
 Q5qjyo1RLx2sUrodKJPu016qyfdzjN/TfBb0cHSNgAkVNBt9i7T5OSgqs5eI3
X-Received: by 2002:a05:622a:250f:b0:4ec:f5cd:871e with SMTP id
 d75a77b69052e-4ed30d84c4dmr24792521cf.11.1761879060388; 
 Thu, 30 Oct 2025 19:51:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXYqZxTVqoWzxiWk3B/+KdG7WVS4s1P0rx3pIBR/sRe6vbtf2x7h6Rv+eqmkdkShyGqNrA6g==
X-Received: by 2002:a05:622a:250f:b0:4ec:f5cd:871e with SMTP id
 d75a77b69052e-4ed30d84c4dmr24792241cf.11.1761879059921; 
 Thu, 30 Oct 2025 19:50:59 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8803606f2besm3522226d6.23.2025.10.30.19.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 19:50:59 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:50:47 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 03/12] drm/msm/dpu: Compatible with Kaanapali interrupt
 register
Message-ID: <aQQkB6Ma2z3c6iyh@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
 <nfekr4vi34ftxzyyf5xv4tsb5cr3tokiyfkerypqjf26dos3uq@42wcn6ji7nnb>
 <aPrre+WXogSZIE7L@yuanjiey.ap.qualcomm.com>
 <st53uwtdow2rl6bvmfitro2dmodxtzfnhyzon4xeeetkkwekxh@ewlzkelq25wm>
 <aQGAvLFkH80Id3p3@yuanjiey.ap.qualcomm.com>
 <br3aukcmx3p2mtowqglcuf77s5xfnfv3eisjexabxhjzigkjno@wk7sqptjn43a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <br3aukcmx3p2mtowqglcuf77s5xfnfv3eisjexabxhjzigkjno@wk7sqptjn43a>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyMyBTYWx0ZWRfX9A3XMY2+NcSC
 3gA279NBn5XVGZQRO0SjJCnuKYG2+gEo9YofL5anSu4sma+/Hu5WeQBn4HZQ1j/phEuaLZvZ1wr
 Ca+SXnOuyNpf2jgI2JrbCv44GkgHtNs5dPC2Se3kG8d5WHlPEdJphZ8uelfpv1OimXix0AGEVHz
 LhaROIxzxEPy94AM1dAD0v179+kaS9q6+CiyUSkcSitx0Fai5Z+Vkou3dMFf6CgeW85JGzw7VIP
 e8TiqfVKVGZLpDuNZQxX24K484aWDW33ZCtvcvFQcMDC8X2o//ac4/kE+zaULNSQPtxh7JPbsqL
 y8NRGYYnPCVmKCMTBEMPMyoPX0u4UHnTp1nb0lsQF0RXH3tmk+5do7jX435A9asJFKXGKtkRaLy
 17NHRUuaB+YFn/qbIh69Aw/xxWYXkA==
X-Proofpoint-GUID: Ja96zr9vo_rI85DwgblHaAnnkawnBXn8
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=69042415 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9FCQf4pbOLePcO8AN0IA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Ja96zr9vo_rI85DwgblHaAnnkawnBXn8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310023
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

On Thu, Oct 30, 2025 at 08:02:13PM +0200, Dmitry Baryshkov wrote:
> On Wed, Oct 29, 2025 at 10:49:32AM +0800, yuanjiey wrote:
> > On Mon, Oct 27, 2025 at 03:21:33PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Oct 24, 2025 at 10:59:07AM +0800, yuanjiey wrote:
> > > > On Thu, Oct 23, 2025 at 02:59:12PM +0300, Dmitry Baryshkov wrote:
> > > > > On Thu, Oct 23, 2025 at 03:53:52PM +0800, yuanjie yang wrote:
> > > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > 
> > > > > > DPU version 13 introduces changes to the interrupt register
> > > > > > layout. Update the driver to support these modifications for
> > > > > > proper interrupt handling.
> > > > > 
> > > > > So... Previous patch enabled support for the platform and it has been
> > > > > using wrong registers for interrupts? I think that's broken.
> > > > 
> > > > I want to express DPU 13 has different INTF register address, so need to add new
> > > > interrupt array to let DPU 13 interrupt work fine. Maybe I should optimize my commit msg.
> > > 
> > > Make sure that patches are structured logically. You can not enable
> > > support for the hardware if the interrupts are not (yet) handled.
> > 
> > Kaanapali Dpu interrupts: 
> > INTR_IDX_VSYNC,
> > INTR_IDX_PINGPONG,
> > INTR_IDX_UNDERRUN,
> > INTR_IDX_CTL_START,
> > INTR_IDX_RDPTR,
> > INTR_IDX_WB_DONE,
> > 
> > are handled by irq handler, so here enable dpu_intr_set_13xx. 
> 
> You have enabled DPU 13 in the previous commit. And only now you are
> adding support for interrupt registers on DPU 13.x. No, that's not good.

OK, I think I should merge this patch into the DPU 13 enablement patch. 

Thanks,
Yuanjie
 
> -- 
> With best wishes
> Dmitry
