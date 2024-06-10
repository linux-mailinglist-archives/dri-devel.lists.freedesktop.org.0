Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0C39026EF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 18:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F88C10E221;
	Mon, 10 Jun 2024 16:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JgSgBbdd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA11110E486
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 16:44:04 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2c2c74d9be0so126096a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 09:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1718037844; x=1718642644;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZWJrFt56Ba2XKaEKUnUCqUmu/jVW4Te91KO0JGqkT1U=;
 b=JgSgBbddLg6O3d5m0H24dBWHhA0aROhh0SaeMvj3xM6258lEFxgNwDP8PuSdHhItYq
 m7MWuMt2hct7gzm4ePyWeNEbEnMlnrnaWfr7IU8LF4jtdSLHSJsWdTpNs1fs+NoXMr52
 7SODa8tMYYYgWdBbO9G/YrFenxqnPZ31vwZA5Fjs29NbZ4ICpLQx/RCclpXe5nws5GRz
 Gvzy0DHbtN6oZcrRHW1xmVTlG5ZZ07HBfzwpeYrGOVpgdiV0ZXOPx78BkP4rmXMM5v2o
 tKrj94gXzB2RYgJQDjj+SR4DbLbtRmB9lhztENMhcmToscWOguU3OaZsEMQRBgBmqi/4
 mQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718037844; x=1718642644;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWJrFt56Ba2XKaEKUnUCqUmu/jVW4Te91KO0JGqkT1U=;
 b=hxWIXEj5EUWgEVcVqfSN3wvuDOU86RkEbcsxtVVtiTnKagdLb4Ea00Vtz9NJkogh11
 TOks5aiz34nw8d+5faHzzpM3q6ENdrUuRumMIFQd4jMh8Pft/AE2B4N1+kGrkxiTEIiY
 Ei7aVn27j9cewZISM+9eYiHDzEJgy6o2qLlMjMJsxyG1ci0MJF4xHm+hRomyrfxDTZR0
 ylIUuihMLloxWuxswszmqnjUeVRHQnUBYR9QyHKX9ilURXuT8EgqjQlzMt6Phbrmi5jJ
 uNaAXRqm9w4Y1FIaRaES7Hy/dHGznuQt2g3HJLLRNInbcXFwWkKXdBQsZsO4hj/c8Ej7
 pamw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWj7qwpuSlyOvzDHPEpRrmXpyV3vbwXlKjPLHU/1vad0a8PER+gvFEiLbeWqZ7Dnxcxzfu89yGYK/7VygDaXdXrKXNx5fRGceZWP2RblPi
X-Gm-Message-State: AOJu0YzfKK9vDOk5w6U/uLbtsWvPHNc+/uqR5iNXyl7PpIH8jJNeqP6L
 iALQ2bdgsllNWggiX5m/ccjTDJ5VhoCMXTdvd5Bq/B9VyU6dqb9GpqRKh000Aw==
X-Google-Smtp-Source: AGHT+IFO/T7QbJyG6RfIGM4sbC0wUi2kSF81e1T/t2MsMvtblCbstqePphSLuWts4/pUFHivpG5mhw==
X-Received: by 2002:a17:90b:1c8c:b0:2c2:3de7:20c0 with SMTP id
 98e67ed59e1d1-2c2bcc4cd43mr8521758a91.37.1718037843726; 
 Mon, 10 Jun 2024 09:44:03 -0700 (PDT)
Received: from google.com (226.75.127.34.bc.googleusercontent.com.
 [34.127.75.226]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c28066d57esm11358284a91.19.2024.06.10.09.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 09:44:03 -0700 (PDT)
Date: Mon, 10 Jun 2024 16:43:59 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Barry Song <21cnbao@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org, Brian.Starkey@arm.com,
 benjamin.gaignard@collabora.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, jstultz@google.com,
 linux-kernel@vger.kernel.org, tjmercier@google.com,
 v-songbaohua@oppo.com, hailong.liu@oppo.com
Subject: Re: [PATCH] dma-buf/heaps: Correct the types of fd_flags and
 heap_flags
Message-ID: <ZmctTwAuzkObaXLi@google.com>
References: <20240606020213.49854-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606020213.49854-1-21cnbao@gmail.com>
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

On Thu, Jun 06, 2024 at 02:02:13PM +1200, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> dma_heap_allocation_data defines the UAPI as follows:
> 
>  struct dma_heap_allocation_data {
>         __u64 len;
>         __u32 fd;
>         __u32 fd_flags;
>         __u64 heap_flags;
>  };
> 
> But dma heaps are casting both fd_flags and heap_flags into
> unsigned long. This patch makes dma heaps - cma heap and
> system heap have consistent types with UAPI.
> 
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---

Looks good to me, thanks!

Reviewed-by: Carlos Llamas <cmllamas@google.com>
