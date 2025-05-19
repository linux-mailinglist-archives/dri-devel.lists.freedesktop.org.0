Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EF4ABBC7F
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 13:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC46610E07B;
	Mon, 19 May 2025 11:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1VG2J8d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FDC10E043
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 11:35:31 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9iup0022833
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 11:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MGz/5PBOO+5gp+QS6lttLCztBG/KV7/uZk6GhY7njfw=; b=d1VG2J8dc9xpjF1H
 q2SuEITW4g3Y6TUaMFxzUuvcOtHPlo1t27LAQOGxq70iq/O3laPJUrmCX0aCK3HI
 SDgHc/RtFf/2mYX+a/0M/WpKZelNQJg60HVYeasGaVjfG+XMqiS5vK3TvWOn+Kv4
 GQY3KoRyE8JoCYyg9T9Uss0fuM05/doELy32IxrQcN3+EbgeWp+KO6qiQ72ewPaR
 ROH9JRnODdPHvJE1d4bZGRRfmUGEJ0niKKj4m21UZmPgNxcG6neKmTaBuILMwcat
 0uXBLpJbHtMpDw3/fObX5wiIDjeMO3P7Ijfs/tcR4ptmG/V9azB3HDt10eWXvYtc
 fjBIWw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d09xe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 11:35:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f8d8f77d4fso15999606d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 04:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747654530; x=1748259330;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MGz/5PBOO+5gp+QS6lttLCztBG/KV7/uZk6GhY7njfw=;
 b=ogtTRVaM1oG3hXECa8ZauzUxeNF5SEkm+GipjIvHC1JeD0yKQO2lpks2YsHKrYHkkI
 caMGpuLmpSlKLMHYP/H1h84ysTEODU4784ELuS4KOgNKB9zepxLwDYeK72wc/uv45lCr
 pD1IwsffK+hd78BQ3498CdX5WZ+J40XhB8UTTiYmMiykoDoZ9Gi3095Jx9hHoJRwd8Rn
 b2zsgXLsiwj5KCsNqfuGF7LUPWx/2oCRSs/VdEklvUy7DXFXsT732o/+QBOSb6l+v8zV
 T3YEJMBFXx0JAfXWo0U03YSBdA4ghiiviX2aRZzp1dyb63cp/ZsoqB33kNPP3ySDmVzE
 zjUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtY+8rP8/b1XAyAjbR8lAytlNedJDE8oajrta3cg6iq6K7wXtJUKoH58L0WP3y1bjyU/hOjKYTQS4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSwvnZZJNeN4fRiVPCcDl262mxchD5b7u6QPoiec8AIZlHj+Pm
 q0hvBIwdUyHbjOkDtklvdwd5QB4HlIcaCwzzgdW/zaC9GM7xWIImPZAH2159s2rxD2J5UxDCfQ7
 XHjH/epPLN5tOQAAXtcvuW85OAKPWwddLBEhZX0jFZqgI1fXl23xy1vAgpOYyjeKeqMmXfb7Olb
 CGXU70JA==
X-Gm-Gg: ASbGncv+qg3syywudRJYDJZRskv7UQhc+h3Gb1lf/3De7gy10YnSxKZNBGi6HFifXbd
 Xl277TAqkBLn2Ixeaxk6ZFrmJxs+0R/X/3PEEJ408G7lOvrcZlf+yhFd46+t9VZ7R9E/zj2XThL
 5o/KTbitdeA8SMySyK2SwZg1vpyqxlXQdxLgRP1zxUi0YCTpH1Vmy1C46U7uNVDUhT1tkCORuWR
 6BNvL++hURm3G8UiSDlSkqMm147mlx1/AYh6IYIzYXXC7RK6F8CqjDKfMxIYgdCPk5TmJniN8Ct
 dtUBYQKSp50kBMTt7p2Xt4OI/SrsIi7GHA0eXg==
X-Received: by 2002:ad4:5b82:0:b0:6f8:a667:2958 with SMTP id
 6a1803df08f44-6f8b0724089mr192360016d6.0.1747654529711; 
 Mon, 19 May 2025 04:35:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzsyCr/J96bWVVh9QtO+6rLg1eaZP1di2m3Q4YIEUNManG7KPcCof9dSB2bSUxByne0jT9cA==
X-Received: by 2002:ad4:5b82:0:b0:6f8:a667:2958 with SMTP id
 6a1803df08f44-6f8b0724089mr192359696d6.0.1747654529218; 
 Mon, 19 May 2025 04:35:29 -0700 (PDT)
