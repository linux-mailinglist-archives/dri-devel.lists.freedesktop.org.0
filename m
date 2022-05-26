Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98070535402
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 21:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E4110E615;
	Thu, 26 May 2022 19:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CB110E615
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 19:31:28 +0000 (UTC)
Date: Thu, 26 May 2022 19:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1653593486; x=1653852686;
 bh=xFkqYgrg71xEWwz5Qziba3ql4geJbQF1+I+yASfq5Mg=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=VvD2kdxp8C4KJN+0fA4KnFCl5nriWORB+8KhxO5haUp7G+VwZFJ/tFFODayhm0UMg
 fOW4HIw4rDhtZFSacIRus535lxAYVvpfsCKMd1B0StNHALMazUa24buSO3uh6gf9lp
 j4l/Ab04A4qHOd7AT95FKrHhIu6ZtBXN5Io6ApXXA9KDQhkKD4k2EmDOR2r/Omku3g
 cMz2d7YBxLVJtY/5vKC0e5/nhY8qT4UPf0JyM9zYSkIoiQn3bJqZ1V2RkCL8FaePRx
 Hei4JRwY+HKsWg7lxfbZrvQACkINgZPSPxAAcrlt4Vig6bVqPYxn1YSv0NbmjwL9Dz
 sGuYlM7ZclcxA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH v2] dma-buf: Add a capabilities directory
Message-ID: <fVkzcIaWuHDv39n_rvPmFWVfcnOha8t50PK6zXATrIrqPAGPQAv7Et4LvMm2ul8DuDM_zpgxiQwRbR3eV0R953vd-FvWST0mmQXO_PUhADY=@emersion.fr>
In-Reply-To: <20220526174025.344908-1-contact@emersion.fr>
References: <20220526174025.344908-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, May 26th, 2022 at 19:40, Simon Ser <contact@emersion.fr> wrote=
:

> diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers b/Docu=
mentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> index 5d3bc997dc64..682d313689d8 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> +++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> @@ -22,3 +22,17 @@ KernelVersion:=09v5.13
>  Contact:=09Hridya Valsaraju <hridya@google.com>
>  Description:=09This file is read-only and specifies the size of the DMA-=
BUF in
>  =09=09bytes.
> +
> +What:=09=09/sys/kernel/dmabuf/caps
> +Date:=09=09May 2022
> +KernelVersion:=09v5.19
> +Contact:=09Simon Ser <contact@emersion.fr>
> +Description:=09This directory advertises DMA-BUF capabilities supported =
by the
> +=09=09kernel.
> +
> +What:=09=09/sys/kernel/dmabuf/caps/sync_file_import_export
> +Date:=09=09May 2022
> +KernelVersion:=09v5.19
> +Contact:=09Simon Ser <contact@emersion.fr>
> +Description:=09This file is read-only and advertises support for importi=
ng and
> +=09=09exporting sync_files from/to DMA-BUFs.

I now realize these entries should probably be in their own
file: Documentation/ABI/testing/sysfs-kernel-dmabuf-caps.

Also Daniel has noticed this is for 5.20, not 5.19.
