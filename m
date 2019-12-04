Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A8A112BCE
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 13:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FBC6E0EE;
	Wed,  4 Dec 2019 12:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5570F6E0EE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 12:43:20 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id p17so7736226wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 04:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1wn2jp4LT9iwuBpIKIKfX+5+LhAsHTdc2jkOsNBwo3k=;
 b=ram28P/MF6K3nWtqar6sUbJMoqfeyiV1lK1XgtOmGt7Ui6XWd1WX49sHxBPQLJndUY
 rs6062iADyOOjSv3t8MeTAfHkgzsmqCz71vnCrCmJmNr1ll+z/LoXbguBYWyZnqLqqdw
 IQMSQ1kjh0JeT6VROEzLg1SWuJ0uUXFSSvNQ/v3x1BfvGPP9NGQH1+FksNFQD6cGrpw6
 1yVxYtWLYsDF7IlvRb7UAKmkcGEmDDinTGpLo7itkqnjA4/iSdxBy6j/Klph4A/qTNGT
 U+M/6Htksv9Qnbec7wgXHagkBqNk71Avthc2H4eKfSp8l2Db+64f7TY7C+2G3cMZC4nn
 H7xA==
X-Gm-Message-State: APjAAAUpfo/VFfgxXdzid7929HlaS7fA9k8ewdFFWqetS3aBOEnFtP+o
 YzX5+KhyFicTVaNIp09dsr8=
X-Google-Smtp-Source: APXvYqzrzAwdOyUnm1fxDZs8ZrIFvrDk9DVCpjpWgK9h3WMWg/COKu22NStLyb4MyTNU6QMNakR1pg==
X-Received: by 2002:a05:600c:24d1:: with SMTP id
 17mr30212448wmu.151.1575463398758; 
 Wed, 04 Dec 2019 04:43:18 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id l26sm6696512wmj.48.2019.12.04.04.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 04:43:17 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: [GIT PULL] drm/tegra: Fixes for v5.5-rc1
Date: Wed,  4 Dec 2019 13:43:16 +0100
Message-Id: <20191204124316.3534855-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1wn2jp4LT9iwuBpIKIKfX+5+LhAsHTdc2jkOsNBwo3k=;
 b=gADshrIjiFTNXU4V4/9GR2mzUyDpOWE5gLlWmjjc5Lj8M0CIXSkTl7PEdu7i8Hi2zF
 3wmrar6wZsPO0EMw0YJJyL2dUVlI/MKI19q27Xw4qZc/yJHlsEwXfVXCvo3HbShm82nT
 HOX5V4zRrYWlzHanpg8JRunjtVBISZ9Z4ByUivt+qfSr0c2VpW1Gro5dLp/1MaNO9OSh
 xsPf2CDN4uJ/R+F9kmhsfoAdyX/H/2er/SbJZXRky/om4kj7S9p/WE8hE2efzWth7Bfu
 WuXvL3TsH8KOi1T751ExEyQHGTWq4MSqsPwGu+q2odY2QkiqVcu2//VaHfRyqKWer5ds
 pl0g==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgODRkYjg4OWU2ZDgy
N2VlZmMzZGRlMTMwZmVjODM4MmQyZGNiMjNhYzoKCiAgZHJtL3RlZ3JhOiBVbmNvbmRpdGlvbmFs
bHkgc2VsZWN0IElPTU1VX0lPVkEgKDIwMTktMTEtMDEgMTA6NDk6MjkgKzAxMDApCgphcmUgYXZh
aWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVz
a3RvcC5vcmcvdGVncmEvbGludXggdGFncy9kcm0vdGVncmEvZm9yLTUuNS1yYzEtZml4ZXMKCmZv
ciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBkNjZkZmNmODBkMGY1NWY5NWI5ZWE0YTQ1Y2E0
MWNjNzExNWU5Nzg5OgoKICBkcm0vdGVncmE6IFJ1biBodWIgY2xlYW51cCBvbiAtPnJlbW92ZSgp
ICgyMDE5LTEyLTA0IDEzOjM4OjE2ICswMTAwKQoKVGhhbmtzLApUaGllcnJ5CgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRy
bS90ZWdyYTogRml4ZXMgZm9yIHY1LjUtcmMxCgpUaGlzIGlzIGEgc2V0IG9mIHNtYWxsIGZpeGVz
LCBtb3N0bHkgZm9yIHJlZ3Jlc3Npb25zIGludHJvZHVjZWQgd2l0aCB0aGUKRE1BIEFQSSBhbmQg
RGlzcGxheVBvcnQgc3VwcG9ydCBpbiB0aGUgbWFpbiBwdWxsIHJlcXVlc3QgZm9yIHY1LjUtcmMx
LgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpUaGllcnJ5IFJlZGluZyAoOSk6CiAgICAgIGRybS90ZWdyYTogaHViOiBSZW1v
dmUgYm9ndXMgY29ubmVjdGlvbiBtdXRleCBjaGVjawogICAgICBkcm0vdGVncmE6IGdlbTogUHJv
cGVybHkgcGluIGltcG9ydGVkIGJ1ZmZlcnMKICAgICAgZHJtL3RlZ3JhOiBnZW06IFJlbW92ZSBw
cmVtYXR1cmUgaW1wb3J0IHJlc3RyaWN0aW9ucwogICAgICBkcm0vdGVncmE6IFVzZSBwcm9wZXIg
SU9WQSBhZGRyZXNzIGZvciBjdXJzb3IgaW1hZ2UKICAgICAgZHJtL3RlZ3JhOiBzb3I6IEltcGxl
bWVudCBzeXN0ZW0gc3VzcGVuZC9yZXN1bWUKICAgICAgZHJtL3RlZ3JhOiB2aWM6IEV4cG9ydCBt
b2R1bGUgZGV2aWNlIHRhYmxlCiAgICAgIGRybS90ZWdyYTogU2lsZW5jZSBleHBlY3RlZCBlcnJv
cnMgb24gSU9NTVUgYXR0YWNoCiAgICAgIGRybS90ZWdyYTogc29yOiBNYWtlIHRoZSArNVYgSERN
SSBzdXBwbHkgb3B0aW9uYWwKICAgICAgZHJtL3RlZ3JhOiBSdW4gaHViIGNsZWFudXAgb24gLT5y
ZW1vdmUoKQoKIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jICAgIHwgMTggKysrKysrKystLS0t
LS0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jICAgfCAgNyArKystLS0KIGRyaXZlcnMv
Z3B1L2RybS90ZWdyYS9nZW0uYyAgIHwgNTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2h1Yi5jICAgfCAgMyAtLS0KIGRy
aXZlcnMvZ3B1L2RybS90ZWdyYS9wbGFuZS5jIHwgMTEgKysrKysrKysrKwogZHJpdmVycy9ncHUv
ZHJtL3RlZ3JhL3Nvci5jICAgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQog
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5jICAgfCAgNyArKystLS0KIDcgZmlsZXMgY2hhbmdl
ZCwgMTA0IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
