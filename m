Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683C3A9B61
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C902F89E01;
	Thu,  5 Sep 2019 07:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914BE8915A;
 Wed,  4 Sep 2019 09:11:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B85FEB657;
 Wed,  4 Sep 2019 09:11:44 +0000 (UTC)
Date: Wed, 4 Sep 2019 11:11:52 +0200
From: Jean Delvare <jdelvare@suse.de>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/edid: don't log errors on absent or old CEA SAD
 blocks
Message-ID: <20190904111152.266d5176@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Sep 2019 07:13:21 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@linux.ie>, David@freedesktop.org,
	Zhou@freedesktop.org (ChunMing),
	"  <David1.Zhou@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo  Li  <sunpeng.li@amd.com>, Maarten Lankhorst   <maarten.lankhorst@linux.intel.com>, Maxime Ripard   <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Ville  =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,  Christian =?UTF-8?B?S8O2?= =?UTF-8?B?bmln?= <christian.koenig@amd.com>"@freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKVGhpcyBpcyBteSBhdHRlbXB0IHRvIGZpeCBidWcgZmRvIzEwNzgyNToKaHR0cHM6
Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA3ODI1CgpbUEFUQ0ggMS8z
XSBkcm0vYW1kOiBiZSBxdWlldCB3aGVuIG5vIFNBRCBibG9jayBpcyBmb3VuZApbUEFUQ0ggMi8z
XSBkcm0vcmFkZW9uOiBiZSBxdWlldCB3aGVuIG5vIFNBRCBibG9jayBpcyBmb3VuZApbUEFUQ0gg
My8zXSBkcm0vZWRpZDogbm8gQ0VBIGV4dGVuc2lvbiBpcyBub3QgYW4gZXJyb3IKCkNoYW5nZXMg
c2luY2UgdjE6CiAqIEZpeGVkIHN1YmplY3Qgb2YgcGF0Y2ggMgogKiBUcmVhdCBDRUEgZXh0ZW5z
aW9uIHZlcnNpb24gPCAzIGFzIG5vbi1lcnJvciB0b28gKHN1Z2dlc3RlZCBieSBWaWxsZQogICBT
eXJqw6Rsw6QpCgotLSAKSmVhbiBEZWx2YXJlClNVU0UgTDMgU3VwcG9ydApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
