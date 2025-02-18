Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E006CA3908F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 02:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4211610E5FC;
	Tue, 18 Feb 2025 01:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GwEi7gHe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D7610E34E;
 Tue, 18 Feb 2025 01:46:39 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-abb7aecd39fso423320666b.0; 
 Mon, 17 Feb 2025 17:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739843198; x=1740447998; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CCf72YGlIJXBtU156+rJph9kgwvJXx8dygCkaGYLy+w=;
 b=GwEi7gHeY0+B7RIH/kcHdIAmWYIY1yiXNJjpfnAP6Q2SZlpB1f3KPZiODsLckU5w65
 3oBKG47/vqmhcWU3DJs29zhz4GthYvxvBxB0gtHKSFwcUvxp4B5fOej87eCfeiRz8A6J
 x51ezCXwBMwYGx1c604n8B7zpvGdLgjod6UH86peQExKtQb9miC9LPMvOEn3S4/RnqcM
 rgetywRgiPzE6vcREe4OeyWQrZkd0fCPS6kt5wY+7CkAHCHZ2+rKuElxPnqhsIvYr8pO
 T38k7ZjuypvgkhlWkTN1e/uZ6RyhaZCm0bjsoe93hggyL+sZPhbRq1i7tgKPUim+K1Mv
 1tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739843198; x=1740447998;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CCf72YGlIJXBtU156+rJph9kgwvJXx8dygCkaGYLy+w=;
 b=QOs4T8MhjE2xRrwldijCs7G0FyhF3v37ZsRiUcupOP2X7VG0T4K2n56YGH3ngaDqtO
 l6BpHgpFi+HuvRFosnX8JWVMRtTuYh5dFJpbYAvBY4PSli0CnK/Ts8VqVSH7eMU08nAs
 ZNGFcxqlS5yyKQW17wWoeN8+IKwIGfP8J2Ow99rY4fvQJ0lwFEGoS9c+qVH+EilyDFua
 VirBp6H4svzCnWiGn52+GwsHJcFWsiTAxFTe/AeRCFkK9LDttg/q/6B75fCpJzp/y9jE
 EtXPvQHiMCukccldMaaIKWKKnAw2JvSIAx1HvLOHxSbzMYtz44oUf4S2MP6oY20jyj1E
 WQmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDvpNCpBRvQCxpQqD0cVJ5AMuu0iv5aKqUDJ7x/Lju6MjEhLWPHQ+6jfmQ5VUEJVSlW0PW4pv20f4=@lists.freedesktop.org,
 AJvYcCXxSRSKVFUu9zsVfDqWlHQ97ELtOu8ltCwHeV209ThV0JnYUrqrO8YF+V/gatcUIIiKkeXixI+OBw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSaCeoLXUeW1TY87YTjMK/rJbA9Xn031oQE3jiuOJ3yJNwdFqV
 9a7ppG0kFOOyDH2qqCcSY2bgd8av5GX9UxtigU2/9W2Wd5fY390R5WmeIs57GEF7LEWJ6D9o/3M
 M4zweyS4pDt8jAdhxtUlIToyhDH7kBXhf
X-Gm-Gg: ASbGncvKqCsw/ZKQlZ2VaB7GiUcx1HjiV4MH/IQGMO7wEa78rNYgS23eQELWzuTarEE
 gWBnpUV6qlJzrTBQrShakQawLMbHSRKJyEHCwJsYVH4RrGYWqHUGSVNLQNqTEHNfc9X58ttg=
X-Google-Smtp-Source: AGHT+IH7918UaP+tJr4P+w7Ncj31TNcQzIB1RN+BxYusaqdvDFLog+0kyShinpcWariciJXGkbjL2IuVNQoZvxsk3LE=
X-Received: by 2002:a17:907:8326:b0:abb:b24d:c63e with SMTP id
 a640c23a62f3a-abbb24dc7e8mr154657166b.16.1739843198130; Mon, 17 Feb 2025
 17:46:38 -0800 (PST)
MIME-Version: 1.0
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
In-Reply-To: <Z7OrKX3zzjrzZdyz@pollux>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 18 Feb 2025 11:46:26 +1000
X-Gm-Features: AWEUYZmF3nJ_6vA2tiOA_SUXKMv6w2unWAGmiFQTMmVBeIGS2-M0LRIEPh2iL2g
Message-ID: <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

> 1. How to avoid unnecessary calls to try_access().
>
> This is why I made Boot0.read() take a &RevocableGuard<'_, Bar0> as argument. I
> think we can just call try_access() once and then propage the guard through the
> callchain, where necessary.

Nope, you can't do that, RevocableGuard holds a lock and things
explode badly in lockdep if you do.

[ 39.960247] =============================
[ 39.960265] [ BUG: Invalid wait context ]
[ 39.960282] 6.12.0-rc2+ #151 Not tainted
[ 39.960298] -----------------------------
[ 39.960316] modprobe/2006 is trying to lock:
[ 39.960335] ffffa08dd7783a68
(drivers/gpu/nova-core/gsp/sharedq.rs:259){....}-{3:3}, at:
_RNvMs0_NtNtCs6v51TV2h8sK_6nova_c3gsp7sharedqNtB5_26GSPSharedQueuesr535_113_018rpc_push+0x34/0x4c0
[nova_core]
[ 39.960413] other info that might help us debug this:
[ 39.960434] context-{4:4}
[ 39.960447] 2 locks held by modprobe/2006:
[ 39.960465] #0: ffffa08dc27581b0 (&dev->mutex){....}-{3:3}, at:
__driver_attach+0x111/0x260
[ 39.960505] #1: ffffffffad55ac10 (rcu_read_lock){....}-{1:2}, at:
rust_helper_rcu_read_lock+0x11/0x80
[ 39.960545] stack backtrace:
[ 39.960559] CPU: 8 UID: 0 PID: 2006 Comm: modprobe Not tainted 6.12.0-rc2+ #151
[ 39.960586] Hardware name: System manufacturer System Product
Name/PRIME X370-PRO, BIOS 6231 08/31/2024
[ 39.960618] Call Trace:
[ 39.960632] <TASK>

was one time I didn't drop a revocable before proceeding to do other things,

Dave.
