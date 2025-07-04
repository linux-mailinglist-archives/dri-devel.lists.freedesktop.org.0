Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5181DAF93B4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 15:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158C110EA39;
	Fri,  4 Jul 2025 13:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX/u+KF/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3EA10EA3B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 13:09:24 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564AQc8r010068
 for <dri-devel@lists.freedesktop.org>; Fri, 4 Jul 2025 13:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZmMxWadnM8fMpQdZsfFV0mCz
 lb8kLIYp9mRGtmk3Ik4=; b=RX/u+KF/TCRwufrmdPoRk2Xy8C8C+pUNh2gHs5nq
 5GOWTBiMVi+QM02wyes4ybGfRJep5m97o8cn2OjMdLMvQQcQwJriwVp+KCoMNn+p
 ThtZ2G5xXSxSdCJW0xUSy9ywsUbZT88fytNMn7Yc6zx7jy/FHw72szp5rMAHuXp8
 EXjroAHQmYog3pWrYwoRe3NYm1xDA4G7Dcv4d+tmK8lVL8UUQ2ERh9XFBmPdKYnw
 18Xb6CV5j4sy1okz/aGPEPA2mPXMc3qmPuJwU/MTu3SMez/HzExl2YUxNrCTnSqJ
 4PMJhEB4vcHUO4mTVprXbN3/JY7GtHdyyglXReBxtGIdnw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pd6w0ger-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 13:09:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5bb68b386so234243785a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 06:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751634563; x=1752239363;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZmMxWadnM8fMpQdZsfFV0mCzlb8kLIYp9mRGtmk3Ik4=;
 b=R4d7qaYkhheOmGdrJPoUPxDGnIjWJVjAEhKPK9C27GUhGEL+uICB2/TqiLtORd7wB+
 iFjvopEux/nlgO1Q74A9jOKgSCu7fyKrl0pe/uxjxHctZyw9JeB111ay9mD2mUlA2c9K
 l9OcmsXQ/XWh3kSptpUHYfUIERV8m6/3Q658YTNdshCdiaRSWemZWxEfizuGlrkj1Nw/
 lD6CwxcOr3u4LYzphxoL6zYbga8IeocgHYH6P3bn7LeI9uQqxIKSnXOijiTY8Qcmk5E/
 EtnqfKbEqNKIaVL4UkQGxtFzOOdpe0I9qnobXSqPOrAmAruQlnCstNl3k+/m7YeybTPl
 fhbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWozD52M2jMeUB3NZmwaG4dxrIv8fzhBMyLxxjNXKY9mzOXsempyT6E+2CAwdxCMcspJsj9wHTjTqc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGqiYDeab0dnvySdI7V9yecn1Ve2v/3J2JQ6IfqhKLgbtNLB1o
 rxuUUhRDYx25nR9ADI3W1vvIOUkwj/BMhwQqw6QG+sqIwsIA1g8GBtNoSw1po4MgcixZq5Cz6M9
 GW+F2HZa9BXL5zAihRRiR+gLaXuiQXor8QX/b8Dj1bdPE+F/GqTqQu+fzhgbECUG6JTaq8NY=
X-Gm-Gg: ASbGnctJRe/FGnTaLAaleKCXdUYiJMzRjVz8+elLBiMtxolVsnzOVJQg3ZTbjxz02qe
 0qEBPb0bbcqsC9hVUn3HrHyJH2W9L6QT7AdjAbZlCuOqDxTjcIskBU90gkZro/LsKQP/E9STEyZ
 fkyWvO2VLMOGpJBlCpxx7h6iPwGCZTZ9ZSdo8pfcjSdMOOZZLTftpiNz2kUsfnMq/1KgNcZJx+v
 UIK/CP/hXoG12L3jiL1q6+lqNELSar5rVS3Q2uQjOH28l/8AHQF32cm/cV1odEwTs08cxck3dYB
 pQXhMaPDFq1S3jU2ZFBmryUumdgIFJffovwMgJSquhG6BSmCTE9QkiVGgt3p2oOArQIVHElo5rs
 m47Vs2keQJbJz+cPsgpS1VKe3AU7aKqQx93g=
