Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D4FA6B9B6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 12:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946FB10E791;
	Fri, 21 Mar 2025 11:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8YlAQG1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9A010E791
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 11:18:05 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATBHH016545
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 11:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DKUSYoHR6fJ9Gx9eEsTaF2oL
 MprzdUw0AcuNtKcNv44=; b=P8YlAQG1SDRbzIqC2q4Nfz0GyHgq+0u+Rc0ZNDHJ
 1ICrxaboFhd5fjVpf9lZzZ6WTjuELXkaX/JUhMlMEAq4+gWgJ61Rrb+GN92V2MRu
 g9DJ1rDQFs4UmkS8mcpS5ZzZJrUMtNqQH2R2tzs0uAF2gvhSpMPidNRKKINUsObh
 tM1v+JOAwJp4pn8lNWXwF0PTJoYDxD62nOyQt3ZtVyDMN87OZ7PCyQAEn8GMHZc6
 su66goVlKESiOHIzaX6T5yyMK0R55ijnjRm/Cux2EzAe6VhKSuodhhT+uKnFibPE
 wxUZFTSndipA94ZqJVY0WIxJTNMB6yOa8waVxqORqC8tag==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gcd1cm5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 11:18:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2ff854a2541so3031391a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 04:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742555881; x=1743160681;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DKUSYoHR6fJ9Gx9eEsTaF2oLMprzdUw0AcuNtKcNv44=;
 b=o/B9FM/hB6MnNVQ8t/mroeSjJ3SGQmQxcgEmxmCGyPFu2YMMr8IAHgIzO1iNZsxGVP
 Pe8+wBqcoaKQmvA8OQh2cW/CAK3OuhgGMgPzLf+oTMY09xk+i6GJ2Ll7MaDpKwrrzVoh
 cYGVjs88FWh4QZE9qjFdZ1uTVwFcePzgwE4MK+7Rcx3cL4voCgZNdIxbBbzY0sbN7Rjj
 yidLEEfkGo2x3ocN1hxZIhzrC47cfML+glblrBBFJNy9sGmGnaunQ0cEf68fIZHFP1NB
 ir3FqADc+zfIwU/W2CSAj5bXLlbY2a4Q6yekLV41BZE/bC1fFeGZjrv7Oi/Itmo5LEgv
 v3og==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7CkjG+eL3dgZRLjRJjwW6YcbCk3VUkeD6ySwHwhb2q+5m3Y2Y8dVWhtL24Xk71g3XkcDTqjA0Qk0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXZqfQdrKeGnq46E4mxkQ96PBoINr5pWN6C+Szk0jgBzfaWyX3
 gAWl5FRg4TcheFon3UUg+2E+wQJfBAwz5/Iik9pBniFr8b4qzavelFAlar+VE8WW7/6F1p/W8tM
 u4/giM2W5WUx4y/esFzwJ+ShZg9NfWLotkIjMTS88MMFFwaCF7UHe22kQcls19xk6LFIeR2Pzh6
 NyVIsGwcP3vqXif/y06Q39NoyULpFUje/PwOQ3EUZV0Xxs3BcB3u/5
X-Gm-Gg: ASbGncsSaVMzq1+I0btxmyL91NGhq6KVLw+zflGRFCJO1bxvwcybmWX1xrjuoCizgUl
 Hb/w0TRMnrPXATFf+aGml06TJfjj5LXBxZjd9xomrZJp2tjwulaqaM+pEcndsRaQRkNInylrB7e
 17XX8/9mlhOVMvreymsv0tPcofKtr0
X-Received: by 2002:a17:90b:53c3:b0:2fe:afbc:cd53 with SMTP id
 98e67ed59e1d1-3030ff108camr4495962a91.28.1742555881127; 
 Fri, 21 Mar 2025 04:18:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYUrRBiFxt4TF2dj2f7+rt3svO89e0vefSuFBivuUS0vkcM09QvsSAFZQaqgBo6AsU157kO11HvgGAwjzYsvk=
X-Received: by 2002:a17:90b:53c3:b0:2fe:afbc:cd53 with SMTP id
 98e67ed59e1d1-3030ff108camr4495906a91.28.1742555880604; Fri, 21 Mar 2025
 04:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-5-quic_ekangupt@quicinc.com>
 <hgox77a7e6zzriltwhzzciau6u2pmil4y3rl5o2l6zkp4fmlmp@q2dai5fxcvtq>
 <49295da9-82d4-45a0-a2a4-fdaa6600c70d@quicinc.com>
 <an4cvztdkqmrt7w2iaziihlxf4tbox65ze362v2lmycjnqg26y@jizjmh2ki34z>
 <939fcff6-fb93-487b-995b-88e3ff020784@oss.qualcomm.com>
 <2k6573yrw3dyn3rpwqz4asdpx3nlmj4ornm7kmxv3f4jlc6hzg@qkwn7gqduwri>
 <e46be95c-ca8d-48ce-a616-5f068bd28ebc@oss.qualcomm.com>
 <4ca8776c-3cc7-4266-8248-4a595fa19e7f@oss.qualcomm.com>
In-Reply-To: <4ca8776c-3cc7-4266-8248-4a595fa19e7f@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 13:17:49 +0200
X-Gm-Features: AQ5f1Jqtw8pLC3Jce_RInf4WAkyM5BsJM6J6o4bkxV8dEDbjppN-Wyx9DCzNbwI
Message-ID: <CAO9ioeXVyN+gn=tHP4HsRTs=4AFrrqiyRJw3byxhrcgu4+Quqw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] misc: fastrpc: Add polling mode support for
 fastRPC driver
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=bfFrUPPB c=1 sm=1 tr=0 ts=67dd4aeb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=EdpeIRtKRTEnfPEYN64A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: peFtpKaKpCh3anhAQVBrU-kze9t6HX74
X-Proofpoint-ORIG-GUID: peFtpKaKpCh3anhAQVBrU-kze9t6HX74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_04,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210083
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

