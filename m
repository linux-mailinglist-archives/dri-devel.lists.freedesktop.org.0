Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B038A21C19
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1738E10E027;
	Wed, 29 Jan 2025 11:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f71p8fBD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F3110E027
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:24:02 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5401d3ea5a1so6294607e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738149840; x=1738754640; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Sq0Kz/LUg6HvCz1toVpRA5JbYsjs1CqFZvdJ700FNco=;
 b=f71p8fBDmK0CQuG7ZyyDiGN4htI0qZbH1oBw7kur7pIUIl/LlriGKwH19GHHa2ZAjh
 qE75JdrR7anPPo6Lt9G1x4RQtfbcczNwshcRn2+namW5zP8o2rMZ3Q8bwgV7Hy6894qS
 OHtQm18JNY6LTKuGqV0jK9Bg0ZOXRUYVZwiTX1dfpLUAt/qvDaSLFi0gEI9xHph6rdPn
 MBkk2xSCF4b8K0NEz+O+j7XrKyDgnWOi2ZHDOkmIvzndBrqxzbWor2cukRRmxQEkH8JX
 DbfU1iZiahwyT8D5Vc4ueR19Z6w7oIKpM5Tv8hXQSOUkEbIRkypML3p1uL9YQY84FO5M
 PHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738149840; x=1738754640;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sq0Kz/LUg6HvCz1toVpRA5JbYsjs1CqFZvdJ700FNco=;
 b=bQMCiHkziSNpi/nTGPFD0FXRIVBrTXmxADb4PntWfNV6wAlBkw6CMBOexkNW2kIDnc
 W/fkSdSP5rDrXvttabv9SzXY/QvGBobyshwyHJNi4vNvxShJkT9sB6QtiSEvMBiEhVf+
 7WDbrGiSM1VHeEWxEwRECB2Ya0H+rhLRvnk36kQXK9da3XObsqjUVZIrLlP27lHoCoES
 F7ZRIWPKG8oSxLQ7PdKic7XI4o9Elam1NbC6EQEs/luWdeQojnmwvEcvomBy9TwlegRT
 Yi/gI77gAzwsCdjrQ3ZfSUf5bMOduqSOXlbFbZCiLEweScO4sqh44xqjNKMm5lsC1eFO
 PPJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpRyYlSY+tXHVLq941PkHs5hrSNS3rcCW8Rxvu0Vv8hSUfktLzzqsOH3e4d8/B69yR9sG/xkSYDZk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTajHnNXEziffQ6hEl7tlgZncoqfCersuNHVhKG+tc2M7pW0PL
 BehoPKgqgKtNYWs5Rz3PMOUTTYimHCLWGdUXb3HSuZ2BHlEkcCVq3EF4kWwz+6U=
X-Gm-Gg: ASbGncuWhacd91NrfeWpg3y/kFaZw2NKhmSrAdEixJ6Mvc1RKEwQgVcJ6ob/p6eT6hE
 e8yE8uBKs1ddX01Cb89u1C0pUjzE8HdwrKTpZyLwHJ8fyN1LUC4ppPveg4gpgJUBcYvhqvmu2Cn
 +uuRNSpq5KNx9qG/kEEsy8ErLH8cdTjQUJjHiafQ8/JBBemmukMuC3Dgnp0jgvWXlWczYA7tqWB
 4YeLI2e1TrXzoudsb7oynaIAnfX2NLa4QjORc1gp4re/0k9fGjN0/7L2xHVpkes5KOkazxN1UZC
 5nHB/t24VK9dEYSCThYE4i3syc1aOJ3iyVzL0nKMqITYSXuT6Nv77tG5YWzpCDlVVimHt3Q=
X-Google-Smtp-Source: AGHT+IFonMmnwyTxQvsSSBnscsFfAgnvairUN/GGWJXwTFN/hxnAK0AAK+OBASz6YUt7B+HlQTOT7g==
X-Received: by 2002:ac2:41d7:0:b0:542:6f2a:946a with SMTP id
 2adb3069b0e04-543e4be034cmr688424e87.6.1738149840126; 
 Wed, 29 Jan 2025 03:24:00 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8231338sm1978338e87.103.2025.01.29.03.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 03:23:59 -0800 (PST)
