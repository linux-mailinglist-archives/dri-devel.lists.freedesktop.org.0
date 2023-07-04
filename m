Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932DF746E5D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 12:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B800E10E0D5;
	Tue,  4 Jul 2023 10:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8ED910E0D5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 10:16:50 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-bcb6dbc477eso4999250276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 03:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688465810; x=1691057810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CPcHQE4tow2wDxnoKB8DgZ62T1VtFFyST4bs6MRIWiM=;
 b=QTnvZk1ulea/KAFt2g0lgQxGx+IYMMwAcOgVPC9dbhLJ8pOHgmdFUdytQEzmOYic2E
 ZxdgyJ0JdGJG4LvBLC465kkRKEh/WUt5rCKmXcobZwSxm1SFlSWRRHEOB4/fcciJoCQh
 tz5jYsgqrZt/t9LbjCR32MtM2Th/T7iCYe1ZJTDS3DVIG/iaGsut85qYKNvwqZV82SFv
 DOr3l+YqioQy9GH1/ZQl73jnz2bPCWO02N2EJ5f+eLs8MLmRwZBB0dbn4GL6UzeZfW8+
 g7r9S5WT4d8zJC8kaXoTeOsMor/dBdUF57WwsahcQn4rPDuw4brgKGp7T7Q+TDD4FfUO
 AgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688465810; x=1691057810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CPcHQE4tow2wDxnoKB8DgZ62T1VtFFyST4bs6MRIWiM=;
 b=iAG9GOtGM5/GUkB1wytfo5/f7qtNIW9bN+4fbY9EuRV3RHIEwE3zr9vQpLhYGzoazD
 TAV5+vY5HujnQ8Y42jJK0sKqIXyGVIVUySRbecX4L+tzSTALWwpPRkZFqsSeEufwWQWQ
 ZfLVgOpwKL8ePvVOBQqJq2qnApGReoJtGfmxoBayem8EP4+fCTvHiGVCqn7Nc3z5P5pa
 iuiJVve6PVXr4t7GLd1/E51V8tI2+xSEmFpi6xyDXaxCQaqxScfafkd87q6WIKlVlMN8
 fpfD9nZmNTDHNVEcv2QhqYLU+mH2PRRV7v+EQ2ZDKAw5fXphwdPqtF/ASVU09jcFGDI5
 yknA==
X-Gm-Message-State: ABy/qLaFtbhqq8hgxYUWIa0ZJPM2ImqGkxFHr2ruLYSKuY278d+zvLTr
 uK3uvEHH8oDFgPhMxc68GlLQ6S9hdtFJdBTVtCOoQQ==
X-Google-Smtp-Source: APBJJlGT0/bgQFPpOq5DQufAfSuIX73+woCBsvQDi04U8XXeRuw+y363lATdpnzz/ZDDjibAI+7XF07yOBOmeLnp4pQ=
X-Received: by 2002:a25:784:0:b0:c12:fb0e:52a0 with SMTP id
 126-20020a250784000000b00c12fb0e52a0mr10815094ybh.19.1688465809799; Tue, 04
 Jul 2023 03:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
 <CAHwB_N+F_PQaRb+BvLmJwUSsbeCCqF3rWcLYuY_9ktrFGK5_7Q@mail.gmail.com>
In-Reply-To: <CAHwB_N+F_PQaRb+BvLmJwUSsbeCCqF3rWcLYuY_9ktrFGK5_7Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Jul 2023 12:16:38 +0200
Message-ID: <CACRpkdYQb6MMQ7uxPF2UK4Z6UDQs2uHgpzXaeMm8BZm5i+hofQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Fix up the boe-tv101wum-nl6 panel driver
To: cong yang <yangcong5@huaqin.corp-partner.google.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 4, 2023 at 12:04=E2=80=AFPM cong yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
> On Mon, Jul 3, 2023 at 9:21=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:

> > I am surprised that contributors from manufacturers do not seem
> > to have datasheets for the display controllers embedded in the
> > panels of their products. Can you take a second look?
>
> Sorry, this panel datasheet is not open source, I can't share this datash=
eet.

Perhaps not, but you can use the knowledge in the datasheet to
name the commands and give better structure to the members of
the driver, if you know what commands mean then provide
#define statements to them so sequences become understandable.
See for example patch 4/4.

Yours,
Linus Walleij
