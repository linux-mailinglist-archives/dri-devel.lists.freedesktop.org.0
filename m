Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6FE70CA9A
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EE810E286;
	Mon, 22 May 2023 20:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8487310E286
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 20:15:26 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1ae85b71141so33179785ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684786526; x=1687378526;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Pdrje6wvnlDZ+Z6wbd9zxIlTwzeS32i409hLZznOFcY=;
 b=IKgGDbfMAFcTW0fCraBOWKLWmKW3iVgSXiA5H6aqBySMQvF33LN3e/4WaaVBfsNkiv
 rlwvatxvFaLKPYJiJOQxmwX7qux9hU+DbTGFv0sTcdeK2WbWfEGPKqRy9tINpmr6Gs9P
 +LMTABtMt4FGiI3+DOzwVFbwur7RscLj5yUcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684786526; x=1687378526;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pdrje6wvnlDZ+Z6wbd9zxIlTwzeS32i409hLZznOFcY=;
 b=a+AblZOrywD/16/70A1HNj+1towVuOsZ+E95XxSkzM+hmEiXlTYrLw+YxCVumHqxfW
 PQzHMp5O7v9G6u8yM9XJRzLUEz9KfgSl2lQQfPjQSjo8encCnih5SOyA7U/B3iSOIh6P
 RFvptC09TMFsPUp/6OkNbz4rZ1fs0N95HEXlii+BUN+KTRJ/1V/llVJenon8YCAt0aVL
 oeTspJCd6fFU6WYcf7wtaojoctKb+LW2Usp1k4Qo+XxoGgdfR/o8OMfaJjifkLlGkGGw
 vMwLOL8CEG23lflnFUanHEPqy29Fc9Hxad6ClyfahM8NwT3hyK8LH2JzK4FvAqZSnM1R
 isbg==
X-Gm-Message-State: AC+VfDxu8S8UlAKw28ebRJkqmSe+dtzqn5I9atfSq7l6cdWO/7CO91AI
 oOq6FPi2/ZT9vDXVmtLZBCHBIg==
X-Google-Smtp-Source: ACHHUZ7wj/gcQ29SqjtFdOT9i9jtD3FakkeSS/upmgojrQC0P7/HF13gNCI198y84KiPEaHhCoJBeg==
X-Received: by 2002:a17:902:b288:b0:1ae:56ff:74e with SMTP id
 u8-20020a170902b28800b001ae56ff074emr12788781plr.9.1684786525810; 
 Mon, 22 May 2023 13:15:25 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 x1-20020a170902a38100b001a6ff7bd4d9sm5339234pla.15.2023.05.22.13.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 13:15:25 -0700 (PDT)
Date: Mon, 22 May 2023 13:15:24 -0700
From: Kees Cook <keescook@chromium.org>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Subject: Re: [PATCH] drm/rockchip: Replace all non-returning strlcpy with
 strscpy
Message-ID: <202305221315.B1E5C7B@keescook>
References: <20230522155149.2336620-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522155149.2336620-1-azeemshaikh38@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 03:51:49PM +0000, Azeem Shaikh wrote:
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
