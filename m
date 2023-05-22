Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 177CB70CA95
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C20910E26F;
	Mon, 22 May 2023 20:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1843410E285
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 20:15:10 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5304913530fso5868497a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684786510; x=1687378510;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=L9fN0dQoly88G20mqeG6e3wEqqETJg+h79VSFG9UPZE=;
 b=Vt5mLw1zDYiyC23QcOz7VOSTUfaxfWt+kaBNXr4ct2pwiJ99N4MhY1NbeTx3uv1mm6
 qRnDKSWxiCoUPyGP6Z666O7SSigjCy/AdTJKWo5Ri/TUJ1xBsQ0HVb2fau6I/qb+yU8m
 1r5UJtw9NgpIXzOePa+QVYe0Qj0thwDN6wDuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684786510; x=1687378510;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L9fN0dQoly88G20mqeG6e3wEqqETJg+h79VSFG9UPZE=;
 b=SJtlKCWEA4OCG94iv26ybzXsucP18hLt97Q1i/reSwrOX1IF0XE7bIFOUIBqhqRuzz
 VWTpl32/1kJ/XtHWv43BEShm0L9StQUScC3ckzHs/xhTMAE6uGEQTFli9wT9IkXOa738
 dFnzlmB2fTM/IZLIfkoZrMyrqRxdAQ1hOb2eiEJjUOMxE+PgrZmizxgByGknHFLDWJnO
 w2mxQ6Whb0iaZCTzcUUi3Ascv/PnWfPMbEARPuFstIO6mxDVg/aBq2AUucwCm8Og3VdG
 YTeFKG8F709HPTXo4cKVsX6oT/QWk7KmYeNy/zl1+22/FpkoBByihAPK73O0Z0yLb+v6
 U4PQ==
X-Gm-Message-State: AC+VfDwdBXaJNPz1sK61qebpMCLeff154r3VNLuxqBqFL8qfAZmawUMa
 d8Fhf3ko4DY9adnFTp6jXBtGLw==
X-Google-Smtp-Source: ACHHUZ7puI3viaM9u3eCn1pWl+lXzpSStw8vQUJTeuU3YLnaPBQ6edr8Hq6qSp4lKa3v8WUp7Z99Kg==
X-Received: by 2002:a17:902:e74c:b0:1af:a349:3f0d with SMTP id
 p12-20020a170902e74c00b001afa3493f0dmr8517770plf.23.1684786510093; 
 Mon, 22 May 2023 13:15:10 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 jd15-20020a170903260f00b001a634e79af0sm5209204plb.283.2023.05.22.13.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 13:15:09 -0700 (PDT)
Date: Mon, 22 May 2023 13:15:09 -0700
From: Kees Cook <keescook@chromium.org>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Subject: Re: [PATCH] drm/radeon: Replace all non-returning strlcpy with strscpy
Message-ID: <202305221315.4392080E4@keescook>
References: <20230522155032.2336283-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522155032.2336283-1-azeemshaikh38@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Pan Xinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 03:50:32PM +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
> 
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
