Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACF617C001
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 15:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161C56ED2D;
	Fri,  6 Mar 2020 14:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE1B6ED2D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 14:13:22 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D5B9521744
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 14:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583504002;
 bh=8HMSv45RmcowcvUV+/JVwCs/5SkwykqDSsq0zxlngI4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gUxwmh/mSUTmR+AYaSw7q3SKssHZ5+bqTyvsroLHmiu/NR312VRXclpM0rpeR0Hn2
 +/vdHBCZeOlfXUd0aCDrJFGzilxNNsfMZwCOU3bj4qNiGHcsma87+rr9eSd6zan/OC
 CfOjKe2kHDA+HNcK4Fv2DcVz/wdmRrkZ/Q6m4ZMQ=
Received: by mail-qt1-f177.google.com with SMTP id v22so1759949qtp.10
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 06:13:21 -0800 (PST)
X-Gm-Message-State: ANhLgQ3fJTvproyIi1DvZUayXyXbkAiLXdT2HGKOy4UCd2oyPUkSo6HO
 PT+wpFun4H1QvsiQjfMHXDEyn+jbVqd7KLpKWg==
X-Google-Smtp-Source: ADFU+vtV93a6Fp58Tncd6cIdfe2+CpsQ5PI8x6hov3jHYzgAVFu8JmXylmr7k0+5bR+Gvm/UG+tSzfOnnksdk3kV1RI=
X-Received: by 2002:aed:3461:: with SMTP id w88mr3133057qtd.143.1583504000926; 
 Fri, 06 Mar 2020 06:13:20 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-2-drinkcat@chromium.org> <20200225171613.GA7063@bogus>
 <CANMq1KAVX4o5yC7c_88Wq_O=F+MaSN_V4uNcs1nzS3wBS6A5AA@mail.gmail.com>
 <1583462055.4947.6.camel@mtksdaap41>
In-Reply-To: <1583462055.4947.6.camel@mtksdaap41>
From: Rob Herring <robh@kernel.org>
Date: Fri, 6 Mar 2020 08:13:08 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLoUnxfrJh0WCs0jgro1KHAjWaYMsaKkKfAKA2KJ252_g@mail.gmail.com>
Message-ID: <CAL_JsqLoUnxfrJh0WCs0jgro1KHAjWaYMsaKkKfAKA2KJ252_g@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
To: Nick Fan <nick.fan@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Sj Huang <sj.huang@mediatek.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 5, 2020 at 8:34 PM Nick Fan <nick.fan@mediatek.com> wrote:
>
> Sorry for my late reply.
> I have checked internally.
> The MT8183_POWER_DOMAIN_MFG_2D is just a legacy name, not really 2D
> domain.
>
> If the naming too confusing, we can change this name to
> MT8183_POWER_DOMAIN_MFG_CORE2 for consistency.

Can you clarify what's in each domain? Are there actually 3 shader
cores (IIRC, that should be discoverable)?

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
