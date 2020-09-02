Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F45525AE26
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 17:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16756E92D;
	Wed,  2 Sep 2020 15:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520FB6E92E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 15:00:16 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c19so3346554wmd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PJCpXk5nefvmsEhnBSZDmNFQ5Rqti3ArwLMBzUR1eZw=;
 b=u7RSnAyN0EMcQHQpimghVI+WjQaFivUI7E2AqovhQeO3c/KEDWYUw9Y8RGz2ZoUA+Q
 BFGDDWnh/ycURllSmVJPySgEjcaVXyawTvG93zots8ijpU5CEp+pFbgaZX/TiYzqZDhG
 wnR7Aon266c7VKxhnIovxiEd9a+wURoRUkTKhgBeotUd2vbY57Bek5zzKGhE5v2HrI/L
 2XL3jErwpeCdAjUUomMPVvEBUq9swq03wXBv7KgCWaIX/jgd1pzUE7dPWr3SBwSOmYgb
 9zhRiFXgroaqYjcbV7fHRMgIu0/uE5v3gDhOG7jdDniA675+RKCKgcSl74Ok+jLWs7I5
 vWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PJCpXk5nefvmsEhnBSZDmNFQ5Rqti3ArwLMBzUR1eZw=;
 b=GrzT9GX7/FB5miZM0jYahLNM+E+kMAd5BStVO0msmMho7Rscij9wjF6W8+4IpbK5el
 GyFTAUujnHGD7ZEg0dtspN5OeY+eo3ThumRAuxT922Zv2YNghK38r3GownaJcp4mxWMV
 nqqgJlbPsmE6zqK5apRtHsABkfGfRj0Qzij1z3VlriMOFSivM+JagWpEahGmNSwE1F5H
 qpOtTDRRhRNjiMFm0DenCXxCZQ9Jk0bm7Wwxgk/9w/DOTCY/dae1sTawyZymsLdDafcS
 BWvaZ/MQ6IaZSJ9EwK1uTBAzZt7ZYEB+BNdCmftbNVOJKbgoqxZ8vrb3k/jV/OKQXpLp
 rRuQ==
X-Gm-Message-State: AOAM530KPFNRggQoOyGxJuYBrKrcl31RdmHwEWwTDTgmL4TLaVaLU7pW
 SrC7QcSAXwrW1dtEgdb1dP0gU5jgkDZkFK/NzHHe/eK2nxc=
X-Google-Smtp-Source: ABdhPJzjcjMJzO/eIz3JfHjfW6VWxDhlmh9P/Pkagn/Gb8cKWUjnA0oIxi4njt/SG6cQWOa6dfHzkDzeDefbUwGbOAo=
X-Received: by 2002:a1c:9909:: with SMTP id b9mr1087526wme.98.1599058814920;
 Wed, 02 Sep 2020 08:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200902010645.26943-1-luben.tuikov@amd.com>
 <BDD53312-3A34-4761-A7C3-6FDFE66A6C1F@amd.com>
 <e6916b3b-60cd-e223-4f87-478aab3b2468@amd.com>
 <62D0EAA9-E3AD-4FA7-AC24-9F5F9C594EB2@amd.com>
 <0f336bb9-5d78-30ed-d217-c5905d1dc08a@amd.com>
In-Reply-To: <0f336bb9-5d78-30ed-d217-c5905d1dc08a@amd.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 2 Sep 2020 16:00:03 +0100
Message-ID: <CAPj87rMRemGSZGoPV-BYrAZCK26aB-rFsKL6hVPRsha_850SXQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Use implicit kref infra
To: Luben Tuikov <luben.tuikov@amd.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Luben,

On Wed, 2 Sep 2020 at 15:51, Luben Tuikov <luben.tuikov@amd.com> wrote:
> Of course it's true--good morning!
>
> Let me stop you right there--just read the documentation I pointed
> to you at.
>
> No!
>
> I'm sorry, that doesn't make sense.
>
> No, that's horrible.
>
> No, that's horrible.
>
> You need to understand how the kref infrastructure works in the kernel. I've said
> it a million times: it's implicit.
>
> Or LESS. Less changes. Less is better. Basically revert and redo all this "managed resources".

There are many better ways to make your point. At the moment it's just
getting lost in shouting.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
