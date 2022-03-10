Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C871D4D516F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 20:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5A610ECE0;
	Thu, 10 Mar 2022 19:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554EC10ECE0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 19:33:33 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id l20so11190436lfg.12
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 11:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4n6+idQ0426w+zkqVp6H2ORC9fnCFio1PZzrW8WKfUg=;
 b=OqorwzMtB49Fqip4wdm9stFVvynD2x0VggX/za+LSk2+cpHubYR90RJjOnsqoXAZJS
 PKEVUeYOlX9QtjBhjnUyqb2PSsDR+wETukIDxJkkWJI/DMsjfuTMhgIY8mWPWQI2oyra
 o9JsTO9TomWo7QJKLuNr0wMP8y/j0gAZ8MvjywUAmGwereXi3I5q/gwobTMAtCKGo3oi
 vt/8ah4AtRtGVIPPYFZ4mhGu4YhvT3BEEVZTIY2Bk+dPnS0QYjByJLaLoXqCs3CRn8kZ
 L0EpsvYejfkgMhc+/apIKBKxCkq9x+U6bH72wsz5pbyzAid1oMjnyYZpZwTlBQCy59QM
 HvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4n6+idQ0426w+zkqVp6H2ORC9fnCFio1PZzrW8WKfUg=;
 b=lzGvR2FursbGdwzu0HdrJCJwHhX6KYV6LF+jmKt2g6QRvDYyleTWnYoLtPBiNx+oy0
 sZfRQvuRCfaKeNV0qolcqe9NRV6rXarobEsP3dtjRIYC9BZuoqzxzeuvBv5dnMmRu2O3
 kKLYvhfieAeKJOiHvEYO62oraQiiNXxsn8N9FBbBo6XacQHN46DjI9L273foCbfZFWrf
 eKmIwPFwR/H13Th7CH9z24yuGrD22CC8HIV2mH0wzFcp0K0tNG6BvPQF/m0EsFBu1wcB
 jm5RyaNg/iH6TVfQBkxRus1W9HNMmEsQXfvlqSAZpyRF9xT0qzZChofgTSW11ykGNOxN
 tXPw==
X-Gm-Message-State: AOAM530Zn64WItiW+kpGk2jj1dF7Sw7uzvAJUu65CSEefUHCqbqQ3A4P
 ENv7UoBhZnAfEnUiNrZDz2qJamakGNkmULahN+nuCw==
X-Google-Smtp-Source: ABdhPJwMmlW87gYnDG08JkAcAdSJk0r0l+PhyvspUkMuuh2orjECrIymDRz2y9i5JbalSY67z7Cseau7s6pXnUeek3s=
X-Received: by 2002:a05:6512:5d2:b0:448:2e88:e9bd with SMTP id
 o18-20020a05651205d200b004482e88e9bdmr4058133lfo.424.1646940811350; Thu, 10
 Mar 2022 11:33:31 -0800 (PST)
MIME-Version: 1.0
References: <20220309165222.2843651-1-tjmercier@google.com>
 <20220309165222.2843651-8-tjmercier@google.com>
In-Reply-To: <20220309165222.2843651-8-tjmercier@google.com>
From: Todd Kjos <tkjos@google.com>
Date: Thu, 10 Mar 2022 11:33:20 -0800
Message-ID: <CAHRSSEy5_h9LJB4q5_OJA7fSq=ROo68UaK+hdPz-Vj-wac1Qhg@mail.gmail.com>
Subject: Re: [RFC v3 7/8] binder: use __kernel_pid_t and __kernel_uid_t for
 userspace
To: "T.J. Mercier" <tjmercier@google.com>
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kaleshsingh@google.com,
 Joel Fernandes <joel@joelfernandes.org>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kenny.Ho@amd.com,
 Jonathan Corbet <corbet@lwn.net>, Martijn Coenen <maco@android.com>,
 Laura Abbott <labbott@redhat.com>, linux-media@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Todd Kjos <tkjos@android.com>,
 linaro-mm-sig@lists.linaro.org, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 9, 2022 at 8:52 AM T.J. Mercier <tjmercier@google.com> wrote:
>
> The kernel interface should use types that the kernel defines instead of
> pid_t and uid_t, whose definiton is owned by libc. This fixes the header
> so that it can be included without first including sys/types.h.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
>  include/uapi/linux/android/binder.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux/android/binder.h
> index 169fd5069a1a..aa28454dbca3 100644
> --- a/include/uapi/linux/android/binder.h
> +++ b/include/uapi/linux/android/binder.h
> @@ -289,8 +289,8 @@ struct binder_transaction_data {
>
>         /* General information about the transaction. */
>         __u32           flags;
> -       pid_t           sender_pid;
> -       uid_t           sender_euid;
> +       __kernel_pid_t  sender_pid;
> +       __kernel_uid_t  sender_euid;

Are we guaranteed that this does not affect the UAPI at all? Userspace
code using this definition will have to run with kernels using the old
definition and visa-versa.

>         binder_size_t   data_size;      /* number of bytes of data */
>         binder_size_t   offsets_size;   /* number of bytes of offsets */
>
> --
> 2.35.1.616.g0bdcbb4464-goog
>
