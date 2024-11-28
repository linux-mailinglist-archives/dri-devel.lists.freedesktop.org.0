Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B91E9DBC42
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 19:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E708910E043;
	Thu, 28 Nov 2024 18:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="vyeuwRg0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7249810E043
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 18:48:07 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5d0aab1aafcso1124a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 10:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1732819685; x=1733424485;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5xs+vKwSa3JiKap3g98aPZvBAulBU+N6Fw0e4eCInw0=;
 b=vyeuwRg0CdDEXqqHhSnp+VnynLdlWPgMo3S/upCTBU3FnwMQzFf3+tJOCMn+E1Vk26
 4QhLDGIieAGJB+2b27qPN7gzSKiG1kntzDxQf9xdbk60VtI60TZLnKS6ZiHZmlLBsYVI
 zNXzRWEMKvc9QHpmaCORpm6ksO1imjIbMgL5ruEquhbDGxXZ3uGvVU0QZA8c812+niHM
 J31JLUI0WtNcGe9KnDNpnUbv/dNIP2Vc7xCH4r6Eo2oHxEuDrH5u0RsoWHkT5CTQqlO+
 o9dOq5VgY96ylXNhXc66v0IEc1QSmzfk3CjGJdvCjADo+tmDHb0VxgaS17yVyBQvOM8/
 ptmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732819685; x=1733424485;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5xs+vKwSa3JiKap3g98aPZvBAulBU+N6Fw0e4eCInw0=;
 b=bHWKWHLWgqeZg4efz1FfMrf9zD/3Q1MjcOTkfI3zIXZqBo1bBCNStyZWfI9OTbphTe
 J5GL45SEru5mvdrIHLM2qtbaBC4o/jhqaCMmawPQ1wN+tW+vYL7zL/Tlgh88B9dBju4W
 W7S4jqFBxOIn4kZRfmqGnaiMs7jmObSRI7UZIdcuC6KhrmL1uHnKGL3qtVXvnhN7EUUj
 hc4/WZFcAoonerH6/6sI784kQjpsJXF3/jB9dwj8lu/Xt/k81vZJeKV1FB0YdNEFXt86
 xyZ5O1QgaNNta0poBdq2ennvQGDOpUJVrz70wv8YdOIBAOQvhukLa91uxtNj1VCzvvca
 VLvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlsbrHubYDD1+SsrGLBpTZtIyZNxdECrX88dutlCFb3Y5dFJsTe4TfWSaPmG+yIoF29Y+KdMCPj1g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKh/JDjLwwLcxJyfkYlS1uYTC3z+Q3JePzvtxjSHmUkzeCm1eM
 Me6rm/iRsCOlHopCnuJk0TiUjOfAvqQRJzxpzq5mEITs0dszId8f5vgYl6Kd7rSACEo5NGgr7G0
 7rbkd8j1xyxyhGO01/ly29xJIwaYSledImFvZ
X-Gm-Gg: ASbGnctRGXOwNJmx32mlIvPZfIjaAhASJzCyvela4vbiQESlxQP2cfkYf8Qk11GEOOd
 SM+TzGzYck7i/QgmaClqCUw6yLNP+yR2ziHMHXZ2G0brGPJ6dNPHMUXscmBo=
X-Google-Smtp-Source: AGHT+IHv+CFmhALmeleQJMbXzCGRRaZ6P4W4G6Gg+Nwi71T4O48fEdmyiN5zz0CfNxaHnX7u5TlkUhgllkJbjdl6nDA=
X-Received: by 2002:a05:6402:1cb7:b0:5d0:84a6:f1a1 with SMTP id
 4fb4d7f45d1cf-5d09625061amr80484a12.6.1732819685106; Thu, 28 Nov 2024
 10:48:05 -0800 (PST)
MIME-Version: 1.0
From: Jann Horn <jannh@google.com>
Date: Thu, 28 Nov 2024 19:47:29 +0100
Message-ID: <CAG48ez0w8HrFEZtJkfmkVKFDhE5aP7nz=obrimeTgpD+StkV9w@mail.gmail.com>
Subject: udmabuf: check_memfd_seals() is racy
To: Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Julian Orth <ju.orth@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Linux-MM <linux-mm@kvack.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Julian Orth reported at
https://bugzilla.kernel.org/show_bug.cgi?id=219106 that
udmabuf_create() checks for F_SEAL_WRITE in a racy way, so a udmabuf
can end up holding references to pages in a write-sealed memfd, which
theoretically breaks one of the security properties of memfd sealing.
See also the discussion starting at
<https://lore.kernel.org/linux-mm/CAHijbEV6wtTQy01djSfWBJksq4AEoZ=KYUsaKEKNSXbTTSM-Ww@mail.gmail.com/>.

I think one possible correct pattern would be something like:

mapping_map_writable() [with error bailout]
check seals with F_GET_SEALS
udmabuf_pin_folios()
mapping_unmap_writable()
