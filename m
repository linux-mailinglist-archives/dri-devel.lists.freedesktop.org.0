Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC1B799CF1
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 09:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A89910E050;
	Sun, 10 Sep 2023 07:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E7E10E035
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 07:44:19 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3ab244ef065so2578501b6e.0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 00:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694331859; x=1694936659; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c50+csNixrAL652I8a2nGfpKGvkeir3Xklb+hUPR40Y=;
 b=oQs8kCmH90QSltTRpLsxuvveHfFYnnIiqRC1J8ts1tB6XNgn7gEI26wvxEXchTCiff
 Mg9WVhiLrTZ3arcrbGvHw2BsMFNM/v+NAZFyMzjqguSk6qbeilWMpq6O4nGhmIAYuHsb
 V89yX+D9ezMqLzPAnUHbt4totK0hk6krHMiT4URNB5azxmVfJE6fSZFfvjQbVX4qQQ7O
 wqGDLzbO83+8mL95J0wE7AGumq1/TL3F4wRefBr+edskVZvySTtQMXO+xfZsCsJkEJoQ
 GqtuLowLLKLA6zaGh5syx81mh70ySRbr/KxPFNrApN8rQyAeQGixS7l4dJMFQqNFmOQU
 LkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694331859; x=1694936659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c50+csNixrAL652I8a2nGfpKGvkeir3Xklb+hUPR40Y=;
 b=Cxm1oHpPPavxTqsdqJ+bE0xdb1o58MslLH3Wey77/mhibyDNWuS0/vaams4y+7izzd
 3A/FyeuP1SvdeV7cEKrCTrvaos70EXmEImIyZFN32m6VWxPwU3DEIc80N83CmUEZdToD
 Hh5TT06zTdH0+YBhAYhG+FLZwInL1BhtjCrnWUN7e/cRzTvh16zup8FnfOLYaHAMBowL
 x4Jlkl/NOqPpWCdiSo/+EkFIHHWhaUVdwgcW7H8fEz0RhXBmOQyvurjumS7ErKk1rqjg
 5hsm3XQFeYNQllxBt/PesoMFEMS9fdgZ6YoP34lqpBuCnNVESxzJGDgvbkCL6QpI7VlK
 izvw==
X-Gm-Message-State: AOJu0YytJvuaZY2j++E7d63FAyyLsDckXBX5T/KaC1DM8oZBkyCF2KB7
 8a4J5Zd0I39CVY0CYvLzb1BGtUJcxherpEpnFT8=
X-Google-Smtp-Source: AGHT+IF85GxCqI1nmf/BUSpIO+3OcIzI4r8N/ZOdJLekOlOO3w6LQAX+Or4XjtalLh5iVsJQpEJiqJ/55ic8kjF6NcY=
X-Received: by 2002:a05:6870:2155:b0:1c8:baa5:a50f with SMTP id
 g21-20020a056870215500b001c8baa5a50fmr8754232oae.27.1694331859157; Sun, 10
 Sep 2023 00:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694202430.git.pstanner@redhat.com>
 <93001a9f3f101be0f374080090f9c32df73ca773.1694202430.git.pstanner@redhat.com>
In-Reply-To: <93001a9f3f101be0f374080090f9c32df73ca773.1694202430.git.pstanner@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 10 Sep 2023 10:43:42 +0300
Message-ID: <CAHp75VdAXBk2GzNX+b2-t62biuOn9JHMupaVbBuVkDn5PRTg_A@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] string.h: add array-wrappers for (v)memdup_user()
To: Philipp Stanner <pstanner@redhat.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Siddh Raman Pant <code@siddh.me>, Kees Cook <keescook@chromium.org>,
 kexec@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-hardening@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 David Disseldorp <ddiss@suse.de>, Nick Alcock <nick.alcock@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 8, 2023 at 11:02=E2=80=AFPM Philipp Stanner <pstanner@redhat.co=
m> wrote:
>
> Currently, user array duplications are sometimes done without an
> overflow check. Sometimes the checks are done manually; sometimes the
> array size is calculated with array_size() and sometimes by calculating
> n * size directly in code.
>
> Introduce wrappers for arrays for memdup_user() and vmemdup_user() to
> provide a standardized and safe way for duplicating user arrays.
>
> This is both for new code as well as replacing usage of (v)memdup_user()
> in existing code that uses, e.g., n * size to calculate array sizes.

No objections,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
