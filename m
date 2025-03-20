Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039E2A6A821
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 15:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E53D10E619;
	Thu, 20 Mar 2025 14:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mEWDKUOq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE50310E619
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 14:15:42 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KE3q9M005861
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 14:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8aBcQrbNTmhrIz1gphJsGN9i
 CmDPwX8fWpWm652biE8=; b=mEWDKUOqGxp05cdXm3S6yhSf8ONNGMBYxDsDK3sU
 MVdPOQ/6Gqjga9+mP69soGUeqKvkc38Ln2Qm0tYUrQcB3kOG6uVAugysIaGkDBWN
 jg6R3HpHiiYvEGTjuiB2m5dgQ6Vf8Y3jk2QCG8fpWXtMvwVY43gTeaxVfbUkAC5j
 Pj+sqBQBBBQ693Zsi9+rNRCHsVtUoDGTM1+aRjfdSjZrEdNjq2g0m8i/PG0Xanpg
 GLMpcQ/6UbOvp+SrD9feYs0iUXrTkYoDNoEfCrlVonI/zgY9HxZItctrSsM7vbbK
 GSx5xfrn5YhAAj6PUBDrhrwZgxu7ePAzUyA+q9+5LPa8Yg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmc1xwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 14:15:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c53e316734so174855885a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 07:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742480141; x=1743084941;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8aBcQrbNTmhrIz1gphJsGN9iCmDPwX8fWpWm652biE8=;
 b=IWpaSiUQ3kmWPclceHuwy6Jt9pk8DDg3BEdDFJaMZGQTT+F8H2aCkq8E08px9eGiOL
 Kh8gmhVAis4FAiNe5Aim7iyMv1OgHUZUNyIiSo1VAj3630bVNDvcAlRD3l+pvYQN8br6
 ECmBBG6Uq7McTc3Doz1o0Jn/NipUv9dQOQPzJTEIx5KbAFpf2wK5SdaJ4ZGggXVlp5yb
 CZPh+UM3gUQjc5WTuc3XKw1+ODbSShlqiEyQi5V19C7tSVX2BQ5XE571tlgHHkhxp5E2
 d2z1MbdLPFYVGX1k2Lj33X2RYHNPUToPCZNefbdpp4XGvLDmRM21YmoQmvcerS92BQ/6
 giCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs+j4cRTVcET0iCiJ50Jo8Pds+rEMoyfcVXv1aJNI9fl5nBk4j+vLzpneazhXO7WAj/wdTeAGx09k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIqt8SQFfByXOgKYU0N4ZDUbqlcWg1iVE3jf//c/IDzngUP/Ye
 /8+yhUJbTjDXlt06eKX3DapsuFwf87AxWBxZmfqhaDNu+GEhzXq/Mg+LCv6NV7F/QDGMxJmkueA
 ft+uP+OjI59wL96I061XUiWaVOdQiiF7HihatZQilQNidIidXkj/evb9N+l/TdtLDMNs=
X-Gm-Gg: ASbGncuFloRL9gSF4GQf1WGkl9ioMndO/9dVx0c/VakoOcS7/fycfZmySP4p6+gGAk4
 l2mtPxuNS4Pt6oni2E1KTcgWgFYMW5T4RMUTVjEH9SOpw/tHOjO7PPEPaKh1t17Pi8GsF6nzhbh
 BPk9XpxXLqdA0rISoiXaWxjMPkD8pMV6n+zWnZxwZIenmSInwbqfdJd1IhuJJc9g9SDtgC5Ca61
 1+q5tQwKALAFUi3DDrzC1lJlwTjH/1vEBcBb0w4R2w8KFp5Bi4gMRoYwa0pox5M9Yq6wNgn+0Bq
 YTBCdfhlRRIGuHyRou3DBTqneRsP0lrTe+H2dqPvZtmnjvOfkMjVIm2R5qgh4jvtEo28vbAhjLD
 mdiU=
X-Received: by 2002:a05:620a:1707:b0:7c5:4eee:5405 with SMTP id
 af79cd13be357-7c5b0d07bc3mr500716185a.35.1742480140580; 
 Thu, 20 Mar 2025 07:15:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF48Z8OdEGRPlkLUazNGK2qg1AZCI2lznykkVH1S8wwNrf4UsdJLlA4Yst7O0bQCuVa+zPlpA==
