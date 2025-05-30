Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962CBAC92BA
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 17:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C4410E146;
	Fri, 30 May 2025 15:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzBgQQMJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF63F10E146
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 15:53:26 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAKBth011635
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 15:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ocOy+iZ89dtnyBaWmC5MMBRHZ5mWFLMjUsmdth3Z8GQ=; b=dzBgQQMJcDYDo0LK
 6yPAzdvLQ2Nq+0MD/gsuqA9Uss3k+D3+NaFHTO1C3/ZXvC7/MXzq/otbMXCyXOxi
 L922xEIey+YB5mukNZhJYq4dZxe2i7bbzOz5oAJoS2nGV6iwd0MYaQEZpFO/xJCl
 1CLky+oH5RGBrOc9xUAg6TWPnn+sQ0CoYYXRBnPTIpjyo4lJvCIP+RUq/E0OAUIG
 dELuuU1Or3wdqr6jhEr4jIUm1NXl39tsa82UibKB2uoZaK/wmDc1/6MnByMJhLyi
 K26kcC0TzFaB5NXIw9Fxkf2hMVYOSGeseonnY0SUvujMSlB/cN/lm/+aESk28UNs
 joql/Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g99ptx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 15:53:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2349498f00eso25328165ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 08:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748620401; x=1749225201;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ocOy+iZ89dtnyBaWmC5MMBRHZ5mWFLMjUsmdth3Z8GQ=;
 b=Z7bhdxwXANY5mL6mlY6MbdBtsoWkYzfJSEghJS1ZAPhxAC7Rkt5VWVJHob95Uyjr78
 U2anbRGVMQt9w/QK7vr+3qx87BSC8mixVb1GviPMy8ISckuWHtezjpcjNKM7DTGj0Hpm
 NN5eyBI+w2IJkkErlI969x7JFua/Pnf8iOcXRnp/KBEGl7eji6Lu3P14mAVoEDuZVe2y
 vQG5fnIEneCGS8ZWBwFYOBAzqTafiISikNEPF7aZJu2HdmiVFhH5rhDmhsBsI3k3HLSz
 CsYUKYl6m/OTXRumJMqf6qvGHlQ8K1SysiVD0zugLH1BVbXl/IG5uKZlpn3IIukiU9Yx
 qHWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3PZ5BM9P6XpUubou0oKbNuaqD99Oa4csnIarIdGGodrLLFptuREyjYfiPumYH6GaE27L+6I0aW8Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvYV1OBp82jlh7vWofLV34qNPNSlsssivmN54ItYLW6+NNzyXm
 8l+m7yHsMvwyAo6iqLAOQR+KYIFf2EN+wSO3xIos92/5QocV8FF2Ico0LWr2BdSA3LprouV0EiC
 fUasYeipDL16JDuhlK9hcQ990a55kKHjymibMKgP25Opy7dXI6sVlGdEQewrlvAx7QSJK6mY6Ez
 qUqrHzG44TmyU3NaNSV9JgdJIZRjjz829gDxOqFGlseq1iyA==
X-Gm-Gg: ASbGncv0RlVtX2cT01vPZL5QKtLwEJz1TA8BAQfpRH7/SC1TIxU9NYKuM2gCODC531L
 l6+rdBKa8ddv07qQTYjnwIKvXT5NnDSEtumhTjAJaA6UIL9D8pyI5W/3gPxfSlYruK2SQRfPF8c
 NMnfz7fZBdViDwjkWyOCSoPLDl9A==
X-Received: by 2002:a17:90b:2f03:b0:30a:9feb:1e15 with SMTP id
 98e67ed59e1d1-31214e2efabmr13566576a91.8.1748620401279; 
 Fri, 30 May 2025 08:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI8DQTJOy6Ygl/JjuDr7iVO/pS/KdYmD4s/dC0D+LEaOkPASzhJTKviMamfZXKSwSf5rgo3UuFLaa45v1W+Tk=
X-Received: by 2002:a17:90b:2f03:b0:30a:9feb:1e15 with SMTP id
 98e67ed59e1d1-31214e2efabmr13566509a91.8.1748620400596; Fri, 30 May 2025
 08:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
 <20250506111844.1726-2-quic_jseerapu@quicinc.com>
 <ze5y6llgo2qx4nvilaqcmkam5ywqa76d6uetn34iblz4nefpeu@ozbgzwbyd54u>
 <4456d0e2-3451-4749-acda-3b75ae99e89b@quicinc.com>
 <de00809a-2775-4417-b987-5f557962ec31@quicinc.com>
