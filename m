Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E96CB76B60
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 16:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71366ED82;
	Fri, 26 Jul 2019 14:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3415E6ED82
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 14:21:00 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id j6so11133566ybm.7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 07:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6RTxZyZfp439jyFG02qyM4A6x1sK68iTE5oCTHd+170=;
 b=rWdZ5fsK8IV6jLOBgU184QzR7MbX1WZvNLBWRYr5XfSAG+vo+YfnwfVJyLtvm1A7JH
 w+/WhtFF+BroN1gOcOFcbmI9NIGkJ7Ei2Vzqbj2oQtot9HzYyMQA+DQoUX3Rj9U/2uPx
 LyTf8xIzeyG+VslE15oouBnAvf23gEqE2kV4+jWn6skbaPJg5tStbQEw8bq9Bzw4XV91
 P154QKuE8HKNi/MxiAqGaV12TbRBccr0AvMgv+LidSZjrAwrz11i3LMP+FIJi2Anf0aW
 Qc6lqH8yg24wB5Mc6y6aD8DV35X1jG+BF6TDvLLHMNsGHb4K2ZrpKW5MZ8H34p9TMAUz
 El0w==
X-Gm-Message-State: APjAAAWgkQ/pfMIlAxyeMhlA0QDiBNUT0ofwIGgpUaXGWboCpt695LBb
 Vsgb9GWdanzaxcAzcsIwGFvlj0q6LduwUg==
X-Google-Smtp-Source: APXvYqwnV3QGIbrIks5msCXogRYYhRPAFtOyJupFpQqeARY6H9SlcmAzhmHWPIZ2gNGfQi2dzTphnw==
X-Received: by 2002:a25:a2cb:: with SMTP id c11mr45226398ybn.175.1564150859159; 
 Fri, 26 Jul 2019 07:20:59 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id k22sm12408752ywh.5.2019.07.26.07.20.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 07:20:58 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mst: Fix sphinx warnings in drm_dp_msg_connector register
 functions
Date: Fri, 26 Jul 2019 10:20:47 -0400
Message-Id: <20190726142057.224121-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6RTxZyZfp439jyFG02qyM4A6x1sK68iTE5oCTHd+170=;
 b=abclmEN3TgD1v3dyVj4wxvX03AWShccUn73DbwCWNzHwPFMgyNF3amG9c3mV40avbm
 orYUT7FC4DwOAdvcJRU9Thz+HxOQr9gUbxtrPrn80zT6rlPm8oad5IymSx6TkGGM6Quo
 gvyotcMnC8SzxD06lnsbMfTauvigiVc9SdZj71ixJzRH3X2psNX/lp9mwx8inO59qlRH
 P6tWtw4o3m05GMa3RyQVaIKRsWX+M773p9u40jd72cKDq6nR+tCP6VJmOefIoee+Z01J
 2RMbpCOETD98lYOHln9lAmuK1kvW496kOTNt6gceq+LCPn3X3xahxeobv+WijLPx9W/r
 BveQ==
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
Cc: Leo Li <sunpeng.li@amd.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpGaXhlcyB0aGUgZm9sbG93
aW5nIHdhcm5pbmdzOgoKLi4vZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYzox
NTkzOiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdkcm1fY29ubmVjdG9yJyBk
ZXNjcmlwdGlvbiBpbiAnZHJtX2RwX21zdF9jb25uZWN0b3JfbGF0ZV9yZWdpc3RlcicKLi4vZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYzoxNjEzOiB3YXJuaW5nOiBFeGNlc3Mg
ZnVuY3Rpb24gcGFyYW1ldGVyICdkcm1fY29ubmVjdG9yJyBkZXNjcmlwdGlvbiBpbiAnZHJtX2Rw
X21zdF9jb25uZWN0b3JfZWFybHlfdW5yZWdpc3RlcicKLi4vZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYzoxNTk0OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVt
YmVyICdjb25uZWN0b3InIG5vdCBkZXNjcmliZWQgaW4gJ2RybV9kcF9tc3RfY29ubmVjdG9yX2xh
dGVfcmVnaXN0ZXInCi4uL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmM6MTYx
NDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnY29ubmVjdG9yJyBub3Qg
ZGVzY3JpYmVkIGluICdkcm1fZHBfbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyJwoKRml4
ZXM6IDU2MjgzNmEyNjllMyAoImRybS9kcF9tc3Q6IEVuYWJsZSByZWdpc3RyYXRpb24gb2YgQVVY
IGRldmljZXMgZm9yIE1TVCBwb3J0cyIpCkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBM
eXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5Lndl
bnRsYW5kQGFtZC5jb20+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RA
bGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGlu
LmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwg
PHNlYW5wYXVsQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IGQzZDVm
YTVlNTBlMC4uODJhZGQ3MzZlMTdkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5
LmMKQEAgLTE1NzksNyArMTU3OSw3IEBAIHN0YXRpYyB2b2lkIGJ1aWxkX21zdF9wcm9wX3BhdGgo
Y29uc3Qgc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiLAogCiAvKioKICAqIGRybV9kcF9t
c3RfY29ubmVjdG9yX2xhdGVfcmVnaXN0ZXIoKSAtIExhdGUgTVNUIGNvbm5lY3RvciByZWdpc3Ry
YXRpb24KLSAqIEBkcm1fY29ubmVjdG9yOiBUaGUgTVNUIGNvbm5lY3RvcgorICogQGNvbm5lY3Rv
cjogVGhlIE1TVCBjb25uZWN0b3IKICAqIEBwb3J0OiBUaGUgTVNUIHBvcnQgZm9yIHRoaXMgY29u
bmVjdG9yCiAgKgogICogSGVscGVyIHRvIHJlZ2lzdGVyIHRoZSByZW1vdGUgYXV4IGRldmljZSBm
b3IgdGhpcyBNU1QgcG9ydC4gRHJpdmVycyBzaG91bGQKQEAgLTE2MDEsNyArMTYwMSw3IEBAIEVY
UE9SVF9TWU1CT0woZHJtX2RwX21zdF9jb25uZWN0b3JfbGF0ZV9yZWdpc3Rlcik7CiAKIC8qKgog
ICogZHJtX2RwX21zdF9jb25uZWN0b3JfZWFybHlfdW5yZWdpc3RlcigpIC0gRWFybHkgTVNUIGNv
bm5lY3RvciB1bnJlZ2lzdHJhdGlvbgotICogQGRybV9jb25uZWN0b3I6IFRoZSBNU1QgY29ubmVj
dG9yCisgKiBAY29ubmVjdG9yOiBUaGUgTVNUIGNvbm5lY3RvcgogICogQHBvcnQ6IFRoZSBNU1Qg
cG9ydCBmb3IgdGhpcyBjb25uZWN0b3IKICAqCiAgKiBIZWxwZXIgdG8gdW5yZWdpc3RlciB0aGUg
cmVtb3RlIGF1eCBkZXZpY2UgZm9yIHRoaXMgTVNUIHBvcnQsIHJlZ2lzdGVyZWQgYnkKLS0gClNl
YW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
