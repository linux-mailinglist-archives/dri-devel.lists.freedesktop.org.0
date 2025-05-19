Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C590ABBF33
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 15:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE8010E24C;
	Mon, 19 May 2025 13:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qb5qGP60";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF45210E24C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:32:29 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9I12W016028
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=roo25XkD9MwN9YLNJ0rkSlMr
 zlUHYdOOQOOLiVFz1HE=; b=Qb5qGP60B3NePNIBhuUHRGJG3bWV2EmZfcrXkX1J
 lsejR0Xl6t4ZPFZi/OW/aVX9dkUI4sTy1GsxQGTHDDSrTD002MZRs7A1Lnsg3ibF
 cKtmJihniGyOaMIjccbxx4B19yyxNQpNL5QfzLUj3D/yHO77zj2n8hrQPYgllDgH
 QD9mfTqFRVtIirD+ygaEMW2IhcoLVuducyiqt8HP4mcQsMvPbsxXsl6ye1A0Namj
 mbH9BioQ5GDtEkkg6v8ME6DuXuSduAjggor4j20fh46FLnWr70+NxIOoxLvjwh3d
 z0n3Kkh1Rru3cfqsKbPe1gGu7VkftebSlFo6kb9jG3SXEA==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnymhe0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:32:28 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3dbd4696ea0so31041015ab.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 06:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747661548; x=1748266348;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=roo25XkD9MwN9YLNJ0rkSlMrzlUHYdOOQOOLiVFz1HE=;
 b=UiooBi8WySWznO4EHYtaY2Wkoo+fgD3pPYzQZ1nCsQqIA3LsBxJdagiQagxBUBv57E
 WSy3g7TRq5xFSpOm2+ruqu0wXd8d+JXH1d8D6ga0C0WdA/JH1luf8pMjJj3IRvGts4RP
 QhOMhZ19vnSFE9qaQCfpXvRPKZV7IExjiOGV9MPdaE15xVxeR9pt1L9LX3NiKCNSMTUt
 /pImUtwLqS/VN16veDnnS85F0PC3LiwqrSxscf7zzykSH83AbBqi0ridQ3i7io/tUJvf
 chiF1h82YsvWED+shxQavGuwBv7Bu6wLLO+hDFchQToencW0mW1Hin4z9iMiYV1KJUbL
 zC0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKzhPiHaSNV1XT7YQbovVoba67D19u70FpYFthYUJk2lA7yiGwHutmLTri+mq4byg3uA54QN6G+04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+ng1Ty5hb7PFeBehbalegVW6nAzNuJUZkA5Nk8x3lVJNdlw9F
 HZ3k87t2Ga5xzwYor6eewQzVpSz3CghM5B0GZO+nBlb/dak6KiDe9zwPzSIPWpAyOkiIB4H7OEQ
 ioPF43Y7HD3XafhFn8p6y6OR9MCr9AMAOJgB26l0UIbGFFkUkFFykOdskQeeDwND2dFSNtTk=
X-Gm-Gg: ASbGncsiUQShkj/i1ctZ9xgglOvXDFHFdE9ziKR/Ud5OBkb8asxrGVS7YhrZfdNJ+t6
 ExlBGYYTyMde0AySmo0zl4/MGxyeC0A7/zFdA7q1Ptq+DREJaoAkWs1Q5hyddJ92IDSrreCCN8/
 xESi2e+jh7llljqhueHpfBIFDkXhUDnajhaQ+ojXJvV44q65C4TGP/U/UMljTI077TzXNHwkboX
 1R2rqa1yJdXf0kWWXO2U2+na7gZrIiv4TFmx9IZ11t9P8Cexu3sZq/4C+b/zPujNI5y7yM9bY3W
 Sd/Kij3ZXDyjk4rnSDWD9cmvRvjCd+KaQwg4oi3uC19Z6W+U/OtV0A59LzseYnlm8rzx+Dc6j2w
 =
X-Received: by 2002:a92:cda6:0:b0:3d8:1d2d:60b0 with SMTP id
 e9e14a558f8ab-3db842aae78mr135137135ab.5.1747661547783; 
 Mon, 19 May 2025 06:32:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVkVDsyixEUb8OMq/WsoDZju8ka5ZGx6BVSZrQXQfPiLNdGYIuQ/43DL17obhYrD8HKJ76zw==
