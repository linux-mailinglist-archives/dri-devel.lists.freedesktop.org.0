Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E117B022A6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 19:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721E410E2C3;
	Fri, 11 Jul 2025 17:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WAXuqaco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E356510E2C6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:35:58 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ae361e8ec32so423411966b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 10:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1752255357; x=1752860157;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6Y7KQBMvE5wPTJUBRle+pzVi+8DRYqjxpjSZtude4vk=;
 b=WAXuqacoOuVj3yjUC6ilfvFU9e21kioD/ityUEk2ah/Gt6cb5oI3OG5QiW+MmHt6UT
 3N9hKtSS/q8lcqRMDPOtqs12fXoKNYYZrxWT0mzXCd6LUItx9nZeJAtucFz9/5a9eLws
 /+Sl3SJxDMNHvHtSUONIyqxpEeQFm3SmL959I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752255357; x=1752860157;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Y7KQBMvE5wPTJUBRle+pzVi+8DRYqjxpjSZtude4vk=;
 b=wJ77mNoqJgzaBExHV6TRTs+kUtJc7QPL33FWl3XCoU8fxhtwJ4BV1Sy0HzfRzNW2kp
 dNvoe5ztJqmabhe/obsc1RwZoEOptDYxC8Suj7omUHcFGlKatv7xmlElu2VjxY1F9In1
 zecy8y6ujQNEg/OJQeRQSpCuDbZwWwQEXu+JC1sKdMXTj5VdeJEuSnIFbJFekp6uxOSf
 plvLWJPpzanC2FmWZ9cSDNAwg8baTE0HG7JPKMuiZRSwHC6YJpG/4kUYzcYOFaU2m0Iu
 uPGi6p2UKT2ZLghUEUTDuHywLCUSCo95NpeEB9rgRAfYulE2enuMyfQkDXRjN8EvClmg
 tzZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuTO4A+7aEubx9G8xL7/gvOi/kzLz+bXZHeEEFC5hwG7C+UsaFJxLxd0UViEs54jivJ+Tv5Rfekr8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4UePPG6vY5Ew9fPMxJzxqeAhE5Dbs2CO5h2Y8ExFOuIy4T9R3
 nWtXQFRCv3wpvdV1KKsQCBCoMXsNO3uBdzktPHgFPYrWwHGTalUKZWDtUP9gBhYWbb2n/Qfqwyc
 DZQELrshf/g==
X-Gm-Gg: ASbGncsqfHDO6vpxBwHxanrJkj7neY+WsAFp2E7SZq5CR4RsDwRnCoeQmWmU28imYCu
 NqupjQ6DB6D0uxkIbmHaoJq9FSihuGo174v5+4fkPJNslXYoRvwXEQWG3R6XIL/QqtUP+pa5nar
 5XBdDw79drSzuuIhDv7Xawg35cWREt/EgEm0swdw7W+tGbnp/6WNSpuv9YraOyB4hm33VGaGYH1
 fy8NLVeXI2GbmvKTfwox1aVI1IH1c9Gn60DZIs4shbHugUu7D+b3YiSfw3h1Ng+Gn8AI0jXN7AO
 HS9SmOr+EWSZBv0kX5TBy21gJ9NjD7A3tf6xeq83FTLvCZuR4HNVQDIKT2gcLyL4W5liUwXuNiF
 kpiy0oC+2oVVjvZ+x+Vym6e44vD2uq9yUST38W8wNI8Npk3oryl/Me/Glijl69FIP2PkmOGOl
X-Google-Smtp-Source: AGHT+IGFjuC6RxzLmZ4H+MmMs/LFaARrkhU/XLEZcyQZI0lP4VEt8X8naUo0pdLJEYCCMrTcs65/rw==
X-Received: by 2002:a17:906:f58b:b0:ae0:d7b3:848a with SMTP id
 a640c23a62f3a-ae7010c0c1fmr346129866b.2.1752255357051; 
 Fri, 11 Jul 2025 10:35:57 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82962acsm326399666b.139.2025.07.11.10.35.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 10:35:56 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-60c51860bf5so3867289a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 10:35:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUafUSc3A5vH5PjRyFVJwipim+ZkgLFZdB/UYlCtQ2KA8wiJz6uFCf7XT8xBP8IeMOEGVV5RJxuRSY=@lists.freedesktop.org
X-Received: by 2002:a05:6402:13ca:b0:60e:9e2:5844 with SMTP id
 4fb4d7f45d1cf-611ed137bffmr3157234a12.32.1752255355632; Fri, 11 Jul 2025
 10:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250711093744.120962-1-tzimmermann@suse.de>
 <CAHk-=whnUp7M-RZ6yzOyF6bzA4cmbckaH4ii_+6nBm0PqKOaQg@mail.gmail.com>
In-Reply-To: <CAHk-=whnUp7M-RZ6yzOyF6bzA4cmbckaH4ii_+6nBm0PqKOaQg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jul 2025 10:35:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wif6u3C4gk7BtR1M+0SvHruXZ7xycP5oDdg-SF1D=ELqQ@mail.gmail.com>
X-Gm-Features: Ac12FXz0Cw3UTlua4uIPZpLiT2Oslevjx3UEJS8nAOMBtacwuTkVhrNGLknGSuI
Message-ID: <CAHk-=wif6u3C4gk7BtR1M+0SvHruXZ7xycP5oDdg-SF1D=ELqQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm: Revert general use of struct
 drm_gem_object.dma_buf
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, christian.koenig@amd.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, l.stach@pengutronix.de, 
 linux+etnaviv@armlinux.org.uk, kraxel@redhat.com, christian.gmeiner@gmail.com, 
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org, olvaffe@gmail.com, 
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 virtualization@lists.linux.dev, intel-gfx@lists.freedesktop.org
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

On Fri, 11 Jul 2025 at 08:48, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Background for others: current -git ends up having odd hangs when
> Xwayland starts for me (not at boot, but when I log in). It seems to
> be very timing-dependent, so presumably I'm just unlucky with my
> hardware.

Update for this thread as well: it looks like I'm just being unlucky,
and there are two independent problems. The drm problem *may* be just
the warning issue that has been reported by others.

I'm hoping the login time timeout / hang ends up being due to a known
netlink regression, and it just happened to look like a drm issue
because it exposes itself as a hang at the first graphical login

A netlink regression *might* fit the pattern, in that it might just
cause first login dependency issues and resulting timeouts.

After what has felt like a very smooth release cycle so far, having
what looks like two entirely independent issues strikes me as
unlikely, but hey, unlikely clearly does occasionally happen.

           Linus
