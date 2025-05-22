Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A270AC0B63
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 14:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEFC10EB29;
	Thu, 22 May 2025 12:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgaVWke/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCFB10E9A7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:11:56 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7K999013486
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1OvU4OaQPAAxsTJt9AcdgBDD
 Dut4RQiRmCJONEEZXas=; b=FgaVWke/p5ieGS5LDE2P/OYFDZd72vFGr1CTI5Kc
 +ZdfaaElguxJ0CEye1JaW7EY43hMvLmBbzZUdMh9LOowzK9qJw/+IbBXgXZhHyYi
 yV3LQDPV/IUGaikhVzjJnsi/bKD+Ny5Ov4qUkUhbsKp8aF1HpQQ/dDqFfph9bAUq
 yAgf8cduT0NC3AHJak9km52QXudDz24OlBlkPNveP9EG98qIjM8bkQMULtUdLjuQ
 DXTUSOd+a4F9gTpL20tdX5NagUlE9DCLqAYbs2NRkdpqgx7JoE6Fvhlkb0YPKK0Z
 2x8sKsIL7fcbILh+76tX0ZI2EOwIHoEeldX3Z5/Cx7NEpg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5ed52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:11:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-23209d8ba1bso50169805ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 05:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747915915; x=1748520715;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1OvU4OaQPAAxsTJt9AcdgBDDDut4RQiRmCJONEEZXas=;
 b=Z4ltXNqAr/DsiYqE5vwJ+o+PpNu3S3nvtlGJaBz1Jizd1HRyn2t1gIXSti1wyeFs6/
 hUZ2boWRh9vcgi7K0PzMSOx/TdP52haIUMgg+H2D4hdYrgIj0U3s9114YqI6tEmG4If6
 vfOu+B7IatWX28Vqv4dlPnwDwailrFtIeYgfkaV0eY7/L4223xnjbHNc773NdS9q+gqW
 npCAX64zzAlnTXotZmu5Zf5gMiHXg9JIrL3YqU5tcSJdR3O2Xru03riTcjoIuUEopyyh
 0ILHXBDe067/B00Xq2Tsvd1tlMkxt0gXVOfOnCFwC6gjYZlTsE5cky2+orC6gOD032rS
 Ym5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIoqWCz9XTH6bxhhbwcfg4HnP+1PzeISck0aQCRPQmXztbhNlMkXv92ZgCaDEobNt7fWaa68kj4Ak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2oW9vJk3np8bbL4FO693DDNu1hmE8ZYKzvo0Lcs7YYXPacg7I
 m8h8E6sqZ4KEEGh+ANsMyhv34ZFFf5ikfb6CzEHh6no3U3NOtVxCE02rQkYZBz9WCJLCKe16XXK
 EfYM2XuAevDHGdYrMsOz0NPGPACDUsSEpLqXXCaJ2TYn17eURsaTL+qrJ6/8FBtL+DhIm05/nEs
 cELBlyacNH8b3wdyaYxiL1weWAHjlN/55PbFxxm8XXCfroCw==
X-Gm-Gg: ASbGncs2to0injLQqTmTTck3voIORwS5ahf9VR/PkuffsY8feSu/WHUnd3/ZmZ7d6EW
 W52GjOiGppt/bmm07aSTp7lN99Ra4pjCQqlXO+XAaWqP2+O9dOEqnGznNL+xnyzAmhtwUAuFYX7
 00ducW57Q=
X-Received: by 2002:a17:902:d4d2:b0:231:faf5:c1d0 with SMTP id
 d9443c01a7336-231faf5c3ecmr354091895ad.24.1747915915321; 
 Thu, 22 May 2025 05:11:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESIl+YAA+LmGGozI0lWLtu1kBwk65N5SNlCdpiBMOASwRP9Ac6amhIibfmRF/Rk9s+GFOqroMlir5kClZwazo=
X-Received: by 2002:a17:902:d4d2:b0:231:faf5:c1d0 with SMTP id
 d9443c01a7336-231faf5c3ecmr354091545ad.24.1747915914913; Thu, 22 May 2025
 05:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
 <dgij4bftqzog6muu2tsaq7vxj2lpjh4ahwgrpt4ztsvch5juey@4ki5ly3pzuad>
 <b1324d19-9a61-46d4-b7cd-5fffabf95685@oss.qualcomm.com>
 <cqwvytawzuczg3drgojfddifsqjaxtzs4dcae2rjw7dag7n7b7@pa2mkmrlvqjb>
 <36327516-3db9-4bc7-ae2d-162135466e7e@oss.qualcomm.com>
