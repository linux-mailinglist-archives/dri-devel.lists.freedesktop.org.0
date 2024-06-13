Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A529063AB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 08:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7066A10E964;
	Thu, 13 Jun 2024 06:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AD5Yv+k3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6DB10E0F1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 06:00:01 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-57c60b13a56so487361a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 23:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718258399; x=1718863199; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nWnG2dGrrgbgL9ZeXV5Mu+g2O4u2TjdcrStJDl/CUjg=;
 b=AD5Yv+k3yVjc9XS/FMCgiRSmlNjdBqoqfLqeQ+0JKMJCe6I3OApvYVvnn4e/4YGqZw
 iP1Bfqzjs3pfuPc6jdbZnuliYySU6IUtNXtD/M+9BmZmwWovVn3RdOQLIxslq/0gnPaL
 MadoGhDJ/D4Ott2eGJVOPUGS0u/pvoho8jHSb3jaAlQ5IhZcQ44vsvMLk/si2riKAouR
 gX9jGniwv0pC3rI45A2NJSym8v38oVXPxyAS0/uU6UOfNXvioEh/lweybdnaTQUDjGIS
 Yg4BM6mHyGu2Tjn/XiqRhRoaH7snMZ38Q5PvEYLRG0mKDV1kjk/p3fVCnKkcnIzSFSwC
 2Ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718258399; x=1718863199;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nWnG2dGrrgbgL9ZeXV5Mu+g2O4u2TjdcrStJDl/CUjg=;
 b=DBB5gS95FxtF/ALbu6bh/iYuoNos6NMYSOGahl1k6rKFlhFryVhsHAupTuGc04CVTc
 cQ1q9Ua7JmflVq18cpyN0QsSchvzQZW9o+fCIncv9mMxKXimukqdBaTtS370E7UyxFbv
 3e/Pk9rGJa+vpBRYwpsQJg34MQTCAq+bm2TorDrwfwaDjMQ1Dyfiqt1kfEuEW5u3vGA+
 S9V1PdNH3YOX35VxlASJ2bs1SExnqfhswlW79HCvnw6rTr0KXkcaFJi90PSoFKCRdSr1
 z6sacxUL3PSM2f0ygm1HqEVgPq9+HevkP3izg6YtzDSgIPD8uv/ZRwZ8x1KdnDzmrG/9
 Yv7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuDD+FdixHLrDI5qiP7N5IuGjYzV4xeSE9PV8FWcYFnjJSafg55LoXKff4lMCRZP6w6muKunYX893LsqEkWo4ArxN1qtOBXdJDwDj+E8kc
X-Gm-Message-State: AOJu0YzgQYJJFT/reg1FfTLQf/FjHV+qaSPpj1oyMbEH66x3Kep85u07
 ARzMbAB/v5hX72Xo0+hXigGpcJx6GlkLCHB6VDdjiXrQD7mwByKY7Y7iMDdNW3TnUxqu5Ft5Ruf
 jHyabzYSNPN9Lv1GpY61EtAYRDHA=
X-Google-Smtp-Source: AGHT+IH0OG9qyd00LdBTv8+rRHGyUAiVUe4orkj7si7X8bi4KbJlMnt+CdWMp5EhBKtval4VvqGc7ziw1ULz88BIn+A=
X-Received: by 2002:a17:906:c454:b0:a6f:55e8:b361 with SMTP id
 a640c23a62f3a-a6f55e8e638mr50647866b.41.1718258399186; Wed, 12 Jun 2024
 22:59:59 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Thu, 13 Jun 2024 01:59:23 -0400
Message-ID: <CAAxE2A7qK1-b5g1RR-GJ+QTLEr_OxEr9vcZGEOkZY9yLOFLb5w@mail.gmail.com>
Subject: "firmware/sysfb: Set firmware-framebuffer parent device" breaks
 lightdm on Ubuntu 22.04 using amdgpu
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 pjones@redhat.com, 
 deller@gmx.de, ardb@kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-fbdev@vger.kernel.org, "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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

Hi Thomas,

Commit 9eac534db0013aff9b9124985dab114600df9081 as per the title
breaks (crashes?) lightdm (login screen) such that all I get is the
terminal. It's also reproducible with tag v6.9 where the commit is
present.

Reverting the commit fixes lightdm. A workaround is to bypass lightdm
by triggering auto-login. This is a bug report.

(For AMD folks: It's also reproducible with amd-staging-drm-next.)

Marek
