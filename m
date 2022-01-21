Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A88495970
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 06:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7945B10E6AA;
	Fri, 21 Jan 2022 05:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C4310E6B7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 05:25:15 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id l5so21167505edv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 21:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JUrI0CIbeLsYv1K8VuO7jjapZZBa6rAM4oNdt35HhBQ=;
 b=nFVBOkpSgHJc4AlHP02L/VnMzkC+F1mwWuJKODmbTEBtoXE2Gt9Muz4iwkmA1NHYbu
 g2fJOV6zjvG+06kAx2tweNmPzIoZeog9Za6k67I5QPFPadl+mxd5GEddHn8V/eynXLp0
 VWhAy+0UNLEMtMR4v2gFMfy9QRIzoZctdCPWbgIq2/3uZVz0ovrZQqjiXlkG0EkYrOam
 sdoOKLv8d1C4R4wCsIZc5SgNUMtt5M53agHwrYc6Qe9r5hQTeCdNjRAD0uqlnSTmhtmc
 kmkbCvED08PDmZdHlWGElwJAOHmaPTLwVvMMGCYiM/hgGJwSV8xo8zpGjNJJ6J/OJ36N
 wqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JUrI0CIbeLsYv1K8VuO7jjapZZBa6rAM4oNdt35HhBQ=;
 b=hHjzP81GVhRIMvE6BZOYJSutE4vr6R0vC/ErL1W9OYhllB5bxwc+X7UvLqj5xY5rUG
 QBWcYILLEPKIR1OHlnhxAWQcXTpHXv+dsjX9rGKjB8d7XhZm/pHJYfclQ1o2P76ffrsQ
 kl/ZYnwrdMMKimHJhWlfKwv+JJMqPq1iXlUzk8Bu1AZTeXturNlQ0lUtQPT/OezyCP7D
 pB+M4itP9/sQKuBOeeQoSgLyFqq+Rc31+WXlXEQbWJdp7SNdGMqtssW6fQoy++tzxLhn
 HALAMOc8TYdnwpmxb7W1haEZwBYG6BCVk7FOaCvjKM6xqgkv5KtQsn592JEHupD90+qI
 xsdQ==
X-Gm-Message-State: AOAM533xfZ2rXvYDC2vU2ynS8fZp31D5OUrjLvZLpydGfIvnwUvOqfsm
 6VA8C1CGpj0gqdKr99Gxa3pl2BFuqeUukh9vLTOqnQ==
X-Google-Smtp-Source: ABdhPJyjuwwdwV2Mz8K14saU4//UOA3m1H12Enxava4+yiBjdJ+h/yvlXZtzCmwIzkDkN8OjGAjE31OwskKBu1i2iIQ=
X-Received: by 2002:a17:907:7f86:: with SMTP id
 qk6mr1992726ejc.631.1642742714101; 
 Thu, 20 Jan 2022 21:25:14 -0800 (PST)
MIME-Version: 1.0
References: <20220120143417.543744-1-maxime@cerno.tech>
 <20220120143417.543744-2-maxime@cerno.tech>
 <20220120213118.40F0AC340E3@smtp.kernel.org>
 <CAGS_qxq9qFjx+Su_E5sQF5tsgPCyhzGMFEMZbVqPN=N6U+s+9g@mail.gmail.com>
 <20220121043408.6C186C340E1@smtp.kernel.org>
In-Reply-To: <20220121043408.6C186C340E1@smtp.kernel.org>
From: Daniel Latypov <dlatypov@google.com>
Date: Thu, 20 Jan 2022 21:25:03 -0800
Message-ID: <CAGS_qxpHuN5nyn8V7LGeZ1VTzboCgDwrz=p3TFPi73tZ0pWOBQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] clk: Add Kunit tests for rate
To: Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Mike Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Phil Elwell <phil@raspberrypi.com>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 20, 2022 at 8:34 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Daniel Latypov (2022-01-20 13:56:39)
> > On Thu, Jan 20, 2022 at 1:31 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > KUnit doesn't have hard technical limitations in this regard.
> >
> > You could have something like this
> >
> > static void my_optional_kunit_test(struct kunit *test)
> > {
> > #ifdef CONFIG_OPTIONAL_FEATURE
> >
> > # else
> >   kunit_skip(test, "CONFIG_OPTIONAL_FEATURE is not enabled");
> > #endif
> > }
> >
> > I think it's just a matter of what's least confusing to users.
>
> Ok, I see. Is there some way to have multiple configs checked into the
> tree so we can test different kernel configuration code paths? This

Multiple kunitconfigs?
There's no restrictions on those

$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/clk
$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/clk/kunitconfig.foo
$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/clk/kunitconfig.bar

The first one will assume drivers/clk/.kunitconfig.
But there's no reason you need to have a file called that.
One could just have multiple standalone kunitconfigs, named however they like.

--kunitconfig is new enough (5.12+) that there's no real conventions yet.

Another option is
$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/clk \
   --kconfig_add=CONFIG_RARELY_USED=y

This is another case where we can do whatever is least confusing.

> discussion isn't really relevant to this patch so we can take this up in
> another thread if you like.
>
> >
> > >
> > > Maybe kunit should check that there was an EXPECT on return from the
> > > test. Daniel?
> >
> > Sorry, I'm not sure I understand the question.
> >
> > Are you saying you want kunit to flag cases like
> >   static void empty_test(struct kunit *) {}
> > ?
>
> Yes. I'd like kunit to enforce that all tests have at least one
> EXPECT_*() in them.

I totally understand the rationale.
It's a bit misleading to say PASSED if no expectation/assertion passed.
One might want a NO_STATUS (or maybe SKIPPED) result instead.

But other unit test frameworks act the way KUnit does here, so there's
an argument for consistency with others so users don't have to have a
whole new mental model.

Some examples below for reference.
All of these output something like
  test result: ok. 1 passed; ...

E.g. in Python
import unittest

class ExampleTest(unittest.TestCase):
  def test_foo(self):
    pass

if __name__ == '__main__':
  unittest.main()

In Golang:
package example

import "testing"

func TestFoo(t *testing.T) {}

In C++ using Googletest:
#include "gtest/gtest.h"

TEST(Suite, Case) { }

In Rust:
#[cfg(test)]
mod tests {
    #[test]
    fn test_empty() {}
}
