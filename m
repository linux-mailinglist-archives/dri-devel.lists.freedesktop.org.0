Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0609F3FB9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 02:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA4310E821;
	Tue, 17 Dec 2024 01:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ng/LOFFn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FDA10E816
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 01:08:32 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d0d32cd31aso5812809a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 17:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1734397711; x=1735002511;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=x5HbsH3y11AUtX77RP9ShUJxU46vkQ8YNLD+VoIrduA=;
 b=Ng/LOFFnpfNeS7KVGqme+5pWyFl9oejhEHSt0KUJLe29w3wWNqSP76CfU9k6+6vQPL
 pu1vtH2GLoX+2qTS0mujV/SzhXffygVC5cAbaU15o99tD7Gwt9sbo8dq4bLagNKnrEME
 H2TgBFZfONRnaAWZ6T1ts8idJCdxSfRACc4B8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734397711; x=1735002511;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x5HbsH3y11AUtX77RP9ShUJxU46vkQ8YNLD+VoIrduA=;
 b=E9d+GtcpAqmNw0IqnmAkj7LbjHIm7LLSfAGCvVh/qC+/q0ORNElD1zGZoY3eIaQ3Zz
 3xmhQOnWAPXpseoEZxgIx/OWubXICYzm0hJ2jEN6ywub3/ak7bc1ZZLel12ngTdtq/TQ
 TK2nh1jmidDdyn/o2KfW4zHHdMLcy+mp7NCHEQxz7J1H840Jj6BcM4G+jfQ5sRd2QWOD
 5UXbUUiOI99UOHsl6BUGNuM7SfYL792l9b8TvR/FYRSSj9vOMx+rtFBfqcnNBlJcOBpp
 NIjTNRpjt4YDBN3mYZfOaTBiB7yizcjCzcOxBlDgCmDTx6RE4Hmf9uS1fTDyM+73wJco
 BN8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpiWTs+ejd0mR/goQXxCJWKZNzXcB73o3Hdnqd7ffCejNT0UXq6/Ck0dj3fH1WIu+Cp22yvRc2k90=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx97FBCaKLbK2vXbKqchKCP9Uzx1tT5W0FLzn5Sd8ODYJJjkZ5f
 kiwmsHA/z1sSGM6WrNKDRWRR93nVIn4xHIqBR8jbbPR3QDKbfWdz5x6hfDjFswJDm75aL7EPVet
 inHg=
X-Gm-Gg: ASbGncsT94WeWgMF3fy9tOpPUnRkc2TfEsQy9pAoCvB6RNS9Wrpo8xxz7DGsu1vbwG5
 3nSfAUfTFun7e/4Brf7bIJwPX5u8pKeV0tIT+3ROF7YmjXG43Tdp/XtjdkTDZ3rzjzbtcDgzy36
 mNH4RQpierUEN7NMYALSg+dHEIjTnxsUwqkiZpVyXNEdnBfJxzQ3lDZolk9oHgdZqg8hmdowQuR
 RpuNaz2rwiFUHe8XM26DAaUXvIv99bH3uR0S4EUsDV2GZfVC3ESt+Ou/u97P3MWTsGt86i9A2+m
 vVgoE93UOxHD/LgNHZPYzfVj/gONO78=
X-Google-Smtp-Source: AGHT+IGLWpr3CBeeBiadp6EfkbhMCnkVlpEX1vlpaKxq9qjKaoYdxtg6TdNH0hAoc8IBFFwfftydIw==
X-Received: by 2002:a05:6402:528c:b0:5d0:c697:1f02 with SMTP id
 4fb4d7f45d1cf-5d63c3408e7mr38561710a12.17.1734397711276; 
 Mon, 16 Dec 2024 17:08:31 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652f25acesm3678524a12.62.2024.12.16.17.08.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 17:08:30 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-aa6b4cc7270so640809766b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 17:08:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWtq1Nv5gQuSuYxy1NMGDTRbNCOyOCtNdvL8cb+YqYmTjW3HeDJVzTJgc7GInswyOULCg1ZH/T36OU=@lists.freedesktop.org
X-Received: by 2002:a05:6402:27d4:b0:5d0:d91d:c197 with SMTP id
 4fb4d7f45d1cf-5d63c3db906mr36599487a12.27.1734397709817; Mon, 16 Dec 2024
 17:08:29 -0800 (PST)
MIME-Version: 1.0
References: <20241213054610.55843-1-laoar.shao@gmail.com>
 <20241213054610.55843-6-laoar.shao@gmail.com>
In-Reply-To: <20241213054610.55843-6-laoar.shao@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Dec 2024 17:08:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj=W-4Eu=g83QPUDB+thtL=uY=_1OAVRvXJP=zay+K4Qg@mail.gmail.com>
Message-ID: <CAHk-=wj=W-4Eu=g83QPUDB+thtL=uY=_1OAVRvXJP=zay+K4Qg@mail.gmail.com>
Subject: Re: [PATCH 5/7] security: Replace get_task_comm() with %pTN
To: Yafang Shao <laoar.shao@gmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
 linux-security-module@vger.kernel.org, x86@kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-wireless@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 ocfs2-devel@lists.linux.dev, Kees Cook <kees@kernel.org>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>
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

On Thu, 12 Dec 2024 at 21:47, Yafang Shao <laoar.shao@gmail.com> wrote:
>
> Since task->comm is guaranteed to be NUL-terminated, we can print it
> directly without the need to copy it into a separate buffer.

So i think we should do the "without copying into a separate buffer"
part of this series, but I do think we should just accept "%s" and
"task->comm".

IOW - getting rid of get_task_comm() is good.

But the "%pTN" pointer format ends up being unnecessary.

          Linus
