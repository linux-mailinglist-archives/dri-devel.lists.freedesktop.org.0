Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76C1C2669F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 18:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD13610EBFC;
	Fri, 31 Oct 2025 17:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgb4u2wQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CezIoV90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61E810EBFC
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 17:41:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59VDFwp11826599
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 17:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VxcmZzcynSgst4RcXe7R2leI
 1xanu1Y8+qSXxwbZpnA=; b=jgb4u2wQ8qyrzhZlz/p0Whn7KbNJZ2jPrbs6xJ/o
 jC7R0EPPBt0oSIUyHgA04gxpa+pi8dl37ipTdu/WjhQnI4v50fF46S1xrZYkaI0w
 yk3k4kGGC/lBOr3sDj0UIX/kzlMchuEizmx5NujP+lXtvOAjV5JVnHYNN8KVZXP2
 HRpbDwhZABWIN9nuK9jge1XDZy6gX5/lbBq2F+iJsVp90MFxfCD+2bHNiim/SBxp
 9j0AQ3FG2ZK9ZlGsQOzjMvwWQe29eCncCShGuvtjatL7VVH55jOVxSPlVw+XV3/N
 9ZlzQtSgpkU8ZGfn5ZJHf+rdbuZjyQH8xx681LYXuG6djQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4p11t4ch-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 17:41:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e88a5e70a7so73895001cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761932502; x=1762537302;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VxcmZzcynSgst4RcXe7R2leI1xanu1Y8+qSXxwbZpnA=;
 b=CezIoV902JRczUK82j4gLXNC1EaVfZ1y6hDSHIa7n0ID3W6+0eEZdmQhCkIC5Vo81n
 jngr/HYjagvdDNdQP0Lht8GZDigePrtWwd6+gY4Tqm+YKX/0b3YlUsUVSzAWQ6KEFIvN
 itYNId1ApYvIu+OQZIY1IqXWbZdjwp4mUd3f4nOZ+2LzKt6KlIoNrp2F7hEKoD6oOKNE
 J7UzddX7Bp7EBGDWOQ/JWtndSVG1ewNngARhuxAGuwd2kMUdGdKHXpSV3Nc4QuOBlqvf
 +qMVCo0Pw1mePG+5l2pBMjlGoYInJgTAQCzKIU4oe0T22eG0Zomj4vfkBJGCwd+PBQNG
 T2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761932502; x=1762537302;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VxcmZzcynSgst4RcXe7R2leI1xanu1Y8+qSXxwbZpnA=;
 b=APjh5cEFOq7N4HeA6S1pu4V6DkCrER67obN59Ls3CXtUowQcMQ5p6yndk5phSyhzTV
 qdYKmJ6QA0JTeZCcyZG3t8mhXS8EsbB7Qzgll6lQkUqIgnZiIM0gA+0RGMW5TlSFW7mB
 7eIHhuE2aP4Duu/QpfKF+HVs6LMjO5klmrZ4gcpnGGCnc9LQH3gB85n/VRkzDc0uGyZT
 164vxWOVaFVylQkhpSqO3hu78N6m7ePdXmWJuWuPUCCvAF+ki1tsNp6qtNakSuuKojhP
 Fjue7NoIJybHEnEFnm37OUccECfwo/d0ulBuJjs4ImHVdrMZAr51YhoFklaszY4KRF/G
 DJwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeEpT8uczYv0N0pu9YspN2N6KgdHRUEjDz8uuJ1BGM3lN+uOBeidX5IVAOvAuWsT4YwXrQqYT5/AY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7fp9iGCnyBGnazHclDJqKHfaj0sAPXEV6aRQ8m3JeX/GmOnjc
 TYFPxxVrDFI+WQiBZ7mZ8K24PnMCtEW+Y9U0m3K/Pmst3k9rhxjQkVZn6xGOQsgVosSBeai6m0/
 IDPUi/2BN7smK4tutIKfPd4bynFpt571KmA2+FpAqSWe2kKb8BScbFzVXrcFwY9QGpewNrJw=
X-Gm-Gg: ASbGncvEHOk6WPOz93GkmXT6heOQAqUECbarHcUOBobmntvrpW/rezWQUPjOWty94zv
 hZ+Y3j7rsoRjwLGyruovZMSvqyNufYXEgQX7ylthr6I9O5sLtPRUuOcheO2ZJ3HatGs2VAeUC+3
 rNz4qCyWJx2kXJfIiMgKVkrDzd58x4o7nrRp+QHCYABfP5xi5EsKEbCEaFSQrm44s9WOqJCeO2s
 5bi4kSA4nAPkYiKumAhT66TyllpzmjdwBt340JTXhIYyFBOS5WuT1tQq1N3+N1Z57DbGt0vKZi4
 w1T1bpIdDJkkO59ATcFOureWzbwUl0UYxOmR+3sVpfuIX+nnZvayDgg7h2Yi3YXyCbN08uzEEdh
 MpxZ6bkgiWH0ACDx0//RQ4P3Di34M6AU5szDEdariw8YNoxdjLekjDmI8U27c6xlOgG+hu0xrj/
 +yR6MVOODgIqET
