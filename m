Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8A67AC658
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 04:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1383A10E0DD;
	Sun, 24 Sep 2023 02:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A6F10E0D1
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 02:53:42 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3ae0b0e9a68so2620596b6e.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 19:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695524022; x=1696128822;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/d9b/PeADBzIfI3pWZpLK3xrhqpPASs1Sf8duAT6F0E=;
 b=ZZyWtZQ1dFjAjDvOVIDshtLKUOSGCqjFVuYYXo7ODzPCxoxvpiPPM0WdrPzNF5r0+6
 /PwQFKn8XQ/CGK1A8XZCJ5y9Zia4hr4ggV+8PuoshvKrJnArJCPVEIHkxXNnH5LQt4RT
 aDFZEsaBle1h1hsaMrpkrSqZ0x963Wk2yZjAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695524022; x=1696128822;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/d9b/PeADBzIfI3pWZpLK3xrhqpPASs1Sf8duAT6F0E=;
 b=GEfR7LSmVbTmDUqWTFurwTSs/PkSxccUmYNAim9xtrd93vJ1Ts7VYLCEESXspxNAbU
 hzRs6vprCxyq1gNp9A5DEds2V2dodWSpeopTO4Q76gR39fizYiVCpr/D9B/VO/kjnupk
 In1vjngIB8IsqL7FykkR7PMCPBiJ6N3YT6lbhA71FR9dGj5heZHgsSBCeNlrxOH93Qxf
 Gjzeut0x/GBSbneSGlQi8ESR98z4JufPsEMcfT+42Hvq8rW6WEFlk+BKOOfcX1+U5BL0
 fJgbDj830R+YE1KuY6GY13AEK4o0InkY+Sw64tucPEPxFY7lffAVVSDDNQUZrNZkzUNZ
 Rw9w==
X-Gm-Message-State: AOJu0Yzzyl/ls+TcoRPcbS3oDWRlMRjRjWnzGLxYBWtwmB6UuaG5tr2d
 z7MmP7UDEndNPwGpnZ7JDkjqpA==
X-Google-Smtp-Source: AGHT+IFC6DSYvUj9536i9d90/GS4ktpilI0BoWD5bQsotIoh2JHoAVTBOKOCB9AQfdY2ieUWLZZx9Q==
X-Received: by 2002:a05:6808:f8c:b0:3a7:366f:3b01 with SMTP id
 o12-20020a0568080f8c00b003a7366f3b01mr4444965oiw.33.1695524022174; 
 Sat, 23 Sep 2023 19:53:42 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 h12-20020a170902f54c00b001c55e13bf2asm6022710plf.283.2023.09.23.19.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 19:53:41 -0700 (PDT)
Date: Sat, 23 Sep 2023 19:53:41 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v2] drm/etnaviv: refactor deprecated strncpy
Message-ID: <202309231952.6E01CF3589@keescook>
References: <20230918-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v2-1-8ae12071c138@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v2-1-8ae12071c138@google.com>
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
Cc: Bo YU <tsu.yubo@gmail.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 linux-hardening@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 18, 2023 at 01:34:08PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> A suitable replacement is `strscpy_pad` due to the fact that it
> guarantees NUL-termination on the destination buffer whilst maintaining
> the NUL-padding behavior that strncpy provides.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Cc: Bo YU <tsu.yubo@gmail.com>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Looks good to me now. Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

(Though again if you need a v3, making the Subject more specific would
be nice, "...: Replace strncpy with strscpy_pad"

-Kees

-- 
Kees Cook
