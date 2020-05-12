Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548961CF230
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 12:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781DC6E09A;
	Tue, 12 May 2020 10:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB53B6E09A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 10:16:51 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id a7so4529741uak.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 03:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eD/fxPgbRazpPuKEYKmVFpAaQ+Lts7fC5ruqKYqtzWI=;
 b=gYoJQp8ortxiwAMQ8esa67zCWRtmd7zu2xfVy1BmH6T37/TDmhKRc/DJ+JEioF1pQL
 4JNyGyOnbrwVezJscFsZRsYxMXUUsuqqJDB80JfmFvezyzWFlwq50uxV28acple1Xa+1
 ChEE4tnoYQdDgV6+6vBHGdOyEYL7ENzH3f9ZvHgSuVodt4rb3O65B0lB5InTUtTbIou0
 QcPA3Ye/SFL75zQIlZH4PTp4vNOKxp/53eKUgXJWKGmaLnXBQ7M1Qbx/YDwjBSi4NM4G
 I+3WqLZSB9Xfr34lsq+L14OgmmLGBGq6nneUWAbwUMuVEvH7N1NVCZf2KFKgKYQfjxqm
 F6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eD/fxPgbRazpPuKEYKmVFpAaQ+Lts7fC5ruqKYqtzWI=;
 b=haGJDHNZsPvNQhKgrW45rCvJ20VhGqT8d7fH4Qzb9etExDpYlNST6052mnHAFAVUwL
 nYdFLsGrthoLdCYWZ1vKm5j3GAxZNC7k8vSQp39KDqpwNPT57WOlxpW0MhYfS7uZJ5gB
 bvO+VUvsSLvIHpXGzDoDMpR9p8KYDUXUxfSUNKgxgZbO3Sy8MGTXrEqFhBDlSfRjxcU/
 BUit+Pa3yMbl/gfF3wSoE7Wzam5VMehKsnsatj37BI8H2jx4ofYo5C0/tBXpOW/uWSiL
 h54v0QOxqazyYumTqXsRdytBTLtxMKC9thxxXNK1K2hCMUJNwAT0hfdc3h0P+27DC2S3
 hjYg==
X-Gm-Message-State: AGi0PuZVJuACID86oj99n6A/zhZeR3uoIvYVNPKwJDne3u/k49Eao2j5
 YSovLIRVcjoAVRDBp3y0bWTjdJ35ho8t6JQ75Zo=
X-Google-Smtp-Source: APiQypLYVbnljZIPlnM/Y82nzMXIl5VAIA7Uxw/LVqrPpFEx/aYFLFiyOnPeFDTcZF677c0V6gEhXTuQQ3J+3L5E/Y4=
X-Received: by 2002:a9f:2188:: with SMTP id 8mr16407801uac.46.1589278610824;
 Tue, 12 May 2020 03:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200512084258.12673-1-tzimmermann@suse.de>
 <20200512084258.12673-13-tzimmermann@suse.de>
In-Reply-To: <20200512084258.12673-13-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 12 May 2020 11:14:12 +0100
Message-ID: <CACvgo522zu525bZX=s=h1AeTAFbbAVsWtFLwgt=i0uBORb-oVw@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] drm/mgag200: Remove out-commented suspend/resume
 helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: john.p.donnelly@oracle.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, 12 May 2020 at 09:43, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The suspend/resume helpers are unused. Also remove associated state
> from struct mga_device.
>
Although DPMS in it's traditional sense is no longer a thing, would it
make sense to keep this around for documentation purposes?
In particular, the pci magic and associated PLL/DAC/pixel clock could
be used for dynamic PM.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
