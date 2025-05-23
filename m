Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C511FAC2BB1
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 00:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE8210E186;
	Fri, 23 May 2025 22:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KiACof3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8417610E186
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 22:15:36 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-602c3f113bbso676422a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 15:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748038535; x=1748643335; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=y2BCrrZcBFm32iNJbAlwuWT4RjrO8k1g2FtTBOuY0/M=;
 b=KiACof3fa0KjhNalIButsgy28qhb5UdHh7hrXfrzM1BYWlxiemNfEZyOyivAmqisb9
 F54goIDcIDJHPiWiwFxkrUvabp+/A03OqG3X9IT4rTAlvHmI59miZ0Ahsq3GVlV3bysi
 MRf2NbSneGzVGjiB4vMo2fAgU1kNVPgRmIpkEQTxFON6oQEaYINRjd77YkV0AeGL+u8q
 d0VCTtBC/NRV0CMN/x21QVsjkX1juzCdi0S7MQsRgTy5Zmleq55tU0oBzASpDFv/SNZI
 TsmSU3Ir2u4UMLHD/BhIheISgQuYCYi6ZTXNFaoEmf2+yW6vz5ftEHWanzWfAlUz5vp1
 RNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748038535; x=1748643335;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y2BCrrZcBFm32iNJbAlwuWT4RjrO8k1g2FtTBOuY0/M=;
 b=oGnWIaa6zV3OVRQxDybRCBe8JEyIYqjogAgJ0XF1mlvMcdZl8UeAwbobN4PYveAJBd
 Whoh4Kho050bkqqLgkS6FN05oVL3DdDiq4hZ7OOYde3HOGMPvE33+ROhHs9dgs/cUn1z
 Z3UANxuu5gEXIrTg3SwowvZzSrXDSC2BrghhngfA8a+n7oUk4s4+Y5UXS4mnJOBdEMnq
 QnEgqyVt2rJHnS+AT1dcutvmm/VFI1NIUov7jM5D71ebjuvBobf3x/cCfYorh8LZpXai
 fuT5uPrDl7ReOpY0y8Uowqyj4stW+RmI+N4PwviQajnl4t48pBkaV/teOeT8/csbiOPB
 BWwg==
X-Gm-Message-State: AOJu0YxPec2rPQ0ZJthpimuq0JRShZgrfWmM//uTopg8e9aVVE7FSNr7
 xYRzxpS6y45ZylBAEbZ5wlRI22hCxuA/n6RhRekVG7R2EaoV+50+DJla8iHes/mmUgnxBzCHilf
 wZbzA0N2tJlyrl51kiPlNfUZb6kliSL0=
X-Gm-Gg: ASbGnctTmmeoyfgHNOr4+25xI4FqakHG0ILGCrWIpFOwezR3eDc1wmm6S7gfniRO5m4
 9RsmrUE5k03Nf6PhYgT1aMxuE/stggYYLUfMMmDmiPYCM+/9TB98rmlQAD4ib3zbcODBR5BURWj
 vbFIemNVH90v/s7IriZeL/LtFicpaFX3w=
X-Google-Smtp-Source: AGHT+IEQqL0ERYw9B4VO9729NHhCXW4sq6epvLnt0hryQqzUio/Oc62ldk/dicuEsPaIALs2BTn3O77IxRizJlxCvcI=
X-Received: by 2002:a17:906:f595:b0:ad2:48f4:5968 with SMTP id
 a640c23a62f3a-ad85b1bd264mr69246666b.25.1748038534793; Fri, 23 May 2025
 15:15:34 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 24 May 2025 08:15:22 +1000
X-Gm-Features: AX0GCFv8VKzmsUPytk0CDNUuVV8gKHAYNg4SR8dtz_S6vN9SwQeuxhYxkLm84_o
Message-ID: <CAPM=9twqWSXu3sU+f7Z5WvnZhppvg2G4NkDkSRL8y02k2p+EoA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.15-rc8/final
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Hi Linus,

Weekly drm fixes pull, on target to be quiet, just one amdgpu, one
edid and a few minor xe fixes.

Regards,
Dave.

drm-fixes-2025-05-24:
drm fixes for 6.15-rc8/final

edid:
- fix HDR metadata reset

amdgpu:
- Hibernate fix

xe:
- Make sure to check all forcewakes when dumping mocs
- Fix wrong use of read64 on 32b register
- Synchronize Panther Lake PCI IDs
The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:

  Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-24

for you to fetch changes up to fe1e5a1f2d1c2d4385a414dacca0e5275c0af281:

  Merge tag 'drm-xe-fixes-2025-05-23' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-05-24 07:42:23 +1000)

----------------------------------------------------------------
drm fixes for 6.15-rc8/final

edid:
- fix HDR metadata reset

amdgpu:
- Hibernate fix

xe:
- Make sure to check all forcewakes when dumping mocs
- Fix wrong use of read64 on 32b register
- Synchronize Panther Lake PCI IDs

----------------------------------------------------------------
Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2025-05-22' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.15-2025-05-22' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-xe-fixes-2025-05-23' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Mario Limonciello (1):
      Revert "drm/amd: Keep display off while going into S4"

Matt Atwood (1):
      drm/xe/ptl: Update the PTL pci id table

Shuicheng Lin (1):
      drm/xe: Use xe_mmio_read32() to read mtcfg register

Tejas Upadhyay (1):
      drm/xe/mocs: Check if all domains awake

feijuan.li (1):
      drm/edid: fixed the bug that hdr metadata was not reset

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 -----
 drivers/gpu/drm/drm_edid.c                        |  1 +
 drivers/gpu/drm/xe/xe_mmio.c                      | 10 +++++-----
 drivers/gpu/drm/xe/xe_mocs.c                      | 11 ++++++-----
 include/drm/intel/pciids.h                        |  4 ++++
 5 files changed, 16 insertions(+), 15 deletions(-)