In-Reply-To: <36327516-3db9-4bc7-ae2d-162135466e7e@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 15:11:43 +0300
X-Gm-Features: AX0GCFvYuxPUpH8myXBy6T_C47lECUFkSMBFRBtjqAqbhfjKJulCyzwdkmj7MpI
Message-ID: <CAO9ioeVCU50YX8jYdCxTZ066GjpKW3kL+4mA=PMrOEROb1szuA@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyMyBTYWx0ZWRfXxzawDWLnCjE6
 1b12tSfDsIxvAkKfYSZoINFH//xO86xLN3UdmyNx1/QsTr0cNg++sVrnmzy+lxB8aFYFwEvy+WD
 DVXVy8vtvMOwZVmbA+jV/HasmGOJVny5+vZt8ohsi3HQwlPJimCPg+7961Htr0rWUiu29ykIf3/
 CFV92ujW01VSHuVeaFdEIMtcN4xlnYNaACoSgBm7hiFWJZnN6p7Umk9oR1L9sA1gPq5e7XJVAmN
 J2wT2vdjNXeW4uQU+/pqPOPb0KV83wVKE84XwTMfAbI7Xa0s4vcnXpAoAG2W/2j+sKDKbX/fLNM
 9+19Q5xZeollT04qluz9G8HHydkdIdyu9WOgoDVku58zPsHoDLd8zCzuHUUzhGcQEtp3dlb2dzk
 yDPe4r0FpymWpqpetxapLKQvIcnVGSGbTlkDHmrLVEXY16xBYTscCprAFYJXBz3mGcoZmrfT
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682f148c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=vDpd8R7RqsPVAR_k8fEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: L3RXXHK1ZSjYRLKRrS9K4Ozq-lwnv0Rt
X-Proofpoint-ORIG-GUID: L3RXXHK1ZSjYRLKRrS9K4Ozq-lwnv0Rt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220123
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

On Thu, 22 May 2025 at 07:58, Ekansh Gupta
<ekansh.gupta@oss.qualcomm.com> wrote:
>
>
>
> On 5/19/2025 7:01 PM, Dmitry Baryshkov wrote:
> > On Mon, May 19, 2025 at 04:23:28PM +0530, Ekansh Gupta wrote:
> >>
> >> On 5/19/2025 3:47 PM, Dmitry Baryshkov wrote:
> >>> On Tue, May 13, 2025 at 09:58:23AM +0530, Ekansh Gupta wrote:
> >>>> The initially allocated memory is not properly included in the pool,
> >>>> leading to potential issues with memory management. Set the number
> >>> What is 'properly'? Which issues?
> >> inbuf.pageslen is getting updated to 1 in case buffer is allocated,
> > Is it a flag or some page count?
>
> This is page count,

If it is page count, then why is it '1' instead of being calculated
based on the init.memlen?

> based on this count, DSP with add memory to audioPD
> pool. If it is 0, the memory is not added.
>
> >
> >> which only
> >> happens if (!fl->cctx->audio_init_mem).
> > You are describing patch behaviour.
> >
> >> Till now pageslen is always 0 irrespective of whether the memory is allocated
> >> or not due to which audio PD is never able to use this memory.
> > and the is current behaviour. So this answers the first question.
> > 'properly'. Now, the second quesiton. 'Which issues?'
>
> The issues is actually memory leak as the initial memory is never
> used by audio PD and it will immediately make a remote heap request
> as no memory is added to the pool initially.
>
> I'll capture this also in the commit text.
>
> >
> >> I'll update this to the commit in the next spin.
> >>
> >>>> of pages to one to ensure that the initially allocated memory is
> >>>> correctly added to the Audio PD memory pool.
> >>>>
> >>>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> >>>> Cc: stable@kernel.org
> >>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/misc/fastrpc.c | 7 ++++---
> >>>>  1 file changed, 4 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >>>> index d4e38b5e5e6c..b629e24f00bc 100644
> >>>> --- a/drivers/misc/fastrpc.c
> >>>> +++ b/drivers/misc/fastrpc.c
> >>>> @@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>>>            goto err;
> >>>>    }
> >>>>
> >>>> +  inbuf.client_id = fl->client_id;
> >>>> +  inbuf.namelen = init.namelen;
> >>>> +  inbuf.pageslen = 0;
> >>>>    if (!fl->cctx->audio_init_mem) {
> >>>>            err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
> >>>>                                            &buf);
> >>>> @@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>>>                    list_add_tail(&buf->node, &fl->cctx->rhmaps);
> >>>>                    spin_unlock_irqrestore(&fl->cctx->lock, flags);
> >>>>                    fl->cctx->audio_init_mem = true;
> >>>> +                  inbuf.pageslen = 1;
> >>>>            }
> >>>>    }
> >>>>
> >>>> -  inbuf.client_id = fl->client_id;
> >>>> -  inbuf.namelen = init.namelen;
> >>>> -  inbuf.pageslen = 0;
> >>>>    fl->pd = USER_PD;
> >>>>
> >>>>    args[0].ptr = (u64)(uintptr_t)&inbuf;
> >>>> --
> >>>> 2.34.1
> >>>>
>


-- 
With best wishes
Dmitry
