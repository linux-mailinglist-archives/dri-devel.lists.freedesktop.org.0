Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134F0164D4E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 19:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C8D6E852;
	Wed, 19 Feb 2020 18:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE776E852
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 18:06:46 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id w4so396408vkd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Ip3kL9+qU9g1M5x9QMH3I8Pf6Qy+Vmmii2IIXak3Aw=;
 b=j0Q/0j4dVj0yYjdI3Zf3Ls6T71UBahzHyWfo6Fq9FAJQvYPLegdPxghkzE+6CIxq56
 B6N6YiWx1n1ndzNha2uYHd+K190Eq1MTUVmYZihlDRtW2ShE2a8zVwz4+RrNCCH9wK/H
 3n7w5ZkV/lLSCr8YNx1BDHY9YtW6OsIBDKeyHAQIqWIfWXJg25O+4KlL3T9DH3r74UfC
 MbCMpIUJYvzlEkVLoSvx1teo61ySyytEkdBx3CAD82s66nUVLEyH31mw2x55yOkB/FNp
 HQO7ezF8xIF6ryq7QoHJpTkMydXDaCp1AwZqTsrTL3ZuytM0grlqrxj4+GpEkGBd0Obg
 tD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Ip3kL9+qU9g1M5x9QMH3I8Pf6Qy+Vmmii2IIXak3Aw=;
 b=eTobjCIuGmD2muWDltzQVsO6+XNsVehaVEUM71yLq8luELTvWtyjvLQxau76QBcrxj
 b33MX6IGSSDtPJ2ORR65Id9NkaJw0u00ZW6QRsLbWOiLMQndLygfdZs78SsLbO4/qI0J
 b06GYOWontINrULIVFM1Ha8Au/q7mntClCs1L96TTkb3j7Yq2tKaax+0kCvNmL0h1VHh
 iWMKSDkaBOvjs65FoVF2pFHyeTfykaqGz3E9eH7Oe2J3nrWey3c8ZWbK3QfCrejckN1+
 ZlECHM5VEnEchT4o0Q6SssvmGwVFfGcm4cH8nd6In9Zp7QHovSmbTzQgYqviLwjA1N0B
 wqeg==
X-Gm-Message-State: APjAAAVu+OYZbX49A4BBzNqym9t2mFiMVW8KQQq0NpUv6KxXNHd3oA2g
 yapQSQnD2lUBneM4bVVU6Iq9YZ8q8U89gTOL8KI=
X-Google-Smtp-Source: APXvYqy5OzekTt6uYOs4b2d7J2b222wiKRHU+2jtq5IwS/42sOhlzLqHf/5WOB1RXM1IGd2Q3wCtcdUorTefaSO88j8=
X-Received: by 2002:a1f:264b:: with SMTP id m72mr11826352vkm.51.1582135605341; 
 Wed, 19 Feb 2020 10:06:45 -0800 (PST)
MIME-Version: 1.0
References: <20200219175640.809-1-gurchetansingh@chromium.org>
In-Reply-To: <20200219175640.809-1-gurchetansingh@chromium.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 19 Feb 2020 18:06:36 +0000
Message-ID: <CACvgo50+CK64m+7tk9Nrst=527OL-ydcfSjPAg3+Yauf5TjXzQ@mail.gmail.com>
Subject: Re: [PATCH 1/5 v5] drm/virtio: use consistent names for drm_files
To: Gurchetan Singh <gurchetansingh@chromium.org>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Feb 2020 at 17:56, Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> Minor cleanup, change:
>
> - file_priv--> file,
> - drm_file --> file.
>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
