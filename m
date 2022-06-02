Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 069AC53BCE2
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 18:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066731131D5;
	Thu,  2 Jun 2022 16:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7C81131D0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 16:53:24 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id q1so11088690ejz.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 09:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JZ8UPU6ugki+PkwkthIYbz7oUO9hdXo6b9SQ7nkdwtM=;
 b=L/0QynMd8+v88ZZU+c9xvsS2+4IBAk0qnvPWUUmgZAkop0TG4KZxd99dk7jRpG2xjP
 KUc2tplVKuDgLdfIaBZhtckFNJvUhIHInGndmo36fHngmE8m6jBeiLD0zmlU+8/OdXH8
 9Mhv3pV/nWVpkGYnhijstSeCiN20370swxDcIslOPlNz0qlzwWzr80kwtbP2UAzr+X5t
 bT2vvDe3PqbnmNaxHJbmazQRDsxxA4Yh8PekOBHYmvau5bphFYS+zjlSYH/aafxUQ8Vo
 hECS/upWIjnqQOS5ZSqLfaFOUr/hiOcHh2H6Rf5rblMMuM7gC2MEZPcSyYtpMgzVgJI9
 7g8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JZ8UPU6ugki+PkwkthIYbz7oUO9hdXo6b9SQ7nkdwtM=;
 b=5YFl423OOKoUJUacQlal2E9hqAV6uP9OY/zInPum++C/rDwXGovDMqs2H1Qa+hEv+h
 Ckoa2ja+JPeomhxKNErFD9Glgr6w6J089dQpxoXX7qmR1fOlBZyQHtGwGGx92AybEdN8
 1eMeA/OkUa6RlGttdwBMB3669iOCACkGOm9gCLKScI4Nob/TKmRoWKwlcFo+P3lmzDK6
 PwGwUQ0Wyt4lE2VZM4xudY3BlbSMGheZwUotnBm56BERWyG0D0B6LN3/8vl4nqd3UqHl
 OckATP7nbzp/Jl4CoNKaAWR+skYW+fNLaiIR3t3BfJ+JC43ic+WEYlA+KExb0f3538l0
 4BTQ==
X-Gm-Message-State: AOAM530VlfwramzkgdysW3TQ5rC7WoYIB0vQRr8rxbJ2w0mFtv5MLvDZ
 pE2MCsKSQZvl8ZV/1sMesq+xqg1Az1kOB7GTH7zYPA==
X-Google-Smtp-Source: ABdhPJye4s8o1On+/9V61ouTi9MALoHFgmdsjmdC8JHeouR+fU7woYtXknF+evLqmso/PBYsaCxmbQR4cCcPLIhgO8M=
X-Received: by 2002:a17:906:308f:b0:709:af33:9fa7 with SMTP id
 15-20020a170906308f00b00709af339fa7mr4961024ejv.369.1654188802902; Thu, 02
 Jun 2022 09:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220530102017.471865-1-jose.exposito89@gmail.com>
 <20220530102017.471865-2-jose.exposito89@gmail.com>
 <e26de140-afb7-7b1b-4826-6ac4f3a4fe02@redhat.com>
In-Reply-To: <e26de140-afb7-7b1b-4826-6ac4f3a4fe02@redhat.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Thu, 2 Jun 2022 09:53:10 -0700
Message-ID: <CAGS_qxpFO4ixW=08ZcdcD9J1kU=B3mwoBJkPW8AKu0sKs8aKfA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 2, 2022 at 9:27 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> > +CFLAGS_drm_format_helper_test.o += $(DISABLE_STRUCTLEAK_PLUGIN)
> >
>
> A comment on why this is needed would useful.

Ah, I think that should not be necessary anymore.
We added this to some tests to mitigate against compilers that didn't
optimize away stack-local structs used internally in KUNIT_EXPECT*.
Functions with ~30 or so EXPECTs could get flagged for excessively
large stack frames.

But in 5.18, I had some patches to reduce the naive stack usage from
[48..88] => [8..32] bytes per EXPECT.
I also have some RFC patches out to get it down to [0, 24] bytes.

So going forward, this should only be necessary if you have something
like 100s of EXPECTs in a single function (in which case you should
also consider splitting that function up).

Daniel