Received: from [192.168.68.115] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-442fee0d216sm131885295e9.26.2025.05.19.04.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 04:35:28 -0700 (PDT)
Message-ID: <3b9dc9d5-be31-420a-ae90-335377ad6d08@oss.qualcomm.com>
Date: Mon, 19 May 2025 12:35:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations to
 a new list
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwOSBTYWx0ZWRfX7xc1ikAQBSKe
 XmUOf0Fu83Am5nE9Gra5QZyuO9vxWL+OD8MrYUZnAi4V6nj1SanXOLIwpizZGmiKhY2TlMfY17H
 T7UNPaVVbR6QhUDXRrhjOHhF9os6YXhTmxVWeqC5HNkrrYI80/P54rBwUVtFV+xtV5mP03OT05C
 6xi8Ms4HksNpMCBanWnWrYlwg+b8S75GW7XD6sYQCtczw7Oz6cFZYE6dRZcK1OykFTvYkUqJXyz
 w0PZMTk0MjorHdGIBzFiwX1S6AfPiaEkhNOTEfSL1B2RySEJ1spYwXIq26kPfG1fvmpKlsVmVho
 AMh262fE8C9hYN3FtDLl50PDUGqIx61ijlvklBNlS2Wal9lm2wB0VKnqr8VitOAqrOrizbmVjVU
 gzUSOhYQ+20z4FfYpBfohdcwIFE3fBv/xay9ZCZI0w+1lLQuJz/JGN/hc0rYCbFnvYGd5Vwi
X-Proofpoint-GUID: vCSQUbTeNw4Olo6XCMJ1qrdAAmDE_itt
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682b1783 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=NSqiOjkRuWDHbrvXJugA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: vCSQUbTeNw4Olo6XCMJ1qrdAAmDE_itt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190109
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

On 5/13/25 05:28, Ekansh Gupta wrote:
> Remote heap allocations are not organized in a maintainable manner,
> leading to potential issues with memory management. As the remote
> heap allocations are maintained in fl mmaps list, the allocations
> will go away if the audio daemon process is killed but there are
> chances that audio PD might still be using the memory. Move all
> remote heap allocations to a dedicated list where the entries are
> cleaned only for user requests and subsystem shutdown.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 93 ++++++++++++++++++++++++++++++++----------
>  1 file changed, 72 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index ca3721365ddc..d4e38b5e5e6c 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -273,10 +273,12 @@ struct fastrpc_channel_ctx {
>  	struct kref refcount;
>  	/* Flag if dsp attributes are cached */
>  	bool valid_attributes;
> +	/* Flag if audio PD init mem was allocated */
> +	bool audio_init_mem;
>  	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>  	struct fastrpc_device *secure_fdevice;
>  	struct fastrpc_device *fdevice;
> -	struct fastrpc_buf *remote_heap;
> +	struct list_head rhmaps;
Other than Audiopd, do you see any other remote heaps getting added to
this list?

>  	struct list_head invoke_interrupted_mmaps;
>  	bool secure;
>  	bool unsigned_support;
> @@ -1237,12 +1239,47 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
>  	return false;
>  }
>  
> +static void fastrpc_cleanup_rhmaps(struct fastrpc_channel_ctx *cctx)
> +{
> +	struct fastrpc_buf *buf, *b;
> +	struct list_head temp_list;
> +	int err;
> +	unsigned long flags;
> +
> +	INIT_LIST_HEAD(&temp_list);
> +
> +	spin_lock_irqsave(&cctx->lock, flags);
> +	list_splice_init(&cctx->rhmaps, &temp_list);
> +	spin_unlock_irqrestore(&cctx->lock, flags);

Can you explain why do we need to do this?

> +
> +	list_for_each_entry_safe(buf, b, &temp_list, node) {> +		if (cctx->vmcount) {
> +			u64 src_perms = 0;
> +			struct qcom_scm_vmperm dst_perms;
> +			u32 i;
> +
> +			for (i = 0; i < cctx->vmcount; i++)
> +				src_perms |= BIT(cctx->vmperms[i].vmid);
> +
> +			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
> +			dst_perms.perm = QCOM_SCM_PERM_RWX;
> +			err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
> +						  &src_perms, &dst_perms, 1);
> +			if (err)
> +				continue;

Memory leak here.

> +		}
> +		fastrpc_buf_free(buf);
> +	}
> +}
> +

--srini
