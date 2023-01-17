Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA0066DF65
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 14:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E58410E540;
	Tue, 17 Jan 2023 13:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C9410E540
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 13:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673963547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zCNIOWyp6BvkZ2wh9MfUHSp5MAA9j0ACgJb6RoOlUO0=;
 b=RAzPTz2WXsIRDRK96l3OjVCRglq+2hqU+Isb4trMR6yVuDDhpAD1WOsS3R4si9W19LunoR
 uG/0v9XcBKpJ/r9VYbJpR4pQIiseKJJy6I8zqqrI+x1ruYfrwX0M+KZ6xjBPR6KJACIVeS
 jYmmzHtUKZ++RgE7FeLM3q+kyHHleOM=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-15-fKGYPON-NHK4VtunCi40qw-1; Tue, 17 Jan 2023 08:52:25 -0500
X-MC-Unique: fKGYPON-NHK4VtunCi40qw-1
Received: by mail-lj1-f198.google.com with SMTP id
 y19-20020a05651c221300b00279958f353fso8081830ljq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 05:52:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zCNIOWyp6BvkZ2wh9MfUHSp5MAA9j0ACgJb6RoOlUO0=;
 b=Ma/ne9wF4xxd2znT7VlV+eyLkZ9PZ8ltgy2bkO/d8or9hKYo2XMq6KZRUeSiruO+vQ
 GUKRhN/Kv+L8pQ3XGj4px3yVWPy0i6ypuvF8VW4V8L2YO59wdY668B68MXhiW96FRBgN
 kXWhsb0b8Co4MedZk8nAdHYYTsKYzeCh6Jo/0x0jQn4d6QP0VKWaWlL5uM+urzGLty8Z
 8kdh31tYeWdZM99b7HnyGEbDHsJSFS+IAylBViBO/FEK42Z7qDZiPh1NN7eqQ+sH7SRr
 wxhNWYcl/WpBHwRcbxtnvtCNuJ2n9SHmtFPcg0Trh4a6BYgm4scjIWZv4cyA9qAtheGF
 0+mA==
X-Gm-Message-State: AFqh2koucKkQfkYcQ1j1HruZM1HGTpPyZ3zMnpV3TZaokd9Ok1Q9pJyq
 x0qDG6kMfz6W3RE57JWnD89kOpdLkjq/4Ko+j2Ajb1cCNY93/fnKoTquQis7pHYrSe5CJWnSjup
 mhyHUl0H427zo7NjyZpnHij1izBIQhTZp9Yf4P9QnW7I/
X-Received: by 2002:ac2:4ade:0:b0:4d0:7b7:65dc with SMTP id
 m30-20020ac24ade000000b004d007b765dcmr133421lfp.122.1673963544434; 
 Tue, 17 Jan 2023 05:52:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs9jCpstio+iSjdAor3NZ75bz+2Dnozw/p6Ykmo64gLJfiYXc3udp+wH4Z3eIPBKX1dEiSO07P7nXfvqprRwdo=
X-Received: by 2002:ac2:4ade:0:b0:4d0:7b7:65dc with SMTP id
 m30-20020ac24ade000000b004d007b765dcmr133416lfp.122.1673963544131; Tue, 17
 Jan 2023 05:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20230117150212.3d8ee843@canb.auug.org.au>
In-Reply-To: <20230117150212.3d8ee843@canb.auug.org.au>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 17 Jan 2023 14:52:12 +0100
Message-ID: <CACO55ttvqwnmGS=4gig-AOy+67bDesdj2S9HDJ3hS=uyN0NGOQ@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the kspp tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Kees Cook <keescook@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 5:02 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> The following commit is also in the drm-misc tree as a different commit
> (but the same patch):
>
>   06b19f46455c ("drm/nouveau/fb/ga102: Replace zero-length array of trailing structs with flex-array")
>

which branch? Because I just fetched the remote and don't have this
commit in my local repo

> This is commit
>
>   54d47689c6e3 ("drm/nouveau/fb/ga102: Replace zero-length array of trailing structs with flex-array")
>
> in the drm-misc tree.
>
> --
> Cheers,
> Stephen Rothwell

