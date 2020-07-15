Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 793F422159E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 21:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634056EC07;
	Wed, 15 Jul 2020 19:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E036EC07
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 19:56:35 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id by13so2559594edb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 12:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gPITErv6KI05OD3QxA5aGpy9RSVnEjDbhKuLUZ4mtAo=;
 b=Fh1bWetl4XtGry652nhxG3UeDto0iAmUGx6h4DegZlfobZ6XQi9dEwRmMI9dkjDzG6
 D7C5dLx0TJZ3dwmp7JikPDsce8HxNp3c4gmyvsfVrKmwYSQQeibQzqdYGxw0OS0Fi0fu
 1nVWI6vjZ5KPUSLNls+6oA1nTaFc8Bc9UKf+YGgo/k7jEhGAlNM44SW5EONTyY/kIIAX
 4IEVcXWc9bohYWViig6xEqgYBoKBvUkR+ks/kEIz1bRSxJ5p1uH1QE/oejb/XbMGqUWA
 mlhEqggZqY2LiT1eTfVjbT76Z+1A6hYZazqSa5PCUfnFOgNSAiv7DCu+c0JXyogSTzb4
 baEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gPITErv6KI05OD3QxA5aGpy9RSVnEjDbhKuLUZ4mtAo=;
 b=ZXQSOnzJPGjdqE8Kx0p6ldJbM4mcQKHl2D8/ypdaJEq32ji/6B7uF2y7Yv37wQjH45
 31R3vVVdQcv2ScNG/NVp11XdxfdHYKcTUsVy1p6Dz6c9iH3+/BSi4O+1jIDgMV8YSixP
 YFbC4Kj0Mpq/AET1MMLv7Yrfe7Nm7XAl+z5CSI9NQTfgFzKLRK8Bqs04fSUgJ8VatIbo
 yBxw0k2asVBC52Xi4gN8BMgFe1+3DJOYHns5hjezI8AEqfLJ2E2f0rgRBr0nxmD59mpo
 dxhK17EIsT3aFILtW9tJV43hi2P4jNmn5E+eft4TGjMY3vRUdK76sQGS51oCEP5hCsoc
 j8+Q==
X-Gm-Message-State: AOAM531yIXpbVxewY3nmdyFeDa4qQH68yzRel/I3CwVkZ0VMu8qhgR3c
 TqPwGQx2Xp34zWjjxxmyBF30wRQWKBVTaufH9rw=
X-Google-Smtp-Source: ABdhPJxQhL5tpQWH130NxqMcp/ESCmh05X/mdIJIJp5yTiEosxuIBlCmwzAsosvIdn3O1WQ6GduNCMMtn/8/3flvsv4=
X-Received: by 2002:a50:fa07:: with SMTP id b7mr1235895edq.298.1594842994144; 
 Wed, 15 Jul 2020 12:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200715145902.13122-1-tzimmermann@suse.de>
In-Reply-To: <20200715145902.13122-1-tzimmermann@suse.de>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 16 Jul 2020 05:56:22 +1000
Message-ID: <CAPM=9tx1+cNHR3aYWFNey9veYn18A=b1Tgm9Pa4UvKjUSFg22g@mail.gmail.com>
Subject: Re: [PATCH 0/8] drm/mgag200: Support desktop chips
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
Cc: John Donnelly <john.p.donnelly@oracle.com>,
 kernel test robot <rong.a.chen@intel.com>, Egbert Eich <eich@suse.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Jul 2020 at 00:59, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> This patchset puts device initialization in the correct order and
> adds support for G200 Desktop chips (PCI ids 0x520 and 0x521).

why? :-)

I'm pretty sure I NAKed the previous version because the userspace
experience for these old cards was probably better with
xorg-x11-drv-mga, but hey maybe it isn't anymore and we should go
ahead. I know SuSE use these for testing, but apart from that do we
really think we have any users for this?

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
