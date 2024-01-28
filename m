Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCB183F9A5
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 21:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A5510EB0D;
	Sun, 28 Jan 2024 20:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC34510EB0D
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 20:00:48 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-510f37d673aso819722e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 12:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1706471987; x=1707076787;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jvgl07qLmO97AnDOonOYaDY55AuzJRLfRUuCExUHbJw=;
 b=PFtw0sJ28kZn/HO52a9Eg8mzjnTypO+qHEo7+JMjlNK8KRJcV3moV8dnfRxDyxHGm6
 W3Mcgt1UU4H+jg/PNpVV9X7K1xN7t7Iagh+gDOiERTn7sNPJ+ogxTKQw3+MQt9kle3xD
 mxrhWjLDgfcfTC/McEipOclT5hB6VS2cXw4w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706471987; x=1707076787;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jvgl07qLmO97AnDOonOYaDY55AuzJRLfRUuCExUHbJw=;
 b=d3e/EJ5gzxrpkQAeSjFgIK8MHNlKE0K6qNfnntL8MU0dWDau8QrZZt41LaV/Xf38kr
 JqyfqG/PeQbTOnEEgSYjiKQOpMnvy90ZBPngEWCVQLegyyo526BEjD/ibJKND79QmQXW
 hQAdfTBJKNo1RsFZg6wHfP9RC2n2qPMW6J+m/eIXPlhcmp+u/XwZX5+bxPxXSiLfo1GL
 S7mfS+bnA8CQ/xHpc3oHM+PheJ91dsC2FklAlK2u1ptMM8MMNwi6E+SItdUUplBRJxka
 40g0gmJwaSfCwnmZcHYpo8sClpcH8qQ4PJMWXpIqi6+z/x5iUiVkX3bbkvWPDWnJnbeC
 EmDQ==
X-Gm-Message-State: AOJu0YzK+zTSuiPAwMXii1799GK/Fdcy57H232+YRdZD8XUouifuF+7s
 ZlkR0fdN8OoFnZugy+YfvpeDO0AIbteNqqRDTZSUCNsLI8ffN5+eU8ea9zUIgDdCzTXjhwvuicz
 ko/Q=
X-Google-Smtp-Source: AGHT+IH0Romt575tc+if2/sl0M+HsFWtHC1wabwPMkvX/GcQFEWUHuFA3PU1bzo0zvK27FGMrpMAHg==
X-Received: by 2002:a19:e05a:0:b0:50e:7c08:1a55 with SMTP id
 g26-20020a19e05a000000b0050e7c081a55mr3108909lfj.18.1706471986780; 
 Sun, 28 Jan 2024 11:59:46 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 t25-20020ac24c19000000b005101ae8cea9sm886973lfq.255.2024.01.28.11.59.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Jan 2024 11:59:46 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2cf1fd1cc5bso23368171fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 11:59:46 -0800 (PST)
X-Received: by 2002:a2e:994e:0:b0:2cf:1a11:ea87 with SMTP id
 r14-20020a2e994e000000b002cf1a11ea87mr3234050ljj.39.1706471985664; Sun, 28
 Jan 2024 11:59:45 -0800 (PST)
MIME-Version: 1.0
References: <0ca26166dd2a4ff5a674b84704ff1517@AcuMS.aculab.com>
 <b564df3f987e4371a445840df1f70561@AcuMS.aculab.com>
In-Reply-To: <b564df3f987e4371a445840df1f70561@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 28 Jan 2024 11:59:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=whxYjLFhjov39N67ePb3qmCmxrhbVXEtydeadfao53P+A@mail.gmail.com>
Message-ID: <CAHk-=whxYjLFhjov39N67ePb3qmCmxrhbVXEtydeadfao53P+A@mail.gmail.com>
Subject: Re: [PATCH next 10/11] block: Use a boolean expression instead of
 max() on booleans
To: David Laight <David.Laight@aculab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "David S . Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 28 Jan 2024 at 11:36, David Laight <David.Laight@aculab.com> wrote:
>
> However it generates:
> error: comparison of constant =C3=A2=E2=82=AC=CB=9C0=C3=A2=E2=82=AC=E2=84=
=A2 with boolean expression is always true [-Werror=3Dbool-compare]
> inside the signedness check that max() does unless a '+ 0' is added.

Please fix your locale. You have random garbage characters there,
presumably because you have some incorrect locale setting somewhere in
your toolchain.

           Linus
