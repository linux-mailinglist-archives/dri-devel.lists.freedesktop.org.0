Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343093FCBDA
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 18:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AEF6E061;
	Tue, 31 Aug 2021 16:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE4D6E061
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 16:52:36 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id g135so11693666wme.5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 09:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f9giteliJAtEnVgz5jyMBJVJCFtkiv4aYEa6F9VgWIM=;
 b=IcqDYtCokPsFYNoeXUnJILa7Ee9A4Cg3TAHXhCdSEa7S2p/WLttIMFc5nbf+AB2Jwg
 WjFNKNSaFbp9H8+h1NJNMdNaEcN28EvHhvLHfuy2LTwYqukSqfReN1ogza1dcWtYVhj2
 9yyF9c69AWjZvDxSMnJlHCr++xPfUhf0DNmBmQ3Q22gfVaaPcXXhwAq6NHMqQWTlCip+
 uiC581S3EHWDfgbpyW9vx1r0e+7Cc69Oa0KpNU+FTawU64FhCWa5s8ibk2a5a+uXZwnF
 sqmlqIrMAanNEQQ5ELlvQMMuC/Hw4WcxFRQfjA2JAtCtSYcAFhwDKjgi81b5v8f4QFXQ
 H0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f9giteliJAtEnVgz5jyMBJVJCFtkiv4aYEa6F9VgWIM=;
 b=N44o3ZaytO3ScstTwesCtdULkgFzyuMw8Iqj1DjUjD4qokWDADVZeaVTYgZNR2NrIj
 x+mOrwDl/r9qLqO7F7Vr9pwO91Z1+yu3WwaGhiMF5QggPtiPEQnupa+yIKq+TyM8p2jg
 vnTpoeWhgURIfZ6mOd1zA5RJ0G+zgGJ9laKQGYOlYYNtML205Babv9rWjIWxI1YlKdZz
 RCBLzv+Et6YraVZgHLwiT4hTspAfTCTFEratYPhFjVwjklhb9fIrXlvm3fnoE7yEXKJp
 zPBU2LMvipqKthk9RBpfuYYgulGid17ajwk6iVD08PvNNtIXLTjzjX8uDplU8wyFOi6z
 fuqg==
X-Gm-Message-State: AOAM531tuNJhuhYpHvS0OEE0LeOdzhwZs8E6phmp9AVgGPZnw/wEXXww
 lpxvVD917h0KehL/gfPQ38h+m+3ml2E4HQ==
X-Google-Smtp-Source: ABdhPJwe2+aS5B8R/c7+WFZ9DMhcnbesD4e1kSKShnIL9q5iGMqlw8fGbEABsp7fiCPDMVAfFWV0cQ==
X-Received: by 2002:a05:600c:a05:: with SMTP id
 z5mr5399978wmp.73.1630428755077; 
 Tue, 31 Aug 2021 09:52:35 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net.
 [86.58.29.253])
 by smtp.gmail.com with ESMTPSA id c1sm2872693wml.33.2021.08.31.09.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 09:52:34 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: DE2.0 YV12 playback issues after ea067aee45a8
Date: Tue, 31 Aug 2021 18:52:33 +0200
Message-ID: <2072790.9m3SFDGqga@kista>
In-Reply-To: <CAGphcd=L8GazB_io8Guy-0TdPGAt-m+4H38jrwCzNmt4+=moNg@mail.gmail.com>
References: <CAGphcd=ZR-Gh0zq=y-L9mf9agLwJBiav34q6TqUV+Te_UWFBuA@mail.gmail.com>
 <CAGphcd=L8GazB_io8Guy-0TdPGAt-m+4H38jrwCzNmt4+=moNg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Dne petek, 27. avgust 2021 ob 15:16:03 CEST je Roman Stratiienko napisal(a):
> +CC: jernej.skrabec@gmail.com
>=20
> =D0=BF=D1=82, 27 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 16:12, Roman Str=
atiienko <r.stratiienko@gmail.com>:
> >
> > Hello Jernej,
> >
> > During local testing I faced an issue where YV12 buffers are displayed
> > all in blue.
> >
> > Issue can be fixed by reverting:
> > ea067aee45a8 ("drm/sun4i: de2/de3: Remove redundant CSC matrices")
> >
> > Could you have a look please?

I believe I found the issue. Can you try replacing this line:
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sun4i/
sun8i_csc.h#L20

with:
#define SUN8I_CSC_COEFF(base, i)	(base + 0x10 + 4 * (i))

Note that "i" is in parenthesis.

Best regards,
Jernej

> >
> > Best regards,
> > Roman Stratiienko
>=20


