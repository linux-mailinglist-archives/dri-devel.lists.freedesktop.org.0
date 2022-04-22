Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A27C50BD42
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 18:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96B510E250;
	Fri, 22 Apr 2022 16:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F3F10E250
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 16:40:54 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id l7so17518239ejn.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 09:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CoGqA9rNsKJzYU/Obb8AAvf20gVKLeXNXFwl6nZ00rM=;
 b=puSEmprmz1nabSt+ml3920aGPKkUVGoZm9P1z5qEs6WOb5oaEqNdPuB+XnBF/+pdaO
 BVteA6H2VgQlmb0Vq/J/n/1XVZvrvGQjt3mVj7lbZ/55jU+YzyVz0YPnKdWjffXAa8Sz
 MZZheTPjT0XiMePlwtP5H2lntWYI8T7f3sghXXsJd3g7Ti463gREa1RRPDULw3YuULJU
 V2eu6FowolcgcwIpjbYp+q6SYrrPz3TtrfOdT2/aZwIAQaPxpVJyN7CzTxgTka8GC3Wa
 WXEDYA8EWuQGKrc2twCsC4WwQ7w8TiQWt2zr4dmLhdutg4v2XDEey0Wxj5JTGpSZAciX
 TulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CoGqA9rNsKJzYU/Obb8AAvf20gVKLeXNXFwl6nZ00rM=;
 b=zgtqaht8BvSnqCZ0dt2ZNdQ26rE1y3xE8bl1+zMqjxw9vPfQqtS7GEe/toQv9T+oKb
 bj+TVUJaAzL02usVHRP8EjWkCXS4E0KTc/kNB2cNgUORMesAtrjCX2O/hBnxjhuxA9bW
 l++A+uK2CWTJbMDZH9NtfFJIXVkXOcrKBPaz1f+QW5rGhCywqyz/pRA4rWihKxzPyxcf
 /Vjc4Ho8EE90hZZXQHLPgf5t2Pv97bNYWB5nYhy9MxfMIh+EKnv14WbO7TiDzeIEMC/6
 I14eQiejWxJDuL2orERwQfjDlLjirUSMvnkd6S6hqSW2bh+LNhd4omujrveqtEFzeINE
 Lr4w==
X-Gm-Message-State: AOAM532dXdj/RCQNHawXRZpwsN+rz1Z6ZUkFtiANF3r0lD41H93dMd0F
 OSiq9PcqhOgUutYeJfMVGAkIL58akPudP7C97fx6mw==
X-Google-Smtp-Source: ABdhPJzoLmBU5Xg3Lxmb7MT8CNOOwTwJf10BbLeuL2aNNlpJcThtRrea/0k1l5jXVtMthl5n+035wmUrG4QqfMQQfso=
X-Received: by 2002:a17:907:60c9:b0:6f3:47fb:df26 with SMTP id
 hv9-20020a17090760c900b006f347fbdf26mr3107234ejc.159.1650645652344; Fri, 22
 Apr 2022 09:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220420235228.2767816-1-tjmercier@google.com>
 <YmLBTBd+5RHzr9MK@kroah.com>
In-Reply-To: <YmLBTBd+5RHzr9MK@kroah.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 22 Apr 2022 09:40:41 -0700
Message-ID: <CABdmKX2X6VqK4rw90+OtSOF+aFZELefuzd=YOY3+cqiOqqYALQ@mail.gmail.com>
Subject: Re: [RFC v5 0/6] Proposal for a GPU cgroup controller
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Carlos Llamas <cmllamas@google.com>,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Zefan Li <lizefan.x@bytedance.com>, Kalesh Singh <kaleshsingh@google.com>,
 Joel Fernandes <joel@joelfernandes.org>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Martijn Coenen <maco@android.com>,
 Laura Abbott <labbott@redhat.com>, kernel-team@android.com,
 linux-media@vger.kernel.org, Todd Kjos <tkjos@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linaro-mm-sig@lists.linaro.org,
 Hridya Valsaraju <hridya@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 cgroups@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>, Kenny.Ho@amd.com,
 linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 22, 2022 at 7:53 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Apr 20, 2022 at 11:52:18PM +0000, T.J. Mercier wrote:
> > This patch series revisits the proposal for a GPU cgroup controller to
> > track and limit memory allocations by various device/allocator
> > subsystems. The patch series also contains a simple prototype to
> > illustrate how Android intends to implement DMA-BUF allocator
> > attribution using the GPU cgroup controller. The prototype does not
> > include resource limit enforcements.
> >
> > Changelog:
> > v5:
> > Rebase on top of v5.18-rc3
>
> Why is a "RFC" series on v5?  I treat "RFC" as "not ready to be merged,
> if people are interested, please look at it".  But v5 seems like you
> think this is real.
>
> confused,
>
> greg k-h

I'm sorry for the confusion. I'll change this to PATCH in future revisions.
