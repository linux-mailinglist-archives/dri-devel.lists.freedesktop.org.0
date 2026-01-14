Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC621D1BCEC
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 01:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFA910E392;
	Wed, 14 Jan 2026 00:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S1HAXX/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5520A10E392
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 00:31:06 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so9476225e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768350665; x=1768955465; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qByM3glODBDyoV5gInqmAMAXUYme51REUv9iL/v9QrE=;
 b=S1HAXX/egq8xMpYlndIYpqkiqaJtkIi2bvSJOtLbx3VHhpYTW6HyON5BxUrOo39Vtk
 AE6PLA3WFGlzzVqQ9c1xprETZhkiPOA7GBh6beMpOmiMgpbNxoI5MtkufPDQMwRVBUWo
 2J/QSKBCPgq0r9d9RN/c3yZtwvpYeu+T5+djb5m2QF7X/GhHT96LygVWZMWKYqEja3sk
 sy2m4yioQVP1VTO5olhMW2Imd44U5jjlP3QbzlpGqrk5QKxZ5mL5Nz3mv/LYy4rAl8Y6
 R3kzusB9GhuaxxJJxVpylTCniJv03Yq0Alavh1s+2sN7HixJtVBXSpfIpeYGNJ+oBmZ8
 dwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768350665; x=1768955465;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qByM3glODBDyoV5gInqmAMAXUYme51REUv9iL/v9QrE=;
 b=k/z9+/K+rTw/uf+WRXR4G+4byenZNcAxRMAaNUr0LMlCFnp/TM+6cedFo30vMlBQJY
 r9w36myFGKtLDuVVF+m48n3pzpGpPF0taA9i1WcU3uW3quMhGcLZnU+gRXzF+7UbwGO9
 I9/G21zWiwObstE/k5wQtsoWad6pXN0uKtyZyYKSH2I8JH13gFdOgdJXVR2hYL00phKi
 f9ZdxuK1MP6PHg96wsNGHp/pNR0sFsjyFS4XiacBeYyrJXEcHFlDi31gdcYbqjjKItus
 WZpBTHNZ0ZjRi4sQLmzKEn0cextOgNqi7MNcswLDeKatRUnRF5YUNuMTQF5Yh67wT9gq
 hWEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDwd2h+Z+veleOyaTd5qyXzfjUzIWZaSUnW3XBqP4o6eiz0qGzrFwFLuSKeyqCZoo2+S3ngknOT38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtQfn+8fyLObj56Sa30N+bM5/8q54RVXuYkmohgxAk4+sJlfJk
 5XyEWt1+eAiEptm+AKkmiE4Dy8DsdtUW6y+ynpMIwP1pEEFlTEJwNTF6
X-Gm-Gg: AY/fxX4ify3TDFqT2wv6ey8oeZ7hdNHKx+IyZfRx5Ty0oqjJnW3MR7MjYJWYAi63NEZ
 uodlD/WuWsLpgsfouxg9T7t1jQ3hqjGvXv3lppTj2/IojLyjfnLtYL3kf0oYsKnF5InKNmEoXh0
 TnDF1TEDBK+pq3uft2WNdu6OYb1JCUHIGL+ytKf8zjsRm/NvSBLreAEGC+EiK6H2STSMi+ufQ/F
 Ybsp6GAt85s/bqJMB0o89pMwazO2nfaBcwQLrI5KglClGEa6Mxc9wfCIOdqMlMn6z4aYHR8XA9j
 Sw6FgvZOt9pXRHysmIDZv6Liy3Ta90Hvvbgag9zEG1PMMpglfNdggJ9gXT84h+E4W9Vj+V1PsP6
 bskIw9SHo/8eX+uOKWk1cAF7glZ5mnV61jWkLE++zl4OS9T/qr0DTSuvd4YxZOowS6xKn7kdYqt
 WbCoh8vYj9YdgNDPCBwYpxtdq+ksLFgA==
X-Received: by 2002:a05:600c:3e86:b0:479:1ac2:f9b8 with SMTP id
 5b1f17b1804b1-47ee481c269mr3337275e9.21.1768350664696; 
 Tue, 13 Jan 2026 16:31:04 -0800 (PST)
Received: from ubuntu ([154.161.34.160]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee0b4559asm11680165e9.0.2026.01.13.16.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 16:31:04 -0800 (PST)
Date: Tue, 13 Jan 2026 16:30:55 -0800
From: Gideon Adjei <gideonadjei.dev@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Abdun Nihaal <abdun.nihaal@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Jianglei Nie <niejianglei2021@163.com>,
 Matthew Wilcox <willy@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: fbtft: Change udelay() to fsleep()
Message-ID: <aWbjv/w2In6pBPa5@ubuntu>
References: <20260113221722.5157-1-gideonadjei.dev@gmail.com>
 <CAHp75Ved+zhACJ9CYLYnkzW6Z52fmZT0VY+0NWKYk6O38HCkdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHp75Ved+zhACJ9CYLYnkzW6Z52fmZT0VY+0NWKYk6O38HCkdg@mail.gmail.com>
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

On Wed, Jan 14, 2026 at 12:33:42AM +0200, Andy Shevchenko wrote:
>No need to send v4 because of this, just reply with the changelogs for
>v1->v2 and v2->v3.
>
Changelog:

v1->v2:
- Added explanation to why usleep_range() is safe in this context to
   commit message.

v2->v3:
- Switched from usleep_range() to fsleep().
- Corrected a minor grammar error in commit message.

No functional changes to the code itself.

>Also note, it's assumed that even for such a simple patch the time
>between versions is at least 24h.
Thank you for the reminder regarding the expected interval between
revions. I will ensure this observed going forward.

Signed-off-by: Gideon Adjei <gideonadjei.dev@gmail.com>
