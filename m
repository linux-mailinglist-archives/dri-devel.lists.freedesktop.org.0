Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908DF8C7F6D
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 03:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D69B10E032;
	Fri, 17 May 2024 01:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ALOV/S+z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B7910E032
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 01:11:52 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-571be483ccaso4200584a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 18:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715908310; x=1716513110; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sqXHpXWVZMfeuxz9jN+I/a4Ndjk7LCEIsy9XqvkxtNU=;
 b=ALOV/S+z9koOdWnUN56fTxy/oDQXlpmXArZldtEv0DmKddPt8LvJdYmXZXW8+N5thq
 BD5aXOXZvdUKzzQP9IGvTcw6h0vcCJcE5Kgu7wfnSkUEJgGoVqsf8UsKXStiCSYT0Mgd
 tKELkFP7MeFAmVa/aSjNKtUbkNol9I93NLPns2r2e2cEaG0if1HY3ade9/3TpJcGW5OC
 pCh6wa1J8NCWQGuNIsWlTyfdAScqt4nd0t+aR5vxfLH7yKgNvNSG1qyOwIqNmLrjzF1g
 Vi6PSyeCSBe0BMtKmKovF5gxkpN/tdhAca7WgJEDHkO6GGO8GKT99dG4o+FLJUC4TLrP
 WQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715908310; x=1716513110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sqXHpXWVZMfeuxz9jN+I/a4Ndjk7LCEIsy9XqvkxtNU=;
 b=n7WC3TbdeBlhIt5/lbD0WqQc9+1mCpi95Z9SOjNoNqiG8hoOop0vEdDTraZquNRHpP
 dCtwcyFzbVl7U3gyg4AE+MEzY80QgilALuVUDiAjwa9wnk6U4Z+3yXRX4e2ZhTuQRkcP
 aK4uitKDFjM2tkccEn50i8VNPXp2HRLJp6GVJZDHeIMO2vbTk89FCri72p+us7cxFYfa
 mB3iZRuPc4Ri12NMUV6JTyqiZltEpUsqbzb0QPIR1pb+4c40HxsaW6tUZqJpOf8ZFXLf
 KvQpARBQ4jrqwmDkPhd4Zeq39pKEbrI0/evgiRurd+O7kXLscCb1LKdntWhB8z4Xiiq8
 wK6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcwscIjOR9v2QZRlce4mN3Zeyp4g9mdICMtxCOiTbLc9pTuZpX4p2Un4tKUA7r3vbjrC3DHmWvPlrIDw3Qjx8ukE2in/B3ygRw0ywdTH/G
X-Gm-Message-State: AOJu0Yw6in0moMzxpfzb8KIqDQ4n5mfKKOiSW+fK5DtQkG8euBKw281N
 7ClGVZnTRTgTbE+x0q0m8vyo0siuA5MmCHdDDtqj4yH/791tfvIp1qgYU5zx0RvpQ/2UVJNYz+6
 RKbK3auJT66e9SfJePFA4tMPYs8U=
X-Google-Smtp-Source: AGHT+IH3pRavpjxnMiHGfpl0+fkmb59W8F5SO1fvaqYvG91/Rahwz7kjolAJqzEUE13FlXx68iduxXaYF7+zz9M6S3M=
X-Received: by 2002:a17:906:3618:b0:a59:9c14:a774 with SMTP id
 a640c23a62f3a-a5a2d680d90mr1358871966b.74.1715908310270; Thu, 16 May 2024
 18:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240229105112.250077-3-matthew.auld@intel.com>
 <06841e76-0a6d-4cbb-a903-1f2e5dfbaf46@app.fastmail.com>
In-Reply-To: <06841e76-0a6d-4cbb-a903-1f2e5dfbaf46@app.fastmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 17 May 2024 11:11:39 +1000
Message-ID: <CAPM=9tyNrCsT27bvAVUcee-UME7568hZvU18m0k3OSopzUGaCA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/buddy: stop using PAGE_SIZE
To: Arnd Bergmann <arnd@arndb.de>
Cc: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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

On Thu, 29 Feb 2024 at 23:48, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Feb 29, 2024, at 11:51, Matthew Auld wrote:
> > The drm_buddy minimum page-size requirements should be distinct from th=
e
> > CPU PAGE_SIZE. Only restriction is that the minimum page-size is at
> > least 4K.
> >
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Has this landed anywhere yet?

I'm been testing 6.9 on 64K pages and the buddy tests are exploding so
I wanted to pull this in.

Dave.
