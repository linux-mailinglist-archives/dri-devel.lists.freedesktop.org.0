Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612FF937670
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 12:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A000810EBA1;
	Fri, 19 Jul 2024 10:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TG/pMs+w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9130810EBA1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 10:06:43 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2eeec60a324so26189171fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 03:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721383602; x=1721988402; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GtFkMNr97U6PMU3KWhI0m1Yz9Cr76MZFaEin19mAf/Y=;
 b=TG/pMs+wfQgvmKW8rWTGX45aNomIRX38ivEK1KO1LUvsr8tKe76WH90Bgat//b3vXP
 w8T/C87QS2oX4Qt8GkwzKeeVzExVnY2NkakakpgFgGuw39Awi8wF4ZS8DyK0v0nQYokj
 vUgBflDLOP/4sxAkgQrqW4/z3L1p0VheeIawgsmsat71dRAUE1DRS/zmdfw1xAwk6Qcs
 8cahRNkUtwTeO3XXQvfBbWtrmQBiXHtdLFp9d5KkpGB4VxIZ+Ckk9spI0LVX7eoG5DzZ
 FWg7Wphv/RC1qzNmUVg5Q9c9KG3+p3SynqXkibI8ZlrxpKb2g3jKlwZ7lKwSJMbzqhCl
 miVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721383602; x=1721988402;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GtFkMNr97U6PMU3KWhI0m1Yz9Cr76MZFaEin19mAf/Y=;
 b=wZ/pLpDu4L+5P0LGMVBqbYqCieB7KGlq60bMVwfnkB6xPM4SPfKDHYnCiabSlNBc55
 jZeIjjbTxFaPpKd5pAGxYQ+lwiIEiFlZNVNOHuHLaniN35ePhvD6JBGwZUXx4zkVxxKM
 0AE7koqErsbobF4OxoUQNrqRffkRCB4OcLZ2CfgPTrYR/6/+23Ejt7L+zhZWncMELy4+
 aHMCzORSm7CYi7Pb8lLbILR4QX6ft92SZdsAtHxhURKyKcRAT/PuVF/wVJkgj68R1/Sf
 1EsgncfGbC5y+dNPRmqyMzFkDYpDkc8ovaP4qosKGyibmuWjzALoDTkTEBsxQl7dEb0e
 dtew==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8ZiyCzX3+78ARzqB1sF1NSylDFYTb0RjXZS6ON+OiOj167JpB1B2+fYmNf1mNNBgPI0W/WUEtZERzFcB6KVREYGLG7vr5b0cLjQ8Jfhjd
X-Gm-Message-State: AOJu0YwqqciqSA8xRwHzTe9x4YVdVpimcFEz7PXqP+9cwWn7/Ityu2nh
 0f1yJySp3d3eWSU9/S6T7bx7QYnFoyyJ8KiYgA4q7WEHkJb9PREenCKKX1WISfo=
X-Google-Smtp-Source: AGHT+IEKIvSwhjz08K1A39gYm151NbGmciczCRnss13AY6wbm0ME/qTH+PDHsKWwKRY/LFOKkdDogg==
X-Received: by 2002:a2e:b60c:0:b0:2ee:52f4:266 with SMTP id
 38308e7fff4ca-2ef05c53bd9mr41880111fa.3.1721383601643; 
 Fri, 19 Jul 2024 03:06:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef0fcdd49bsm1594041fa.90.2024.07.19.03.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 03:06:41 -0700 (PDT)
Date: Fri, 19 Jul 2024 13:06:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 stable <stable@kernel.org>
Subject: Re: [PATCH v4] misc: fastrpc: Increase unsigned PD initmem size
Message-ID: <wd3vpjh6u7tsaxccc6ek5t3ryio453exaprsmkxyzsh4brx7qk@ywkerf5fwqnd>
References: <20240719085708.1764952-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719085708.1764952-1-quic_ekangupt@quicinc.com>
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

On Fri, Jul 19, 2024 at 02:27:08PM GMT, Ekansh Gupta wrote:
> For user PD initialization, initmem is allocated and sent to DSP for
> initial memory requirements like shell loading. This size is the shell
> size that is  passed by user space and is checked against a max size.
> For unsigned PD offloading requirement, additional memory is required
> because of additional static heap initialization. Without this
> additional memory, PD initialization would fail. Increase the initmem
> size by 2MB for unsigned PD initmem buffer allocation. Any additional
> memory sent to DSP during PD init is used as the PD heap.
> 
> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
> Changes in v2:
>   - Modified commit text.
>   - Removed size check instead of updating max file size.
> Changes in v3:
>   - Added bound check again with a higher max size definition.
>   - Modified commit text accordingly.
> Changes in v4:
>   - Defined new initmem specific MACROs.
>   - Adding extra memory for unsigned PD.
>   - Added comment suggesting the reason for this change.
>   - Modified commit text.
> 
>  drivers/misc/fastrpc.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a7a2bcedb37e..18668b020a87 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -39,6 +39,8 @@
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>  #define FASTRPC_CTXID_MASK (0xFF0)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
> +#define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
> +#define FASTRPC_STATIC_HEAP_LEN (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>  
> @@ -1410,8 +1412,14 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  			goto err;
>  	}
>  
> -	memlen = ALIGN(max(INIT_FILELEN_MAX, (int)init.filelen * 4),
> +	/* Allocate buffer in kernel for donating to remote process.
> +	 * Unsigned PD requires additional memory because of the
> +	 * additional static heap initialized within the process.
> +	 */
> +	memlen = ALIGN(max(FASTRPC_INITLEN_MIN, (int)init.filelen * 4),
>  		       1024 * 1024);

Ok, here you have two changes in the same patch. First one changes
the allocated memory size for the signed usecase and another one adds
separate handling for the unsigned case. Please split them into two
separate commits.

> +	if (unsigned_module)
> +		memlen += FASTRPC_STATIC_HEAP_LEN;
>  	err = fastrpc_buf_alloc(fl, fl->sctx->dev, memlen,
>  				&imem);
>  	if (err)
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
