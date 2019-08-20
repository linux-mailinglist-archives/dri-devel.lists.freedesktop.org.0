Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C46F96CAD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 01:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4525C6E8B1;
	Tue, 20 Aug 2019 23:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3D06E8AB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 23:06:30 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id n4so166031pgv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 16:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ryVGrG9e9TLG77G8C99Y8FHgpTFEkxY3w2ym7UqLajQ=;
 b=ivDT72E7ervVQ8PWqt0JVXRmKyga0aLtf+giUXvUA5pa3e3VoqM0w5mFp/xoXQvt7m
 XZ8nDJuqOG2dBMpSNCR+ZRo2E/5ipKTmCJZRc694iX/PohH4mk17PCNwekZ+YZgIqa8b
 1oc2Ed7F+JS7wkG/I4kdg4C34Z7I+q+aGt7FSxpzLUl6dEoQ/CmtxMjMrxuPqnHHfIGs
 6SePgZu0OY7gtLxsxROVpgQjFGG/2DS/6I2YTMtWLfU4+OwG8jn1BY7aDYvFFdaCe450
 H5S4Tt19x4X03sJEmIA2xuJ6/BMXIiT/taUn+bwVTX95gYmWc+SpbZB6hc+90IWO9QBk
 TjMg==
X-Gm-Message-State: APjAAAU/SXES6gMmlXZ6YW029UBeK8k74mAmQkucsKEl1LUwAyiydpc7
 188qSCVsK5B08hu4bhaMbEf40ZCnz2g=
X-Google-Smtp-Source: APXvYqxbdTcern/qekwcKh1V7jWD3jUbS4fVYztkrvYCDaXS4gUd4pNM6l5b7XRrj8Vc34pnD8zU3A==
X-Received: by 2002:aa7:8106:: with SMTP id b6mr32592440pfi.5.1566342390162;
 Tue, 20 Aug 2019 16:06:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 q4sm27564747pff.183.2019.08.20.16.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 16:06:29 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 00/25] drm: Kirin driver cleanups to prep for Kirin960
 support
