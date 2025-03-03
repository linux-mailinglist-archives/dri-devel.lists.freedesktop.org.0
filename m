Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2882CA4BC90
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 11:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9826110E222;
	Mon,  3 Mar 2025 10:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="YE3xbJ0i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BE310E222
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 10:40:34 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-abf42913e95so358323566b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 02:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1740998433; x=1741603233; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5a9h6+RNdDno0AFoqzH4L74Ntb9x5So7/S1R2/2cyIA=;
 b=YE3xbJ0iw3wIZ5vqH615X4TihtRtifKmAAfzJQeN0S1eSmONin+sJUkX+fUxOTbIZH
 aBtcljqCGe14/o0+rARXUQHYmv+ElxWdP8HFhe7/5Qd8ch2zkKSBhLlvmMigu5oUa58/
 gr/i43nZAzxc62892CVMDAizOGIbYH2OA+MtVk+a0hzLL1EDrHgIONAD2+z3PNkJfT54
 iwzA1e+MQf8FQcp7ulDVGnEppg/qspHSGYrxr9kkZxgwGvCLRM0FTl2c9wFdxKDVF9Kz
 +b0v37+5xXhxNIsMeFynNG8alS31gzb8MqA8FDVbR0+JLbXCeCzDXqHVlON2wzI4qsgr
 Xs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740998433; x=1741603233;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5a9h6+RNdDno0AFoqzH4L74Ntb9x5So7/S1R2/2cyIA=;
 b=OfS4yRi+wHN5gdRRQjF4z9PpaMWSXPyeJU3keyjqNkJC0WCU8g35Exz5XDHzPOCft5
 lklfjYJN77+8DgBN/uAGhgaECM2CucWfqO1/kaNXmBawaVN1unmmSULNFdiEpjxUIOgC
 WwOSxNjOG4Iq4Vp0evOOc95xACMfgCJIs9c+e6mb35Wyq9cg2Zk6lQZfSUHnwYt6BsnL
 5ko22dcM4cM8+85QL+T69vuOvaAGtsDrlHCItVkLMxRuv3KSaYQW8af99gBzSs/Qqwq1
 RtqHM4oIbc3QhFj6WulBE3DLG5RrlzMfIvpXbl5yBWGsbvCqKYM9KaaJWAuzA6XPbkVm
 +PDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE+BfUALwIZU2gSANlcsoWyO9WSXVIKkgD1gUXif84FZ4eCo7M9e0jqdAe1BX0h8/jsFi+8h8emAA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxi9rc01TXfO9bNOySHzbT+h3rmPLk5MMQNHYXmX7KY2d62FxY5
 +aP2DQSDYTK6D8E7CnCjufP/dRQUHHQOn0H9hViiDVTHZBCocnBdqjPRICPrkIY=
X-Gm-Gg: ASbGncsDuH54Jh3DOHPg6twiPAB3kFOvE2gdPaoTi/eGQrYWWi1XIGxIODFnf7QbVby
 FZ+1001pjyqyLBXq7vJSbMbUjXStzKrJOZqbOk5UNgFMpEonNN4CTsTylbKMwccgkf2/btZ+DYc
 K04MbdEtxiL1fWeWHj9xnoES7o1SLHalC5+0GjNZ3OKuK7x5ugMv0S3ipGKb5BwHltjxizJUlGA
 OXqPgmM79NnviQySPdNqTFGUhEIe6HHddJl+zQ3ei1/Q/z3xk/AaaCaK02Cb0guAWUaKfetl1fM
 vbspLccPMO7jBgBWAk/9oeUhh7gLituVx2Am4qb7sv2WdeE=
X-Google-Smtp-Source: AGHT+IFdxe1UliGedp4UVoTzjvVx7nmKJ02BWHR9cvVprp2v8Ja1Mccur8mOERuQ9+frcz5n+hpjGg==
X-Received: by 2002:a17:907:3ea9:b0:ab7:bac4:b321 with SMTP id
 a640c23a62f3a-abf2656bcefmr1434681866b.29.1740998433246; 
 Mon, 03 Mar 2025 02:40:33 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf75481eb4sm207346566b.83.2025.03.03.02.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 02:40:32 -0800 (PST)
Date: Mon, 3 Mar 2025 11:40:30 +0100
From: Petr Mladek <pmladek@suse.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/5] print: use new #[export] macro for
 rust_fmt_argument
Message-ID: <Z8WHHs8eGcV2mCAw@pathway.suse.cz>
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
 <20250303-export-macro-v3-4-41fbad85a27f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-export-macro-v3-4-41fbad85a27f@google.com>
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

On Mon 2025-03-03 08:45:15, Alice Ryhl wrote:
> This moves the rust_fmt_argument function over to use the new #[export]
> macro, which will verify at compile-time that the function signature
> matches what is in the header file.
> 
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Tamir Duberstein <tamird@gmail.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Acked-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