Date: Wed, 29 Jan 2025 13:23:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 5/5] misc: fastrpc: Modify context id mask to support
 polling mode
Message-ID: <jeixk4dmk53ubnujop3sp2lc6jffugjmzndmmqmyuft7uquibt@s2h2dgj7yj7h>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-6-quic_ekangupt@quicinc.com>
 <im7gi5ib7wnihu3ff4a2erqctne2pm2zf3wl4qmuejz4dfhf7e@z5au6vnm5por>
 <08b469b8-2339-4fde-9472-fcaadbb4ed87@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08b469b8-2339-4fde-9472-fcaadbb4ed87@quicinc.com>
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

On Wed, Jan 29, 2025 at 11:13:05AM +0530, Ekansh Gupta wrote:
> 
> 
> 
> On 1/29/2025 5:00 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 27, 2025 at 10:12:39AM +0530, Ekansh Gupta wrote:
> >> DSP needs last 4 bits of context id to be 0 for polling mode to be
> >> supported as setting of last 8 is intended for async mode(not yet
> >> supported on upstream driver) and setting these bits restrics
> >> writing to poll memory from DSP. Modify context id mask to ensure
> >> polling mode is supported.
> > Shouldn't this commit come before the previous one?
> 
> Yes, I'll change the order in next series.
> 
> Thanks for reviewing the changes.

Please consider asking somebody for the internal review before sending
patches. This should help you to catch such mistakes.

Next, I keep on asking for a sensible userspace and testing suite. No,
existing fastrpc doesn't pass that criteria. We have discussed that, but
I see no changes in the development. The PR that you've linked in the
cover letter contains a single commit, covering documentation, new
IOCTL, CRC support, poll mode support, etc. What if the discussion ends
up accepting the CRC support but declining the polling mode? Or vice
versa, accepting poll mode but declining the CRC support? There is no
easy way for us to review userspace impact, corresponding changes, etc.

Last, but not least: I want to bring up Sima's response in one of the
earlier discussions ([1]): "Yeah, if fastrpc just keeps growing the
story will completely different."

You are adding new IOCTL and new ivocation API. That totally sounds
like "keeps growing", which returns us back to the uAPI question,
drm_accel.h and the rest of the questions on the userspace, compiler,
etc.

[1] https://lore.kernel.org/dri-devel/Znk87-xCx8f3fIUL@phenom.ffwll.local/


> 
> --ekansh
> 
> >
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index 257a741af115..ef56c793c564 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -40,7 +40,7 @@
> >>  #define FASTRPC_INIT_HANDLE	1
> >>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> >>  #define FASTRPC_MAX_STATIC_HANDLE (20)
> >> -#define FASTRPC_CTXID_MASK (0xFF0)
> >> +#define FASTRPC_CTXID_MASK (0xFF0000)
> >>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
> >>  #define INIT_FILE_NAMELEN_MAX (128)
> >>  #define FASTRPC_DEVICE_NAME	"fastrpc"
> >> @@ -524,7 +524,7 @@ static void fastrpc_context_free(struct kref *ref)
> >>  		fastrpc_buf_free(ctx->buf);
> >>  
> >>  	spin_lock_irqsave(&cctx->lock, flags);
> >> -	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
> >> +	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 16);
> >>  	spin_unlock_irqrestore(&cctx->lock, flags);
> >>  
> >>  	kfree(ctx->maps);
> >> @@ -664,7 +664,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> >>  		spin_unlock_irqrestore(&cctx->lock, flags);
> >>  		goto err_idr;
> >>  	}
> >> -	ctx->ctxid = ret << 4;
> >> +	ctx->ctxid = ret << 16;
> >>  	spin_unlock_irqrestore(&cctx->lock, flags);
> >>  
> >>  	kref_init(&ctx->refcount);
> >> @@ -2675,7 +2675,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
> >>  	if (len < sizeof(*rsp))
> >>  		return -EINVAL;
> >>  
> >> -	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
> >> +	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 16);
> >>  
> >>  	spin_lock_irqsave(&cctx->lock, flags);
> >>  	ctx = idr_find(&cctx->ctx_idr, ctxid);
> >> -- 
> >> 2.34.1
> >>
> 

-- 
With best wishes
Dmitry
