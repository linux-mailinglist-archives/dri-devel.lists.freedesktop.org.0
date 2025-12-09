Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BABCB15D6
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 23:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B93610E52E;
	Tue,  9 Dec 2025 22:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjYOI/IP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V8W07/75";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C5510E52E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 22:55:31 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B9MlnBa653885
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Dec 2025 22:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=839FKuY/wlxpFZxPlD2GXAFX
 O0n8sucDpZVSLxlm8gc=; b=NjYOI/IPi5f1tKSNxc9ZuWWRHNV31v67dc+ZmhUI
 pdPWOgXXM+/V69f/NsgB4jean+AYjdeX6FvaUylzObziPYUI86wGA0mkS0y3WIMx
 mq8QXxfa8LGMCt7lI2kVsx1k4FqibqwTo5SlOVezQNr+tqVHegPo3K78iSiq68tH
 cxza5D5u5ySPyvKcc2KUgExgjAxtJP6sJENOhgZnOeTZmw8H3dVR9VCgjOvCny2t
 58HWHMiDCUufo0pEGHQ0RVS05iHZcbT6/7hC47mJJsWASfW4xBtJEj+gClL93qwy
 KGQUD6UvMu/bwaH9jFpf2zRtmMWZjZHyx+tXe4EpELE88Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axjk5279b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 22:55:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8804b991a54so227327106d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 14:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765320929; x=1765925729;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=839FKuY/wlxpFZxPlD2GXAFXO0n8sucDpZVSLxlm8gc=;
 b=V8W07/75KE+rL75l0K7pYm1h+1Tlo4YXq9AcTquOVxhut5H4D5IcaRXzZtD7OFBKmq
 kGcfHs+7DUnvQ5lFRANmmXXCQuLEgUltKhwGn9q7sWRbUNcaTBgKu8z9OcBt2k+L4peJ
 XenFl9Gp4F7Cqh5AskpB5sG5Z/NWwx42R9lxHUUXaMqONSVlvFRdfs7FoltD/nCMsqLn
 +GpEfkVzzQ6vtOXnmSw3bZEHQjyRY7rqrNuOHilHW3eXADEA11TKb5qs76NZLRYtctaJ
 2m20bH/eyQ3/7utiipNOkWbnT3+tQ0fuO4smD6RMPRP2seojPdfpbLHS5ZQRz6kU+Uz+
 pnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765320929; x=1765925729;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=839FKuY/wlxpFZxPlD2GXAFXO0n8sucDpZVSLxlm8gc=;
 b=YIenzIP7zWJVg/weUvind9YSB7JsSptXXM9qqcrpltAp2AagJlBLz/NNA2ptn4v/J7
 mqenJqwVzMzUrBIKpRK+t512joEZQFvNBVJjxeol+VLexJsY/76W41fJRxJ0uXjWbR3C
 luNufMTnK6B5Gcdvz4i+VfXPYdGbzHpS+Rh2NgpXkimW70rG66wPAkEXBf6+oTABkuLN
 nCnVJ0sl5PsMxPfXKvsweFvyJSagO6Tigo2znsJRimw1Ynp4JNu4Ykp2XZHke+i1xOUp
 nHb59N4AgSzZadvdMD74RNYP61H2vQno7SU4MpGRRmEkCceikrzAWpDvBV09+tBiKvFq
 UMFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv8s88V4GCGMnLlSercsbf+5wjyNFL0qsQoiJ0WzdokCt8Ve/U72zSgZR3AbO7virKZR1ydd+wgw4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywzyyf3dhOk4jpHrr9x8Z88+HMuGsGn9/NNJbfyuEr3wlQ/nJNN
 lL5DCaMjxPdWnB2DqK4GLhd6fy204Hpn0S0EcNEiWlxtr7EmZTQVfvS0j0801RZF1VhOOgH3j+b
 f1SSHbAX8iNa5CLbA5NpxmgHvA8t6DY5NJ8zRnVj5ExzUOVsf4g+AeJyOXJcAoQfBJpw0oGo=
