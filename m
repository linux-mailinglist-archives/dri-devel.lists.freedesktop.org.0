Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DE3247FEF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9388189D7C;
	Tue, 18 Aug 2020 07:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E9C89B84
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 07:11:32 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id w9so14423500qts.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 00:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n3a7THydnGAc5AUiVljLET4u580OnrFmLIy37AEhH7s=;
 b=cSXYbK0KhcTVcj3BN3p2cBdYHCmnPysTZnSvj9ozXtLSA19RMMmA89oJO5/M1Xu2Sv
 Q2CmHVgmJ/KCHNsetwkfVKIzQFCyjKAUb6lnuLbq1xJpxHek2X/hnt5SkFX8hXQbF2Io
 7W9qXbc0V6MaWGjCotnlmRdc76WVPPRnUfJls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n3a7THydnGAc5AUiVljLET4u580OnrFmLIy37AEhH7s=;
 b=W1lo9jwZWqb6gp330Bj9urGU1InY7WC1Vn+JNenKhY+T8V7pJmkVxK3ZQNNZTzb7VN
 PEuaWxLfeJPEWL8A/t1j6D6jaCeIWFEQaCx0SLJK+NL1KhGlVWhiFPHa1oOcXhzwJu+N
 W+JrLQDfK90AweB4FJS6SfLwS5JyKmvVd2OUzJzZXQWT3ZsX4emqu0fcQAT96IcSUQt+
 4+mLXQLfNgnWK1seQljCYgs1AGIe5Ns6i6fnALoR1YYCTl6YsD8S8DgqnPKXYSouVqhc
 4P8STSTUPcQSyk9Aslez/xlo0Ad4JbBARobeW31TPMqeFLWJL3IgXQz52HjMt+SLobki
 9WlA==
X-Gm-Message-State: AOAM5332NHA5/apLb3arix1I5rKQwvyOrMm2OYzTlVlJ0a87gxjtYQqN
 w4Z9CTXSrC5zkc0WAz77PF1hpdpHk/SI3fr8/RgaRA==
X-Google-Smtp-Source: ABdhPJyZusOXlJEolyPUq2uzLSLnrLlZCeUK74TdElz/4gT5+YLKvVKLVDF3+1Btr0gUklkg9hbaYCqMSoip66/ILus=
X-Received: by 2002:aed:3587:: with SMTP id c7mr17004433qte.136.1597734691473; 
 Tue, 18 Aug 2020 00:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200818013744.3327271-1-stevensd@chromium.org>
 <20200818055949.6si4jzuubba5dx5u@sirius.home.kraxel.org>
In-Reply-To: <20200818055949.6si4jzuubba5dx5u@sirius.home.kraxel.org>
From: David Stevens <stevensd@chromium.org>
Date: Tue, 18 Aug 2020 00:11:21 -0700
Message-ID: <CAD=HUj5xqNE=7VPMH5MDq8h735-OnbancrkemJGkDKYmeddfNQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Support virtio cross-device resources
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Approved-At: Tue, 18 Aug 2020 07:50:42 +0000
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
Cc: virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Hmm, checkpatch still complains, full log below.
>
> IIRC "dim checkpatch" runs scripts/checkpatch.pl with --strict
> so it is a bit more picky ...

Ah, I didn't know --strict was being used. I'll send an update
momentarily. Sorry for the churn.

> -:250: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
> #250: FILE: drivers/gpu/drm/virtio/virtgpu_vq.c:1118:
> +       uint32_t resp_type = le32_to_cpu(resp->hdr.type);
>

For consistency with the rest of the virtgpu code, I'll leave uint32_t.

Cheers,
David
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
