Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8124249562A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 22:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C94310E687;
	Thu, 20 Jan 2022 21:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0843710E687
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 21:56:52 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id l5so17497794edv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 13:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8u7NMm+rPXQcaBd4u7CURbKlEhOD+sAcU76P/uy3xSo=;
 b=Nhv802qLytk4HmYE3loHOq2Ltf4zwpYqzFr1Z2gDlmKh/ZqbIyoSYnJanUPRP3VM7m
 7hw42HeKvDf+S1kJHokoR14s3T7waaTflccbp8BOA5ylIB0SAPxtlZ/iYjbwL8NxB6RB
 0yG1DqamdnKmppodbDRL5cqBh39YLejrLRpUDTJi0GUgJYSG1G6WjkrpcaWGwiuyEWWC
 TzzgHBK8/OKZI8NFyYpV53SqA+Kgnq35O682Ucs29bagWVx9dvNdxuUvOrL6MHXNpwX+
 YVP+6rNvUo5aQoa+X6pgT+jGS2B6vJf9nbIjHvdlvo3m2IYzUDQJi0uz9ls/JboDosmV
 7ohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8u7NMm+rPXQcaBd4u7CURbKlEhOD+sAcU76P/uy3xSo=;
 b=yfb9OVaX+GXeuFWv5l5BjmnQZwWzOgp/+fIvAWBQ6JaIncNP/GJYj49T/vh4/1nnbS
 wjPlzxgOT4F39rI9H8hO7G8ff7M5SyHZ5+4KPvPMVIBJIAe/Q+7S6DT8UjeuyxC1zaia
 GnibYM8Z5pYvvjKmwxx5ukdxOLmgF7IW1F4vvaP4taOI8PCVU2eU0o68wQgvpA90bJAf
 RTo1pTAqgIPj0YadvPMKuq1ywSoPIrW2jRfeaXYrJ5M5hycGV060MR/49Jukn0rkJXlq
 R9jJnxVFAP70X/qSII7JeWUJvMNCmf2myYuNNxOw4T2d82cuEEY0/mfdQMHrBk6399dn
 Ktxg==
X-Gm-Message-State: AOAM532EvCA1LETNDM3VkM9FxYq4yCDgTtcVmNjtNuf3qYQARlUslpsN
 K0w+i6LPT3dHTjad35OpQW+YxNwecAo4OV9/96Z39Q==
X-Google-Smtp-Source: ABdhPJycMxh1F3SLvffkdrbcJ2W2XXm+SFnaVBUXceg/wlh8jd9RkYhsIIluk6AwlmUPqugURrQqde0qXyz0jCXbpzA=
X-Received: by 2002:a17:907:6da4:: with SMTP id
 sb36mr766447ejc.542.1642715810271; 
 Thu, 20 Jan 2022 13:56:50 -0800 (PST)
MIME-Version: 1.0
References: <20220120143417.543744-1-maxime@cerno.tech>
 <20220120143417.543744-2-maxime@cerno.tech>
 <20220120213118.40F0AC340E3@smtp.kernel.org>
In-Reply-To: <20220120213118.40F0AC340E3@smtp.kernel.org>
From: Daniel Latypov <dlatypov@google.com>
Date: Thu, 20 Jan 2022 13:56:39 -0800
Message-ID: <CAGS_qxq9qFjx+Su_E5sQF5tsgPCyhzGMFEMZbVqPN=N6U+s+9g@mail.gmail.com>
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

On Thu, Jan 20, 2022 at 1:31 PM Stephen Boyd <sboyd@kernel.org> wrote:
> I was thinking this would be more generic so that one file tests clk.c
> and all the code in there, but I guess there may be config dependencies
> like CONFIG_OF that we may want to extract out and depend on
> differently. I'm not sure how kunit will handle testing different paths
> depending on build configuration so this approach may head off future
> problems. If it doesn't then we can always slam the test together.

KUnit doesn't have hard technical limitations in this regard.

You could have something like this

static void my_optional_kunit_test(struct kunit *test)
{
#ifdef CONFIG_OPTIONAL_FEATURE

# else
  kunit_skip(test, "CONFIG_OPTIONAL_FEATURE is not enabled");
#endif
}

I think it's just a matter of what's least confusing to users.

> > +}
> > +
> > +/*
> > + * Test that the actual rate matches what is returned by clk_get_rate()
> > + */
> > +static void clk_rate_test_get_rate(struct kunit *test)
> > +{
> > +       struct clk_dummy_rate_context *ctx = test->priv;
> > +       struct clk_hw *hw = &ctx->hw;
> > +       struct clk *clk = hw->clk;
> > +       unsigned long rate;
> > +
> > +       rate = clk_get_rate(clk);
> > +       KUNIT_ASSERT_TRUE(test, rate > 0);

KUNIT_EXPECT_GT(test, rate, 0);

> > +       KUNIT_ASSERT_EQ(test, rate, ctx->rate);
>
> These should be KUNIT_EXPECT_*() as we don't want to stop the test if
> the rate is wrong, we want to check that the rate is what we expected it
> to be. Assertions are about making sure things are sane and if not we
> should stop testing, whereas expectations are about testing the code. A
> test must have an EXPECT while it can have an ASSERT.
>
> Maybe kunit should check that there was an EXPECT on return from the
> test. Daniel?

Sorry, I'm not sure I understand the question.

Are you saying you want kunit to flag cases like
  static void empty_test(struct kunit *) {}
?
