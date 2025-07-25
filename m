Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812FBB125B2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 22:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6E110EA16;
	Fri, 25 Jul 2025 20:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cDa49N0l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B274510EA1F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 20:38:52 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-60c01f70092so3962283a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 13:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1753475930; x=1754080730;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s7Mj+7lyG9KXDTt3ibbkYCjc9m9DMRrjMQO9xMw3kZo=;
 b=cDa49N0lhdunlRhPB/rNTcVpVtnO9sdE6OALn8QPOIvKYE9wGGahfRktPf6K3WLrmO
 U+zrgzFE15ame34zMUvEWtjPDbcqMTI34iWiKEz4FqndIP0cIVcAJqNcwAd2R7rEjLgV
 moI2aA/AHrcsZoGL1w34dVCtKCLMs0BVuSbGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753475930; x=1754080730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s7Mj+7lyG9KXDTt3ibbkYCjc9m9DMRrjMQO9xMw3kZo=;
 b=gfxLB6WX6rYnjJ0TcDib6wZSrbifAG+b5NQy4S2O2VuPVhas7P5ehPZOzPGkLvLJe6
 jH7tG2hXRekGUjl0CcHrJxAtSVFOR32I9vlkn7wCufi+lZfR9ugdQAnVzw7V8bgCLfFR
 ug1IRPVn5VgS3Aov9O4oYXkThZhfJ1/rlJTpQWlIOWpnlEmVlWLm3HXLPW2TY4PRuro5
 BZspYpfs5GqVvCYxfo0JCTqrQzZ2ONUcF4NDIGTgKsr0iYjas/4gwtZyp1xaHAjLF16e
 E80/WMOD72sjILYnHxQRr2Ud6HDJCDvh+Ppxg7/s2GM9fsCprkTR7hWWl8s1uoysMJw6
 NtCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrw+YVAi5uiGQfqljcwyFvt8KTmXtHZ6VrapOa3uqRY9hr1kU8Tprh1C23AKdD31zbPcteMNPQN8w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTMmJv/rq7HwSFD982d+vYrpnTD+OD20jXLhCTeW0xQynkXgMy
 q6YUUL08pKTeMgJhse9InBuGrBQrwHKYOAg/JYZtssliybTMSg8DMi8CEowOsmvt9kxw99cl3+A
 m5Vbu6j4=
X-Gm-Gg: ASbGncuP06z3eaJsd9O7b9tdY0PxmT+c0wAt7Qv8JfXiyV2Z04gEtKJlIAJ3d2etK7n
 xWt/gwkEd/vPRDQFevhranb31fKGx3cb9s/T0Usxk4PrbRr5NgFtYsEs5vspCCbG/dFtejgHOj4
 0StGX4VyhfCCsZMYz32DzbcZ68GuQURD0o5CE/O3JtDsXt8Y8hjzVMFyb9HjS66GWxzfkfqTHhF
 l2hPm8kkuChaS4xKxClfqIG4XIEdz+SsJ1sFUnwF6PGMrqMWFJ6yXpjNxc+dR9HjOd243/hpVmY
 BS+njpW8eY1pGTwQ+WshL8zIWn+xefISTNLqBu19/hZ6vyeSTDLNiwqYAC2WtwQfPgu2m2q9Mo5
 Imlzq2ZaqCuhyzh7yGfSFpdvx5XQ5J+CQe7JCU8Y+ke6Ecwh5mzCaDr2tSpRqdSeTTK7XnyZw
X-Google-Smtp-Source: AGHT+IFzjHAmirBRMb+28HSF6U2ll5KaACGX+nY7OqygCZ/zfsxjOgv5xNZmKA/GTC/sF6CfioYtuA==
X-Received: by 2002:a05:6402:524f:b0:60f:becf:2b5b with SMTP id
 4fb4d7f45d1cf-614f1f2ba36mr3120781a12.26.1753475929690; 
 Fri, 25 Jul 2025 13:38:49 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61500ad0474sm271310a12.32.2025.07.25.13.38.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 13:38:47 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-607ec30df2bso4784397a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 13:38:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWj9CDgwTQyzYl7DgxzYipVbqF34ylSZuuRQMq5qtXWPIBs6eAZItl8BOtCs42y0oBPpAY/cEqbxhE=@lists.freedesktop.org
X-Received: by 2002:a05:6402:42cf:b0:60c:3c0e:52f8 with SMTP id
 4fb4d7f45d1cf-614f1f59100mr3273421a12.32.1753475927258; Fri, 25 Jul 2025
 13:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tx6TmT-qQO+MDV5GXCbUbTASh2Ly=eLMJb5+rB6MyJWVA@mail.gmail.com>
In-Reply-To: <CAPM=9tx6TmT-qQO+MDV5GXCbUbTASh2Ly=eLMJb5+rB6MyJWVA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 25 Jul 2025 13:38:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiMk9nCfOJeSKJFWNQ8ZE94ypw4NJOfLycNLR2z1tnt0A@mail.gmail.com>
X-Gm-Features: Ac12FXxWkw8_cmU1zPXR_ImGnykkZvBbZtTJSu5vdZlEAyy9LU5PqKFRhWuTNwU
Message-ID: <CAHk-=wiMk9nCfOJeSKJFWNQ8ZE94ypw4NJOfLycNLR2z1tnt0A@mail.gmail.com>
Subject: Re: [git pull] drm fixes (part two) for 6.16-rc8/final
To: Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Fri, 25 Jul 2025 at 13:32, Dave Airlie <airlied@gmail.com> wrote:
>
> Okay this time hopefully in plain text from the start

Apparently your weekend muscle memory theory was indeed correct.

                Linus
