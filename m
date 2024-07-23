Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C60A93A7C8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 21:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633F610E1E3;
	Tue, 23 Jul 2024 19:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Tue, 23 Jul 2024 19:49:02 UTC
Received: from mail.bix.bg (mail.bix.bg [193.105.196.21])
 by gabe.freedesktop.org (Postfix) with SMTP id 1B71110E1E3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 19:49:01 +0000 (UTC)
Received: (qmail 10876 invoked from network); 23 Jul 2024 19:42:20 -0000
Received: from d2.declera.com (212.116.131.122)
 by indigo.declera.com with SMTP; 23 Jul 2024 19:42:20 -0000
Message-ID: <26c01e3b726812979846710afcaab81e92da6a40.camel@declera.com>
Subject: bisected/regression: choopy youtube video on Ryzen IGP -
 0ddd2ae586d2 drm/ttm: increase ttm pre-fault value to PMD size
From: Yanko Kaneti <yaneti@declera.com>
To: "Zhu, Lingshan" <Lingshan.Zhu@amd.com>
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>, "Deucher, Alexander"	
 <Alexander.Deucher@amd.com>, "dri-devel@lists.freedesktop.org"	
 <dri-devel@lists.freedesktop.org>, Li Jingxiang
 <jingxiang.li@ecarxgroup.com>
Date: Tue, 23 Jul 2024 22:42:20 +0300
References: <20240604084934.225738-1-lingshan.zhu@amd.com>
In-Reply-To: <20240604084934.225738-1-lingshan.zhu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.1 (3.53.1-1.fc41) 
MIME-Version: 1.0
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

Hello,

Noticed and bisected a rawhide (with the new 6.11-rc0 snapshots) regression=
 to this commit:

  0ddd2ae586d2 drm/ttm: increase ttm pre-fault value to PMD size

The regression manifests in choppy youtube video playback in google-chrome-=
stable.
 https://www.youtube.com/watch?v=3DuOpl2XNOgMA
 google-chrome-stable-126.0.6478.182-1.x86_64
 VP9 video,=20
 Chrome -> Override software rendering list -> on
 Chrome -> Hardware-accelerated video decode - default enabled

No other visible graphics issues.

Its a desktop system with Ryzen 7 5700GRyzen 7 5700G  IGP
[AMD/ATI] Cezanne [Radeon Vega Series / Radeon Vega Mobile Series] [1002:16=
38]

Tested with linus tip and just reverting the commit fixes the issue.

Sorry for the brevity, not sure what other details might be relevant.

- Yanko