X-Received: by 2002:a05:622a:d17:b0:4ed:21d8:2cb5 with SMTP id
 d75a77b69052e-4ed21d82e33mr87278721cf.0.1761932502259; 
 Fri, 31 Oct 2025 10:41:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF52XCb5YnBlyr6nx3UabwoWlqzwYIQndJlneAcj5eO+eZNaiaeosWcRCR9H5Jmo/0rPR9lpA==
X-Received: by 2002:a05:622a:d17:b0:4ed:21d8:2cb5 with SMTP id
 d75a77b69052e-4ed21d82e33mr87278221cf.0.1761932501724; 
 Fri, 31 Oct 2025 10:41:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5941f39d162sm633076e87.37.2025.10.31.10.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 10:41:39 -0700 (PDT)
Date: Fri, 31 Oct 2025 19:41:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
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
Message-ID: <s3j6zlsoy5jdv5cj2x6bndtaxkdhiqam2rzwl4uxqlys3ojkjo@yvoktj7x5mok>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
 <nfekr4vi34ftxzyyf5xv4tsb5cr3tokiyfkerypqjf26dos3uq@42wcn6ji7nnb>
 <aPrre+WXogSZIE7L@yuanjiey.ap.qualcomm.com>
 <st53uwtdow2rl6bvmfitro2dmodxtzfnhyzon4xeeetkkwekxh@ewlzkelq25wm>
 <aQGAvLFkH80Id3p3@yuanjiey.ap.qualcomm.com>
 <br3aukcmx3p2mtowqglcuf77s5xfnfv3eisjexabxhjzigkjno@wk7sqptjn43a>
 <aQQkB6Ma2z3c6iyh@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQQkB6Ma2z3c6iyh@yuanjiey.ap.qualcomm.com>
X-Proofpoint-ORIG-GUID: gLoX75us-J5xakX9jLtYrNVfQxWSSSgZ
X-Authority-Analysis: v=2.4 cv=RbCdyltv c=1 sm=1 tr=0 ts=6904f4d6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=chW72Tx8-oYo0CBprPIA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: gLoX75us-J5xakX9jLtYrNVfQxWSSSgZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDE1OCBTYWx0ZWRfX3sv3kpjMxdr0
 PvNh688h7jZsEEk+MCJmf2tU6tDCDmsET6WFS+grKZJDYN0M10ZTjACcZW3vHVcYuUkYnjURtl+
 uQO4ZWRr+w6qVX2R+yfN3qmou4C3VQffxTPoB1dZXVqPtMnmDqcDZPwR6h1kLFvSAA11Se/80rZ
 edWBIMs1/9P7ClZo+HPFSNkS3jHm5uwtOSrxawFot5OiPooEPwmZUrrjUkCaTF3OH5FW5F+DOct
 MzuFuqjIgjpG7ZQCBIjXKavdeUyjCPDmeKEn6zwd8JrLb6/E/KYD2Uzk2nY5aFa8ra3+yS6I1UE
 5h8X+0V20wSSBb0uMi3iNQsvyHJQic4gCbTULa5k5IktLi0NzZN+WEW4w67yvpd6xmOJBCtLSdj
 7ilY7ValZ2yGzR4qeq1BAguetistpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310158
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

On Fri, Oct 31, 2025 at 10:50:47AM +0800, yuanjiey wrote:
> On Thu, Oct 30, 2025 at 08:02:13PM +0200, Dmitry Baryshkov wrote:
> > On Wed, Oct 29, 2025 at 10:49:32AM +0800, yuanjiey wrote:
> > > On Mon, Oct 27, 2025 at 03:21:33PM +0200, Dmitry Baryshkov wrote:
> > > > On Fri, Oct 24, 2025 at 10:59:07AM +0800, yuanjiey wrote:
> > > > > On Thu, Oct 23, 2025 at 02:59:12PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Thu, Oct 23, 2025 at 03:53:52PM +0800, yuanjie yang wrote:
> > > > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > > 
> > > > > > > DPU version 13 introduces changes to the interrupt register
> > > > > > > layout. Update the driver to support these modifications for
> > > > > > > proper interrupt handling.
> > > > > > 
> > > > > > So... Previous patch enabled support for the platform and it has been
> > > > > > using wrong registers for interrupts? I think that's broken.
> > > > > 
> > > > > I want to express DPU 13 has different INTF register address, so need to add new
> > > > > interrupt array to let DPU 13 interrupt work fine. Maybe I should optimize my commit msg.
> > > > 
> > > > Make sure that patches are structured logically. You can not enable
> > > > support for the hardware if the interrupts are not (yet) handled.
> > > 
> > > Kaanapali Dpu interrupts: 
> > > INTR_IDX_VSYNC,
> > > INTR_IDX_PINGPONG,
> > > INTR_IDX_UNDERRUN,
> > > INTR_IDX_CTL_START,
> > > INTR_IDX_RDPTR,
> > > INTR_IDX_WB_DONE,
> > > 
> > > are handled by irq handler, so here enable dpu_intr_set_13xx. 
> > 
> > You have enabled DPU 13 in the previous commit. And only now you are
> > adding support for interrupt registers on DPU 13.x. No, that's not good.
> 
> OK, I think I should merge this patch into the DPU 13 enablement patch. 

No, just change the order of the patches: first you add necessary driver
bits, then you add catalog entry.

> 
> Thanks,
> Yuanjie
>  
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
