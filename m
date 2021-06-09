Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5D13A18C5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 17:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576846E0FF;
	Wed,  9 Jun 2021 15:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BE76E0FF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 15:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623251571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JMREyP3JXMVmWCr80yCkQOP9jgymsdlFzzgGHyBeU4U=;
 b=S9VkDTdbbAcQRpPvQrcsIXIQzoilbnhQ+Sd8xQv8g/cO7m6Xx4P4x6ll257wHi8dswrxGS
 FjuIbcQRM35CPb7JUAqvAlRgB+SaTbcpkUZ0q6UHKfkI8zRilHCvuh2Ap2JVrd0rNCv0tM
 GRAWC8Q+RHa1dthtwjY6M2N5OLM+jy8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-W71fEuaNPWivDc6r5HyU_Q-1; Wed, 09 Jun 2021 11:12:48 -0400
X-MC-Unique: W71fEuaNPWivDc6r5HyU_Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 k25-20020a5d52590000b0290114dee5b660so10923573wrc.16
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 08:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JMREyP3JXMVmWCr80yCkQOP9jgymsdlFzzgGHyBeU4U=;
 b=qpKH0Z8LdrpH6y2iF9oI16wYpzXaP6iV41TJVgDn5Rg/j+R+v/hrDCcPMrOUSAGjdx
 1J+bP0vuqHUYMaUVrgmh6Zd4ei1w3rEKNKclAq8m695+zdn137/jZUUztJlWKUBSiwZw
 pW9dOA+f9OG4PYvjuzUFcC6Dgllnc3ZKSiShcoKhqLlbSfnYEzILkzOlwvwWE5OwZ7ou
 RWKNHJ3O6dHgofb1ZzPYNdXgJV9AplFXQOSRbOjzjrH9zILdnny7MOZOSwfYLcv4vJYL
 ehn3HFHwC37xWbHPaNPJTd5unjap7FL5RNuU139lJI7M0w30T2yGXoEzyZxVDQGtgJHn
 4AOg==
X-Gm-Message-State: AOAM531dxtSYT7l/KXiqVTTv/0/ELUlXoFF8hI1OlAr0lpDdfwiKkxoc
 5g/dsfTV31blBf1mEiQAlBW20wPfO2n3ZKWwZF17YtXIn7AVh7nGCL0gpCdsjMBuSO8SgEmwmna
 RhFo628igLlRdI3wYqEboUh7WdbkWH4A0bwph3Jcm+RU3
X-Received: by 2002:a05:600c:4f90:: with SMTP id
 n16mr10279288wmq.139.1623251566859; 
 Wed, 09 Jun 2021 08:12:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzP/57SvqEpC29EXzMW7a0xJ2z47/4rc95Texc/KFmFmXC3s2mnwQ6QJRK6ZzJBeVqEs4vPqneIDdp2sjzuc/U=
X-Received: by 2002:a05:600c:4f90:: with SMTP id
 n16mr10279268wmq.139.1623251566705; 
 Wed, 09 Jun 2021 08:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210531031029.4642-1-alyssa@rosenzweig.io>
In-Reply-To: <20210531031029.4642-1-alyssa@rosenzweig.io>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 9 Jun 2021 17:12:36 +0200
Message-ID: <CACO55tuo=pJMOc3NRbucs=+Tm7afU9kEsYqxfSDaY=NctuifTQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] documentation: Update #nouveau IRC channel network
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 31, 2021 at 5:11 AM Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
>
> Like many free software projects, Nouveau recently moved from Freenode
> to OFTC. Update the reference.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/driver-api/thermal/nouveau_thermal.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/thermal/nouveau_thermal.rst b/Documentation/driver-api/thermal/nouveau_thermal.rst
> index 79ece266c..aa10db6df 100644
> --- a/Documentation/driver-api/thermal/nouveau_thermal.rst
> +++ b/Documentation/driver-api/thermal/nouveau_thermal.rst
> @@ -90,7 +90,7 @@ Bug reports
>  -----------
>
>  Thermal management on Nouveau is new and may not work on all cards. If you have
> -inquiries, please ping mupuf on IRC (#nouveau, freenode).
> +inquiries, please ping mupuf on IRC (#nouveau, OFTC).
>
>  Bug reports should be filled on Freedesktop's bug tracker. Please follow
>  https://nouveau.freedesktop.org/wiki/Bugs
> --
> 2.30.2
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

