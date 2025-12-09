Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD19CB15B2
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 23:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD4610E55E;
	Tue,  9 Dec 2025 22:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0qlGT2E";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yub4DtMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724F610E55E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 22:52:34 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B9MnTjj675845
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Dec 2025 22:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Vw3eepaFtTiYpjknw5gqkL1uvwE3sqy8AP9FrVBEBIs=; b=N0qlGT2ElsSQrTSp
 KvYlpQH+k+LQGHJRPSF3Q/GE57gYGSBjuxfI6laNj+rcMyeroUqZUC5ZrwxsGJw0
 1EmQxh4Px8oUBaJnnYA4KiuFWHajusAmk2O/hr9NhM68WbCf/qOK4ScQDkDbz3k2
 Ao1OmStcd5JA6QDHyEPhcFNpBGicOeQkm2Jzomaf0mGXIwUCrMljp0DDgbGcSNtt
 q3kDcNL3RaD3PhIA3Cbv7mhosXnYwXTKFW0PCjQD2R8d3UYbAeC4Hwv/IVlitDPw
 VcSRuoPtOX6Yod4Md/YPA4V4W7JbBkFBcSnXYAXWOq1CpbFEpM6G88LO5FwOShIg
 Pa5xOQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axqqn10rq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 22:52:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee09211413so145976341cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 14:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765320753; x=1765925553;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Vw3eepaFtTiYpjknw5gqkL1uvwE3sqy8AP9FrVBEBIs=;
 b=Yub4DtMH8Z73JA6yvw7jZyTFPYQCH5en3v9tJue5zRqpV2chr6uJvn40m3JQ/CaCl3
 WcTZ+0/AMlKm16TFfHcaM8Az/lxPI6BYvGabVgZ/dnBxYimegwURl2zFNQFu3+bYRMVZ
 TSs7xYPl1N6UT+0Q0Qa14Xgy0L2aeLLzVfIdgx6KurxPFv9ekmbAl4GfY7onmIIwz4AL
 agCTXIdSvUWnoNtSTzslUIQLnprDoAt1u/oU04RiEiPI53bQ7TcVaPGN9PX46LKoh2Ts
 llnATPvC3EwtGYC5e2SrQqEoA3ewtrIm4AQE8w7+40IB27pcrnck/vVs377EjClM1OaT
 bU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765320753; x=1765925553;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vw3eepaFtTiYpjknw5gqkL1uvwE3sqy8AP9FrVBEBIs=;
 b=F7qQeQ6we3WCwgjQa+TIdcZpYj64OJhKMU7HV4nc6o2g+AnvfjFvcM9lu2So9dM4wU
 1lFcA/oeuQQpNQHSBt9eYsb0cXo/8mboeLYCyuofedkrzrQhi8m/uIkQRNRxwL0PksIg
 smtlLymoLGoQFx2gvhEp1faRKWHJ1GT8oJT6YH4V7l7BtnUt/MVpV4cR3VHr8sVRvMiV
 Ysc6C7rUzaE61vnQl+Gzec7stXFJoKpOVv56vtJ/3gHl46FbqyR8Qfk6ingkyoM46Yhi
 sBnhAJaG3zNBrh9Tmhtdk+CJUacRa9+zfp4glvLu3+S5dILpqCvhS0AOeT64/eCl+DL4
 QPRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHOgozkOD/7MWMN8VatyMSxuK7Gyl++ZubRTb0CHu2WvLMGcsBRUPgGskObJ2zjSXDAyhJCz8uxsY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywkk9ytTi2ZfzvaicXefn+R39ySK3zP52OrBB1q1yfPciRHY5SB
 rcFaGBdN2CrQ32n0REva/BhkmUjj63zXrhBJOQ6m7ipbwPIuor5a56Likh3SARPHgSBLv9XLzFA
 U20pxI8DADxCwGLc8Hl0TSGOuQvRZ1Zdxq7JsJwYZ9EA9P6/mCTX+UCiSIN+VZXt8oV4yBdE=
X-Gm-Gg: ASbGncsUc8C3hbdhWnWwp9UAAY5O1pAv9lW6vDWff/RPuSHrEgzq3iLbZzWZs0d5Uis
 cL2/+c6iIqV3zXtnNn9x2kzKe8d2dO14jrPPa7Ecawk4driJLLluOK2iMuocu2Z4eS161XkY3zO
 p04SC1VO6CV2X9hTMXLXdwy8YJ2U29XKWbyuoU/xsvcMy0xF0IboPrz//psN2qTOI/YueamhLIw
 qp6QxwtO3Zlo40JPQcy4tATiIRk3FaPFfMjQQmymcZJpYNDj/OeVrFjkvpUSzhcq4WQrxWLRP0F
 YhFmikATDl8WT67j/SNhMnSwDqn9vipTYCZ1xOrjVyWWV/UzeZtPifQMJ1fWTDX9GJufp3hyfp5
 3EglK2ESmfM1buHwXCa4x6WuJ2LKMs52Z3wEH8ozwwYiZDKamVJlcoaTpCQHmBcq5CotKa5Q1xW
 sIqeidw8egjqP8i4nK757PmdI=