Date: Tue, 20 Aug 2019 23:06:01 +0000
Message-Id: <20190820230626.23253-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=ryVGrG9e9TLG77G8C99Y8FHgpTFEkxY3w2ym7UqLajQ=;
 b=SvLo7b5oXDEKoxq5CyyOKxHb8DjsMtSbtA+l64JS8PbQNprKp/5rKAwnjVaSRZej+N
 5Y3joc/TwMsyRDh16VqIEl6OBEI20tBiWPll08s3F1SbHMKu5AOlm4m5p+1Q5UKHL+WJ
 IPC+nrI6EGoq+9OmY+LOcNZI2XtInSONlxh6ltFePerDnpUEe6pirUOW8cJyTWm36jKg
 cMghCRZDgHGkFLH8r2R12DD/QymlYfiGCH6e9qwQliJEDNgKpm1qih8xo9A5SbuZTDC3
 SC5QCdMJ/YAZ80sK7XDYPUerY3h7a2t8tcwKX1wjS2ImDSTFQhhsFNT8GR5bPzeKQU7P
 QfHg==
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2VuZGluZyB0aGlzIG91dCBhZ2FpbiAoYXBvbG9naWVzISksIHRvIGFkZHJlc3MgYSBmZXcgaXNz
dWVzIFNhbQpmb3VuZC4KClRoaXMgcGF0Y2hzZXQgY29udGFpbnMgb25lIGZpeCAoaW4gdGhlIGZy
b250LCBzbyBpdHMgZWFzaWVyIHRvCmV2ZW50dWFsbHkgYmFja3BvcnQpLCBhbmQgYSBzZXJpZXMg
b2YgY2hhbmdlcyBmcm9tIFlpUGluZyB0bwpyZWZhY3RvciB0aGUga2lyaW4gZHJtIGRyaXZlciBz
byB0aGF0IGl0IGNhbiBiZSB1c2VkIG9uIGJvdGgKa2lyaW42MjAgYmFzZWQgZGV2aWNlcyAobGlr
ZSB0aGUgb3JpZ2luYWwgSGlLZXkgYm9hcmQpIGFzIHdlbGwKYXMga2lyaW45NjAgYmFzZWQgZGV2
aWNlcyAobGlrZSB0aGUgSGlLZXk5NjAgYm9hcmQpLgoKVGhlIGZ1bGwga2lyaW45NjAgZHJtIHN1
cHBvcnQgaXMgc3RpbGwgYmVpbmcgcmVmYWN0b3JlZCwgYnV0IGFzCnRoaXMgYmFzZSBraXJpbiBy
ZXdvcmsgd2FzIGdldHRpbmcgdG8gYmUgc3Vic3RhbnRpYWwsIEkgd2FudGVkCnRvIHNlbmQgb3V0
IHRoZSBmaXJzdCBjaHVuaywgc28gdGhhdCB0aGUgcmV2aWV3IGJ1cmRlbiB3YXNuJ3QKb3Zlcndo
ZWxtaW5nLgoKVGhlIGZ1bGwgSGlLZXk5NjAgcGF0Y2ggc3RhY2sgY2FuIGJlIGZvdW5kIGhlcmU6
CiAgaHR0cHM6Ly9naXQubGluYXJvLm9yZy9wZW9wbGUvam9obi5zdHVsdHovYW5kcm9pZC1kZXYu
Z2l0L2xvZy8/aD1kZXYvaGlrZXk5NjAtbWFpbmxpbmUtV0lQCgp0aGFua3MKLWpvaG4KCgpOZXcg
aW4gdjU6CiogV2hpdGVzcGFjZSBjaGFuZ2VzIGFuZCBmZXcgbG9naWMgc2ltcGxpZmljYXRpb25z
IHRvIGdldAogIGNoZWNrcGF0Y2gucGwgLS1zdHJpY3QgdG8gcGFzcywgYXMgbm90ZWQgYnkgU2Ft
CiogRml4IGZvciBvbmUgb2YgbXkgcGF0Y2hlcyB3aGljaCBicm9rZSBidWlsZGluZyB0aGUga2ly
aW4KICBkcml2ZXIgYXMgYSBtb2R1bGUuIEFnYWluIG5vdGVkIGJ5IFNhbS4KCkNjOiBSb25ncm9u
ZyBab3UgPHpvdXJvbmdyb25nQGdtYWlsLmNvbT4KQ2M6IFhpbmxpYW5nIExpdSA8ei5saXV4aW5s
aWFuZ0BoaXNpbGljb24uY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogZHJpLWRldmVsIDxkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPgoKRGEgTHYgKDEpOgogIGRybToga2lyaW46IEZpeCBmb3IgaGlrZXk2MjAgZGlzcGxheSBv
ZmZzZXQgcHJvYmxlbQoKSm9obiBTdHVsdHogKDMpOgogIGRybToga2lyaW46IFJlbW92ZSBISVNJ
X0tJUklOX0RXX0RTSSBjb25maWcgb3B0aW9uCiAgZHJtOiBraXJpbjogUmVtb3ZlIHVucmVhY2hh
YmxlIHJldHVybgogIGRybToga2lyaW46IE1vdmUgd29ya3F1ZXVlIHRvIGFkZV9od19jdHggc3Ry
dWN0dXJlCgpYdSBZaVBpbmcgKDIxKToKICBkcm06IGtpcmluOiBSZW1vdmUgdW5jZXNzYXJ5IHBh
cmFtZXRlciBpbmRpcmVjdGlvbgogIGRybToga2lyaW46IFJlbW92ZSBvdXRfZm9ybWF0IGZyb20g
YWRlX2NydGMKICBkcm06IGtpcmluOiBSZW5hbWUgYWRlX3BsYW5lIHRvIGtpcmluX3BsYW5lCiAg
ZHJtOiBraXJpbjogUmVuYW1lIGFkZV9jcnRjIHRvIGtpcmluX2NydGMKICBkcm06IGtpcmluOiBE
eW5hbWljYWxseSBhbGxvY2F0ZSB0aGUgaHdfY3R4CiAgZHJtOiBraXJpbjogTW92ZSByZXF1ZXN0
IGlycSBoYW5kbGUgaW4gYWRlIGh3IGN0eCBhbGxvYwogIGRybToga2lyaW46IE1vdmUga2lyaW5f
Y3J0Yywga2lyaW5fcGxhbmUsIGtpcmluX2Zvcm1hdCB0bwogICAga2lyaW5fZHJtX2Rydi5oCiAg
ZHJtOiBraXJpbjogUmVhbm1lIGRjX29wcyB0byBraXJpbl9kcm1fZGF0YQogIGRybToga2lyaW46
IE1vdmUgYWRlIGNydGMvcGxhbmUgaGVscCBmdW5jdGlvbnMgdG8gZHJpdmVyX2RhdGEKICBkcm06
IGtpcmluOiBNb3ZlIGNoYW5uZWwgZm9ybWF0cyB0byBkcml2ZXIgZGF0YQogIGRybToga2lyaW46
IE1vdmUgbW9kZSBjb25maWcgZnVuY3Rpb24gdG8gZHJpdmVyX2RhdGEKICBkcm06IGtpcmluOiBN
b3ZlIHBsYW5lIG51bWJlciBhbmQgcHJpbWF5IHBsYW5lIGluIGRyaXZlciBkYXRhCiAgZHJtOiBr
aXJpbjogTW92ZSBjb25maWcgbWF4X3dpZHRoIGFuZCBtYXhfaGVpZ2h0IHRvIGRyaXZlciBkYXRh
CiAgZHJtOiBraXJpbjogTW92ZSBkcm0gZHJpdmVyIHRvIGRyaXZlciBkYXRhCiAgZHJtOiBraXJp
bjogQWRkIHJlZ2lzdGVyIGNvbm5lY3QgaGVscGVyIGZ1bmN0aW9ucyBpbiBkcm0gaW5pdAogIGRy
bToga2lyaW46IFJlbmFtZSBwbGFuZV9pbml0IGFuZCBjcnRjX2luaXQKICBkcm06IGtpcmluOiBG
aXggZGV2LT5kcml2ZXJfZGF0YSBzZXR0aW5nCiAgZHJtOiBraXJpbjogTWFrZSBkcml2ZXJfZGF0
YSB2YXJpYWJsZSBub24tZ2xvYmFsCiAgZHJtOiBraXJpbjogQWRkIGFsbG9jX2h3X2N0eC9jbGVh
bl9od19jdHggb3BzIGluIGRyaXZlciBkYXRhCiAgZHJtOiBraXJpbjogUGFzcyBkcml2ZXIgZGF0
YSB0byBjcnRjIGluaXQgYW5kIHBsYW5lIGluaXQKICBkcm06IGtpcmluOiBNb3ZlIGFkZSBkcm0g
aW5pdCB0byBraXJpbiBkcm0gZHJ2CgogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9L
Y29uZmlnICAgICAgIHwgIDEwICstCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL01h
a2VmaWxlICAgICAgfCAgIDMgKy0KIC4uLi9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9h
ZGVfcmVnLmggICB8ICAgMSArCiAuLi4vZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJt
X2FkZS5jICAgfCAzNTEgKysrKysrKy0tLS0tLS0tLS0tCiAuLi4vZ3B1L2RybS9oaXNpbGljb24v
a2lyaW4va2lyaW5fZHJtX2Rydi5jICAgfCAyNTAgKysrKysrKysrLS0tLQogLi4uL2dwdS9kcm0v
aGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuaCAgIHwgIDQ4ICsrLQogNiBmaWxlcyBjaGFu
Z2VkLCAzNjcgaW5zZXJ0aW9ucygrKSwgMjk2IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
