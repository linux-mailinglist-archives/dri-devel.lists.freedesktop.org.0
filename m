Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F89266C26C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 15:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC4910E44E;
	Mon, 16 Jan 2023 14:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A7F10E44E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 14:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673880114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NOdvTIf1x9tQkJ1orPjPgaQ6ppXgSvc8Pon55J0dM/o=;
 b=PQqNc00dDF3ajueAEAYudsL9qug9Q+g43pLvkvjeyB5GnxEdDdQ/fOLe+rKPrd7Nqw0I2T
 QqI5vCBTv+hjy8I76iZXcbpOCvG4IF22qlmzMoFdpu4mSIJWoaYakGaqFpyssXX/6WP46N
 OXPqfhCANl5C5GebFE0rxpxX+N/zMnc=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-396-Akb1N3QaPB-2PWaInqsjRw-1; Mon, 16 Jan 2023 09:41:42 -0500
X-MC-Unique: Akb1N3QaPB-2PWaInqsjRw-1
Received: by mail-lj1-f197.google.com with SMTP id
 l1-20020a2e9081000000b0028b97d2c493so135037ljg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 06:41:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NOdvTIf1x9tQkJ1orPjPgaQ6ppXgSvc8Pon55J0dM/o=;
 b=suOrxYuuFDKA357Rb1k7QQ070bmvMBrzoSUs40OtSxQHYf4cf05vKRGvmajhpdgSKR
 0VQYDleutc/kDPJD5o2vUGrwLlVDRrRDsJVOcD2vBkcDzvfvp43w0idqH5YC0sULVUwm
 xuMimONj2Dzl9yYD/inampVDtUA0Ry0uV/PWBjCs+W8fKAiKcr5q7oRP4BaFjkqIc0dk
 gWwNRMItrQ6L/ozcbXgy9QPK26FSOEiJz5XAK5p5+1vd8LtXPgiKZfb46mR5nLiW8Eqs
 AHXIgEZ9y5C4SyusUuKayK+G8V+nHJV5ydAy7Pl+DDSMQULmHi963VkXgdQyayGymnrV
 8YZg==
X-Gm-Message-State: AFqh2kpUbae5qoXNFYP+GINzi5umDOPiCsJJ1w/DUqF25D+IkuvWh7KU
 OuIePf1K3oyRQq3DoIsbH5xPTt/BrCSiQ0/AW60I95g+cTXFEkdXJUiDi4NQIhL+xFbA+/XFBz+
 N4n78rLJTtOq4d2T37xU2V+ZbzKtb7OWN3u2IUboZAIhs
X-Received: by 2002:a2e:a278:0:b0:276:4462:2d20 with SMTP id
 k24-20020a2ea278000000b0027644622d20mr2383ljm.19.1673880101018; 
 Mon, 16 Jan 2023 06:41:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt9sY30K02/f5zO7kr1kC+X6IUBM2xn7/y8ozy2/Ri3RfIQeuDJUUrDrh1bQKXOq8bdG47xKQOTvByre+UJEzQ=
X-Received: by 2002:a2e:a278:0:b0:276:4462:2d20 with SMTP id
 k24-20020a2ea278000000b0027644622d20mr2374ljm.19.1673880100820; Mon, 16 Jan
 2023 06:41:40 -0800 (PST)
MIME-Version: 1.0
References: <Y7zB0q2pr7lEpHGs@work> <202301121449.EE489AA@keescook>
In-Reply-To: <202301121449.EE489AA@keescook>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 16 Jan 2023 15:41:29 +0100
Message-ID: <CACO55ttCY1KbqWqzGS1adrJno6kUs7b5_QY7X1AE6qYUqztWNQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/nouveau/nvkm: Replace zero-length array with
 flexible-array member
To: Kees Cook <keescook@chromium.org>
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
Cc: nouveau@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

will push in a moment

On Thu, Jan 12, 2023 at 11:49 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Jan 09, 2023 at 07:39:30PM -0600, Gustavo A. R. Silva wrote:
> > Zero-length arrays are deprecated[1] and we are moving towards
> > adopting C99 flexible-array members instead. So, replace zero-length
> > array declaration in struct nvfw_hs_load_header_v2 with flex-array
> > member.
> >
> > This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> > routines on memcpy() and help us make progress towards globally
> > enabling -fstrict-flex-arrays=3 [2].
> >
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays [1]
> > Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [2]
> > Link: https://github.com/KSPP/linux/issues/78
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook
>

