Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B86792103
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 10:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BC910E16C;
	Tue,  5 Sep 2023 08:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6583110E16C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 08:32:52 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-271c700efb2so1074118a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 01:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693902772; x=1694507572; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/q6jNtHSwHERulydP7Pe8HQtoEZ+Uz8MhsR1d8WvTBE=;
 b=FVVJCkueGtDPMBj6Ci1gBZve5uWq5+5l3HaMsg8KE7yreS/s5+sAzKW6eNE9p8EH8+
 XSPYC2tAfDdFsuXPQ+qiBhdISJIz84X17QAY5/Up6t5YxWZGOBiz+1kx2w2wVe5mUsv5
 krd0BWGEf0Ik+1P4SzelMK46KmdgIFiIlkyj7a/QvjDG+DraYNXMl+l/bwlNXGO/qtkm
 OjqfNtnB9/fNP9npjzlaf6qmzMXa87OOdaTKyAWIQwnd9tSt/+V7T3WT8uXiqeH262PV
 FXfqdxiQM0OfZKZz0UvkazZVv3FcjYzaPsV8J9pdNRzor5w00FUpw1ujAoOg8sLdMP6A
 ynfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693902772; x=1694507572;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/q6jNtHSwHERulydP7Pe8HQtoEZ+Uz8MhsR1d8WvTBE=;
 b=PB5RqZcgA7dsKcItiIpvGdXTN++QtF5G5XFfPiH9rYSdDLT9PymyfkpvnRqIJdHO3q
 BVbpLO+m66pZZdm4hHUUINEg2HCY2lGufcPniiLUrFXcZngdQkBziBfq2OkXYf35mroA
 kErDv/cr+cZwjZfIth7U82vt+Zq6unngA2t1P+J2cFEuPlD4hhoqrX9ueRxnXrCb1rYg
 FKoLniYiG1k0z+ydmX37srBF/tydNaMCNIH+BQ1apHK7JR4Dr4tsLpiPYH0PyAxT4oQV
 gGUuQpLKsLVEp9Zpw1Us+Lsav30gF1JKiYhvsXFfhg/ODhypxlrp/gDMLdmybzZ4WvxO
 iuLQ==
X-Gm-Message-State: AOJu0Yzt6NWwBEW0zVE8cg2VMuq0d97L16S2Pebd8KP1rnYlCTzxk16f
 cX9vJAUofQYjvKetTWSAIDrscGNNFpaDBq1saGqxhhn1klhBA6Ts
X-Google-Smtp-Source: AGHT+IH4h9i51nym+jesGSU5cRAI7CLzMCSnpmF7Tm2RMwaqhuxJS4ZYXdyV4+Zf/xer1JLzDJQR1ws+UfCoShomFXA=
X-Received: by 2002:a17:90a:e64a:b0:271:8195:8 with SMTP id
 ep10-20020a17090ae64a00b0027181950008mr8397207pjb.36.1693902771793; Tue, 05
 Sep 2023 01:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230607151127.1542024-1-pavacic.p@gmail.com>
 <CACRpkdbrEA54qmfTKSsFRG9ZS4u8hM6P5TXtOjRAiW+TD_v-fQ@mail.gmail.com>
 <CAO9szn00vRFm+iM1m7KgkW0WRuKyJEgVU4tVx4f5tF6KPnE=2w@mail.gmail.com>
 <CACRpkdaw8M3dSkmiV5QDOt3BBB7Jo6NxT0Og=zvA4REMA_7y9g@mail.gmail.com>
 <CAO9szn29A0qCABG0ACni42UGpsGKLwG7OT1y_ho3DgQ0WLvfmw@mail.gmail.com>
 <CACRpkdYXtQwmZR1u-1fwmyC_8Yq4bMkjDBcUCfuGqSz_UhXWJQ@mail.gmail.com>
 <CAO9szn0OuKW+-JZMs3TPUHiwLCe6cUPcsUq+og64K2utMyZpqQ@mail.gmail.com>
 <CACRpkdb5stXKb7FNk_FC-PKduCngRX3sZTbzcxN+kRskz78fuQ@mail.gmail.com>
 <CAO9szn3oTzrrwiyr91H14ep7OPUkA-SDST3CSQAQHvFFnkJWfA@mail.gmail.com>
 <0d43e653-32cd-b25e-40fa-6f0571048467@denx.de>
 <CAO9szn20RY3uBDceyUJ1S+gb=FN8Hd5qqMfOSbitHFyFCZ+iLg@mail.gmail.com>
 <8b0ae1d1-c769-1f55-0452-4bbc62da133b@denx.de>
 <CAO9szn1QdB5WGshuyCOGqb0qbBWHqoikeiMkk+bNGhAF5TX5ew@mail.gmail.com>
 <45488dcc-226e-1e7c-c681-c1d9be17bcbb@denx.de>
 <CAO9szn3scWfrP3mB8QnvPewZegV0=6iD8PE2bOS09HuN6gywmg@mail.gmail.com>
 <ff5270e7-573d-2700-881f-1358683f2618@denx.de>
In-Reply-To: <ff5270e7-573d-2700-881f-1358683f2618@denx.de>
From: Paulo <pavacic.p@gmail.com>
Date: Tue, 5 Sep 2023 10:32:39 +0200
Message-ID: <CAO9szn2Y8GubEpxMBp__1eHYhL9UqqfxzPWL0oOQPTs6TZ2oOQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
To: Marek Vasut <marex@denx.de>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, Jagan Teki <jagan@amarulasolutions.com>, sam@ravnborg.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> The latest 5.15.y is 5.15.120 , can you re-test on that version ?
>

unfortunately it seems that I won't be able to do testing with
5.15.120. I won't have
access to hardware any more.

> > [   20.255330] Hardware name: XXX i.MX8XX board:XXX (DT)
>
> Is this some NXP downstream kernel fork with thousands of extra patches?
> The version string 2.1.0 looks very much like NXP versioning scheme ...

Yes, this is NXP fork of the kernel.

>
> [...]

Best regards,
Paulo
