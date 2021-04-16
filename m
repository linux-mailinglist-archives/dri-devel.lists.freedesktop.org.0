Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45569362115
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 15:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466616EA1E;
	Fri, 16 Apr 2021 13:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6FC6EA1E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 13:32:49 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id n127so2539163wmb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 06:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:mime-version
 :content-disposition:content-transfer-encoding;
 bh=hrzLya89eEvpFLZLKBl1cD6X0iqxPFh++vX1H4RxaPM=;
 b=KxsQ4CAq0MNzNH+pcQeLYmwQIhyKFLbE9/bbDboSLCN8yc3a3UHmYbYXnSL0PBPseb
 YXxTBITODTzMm8AsFRaxzNXxiQD8LrvI6TIpfnYn+4QcMVXfBLUAy4eYaQslh3TZxmHz
 XsBYQmbpf5VGRlgKTQmKm1adZhCBiks8c4TB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:mime-version:content-disposition
 :content-transfer-encoding;
 bh=hrzLya89eEvpFLZLKBl1cD6X0iqxPFh++vX1H4RxaPM=;
 b=LDsJxEXe7723g91vw+SmZ81anieH/TP/2un7OT3jKONZYgNjJb26fUUzWQa6N1r4OQ
 CqTyGFdwJXRaRiJ80wtrZFPKE2F+255XH/J/ximPqo2hsmM39MYNxx7cmFPmRMTwxCxP
 aMXcL0KqcEr3xffPp7kdXxs9Iloj4I1QrBLvQYqZoSays175ePp/617NqmwZrw8x63z2
 2mKppIITV2G+lHt8vVKFlsZtZ6TqvUVi1/S2J8IgXxVXrTRL2a9nJQRQGb9FuYHs9Dx4
 1X0IddZOXY5pZtDV2fHnr3/nqLfk+NbbmCb9KKrLUliBtKoZZQl8dgffkCEpHSyTGn7O
 I6rQ==
X-Gm-Message-State: AOAM533QbVfP/q3B6tB3EaFFlnimkh2g4Wr6sJs0dfoIq/VnjmAgUxxi
 ifmU8QJXdqJccNqa+lDSPybGxw==
X-Google-Smtp-Source: ABdhPJwmzzbCUBU42t6ZBV0CVhcp6jfBS0ZYqehStSJBSnQg1xKNnuutuMaagDY5rRm58GclqpHK4A==
X-Received: by 2002:a05:600c:b4b:: with SMTP id
 k11mr8349064wmr.180.1618579967707; 
 Fri, 16 Apr 2021 06:32:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u4sm9967392wml.0.2021.04.16.06.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 06:32:47 -0700 (PDT)
Date: Fri, 16 Apr 2021 15:32:40 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] drm-fixes
Message-ID: <YHmR+Gyh/s2sHT2D@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

I pinged the usual suspects, only intel fixes pending. drm-next also looks
ready, minus the big pull request summary Dave will have to type next
week.

Cheers, Daniel

drm-fixes-2021-04-16:
drm/i915 fixes

Cheers, Daniel

The following changes since commit d434405aaab7d0ebc516b68a8fc4100922d7f5ef:

  Linux 5.12-rc7 (2021-04-11 15:16:13 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-04-16

for you to fetch changes up to 4d2e1288372ccc5ac60290bc10cace49c9bfa6d0:

  Merge tag 'drm-intel-fixes-2021-04-15' of git://anongit.freedesktop.org/d=
rm/drm-intel into drm-fixes (2021-04-15 15:24:17 +0200)

----------------------------------------------------------------
drm/i915 fixes

----------------------------------------------------------------
Daniel Vetter (1):
      Merge tag 'drm-intel-fixes-2021-04-15' of git://anongit.freedesktop.o=
rg/drm/drm-intel into drm-fixes

Hans de Goede (1):
      drm/i915/display/vlv_dsi: Do not skip panel_pwr_cycle_delay when disa=
bling the panel

Lyude Paul (1):
      drm/i915/dpcd_bl: Don't try vesa interface unless specified by VBT

Ville Syrj=E4l=E4 (1):
      drm/i915: Don't zero out the Y plane's watermarks

 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 1 -
 drivers/gpu/drm/i915/display/vlv_dsi.c                | 4 ++--
 drivers/gpu/drm/i915/intel_pm.c                       | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
