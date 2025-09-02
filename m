Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70799B3F352
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 06:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E56D10E564;
	Tue,  2 Sep 2025 04:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/2ISI38";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B0610E564
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 04:07:35 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822S54Q010330
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 04:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=6cH8S0+gaMjWB+xzW0zCCofn
 BirZXs5fCGxOfvmBM9I=; b=X/2ISI38rc58TVQnEuhYS5UQeFIQ+xekbOVDyylH
 ZDrzNxMMqKNaMj4N5DaP12TEjK2rJJY4HJdS1fhyCdRW4NfXoZnYzTGjM8Mxh44V
 XDgmb62PmHmDPmXsvl5RGFlw2ON1SzvK+t2pyzyKUJrqyEFgId+pNmxuMoUV8gc4
 G7FIy+0FLx4QU5WYuPbXkseHYNNqqYID/tT6XcDgzpnqO8KKCt5it9t7jdmYudX2
 jOSfKz50u1c02e8Bp9anWr2HyEPd36p0fSssoYcDFPDc+mDcvGWbB5XftkP5N4Wt
 F5Kt3qEbxJQPIYdDLvGFtherQoqdQqnNIl3QonPnDHwoxA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjeemr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 04:07:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b3316dd5d0so39956951cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 21:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756786054; x=1757390854;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6cH8S0+gaMjWB+xzW0zCCofnBirZXs5fCGxOfvmBM9I=;
 b=wLH/ExdV8aOKCg9N433NbF/G2YuYz7/1So7PViW41hrVHUTw+fI2KwzaIH5tQLprju
 /6x4+2XzizZdonr7JKCf67uqTHqSXtpbn83rOt2VUw69bw/Lil2Zsnam9gYTziRzBokE
 /IKWup3EpIlNAoHvQ9VQecNjCSqZKm0tunzSNGjw3gqP9uoONMOU4Cnrkq3I0NaqSvC1
 yDPcaAmHPqbCD21DCo/4wVlsTD73WEbQa/Xc1ixoa2h1ddyriIbv7gtMViMN+hr/5mJc
 v3kxS53p6pPR0uTnUNeNGBnSFvj7iwtpz8iGNTmlh6BErXIRL/Q2XC1auUfAdrIoLrOG
 I4tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVanbr7IGBew/JRDWW/QiENGuFtX762vix4l/FcA9ol59ggdEs4ZtWtq7OLwEXD5KTa2bJ6kReMkaU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0fr6z54qDOAMisGEZhi2Da3FlxjvmehSXcausfHN1QN850cTP
 5Md+9sUdgUduexWRyrOgoYvn1SJM6MxCaQp9tehF5TOQh5ocHBaIM0VE6n48kmv351QrOVPc27A
 9t2cL6wctSwOxJzh/PJdZzCfA8R/a/K1UlQQ+YYBZk1ZegDYqbdM+Vc1SskYErmI14e1rcAc=
X-Gm-Gg: ASbGncvFtnE6WcsyPjMg4UkF5GgqInUR6Ns7W5rGVCbgVZzHnLJw8fdsdH9A8ub3Ux1
 tJRu97wBT9e9PriZYbftQcdr5n00V8zjLRSC0CenTfJMfUKoIsEtq7z67T++C5qIu4AhPUu/Xps
 Reu83p2mR/AVT/Rpe6bDh73JKzuobvWFJTc/GCD6HbH8kqASE3q+BQ4yN8td57IxuSUPtE9MgdX
 HxF46tIyaB092X+VdkkB4a3BKpvJ9dKKh5c8mlPduqOoW4vovEdGAK/+heu+vFE2Nta4J6AmMAS
 SibnJXaIdm3N0sX5E1RoDYib+QwOGgKWGdSwbHhz4rbXd/Gj7COnGyNhMu9qwBDcVVDKgfMxYTj
 FwUOQ6SokXUzlW2MwuacC93MdBvfQsuamiBD98DQQlGf1ozHMYPac
X-Received: by 2002:ac8:7d03:0:b0:4b3:963:b3c7 with SMTP id
 d75a77b69052e-4b31dcddb9emr104101941cf.80.1756786053511; 
 Mon, 01 Sep 2025 21:07:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+m9cc6KTF1kar0sjmRArafCzv9fv3uv+dszlaHMhe0We8GJ+1/atzcoCHBZfJgrQleedAXA==
