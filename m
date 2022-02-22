Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4664C0326
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 21:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10E810E473;
	Tue, 22 Feb 2022 20:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538AA10E466
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 20:35:54 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id s24so33354285edr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 12:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w7z+2gBVssBTwkTFXRrU+BRzNhXOykt+QfnboI/H0jI=;
 b=Nx4Ebu1Qa73CdYd5vi87qARsrD0v/VpwZMXfHgesrmKuCWb9W3U4528JazIOYaiVyn
 2VEovr0WBDKVp51vKrn7Ug0ljNa2PdcWMBEjHzr0Bgteigjs0cPTG+1hkwiEs62z4bhT
 WT3SopWeJZIBLHGxHSdnc7r+h9BKJQXkQGi7UDb8yL8iXx5FHgeu/4iZvrEHEeLS748B
 f60tjNlc9XgrCs5J6wQPEGZJJcqNXWledRb22U7avPjyWU/VVq/haVwxY81sNfYRcNPD
 x4aBo04jpJ0PINIfmFeRgGXlJ7pfe1f+T7WYiYAAlOqwBskKIJX/mMQV5VvQUPuqoAkE
 Lc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w7z+2gBVssBTwkTFXRrU+BRzNhXOykt+QfnboI/H0jI=;
 b=02WSCdSalmJvaXUdGrVtiyg3EUxADnErlvJO8k/zkiQKfdkKLnkUPeQZAh61lMEsnG
 mbRFIo5Dxocwqmhe4cg6nVBDypC6GUuMI18oGeo14Cs/iX7akY0ztjS1/zMdE968EeoR
 UIuxL5HrMUDKYFs2ayvud3Vv1aj/qxu+L9GqaJH1O0lUih4Rod5syIXOT1AW4h/FZQ7D
 bfCR/Tyro2fAd3js1gk364gfAkIPzozsZpY4mfiVXygL6dnjC8EWQJ1HLmW4MXGAfOwV
 UPUrckl3N3ouZYcVFLRdd0TNZYnxxKzvuIkehYtrStB/aqkNiesCq3vsJ9PLRO0NQg+h
 tHYg==
X-Gm-Message-State: AOAM532GEbu8eYnesM/QDM/pyRxZ/57SerXWDaLL0RtiqPDJ3v0kP1Qc
 0ziIpaCzP9x/X4Nk+vfABttfZoDMjv+aZH3WOcc=
X-Google-Smtp-Source: ABdhPJxlv7Aw10zN8xQzuLGYlYSw80uywRepza8MNhd5IsDpmmj58AVIlRbtUyHYQmY8fGDgmgQIrA0TXC+15SlWS5g=
X-Received: by 2002:a05:6402:5113:b0:413:963:4eae with SMTP id
 m19-20020a056402511300b0041309634eaemr10761037edd.197.1645562152589; Tue, 22
 Feb 2022 12:35:52 -0800 (PST)
MIME-Version: 1.0
References: <20220219170301.545432-1-robdclark@gmail.com>
In-Reply-To: <20220219170301.545432-1-robdclark@gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 22 Feb 2022 12:35:41 -0800
Message-ID: <CAPaKu7Q3CAcoyEgvo1KZnJCx6-EO+CPcARCtzwE9Ddbb_OZA_Q@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Remove restriction of non-zero blob_flags
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 19, 2022 at 9:02 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> With native userspace drivers in guest, a lot of GEM objects need to be
> neither shared nor mappable.  And in fact making everything mappable
> and/or sharable results in unreasonably high fd usage in host VMM.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