On Fri, 21 Mar 2025 at 12:18, Ekansh Gupta
<ekansh.gupta@oss.qualcomm.com> wrote:
>
>
>
> On 3/20/2025 9:27 PM, Ekansh Gupta wrote:
> >
> > On 3/20/2025 7:45 PM, Dmitry Baryshkov wrote:
> >> On Thu, Mar 20, 2025 at 07:19:31PM +0530, Ekansh Gupta wrote:
> >>> On 1/29/2025 4:10 PM, Dmitry Baryshkov wrote:
> >>>> On Wed, Jan 29, 2025 at 11:12:16AM +0530, Ekansh Gupta wrote:
> >>>>> On 1/29/2025 4:59 AM, Dmitry Baryshkov wrote:
> >>>>>> On Mon, Jan 27, 2025 at 10:12:38AM +0530, Ekansh Gupta wrote:
> >>>>>>> For any remote call to DSP, after sending an invocation message,
> >>>>>>> fastRPC driver waits for glink response and during this time the
> >>>>>>> CPU can go into low power modes. Adding a polling mode support
> >>>>>>> with which fastRPC driver will poll continuously on a memory
> >>>>>>> after sending a message to remote subsystem which will eliminate
> >>>>>>> CPU wakeup and scheduling latencies and reduce fastRPC overhead.
> >>>>>>> With this change, DSP always sends a glink response which will
> >>>>>>> get ignored if polling mode didn't time out.
> >>>>>> Is there a chance to implement actual async I/O protocol with the help
> >>>>>> of the poll() call instead of hiding the polling / wait inside the
> >>>>>> invoke2?
> >>>>> This design is based on the implementation on DSP firmware as of today:
> >>>>> Call flow: https://github.com/quic-ekangupt/fastrpc/blob/invokev2/Docs/invoke_v2.md#5-polling-mode
> >>>>>
> >>>>> Can you please give some reference to the async I/O protocol that you've
> >>>>> suggested? I can check if it can be implemented here.
> >>>> As with the typical poll() call implementation:
> >>>> - write some data using ioctl
> >>>> - call poll() / select() to wait for the data to be processed
> >>>> - read data using another ioctl
> >>>>
> >>>> Getting back to your patch. from you commit message it is not clear,
> >>>> which SoCs support this feature. Reminding you that we are supporting
> >>>> all kinds of platforms, including the ones that are EoLed by Qualcomm.
> >>>>
> >>>> Next, you wrote that in-driver polling eliminates CPU wakeup and
> >>>> scheduling. However this should also increase power consumption. Is
> >>>> there any measurable difference in the latencies, granted that you
> >>>> already use ioctl() syscall, as such there will be two context switches.
> >>>> What is the actual impact?
> >>> Hi Dmitry,
> >>>
> >>> Thank you for your feedback.
> >>>
> >>> I'm currently reworking this change and adding testing details. Regarding the SoC
> >>> support, I'll add all the necessary information.
> >> Please make sure that both the kernel and the userspace can handle the
> >> 'non-supported' case properly.
> > Yes, I will include changes to handle in both userspace and kernel.
>
> I am seeking additional suggestions on handling "non-supported" cases before making the
> changes.
>
> Userspace: To enable DSP side polling, a remote call is made as defined in the DSP image.
> If this call fails, polling mode will not be enabled from userspace.

No. Instead userspace should check with the kernel, which capabilities
are supported. Don't perform API calls which knowingly can fail.

>
> Kernel: Since this is a DSP-specific feature, I plan to add a devicetree property, such
> as "qcom,polling-supported," under the fastrpc node if the DSP supports polling mode.

This doesn't sound like a logical solution. The kernel already knows
the hardware that it is running on. As such, there should be no need
to further describe the hardware in DT. If the DSP firmware can report
its capabilities, use that. If not, extend the schema to add an
SoC-specific compatibility string. As a last resort we can use
of_machine_is_compatible().

>
> Does this approach seem appropriate, or is there a better way to handle this?
>
> Thanks,
> Ekansh
>
> >
> >>> For now, with in-driver
> >>> polling, we are seeing significant performance improvements for calls
> >>> with different sized buffers. On polling supporting platform, I've observed an
> >>> ~80us improvement in latency. You can find more details in the test
> >>> results here:
> >>> https://github.com/quic/fastrpc/pull/134/files#diff-7dbc6537cd3ade7fea5766229cf585db585704e02730efd72e7afc9b148e28ed
> >> Does the improvement come from the CPU not goint to idle or from the
> >> glink response processing?
> > Although both are contributing to performance improvement, the major
> > improvement is coming from CPU not going to idle state.
> >
> > Thanks,
> > Ekansh
> >
> >>> Regarding your concerns about power consumption, while in-driver polling
> >>> eliminates CPU wakeup and scheduling, it does increase power consumption.
> >>> However, the performance gains seem to outweigh this increase.
> >>>
> >>> Do you think the poll implementation that you suggested above could provide similar
> >>> improvements?
> >> No, I agree here. I was more concentrated on userspace polling rather
> >> than hw polling.
> >>
>


-- 
With best wishes
Dmitry
