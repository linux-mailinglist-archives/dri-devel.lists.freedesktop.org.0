Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A21ABF6C6
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 15:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1D9112D8C;
	Wed, 21 May 2025 13:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IdLtfyzm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1367113C4B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 12:45:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XLNn000850
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 12:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ks52ly5XzSYN1dVT8m4NLznvkKylPvB/qklENFGmQ+s=; b=IdLtfyzmj4AkBBcd
 pOsyTHt2WNba+cTJwRZHEVuXYR+0O+I1Sr5W/TCKfs9o6qFw2fvhKbTBZXvKtDag
 /hNxDYBjGD2CPh4/KDEBmc0nbU4jf/su49/+iaSwa2VOO1BeyxQOQkwpPTKE1AN5
 9JHzIPEd3XuQAzdZtvXAU7bXtHtamGCvjkmVr3jeI80PWOKSqX7lTFR0VyYLhL/c
 NLMSoz7DNf7BCtISBaoJqunJ1pAVv3nz52kDXW0bP+GmbeWesLNRJ/MfLkNgdsyc
 jsNK3TJ/J7oCI7uHeuz8aa2DWbNVeIaB2DM+vc8APWxbuWx9it9S+LXWyzgP0zTl
 06WXEw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6tx9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 12:45:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f8e1d900e5so43726226d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 05:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747831508; x=1748436308;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ks52ly5XzSYN1dVT8m4NLznvkKylPvB/qklENFGmQ+s=;
 b=vA41c6SbMILthF+stZxjCLXHvFBRvhNyq+jtMeY/EVsd6l4wgK6kTv3ut6/gdNI1bN
 5aV5qHYCXWVLjznXPZEYGAfPEgSAP53B85uq3k5wU9JJ5HhbgRfLpm39lN7+JEPO2NGr
 xzDdzLSqeR/p0ismnXyv8TNV/mVsBqTModpRr75HE+lmYcDWoARtTzJWITE/xS7jMVbK
 qpmbF0Kbw9ntsTqRqEnCbTxXd2MU3roCaLkXL6492E4cVrIfdVl7S3E46U44oWyGJr3b
 Q2UbgIWMKXaMcZSBLpmdnk1D7PpvwTL9fHPMffVx9WOlWej2DRnsuY4nXTXKHTZnhJqB
 TZjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIXn6v4h/zEMdxxFnQiwPyC3q6M79jTfX86VhcGlCQgkMFJ0aM+hCt1YSG1Ie54nHWthn2MB1Ou1k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxn3+I58iWoges772hFiEql8l6JaPUdY2/11axPrywLYpcP8sxb
 lzIWOnJTYoQk17DCpLXD185+Uu1gvP26F0Fzl3YaghqmcTF+UdXaDHfA3PFJ1oIdjWkmLYWQG7E
 ALfSN9V6fHnMONn4Tam7x1LM4pANR9bBYbhUB/aKvTIzvgwJ6qxYFfH7Ddsd6UevApsUZWZQ=
X-Gm-Gg: ASbGnctQXd/vqvWRqnRzzj6UEycBUbkH8c6WyvlKnGZosHtcGRK/EMXIs3KxR4D0hJF
 xMV/8J8jxnAze0ob76Yvd0LVLZmi+1GKEKHiqTY+xhKE0e79zzVNtx3JZ8fPoz+d2clqZJDDG/q
 G+mesVFrXJIfFd4RpLF2aSo0MeDfbFX8RL6/kBso3br+LNy5hh6BeN2ceKAgqZqkYDDkGgfOPQG
 LwEir5At+cFZrCW84Qk5h6hRXZiVVjlUaaq+02csOZayBbus+lNYCSasZlxnkuLd5eOJ7QWQPvw
 37IEeNUbUkwwcENGvIZC+WNBauO0JwRi4fUNYWISokbU1hicU7E2IRzhX8QpUddMeG8DVDdyV/w
 =
X-Received: by 2002:a05:6214:14ec:b0:6f8:c23c:5257 with SMTP id
 6a1803df08f44-6f8c23c82b2mr198868666d6.11.1747831507864; 
 Wed, 21 May 2025 05:45:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEShz+g9YiDU5OL+/RiZ6SU1Z6wT5YO4aHSX5TPMnkQqGJbcSQrWsL19HoCgqDtp3hVG17QAA==
X-Received: by 2002:a05:6214:14ec:b0:6f8:c23c:5257 with SMTP id
 6a1803df08f44-6f8c23c82b2mr198868336d6.11.1747831507432; 
 Wed, 21 May 2025 05:45:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e7017e6esm2826955e87.136.2025.05.21.05.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 05:45:06 -0700 (PDT)
Date: Wed, 21 May 2025 15:45:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v6 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <w6epbao7dwwx65crst6md4uxi3iivkcj55mhr2ko3z5olezhdl@ffam3xif6tmh>
References: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
 <20250506111844.1726-3-quic_jseerapu@quicinc.com>
 <qizkfszruwcny7f3g3i7cjst342s6ma62k5sgc6pg6yfoti7b3@fo2ssj7jvff2>
 <3aa92123-e43e-4bf5-917a-2db6f1516671@quicinc.com>
 <a98f0f1a-d814-4c6a-9235-918091399e4b@oss.qualcomm.com>
 <ba7559c8-36b6-4628-8fc4-26121f00abd5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba7559c8-36b6-4628-8fc4-26121f00abd5@quicinc.com>