In-Reply-To: <de00809a-2775-4417-b987-5f557962ec31@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 30 May 2025 18:53:09 +0300
X-Gm-Features: AX0GCFsEgcxsXpdIFfOsAqXa1UzndXO-yjeJj8vejz0KsNKmM_D-7yinEUW3MbU
Message-ID: <CAO9ioeUW9-7N2Ptu_p=XKzeb02RsXx8V3CzarPOD4EWy4QrnsA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
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
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=6839d472 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=COk6AnOGAAAA:8 a=mdKvkispvZj9PeQf9s4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: lE-vdAVXxt9pe2NwIwtLuzDcYrtmBKsV
X-Proofpoint-GUID: lE-vdAVXxt9pe2NwIwtLuzDcYrtmBKsV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDEzOSBTYWx0ZWRfX5idUQQZH4+aq
 gQxx439+fgQYUnvhfNwNz9czB4DnuqlfT27xmmXT9HRDhtzhaBsUOFNP23u0OVYUFP1T15l6QY2
 zu9tQmia5A4gSvQTK/Om/1f5Z/82oYHffXbvacwXfcSRamIXfIajPzF0pXcU9K2oBHhaeRKkBMM
 cc+Wza6LOALSBzBFXResk1MXxdpd4SKQpnXO8vgB9IDbhMEXnVJUUol7t0bd2tujDbfP3pqofbx
 oVFmjuFgJARjqx0t959ZJd+/k31FOwrsfUf1zLeXBZLBfZrmNzxkUoqGZX80fOFHNfeyJ7YCt49
 gye8/4ktR7qGgm5HgdhaFY4lGWXqm93FNIoqdNhexe3JdykBJL34mY1jA1MGPlHMuA8qt/sRbYM
 DusOMH77banXDrRxTlh2jWaKp/2hIdiB7Ajhj5asHkydBtpFjW0FuGKJdDwr6OuDnhEZElFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300139
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

On Fri, 30 May 2025 at 17:05, Jyothi Kumar Seerapu
<quic_jseerapu@quicinc.com> wrote:
>
>
>
> On 5/9/2025 11:48 AM, Jyothi Kumar Seerapu wrote:
> >
> >
> > On 5/6/2025 5:02 PM, Dmitry Baryshkov wrote:
> >> On Tue, May 06, 2025 at 04:48:43PM +0530, Jyothi Kumar Seerapu wrote:
> >>> GSI hardware generates an interrupt for each transfer completion.
> >>> For multiple messages within a single transfer, this results in
> >>> N interrupts for N messages, leading to significant software
> >>> interrupt latency.
> >>>
> >>> To mitigate this latency, utilize Block Event Interrupt (BEI) mechani=
sm.
> >>> Enabling BEI instructs the GSI hardware to prevent interrupt generati=
on
> >>> and BEI is disabled when an interrupt is necessary.
> >>>
> >>> When using BEI, consider splitting a single multi-message transfer in=
to
> >>> chunks of 8 messages internally and so interrupts are not expected fo=
r
> >>> the first 7 message completions, only the last message triggers
> >>> an interrupt, indicating the completion of 8 messages.
> >>>
> >>> This BEI mechanism enhances overall transfer efficiency.
> >>>
> >>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> >>> ---
> >>> v5 ->v6:
> >>>    - For updating the block event interrupt bit, instead of relying o=
n
> >>>      bei_flag, decision check is moved with DMA_PREP_INTERRUPT flag.
> >>> v4 -> v5:
> >>>    - BEI flag naming changed from flags to bei_flag.
> >>>    - QCOM_GPI_BLOCK_EVENT_IRQ macro is removed from qcom-gpi-dma.h
> >>>      file, and Block event interrupt support is checked with bei_flag=
.
> >>>
> >>> v3 -> v4:
> >>>    - API's added for Block event interrupt with multi descriptor
> >>> support for
> >>>      I2C is moved from qcom-gpi-dma.h file to I2C geni qcom driver fi=
le.
> >>>    - gpi_multi_xfer_timeout_handler function is moved from GPI driver=
 to
