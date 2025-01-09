Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCE5A075B0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 13:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694C210ED95;
	Thu,  9 Jan 2025 12:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T7igVRtV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BAE10ED9E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 12:25:41 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53f22fd6887so794074e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 04:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736425539; x=1737030339; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EkA4eWtGqrX0Cp1veyrLZwVMj4rFGh39Oy2w043QSSA=;
 b=T7igVRtVxB5aWLF/JSOXATkpl2nc+RM0NAqArdqeiki5A9NO7nAPqxOosFlwphQUXo
 4rJEUm88n7oLN1euy0DxvNY/ueh5QWnXtGhHrpzqUfwtK5t+Q4mQ+IMEkXfVY1dqTo4E
 1Oor6I1Rjr7S4ZCRMyFLZnlPPELmnlUyL1ieX7oii5a0czlkEy4cAXv+Bzmem9csTW61
 cXXsOwISuuDl9KMDsiCsSPP3gdCeJ8gODY9j9ngzxeZxqUE3ZDKx18KDDtDj3mo2+DM1
 Xhy5FRVxnqsHmFxV/XWzZzAVYicaGh5KCWSzMzYzsZWPn92THTkDDLvQwiJEW9CwBl9N
 /mQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736425539; x=1737030339;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EkA4eWtGqrX0Cp1veyrLZwVMj4rFGh39Oy2w043QSSA=;
 b=HE2YISeuKv2PfSwd38xGLOiBG5ZzmWxb5evNugaYBxRhwU5WrwC6XLVA7ZCgTj/rfP
 AXGjg4B4rYBeXJbLzZRb5J8r8fWL5I5YkpmVOGaWI3M0ZnqPSA6Y+nupHmMa0l0HmBuh
 F+5BSfIViQj9qbJGLSYSOJXiCIBbzKGD9xN/PVNe6q7dxUZtrUxFEa0G3qULKGfexBKq
 d+ruNcnsk9TqVCOqcqG9JkYHEjR0DKEHCYfw4N4HB9mso9RUlYEwZrZugI6KOHVj6qyx
 KTYVAfXSFisD6lc4oO/V55mPydudwi8BHr6eJ/fL54PrYats0YdJ+bkOy3yAqHw7HByO
 6MEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1sG3ovXtlfoOgWApvo0HgZSAB4hZLd1SBoPX6oGB71g9G6v0Hpy6qknfuv2Hq21XxY6g5iB60PxI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB8W/Lz+ynR/bb1eqNU93+38c5+jvgY4YV4vX9nra0q5w54xrx
 6SZFWacXWoV0LuwSwDe1odztcpFkidcoc9JGJSwJ3G0MAQ3WJpiHCiIPJ/PvvoE=
X-Gm-Gg: ASbGncs954U8UcWlBexonLxVNrmDsHMOV6fifilk/vU4iPuXkC26qXs44xELPsYPhjd
 8Ukh2DpEcVf+CRCo332+K2w2rMwAjCNQCUIAUaT4v3aixTmHU8KeeT47WUkKza20cERcdT86SFE
 AHcJ0+dWlYZqwH4DoIup41eNC1Ygw+iPRsTEQ6quO3vZkUoIoHixM8C1tcufPMBBHkAH8nWz5xK
 Z2Qe8ZYA774vKQqozg3twFJLkbNx5J0yoviRDC/ASduyaCUw8JJHQvJ7FMyf8CwZND6GV9nhWdu
 u+VZUvl0k8NZg+yLJ+AnrpjsqOh/DrwQSVbo
X-Google-Smtp-Source: AGHT+IHsNzccMcvdbHRkfYVmMDoqOyv7369RiZHtzafxhM8zI+VwKIqquVfPQdEv+gF1X2+8XlTl3g==
X-Received: by 2002:a05:6512:b0f:b0:540:3566:985c with SMTP id
 2adb3069b0e04-542845d1495mr1782471e87.26.1736425539185; 
 Thu, 09 Jan 2025 04:25:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea68e9sm180648e87.157.2025.01.09.04.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 04:25:37 -0800 (PST)
Date: Thu, 9 Jan 2025 14:25:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 stable <stable@kernel.org>
Subject: Re: [PATCH v1 1/2] misc: fastrpc: Fix registered buffer page address
Message-ID: <q4h6myikxgg226kbalquvoiveez2cpipopod5rt45d37f46fev@v5ir6c5eg343>
References: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
 <20241218102429.2026460-2-quic_ekangupt@quicinc.com>
 <rhy3yvsnhdud45mesempnwyv5faxfkbj2ba76k6dbm7krwl77y@mnpi5jzykjg3>
 <ed96e4b5-a0a0-4c0e-b2ef-e06ea9d3718a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed96e4b5-a0a0-4c0e-b2ef-e06ea9d3718a@quicinc.com>
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

On Thu, Jan 09, 2025 at 11:09:30AM +0530, Ekansh Gupta wrote:
> 
> 
> 
> On 12/18/2024 4:42 PM, Dmitry Baryshkov wrote:
> > On Wed, Dec 18, 2024 at 03:54:28PM +0530, Ekansh Gupta wrote:
> >> For registered  buffers, fastrpc driver sends the buffer information
> >> to remote subsystem. There is a problem with current implementation
> >> where the page address is being sent with an offset leading to
> >> improper buffer address on DSP. This is leads to functional failures
> >> as DSP expects base address in page information and extracts offset
> >> information from remote arguments. Mask the offset and pass the base
> >> page address to DSP.
> >>
> >> Fixes: 80f3afd72bd4 ("misc: fastrpc: consider address offset before sending to DSP")
> > This was committed in 2019. Are you saying that the driver has been
> > broken since that time? If so, what is the impact? Because I've
> > definitely been running fastrpc workload after that moment.
> >
> > Also, is there any reason for neglecting checkpatch warning?
> Hi Dmitry,
> 
> This issue is observed is a corner case when some buffer which is registered with fastrpc
> framework is passed with some offset by user and then the DSP implementation tried to
> read the data. As DSP expects base address and takes care of offsetting with remote
> arguments, passing an offsetted address will result in some unexpected data read in DSP.
> 
> All generic usecases usually pass the buffer as it is hence is problem is not usually observed. If
> someone tries to pass offsetted buffer and then tries to compare data at HLOS and DSP end,
> then the ambiguity will be observed.

Ok. Thanks for the explanation. Please consider moving relevant bits to
the commit message.

Also this brings up a topic that we have discussed several times: what
is the progress on a testsuite for the API?

Last, but not least, does this issue result in a possible access to
unrelated memory areas? Can it be exploited somehow?

> 
> Apologies for delay in response as I was traveling with very limited internet access.
> 
> --ekansh
> >
> >> Cc: stable <stable@kernel.org>
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index 48d08eeb2d20..cfa1546c9e3f 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -992,7 +992,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
> >>  			mmap_read_lock(current->mm);
> >>  			vma = find_vma(current->mm, ctx->args[i].ptr);
> >>  			if (vma)
> >> -				pages[i].addr += ctx->args[i].ptr -
> >> +				pages[i].addr += (ctx->args[i].ptr & PAGE_MASK) -
> >>  						 vma->vm_start;

Shouldn't it be other way around:

	pages[i].addr += (ctx->args[i].ptr - vma->vm_start) & PAGE_MASK;


Also, can offset be larger than a page size?

> >>  			mmap_read_unlock(current->mm);
> >>  
> >> -- 
> >> 2.34.1
> >>
> 

-- 
With best wishes
Dmitry
