Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8126FADDC61
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 21:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3463D10E12C;
	Tue, 17 Jun 2025 19:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c05slx93";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEA310E12C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 19:33:01 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HF6OL8022401
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 19:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pIbCnnZJnE1dRqopiLjdq4hCJ+ntywslQjBWNG2QRjo=; b=c05slx93dM0Vzsnt
 z45mupAadCboQwAcDouwa3O+fvJXGQf/4L7VcJcQWXFbp/BbnsevKCY1Jo/Zem+s
 6AONkF4GFON1rFtHqQPxN/08bNe+ud98YvqMDYCbvUR7vfcUBk183BvjUnaahyLd
 c1A5Pz+j5DKovkKdVBZW1N8Yo4TO673yS32rjQCUknNH4YJTlpEI3eqOtxLSF+oJ
 HskxX0DQvc4DEQglVRTFMMHr+/D/vaaIE3plrSh+wDgsNnFOCLL12GYHb1m44hjO
 El++9sCJAih3MgmLo6XAUWJWQKnWfKQuo/KkMsqIs498PQc4m/1aQ172MVpd/L/v
 TEke7w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mhhn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 19:32:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-311e7337f26so4611854a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 12:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750188777; x=1750793577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pIbCnnZJnE1dRqopiLjdq4hCJ+ntywslQjBWNG2QRjo=;
 b=BqRDkscNiIxX2/MbtTqypWcY0bzp/HxjrOLhYmsDEJ9zlS9k65QSm4UTWYJHWa2ukO
 or+tC3CdzOJ4RE3HO42eIBJGE6FFiqzlKvKHQobgp7s+bZqzGftndZ7aS6/7hCKbf3eq
 RoIglgyFhmNSAP3TrYgJF5fsO/X69MXVKqHUFpdbW5iD/nvietOcMKdORLZRFw4Jtak0
 g04Yfhtn0cOHVBa1UyhdFDRV+sGatIuAd3Pad7+/DpPZJfxRzGTV3+Iqw5Tgzrs9fcxs
 BsmhawWPYQh3TdL8H+kpO1VdPv+l9HAEa2fqJIHZXGN2HS8PmRprVL5MQi7JgBDyorK3
 Jmvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7u+We4vbhMurIEiWiNCgGemA4rW+ppe7f8C8UzBE4DC68E5ab3izNuIxRKGtiRP3ra8emur1l/yU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw23S6dK+Nt4UW4rzN8S36HI+LQAPcX47/f+yhzSXK9zxiYWOEc
 s/ekgrQswbgQvjX5ffx+2jblHZ3vO5qpbtgxkk3zhBYSFB+UkxFW7gD0SWuHhi0IZjW5NQE//CL
 uVM4hbIJyZgvsFjSSIYi1zIAaUfmkuBd5VBLMm060px4d0gLrShvgn74GGb5zwjHo/SH28OIp21
 /saI0rNyG4SlwgNhbuSyLj70T/3on0tHlYR6PPC1+MwU/2/w==
X-Gm-Gg: ASbGnctNOGfA/mb2FAhk7856hP9I+23X0afiNL8iYiRhy+o1GBMTP4LfibPs0DBK4QX
 LP+BSIIkwflJolvtarvkXYMcw3McALF3dyxxyoUWr9WiZ7Z+qui4tzDJGVA1IfE7whKRRREc22s
 BNs13Iz1vR+BuMQkxJp2VloX2njHhQ08BcGI8=
X-Received: by 2002:a17:90b:5243:b0:2fa:157e:c790 with SMTP id
 98e67ed59e1d1-313f1be19b6mr20149232a91.5.1750188777155; 
 Tue, 17 Jun 2025 12:32:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0Yj0B1WZz9zMPvRUBKOUkD/Z/zgMQLyHBfPoxGaC4Q3KxKeeJnyth9d8kLdV++WhAy43gMACh36zTUKBlgK8=