X-Received: by 2002:ac8:7d03:0:b0:4b3:963:b3c7 with SMTP id
 d75a77b69052e-4b31dcddb9emr104101841cf.80.1756786052936; 
 Mon, 01 Sep 2025 21:07:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56082790719sm349913e87.81.2025.09.01.21.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 21:07:32 -0700 (PDT)
Date: Tue, 2 Sep 2025 07:07:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 1/3] misc: fastrpc: Move fdlist to invoke context
 structure
Message-ID: <rkwfjphxpnihtiuoyq5cblm5jpep6bnayfv4w2enx2smpnapye@sdvrbndwhq46>
References: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
 <20250901053336.3939595-2-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901053336.3939595-2-ekansh.gupta@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b66d86 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=L3V8ESiTM85YuAMSbpwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: gIdSqmL6BvbPWcc1-hjWIkbLAwLv66VA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX+XN5XInqEgCk
 dlvE+91ebWq5YDMNB+X08NvAr7SGCGqxaphtFQnx8AeTA0F5iLIIcXcLVpkj2/lhyz0A59rVi/s
 XQxwlLa3ehMnnfVlc17jPTsL9Lc+JIH7KFG5nb9oGAZ0dtxbxLjWwXr1hInHe4fch0AAMkaAOQt
 o70L46avrd2VULeQmskSDMzc5bCahFZ9+mNyC6+nsgX52B+OfIqe0OaxmCLBOVKOoV0RsPq5zcO
 XWvTNELA0BdkCBLS58QEJ00J7uLXGsJ1uHVElWKAaGJj8vI2VZA8YnD8pYSStdKTZRYSct1Sf4t
 FJN/bnEuGx6xGzS8M79XrDijWjkiabpLJyBf0QHQlDUlFtS3ArFWOCct81yKCelJ/PLyCZrP3kH
 yP8vWw4/
X-Proofpoint-ORIG-GUID: gIdSqmL6BvbPWcc1-hjWIkbLAwLv66VA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
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

On Mon, Sep 01, 2025 at 11:03:34AM +0530, Ekansh Gupta wrote:
> FD list is part of meta buffer which is calculated during put args.
> Move fdlist to invoke context structure for better maintenance and
> to avoid code duplicacy for calculation of critical meta buffer
> contents that are used by fastrpc driver.

Please start with the description of a problem or an issue.

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 621bce7e101c..0991ac487192 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -233,6 +233,7 @@ struct fastrpc_invoke_ctx {
>  	int pid;
>  	int client_id;
>  	u32 sc;
> +	u64 *fdlist;
>  	u32 *crc;
>  	u64 ctxid;
>  	u64 msg_sz;
> @@ -985,6 +986,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  	rpra = ctx->buf->virt;
>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
> +	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
>  	args = (uintptr_t)ctx->buf->virt + metalen;
>  	rlen = pkt_size - metalen;
>  	ctx->rpra = rpra;
> @@ -1087,18 +1089,10 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>  	union fastrpc_remote_arg *rpra = ctx->rpra;
>  	struct fastrpc_user *fl = ctx->fl;
>  	struct fastrpc_map *mmap = NULL;
> -	struct fastrpc_invoke_buf *list;
> -	struct fastrpc_phy_page *pages;
> -	u64 *fdlist;
> -	int i, inbufs, outbufs, handles;
> +	int i, inbufs;
>  	int ret = 0;
>  
>  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
> -	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
> -	handles = REMOTE_SCALARS_INHANDLES(ctx->sc) + REMOTE_SCALARS_OUTHANDLES(ctx->sc);
> -	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
> -	pages = fastrpc_phy_page_start(list, ctx->nscalars);
> -	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
>  
>  	for (i = inbufs; i < ctx->nbufs; ++i) {
>  		if (!ctx->maps[i]) {
> @@ -1120,9 +1114,9 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>  cleanup_fdlist:
>  	/* Clean up fdlist which is updated by DSP */
>  	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
> -		if (!fdlist[i])
> +		if (!ctx->fdlist[i])
>  			break;
> -		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap))
> +		if (!fastrpc_map_lookup(fl, (int)ctx->fdlist[i], &mmap))
>  			fastrpc_map_put(mmap);
>  	}
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
