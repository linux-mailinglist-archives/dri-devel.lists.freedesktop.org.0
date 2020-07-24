Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7E122C0EE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 10:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C6F6E93E;
	Fri, 24 Jul 2020 08:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D756E93E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 08:37:36 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id l19so4294743ybl.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 01:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YLtceQjPg9uxKL2O6q6c8yv41sx7p4NdjCammqchqHk=;
 b=M+bKueF9FNshgNcpPKDgBp/AtEBSYsvYEjDQx7wIzDBHKEKMuqzEFbGmzHTkl69bCa
 H/Ly98e656ysuUfS1740TqnfceilhWGEeE59jxC+dx5E7FiyN2hHzmWjjtc27lF9ZPhO
 0WQ2FJsjHIBfj4CRYJxW9bgOO7EB7T5d1Q8fNHyD9IqQCtsbPgkGTU2IWE4eIcpqdBcT
 3Cejco4omQczAQb4H9vWDfH1dtkLOVwf+Uypks3vbS9itWdwN8n70nChlLLm9oJO6rn2
 WoUajwoPZWsUxpQ1J9cWG/tozWhG3T37G9ziNsGDCXuYkgYLjo+NGgX1lSMUdOtDtGIl
 X2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YLtceQjPg9uxKL2O6q6c8yv41sx7p4NdjCammqchqHk=;
 b=PPYB6u2BdOZT9meJaRpsThv4IoI7nd9FZZTXoHUxPcsbYtKQsZRb8U1QRyf1//m/Yv
 pCWdS4vht8k6hByE/CWrxj2iAWz/1HBLCCwbf8TnNvCpx7y3Y2tn3VqUu7ZDRpW7ojXi
 QRfjgU/gnQqZB+CWE3cI2H2Xl5gfB8QCtn86XkYVNnloRLigE3QCOdZUk9UleEwsY/DL
 /C7kCASv2G5sIA6UP19YqeQlH1g8Q2Oe9YBYWevkR/iaE6ruzYkEkp01UlvdznyhaoO5
 SWRCKKxbuQTVsPPQpwwbv7oG+nuCw8BdxGnb4aUxcVhn4VYzESerwJ/VeK03rZ0ylHMv
 IvDw==
X-Gm-Message-State: AOAM533MF47CEnl7lGuv0ulkEYKslaGIAJdeh4OcLEbvHmhKsPKZwDlg
 6Pc1iarc3595VM2qZ7fTTP1zDwChmGzB6xjKQzs=
X-Google-Smtp-Source: ABdhPJzUf5oTbsklBAtrFp5PWTIV0a8Y0Cj3vBHhyFM9jwdyqsCkiF4/DjIawrIsaIs4CyriBIG63y0CP++kCYbrkC0=
X-Received: by 2002:a25:b80e:: with SMTP id v14mr12742683ybj.435.1595579855966; 
 Fri, 24 Jul 2020 01:37:35 -0700 (PDT)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Fri, 24 Jul 2020 18:37:25 +1000
Message-ID: <CACAvsv5aAp+FZMZGTB+Nszc==h5gEbdNV58sSRRQDF1R5qQRGg@mail.gmail.com>
Subject: [PULL] nouveau-fixes 5.8
To: Dave Airlie <airlied@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Dave,

A couple of fixes for issues relating to format modifiers (there's
still a patch pending from James Jones to hopefully address the
remaining ones), regression fix from the recent HDA nightmare, and a
race fix for Turing modesetting.

Thanks,
Ben.

The following changes since commit ed710a6ed797430026aa5116dd0ab22378798b69:

  drm/nouveau/nouveau: fix page fault on device private memory
(2020-07-08 13:30:42 +1000)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.8

for you to fetch changes up to 15fbc3b938534cc8eaac584a7b0c1183fc968b86:

  drm/nouveau/fbcon: zero-initialise the mode_cmd2 structure
(2020-07-24 18:33:14 +1000)

----------------------------------------------------------------
Ben Skeggs (5):
      drm/nouveau/disp/gm200-: fix regression from HDA SOR selection changes
      drm/nouveau/kms/gf100: use correct format modifiers
      drm/nouveau/kms/tu102: wait for core update to complete when
assigning windows
      drm/nouveau/fbcon: fix module unload when fbcon init has failed
for some reason
      drm/nouveau/fbcon: zero-initialise the mode_cmd2 structure

 drivers/gpu/drm/nouveau/dispnv50/disp.c         |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_fbcon.c         |  3 ++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c | 30
+++++++++++++++++++++---------
 3 files changed, 25 insertions(+), 12 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
