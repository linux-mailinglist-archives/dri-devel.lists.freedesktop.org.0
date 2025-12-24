Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC65ECDC99C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 15:56:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B180A10FA35;
	Wed, 24 Dec 2025 14:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="SAQGSEdL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B869310FA35
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 14:56:33 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-594285c6509so6532826e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766588192; x=1767192992; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ENsvsc72PoAv5kM3KnroKty5+1GcyGyZebpl8v99mg=;
 b=SAQGSEdLTEHwJqOS95rT0TdEE8SjadxtiIJJBq00H8KanNWXlMlOLKEfhHFO2yyGi1
 PtA4QI4BTLaNj3GgA/MPlZpzjCKnh+rTK+xS6YGexQKdedoL9sJs1aE0XNyn3XWAg6iG
 bbbekNr6ZONMhtUtXez6Rv/2xhGhTtrG81USVNqIn24jx2gU9uLVA2p88MLVUrOO3Zh1
 fgh7xlGiwvrtCB0zoTnk9PEHkQQZ0IektYXFhIJDlLzm5NaIJU6BUFsMlhZMqkzgzRDs
 qFM4RUUPzbnhLzrajRIga7AO3kTA+H+05Bk+hIiQ8j1b5yPU1GqmrhPf9L6FXaMH/wBp
 sCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766588192; x=1767192992;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6ENsvsc72PoAv5kM3KnroKty5+1GcyGyZebpl8v99mg=;
 b=AbltimHihTM7IEEyL8nC2h7vum0wPERyho0SSa6zzJxIGzwxjXngDQaVyoTBmNdHm7
 +OxxFPWPXGvhCun2D/LGYPtoZluM7k/CbHJ/y6DJv3DkOaUcaxDz0Y2x2B6cHjv29jnB
 65wFFLUJqhq5ATGvaB+XCOr2jsNEt7vy2wcIz8IMTQ9dOttxVtCkm0bu3zdKGvv+/WzJ
 NGjYTIglPaXh8Q/WZ/KJa5EsKV7Gmli/2P/9xtg+SGU//xVQgnPlrhE3CohQx9hj0i2c
 KZCDuIV2zcmj/2rH2M7Eawkjj+zfFV2dDR/tQfnEanDY75uttdBICCotnxlk8wcPGZby
 bqSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoPWHWouK5/Z2VaBbrzYw6wIqbKCMRzFSYUs2S50RRh6uda7ttkHTQHOUYpQh5M8RFfrnmZzQlIzI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNGs/rFUgwhwqrJI70zUaOkZCPRDa4jVnE59N3u/e3ptgn2UxP
 m+KAPt7v8eszu2RrKecez+JFlbo1/ITilEtEk8krmnhS1TdAqrZ65LmQ1E3yP4BfixHj9+RU7jX
 lluv6dcT9sKY1aOf72a5Og5AtCTtdom0x6mY6kbBrkw==
X-Gm-Gg: AY/fxX6JdpZrU6+9viXVU34oPplb5FY4bdyCoA4L0kDJ8nS5fjZkkG2ixcuS7G2oCqj
 PRxsyGMd2oUOBYicnhUrkB3Emz1uxldjSnOlN2HGs+uns6f49OtCg6WwV3YrtSCCjgTYLpF6zK1
 33HZ8ZI9lUNr/OOWCwX6jbSBZRKG3ui72dhkssu8DpMio0+c95AKv32ImsFdpCU1PlUh1qiIxtE
 FMlomxq9tN6dbWcCxvtK8/w6/5G67ZIMqldFxQV4cz6YVYLYpkcOUJTJjBeHnbBidsj53leFFYD
 oCQIhul9qdh096W7sbMjjlxLtW9uZ0FG8GQyIcc=
X-Google-Smtp-Source: AGHT+IEahoArjuG1AjZ/UTOePN2d4Kmyy0qbt5RsoKJF75K4HtrOZ5l6WA7Qk0zHHOMr8hpagGARJK8P9jOAZFpBplU=
X-Received: by 2002:a05:6512:3a8b:b0:598:ee5e:d8bf with SMTP id
 2adb3069b0e04-59a17d0930emr6252425e87.15.1766588192016; Wed, 24 Dec 2025
 06:56:32 -0800 (PST)
MIME-Version: 1.0
References: <20251104111339.128685-1-marco.crivellari@suse.com>
In-Reply-To: <20251104111339.128685-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 24 Dec 2025 15:56:19 +0100
X-Gm-Features: AQt7F2qAJRifXjKRped62h0Bd5QzNnX87BgarjMY97Slg3_Bc1IQUQ_j1iNG3wU
Message-ID: <CAAofZF6vL8V4cjP2d3wPVj2HdNhk2rz7B268qZp6oU9mDp_qkw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: replace use of system_wq with system_percpu_wq
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

On Tue, Nov 4, 2025 at 12:13=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
>  drivers/gpu/drm/bridge/ti-tfp410.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
