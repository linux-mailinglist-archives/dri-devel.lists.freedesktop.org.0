Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B61AC30278
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 10:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A5910E599;
	Tue,  4 Nov 2025 09:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="KFKowNyO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D3C10E599
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 09:06:16 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-378d50e1cccso53911471fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 01:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762247174; x=1762851974; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ve6j/8aRh68YK2EiWRDoB5ZD0BlMxlKqu7uay938KFA=;
 b=KFKowNyO0aEXdNDRSp28ZWVDjICPxrJxQIroOKbjKhUU95TudJZC3TrxZ7qgNE+syS
 inN88dPwE3A0i8lba1Xr+YZNFgK1Jz1Y//otKcDbZwfSu6lx9RGiZfIRbtajMeX/F99H
 jLOjtg3nqrYXjNRRSvW9Jv7ggqZEwZCoYcwzFQVYGGTHT8nVYI50rs6scmLfFT/T+x/i
 E7CfohB2tLY1hxWTtweyeAmJS7qjSx2rZQpMEM1BG24XPudZvkW8s/JxSWoE8gD92M0L
 XYIhKIr9d5oNKvEVYwx9dJ9HNWAOOiRXtrMNC+i1p9cqlTE+w6z4YIS0OVS/Ag4S4u/O
 7n5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762247174; x=1762851974;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ve6j/8aRh68YK2EiWRDoB5ZD0BlMxlKqu7uay938KFA=;
 b=HNYwHLdbbREhSBYUI6inoixM8KBv+sN8js5KYSYO/eKM7PhmZuLB2oPzCxdVthY8Jg
 J+yileHmG8IgeTHwDKaeZNj0KpEYRCzOQMHi4GEATVScA7E2NkyxNj6i50mQWwx3u4vP
 HkpruuxxtFcNVOtFidtYEuKWSt2ljMJWTq6sGodNx04ydAFOohq0JHiFKH5507XDqxeX
 aHNDol4drrxH59iHyJ6UMTsmvpWqyv+Tbisd3kCdZHIPBIt9bA3cZm3cKVOxqI6+PrVP
 +9X5bm4/Ei/Rqs/Vv+oSE7I3aZEK0EBJ+ekjfHQm2jdEQPXZj2g6hUfSBDGj1/j7l+fe
 M41A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYq2z8mlyrMuTKCFtV6+gXFW9dr9Uu2Uh/tYyKAZWGwquzgTlhRpevZXk3gpp199Z941Fc9w5J6r0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdIXhHkt4ubh1oJo0nunyE1CicQpgtNUCobQ+GB9XYL9B+Ga/Q
 aXipRxUchgJk9AYNqszHHZ4ouM5l2NcZa3lan8btoTdRZbyH/P2K3tNolbWKaIs9BJK0DBewsdD
 sDkwz8eA6wjc1sRAKjtEuCc59NRPKuENfvxFWeuyuyQ==
X-Gm-Gg: ASbGncul7j5tp/XM5lOy6plCbWwCq3lATEFKkLDQBeGePs16aWpnU5xWH3AdPBzQH6u
 v/O07E0dbxMx7thJRRBpeE+b+ptyfkqTYiAKZKAG8on7Dx9oFh9YYwAeeO4WcbK828JZYX2rDZb
 NT5inWg0Zlf2JqkSAH+XNyegCYBd9sg9F2V7BdgNikum237nz+pq9jSWt3W7bX41artS3//ANp8
 GoQfmOxyP/e5dQm2hNiQXAxSwEfSbnTAismGsWSynI6HvJyeU0fyAvLA7s2L3KeG7ljgbra4YlS
 8rhPRLRmLjSY25b5dA==
X-Google-Smtp-Source: AGHT+IGoHrnYG8pwuIHGlYyWwSS5cdb6Yc2Im4z8V243Aw9CaUJS7Bdv48REX9tserm65W5shJTVHeZLHIb6C1wIJVk=
X-Received: by 2002:a05:6512:1442:10b0:594:27fb:e7ff with SMTP id
 2adb3069b0e04-59427fbeab4mr2389190e87.51.1762247174389; Tue, 04 Nov 2025
 01:06:14 -0800 (PST)
MIME-Version: 1.0
References: <20251103164800.294729-1-marco.crivellari@suse.com>
 <20251103164800.294729-2-marco.crivellari@suse.com>
 <vzwd2i6wn75oxn5e34xwky74ezpjjosyhx5kvcvwvywhohzegq@xfhhlcdei6it>
In-Reply-To: <vzwd2i6wn75oxn5e34xwky74ezpjjosyhx5kvcvwvywhohzegq@xfhhlcdei6it>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 4 Nov 2025 10:06:02 +0100
X-Gm-Features: AWmQ_bm8IBsb5ejrK32XwjdslIRWl6oYAyZossJmkVQl98tzAWm4SvM3BJaQbUs
Message-ID: <CAAofZF7nfB881LL4qry+L2Z7TNsBx+TWgELv1aKEUpkV2H=pAg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/i915: replace use of system_unbound_wq with
 system_dfl_wq
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

On Tue, Nov 4, 2025 at 8:31=E2=80=AFAM Krzysztof Karas
<krzysztof.karas@intel.com> wrote:
>[...]
> "This patch continues the effort to refactor worqueue APIs,
> which has begun with the change introducing new workqueues:
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag").".
>
> Otherwise, the sentence "The above change to the Workqueue API
> has been introduced by" to me suggests that you are trying to
> re-introduce or fix something that already exists in the kernel.

Makes sense, thanks for the correction.
I also realize that if I were put that sentence after:

> This lack of consistency cannot be addressed without refactoring the API.

would have been better, anyhow (maybe it had already the correct meaning).

Thank you!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
