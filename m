Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E68AADD70
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 13:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FB910E193;
	Wed,  7 May 2025 11:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YB9ktX2U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD90710E181;
 Wed,  7 May 2025 11:34:36 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30f30200b51so69090161fa.3; 
 Wed, 07 May 2025 04:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746617675; x=1747222475; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jan/G1jQO8QSF9VgW6ZR8MQYcfJJl6I5cqB21kUF2ik=;
 b=YB9ktX2Uy67O22sxG+QP7XvH6DBNJMT8YTGx7+W1ifSgo5Rjm5PLPezomwjRBsobwM
 2F5sWI2vLS23lppwCkWv3SnEgwbTKf+J41I4zH5T39WLcPHrDoMEQfiETnDmMkv6pGgj
 Hfbc/t6Xtz07tDhVvyZcRAUeV/YdvjPDBtpgDaDsoI/z43TtueSv08UDJgT+2YPglfLN
 yGKaJ5srNV1LNgBXDuLJYaPfcgK/PN9Ku56jixGyLPEgTLUK1MQliz985hesoUrHTZW1
 6IXKwlByzlV3Z/4PCMWuIe1L424wR3piqQvQwnVA50H8tvmUeOglTgKdDkM6lJNqeqbk
 pZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746617675; x=1747222475;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jan/G1jQO8QSF9VgW6ZR8MQYcfJJl6I5cqB21kUF2ik=;
 b=VofVkXSr0dUphUHIHcVLeUcaodB+1oPR8rLp40TxPFIeEKvN/OJ2lm/DA1XfqdwKox
 AtN6KltfJSYmXWKCYk/dH1NORj2pQOA93AbDSdunUQROo3Hd6Vs4bJJO2+ejSqq6h9y3
 7IZPdrIWMPL4TmiO8xjMFdbhteiZoIRL98ZYvqNKvTjkP9JH4rZOgZx6/wGCF0OF2zKY
 KhKW3T/vBkiHORdYtchDi4bygCFeoHwN0J6KMqPg5l44CBl7mypZmbgIOHUw1CqaW3ep
 22PaXIWZ223EnUP4VZRZp9bWM/3Eoa1Jy64L+qKfIeUzDLRq28nKs/mKUavWfvv+2Wtq
 IGTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0dvYZFrSyRi1N6bzdm9LL6FMjMsWJ9N5GhOYIJkIRQH1WzdpkM9e46m2gAtahROLy/nheVMzpDw==@lists.freedesktop.org,
 AJvYcCWrJ995fYV0mvrsR8b2pIMQjTLXp8iHM7D27XoqnGdm5sEiOc8WUKvP9iJrV/OiftA1ZJ8v2Llibiw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1iRNZHjNQPhu6swz8Kal0oO6LQdUeEwyuTJ5xjnnc/b3E2Tn/
 eD0BSCQ1q7nlHMR2yUcw/6XWtNsdIzwjsEXPJg392FTpaYp6py04O1uLZ+tvn0czOIIpLbZRb/n
 0S2LQeOWqhYStRngons4r5ybtiSI=
X-Gm-Gg: ASbGncvGgdXQPjShC7FFEHCjnTJLP3eH7ztNljuW1KDUCIjcj8nTtQiAXP/3aOtCjzv
 QeTbl1ncjFfrqXwbht8U4DtjJAhsMVuhaqzouP1CXYowhvksKUuJ0FV+duRYJBYALxpbXMiu6Gm
 r043iv4kyUNNm3WjslAZp055dBKaECFO6npAm2IyjQsnR53ATuDKhVxQ==
X-Google-Smtp-Source: AGHT+IG7oYllQDERw2pyvJWmXVrE12zrrXKaUEIUOHTWAMUs72mMelYAuwrsPoTFhtZ/3Wy5Zk6JHEvDerw2HFlQK2c=
X-Received: by 2002:a05:651c:3136:b0:30b:b956:53c2 with SMTP id
 38308e7fff4ca-326ad1ba97amr10036641fa.11.1746617674951; Wed, 07 May 2025
 04:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
In-Reply-To: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 7 May 2025 08:34:23 -0300
X-Gm-Features: ATxdqUF6JkkRipTIVERvqlVRf3tIXAdsBzMHDW0_XZtQPGtanxPvgGhL3Es3bl0
Message-ID: <CAOMZO5CK11wByq3BL9XZgvfFv1_kp94CNFMYDaEJ=WxcEFATJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Fix flush sequence logic
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: linux-kernel@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

Hi Tomeu,

On Wed, May 7, 2025 at 8:22=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.net>=
 wrote:
>
> We should be comparing the last submitted sequence number with that of
> the address space we may be switching to.
>
> And we should be using the latter as the last submitted sequence number
> afterwards.
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Does this need a Fixes tag?
