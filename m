Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B3C4D5A55
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 06:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0A510E229;
	Fri, 11 Mar 2022 05:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E295E10E229
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 05:15:21 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id hw13so16172052ejc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 21:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=JPFOajUMKTyb3rrUNNHEscSQIB+wen/tqKi4y6uiIl8=;
 b=Xu0bGoP827dHnS7HAEt/MyCA45yKbD/+QWTyirHwt9sS3D7hiaQmQsBPGUzNUF9atG
 3VjEbF6mD5Ddcn2msG6Ip1NadFNYhZwNRISDzokL+I5yF90TgG8n2PiAIMa9/E1bAd1z
 teV9tYeoZ2NxMWwz0b5Bt2xaSTLVzkWx5S+b3rb3pPRSqNrLplBBcDTOVyQTksO7A2U9
 0ndxekXuNN1uKwc2CHE1mmDBSD8Dair2MvDCdnAP42yaVH1FnwNzcCIq4Xl4bAu5nZ/9
 fnBgpUCWN4/X+ppZwEgWcOZUSSb/dXT7Jn5A5exWZ8xFW5+2DrR7xyZu/3rfLvkybRU7
 X3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=JPFOajUMKTyb3rrUNNHEscSQIB+wen/tqKi4y6uiIl8=;
 b=IOP0FsLIGPhrOPr0iS61glRs8NdIXmYrsLTSijpUeqgWqZTdds5wQiz4sqZRLvpufe
 VLmMyi1ufV8foj/sgypYqYoKy9+034BoHyjJw1tUIxXqr6laE9DqsBvQCk3hraNcipch
 Spbnwz7Mm2pVFdkzipwuhb7RVKPRcrB2A8agprBPirT8ucSkRByNdJKmo5glzfX/lnjb
 jW4dPZmEmtXTUrl0dkRZny7jTbRR9dRiVU7QKxJiFxf/6YraXtvhXnQ/D13fk540bP0Q
 qa6ry1gW/whV4cOFubE1M/Psv5PxTcAfbjNXttpXlVEVrfnZiOwrdbZTGXzDkCiz4RbV
 DpXQ==
X-Gm-Message-State: AOAM533s7xrqY3zkWJGPwtxI5pbeKczEZa2LzFCHup/Ipiw9nEhj2yX6
 Tj+DFXYvCXf9NAN42jHFwDIP+2tn+wtRHDNC/D4=
X-Google-Smtp-Source: ABdhPJxbXy0v9XlONwFwb+XmeF6M7vXW1IH4xECzIi+6iYV/aJ/372uJncF0/oMZuK7KJdYT+sazpSwkPl495QfXerI=
X-Received: by 2002:a17:907:968f:b0:6db:a3c5:ae3e with SMTP id
 hd15-20020a170907968f00b006dba3c5ae3emr1142716ejc.770.1646975720289; Thu, 10
 Mar 2022 21:15:20 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 11 Mar 2022 15:15:09 +1000
Message-ID: <CAPM=9txhThmkeKMjTVXGL+RYQDxBZv2c4syb_3V7WF=8sZhaHQ@mail.gmail.com>
Subject: [git pull] drm fixes for 5.17-rc8/final
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

As expected at this stage its pretty quiet, one sun4i mixer fix and
one i915 display flicker fix.

Thanks,
Dave.

drm-fixes-2022-03-11:
drm fixes for v5.17-rc8/final

i915:
- psr fix screen flicker

sun4i:
- mixer format fix.
The following changes since commit ffb217a13a2eaf6d5bd974fc83036a53ca69f1e2=
:

  Linux 5.17-rc7 (2022-03-06 14:28:31 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-03-11

for you to fetch changes up to 30eb13a26014ca640b5eb57b6d010114084d5c92:

  Merge tag 'drm-intel-fixes-2022-03-10' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2022-03-11
13:26:19 +1000)

----------------------------------------------------------------
drm fixes for v5.17-rc8/final

i915:
- psr fix screen flicker

sun4i:
- mixer format fix.

----------------------------------------------------------------
Dave Airlie (2):
      Merge tag 'drm-misc-fixes-2022-03-10' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2022-03-10' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Jernej Skrabec (1):
      drm/sun4i: mixer: Fix P010 and P210 format numbers

Jouni H=C3=B6gander (1):
      drm/i915/psr: Set "SF Partial Frame Enable" also on full update

 drivers/gpu/drm/i915/display/intel_psr.c | 16 ++++++++++++++--
 drivers/gpu/drm/i915/i915_reg.h          |  1 +
 drivers/gpu/drm/sun4i/sun8i_mixer.h      |  8 ++++----
 3 files changed, 19 insertions(+), 6 deletions(-)