X-Received: by 2002:a17:90b:5243:b0:2fa:157e:c790 with SMTP id
 98e67ed59e1d1-313f1be19b6mr20149188a91.5.1750188776627; Tue, 17 Jun 2025
 12:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
 <20250506111844.1726-3-quic_jseerapu@quicinc.com>
 <qizkfszruwcny7f3g3i7cjst342s6ma62k5sgc6pg6yfoti7b3@fo2ssj7jvff2>
 <3aa92123-e43e-4bf5-917a-2db6f1516671@quicinc.com>
 <a98f0f1a-d814-4c6a-9235-918091399e4b@oss.qualcomm.com>
 <ba7559c8-36b6-4628-8fc4-26121f00abd5@quicinc.com>
 <w6epbao7dwwx65crst6md4uxi3iivkcj55mhr2ko3z5olezhdl@ffam3xif6tmh>
 <5ed77f6d-14d7-4b62-9505-ab988fa43bf2@quicinc.com>
 <644oygj43z2um42tmmldp3feemgzrdoirzfw7pu27k4zi76bwg@wfxbtgqqgh4p>
 <dc7358a1-ddc5-402e-9024-283f8e46e3b6@quicinc.com>
In-Reply-To: <dc7358a1-ddc5-402e-9024-283f8e46e3b6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 22:32:44 +0300
X-Gm-Features: Ac12FXxRqBKGZmiJYew2CCdZO7lAYLKEDGrgNFKyh4gLgwOg3EcxtK0hH17GdXA
Message-ID: <CAO9ioeVuAO6mYpBSpiTW0jhFRPtkubZ5eEskd1yLBHVdR8_YMA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE1NyBTYWx0ZWRfXxw+cTSaOMJKV
 YwC1ob662CLwqCJgIhuLMDOY7k3ExO+/a1F+fWXcFdoihEhJOiRK2dSTZICaNHWx1EIeg/LBWHg
 xGYCT0pZKZHD/nFPGx/tgKSnh+6P6wIvfBZ2EXcYRvlbybPb92r3CTk4fGlocZahoDDK+cpNy7H
 iJ0L9GR5RAwYj8RhUIi04t2nge2S7MEzLJP/2J4wHP6bYNMaOkOGoARrOaxOxeokRMJjqA/ENyW
 67VdjkR4EIzyuf63tym4l7QkCJBaZXIjgkB+sXfSjVXEWwB0RSX4kMYHitHe+yd5WM3WwqC+Amz
 nQG7Lh0ZV9RE0FemRmJMZ/H94ZTNg2ptZBQNLKPS95bXdmci3Tkr4SMqnLMuwSOkoBLhLKwQR58
 y3nz1m/RujKSGaoARzit35zg2K/UZ+oSk4jEPvQjsc+lLX9l22bT/x6VTN7E2zDRqp0fTjj7
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6851c2ea cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=COk6AnOGAAAA:8 a=60oDIgegJV5b1wVmNvgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: d31R87gox5e2CnurHyVvhwCapWGaSpYW
X-Proofpoint-ORIG-GUID: d31R87gox5e2CnurHyVvhwCapWGaSpYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170157
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

On Tue, 17 Jun 2025 at 17:11, Jyothi Kumar Seerapu
<quic_jseerapu@quicinc.com> wrote:
>
>
>
> On 5/30/2025 10:12 PM, Dmitry Baryshkov wrote:
> > On Fri, May 30, 2025 at 07:36:05PM +0530, Jyothi Kumar Seerapu wrote:
> >>
> >>
> >> On 5/21/2025 6:15 PM, Dmitry Baryshkov wrote:
> >>> On Wed, May 21, 2025 at 03:58:48PM +0530, Jyothi Kumar Seerapu wrote:
> >>>>
> >>>>
> >>>> On 5/9/2025 9:31 PM, Dmitry Baryshkov wrote:
> >>>>> On 09/05/2025 09:18, Jyothi Kumar Seerapu wrote:
> >>>>>> Hi Dimitry, Thanks for providing the review comments.
> >>>>>>
> >>>>>> On 5/6/2025 5:16 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Tue, May 06, 2025 at 04:48:44PM +0530, Jyothi Kumar Seerapu wr=
ote:
> >>>>>>>> The I2C driver gets an interrupt upon transfer completion.
> >>>>>>>> When handling multiple messages in a single transfer, this
> >>>>>>>> results in N interrupts for N messages, leading to significant
> >>>>>>>> software interrupt latency.
> >>>>>>>>
> >>>>>>>> To mitigate this latency, utilize Block Event Interrupt (BEI)
> >>>>>>>> mechanism. Enabling BEI instructs the hardware to prevent interr=
upt
> >>>>>>>> generation and BEI is disabled when an interrupt is necessary.
> >>>>>>>>
> >>>>>>>> Large I2C transfer can be divided into chunks of 8 messages inte=
rnally.
> >>>>>>>> Interrupts are not expected for the first 7 message completions,=
 only
