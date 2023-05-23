Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B84BB70E2B5
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 19:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168B210E483;
	Tue, 23 May 2023 17:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D7410E483
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 17:22:01 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-64d24136685so78775b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 10:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684862521; x=1687454521;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fHVrD6f1ZBUvDig9B8fW+B2T1eaWt6K+xteWleiUqpM=;
 b=e5PYsZyCe4Epu1Ke/nz+Z7QcMheP3mHbB5OT+nXSLQHtYOVqA0B5S+RVBcCdExHr7O
 PLvUYCGSC+fAdno27iE+11Hiv6vMk2puQ2aeXx+WjolHH54i76xJTjTYLZ1BPZqKTgI0
 IQsOUruJVQH6ptfrpSjbYLmsOSRLfml/Lzv0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684862521; x=1687454521;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fHVrD6f1ZBUvDig9B8fW+B2T1eaWt6K+xteWleiUqpM=;
 b=AUdbULazFlOYGXEsp9GtiQ8Xa6n1ZR3lwTXqv6R0K2b50/fszG2juIuvwecAuNKiST
 BYrhLEJ99DeN+ad+4Lgi6IY2ZyQmkQzlwEPEAmdQ4byn+eJv7j3gt8Y5MWlGKSOAMYcs
 zwGljDGntNVFLZcB9MWmzRxgdcxpWoPu5EsG2S8vKNYO8pB3eGW6gKwRN87f5wXpOZFU
 2+lMTzcJPzPJ5y52Hj2AlvpqGN6Lk/vk4KzmexAtv4EFszyWZz6kzgiAaYtY/3JZLZx6
 Xfds0ILOCtpFSlTRM6IfXYGyC+jegLQhP+8qzHbwzdcdEbs6E+Kg5vT0WmUP+iHdVKBE
 ZjAg==
X-Gm-Message-State: AC+VfDyVg8YErrplPQqoxvjZd99SuQ+oKHhfkRD06Ed36trLrERJT4TH
 tLUq3LHWndoeaLLp6/BPc4hLkw==
X-Google-Smtp-Source: ACHHUZ7cXxywMhTMsCCeZFCG2v76uB1SI9E//UYkMAB7ugfsk2mA7bx7DzrpyQIaVH5nJKGzE6aICQ==
X-Received: by 2002:a05:6a20:12d1:b0:10c:6956:a23c with SMTP id
 v17-20020a056a2012d100b0010c6956a23cmr3057009pzg.25.1684862520815; 
 Tue, 23 May 2023 10:22:00 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 139-20020a630591000000b0051baf3f1b3esm6359325pgf.76.2023.05.23.10.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 10:22:00 -0700 (PDT)
Date: Tue, 23 May 2023 10:21:59 -0700
From: Kees Cook <keescook@chromium.org>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Subject: Re: [PATCH] dma-buf/sw_sync: Replace all non-returning strlcpy with
 strscpy
Message-ID: <202305231021.1AF1342BF@keescook>
References: <20230523021943.2406847-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523021943.2406847-1-azeemshaikh38@gmail.com>
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
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-hardening@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 02:19:43AM +0000, Azeem Shaikh wrote:
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
