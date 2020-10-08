Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD506286D3E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 05:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E598F6EA21;
	Thu,  8 Oct 2020 03:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF876EA21
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 03:43:21 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id u8so4871533lff.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 20:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=0yEADBg3rUn/eSIy/c23DF5FgmPZN4bfUDLh04iLxdM=;
 b=EkzFglKMNTKjx5JDT1/eoLA3aOqZA3G1hibiTVij9zD3CQpd25URGQrelwL4WebAqn
 SXgzst5OuQTY4EruPp/n0+v250tMvqg0AOf1k24D9Vl+Pif7o7ovBbkwutbEVyfqhYbv
 bOswqbdZKRAvnxN9N4KE8RV2/IipUdTcRYqbj02VgxVBAFi9NgBvlDQOWWvPdhamoke0
 13icqt46iNmBFXq8jeQjE+qlUTZUbRFc6fPu0y5C4FDz+F6x3wX0usN4QmLTVCKoPcjT
 xle0VNBzXwQtlw3dey2840URtHuxzkZ+/y5iuj/S6oy1RRjbKSbg25+mHuqNqAH7z7cP
 XX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=0yEADBg3rUn/eSIy/c23DF5FgmPZN4bfUDLh04iLxdM=;
 b=dR+E2fQocw5hPWWXCB6euyy/X0eTwLRtzP3bSoWM5uWRD2JQS4jSc1mKI8EzSdI3Ko
 k6b7HfU2AwYr37pP6u7zmGQqbcGxLW9lcOcvnQvmCm7MWgzug2yHMgEgPFYWaElpU8qu
 y9KL9qGGht3PSMhKseYe8dAdnJvGIg2F+bk11R7v2/bflNsjR7s5GDrUKTFq33WS+Wrn
 J6PYBRV1orsBz7jk9sWtAv6++b212rjS9w5z8OAEn7WN7l3uri3s9nOaZOLTyChoxASc
 MXdL3LolWoYeJBAWDBeJdOHj+QxA0MwywABiAXLzJGOm1RSeCZgGcptDacwcZJeo+RmL
 o8MA==
X-Gm-Message-State: AOAM533kc4BYQBnd6tGoW0XGnYrTR6MF8WtNNF2n16GzjB9k9R7y3osK
 Yy6xvuvWuXLDjDwVWQRDlb/hSjGVJXO1AeZojGw6R4s4ccM=
X-Google-Smtp-Source: ABdhPJxJlnS5Wp1TkSuQRym3eDGM0qPjoOJ/FYkdp1jniSFznXS6XR8WfyAUx+FNmlQCPmbgn33Jr9NGks2ptr0F2T8=
X-Received: by 2002:a50:e08a:: with SMTP id f10mr6999834edl.220.1602128170440; 
 Wed, 07 Oct 2020 20:36:10 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 8 Oct 2020 13:35:59 +1000
Message-ID: <CAPM=9twbVGe96YNPCMMRrXPJhCoLLbhqtN0DjdTJcqo52OoLCA@mail.gmail.com>
Subject: [git pull] drm nouveau fixes for 5.9 final
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Karol found two last minute nouveau fixes, they both fix crashes, the
TTM one follows what other drivers do already, and the other is for
bailing on load on unrecognised chipsets.

Thanks,
Dave.

drm-fixes-2020-10-08:
drm nouveau fixes for 5.9 final

nouveau:
- fix crash in TTM alloc fail path
- return error earlier for unknown chipsets
The following changes since commit 86fdf61e71046618f6f499542cee12f2348c523c:

  Merge tag 'drm-misc-fixes-2020-10-01' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2020-10-06
12:38:28 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-10-08

for you to fetch changes up to d10285a25e29f13353bbf7760be8980048c1ef2f:

  drm/nouveau/mem: guard against NULL pointer access in mem_del
(2020-10-07 15:33:09 +1000)

----------------------------------------------------------------
drm nouveau fixes for 5.9 final

nouveau:
- fix crash in TTM alloc fail path
- return error earlier for unknown chipsets

----------------------------------------------------------------
Karol Herbst (2):
      drm/nouveau/device: return error for unknown chipsets
      drm/nouveau/mem: guard against NULL pointer access in mem_del

 drivers/gpu/drm/nouveau/nouveau_mem.c             | 2 ++
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 1 +
 2 files changed, 3 insertions(+)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
