Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB45A62FBCF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 18:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BC710E23B;
	Fri, 18 Nov 2022 17:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76FD10E23B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 17:40:17 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id z26so5545900pff.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 09:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B57T8uZs4kSEK7BZka3aDp/YZY01b3mwy/c7O4ofLxM=;
 b=iS1EU+k/Ez8kCgR9jL46V+OCbHucz4zMezoWTCKlYrd8FXkX+Pjv3zNnz6phAqfuMN
 u9EdWMAO+0aGG+7wXvNtWvEn7aCxk3mBjoG5maDdYcWQGsT82es6CTa6OQ8LNSHMMD8Y
 ke+dhjLZwJ4iG+x/bMJa2INjB3Obart5TQmUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B57T8uZs4kSEK7BZka3aDp/YZY01b3mwy/c7O4ofLxM=;
 b=gH0uEEVqLCaoWik5/PLuHGI5tLz1dWbLnKwI+ssmsqZjVIDAcBFv/O6+8Q2GrbBG2s
 Xyt6MrF5EDKAiYNp9d7/5VKjVU3zNOsTJQP+KP39BGyN4/wr9gau/ZzhP/er7GsI/FmS
 h/eIQoO9jQNScVoH5K0NRrRT2X59WvwqfZpVs8vjwvzntq9m5+x20CMqBKCTpc5qA8y0
 CJBj54eHVerhzA8UdAbKwhQ2Dj8cBWv210Rt8VBHCBVMFN3keRRHWcFHsWFwkBLN3YOh
 sORdPdPLN7H3nB6ZIeG8x0czxRdPtaXIyE4ru8TLEhUXHLQENv26R7UBC892tSMsihlC
 leYw==
X-Gm-Message-State: ANoB5pk1Va3dHufGf5repInbw0kAAaVcCL879qgNr1VxR5tdQjuDHx7k
 t+Bmrsg7j4g8jcejVovZj0em0w==
X-Google-Smtp-Source: AA0mqf4X1RIiE+117/z5tT4zIbvkcA//TYvYG/AUDdQvRWDbDhLF366Jq7IVJU5l9njz8oo6JGboiA==
X-Received: by 2002:a63:1760:0:b0:470:580a:c8a with SMTP id
 32-20020a631760000000b00470580a0c8amr7093994pgx.505.1668793216867; 
 Fri, 18 Nov 2022 09:40:16 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 w11-20020aa79a0b000000b0056bad6ff1b8sm3416073pfj.101.2022.11.18.09.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 09:40:16 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: nathan@kernel.org,
	alison.wang@nxp.com,
	stefan@agner.ch
Subject: Re: [PATCH] drm/fsl-dcu: Fix return type of
 fsl_dcu_drm_connector_mode_valid()
Date: Fri, 18 Nov 2022 09:40:01 -0800
Message-Id: <166879319846.2080862.8296193513373990861.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102154215.78059-1-nathan@kernel.org>
References: <20221102154215.78059-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Kees Cook <keescook@chromium.org>, trix@redhat.com, llvm@lists.linux.dev,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev,
 samitolvanen@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Nov 2022 08:42:15 -0700, Nathan Chancellor wrote:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> proposed warning in clang aims to catch these at compile time, which
> reveals:
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] drm/fsl-dcu: Fix return type of fsl_dcu_drm_connector_mode_valid()
      https://git.kernel.org/kees/c/96d845a67b7e

-- 
Kees Cook

