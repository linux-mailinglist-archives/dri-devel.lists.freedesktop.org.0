Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B81ABBF2F
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 15:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6644D10E24B;
	Mon, 19 May 2025 13:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RcUXgMNs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2B310E24B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:31:45 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J6OQ9X006080
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=L8xEwTgka5qMipLW+5Bb33dA
 zxvwrmlu3G6UiVwXhUk=; b=RcUXgMNsdOuqofmkLp7IiJIN0zSm4W+QbjB4jhNd
 0d/jAsGSWISVe92VTmmxGIz882YDgKEVBlKTJ2vH1d7BLr/Kk6HlAtHmO9Hn7sqN
 dxmiJbHQuUJ9f12Bx4QN7ItU31UCGWT9AtMmqr4QdOEXywvpjdi6x0ElZSwdPw0a
 kP79nUrDuqlemi8trjgGW8xEJlg/fCHZDH1rW7LUKynV4uP82fNgpiDVHoiINae4
 uFtCLWHqwhHdnCo2Wl1o+6O8JgmMpucrjp3EX2XVt2BTGoyMS1V4xAzrnG1ozVzA
 PF7X48pK5vjFLTNpWU4Jrc6+kbsYshbHLHR3Zpn1ky/PVA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkh7cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:31:45 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-60212c73868so4055938eaf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 06:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747661504; x=1748266304;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L8xEwTgka5qMipLW+5Bb33dAzxvwrmlu3G6UiVwXhUk=;
 b=qMxVc6ePbSuZMQS79YpaSXcDHL6P9zeuJktTYTKezLdogcmHehWguZoWXIA2VGwgpA
 DjAvl4v0HrFZ30bkn2uKqCmDl7FwMpVWGAAJYqNP7eZilcWoKcj9MZFMCXexba7qOym7
 WAje0737L0odFu7ZsZRvvspRg2RaC2AcZKwNQ3P15gi7l135pJpa4FMwb/KhkHV/WZln
 gjFYjgRTDYhOL+k4nFHgkW+Vy2cgiv0afwhEbtEiRzDQgvAwi8yUQCHzPACLoET41gdX
 a23w6gNyDu7embxwYmtktv+/WlM1VXZosJfPJizrMQ9hKDwzVx75m4jTDV0OCX4SbGDI
 1d6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDCVIkm9H9D/AKPT2tiLQsueVeHchBPkKstnWxK87Fi0+5lSGs8OezkZfxV6RJdViLdtFC3O4Jyv8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwojpLjkgBJSNsA99qYgJLYJ4CBZKk+Qvic7Xa4+uAODAW7hsWD
 OK6Pzlz7CftxZfUPMvgifNCepWZ+WOTWl3cv3JkCSKKU9DduKPJw0P+/lT9aTD+jQZKGdVqGHsm
 AMZTkN8d12LdI6djOwwSSP6/T2qzTgc57dwuU/hc8PMff3GAPjNqm4VaNJrAlcRT/XPrr4sM=
X-Gm-Gg: ASbGncs7waxEt0f4DFqWqXIht/C+viqKYxW0w3HxtSFu/LAoahWRyTh7EfSujKBuOf6
 T6Bjzv7Vv/VtAYa+YT52klo857H94qik4Q3gug5ArqxQnGsq7yThLB6Lg5v5YkfsbPUuLhFWQt1
 eIiLa398GdIn4uPQfeDoUwCuXJu9tDJFxVKbOSUJGfX39Eg4CCADTxKyVMPPx8E4AnlWnqs1Yyr
 M/LRlYHicK5XuRGzvq4Z5SIR1mN2tVPX93jsHyfyAGvJiKvJo99wpXstudHEvZ0Lv16Yq2ISiLN
 gH8GyayFYlKz+pvZfmqt//2P7wwgBpOZsLYVsfZcchtPo2uV9a61xMQkJJfmIOfvB1S/06bnats
 =
X-Received: by 2002:a05:6808:338b:b0:3f6:729c:810 with SMTP id
 5614622812f47-404d864ddb7mr8301117b6e.4.1747661504048; 
 Mon, 19 May 2025 06:31:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdp4hJkr+hQ1aH2icNrS4VpXuwCtcCBkh7dVi0NWp2XPVo8VHwupqUArhoSHYb1Vez3XOnIQ==
X-Received: by 2002:a05:6808:338b:b0:3f6:729c:810 with SMTP id
 5614622812f47-404d864ddb7mr8301075b6e.4.1747661503631; 
 Mon, 19 May 2025 06:31:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e702cfedsm1873979e87.183.2025.05.19.06.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 06:31:42 -0700 (PDT)
