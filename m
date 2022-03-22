Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A6D4E4482
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 17:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EAA10E053;
	Tue, 22 Mar 2022 16:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F1310E053
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 16:48:12 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id h1so22386210edj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AGjZE0nexYYIrgZGc1/sQ9ebvM2IDXrU/8dxpFIfC6Q=;
 b=no3QyBMN97jJJhzD7cqUG00A6e2MB7KJHQvzy4ZBrorfKhZnY4KLpmH2ijl3hqJAEq
 w38SA1GGvBFZG7tP/8djpuj0BUbYdHZD9uy+WcRz+GY1qJugW+aRKiIkcr9+/i+/yCpl
 oDvJjvDBQlBi/23CI8I3sggW1bURzFDHhLeDItamtogT9SNEeMCBJHoKiJqhx70tbNX1
 Ju5tti5nJ1ezrJNTsClfOUV4Il9mdQ1cxiJnaMVkNSqyhptqkuN9M3Rj6KebwW+655E+
 EwOjKo25LrOTYBbCto5RaMfNuEZ99/RUyctw5hM2x3wHWiu5Zwfr1NE2y290i/E2Ow60
 0gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AGjZE0nexYYIrgZGc1/sQ9ebvM2IDXrU/8dxpFIfC6Q=;
 b=s+qE3m29VK8FGjDs+V3vQU1zEujPk2laRX8bjRC7uE3gSrJq7nXIRrpNm698OY8es3
 8pCElNfMXH4WlFHSL6vVALJucZ0jczH9L9CXt0MDH5+7McHNcacMbgFHPzh+gC+nEEH4
 6KbcnhgNmgPu9PRQT9aJ2mYpHURaCBMrVwMzqnk65droiAW6m7fZsA8szkeOXh5h9T5b
 I0DHzrQpVXP9db77s1YsD3uCFtfNMgHKfB5vzmGhubBSk242q3cHTyMq1VjVE9XL6ZNu
 q9VZg7R+0v3Z2GBJDLIja6nDxgvOxPUaPUyiUKQATzZ9mxabcTF8sstEvKTIkCPsm0Bo
 gU9w==
X-Gm-Message-State: AOAM531GwkY+SppiBr/4JhqeA0UpBnVQctkno0nXouavsnNFPf548uCv
 OWdkUlerH5lwYj5EipRZ2ODFBrxwEnN7VUyS7dxCFw==
X-Google-Smtp-Source: ABdhPJwZRYX6C1CGVh68tu7TSeAiEpJ8wx/fcfVLk5Q+CMQBUqipxTaYyzGYpgmBcf1ERpmMdJvRS+InEGnYxa4P70w=
X-Received: by 2002:a50:fe81:0:b0:419:16a5:d265 with SMTP id
 d1-20020a50fe81000000b0041916a5d265mr21254515edt.4.1647967691267; Tue, 22 Mar
 2022 09:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220322095223.GG8477@blackbody.suse.cz>
In-Reply-To: <20220322095223.GG8477@blackbody.suse.cz>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 22 Mar 2022 09:47:59 -0700
Message-ID: <CABdmKX2hZChBO09xfhqB7EbH6RY9JdmDp7zh23DaGuwidn=v4w@mail.gmail.com>
Subject: Re: [RFC v3 5/8] dmabuf: Add gpu cgroup charge transfer function
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Kenny.Ho@amd.com, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, Laura Abbott <labbott@redhat.com>,
 linux-media@vger.kernel.org, Todd Kjos <tkjos@android.com>,
 linaro-mm-sig@lists.linaro.org, Tejun Heo <tj@kernel.org>,
 "Subject: Re: \[RFC v3 5/8\] dmabuf: Add gpu cgroup charge transfer function
 Reply-To: In-Reply-To:"
 <CABdmKX3+mTjxWzgrv44SKWT7mdGnQKMrv6c26d=iWdNPG7f1VQ@mail.gmail.com>,
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

On Tue, Mar 22, 2022 at 2:52 AM Michal Koutn=C3=BD <mkoutny@suse.com> wrote=
:
>
> On Mon, Mar 21, 2022 at 04:54:26PM -0700, "T.J. Mercier"
> <tjmercier@google.com> wrote:
> > Since the charge is duplicated in two cgroups for a short period
> > before it is uncharged from the source cgroup I guess the situation
> > you're thinking about is a global (or common ancestor) limit?
>
> The common ancestor was on my mind (after the self-shortcut).
>
> > I can see how that would be a problem for transfers done this way and
> > an alternative would be to swap the order of the charge operations:
> > first uncharge, then try_charge. To be certain the uncharge is
> > reversible if the try_charge fails, I think I'd need either a mutex
> > used at all gpucg_*charge call sites or access to the gpucg_mutex,
>
> Yes, that'd provide safe conditions for such operations, although I'm
> not sure these special types of memory can afford global lock on their
> fast paths.

I have a benchmark I think is suitable, so let me try this change to
the transfer implementation and see how it compares.

>
> > which implies adding transfer support to gpu.c as part of the gpucg_*
> > API itself and calling it here. Am I following correctly here?
>
> My idea was to provide a special API (apart from
> gpucp_{try_charge,uncharge}) to facilitate transfers...
>
> > This series doesn't actually add limit support just accounting, but
> > I'd like to get it right here.
>
> ...which could be implemented (or changed) depending on how the charging
> is realized internally.
>
>
> Michal