X-Received: by 2002:a92:cda6:0:b0:3d8:1d2d:60b0 with SMTP id
 e9e14a558f8ab-3db842aae78mr135136855ab.5.1747661547433; 
 Mon, 19 May 2025 06:32:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f34d40sm1867709e87.91.2025.05.19.06.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 06:32:26 -0700 (PDT)
Date: Mon, 19 May 2025 16:32:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 4/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
Message-ID: <p6cc5lxufmefeulx5bhlh6q6ivwluqf2muj3hu5e5526fsppuu@brcy6arm7epg>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-5-ekansh.gupta@oss.qualcomm.com>
 <uw6dcnbgg5vbfkcnei54rwkslpbseolr46cqhsosiadscd5srh@ixk67qdcwfug>
 <1246b4e6-dd1f-4293-b580-5d642f661956@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1246b4e6-dd1f-4293-b580-5d642f661956@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEyNSBTYWx0ZWRfX7EewbH/RpJ4o
 pyoGMuUX6IiuIePb83o5oHjNymOvuYZlVmt5iXUcZlVfpbll3CODgbKv6oTFdMF29W+rhIAUX1d
 gbyAP76VCP8GDRmpb5myPeFDAB7WncmDm/d0yiGZoCc8IZECAB7qpbZ2VpppjAK5qMYjNnb5Gry
 S2z7wLmwHRCKmZk24uv7BNeuwG9vdifhD5NgXMce64gMiG2k73Vb30HR+bn42DVyo4O+XJ6f4us
 IWsI76wwGv1sj3zKkffYo5vDfpISKaqbG11EEQrR+8m82juCeq7ME/e4ua958hAxGMWX6XlF6vX
 hQdPZ40eQREzlXlIkiAYaSJpW8WsGkDAWwV7Fhj1uNLhARn275GUa7vK7dEBecGfnizTpNsKZ/9
 4fWh1fZKdVnu50PTG3yv5z7/siGgyUIgat6LsbzHiShY/CmnLSx26NKIyohLh2KbUuFgyfTc
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b32ec cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TIZ-FQZdIQNwdW-vVJYA:9
 a=CjuIK1q_8ugA:10 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-GUID: IMNMplFOdgeEf02JniJFpWs67lBaYfXA
X-Proofpoint-ORIG-GUID: IMNMplFOdgeEf02JniJFpWs67lBaYfXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

On Mon, May 19, 2025 at 04:26:27PM +0530, Ekansh Gupta wrote:
> 
> 
> On 5/19/2025 3:50 PM, Dmitry Baryshkov wrote:
> > On Tue, May 13, 2025 at 09:58:24AM +0530, Ekansh Gupta wrote:
> >> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
> >> getting removed from the list after it is unmapped from DSP. This can
> >> create potential race conditions if any other thread removes the entry
> >> from list while unmap operation is ongoing. Remove the entry before
> >> calling unmap operation.
> >>
> >> Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
> >> Cc: stable@kernel.org
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 29 ++++++++++++++++++++++-------
> >>  1 file changed, 22 insertions(+), 7 deletions(-)
> >>

> >
> >> +err_copy:
> >> +	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
> >> +		spin_lock_irqsave(&fl->cctx->lock, flags);
> >> +		list_del(&buf->node);
> >> +		spin_unlock_irqrestore(&fl->cctx->lock, flags);
> >> +	} else {
> >> +		spin_lock(&fl->lock);
> >> +		list_del(&buf->node);
> >> +		spin_unlock(&fl->lock);
> >> +	}
> > Can we store the spinlock pointer in the struct fastrpc_buf instead?
> this spinlock is used for multiple lists(bufs, maps and ctx).

pointer, not a spinlock itself.

> >
> >>  err_assign:
> >>  	fastrpc_req_munmap_impl(fl, buf);
> >>  
> >> -- 
> >> 2.34.1
> >>
> 

-- 
With best wishes
Dmitry