> >>>      I2C driver.
> >>>
> >>> v2-> v3:
> >>>     - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handle=
r
> >>>     - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
> >>>     - Added documentation for newly added changes in "qcom-gpi-dma.h"
> >>> file
> >>>     - Updated commit description.
> >>>
> >>> v1 -> v2:
> >>>     - Changed dma_addr type from array of pointers to array.
> >>>     - To support BEI functionality with the TRE size of 64 defined in
> >>> GPI driver,
> >>>       updated QCOM_GPI_MAX_NUM_MSGS to 16 and NUM_MSGS_PER_IRQ to 4.
> >>>
> >>>   drivers/dma/qcom/gpi.c           | 3 +++
> >>>   include/linux/dma/qcom-gpi-dma.h | 2 ++
> >>>   2 files changed, 5 insertions(+)
> >>>
> >>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> >>> index b1f0001cc99c..7e511f54166a 100644
> >>> --- a/drivers/dma/qcom/gpi.c
> >>> +++ b/drivers/dma/qcom/gpi.c
> >>> @@ -1695,6 +1695,9 @@ static int gpi_create_i2c_tre(struct gchan
> >>> *chan, struct gpi_desc *desc,
> >>>           tre->dword[3] =3D u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_T=
YPE);
> >>>           tre->dword[3] |=3D u32_encode_bits(1, TRE_FLAGS_IEOT);
> >>> +
> >>> +        if (!(i2c->dma_flags & DMA_PREP_INTERRUPT))
> >>> +            tre->dword[3] |=3D u32_encode_bits(1, TRE_FLAGS_BEI);
> >>>       }
> >>>       for (i =3D 0; i < tre_idx; i++)
> >>> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/
> >>> qcom-gpi-dma.h
> >>> index 6680dd1a43c6..ebac0d3edff2 100644
> >>> --- a/include/linux/dma/qcom-gpi-dma.h
> >>> +++ b/include/linux/dma/qcom-gpi-dma.h
> >>> @@ -65,6 +65,7 @@ enum i2c_op {
> >>>    * @rx_len: receive length for buffer
> >>>    * @op: i2c cmd
> >>>    * @muli-msg: is part of multi i2c r-w msgs
> >>> + * @dma_flags: Flags indicating DMA capabilities
> >>>    */
> >>>   struct gpi_i2c_config {
> >>>       u8 set_config;
> >>> @@ -78,6 +79,7 @@ struct gpi_i2c_config {
> >>>       u32 rx_len;
> >>>       enum i2c_op op;
> >>>       bool multi_msg;
> >>> +    unsigned int dma_flags;
> >>
> >> Why do you need extra field instead of using
> >> dma_async_tx_descriptor.flags?
> >
> > In the original I2C QCOM GENI driver, using the local variable (unsigne=
d
> > in flags) and updating the "DMA_PREP_INTERRUPT" flag.
> >
> > Sure, i will review if "dma_async_tx_descriptor.flags" can be retrieved
> > in GPI driver for DMA_PREP_INTERRUPT flag status.
>
> Hi Dmitry,
>
> In the I2C Geni driver, the dma flags are primarily used in the
> dmaengine_prep_slave_single() function, which expects the argument type
> to be unsigned int. Therefore, the flags should be defined either as
> enum dma_ctrl_flags, or unsigned int.
>
> In the GPI driver, specifically within the gpi_prep_slave_sg() function,
> the flags are correctly received from the I2C driver. However, these
> flags are not currently passed to the gpi_create_i2c_tre() function.
>
> If we pass the existing flags variable to the gpi_create_i2c_tre()
> function, we can retrieve the DMA flags information without introducing
> any additional or external variables.
>
> Please confirm if this approach=E2=80=94reusing the existing flags argume=
nt in
> the GPI driver=E2=80=94is acceptable and good to proceed with.

Could you please check how other drivers use the DMA_PREP_INTERRUPT
flag? That will answer your question.

>
> >>
> >>>   };
> >>>   #endif /* QCOM_GPI_DMA_H */
> >>> --
> >>> 2.17.1
> >>>
> >>
> >
> >
>


--=20
With best wishes
Dmitry
