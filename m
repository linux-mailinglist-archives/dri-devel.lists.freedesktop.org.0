Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3376DC0DFBE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FD510E491;
	Mon, 27 Oct 2025 13:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nV6DbO+3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E792E10E491
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:21:39 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RBK7X42547940
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rIQxrF/LR8wD4VYuDzgo4pyg
 T4/SDSgx44EBgWbrJxA=; b=nV6DbO+3V3TP7iJifABgm+p0yKf+ze7sCSnR8z4W
 +BN6EBSgDdRRkclO2PDXuygXbH34Dx4lSu/beNQirSR6yoZEvRyAsqYcaqq0PiYJ
 6KRhqhsLBQZ8h+GRrkVCFqaAWkbBc7CMiV4dPrW5U490eESJjA0/qwb2TsMGivG6
 oQxqneDieGlsqKFKokuWXfaAEaRNV1glaMSgYMV6SQJp1r+N+IBZ+VSZKXReNZNp
 rW//c0Hs7YSQz7bClrlydJx8F9Yhglv5+zMQrdHE+QZZ2uyZorQGBQs5a6zT15Lx
 MhfdyTCU3WC4zdn7UWwMjnm6RLEbYFJgwfpSWmFEgWog6A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2ga4g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:21:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4eb7853480dso150012001cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 06:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761571298; x=1762176098;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rIQxrF/LR8wD4VYuDzgo4pygT4/SDSgx44EBgWbrJxA=;
 b=XlqfOntyYCSb5Akfyvg1YOzKLGNyF0u2kQanQ0xehfLo7F1KzUkjxFfc5dLQC4YgSI
 E9J166ev5VyPIapo0arAzOIrn0UG67NsAACckrU6J7rA4oRocvnbN1mA6Rt9ouV3ZRSO
 QfLUR/djngMXJe0Ttgfz0CBe3O37WgWPqXLzNJ6y4jkX+xz/62o/KFL/+IIzXzJD9N5c
 fTCjhJpYXgxcL+T7+Dj+yxqoNBfwfg7CI0OQHxSPlQQjnJF4DO5puWLe0g9dvpc1i4uF
 ActI1pOfE4GFU3z4zsCX2K9FbB6NvJHTQoqkCHmtQA1IurYu+vD3cpU3X2HEKoqTXSmK
 tjDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwjEIJYSp+iXJ488YwtndH1LMaHAbCii7+raeaNAHGMGUbq91K9o64MRd4Mam+22uEZ6PYVywehms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIdyWMVs6Oczzw2lel6yKR021unvlwnYRwYSPxDBh3y5SjKGSe
 EXYnOz0/2gis7d64pHhnmwwU/V3JgYO5hGVFlicwH7V4ZsY/8I6u3mobopn+xJbf6EZJHjtbJjY
 fiekn65Ud24E+fKrQEgkMjBJ9nGBOODYdr74imiHex5AtKOuP3AnliVZabThZiljULCiXjZc=
X-Gm-Gg: ASbGncs2G+6Rvv62WqV7rmo76ObCQzKhHnRDtXoSk6Auzks7yk5I3tii2sRROiOTbRJ
 28d3mpXGkgliNE0HeE5SwyrcO1T2ZhJRWaG03hV8pP7FpquRoTWn4Vw7JUzg+t+N47LJpAQJfGO
 NfnZLO7KCIK4tealnkN1f8Gw4BxE/mUQcefp9iqNHvXeQI2vuK3Po+p204s6k05sr0fcsKjTt3U
 wQ77JyA6sa3QjPq7YY9fYTdm0n1rbBRZmZfh17LPMR2IoG91ADJHRjWYmBM6pDKrBkIOpW5glyo
 T2o29jWbE4IeFtihHrrEzjRWI2eG6vhvDLVrQjDTwBcQMXRbsqQlmeMfFowDfN0eT/YaxN8egzz
 23Vb0exLOKd0A3Jpv2tOb+01gCRjL7aoO1aSadsV+c2rOG0lFq0q9DgMbw4ZxcEjtZgIVyfxTrO
 JMNf/ladASQsQ9
X-Received: by 2002:a05:622a:4c12:b0:4ec:f035:d60 with SMTP id
 d75a77b69052e-4ecf0351008mr67146001cf.5.1761571298247; 
 Mon, 27 Oct 2025 06:21:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHsY3iHzVCLpUn7wkz6y9duilAb8cRKkxlio5523RK3buC8sPqKlAaBcxT2E6xXHVj0E4Anw==
X-Received: by 2002:a05:622a:4c12:b0:4ec:f035:d60 with SMTP id
 d75a77b69052e-4ecf0351008mr67143811cf.5.1761571296230; 
 Mon, 27 Oct 2025 06:21:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41bf3sm2291171e87.20.2025.10.27.06.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 06:21:35 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:21:33 +0200
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
Message-ID: <st53uwtdow2rl6bvmfitro2dmodxtzfnhyzon4xeeetkkwekxh@ewlzkelq25wm>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
 <nfekr4vi34ftxzyyf5xv4tsb5cr3tokiyfkerypqjf26dos3uq@42wcn6ji7nnb>
 <aPrre+WXogSZIE7L@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPrre+WXogSZIE7L@yuanjiey.ap.qualcomm.com>
X-Proofpoint-ORIG-GUID: 71x05D5pE4J_xTXdwQxWHINWsPctQzKu
X-Proofpoint-GUID: 71x05D5pE4J_xTXdwQxWHINWsPctQzKu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNCBTYWx0ZWRfX5kCDIWP1uog2
 fZfYtpr9xCOen3iw0qJbh87C82bgAcVsplDQGh+uEYoJ1alp13vccqOoQoWHJgdbhqbWuFwph/p
 MTIGvy7b3fQaHw1cuN3byAa1WwXXnORbakgeTQBBQzwz/VJhvB7yl/alLxBKt8LGlw7pWSo+D6h
 q3siqD+euMBgwHzbB9tNgi7FvWlxtczII72epPO5nsdPAnnSEXTAxeTe3KlnnhghM8TmY9+2i9u
 oDKWevy5Mclc2uyh8es/ltO2SqwoWXXpKqNMOfjeJCLPtCuOoKsGOndC1Eo1gAMLNuISBjt7Lh5
 iHSs3OAaKzjM6ocDqIOmM7TLGfFP1RWJtfb+eLMlPjzPDEa3+160LprvMfP2eC1kUoTm5NL4LQL
 hVewezwJHQphK8lYZPMIf52hMsyKRA==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=68ff71e2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=uwcRXY6SZ9cHZavlex4A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270124
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

On Fri, Oct 24, 2025 at 10:59:07AM +0800, yuanjiey wrote:
> On Thu, Oct 23, 2025 at 02:59:12PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Oct 23, 2025 at 03:53:52PM +0800, yuanjie yang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > 
> > > DPU version 13 introduces changes to the interrupt register
> > > layout. Update the driver to support these modifications for
> > > proper interrupt handling.
> > 
> > So... Previous patch enabled support for the platform and it has been
> > using wrong registers for interrupts? I think that's broken.
> 
> I want to express DPU 13 has different INTF register address, so need to add new
> interrupt array to let DPU 13 interrupt work fine. Maybe I should optimize my commit msg.

Make sure that patches are structured logically. You can not enable
support for the hardware if the interrupts are not (yet) handled.


-- 
With best wishes
Dmitry