X-Gm-Gg: ASbGnctqvpFwTNYUNxEGBKUAzSf6eTap3OHkAJHbgKYM0Ifcb7pxJxoySupiNDuUaE+
 AYutRbNs8xTqmVbmhosBq0LtrAbr78zcSHt4BDKO8FgzpkTXzjGgm57/fHtA4BsV7FGPxY/cnDY
 TzUW14O/3hV19df/PHSt8c4gm0sbPYvlfGZxorgETnEvedfpD+HNIt3hBQKjahK2Z7egfT3Vlcm
 VX09j2jE7534WsD1TG2p9hyaG94x5cYA4mEP6mE6eH9s1X6GyJnqQAv57nxjb37KyO1g6ZuD2RC
 IlXQLizVVr1H+Zwm8mjY7K76+AMeJUsvVswQ80AO1NBjeOnloVSdJtJJDbWT61Mf1wQUwoo5hZZ
 Cg5MmNueegP8FgS8KJKVTIQAxYF/MmNg4lZvCMvumNQSMNGPQabhr6TfeZPDslA2xDkpSD8i6GT
 DprHxMpdZmVDYcczCK5ikhE3I=
X-Received: by 2002:a05:622a:5985:b0:4ee:468b:1963 with SMTP id
 d75a77b69052e-4f1b1aa2eacmr5199041cf.58.1765320929290; 
 Tue, 09 Dec 2025 14:55:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0yzrmjMyHPciPWlJjOhkTT82T7MaoWoYb1QzzUXOw3RG0D7SfvfllRJK+YNZptuMCM/EEww==
X-Received: by 2002:a05:622a:5985:b0:4ee:468b:1963 with SMTP id
 d75a77b69052e-4f1b1aa2eacmr5198721cf.58.1765320928817; 
 Tue, 09 Dec 2025 14:55:28 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7b244e1sm5532592e87.23.2025.12.09.14.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 14:55:26 -0800 (PST)
Date: Wed, 10 Dec 2025 00:55:25 +0200
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
Subject: Re: [PATCH v5 4/4] misc: fastrpc: Update dma_bits for CDSP support
 on Kaanapali SoC
Message-ID: <nkxygm3uyiiiq7jowifpnxl7vqnli7aui6hrnpswrwac3ae6gp@heoqhurmolze>
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
 <20251202060628.1869967-5-kumari.pallavi@oss.qualcomm.com>
 <l6pf6zoz3sfawnsdmtacczykg2dgnaw4x26dfg4o3al44y7fc5@vgzd5s4uygm6>
 <5f4efb71-4d39-45e4-bb0f-dd3c3c5b3a28@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f4efb71-4d39-45e4-bb0f-dd3c3c5b3a28@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3E25eBQwyMANUaHSmNYj2npxQsBHwea9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE4MCBTYWx0ZWRfX9S80Isxucpi0
 SPZv9tKIe9qF8dKo35EDoGb1L/O0jVFYEZdJ5xDVDlYzk4WgjyvN2wb3kkVdPSJLoHTT8dzlfix
 i3+v+Q/iYyWIHdL25MnwsJFf5YOv3HW+7JqNrJTvPsun7T/LFCnYeT4mCYrsFDKGkTjl+OA1dVp
 BL2eL7jJ+FAJLrPhA+Dz6mMppR+CLrLez4jr919y5kdRBL3EdEL8N1Wx1qV4r4ZmULI7Rkt/5KE
 aDLzoFUu000EBPL5Rsb4NYuE9y4jEYovc+sgtZf1cect5c7WGAMmrl6UJ3PwhLox8LNJXG/ZdRN
 gLu6FW9wjbFS2Ef5/mMGfbes8/K7CUIcz0r/q550dc5vWM0ZLhF39Sz4h4K5Uvy5cmtIGJJTLPA
 rJtJpCXyDXWCD2bTSArnbirVi8gWQg==
X-Proofpoint-GUID: 3E25eBQwyMANUaHSmNYj2npxQsBHwea9
X-Authority-Analysis: v=2.4 cv=RqvI7SmK c=1 sm=1 tr=0 ts=6938a8e2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t6ptp7jAsjtXVIoC2L8A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090180
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

