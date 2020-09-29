Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F8527D31C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 17:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001536E507;
	Tue, 29 Sep 2020 15:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0406E506
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 15:48:52 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z1so5991093wrt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 08:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fR8KuPr8iJhbK+ragO8SvqMFit9K8ZYiP1H85F2xoVI=;
 b=NFjupw6QPB9ND6RAfW+OilzqxHWTXPuY3W1q9+22IWi2YqBvZsPt86vMNZ++RiNme1
 DYdgLO2qc0q+0x6TTRmqmQ7Tg0K8aFmyW5IfFd8sJYWiZsAyfeS4P2KVhOzIGYb6tGN6
 E9rw1KYN64bvG/w65eiez2itH9s/VgiciFrc7WzQkLGizPpteaewyHEDeFLVuxfi4Xfw
 i1u57SZSIm6CAgSv6+34Re8gX980Y6DueLMFf312zNUQPYqMmVfBjGvAr+71KHsX632z
 z58VSr93bekikXil/EYpapCUG4NTKFjv5ibND1IZhUZ2X+oqHja4sOciXHOWHB8OPxj/
 9lVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fR8KuPr8iJhbK+ragO8SvqMFit9K8ZYiP1H85F2xoVI=;
 b=tMp24GcM8lIFLG9X4UY7a3RQUVAq1vIeflKSpldUSiAlKFvKfJPr3pI6l0ZBn86upz
 AtoAOhCz4N2pPDJYqJ36SqY6etNI+vtsM+U2gJjPXcBOkGP3X4OhOki5L13AhrQCP59O
 zsVqFtEkzuQkii6kD2SnGU11wUxc0Di18Avg9k0rH+PermoR9cH1fC2IP+Mw03y8TGMS
 cmFsxqlxAeUhiZNKtvcBzYSBbrwHVcD0SXZsnVJaG0QoPP4YSxtJUt99Idn8DSzX1iuQ
 06/98giUJDOclQzUGw4TennHUYrxycIMbwJNSE3qA5dem/qBgiSAP0GGvWNWTs8g/TJy
 q7ww==
X-Gm-Message-State: AOAM532cLAJExJCBSuVndeoZnUx7PYP5YS59kASdbc6nBy4MzAbiBJbn
 OtT4SRX01NZAdGIP+NPtr0eJhVOTQ4QriyiU/OieoA==
X-Google-Smtp-Source: ABdhPJx3EgrxpMEQwzhYaOq9nGmOfOHLK42KHSZJHAiteRM/BsUMzjyJYwBNjBbq8Hv+lvkbEShwj614To8hOvG0i/k=
X-Received: by 2002:adf:f78c:: with SMTP id q12mr5132530wrp.6.1601394530578;
 Tue, 29 Sep 2020 08:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200925084651.3250104-1-daniel.vetter@ffwll.ch>
 <20200925084651.3250104-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20200925084651.3250104-2-daniel.vetter@ffwll.ch>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 29 Sep 2020 16:48:39 +0100
Message-ID: <CAPj87rMY+A16uPxpa_xv8pTpF3hi5Zwn5CUH8U0X+RVKjii9Qw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/atomic: debug output for EBUSY
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 25 Sep 2020 at 09:46, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> Hopefully we'll have the drm crash recorder RSN, but meanwhile
> compositors would like to know a bit better why they get an EBUSY.

Thanks a lot, this is super helpful! Both patches are:
Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