> >>>>>>>> the last message triggers an interrupt, indicating the completio=
n of
> >>>>>>>> 8 messages. This BEI mechanism enhances overall transfer efficie=
ncy.
> >>>>>>>
> >>>>>>> Why do you need this complexity? Is it possible to set the
> >>>>>>> DMA_PREP_INTERRUPT flag on the last message in the transfer?
> >>>>>>
> >>>>>> If i undertsand correctly, the suggestion is to get the single
> >>>>>> intetrrupt for last i2c message only.
> >>>>>>
> >>>>>> But With this approach, we can't handle large number of i2c messag=
es
> >>>>>> in the transfer.
> >>>>>>
> >>>>>> In GPI driver, number of max TREs support is harcoded to 64 (#defi=
ne
> >>>>>> CHAN_TRES   64) and for I2C message, we need Config TRE, GO TRE an=
d
> >>>>>> DMA TREs. So, the avilable TREs are not sufficient to handle all t=
he
> >>>>>> N messages.
> >>>>>
> >>>>> It sounds like a DMA driver issue. In other words, the DMA driver c=
an
> >>>>> know that it must issue an interrupt before exausting 64 TREs in or=
der
> >>>>> to
> >>>>>
> >>>>>>
> >>>>>> Here, the plan is to queue i2c messages (QCOM_I2C_GPI_MAX_NUM_MSGS
> >>>>>> or 'num' incase for less messsages), process and unmap/free upon t=
he
> >>>>>> interrupt based on QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
> >>>>>
> >>>>> Why? This is some random value which has no connection with CHAN_TR=
Es.
> >>>>> Also, what if one of the platforms get a 'liter' GPI which supports=
 less
> >>>>> TREs in a single run? Or a super-premium platform which can use 256
> >>>>> TREs? Please don't workaround issues from one driver in another one=
.
> >>>>
> >>>> We are trying to utilize the existing CHAN_TRES mentioned in the GPI=
 driver.
> >>>> With the following approach, the GPI hardware can process N number o=
f I2C
> >>>> messages, thereby improving throughput and transfer efficiency.
> >>>>
> >>>> The main design consideration for using the block event interrupt is=
 as
> >>>> follows:
> >>>>
> >>>> Allow the hardware to process the TREs (I2C messages), while the sof=
tware
> >>>> concurrently prepares the next set of TREs to be submitted to the ha=
rdware.
> >>>> Once the TREs are processed, they can be freed, enabling the softwar=
e to
> >>>> queue new TREs. This approach enhances overall optimization.
> >>>>
> >>>> Please let me know if you have any questions, concerns, or suggestio=
ns.
> >>>
> >>> The question was why do you limit that to QCOM_I2C_GPI_NUM_MSGS_PER_I=
RQ.
> >>> What is the reason for that limit, etc. If you think about it, The GE=
NI
> >>> / I2C doesn't impose any limit on the number of messages processed in
> >>> one go (if I understand it correctly). Instead the limit comes from t=
he
> >>> GPI DMA driver. As such, please don't add extra 'handling' to the I2C
> >>> driver. Make GPI DMA driver responsible for saying 'no more for now',
> >>> then I2C driver can setup add an interrupt flag and proceed with
> >>> submitting next messages, etc.
> >>>
> >>
> >> For I2C messages, we need to prepare TREs for Config, Go and DMAs. How=
ever,
> >> if a large number of I2C messages are submitted then may may run out o=
f
> >> memory for serving the TREs. The GPI channel supports a maximum of 64 =
TREs,
> >> which is insufficient to serve 32 or even 16 I2C messages concurrently=
,
> >> given the multiple TREs required per message.
> >>
> >> To address this limitation, a strategy has been implemented to manage =
how
> >> many messages can be queued and how memory is recycled. The constant
> >> QCOM_I2C_GPI_MAX_NUM_MSGS is set to 16, defining the upper limit of
> >> messages that can be queued at once. Additionally,
> >> QCOM_I2C_GPI_NUM_MSGS_PER_IRQ is set to 8, meaning that
> >> half of the queued messages are expected to be freed or deallocated pe=
r
> >> interrupt.
> >> This approach ensures that the driver can efficiently manage TRE resou=
rces
> >> and continue queuing new I2C messages without exhausting memory.
> >>> I really don't see a reason for additional complicated handling in th=
e
> >>> geni driver that you've implemented. Maybe I misunderstand something.=
 In