On Mon, Dec 08, 2025 at 12:34:47PM +0530, Kumari Pallavi wrote:
> 
> 
> On 12/6/2025 8:01 AM, Dmitry Baryshkov wrote:
> > On Tue, Dec 02, 2025 at 11:36:28AM +0530, Kumari Pallavi wrote:
> > > DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
> > > both Q6 and user DMA (uDMA) access. This is being upgraded to
> > > 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
> > > Kaanapali SoC, which expands the DMA addressable range.
> > > Update DMA bits configuration in the driver to support CDSP on
> > > Kaanapali SoC. Set the default `dma_bits` to 32-bit and update
> > > it to 34-bit based on CDSP and OF matching on the fastrpc node.
> > > 
> > > Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> > > ---
> > >   drivers/misc/fastrpc.c | 15 +++++++++++++--
> > >   1 file changed, 13 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index 6a67daafeaa1..c5d2c426fcbc 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -269,6 +269,8 @@ struct fastrpc_session_ctx {
> > >   struct fastrpc_soc_data {
> > >   	u32 sid_pos;
> > > +	u32 dma_addr_bits_extended;
> > 
> > s/extended/cdsp/
> > 
> 
> Thanks for your feedback.
> Here, i have used extended instead of the cdsp as to replace the
> domain-based naming with functional naming. Currently, CDSP supports an
> extended DMA address width of 34 bits due to specific use cases, but this
> could change in the future for other DSPs as well.
> Using names like "dma_addr_bits_extended" and "dma_addr_bits_default"
> would keep the design flexible and independent of domain.

And then at some point GPDSP will get yet another address width. How
would you name it?

> 
> Reference of the earlier conversation regarding the change of the name
> s/cdsp/extended
> 
> https://lore.kernel.org/all/e0d039e8-8f65-4e2e-9b73-74036dc0bb8d@oss.qualcomm.com/
> 
> Thanks,
> Pallavi
> 
> > > +	u32 dma_addr_bits_default;
> > >   };
> > >   struct fastrpc_channel_ctx {
> > > @@ -2189,6 +2191,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
> > >   	int i, sessions = 0;
> > >   	unsigned long flags;
> > >   	int rc;
> > > +	u32 dma_bits;
> > >   	cctx = dev_get_drvdata(dev->parent);
> > >   	if (!cctx)
> > > @@ -2202,12 +2205,16 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
> > >   		spin_unlock_irqrestore(&cctx->lock, flags);
> > >   		return -ENOSPC;
> > >   	}
> > > +	dma_bits = cctx->soc_data->dma_addr_bits_default;
> > >   	sess = &cctx->session[cctx->sesscount++];
> > >   	sess->used = false;
> > >   	sess->valid = true;
> > >   	sess->dev = dev;
> > >   	dev_set_drvdata(dev, sess);
> > > +	if (cctx->domain_id == CDSP_DOMAIN_ID)
> > > +		dma_bits = cctx->soc_data->dma_addr_bits_extended;
> > > +
> > >   	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
> > >   		dev_info(dev, "FastRPC Session ID not specified in DT\n");
> > > @@ -2222,9 +2229,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
> > >   		}
> > >   	}
> > >   	spin_unlock_irqrestore(&cctx->lock, flags);
> > > -	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
> > > +	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
> > >   	if (rc) {
> > > -		dev_err(dev, "32-bit DMA enable failed\n");
> > > +		dev_err(dev, "%u-bit DMA enable failed\n", dma_bits);
> > >   		return rc;
> > >   	}
> > > @@ -2311,10 +2318,14 @@ static int fastrpc_get_domain_id(const char *domain)
> > >   static const struct fastrpc_soc_data kaanapali_soc_data = {
> > >   	.sid_pos = 56,
> > > +	.dma_addr_bits_extended = 34,
> > > +	.dma_addr_bits_default = 32,
> > >   };
> > >   static const struct fastrpc_soc_data default_soc_data = {
> > >   	.sid_pos = 32,
> > > +	.dma_addr_bits_extended = 32,
> > > +	.dma_addr_bits_default = 32,
> > >   };
> > >   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
