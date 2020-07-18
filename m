Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85E8224D86
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jul 2020 20:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572996E21D;
	Sat, 18 Jul 2020 18:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BAE6E21D
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 18:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 5C641FB04;
 Sat, 18 Jul 2020 20:26:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ntX7PWNyZs1; Sat, 18 Jul 2020 20:26:38 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 833FE42576; Sat, 18 Jul 2020 20:26:37 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 0/1] drm/bridge: nwl-dsi: Drop
 DRM_BRIDGE_ATTACH_NO_CONNECTOR check.
Date: Sat, 18 Jul 2020 20:26:36 +0200
Message-Id: <cover.1595096667.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.26.2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CldlIGRvbid0IGNyZWF0ZSBhIGNvbm5lY3RvciBidXQgbGV0IHBhbmVsX2JyaWRnZSBoYW5kbGUg
dGhhdCBzbyB0aGVyZSdzCm5vIHBvaW50IGluIHJlamVjdGluZyBEUk1fQlJJREdFX0FUVEFDSF9O
T19DT05ORUNUT1IuCgpUaGlzIHdhcyBwcm9tcHRlZCBieSBTYW0gaW4KaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvZHJpLWRldmVsLzIwMjAwNzE4MTE1NzM0LkdBMjk4OTc5M0ByYXZuYm9yZy5vcmcv
CgpTaWduZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgoKR3VpZG8g
R8O8bnRoZXIgKDEpOgogIGRybS9icmlkZ2U6IG53bC1kc2k6IERyb3AgRFJNX0JSSURHRV9BVFRB
Q0hfTk9fQ09OTkVDVE9SIGNoZWNrLgoKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbndsLWRzaS5j
IHwgNSAtLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCgotLSAKMi4yNi4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
