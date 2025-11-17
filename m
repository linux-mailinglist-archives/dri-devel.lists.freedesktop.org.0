Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 226E4C63C75
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 12:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC5010E1C3;
	Mon, 17 Nov 2025 11:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPjZwLMx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GhoR2M03";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE3510E1C3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 11:22:51 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHBDvbN2791866
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 11:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=saGdFln8ePIC2h1NNo48wOUc
 8mA5/pec4NdFBXiEC9E=; b=PPjZwLMxt8qa4rC6Ww90bbmIwDL6/zWblIaqLnFk
 AGkT/IYzz/AKY7tQN0a2+LNQ8VytzUdgz+jHQ/lJfV34HKGMUKbxxueiHXEC5Jsg
 8V7QRdFJ/e7g1m+dUZElycPknKLPVvr49ZDdrHWG5kbQXf8LAU4pzgW2048BMTAz
 Yt6FyvI39lQcJk9kTeIIVDCH2RuFQVyTVQhbU6tK1Ij3VzdN3EDex0DpHBq4heaP
 lEgPZB83KyPt/iOHoReI97HrnuhN9bUVa9LfxHSxx9B2Ke2FyZA9yE5p7Bsa/ZyG
 V8B5k+ALGJkvrQ6jJ8iy4QP3vdL4343ZJE0GrT+Vo70cPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afu5bhcka-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 11:22:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2657cfcdaso522664285a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 03:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763378570; x=1763983370;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=saGdFln8ePIC2h1NNo48wOUc8mA5/pec4NdFBXiEC9E=;
 b=GhoR2M03cMOlk7JOPQkPRDKroiwxOjBU3dCAF3Lz1vyrhCAQGh2yeUhJpHT4pFMr6n
 9twOt1dOjnN+GaLxXiXAAjXF9gR87g532OcE56lY4nh18gJe6zLvrwVEoxf041uvnmcK
 DgLAh4SJsCLbcEK8mS457yPAUhNgTpqB6LbZTL9UkMQfmZQVtKn+dzJ7SQ+4PH+huPlt
 5Mi8jO2vohhIAcFU/F5nfg/T70vMBmO+v4+eHI7oRfS9kI/cDSOZ6gM1+r77GkzS07Z/
 T9cYQE7u/l4D34p9bdRqP5IeGCWCaBYidVnQo5AQckKBCcK2GQkt45/ghQnOM+7Cbnci
 sA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763378570; x=1763983370;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=saGdFln8ePIC2h1NNo48wOUc8mA5/pec4NdFBXiEC9E=;
 b=EJK3J2sK/QMYDxvxuT/jMu46vB9US7UsJCJSp+XWbqUtSl1H9f+7lLK1xrFzanmoAS
 ORy9vFoUwin1Y4Ynree6iTHcuMtdEwsiAj8Ui4SgOAli/gOCq1N5uJtiLNvKeM4LMJ9e
 75JC/Me+TgW5w+J1C6Y2ZPMs4QKN8izSH4wcXERPgm0uAc6iKHec3UCBXRmiONiFRu/8
 jJon5h6OCUFBgd6wlFvnFU0XQXGsh4CEUIe7cNwep3hfONP4Zy1bVa/AqEiCHL/P95Hx
 fuJfMVJ3kBfVuxD7aj6jpV0CbCf5ZaOKWf53xUTtwgxCnORpk1Wmzup/GxWeHfONovfZ
 7iLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNloFqiA3apX3kcP/J6zvce0RnBB1/L6h+BoL3PcX4Yhk34RakObern5YuDyVBE57MZb5PvEKmAeE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/d8MobHSaF9pAM/Pnnu49iSS6/GAJqhPaozEV2byKPA+m1FTf
 LPZqc7+dv2PPBD6RTRNj0zuSXsVKGQNFP/fjqwGrgUxaU+XBXRkexAjt+/63hi049AIi/HcVQ9Z
 kZGrHC2oHOM/Z8cLCVLwPKzViYb4zZnq6n/1r5+xESR/ExRzW2ZNQINYexuoILYUQ5S0jCvY=
X-Gm-Gg: ASbGnctfsl3/1Gxfe6hL7Qw+Qp2jIDkydLpU/RXQ4SylrfGKXVbBi01CCaYu8rcD/LI
 ord/dib7Wh0scys1mQqj+aArnTppuRMsFPvzEV+zkOsSrWqXmO+MLBThFdjI+z70QsmXn9HTZJO
 +OVo/IKphwhurdRSSB8/OOWsB8JYBpImOeobkiDr/N2nDnE3t/VSc/3SCLT8Nksb/TQMR3tfXum
 hcG/oe4op9vmSgctU70J54XHxKSW8IQsMWo3FINDHUU5Cb67K8MmiXzNeCTDaYj6/QrdVZyrAUY
 5zN9XlWl04SzdpikE7nkZyqGSSuWUF4tzmymje3FS3F8rcNj2yMV0QRZgfLZlZYooXPwo2wcOI8
 4/v1oW35lOHdsWdvQLuMWykl3L5Wxd33DbVURk0HY7mnsvlV/MGAXMe5HBFNYvmtN0mWsM93QRs
 grj8OHdJeseBlo