> >>> such a case it usually means that you have to explain the design in t=
he
> >>> commit message / in-code comments.
> >>>
> >>
> >>
> >> The I2C Geni driver is designed to prepare and submit descriptors to t=
he GPI
> >> driver one message at a time.
> >> As a result, the GPI driver does not have visibility into the current
> >> message index or the total number of I2C messages in a transfer. This =
lack
> >> of context makes it challenging to determine when to set the block eve=
nt
> >> interrupt, which is typically used to signal the completion of a batch=
 of
> >> messages.
> >>
> >> So, the responsibility for deciding when to set the BEI should lie wit=
h the
> >> I2C driver.
> >>
> >> If this approach is acceptable, I will proceed with updating the relev=
ant
> >> details in the commit message.
> >>
> >> Please let me know if you have any concerns or suggestions.
> >
> Hi Dmitry, Sorry for the delayed response, and thank you for the
> suggestions.
>
> > - Make gpi_prep_slave_sg() return NULL if flags don't have
> >    DMA_PREP_INTERRUPT flag and there are no 3 empty TREs for the
> >    interrupt-enabled transfer.
> "there are no 3 empty TREs for the interrupt-enabled transfer."
> Could you please help me understand this a bit better?

In the GPI driver you know how many TREs are available. In
gpi_prep_slave_sg() you can check that and return an error if there
are not enough TREs available.

> >
> > - If I2C driver gets NULL from dmaengine_prep_slave_single(), retry
> >    again, adding DMA_PREP_INTERRUPT. Make sure that the last one always
> >    gets DMA_PREP_INTERRUPT.
> Does this mean we need to proceed to the next I2C message and ensure
> that the DMA_PREP_INTERRUPT flag is set for the last I2C message in each
> chunk? And then, should we submit the chunk of messages to the GSI
> hardware for processing?

No. You don't have to peek at the next I2C message. This all concerns
the current I2C message. The only point where you have to worry is to
explicitly set the flag for the last message.

>
> >
> > - In geni_i2c_gpi_xfer() split the loop to submit messages until you
> >    can, then call wait_for_completion_timeout() and then
> >    geni_i2c_gpi_unmap() for submitted messages, then continue with a ne=
w
> >    portion of messages.
> Since the GPI channel supports a maximum of 64 TREs, should we consider
> submitting a smaller number of predefined messages =E2=80=94 perhaps fewe=
r than
> 32, such as 16?

Why? Just submit messages until they fit, then flush the DMA async channel.

> This is because handling 32 messages would require one TRE for config
> and 64 TREs for the Go and DMA preparation steps, which exceeds the
> channel's TRE capacity of 64.
>
> We designed the approach to submit a portion of the messages =E2=80=94 fo=
r
> example, 16 at a time. Once 8 messages are processed and freed, the
> hardware can continue processing the TREs, while the software
> simultaneously prepares the next set of TREs. This parallelism helps in
> efficiently utilizing the hardware and enhances overall system
> optimization.


And this overcomplicates the driver and introduces artificial
limitations which need explanation. Please fix it in a simple way
first. Then you can e.g. implement the watermark at the half of the
GPI channel depth and request DMA_PREP_INTERRUPT to be set in the
middle of the full sequence, allowing it to be used asynchronously in
the background.

--=20
With best wishes
Dmitry
