Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1DD3C4657
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 11:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C2989BF8;
	Mon, 12 Jul 2021 09:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B0589BF8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 09:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626083243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OsAxr7I5wY3GHXnm0dzu227J/w3T3hi+AUx2iyLrph4=;
 b=hoOOZaDFoDeDufc96XIesBMTwIiVX4TrDGz5w/Mw4CTSJl0cw+F1K8YFFQQAYQ9iq76LC9
 /EC79mcOYw+EId3lfYtxSoVU3JXMxeLDKzUO6khSm9iuC2QFUUL5X8np+wJiy0X2gxCJT+
 8XJuORmh0gQ/fu23dSC4yJVBMeLUPIo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-48Qo3IRbP92q0zrIa36HYA-1; Mon, 12 Jul 2021 05:47:20 -0400
X-MC-Unique: 48Qo3IRbP92q0zrIa36HYA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r18-20020adfce920000b029013bbfb19640so5367408wrn.17
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 02:47:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OsAxr7I5wY3GHXnm0dzu227J/w3T3hi+AUx2iyLrph4=;
 b=eA+YVi4ROI1HxqM/+TEIgPPueWjIZ4EnciFriUtihtwCYA7YACnYq6fklGUIQRkemx
 9tu4yz7HF1iOa2bK+Of5qk/k/H8PX3DHG0BcbrCer1frY1E+46/A6hLIJIakCkktJei0
 mqTBHnHj0lUzkYWPJOYr4vXideNUhxp1p9EHRhxrSdtufP/BJhDH/dDkB2sA0xP+AG8E
 EnlpUITV6VtvXP3tiqKV+k3OQRJef3ZoWNHL54Rj673Sa8pslMd5WiHjUZNZU356Cuhl
 Z0/RDivSVaEfgIwaqHA+ib8YtFi825BgRtkei2ncmwTRNo0mmoSSgEPNAsFUWfvJH/px
 sngw==
X-Gm-Message-State: AOAM531YO/HH/+mLvq6eeJWknjTtDmjwKshIJtBftDkjQAwTPJzV793y
 MrXu1pKI35HCNOww5E2TUDFFOYz8aBXFUU5TrykhGBBk0W+VfKHbFxpBMWs0BMcPG7q+2e/KNM8
 PqY8t9z/t7VlNJDlXh6Llwb4RAInAmPXkPaTMrk6XXGRl
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr23662124wrn.113.1626083239347; 
 Mon, 12 Jul 2021 02:47:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3sW8UYSOM/Q6qgJACh2S4VICMKyF4ZwsV6v+fR4fftaOEQT2tUBbmhmNCwT2qSaSR3qFgvPBKqWkCA/b7Jp8=
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr23662105wrn.113.1626083239204; 
 Mon, 12 Jul 2021 02:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210703072502.646239-1-gushengxian507419@gmail.com>
 <anhfX5shNJsdNd6vWMeQqNTawyT0AGuoZYI7yRItB-il7fywDu9_Ie1kKL7Wwv2ecVxiYaoymsZHpufnuxUBqvja2uq0_t-Qmhhc4uHT5f0=@emersion.fr>
In-Reply-To: <anhfX5shNJsdNd6vWMeQqNTawyT0AGuoZYI7yRItB-il7fywDu9_Ie1kKL7Wwv2ecVxiYaoymsZHpufnuxUBqvja2uq0_t-Qmhhc4uHT5f0=@emersion.fr>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 12 Jul 2021 11:47:08 +0200
Message-ID: <CACO55tvmvcrAHjFjJ9fMgcFspyfMLE2gR7f3Fxe0_cxxrfwaUg@mail.gmail.com>
Subject: Re: [PATCH] include/uapi/drm: fix spelling mistakes in header files
To: Simon Ser <contact@emersion.fr>
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 gushengxian <gushengxian507419@gmail.com>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 tzimmermann@suse.de, gushengxian <gushengxian@yulong.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 3, 2021 at 11:00 AM Simon Ser <contact@emersion.fr> wrote:
>
> Reviewed-by: Simon Ser <contact@emersion.fr>
>
> But this this touches a lot of different drivers, not sure we can just
> merge this via drm-misc-next?
>
> In any case, please ping me again in a week if this hasn't been merged
> by then.
>

As long as it doesn't touch code I don't see why not. Just in case:
Reviewed-by: Karol Herbst <kherbst@redhat.com>