X-Received: by 2002:a05:6214:f6a:b0:87c:1f7c:76ea with SMTP id
 6a1803df08f44-88292686aabmr142405976d6.44.1763378569882; 
 Mon, 17 Nov 2025 03:22:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHM6xHarG0Uuic+iXSpLkf0hpd/24gE2X2Esqxk+QMZ4WuIdIQSPR5TNvKK4YIs3v4H/ZZ2Kg==
X-Received: by 2002:a05:6214:f6a:b0:87c:1f7c:76ea with SMTP id
 6a1803df08f44-88292686aabmr142405666d6.44.1763378569362; 
 Mon, 17 Nov 2025 03:22:49 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b305bsm3044303e87.28.2025.11.17.03.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 03:22:47 -0800 (PST)
Date: Mon, 17 Nov 2025 13:22:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, kpallavi@qti.qualcomm.com,
 srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v3 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
Message-ID: <lxa5lomfvjf6e4jxt7c67cj7q6blflvc3lpmclybag3cumxtxb@xnte42junlmc>
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-3-kumari.pallavi@oss.qualcomm.com>
 <q46rupdndsmeojv4szm3qbtcwu6n7x2ukwrrx4jd7rph7nlq5b@xiclcnpx7rc7>
 <83112aa3-5998-4030-98cb-d3d5ee7c0570@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83112aa3-5998-4030-98cb-d3d5ee7c0570@oss.qualcomm.com>
X-Proofpoint-GUID: wAtNhrfv1J9BjZpW63-k5eRxkClhsEYx
X-Proofpoint-ORIG-GUID: wAtNhrfv1J9BjZpW63-k5eRxkClhsEYx
X-Authority-Analysis: v=2.4 cv=Xvz3+FF9 c=1 sm=1 tr=0 ts=691b058a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=poC_On1pFPmngpHC2F4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA5NiBTYWx0ZWRfXyypFx28u/Jzf
 Ntc7cRHKbR4P8ha6ofjIT0uTyjQXsCCfa3hbdyt4NaOGCNF0XmWORKm+qhGkhJ8NtYirINxWD6M
 MPixb3wsb+j7J61woy6EzGJX/CClG8m6k+y4DRBskAs36k+o8gjI72uEiqrw0pR3IRJK5r+2Hnl
 S9mh4fDw2wiiw0VSedwVjktyi03ck7YjJh1z/GVWjnl1eFfevQdGZtt/yI2onV5P9YutgyQvHO2
 wmj+82wqfnUwNO7pvoSoNa57rbqBATF2XA88LH4Elp1ZVT+SDE1hiutFTmbjUSOwpP3Y7mpQXFY
 sA9u1Oe6XjbK89Ogf2bqBNnLvq/tOx+QoOXPDJLoSLgnIflNOa/at4oXU55VoIEw+mjn70vOn+J
 B1q89UBLO2J4XNMklwIjmjaURIL6vA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170096
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

On Mon, Nov 17, 2025 at 12:37:33PM +0530, Kumari Pallavi wrote:
> 
> 
> On 11/14/2025 9:14 PM, Bjorn Andersson wrote:
> > On Fri, Nov 14, 2025 at 02:11:40PM +0530, Kumari Pallavi wrote:
> > > Update all references of buf->phys and map->phys to buf->dma_addr and
> > > map->dma_addr to accurately represent that these fields store DMA
> > > addresses, not physical addresses. This change improves code clarity
> > > and aligns with kernel conventions for dma_addr_t usage.
> > > 
> > > Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> > > ---
> > >   drivers/misc/fastrpc.c | 76 ++++++++++++++++++++++--------------------
> > >   1 file changed, 40 insertions(+), 36 deletions(-)
> > > 
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index ee652ef01534..d6a7960fe716 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -106,7 +106,7 @@
> > >   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
> > >   struct fastrpc_phy_page {
> > > -	u64 addr;		/* physical address */
> > > +	u64 addr;		/* physical or dma address */
> > >   	u64 size;		/* size of contiguous region */
> > >   };
> > > @@ -171,7 +171,7 @@ struct fastrpc_msg {
> > >   	u64 ctx;		/* invoke caller context */
> > >   	u32 handle;	/* handle to invoke */
> > >   	u32 sc;		/* scalars structure describing the data */
> > > -	u64 addr;		/* physical address */
> > > +	u64 addr;		/* physical or dma address */
> > 
> > Can you go all the way and make the type dma_addr_t? That way you don't
> > need to typecast the dma_alloc_coherent() and dma_free_coherent().
> > 
> > I believe it might complicate the places where you do math on it, but
> > that is a good thing, as it highlights those places where you do
> > something unexpected.
> > 
> 
> While this not strictly limited to holding a dma_addr_t.
> Based on historical behavior, when the FASTRPC_ATTR_SECUREMAP flag is
> set, S2 mapping expects a physical address to be passed to the
> qcom_scm_assign_mem() API.
> reference-
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=e90d911906196bf987492c94e38f10ca611dfd7b
> 
> If you suggest, I can define it as dma_addr_t and perform typecasting to u64
> wherever required.

You don't need to typecase dma_addr_t when passing u64.


-- 
With best wishes
Dmitry
