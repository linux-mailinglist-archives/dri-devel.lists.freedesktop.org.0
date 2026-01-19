Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7195D3BA52
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 23:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDC010E531;
	Mon, 19 Jan 2026 22:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JaiO80NH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9BF10E19D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 22:02:48 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-890228ed342so41397766d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 14:02:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768860167; cv=none;
 d=google.com; s=arc-20240605;
 b=dfzjZjSXrsEfnlSQEWzY8xEzbXROjYLykat2t5i3MN+S6c1uuXBZkWF0tXy1bHV7Zu
 koJyQaxWculbw+h17vRGwoURyYfQz1/+5ekmem0YtMzteym608udcsWoQK8ky4sgonfZ
 gTg+1azgJ938zjLToRwX5Fo3IZcQ/nnS7yqrPzcOGaiG8GPSiP6iSrDMtBy5q5T/bMnZ
 ibY+rBZV/hDh8wULKiLzzxVjsN7uF/BRPGhQHaQIem/gWVo/UB221Ktjf0eVK3fnVnTG
 8ROvjx2tvdvHuO5BM9OZbP8xoXahvw8pPpszV+AcqGE/6oxii2tWPZP1jPKz2bkjkVjZ
 u0Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=z4I1FG5kE92RzhWR3jE/PRvJseV6D1MVfRbu162Q0DE=;
 fh=7/jk0E7vREx0ggP1TrjdC8AULFrjN37DX7FR6qIX3P0=;
 b=iA9Kdg0zqEJ2KKrqv/JrhBzlGsU+CvawNQXGSd3Bi0oOgXFMQidEwIe08mKbM9XcBC
 hy6ca7xWOs/oklTXwL6/AHXO4ssxU/lnUZC2r3qjiYNmz76oYM2Opsd7Py61aR1Mld8D
 CWTVXEW0gwqSAOMhKw3e+x7Q4WfhZSjKYVf1JAuIldHorPK18rFTclB3JlGcyftEpnOe
 Mp8rnKtasl3bFCoa1SLqUmw/qLJqBJHpyvOmVAw4Xhld+byOO0JFZF3Iz4bcWHerBO1q
 2mK6FYa+wjnKse8eqAmN54m+lwZemZwvLojOgUIEVj1/Gs1OqljtGT5LTiV1CwnFtOt1
 W2NQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768860167; x=1769464967; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z4I1FG5kE92RzhWR3jE/PRvJseV6D1MVfRbu162Q0DE=;
 b=JaiO80NHhoewjHl+Etdk07MN7qLw9H6Lm/i9KlFCVQNe6HNIccH3Olxt1E5tuHYWiq
 rI3iG/2U6d3OLrktLGXSufbhNjah8lCGphcrSwPrMumRaSFIxZR8t+gy2sXqe/bZhLmW
 cLK8b3H/ZLr8SA5ZznhytvTgrE6YucTxzepxtq8GyVq5rvworKxPV5x6SUipUbhaCRpJ
 vNURQPUWAjyzt5WoLZMJ3w0tFsEWSYpqCtY628KIf7cFmOAKofr/S7IE/+s6qnJJrm4y
 9lSHxfOFWxguWDUXUKdts76ff2K+SclHd5PHLtv4kJqsjlYZJWsz/o6xjAbvaEyPt+xB
 Vj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768860167; x=1769464967;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z4I1FG5kE92RzhWR3jE/PRvJseV6D1MVfRbu162Q0DE=;
 b=CI7zLohEbl5OihEUVfC43HpnufUE107jJB8EZ40LalHr54jMfTxjjuZeY2x7W317Cz
 rH3lGGun9YRdxy8Cr2EiJ3OWMeLaRNmNWpFM9gEnuVMiiAv4r7NkJKfRWoQn+YlLKlsA
 5ifPJxQgYrN/7VZIwfKAjkFHvT5+NZ89BZbdGhViGx8Cwmv17gimnaG1kbqS69+9qGvM
 JbdQ7hHtMjWzE8mWkigatnDAW72HhURbLqXRh9ZyQMJfuVGhV+JuYEVuNuAw73IjjYZB
 HnQswgQutizx32GDTONNuKP8IPWvuhwRhhFbJmGxIgG4gp0xSnUNIz3uTUUuhrT5JmJQ
 ZDTw==
X-Gm-Message-State: AOJu0YwbbXKDmjzVPiNvhJnagvXzFysxuUMN2QopIFkw/JJKD63DUxG1
 4/HWpyuJP9A0zqMVIfcXnda3zr2wqT4o+rJ0ntHHcv/u3oFkFTvsDm+KWfV9Nsp//JrZOGEb+8U
 C1t36d6WdzKNhLlLP2SBSBbvRs2uHJM0=
X-Gm-Gg: AZuq6aKaTdT/QTVHfZEJLKpI7ETfFduDIxS+ica4fFpLeZYuuiC8Za1iKYpIcsFavji
 8X21y3RpVk3dkqXhQVoUYps0hD2FpZz27F6jr7O5Wy57cUaHEkXHjgpC1jOsEMSrDX4UZFD5AXz
 0iz8Kuxfi+8a6Hwb/uj10VwZzax+GnnDaBpv8mV3S+209h8BgOyXNjfw9av1uhLbB13Of5YqvwG
 520pR0mgJ5CsUpIchZQkA2LGxIhX2x6PAn24TpkOo0O/M/8w6DAFhG2isQyXmK4fl+nwVBKAojb
 PPOy+Ad4h02IGzuulN2Fl/YABFrlh9owLXh1ERmJGzvzCYxu4KWuC48=
X-Received: by 2002:a05:6214:d64:b0:88a:42b1:25e7 with SMTP id
 6a1803df08f44-8942e2e7e18mr209340696d6.29.1768860167408; Mon, 19 Jan 2026
 14:02:47 -0800 (PST)
MIME-Version: 1.0
References: <20260119053701.181329-1-airlied@gmail.com>
 <5b6715f8f096ee6ea180b6d12e56bdee590c1d7a.camel@nvidia.com>
In-Reply-To: <5b6715f8f096ee6ea180b6d12e56bdee590c1d7a.camel@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 20 Jan 2026 08:02:36 +1000
X-Gm-Features: AZwV_QhCVe8QaDvRC3eoJ6O0Y0glZm6tgMDDwzHo_FWvXkNE4w01slqV06UIAWE
Message-ID: <CAPM=9twAOoshrw5vUo_ErwZwkg1ZQPMoS8nBfgcJU97BFMGmQw@mail.gmail.com>
Subject: Re: [PATCH] nouveau/gsp: use rpc sequence numbers properly.
To: Timur Tabi <ttabi@nvidia.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
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

On Tue, 20 Jan 2026 at 04:57, Timur Tabi <ttabi@nvidia.com> wrote:
>
> On Mon, 2026-01-19 at 15:37 +1000, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > There are two layers of sequence numbers, one at the msg level
> > and one at the rpc level.
> >
> > 570 firmware started asserting on the sequence numbers being
> > in the right order, and we would see nocat records with asserts
> > in them.
>
> I wonder if this is why I see so many NOCAT records when booting GSP-RM in Nova.

Very likely, nova should probably get support for the rpc seq numbers.

Dave.