X-Received: by 2002:a05:620a:1707:b0:7c5:4eee:5405 with SMTP id
 af79cd13be357-7c5b0d07bc3mr500709485a.35.1742480139998; 
 Thu, 20 Mar 2025 07:15:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7c07b0sm2209494e87.79.2025.03.20.07.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 07:15:39 -0700 (PDT)
Date: Thu, 20 Mar 2025 16:15:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 4/5] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <2k6573yrw3dyn3rpwqz4asdpx3nlmj4ornm7kmxv3f4jlc6hzg@qkwn7gqduwri>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-5-quic_ekangupt@quicinc.com>
 <hgox77a7e6zzriltwhzzciau6u2pmil4y3rl5o2l6zkp4fmlmp@q2dai5fxcvtq>
 <49295da9-82d4-45a0-a2a4-fdaa6600c70d@quicinc.com>
 <an4cvztdkqmrt7w2iaziihlxf4tbox65ze362v2lmycjnqg26y@jizjmh2ki34z>
 <939fcff6-fb93-487b-995b-88e3ff020784@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <939fcff6-fb93-487b-995b-88e3ff020784@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tTjC_fyKzg-RCjP8VQsAKyEjbxsjYchV
X-Proofpoint-GUID: tTjC_fyKzg-RCjP8VQsAKyEjbxsjYchV
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67dc230d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=I9Tj63J92sXnRp7HOM8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200088
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

On Thu, Mar 20, 2025 at 07:19:31PM +0530, Ekansh Gupta wrote:
> 
> 
> On 1/29/2025 4:10 PM, Dmitry Baryshkov wrote:
> > On Wed, Jan 29, 2025 at 11:12:16AM +0530, Ekansh Gupta wrote:
> >>
> >>
> >> On 1/29/2025 4:59 AM, Dmitry Baryshkov wrote:
> >>> On Mon, Jan 27, 2025 at 10:12:38AM +0530, Ekansh Gupta wrote:
> >>>> For any remote call to DSP, after sending an invocation message,
> >>>> fastRPC driver waits for glink response and during this time the
> >>>> CPU can go into low power modes. Adding a polling mode support
> >>>> with which fastRPC driver will poll continuously on a memory
> >>>> after sending a message to remote subsystem which will eliminate
> >>>> CPU wakeup and scheduling latencies and reduce fastRPC overhead.
> >>>> With this change, DSP always sends a glink response which will
> >>>> get ignored if polling mode didn't time out.
> >>> Is there a chance to implement actual async I/O protocol with the help
> >>> of the poll() call instead of hiding the polling / wait inside the
> >>> invoke2?
> >> This design is based on the implementation on DSP firmware as of today:
> >> Call flow: https://github.com/quic-ekangupt/fastrpc/blob/invokev2/Docs/invoke_v2.md#5-polling-mode
> >>
> >> Can you please give some reference to the async I/O protocol that you've
> >> suggested? I can check if it can be implemented here.
> > As with the typical poll() call implementation:
> > - write some data using ioctl
> > - call poll() / select() to wait for the data to be processed
> > - read data using another ioctl
> >
> > Getting back to your patch. from you commit message it is not clear,
> > which SoCs support this feature. Reminding you that we are supporting
> > all kinds of platforms, including the ones that are EoLed by Qualcomm.
> >
> > Next, you wrote that in-driver polling eliminates CPU wakeup and
> > scheduling. However this should also increase power consumption. Is
> > there any measurable difference in the latencies, granted that you
> > already use ioctl() syscall, as such there will be two context switches.
> > What is the actual impact?
> 
> Hi Dmitry,
> 
> Thank you for your feedback.
> 
> I'm currently reworking this change and adding testing details. Regarding the SoC
> support, I'll add all the necessary information.

Please make sure that both the kernel and the userspace can handle the
'non-supported' case properly.

> For now, with in-driver
> polling, we are seeing significant performance improvements for calls
> with different sized buffers. On polling supporting platform, I've observed an
> ~80us improvement in latency. You can find more details in the test
> results here: 
> https://github.com/quic/fastrpc/pull/134/files#diff-7dbc6537cd3ade7fea5766229cf585db585704e02730efd72e7afc9b148e28ed

Does the improvement come from the CPU not goint to idle or from the
glink response processing?

> Regarding your concerns about power consumption, while in-driver polling
> eliminates CPU wakeup and scheduling, it does increase power consumption.
> However, the performance gains seem to outweigh this increase.
> 
> Do you think the poll implementation that you suggested above could provide similar
> improvements?

No, I agree here. I was more concentrated on userspace polling rather
than hw polling.

-- 
With best wishes
Dmitry
