Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC107ADDD1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 19:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC0510E2B6;
	Mon, 25 Sep 2023 17:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B2710E2B6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 17:29:08 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-577e62e2adfso4433760a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 10:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695662948; x=1696267748;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/aMa/e/MpMROFsp3gARJijeh7sh0P+MuDKdlmUY9kPc=;
 b=VW+vbf9zP8LtXIHInMCu+XwRxb7nNG1L2A2rts6GDBj17cXrL4VuD3aunInDYVmQhV
 DTu3kGY/jYAlcbZL3hLK1lPL5ZxYSiIafHrYz/FOh59whbErajsBFsN60CH1EP2DNtj1
 Xt+/S+t0Wy8K47RNPP2o851e+zo8h3A7sj1rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695662948; x=1696267748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/aMa/e/MpMROFsp3gARJijeh7sh0P+MuDKdlmUY9kPc=;
 b=KtO+QIOHbY1LkGpPq0BrwHwo6yEddJXzqV4CUpRUpZ69G529V/VVhbNO7/JsEqkws0
 dcbPGkd9Im9R/z2z1sDtIFDGEsDFW7ee0/ncENUOT1PrSoeLyzbBupg8Y5/Cmi5QcLYy
 1OS56HkW79Ss6nn75jPJZ88MqulKt6oHPej3nhn7J14in+7cDklm5IW26QTEid69tWL5
 Lc7qPZQf4xmh0+9LZx+aX4PhxRC1lthgGIFNvH5uAaH0wmZD4Aux8JtNMECjH9RwConb
 SKrp/ixG/5ZNDmqQlnHa5smnl/sgKrtun+flmtOyb+MWzC7Na9lGRYypn9Giyzyb5fmg
 w7SQ==
X-Gm-Message-State: AOJu0YwhiZQFEa/0aJTyq+OJtwtz10lZNWkHO6F2WsayGw3ulMJGisY0
 mpZTEorCvHtYlNcHsldRUJWUNg==
X-Google-Smtp-Source: AGHT+IGOgiwM4+b8S6Xt1BZDhFJWOaJGQxJpivA0wrsHDefHQof1Ld6BLNGIRgIO+U3XOUTHoQ7GrQ==
X-Received: by 2002:a05:6a20:9499:b0:13b:a2c9:922e with SMTP id
 hs25-20020a056a20949900b0013ba2c9922emr4951421pzb.27.1695662948293; 
 Mon, 25 Sep 2023 10:29:08 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 z18-20020aa785d2000000b006829969e3b0sm8345115pfn.85.2023.09.25.10.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 10:29:07 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] accel/ivpu: Annotate struct ivpu_job with __counted_by
Date: Mon, 25 Sep 2023 10:21:58 -0700
Message-Id: <169566251617.320041.2089067222600486912.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925110352.GB846747@linux.intel.com>
References: <20230922175416.work.272-kees@kernel.org>
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
Cc: Tom Rix <trix@redhat.com>, Oded Gabbay <ogabbay@kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Sep 2023 10:54:17 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct ivpu_job.
> 
> [...]

Thanks Stanislaw! I'll take it through my for-next/hardening tree then:

[1/1] accel/ivpu: Annotate struct ivpu_job with __counted_by
      https://git.kernel.org/kees/c/2eabbbb8275b

Take care,

-- 
Kees Cook