X-Received: by 2002:a05:622a:8388:b0:4ee:16a8:dcf with SMTP id
 d75a77b69052e-4f1b1a7dbe5mr3900251cf.46.1765320752899; 
 Tue, 09 Dec 2025 14:52:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkGvpFIuZ4h8q9ad8r80zo6A4P8mFzYpKEdgdJKsvZ5JJ9CTGMl2MYitE7FZWqI7F5OOE5sQ==
X-Received: by 2002:a05:622a:8388:b0:4ee:16a8:dcf with SMTP id
 d75a77b69052e-4f1b1a7dbe5mr3899931cf.46.1765320752416; 
 Tue, 09 Dec 2025 14:52:32 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7c281b7sm5487519e87.80.2025.12.09.14.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 14:52:31 -0800 (PST)
Date: Wed, 10 Dec 2025 00:52:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v5 3/4] misc: fastrpc: Add support for new DSP IOVA
 formatting
Message-ID: <ro7g7m42ostyc5xirx53zp7fvyobzr6zfm3huy5thlf6kwocmo@etqhbev43nfk>
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
 <20251202060628.1869967-4-kumari.pallavi@oss.qualcomm.com>
 <mlyaklczl4ngeckk7nle2xwmmzmqlphi6d47octomc5tewohh7@ipc2ik3kqj6q>
 <18c6b95a-961d-4544-856d-7dc08f7d5d74@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18c6b95a-961d-4544-856d-7dc08f7d5d74@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: RqGLZWqYAqw0qZaUCosSUIFaW-VyKlEv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE3OCBTYWx0ZWRfXzzZgWxEbBI7/
 8biXVr2IpSq5QlIQaj82blgyqixTuxbFuVxcwNS5021vG4BbOJpTlS8TpL/zo2fycw0SPyX8vD+
 qPFXJ2Um0/zNtXnXDY4BANjbElhoJcrBzHxeCIdiLYdzvSDn9aouUxruKb/rb53B36jY3ECKbAs
 yrRwydGamEoeLy2sUj6xdzNssStUQvMU4ImEKl6E6XMcxTXxskeJA5ntvKuw6O0+oSvLqeEklxy
 rx8O0AVku+VeIFiCCESN6RczIScdPRUBNtpQ4I0JsrPdESBAqYHdcSQwJlI9GvBYBHUpNX9bPQ2
 t7OQIHDW/gpmfocHPmoEqdQFfXztCp8QaCWy6CmNcuH6AhP8M1AkG3u2i4KD3682og4aeb90nbC
 AHfdgmnJmPK7gmWqpfSBWK1bUlZ+eQ==
X-Authority-Analysis: v=2.4 cv=A5Jh/qWG c=1 sm=1 tr=0 ts=6938a831 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=07XtER_QmKxSY4CyyCsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: RqGLZWqYAqw0qZaUCosSUIFaW-VyKlEv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090178
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

On Mon, Dec 08, 2025 at 12:56:18PM +0530, Kumari Pallavi wrote:
> 
> 
> On 12/6/2025 8:00 AM, Dmitry Baryshkov wrote:
> > On Tue, Dec 02, 2025 at 11:36:27AM +0530, Kumari Pallavi wrote:
> > > Implement the new IOVA formatting required by the DSP architecture change
> > > on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
> > > physical address. This placement is necessary for the DSPs to correctly
> > > identify streams and operate as intended.
> > > To address this, set SID position to bit 56 via OF matching on the fastrpc
> > > node; otherwise, default to legacy 32-bit placement.
> > > This change ensures consistent SID placement across DSPs.
> > > 
> > > Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> > > ---
> > >   drivers/misc/fastrpc.c | 48 ++++++++++++++++++++++++++++++++++++------
> > >   1 file changed, 41 insertions(+), 7 deletions(-)
> > > 
> > > @@ -789,7 +807,8 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
> > >   		map->dma_addr = sg_phys(map->table->sgl);
> > >   	} else {
> > >   		map->dma_addr = sg_dma_address(map->table->sgl);
> > > -		map->dma_addr += ((u64)fl->sctx->sid << 32);
> > > +		map->dma_addr += fastrpc_compute_sid_offset((u64)fl->sctx->sid,
> > 
> > Drop type conversion. Hmm. Looking at it, would it be better:
> > 
> > map->dma_addr = fastrpc_compute_dma_addr(fl->sctx, sg_dma_address(map->table->sgl))
> > 
> 
> Thanks for the suggestion. To confirm: you’re proposing that the call site
> use a single helper returning the final DMA address, i.e.
> 
> map->dma_addr = fastrpc_compute_dma_addr(fl,
>                                          sg_dma_address(map->table->sgl));
> I can implement fastrpc_compute_dma_addr() as a thin wrapper that internally
> calls our existing fastrpc_compute_sid_offset() and composes the
> consolidated IOVA (SID in upper bits, base DMA/PA in lower bits)
> ?

Yes

> 
> 
> > > +				 fl->cctx->soc_data->sid_pos);
> > >   	}
> > >   	for_each_sg(map->table->sgl, sgl, map->table->nents,
> > >   		sgl_index)

-- 
With best wishes
Dmitry
