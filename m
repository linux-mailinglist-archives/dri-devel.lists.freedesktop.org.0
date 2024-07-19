Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7B2938164
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 14:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B76410E056;
	Sat, 20 Jul 2024 12:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lGNePcq8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696DB10E055
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 18:50:58 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2cd1661174cso177517a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 11:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721415058; x=1722019858; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RAEv+MGhyDj802ZNnZVlhgfJ7rM5mroogx7bWE9X/x4=;
 b=lGNePcq8B9x25TxrdnNhDA+hG6wOIUVr0+oX5Qg1u7qDqgEwl14/Xw0Gn4AdMgfPa+
 3F6L2oEUvtANWC7htakC5s2m4HU1NlwSBFdgHb+2qAjNXBIYXvH2xhxf31rx22ZzBO19
 k0D/ysr5jBUmXiCVe7xTZcNBLLmIfJOuT9HtEoWEmcAc5f/2Rlpldwn9XrYITxefy0M9
 Tod3u0BbP+lP4MUx4qwFWifYaa05X+EUsrYa4lCG9ruZa1XuLzvdNmYJENKwKL6nbT00
 5ARE4jh+Eo7us8/BggR3npERTvjj28zy4pH2R+0Xpg2I8V5ironffSDkbW9/XFqhR5M7
 5WNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721415058; x=1722019858;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RAEv+MGhyDj802ZNnZVlhgfJ7rM5mroogx7bWE9X/x4=;
 b=mqcqf7xsQm3mqGuidGwH6I5txT0nOLbymwQZT+0Jw0LPjMnNdK85xJ65A8rx1bZaxE
 WEU+iMt+LLgg0UMIRnfOFINTeOY9zNQiB8N7sx5K0SGG6OCdl1aW+SgG4NYjoODlmuZR
 AKfdPr09wyyOwh7dqMkBYfKTPgJmOysAaUZzWvtddwqi1kiaPvtffipXw6q3TCFWrnnP
 4PuJl1AM2sj+evl4HXlBqVzkcrhmrqaneIz0ihrdCwgdzBAU7EkI8pxFyX95Lur+LdKY
 jBcE/+4A+AE+Eazdi5UNDBHLvjfs4jG1JEBa30lmGRk9oRPtZxpN5h1kCI9EoNj46Fju
 m+uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4JO7VkXN7TaNTNutFlZmBnybzIyAWIZhoBf8hLkavD+4D+dPkesD02MtDfXL+/FVnoBbzujZcxF6HCE8LocSEM2aW6IU41J21B5e6Xdpu
X-Gm-Message-State: AOJu0Yzy+4wnFWOXgFk0P7z7i3Or90pLKzkpoo/RHmhvRqtDQvzkdjgw
 7WUXhrR6gjsiBsXYHGAx9G2q3qorVOuxaGZ+17pN9iSwdK0AIizF
X-Google-Smtp-Source: AGHT+IGbL5E/MFEgPWn06cYckxokoAX5eI4e0D2YJL6S5zac/xTsDRmKykBaYUraPNM6HMn49Mj4Qg==
X-Received: by 2002:a17:90a:fd0d:b0:2cb:5134:562a with SMTP id
 98e67ed59e1d1-2cb5246a16bmr6746195a91.7.1721415057638; 
 Fri, 19 Jul 2024 11:50:57 -0700 (PDT)
Received: from [192.168.179.119] ([131.107.174.134])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cb7750688esm3143801a91.37.2024.07.19.11.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 11:50:57 -0700 (PDT)
Message-ID: <0bad8507-22f3-38d2-5724-0aa6433990cc@gmail.com>
Date: Fri, 19 Jul 2024 11:50:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 0/4] drm/panic: Add a QR code panic screen
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240717142644.1106060-1-jfalempe@redhat.com>
From: Mitchell Levy <levymitchell0@gmail.com>
In-Reply-To: <20240717142644.1106060-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 20 Jul 2024 12:57:40 +0000
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

I am trying to test this patchset on my setup, but I cannot get it 
working. In case it's relevant, I'm running under HyperV. Any 
troubleshooting steps/suggestions would definitely be appreciated.

Thanks!
Mitchell

On 7/17/2024 7:24 AM, Jocelyn Falempe wrote:
> This series adds a new panic screen, with the kmsg data embedded in a QR code.
>
> The main advantage of QR code, is that you can copy/paste the debug data to a bug report.
>
> The QR code encoder is written in rust, and is very specific to drm panic.
> The reason is that it is called in a panic handler, and thus can't allocate memory, or use locking.
> The rust code uses a few rust core API, and provides only two C entry points.
> There is no particular reason to do it in rust, I just wanted to learn rust, and see if it can work in the kernel.
>
> If you want to see what it looks like, I've put a few screenshots here:
> https://github.com/kdj0c/panic_report/issues/1
>
> v2:
>   * Rewrite the rust comments with Markdown (Alice Ryhl)
>   * Mark drm_panic_qr_generate() as unsafe (Alice Ryhl)
>   * Use CStr directly, and remove the call to as_str_unchecked()
>     (Alice Ryhl)
>   * Add a check for data_len <= data_size (Greg KH)
>
> v3:
>   * Fix all rust comments (typo, punctuation) (Miguel Ojeda)
>   * Change the wording of safety comments (Alice Ryhl)
>   * Add a link to the javascript decoder in the Kconfig (Greg KH)
>   * Fix data_size and tmp_size check in drm_panic_qr_generate()
>   
>   v4:
>   * Fix the logic to find next line and skip the '\n' (Alice Ryhl)
>   * Remove __LOG_PREFIX as it's not used (Alice Ryhl)
>
> Jocelyn Falempe (4):
>    drm/panic: Add integer scaling to blit()
>    drm/rect: Add drm_rect_overlap()
>    drm/panic: Simplify logo handling
>    drm/panic: Add a QR code panic screen
>
>   drivers/gpu/drm/Kconfig         |   31 +
>   drivers/gpu/drm/Makefile        |    1 +
>   drivers/gpu/drm/drm_drv.c       |    3 +
>   drivers/gpu/drm/drm_panic.c     |  340 +++++++++--
>   drivers/gpu/drm/drm_panic_qr.rs | 1003 +++++++++++++++++++++++++++++++
>   include/drm/drm_panic.h         |    4 +
>   include/drm/drm_rect.h          |   15 +
>   7 files changed, 1358 insertions(+), 39 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_panic_qr.rs
>
>
> base-commit: e1a261ba599eec97e1c5c7760d5c3698fc24e6a6
