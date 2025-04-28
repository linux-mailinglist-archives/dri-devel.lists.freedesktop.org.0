Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAEDA9FAB2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EFF10EA18;
	Mon, 28 Apr 2025 20:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OCzPdG/z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D4310EA18
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 20:40:39 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-22da3b26532so46387435ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 13:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1745872838; x=1746477638;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oeoT+z9Ix7KNe6MZWCzuaIP+N6t2Dwvzh7IKztB6k4g=;
 b=OCzPdG/zbhB9EkB7zLL35O6GwN7/81WT2OCLM6Hxbm3TzsMopGAXPgBKsUjsmsaiVo
 Y6f3aAvC79M3/QlhvcgCT6fK48kNlIh64RBWBhWJ2ind4O88w8xJqEJ5ypBIZLhiszDh
 PTi5mrV5vhaQKt+y9v9EWrLgUrBkRK5C4cDxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745872838; x=1746477638;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oeoT+z9Ix7KNe6MZWCzuaIP+N6t2Dwvzh7IKztB6k4g=;
 b=NHFMsaQPiDbKXS9CLcaePl5fQZZVAW55xHLO+8AnL8JVEjQ72NNssiOiWE7s7ZSV4l
 Qd3UhzrNJ9G1rolf1Gxlvl172vt3Ybl/VXjx508Bd9k/zeALivtDLaUuOuo79t/SR8DP
 +IZC1l/lmw6mGsdQNA1BAhvT9M5Pcy5KANALiKmGLcBEcivtMWvBfO9+ryTOmORmycjP
 4DY4yKX+346+5o8kyPX+1ZnF6UhgJofGUX7izTJHSdoyYIYaxGWAOLpB6v4g3yy0qz9G
 S8dsTOBMBpCcju7D2T3sw5JhmwvbfyD+3I46Rmt9TyK6ELsfftRC+NSFy7wleEFbRX57
 6UDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWlJlHiOZ0NVQABZRjOOE8Gq/NATAQYNwFuneOsuTZIfYvX9cjlM1gzkgSaDK0ukMhZfXh0DyayDo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHMAiOe08uNsvDQblz6LUcCQWUYGLeKasawfwGL1zE45Ct8j8u
 YhURMbIDXZsOwEhKRSD2Hjnz+FJjt1nUiMm/G6F1IH6vGlxQ7ZJgHy6z4TTQ3kYxBA9i9aMTzzU
 =
X-Gm-Gg: ASbGncsLDTE2fzuahGqCLAP+bwWF/FsTz86mDLk/d0DtZ1hF9xQzQmVn14WntW+ox2i
 oj+gpGmryRMPnliSLOVcs3LFHij10/Ol9lIEF3/pDdqtpWXQeQAgsOjs0UNsTt1BXaKKrGixcnf
 oM35e/zcvgNH2eJYx5+52PQfgwJ6XGgx46lMRfwobAJP64jn5bael6sx6JMGp6YC7r3dGz8J1zl
 MU8zQpw0o7AvBvIX4paBSaMdzG+nXqBGXBMFAis44Bw6T6FHORG6rwu8VGeOB2dfjwL0C8nxY6y
 4J2yAjLd6hoXU5vl3hHuejMsJ4kX1iumVkXuR4bfsQCqP//AVVz9fVnXM3Iap6RyL4KZmS+45II
 o94ns
X-Google-Smtp-Source: AGHT+IGEuID+HZrF3JGRmP5LrtrSJALzOLvTZhWtE8J9U0DRfCQ0YnY9duSmgtSG4iZUTbvnICTR2Q==
X-Received: by 2002:a17:902:f60e:b0:223:fb3a:8647 with SMTP id
 d9443c01a7336-22de706f40dmr5779415ad.41.1745872838603; 
 Mon, 28 Apr 2025 13:40:38 -0700 (PDT)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com.
 [209.85.216.42]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db510304csm87635405ad.204.2025.04.28.13.40.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 13:40:37 -0700 (PDT)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-3015001f862so4481841a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 13:40:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWTE7g1CoplIP7VjQOIUViOTTTKidPh4hH8ztfMjWcWr1dKhaXc9xipXAKmdMlopaVFXsy1K78AxYo=@lists.freedesktop.org
X-Received: by 2002:a17:90a:e7cb:b0:2fe:861b:1ae3 with SMTP id
 98e67ed59e1d1-30a23dd605fmr290208a91.8.1745872836894; Mon, 28 Apr 2025
 13:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
In-Reply-To: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:40:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
X-Gm-Features: ATxdqUHkn2To6s-FCGeuNkrJ5YMdp_B_e090JmhY2DphP9BmoEpxztHghXs9YcE
Message-ID: <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
To: Nick Bowler <nbowler@draconx.ca>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 regressions@lists.linux.dev
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

Hi,

On Sun, Apr 20, 2025 at 9:26=E2=80=AFPM Nick Bowler <nbowler@draconx.ca> wr=
ote:
>
> Hi,
>
> I recently noticed that on current kernels I lose video output from
> my Blackbird's AST2500 BMC after a reboot, which makes it difficult to
> boot the system again (the video output will come on only after Linux
> is booted again).
>
> With Linux 6.6 and earlier, there is no problem rebooting, everything
> is fine.
>
> I bisected to this commit:
>
>   ce3d99c8349584bc0fbe1e21918a3ea1155343aa is the first bad commit
>   commit ce3d99c8349584bc0fbe1e21918a3ea1155343aa
>   Author: Douglas Anderson <dianders@chromium.org>
>   Date:   Fri Sep 1 16:39:53 2023 -0700
>
>       drm: Call drm_atomic_helper_shutdown() at shutdown time for misc dr=
ivers
>
> This commit does not revert cleanly on 6.14, but I can easily undo
> the changes this commit made to the ast driver, and this is enough
> to restore working behaviour.
>
> Let me know if you need any more info!

Bleh. That's not good. If I had to guess there's some subtle bug /
missing timing constraint that's being triggered here. A few things to
try:

1. Add a several second delay after the call to
"drm_atomic_helper_shutdown()", like msleep(5000) or something like
that. That's kind of a shot in the dark, but it's fairly common for
panels to get upset if you turn them off and then turn them on again
too quickly. This would be my blind guess of what is happening.

2. Could you give more details about what panel you're using? Ideally
it'd be great if you could say which device tree you're using too.

3. Any chance you can gather the `dmesg` from a failing boot and
provide it somehow? Are there any errors in the logs from the failing
boot?

-Doug