X-Received: by 2002:a05:620a:198d:b0:7d4:5b68:2646 with SMTP id
 af79cd13be357-7d5ddbff5femr320341085a.57.1751634562432; 
 Fri, 04 Jul 2025 06:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAsxytp5ACC6JF9kJgurJ5J32AJAM2hwvgKYEX9EyXWLBjVdSY3uG2x86fHzg1zmi3ysFXBA==
X-Received: by 2002:a05:620a:198d:b0:7d4:5b68:2646 with SMTP id
 af79cd13be357-7d5ddbff5femr320336785a.57.1751634561978; 
 Fri, 04 Jul 2025 06:09:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384c4785sm247560e87.231.2025.07.04.06.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 06:09:21 -0700 (PDT)
Date: Fri, 4 Jul 2025 16:09:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1] misc: fastrpc: Add support for userspace allocated
 buffers
Message-ID: <6b77fwl7rdaxfbbeoizekoa72a35oob3shdfxm5xnoip43a6lh@zk5agyfbsnrq>
References: <20250704083726.1901705-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704083726.1901705-1-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEwMCBTYWx0ZWRfX+5TsPhvRvWXW
 Zr3NKsBzs/8Wl5fTQFv2Mo9wfhXSuFZeDuLzHdobuZq9nq0QXqr+/z0r/3B+qa0BLmS/iC/+CV7
 l+Gmn3Y20F81C76i3jY2/ZZOY5ZmDbRjds+J5CO8y5oTYs91Oo2yMNDYjQP6QDgxeUTu3VYtYJg
 fCgg5iwPkOv+jaNm7Dzf3ajAjH2yUtwjvPYnlXf1KSIm3Z5twGYg4QGVTIKS/ftLd37VgIU1jGO
 /+KTKtSGSeMJEU9/SxrSP46UNH5wJGxzSs6K9UX6U6Mkt98jzrO4/hmSfpVxCfBqBjwTzQ+i5s9
 UWjTyP91ePME/iDFVcIDIG2eXP77paHtWTy1pQ3yGrjNJEnZKmJ/metary6kL7pzSlOpvKpee+H
 eWDiZKRgBp/oKNStOsF1hlYgqI8WBFzrQy6p2lhVJiv2t2IMqcBzHpCVbqeaphj9sK5nYGhD
X-Proofpoint-GUID: 6ztnYMk6kShNWwXF-vq3CnS2TvKZ3zA5
X-Authority-Analysis: v=2.4 cv=UPrdHDfy c=1 sm=1 tr=0 ts=6867d284 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Wx4UnwnagEXOOs62NcYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 6ztnYMk6kShNWwXF-vq3CnS2TvKZ3zA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_05,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040100
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

On Fri, Jul 04, 2025 at 02:07:26PM +0530, Ekansh Gupta wrote:
> Support mapping userspace allocated buffers. If userspace allocates a
> buffer using rpcmem or DMABUF and sends it via a map request, fastrpc
> will map it to SMMU and DSP. Add support for both map and unmap
> requests.

Please start by describing a problem first, then the actions to solve
it.

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 188 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 150 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 378923594f02..3c88c8e9ba51 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1797,17 +1797,16 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  	return 0;
>  }
>  
> -static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
> +static int fastrpc_req_munmap_dsp(struct fastrpc_user *fl, uintptr_t raddr, u64 size)

Please split the patch into two functional parts: one for refactoring
and one for the actual bugfix. It is pretty hard to follow the logic.

>  {
>  	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
>  	struct fastrpc_munmap_req_msg req_msg;
> -	struct device *dev = fl->sctx->dev;
>  	int err;
>  	u32 sc;
>  
>  	req_msg.client_id = fl->client_id;
> -	req_msg.size = buf->size;
> -	req_msg.vaddr = buf->raddr;
> +	req_msg.size = size;
> +	req_msg.vaddr = raddr;
>  
>  	args[0].ptr = (u64) (uintptr_t) &req_msg;
>  	args[0].length = sizeof(req_msg);

-- 
With best wishes
Dmitry