X-Proofpoint-GUID: Q69ys1jHhsX5CG6dmW3yhF80AdLfuNY1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyMyBTYWx0ZWRfX2wGjIS4LZayG
 0xcgEFg6zeqno5Q/Aq0q1e+NbxMrNeeeEAIdRe5bqe6sRjtcWmN3PNODpiMkk5wq7NDDiM3Gean
 5py5GO5gmLM/C9Q0qIJNjWMe3G+/3JIUTdk7B5EgydGH/6ydS+UddjwP50OzDOduoV4aXuzru1X
 c6KHFuQRgEhuU14LKmiQkyh7b4T12TDfAAg0AkJsc4zgXKgtRWZGbVBthGE+D94kZFY/EuhM7+N
 +BtOI6I1ZyM5k0L4q6CFKnzn1kpa+Zjcv+LcSGtkEXUtw2miBz5FU+ENJCnKByRwURPx1zew8g8
 cGflJtVo7u6Ypet/XzlKuD2SeqDpqF4/DvZup4FyEOFVckkF3jwrngrJ0ryGlLcDOZaopYoK9a1
 HAG+6wLwyEDwM5hlDhhXuS9BEm21zOCBXhxzzsXnH+oIiD0dTeNG54GRiqXYxDoAEawrxHDR
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682dcad4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=dt9VzEwgFbYA:10 a=O67JBuyAYGrhvE3k4OkA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: Q69ys1jHhsX5CG6dmW3yhF80AdLfuNY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210123
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

On Wed, May 21, 2025 at 03:58:48PM +0530, Jyothi Kumar Seerapu wrote:
> 
> 
> On 5/9/2025 9:31 PM, Dmitry Baryshkov wrote:
> > On 09/05/2025 09:18, Jyothi Kumar Seerapu wrote:
> > > Hi Dimitry, Thanks for providing the review comments.
> > > 
> > > On 5/6/2025 5:16 PM, Dmitry Baryshkov wrote:
> > > > On Tue, May 06, 2025 at 04:48:44PM +0530, Jyothi Kumar Seerapu wrote:
> > > > > The I2C driver gets an interrupt upon transfer completion.
> > > > > When handling multiple messages in a single transfer, this
> > > > > results in N interrupts for N messages, leading to significant
> > > > > software interrupt latency.
> > > > > 
> > > > > To mitigate this latency, utilize Block Event Interrupt (BEI)
> > > > > mechanism. Enabling BEI instructs the hardware to prevent interrupt
> > > > > generation and BEI is disabled when an interrupt is necessary.
> > > > > 
> > > > > Large I2C transfer can be divided into chunks of 8 messages internally.
> > > > > Interrupts are not expected for the first 7 message completions, only
> > > > > the last message triggers an interrupt, indicating the completion of
> > > > > 8 messages. This BEI mechanism enhances overall transfer efficiency.
> > > > 
> > > > Why do you need this complexity? Is it possible to set the
> > > > DMA_PREP_INTERRUPT flag on the last message in the transfer?
> > > 
> > > If i undertsand correctly, the suggestion is to get the single
> > > intetrrupt for last i2c message only.
> > > 
> > > But With this approach, we can't handle large number of i2c messages
> > > in the transfer.
> > > 
> > > In GPI driver, number of max TREs support is harcoded to 64 (#define
> > > CHAN_TRES   64) and for I2C message, we need Config TRE, GO TRE and
> > > DMA TREs. So, the avilable TREs are not sufficient to handle all the
> > > N messages.
> > 
> > It sounds like a DMA driver issue. In other words, the DMA driver can
> > know that it must issue an interrupt before exausting 64 TREs in order
> > to
> > 
> > > 
> > > Here, the plan is to queue i2c messages (QCOM_I2C_GPI_MAX_NUM_MSGS
> > > or 'num' incase for less messsages), process and unmap/free upon the
> > > interrupt based on QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
> > 
> > Why? This is some random value which has no connection with CHAN_TREs.
> > Also, what if one of the platforms get a 'liter' GPI which supports less
> > TREs in a single run? Or a super-premium platform which can use 256
> > TREs? Please don't workaround issues from one driver in another one.
> 
> We are trying to utilize the existing CHAN_TRES mentioned in the GPI driver.
> With the following approach, the GPI hardware can process N number of I2C
> messages, thereby improving throughput and transfer efficiency.
> 
> The main design consideration for using the block event interrupt is as
> follows:
> 
> Allow the hardware to process the TREs (I2C messages), while the software
> concurrently prepares the next set of TREs to be submitted to the hardware.
> Once the TREs are processed, they can be freed, enabling the software to
> queue new TREs. This approach enhances overall optimization.
> 
> Please let me know if you have any questions, concerns, or suggestions.

The question was why do you limit that to QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
What is the reason for that limit, etc. If you think about it, The GENI
/ I2C doesn't impose any limit on the number of messages processed in
one go (if I understand it correctly). Instead the limit comes from the
GPI DMA driver. As such, please don't add extra 'handling' to the I2C
driver. Make GPI DMA driver responsible for saying 'no more for now',
then I2C driver can setup add an interrupt flag and proceed with
submitting next messages, etc.

I really don't see a reason for additional complicated handling in the
geni driver that you've implemented. Maybe I misunderstand something. In
such a case it usually means that you have to explain the design in the
commit message / in-code comments.

-- 
With best wishes
Dmitry
