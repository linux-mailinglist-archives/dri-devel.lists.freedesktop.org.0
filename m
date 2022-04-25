Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E944650E3A2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 16:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C2010E503;
	Mon, 25 Apr 2022 14:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C589410E503
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 14:48:48 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id j2so27541063ybu.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 07:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sr6b7C5afJDDAqoesKdOXVbx/5xPPqhbOStz2BfAAM8=;
 b=74V1JyaQOyVdE8/paEDiToqLZYghvipFratYXEC+AESSwVYoa3TsoKuI32rsI9cU6J
 7+/LxH73LeT6w1JTcAPZHMlrgBxBWl+e+UXua7svahYj0K4E4WxyAoZS855LzYE7gB0q
 RnVHaTAvY1C/CJgLyneeFnNGqJs/Rg4UkDHMIajj6fNFqzsH4bM+AIWV9e3AO5KWrL6C
 o+UUOAOQSBdzcBsP8zkYeEgfDBrJOsEOradTrVYtufsqFj2/h/kJNPZSQSR4Jt6Wj9oI
 52STxYoJuRvVi9TxEWWSOfrmebfqHu3E3d2rdOl3Fe/nspJd/ijy9dF4pUTVgM8WYyj5
 MUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sr6b7C5afJDDAqoesKdOXVbx/5xPPqhbOStz2BfAAM8=;
 b=o98lIlUBIGQN4dnTSDZB/IfEhX9j+NyV+m/TLMfxyJyUelcfah3Zn5Pot4WAyCzUkn
 E08xora8qLRnCTQLUY6HejSNRL9HoqvrMFZsivXAYGNgymmAO3d5yYVSwd/WHPVUaN/q
 usEumAtHj1FXfif6im1Iy+ZHtSHwQi/l1DDui9thUrUWc3Gi4SOTEXThNc3xuqwbNGkH
 6rRiw/e6io8XXzLWvUxDhHgp/QI/AD5/wY7u6MRUFFHgNHAvmtVId8rlmyDXLPQ7IVnf
 nRCkqmvQDcMHmCEqe3T6rtkdNTF0RbDQu0QSOqk+ddi5qTbnkqhYjstm0QpPUbiZEJYq
 wxVw==
X-Gm-Message-State: AOAM530/48HBnu/fMP6M8CiaYfNomi7RSYZAwwZ/lQF7PN4DMoN9iw6y
 Kxz55qgwklz17ilj2GnhuJJt87XtATNptxMUaLBarN2TpCg=
X-Google-Smtp-Source: ABdhPJxEJzKWpI1kpuZz9yZC1dNt7gUFPbj7o4EtpTcTkIM+fwPafDb8pnoI782CwIAAuuDCwtpjyZSL/irjFHdrk6Y=
X-Received: by 2002:a25:ad0e:0:b0:648:48f7:a03 with SMTP id
 y14-20020a25ad0e000000b0064848f70a03mr7074330ybi.111.1650898127908; Mon, 25
 Apr 2022 07:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
In-Reply-To: <20220422072841.2206452-1-s.hauer@pengutronix.de>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 25 Apr 2022 15:48:36 +0100
Message-ID: <CAPj87rOqW8m-NybVYxdMP9TiTr4fhsBpN62j07KN9wG9mZGDxg@mail.gmail.com>
Subject: Re: [PATCH v11 00/24] drm/rockchip: RK356x VOP2 support
To: Sascha Hauer <s.hauer@pengutronix.de>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Apr 2022 at 08:30, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> It's v11 time. There's only one small change to v10. Discussion seems to
> have settled now. Is there anything left that prevents the series from
> being merged? I'd really like to have it in during the next merge
> window.

I don't believe there's anything left, no; the core driver itself remains:
Acked-by: Daniel Stone <daniels@collabora.com>

At this point there's no reason to not push it into the tree, and any
remaining bugs can be shaken out and fixed there.

Cheers,
Daniel
