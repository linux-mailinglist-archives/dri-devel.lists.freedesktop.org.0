Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A23F197BE9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 14:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C8C6E297;
	Mon, 30 Mar 2020 12:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F416E297
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 12:34:17 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id q128so17442163iof.9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 05:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ugYRzz9x1UjGNKjwYYI17qia2N9XHsI1pN2vBIoW4mc=;
 b=AulWHQzIHdpUZnA2sbkDfxfUjyOfSvu6RazWKeyE6oqreSfALk5Y2vXA2kQ2/ZtBmW
 XL9QQtIGnuzHC3n2SVWQQ4RbUEYFYCWmwSiWln3Z+xTe7CRgmxmQXivx1qb5ocRvAa8c
 eqcZ25hP0Vx3sd+pgloyAKEUJ8v8t9HOVHD/jZ0z9ibyNourLGJ7/hP6QIwR02B4qWu6
 +PyGHV1rYNU2zT7NHv5h9oe2NtTF0K4zUQQYwM3zNOIfvB+2fZl4G65UhvhKBaBJPtfR
 nEjqdo7Oogn0QNgP9AJ/xa5G/SXIeOUY6ZA8pFzRy0ShUwfBK/vFlEKBOm5KKAnOyJbj
 X24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ugYRzz9x1UjGNKjwYYI17qia2N9XHsI1pN2vBIoW4mc=;
 b=K32r30UmwWBDJvhuYuaufkA2xedcqI/EnN9M92x1mXSO1a9AIssxWr6mlH0Djd7uK9
 b8ZC4FnwD+LxW8+gtm+Ox/DT6xTRq/0zR4x4EPW7WeK0Hq/2XadQCJsQTl2uHXjziSzh
 RirDVhAIbXzNivmdnWYwHdLmwJzoasabziOdblq1rWgcFvAddp6gc1kvq8KhSsSI3f2Y
 +00fHz6h4l7CaWxrAt9wV8TRwUlzwpO9QUiATbtEDg9rZ84Innp0CU7B4ZJPcl4dl2OB
 LoKWpdS4+L2n8CNmdLqEitVGNIS5Ju+fIqoJoTh03IB/OO8z9IjVf1IggFUOQfmIhi49
 XXnw==
X-Gm-Message-State: ANhLgQ2XZTJDkVpbYKhI0oo/UzGhNDcrAEcAk/XSEskAY7MIQHYhw9Io
 z/dZ+ULfftK6FaWNrYCafA6WBgGi7C5YXW5+5WM=
X-Google-Smtp-Source: ADFU+vuJ2Fim0LqX//6fvtgqy0RzQBRtW5mAL/toKxx/E1bUAIyfGNfzuWQoO0GVaXic4F3UMLxIDDTCSuxXedtjGTo=
X-Received: by 2002:a02:455:: with SMTP id 82mr10525540jab.112.1585571655651; 
 Mon, 30 Mar 2020 05:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200325090741.21957-2-bigbeeshane@gmail.com>
 <CGME20200327075458eucas1p2f1011560c5d2d2a754d2394f56367ebb@eucas1p2.samsung.com>
 <4aef60ff-d9e4-d3d0-1a28-8c2dc3b94271@samsung.com>
 <82df6735-1cf0-e31f-29cc-f7d07bdaf346@amd.com>
 <cd773011-969b-28df-7488-9fddae420d81@samsung.com>
 <bba81019-d585-d950-ecd0-c0bf36a2f58d@samsung.com>
In-Reply-To: <bba81019-d585-d950-ecd0-c0bf36a2f58d@samsung.com>
From: Shane Francis <bigbeeshane@gmail.com>
Date: Mon, 30 Mar 2020 13:34:05 +0100
Message-ID: <CABnpCuBGW9VeDxE9-SnS=hA=k18uPv4c=Ym8JtKUvZ-Tsd8s8g@mail.gmail.com>
Subject: Re: [v4,1/3] drm/prime: use dma length macro when mapping sg
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 9:18 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:

> Today I've noticed that this patch went to final v5.6 without even a day
> of testing in linux-next, so v5.6 is broken on Exynos and probably a few
> other ARM archs, which rely on the drm_prime_sg_to_page_addr_arrays
> function.
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>

FYI These changes are now in the 5.5-stable queue.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
