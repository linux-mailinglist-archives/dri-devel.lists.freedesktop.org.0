Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5AF97C59E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 10:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D13D10E69C;
	Thu, 19 Sep 2024 08:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GProNTRw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6910B10E69C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 08:12:59 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5c251ba0d1cso752929a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 01:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1726733577; x=1727338377;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KjKbo64eBMjHdfY2ACi/vcyd2Cv3t2sINOQkVbosqlo=;
 b=GProNTRwOhM7SW9uozLCGEZflMjotozAa0yQBSBM6WffffZYcInM+DFG3A7kFsAJxI
 O+Tt01oCvt/PhtFtbRXhgjMQ4XiVfHKeT7HHNxMR3zgbvSAgiMC6NRuHY6oSxb+rBVb9
 MBXl64lvarsMX3VgizK1O+JzwYwJLUZx2jNG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726733577; x=1727338377;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KjKbo64eBMjHdfY2ACi/vcyd2Cv3t2sINOQkVbosqlo=;
 b=Mlu7vu74qe9uYMfr4+Z/MOK70TnT1R4QmL1fPtXZE3L2N+GaFfd/dZTVJqeJTGaDWc
 1YSv3/lZfkQh2OGPCSWy1WH8p5spatYYZ7iMSXHY33ECk3TAdhcgm2+UG04eiwYKkMxL
 1wddtDzt7qZIJXkVH4Ybrboss03fX5+ApnawYF5RfgsHz1sodNUalB/urysW26FnLkCH
 77on1QYy/olAjPhQQs8qOh4JN39FU/zWBW3cIs8zfbGe6eJJeqHzMBZXAckYnRjPUX16
 V0dWx4+r4yYrdJJKd2Yxewtx7mxr5L+TsgAUzUBvUvF0K+ChVzw80seb2w5UzC+cjRLk
 f2dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj18Sk6t/91oToFp3uAJzcjlZPT3COWTGJAilTqujNNZTXWKo293k/cfQFSMzaX/U7MKtlaaprS9k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywpq/ErmP3UxwM2/qty8+hS9WfvK89u8LG+dK2SdKkVCIKkiw1J
 +Slakt1ZflkBjElnCsQFFanB4I50KWaaM/E8IkEKaUWtQBYLQWzqhQkgYkQ2lAYQMCItimWpg7l
 R3ckuGw==
X-Google-Smtp-Source: AGHT+IHz5TfGd0ly4COf+6Nddv1XEBpmJER11pVyqY3E3lZQ+x3u7NwkGw44+G6z94FL1Im187DYvg==
X-Received: by 2002:a17:907:f14c:b0:a86:a73e:7ec9 with SMTP id
 a640c23a62f3a-a9029702041mr2542113666b.46.1726733577243; 
 Thu, 19 Sep 2024 01:12:57 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com.
 [209.85.218.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f42b1sm690323166b.46.2024.09.19.01.12.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2024 01:12:56 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a8a7b1c2f2bso82050266b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 01:12:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWNFfRtEGK6VPwJQ5oapuDA7vqChqCx9tHMza9AfBqxnZR5Lkxlrctfm5zQ4y+ffF7lcYuLO0Imx/8=@lists.freedesktop.org
X-Received: by 2002:a17:906:478a:b0:a8a:8c04:ce9f with SMTP id
 a640c23a62f3a-a90296eabbemr2749579766b.52.1726733576020; Thu, 19 Sep 2024
 01:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txujwc-GoV6qB1DpKjbDi-8uDcJLnJFSY4OBgPu=ZAVBw@mail.gmail.com>
In-Reply-To: <CAPM=9txujwc-GoV6qB1DpKjbDi-8uDcJLnJFSY4OBgPu=ZAVBw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Sep 2024 10:12:39 +0200
X-Gmail-Original-Message-ID: <CAHk-=wiehYLXmbf8eZ080n7LEeS9=O5kEpGKjeP-01dj0EAYbA@mail.gmail.com>
Message-ID: <CAHk-=wiehYLXmbf8eZ080n7LEeS9=O5kEpGKjeP-01dj0EAYbA@mail.gmail.com>
Subject: Re: [git pull] drm for 6.12-rc1
To: Dave Airlie <airlied@gmail.com>
Cc: Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
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

On Thu, 19 Sept 2024 at 09:48, Dave Airlie <airlied@gmail.com> wrote:
>
> There are some minor conflicts with your tree but none seemed too
> difficult to solve, let me know if there is any problems on your end.

Christ. One of them is due to you guys being horrible at merging.

Your tree had

    drm/xe/gt: Remove double include

which removed (surprise surprise) a double instance of

  #include <generated/xe_wa_oob.h>

but then in merge commit 4461e9e5c374 ("Merge v6.11-rc5 into
drm-next") it got added back in!

Please be more careful with your merges. You can't just look at the
file contents, you have to look at the actual history of it to see
what the *cause* of the conflict is.

                    Linus
