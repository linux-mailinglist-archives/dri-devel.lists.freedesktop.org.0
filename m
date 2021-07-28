Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6703A3D8C41
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 12:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4326E7DA;
	Wed, 28 Jul 2021 10:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07FE6E7DA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 10:54:21 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id l4so2565547ljq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 03:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y7BSRF2BV2wKYMpkMU6AInonSJrtXWVBGV0wA+UfcSQ=;
 b=HvxZxKORsgd1u77vvKkzSHVmzDZnFgdXGSifvV+HmSIPnClkA6lYo7Qz7nvYlLjejZ
 PK9B0U1dzVIDM4JKLg5sSHucPcc5bP4ZeDpjmSTAFJSiF4x48AfpDxMdOGxhIAJqc77U
 oc7qawDYmcTBtp40SM72ZiIXxtcm1lp5rspVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y7BSRF2BV2wKYMpkMU6AInonSJrtXWVBGV0wA+UfcSQ=;
 b=Z0p5NiV03S0cZmaFKRKkqHKvnXSOZF+sScekfnhjv1dJRAqahJVNGKs5dX3S1E/yTV
 XQIglSRSMZRChwierFLzlAZHXtD9AO2levnbGNapQKUSt6xIF49gqi0Zny5unvcloB4w
 TI7YDmDy9l+2lxv7KFivR7Dxy8pSoPU2PXcA/cUGkdCUpDLn7UgsK8Qx3RBJDw64aAsa
 n+AkuLsypoSBSg1pr1qE0LQkcoAjt40qGvB6zfDQv8jM6a0Vb7jgwNk0bRp4G9Bq+6uD
 QDt9WulAUp5qeX3dw8IrbFdTJY0ufWeQy43vU6eej/FMBGpI4wrwDZznsnnePjh4EO+M
 2AZQ==
X-Gm-Message-State: AOAM530ljR9i64plbgZwrJSDSe6zJbOx8aA1qCYaAstbY6hjw5XHbz0j
 DN3pCvvLuDv1WUEVx4bwBUIS9Q==
X-Google-Smtp-Source: ABdhPJzsNcjtwcC6XUZJ5ZJ1M5kI8nrl9w1bOGQ6hWCdCY07r8K6xPGQ9TuYLQLsRgK+FjENio3Z4w==
X-Received: by 2002:a05:651c:1144:: with SMTP id
 h4mr18097576ljo.396.1627469659652; 
 Wed, 28 Jul 2021 03:54:19 -0700 (PDT)
Received: from [172.16.11.1] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id o1sm555702lfk.298.2021.07.28.03.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 03:54:19 -0700 (PDT)
Subject: Re: [PATCH 04/64] stddef: Introduce struct_group() helper macro
To: Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-5-keescook@chromium.org>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <41183a98-bdb9-4ad6-7eab-5a7292a6df84@rasmusvillemoes.dk>
Date: Wed, 28 Jul 2021 12:54:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727205855.411487-5-keescook@chromium.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, netdev@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/07/2021 22.57, Kees Cook wrote:

> In order to have a regular programmatic way to describe a struct
> region that can be used for references and sizing, can be examined for
> bounds checking, avoids forcing the use of intermediate identifiers,
> and avoids polluting the global namespace, introduce the struct_group()
> macro. This macro wraps the member declarations to create an anonymous
> union of an anonymous struct (no intermediate name) and a named struct
> (for references and sizing):
> 
> 	struct foo {
> 		int one;
> 		struct_group(thing,
> 			int two,
> 			int three,
> 		);
> 		int four;
> 	};

That example won't compile, the commas after two and three should be
semicolons.

And your implementation relies on MEMBERS not containing any comma
tokens, but as

  int a, b, c, d;

is a valid way to declare multiple members, consider making MEMBERS
variadic

#define struct_group(NAME, MEMBERS...)

to have it slurp up every subsequent argument and make that work.

> 
> Co-developed-by: Keith Packard <keithpac@amazon.com>
> Signed-off-by: Keith Packard <keithpac@amazon.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/linux/stddef.h | 34 ++++++++++++++++++++++++++++++++++

Bikeshedding a bit, but do we need to add 34 lines that need to be
preprocessed to virtually each and every translation unit [as opposed to
adding a struct_group.h header]? Oh well, you need it for struct
skbuff.h, so it would be pulled in by a lot regardless :(

Rasmus
