Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FFB3D87BA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 08:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B9C6ECB9;
	Wed, 28 Jul 2021 06:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486846E047
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 23:31:07 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so7115832pja.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 16:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cfNumURh2GjYDfPowtmTPayG3eiC6vg99u71kmeqTyM=;
 b=rHaFBKn1YqbVb5nFxnJv2/QQZw3GzSXfORbSH0ee/AM9SOIQQVhQ0YJzG3kZ7lMecc
 a3d2fJIWjR0qAwbYP44naLJ7CM7Mns8Cbee6YldhTpkehIc4vASWyXUVRNw2V1XZUCuc
 7Olp8ezxsATASJ5LnBc6gPKs9izsYYBK5IiEx5ncY6Ynje4VoHcgcUe9Sypp5eyn2T+O
 p//AZ1GMsCfeSlKMknXE9zEOF36CIOm+Qrehp7IJK8CDgb9a2NjiLY0jZkWUku08pYef
 RWWksAh2YzeE8rJhSfm8Y42BuOkM46OUGWTMoBSYgFvrlr+PzUZfDkYjlKUcAhCQhN93
 eWTg==
X-Gm-Message-State: AOAM532IJubjhYtGtuGhOAeKTamRFumdaxLk60l8/Yrga5KsOG++VHXF
 3PqvVpzdfQdhc2aNvI2GSWM=
X-Google-Smtp-Source: ABdhPJxjlXDVaN8+tg1bxudbyKmetnxeWdVqGkL064ebMKIBrwhnuUBgPMqLVVo86W/q+KmaVUhOyQ==
X-Received: by 2002:a17:902:8493:b029:12c:552f:1fb1 with SMTP id
 c19-20020a1709028493b029012c552f1fb1mr2088759plo.26.1627428666440; 
 Tue, 27 Jul 2021 16:31:06 -0700 (PDT)
Received: from ?IPv6:2620:0:1000:2004:f8ef:f6a:11cc:887d?
 ([2620:0:1000:2004:f8ef:f6a:11cc:887d])
 by smtp.gmail.com with ESMTPSA id j12sm4695249pfj.208.2021.07.27.16.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 16:31:05 -0700 (PDT)
Subject: Re: [PATCH 33/64] lib: Introduce CONFIG_TEST_MEMCPY
To: Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-34-keescook@chromium.org>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <9827144a-dacf-61dc-d554-6c69434708de@acm.org>
Date: Tue, 27 Jul 2021 16:31:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210727205855.411487-34-keescook@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 28 Jul 2021 06:14:26 +0000
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

On 7/27/21 1:58 PM, Kees Cook wrote:
> +static int __init test_memcpy_init(void)
> +{
> +	int err = 0;
> +
> +	err |= test_memcpy();
> +	err |= test_memmove();
> +	err |= test_memset();
> +
> +	if (err) {
> +		pr_warn("FAIL!\n");
> +		err = -EINVAL;
> +	} else {
> +		pr_info("all tests passed\n");
> +	}
> +
> +	return err;
> +}
> +
> +static void __exit test_memcpy_exit(void)
> +{ }
> +
> +module_init(test_memcpy_init);
> +module_exit(test_memcpy_exit);
> +MODULE_LICENSE("GPL");

Has it been considered to implement this test using the Kunit framework?

Thanks,

Bart.


