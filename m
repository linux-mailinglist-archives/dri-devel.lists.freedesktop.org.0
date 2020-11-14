Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5665E2B2B51
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 05:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E68F6E8DF;
	Sat, 14 Nov 2020 04:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9B06E8DF
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 04:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605328058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=3p7VzZX2errimEtzioX6JBSN0ZX5qi6rw6UkQ0sXBsk=;
 b=CwQsMFB+PB66O+l1Y+8Zcd3CaxPiJX65cWCepy9zSelRnsNYLmbck0jLnnPR76wZt6orK2
 Xls8vYyILErLPFwPX+WrDwErKNJeOAuhn5PNuirGNG1jkZnFthWgoQGjubcL9ZUR/InPSj
 wpg/h2gdP0rfrEHN7sC7NVjJZG6CRwg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-ssLj_8AzNU66z6xOEQgz3g-1; Fri, 13 Nov 2020 23:27:33 -0500
X-MC-Unique: ssLj_8AzNU66z6xOEQgz3g-1
Received: by mail-ej1-f69.google.com with SMTP id e9so5340271ejb.16
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 20:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3p7VzZX2errimEtzioX6JBSN0ZX5qi6rw6UkQ0sXBsk=;
 b=pZwIIi9+999KvzoU+bhnLUFS9Ch7gytDNRKvasXnHx3pO00Y2G9ooSNrF05AyYCMrI
 KJ9jCgSx8HKfGUFDBC8qhs9pzdxSKCffTFve8euQTZh+tXtAeZ7lW6mYA8Bs5gtTsAh/
 fDq0366QY3mFp3a8Injz2inP5ail2+HyAHIK01Q4Fc064rECd0jZkUKQk4Bvib2/LOx7
 MsmPfvVXZWLAjc1VmxLse84NvcA4QuBuaVxHEpeP4bjvjAEEQAowXZbZNZCMDp+X9VWl
 5oVx0sussc2PB2zmCRvEIvqraSQW8oCtivucxQ13OysfXTZWYlaxFmb21jQuxcWZyPwT
 rVcg==
X-Gm-Message-State: AOAM533FFEp0TN3v2ZvNCPJwiMxgeCz6Vh2at1Yj3JKUG5GsXfmJAyPm
 xvrdq/a96GT2pjUMvlguDtZsK49A/U9jVAEdpMZC85yMyY+VM15OPFxuorPYsH8/rET+L9cYEHR
 wF02cJmSAwuC2RDSmDwy6wLOdORCuMBSAwK/irZregOOh
X-Received: by 2002:a17:906:bc46:: with SMTP id
 s6mr5139453ejv.456.1605328052422; 
 Fri, 13 Nov 2020 20:27:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVAgPd+lD8nXlW4EHhg5QXAnbbZBZzc61tgmoUHKrm/39NVGVJN2cBjz7VZ2Y589vMx6GPDKPhj058TkDMoxM=
X-Received: by 2002:a17:906:bc46:: with SMTP id
 s6mr5139446ejv.456.1605328052264; 
 Fri, 13 Nov 2020 20:27:32 -0800 (PST)
MIME-Version: 1.0
From: Ben Skeggs <bskeggs@redhat.com>
Date: Sat, 14 Nov 2020 14:27:20 +1000
Message-ID: <CABDvA=k+WM8tEbmP6fo312eepdO9TdhsW060VvoSzy_znjoMFw@mail.gmail.com>
Subject: [PULL] nouveau-fixes 5.10
To: David Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bskeggs@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

The following changes since commit f8394f232b1eab649ce2df5c5f15b0e528c92091:

  Linux 5.10-rc3 (2020-11-08 16:10:16 -0800)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.10

for you to fetch changes up to 5c6fb4b28b165887c42c66731c90eaca818b04c6:

  drm/nouveau/kms/nv50-: Use atomic encoder callbacks everywhere
(2020-11-14 14:19:18 +1000)

----------------------------------------------------------------
Alexander Kapshuk (1):
      drm/nouveau/kms: Fix NULL pointer dereference in
nouveau_connector_detect_depth

Ben Skeggs (1):
      drm/nouveau/ttm: avoid using nouveau_drm.ttm.type_vram prior to nv50

Lyude Paul (1):
      drm/nouveau/kms/nv50-: Use atomic encoder callbacks everywhere

 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 29 ++++++++++++++---------------
 drivers/gpu/drm/nouveau/nouveau_bo.c        |  3 +--
 drivers/gpu/drm/nouveau/nouveau_connector.c | 14 +++++++++-----
 3 files changed, 24 insertions(+), 22 deletions(-)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
