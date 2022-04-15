Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A082E502DB1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 18:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23BF10E249;
	Fri, 15 Apr 2022 16:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6371710E20C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 16:25:58 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.94]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MzyAy-1nu9vu2c1G-00x4PR; Fri, 15 Apr 2022 18:25:48 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 0/2] drm/panel/raspberrypi-touchscreen: Fix minor issues
Date: Fri, 15 Apr 2022 18:25:11 +0200
Message-Id: <20220415162513.42190-1-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RqDG6XW8CnCTszDGcwr4FlT9cIcXW4pIv+/wZy44wqzqakfrJXR
 Lo+eJnEeNROd7e1QKEfX0KnkcskTJuTrYMIcnVTku2OiPMzu4+MJUOqPthHOxITymAQN96F
 r9t8ReqdVHzN1CimXNlO8B0Ni2T9Ehur/VDEy3BB7pBdkw7pMoyPTZtW+wd9SYJv+fXTkV2
 5ME0AZhiL0D+CyJkjsKmw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:76mRmkmr76Q=:Kn1NOJMopeWg2UnETeqso3
 l/9W0SAl5k0WP5v5SGlV4TtnHVWeuLAoBiPGZO9AdajST7Phblbvce426hfbceW57Bp/MYfq1
 kexVhVRUUOkETgi39HTqjdSEdslAu8+2/DYrc//48HeiW1XPlVLccVK1CYmYBJKPiCl072qFU
 iX2dE4UuhRq9RkZiUXRrm9VCguQHtZ/hlLY4WaQOc6+jLzVruj0SA2q4feriMp9xQNk5iKqgf
 rZhvwYMRKmL5crg+1zqeci5NsVs0xq6+JAJGYnetrj/3O2HYrhxmX6sXtFRJWDE69rLklUDTl
 SUyY+i5LzM8c5YF1IW5WLInCuJDRcMONQWBPD8D/BDK7mAK+fnGiZWQDuJcl+rBK0rTlMEquV
 dghPhHHILowqan9yENow2clkzDGaaPRMz8M8Q3wE4uUrAUbX5JF609HN6SSaw4zPE390NLW8e
 +jnKS0szervP4Zi1nPYC162Em+4xN7U3YKSZJQ1lAj8Sdr4ls0m+0VJEE2KOEuaetQsmg8WJm
 jAjITYGF+FMO/txGH3Es5rhPN24+laaIzI3rhnvMz6NOQbo9al3wpjOTbNFmsamIwSSYkFVdd
 AlXID3QGVJUe2SLAMbz4sKHbWGu3Gc3gzZYYulTK4d6vOB6jHBJIsdizwGF52yxQdodIzNQvU
 kwOFDYCD7u8uEfSiGXhpnk8HZ/HB3zW58r6a6f3x+6Z+H3mY/9rQx41KvT4ZAA7iGkCdw4pF+
 Dfl4xLxkioH6NOa0
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This small patch series tries to upstream 2 minor issues which has been
fixed in the vendor tree by Dave Stevenson.

Dave Stevenson (2):
  drm/panel/raspberrypi-touchscreen: Avoid NULL deref if not initialised
  drm/panel/raspberrypi-touchscreen: Initialise the bridge in prepare

 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c   | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

-- 
2.25.1