Date: Mon, 19 May 2025 16:31:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
Message-ID: <cqwvytawzuczg3drgojfddifsqjaxtzs4dcae2rjw7dag7n7b7@pa2mkmrlvqjb>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
 <dgij4bftqzog6muu2tsaq7vxj2lpjh4ahwgrpt4ztsvch5juey@4ki5ly3pzuad>
 <b1324d19-9a61-46d4-b7cd-5fffabf95685@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1324d19-9a61-46d4-b7cd-5fffabf95685@oss.qualcomm.com>
X-Proofpoint-GUID: BYvKjvZ0or1_IbE43skxKvX_UdRkGTbj
X-Proofpoint-ORIG-GUID: BYvKjvZ0or1_IbE43skxKvX_UdRkGTbj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEyNSBTYWx0ZWRfXyupY4yJU6t9J
 3v1NEMPtUlm8/Jxg/SEB8sLnkHf3c+/4XdRB4BV/kw7zfyPPZGJZR0mnZTVa1U/mNPESvx+NSID
 Fbt8/TupPPYgKqZ5Vo0fKyf+mLERBJhh1/IrEf0G4oJIsnRY61G3PAEpDv9kb8ouX7se7BUrzKF
 OxcCWbeO+eQajSwjzhT7uYJ1Bk08YH/NnBSm3gzi4KUpH880rSrBZW5r81qo0ck57ILh7mpsewo
 wj2igr5uBmv8XcPWxgaHrhMh3ZUPAm9SqmS0on+xAPV0BCUP1G3HrRnFCXgjfDBkUoiUBhWmzGO
 CUOUvEWRuv0+/IIHbI6hoI3M7rPog/HnrMD2O1x1/6OUsTcBy+iisB0YjQt1l+rpV14NIuJNOiv
 DOZUkgy7vp2lvsZcfh+fSRxdCzA7L/X8OmejVbV6/joYE+GXIlsjsfK5HQ9nGXxapX+FEt8B
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682b32c1 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pjTExvEhKnMLeS7Jwr0A:9
 a=CjuIK1q_8ugA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190125
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

On Mon, May 19, 2025 at 04:23:28PM +0530, Ekansh Gupta wrote:
> 
> 
> On 5/19/2025 3:47 PM, Dmitry Baryshkov wrote:
> > On Tue, May 13, 2025 at 09:58:23AM +0530, Ekansh Gupta wrote:
> >> The initially allocated memory is not properly included in the pool,
> >> leading to potential issues with memory management. Set the number
> > What is 'properly'? Which issues?
> 
> inbuf.pageslen is getting updated to 1 in case buffer is allocated,

Is it a flag or some page count?

> which only
> happens if (!fl->cctx->audio_init_mem).

You are describing patch behaviour.

> 
> Till now pageslen is always 0 irrespective of whether the memory is allocated
> or not due to which audio PD is never able to use this memory.

and the is current behaviour. So this answers the first question.
'properly'. Now, the second quesiton. 'Which issues?'

> 
> I'll update this to the commit in the next spin.
> 
> >
> >> of pages to one to ensure that the initially allocated memory is
> >> correctly added to the Audio PD memory pool.
> >>
> >> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> >> Cc: stable@kernel.org
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 7 ++++---
> >>  1 file changed, 4 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index d4e38b5e5e6c..b629e24f00bc 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>  		goto err;
> >>  	}
> >>  
> >> +	inbuf.client_id = fl->client_id;
> >> +	inbuf.namelen = init.namelen;
> >> +	inbuf.pageslen = 0;
> >>  	if (!fl->cctx->audio_init_mem) {
> >>  		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
> >>  						&buf);
> >> @@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>  			list_add_tail(&buf->node, &fl->cctx->rhmaps);
> >>  			spin_unlock_irqrestore(&fl->cctx->lock, flags);
> >>  			fl->cctx->audio_init_mem = true;
> >> +			inbuf.pageslen = 1;
> >>  		}
> >>  	}
> >>  
> >> -	inbuf.client_id = fl->client_id;
> >> -	inbuf.namelen = init.namelen;
> >> -	inbuf.pageslen = 0;
> >>  	fl->pd = USER_PD;
> >>  
> >>  	args[0].ptr = (u64)(uintptr_t)&inbuf;
> >> -- 
> >> 2.34.1
> >>
> 

-- 
With best wishes
Dmitry
