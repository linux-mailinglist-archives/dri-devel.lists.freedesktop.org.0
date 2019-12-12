Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B3D11D3F2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 18:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2E96E187;
	Thu, 12 Dec 2019 17:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22E36E0DE
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 17:30:24 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id z12so2689965iln.11
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 09:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=buiJCQIa1M0F7mNGBh9RFD+zqL4q7yAihbNC6di0vjg=;
 b=hiEDWganqs6Wr4U1bzLh/sqz8wJ/5TLIeNO4FQeP3aNvLCAarYCk2BL6y9swCiQ9Fl
 q5Z9cKKXda7+1ywCKa5Fy3GMB9fyauzJWyWE7a+i/W4ZN946FlI/5zk9w6M42wqItMR7
 bo64k17/e5q7gvm/og68MBNZHvdOAzxzlU/xiE9oAB4LY/AVgKSHwnLdn7eL+nlwo89R
 wJB/sbaHBGreu2L5RnIYjyVr0i5JUuFbFY4e+0+PcRz8f6mcvjjTJ24ryHVy6x3kdxuo
 btSg6yO490eSo1EuINHzBHPwM2AHcHUZX9lO4wbFQEAtqE0BgzuIdD89iLiueBIZp2az
 S5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=buiJCQIa1M0F7mNGBh9RFD+zqL4q7yAihbNC6di0vjg=;
 b=a11ZUnTTDMVLx22ECYbLJK5cbcwg0oRGiw1me2OdMqZjR7pEdJnt6EWKGdGuA0GDQd
 EQyJDFgvcPKuBkiPGdVvogbxpF29sDV53zSjBHtZd9Z8TRzDZYkp3SxNLiSMOuWK3Mmi
 GtYVQgNrGxEKkgWO+WZpL/Oss6MZ+6gYUPkPw0KnmQyK0JzQDSrGW5KWcU9tFl8RQMN6
 HOwNzHuHyY3PsF714ZZYwmyue84QhqwpqaNMropKjeLce2qW17jXRzWaJVALrD0gzcmP
 0GUKsK62qnNMKlET5tCennMYI9wOfJ6IuqyIT2dI+GufuBjcF97wtU+HuGIFySYa9j9t
 aWYQ==
X-Gm-Message-State: APjAAAVKUVt5aqmfqLX56oytZjpOsFTalSo37RbYFj9l9REFPRbT4Ggc
 lSPR/zdH8jfnH9LAgwdkJs09rY/bDZB1hqYMU40=
X-Google-Smtp-Source: APXvYqxbehLkYuOUdyj28Fn0xR1k4G8Vk/2h2CmTknHfwrxNSS8mSZhd37Oz79Iww0E+7oybmvU1mNJrjSK4uGIkYsk=
X-Received: by 2002:a92:84ce:: with SMTP id y75mr9074325ilk.93.1576171824181; 
 Thu, 12 Dec 2019 09:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20191212125346.8334-1-kraxel@redhat.com>
In-Reply-To: <20191212125346.8334-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 12 Dec 2019 09:30:13 -0800
Message-ID: <CAPaKu7QpjacLLQqjgh7XsqzJArg+fhrahDsyEhUEkCk3VPVUDw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/virtio: some optimitations.
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 12, 2019 at 4:53 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> v2: fix src rect handling (Chia-I Wu).
>
> Gerd Hoffmann (3):
>   drm/virtio: skip set_scanout if framebuffer didn't change
>   virtio-gpu: batch display update commands.
>   virtio-gpu: use damage info for display updates.
Series is

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>

>
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  6 ++
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 80 ++++++++++++++++----------
>  drivers/gpu/drm/virtio/virtgpu_vq.c    | 23 +++++++-
>  3 files changed, 76 insertions(+), 33 deletions(-)
>
> --
> 2.18.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
