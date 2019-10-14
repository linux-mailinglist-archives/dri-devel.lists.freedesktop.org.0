Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02C3D62F7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 14:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA27C89B69;
	Mon, 14 Oct 2019 12:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E6889B69
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:50:53 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id m18so16647732wmc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 05:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GgdWGOJECNveIsaNtl+AyHGRoV+8tWMLO9eybpPm16w=;
 b=jX1cA0uqYFUEb8SvzgRUld3hFzmvyl6jxrdp1tztOm2VgspaRKyQjqcP0jmueO/PU/
 BV+2h7oVsU6S9ZzGkvZZ2Sz/YAMVhDJ4HGzQ4YusLWQwePYvieGsnZSBXRy2KMIMkxmM
 j0KuAngXUnfORAIvWTE8PEdptJoG/qBw+NkxId+800iVYdaZQFVUzA3FlI4p02s56ak+
 ZRCgG8XM3kQyp8GjqEA7V7caUF2JNWiXJsnNHqw0yPYi6l2b8TxYxn039+yURol4p2kF
 xhpWMABa2Mts4A84ifUYB+pYPKNAnZeiD2Cd0bUqW9RlaIrP5U607IsRlfFy33PH01Et
 IMEQ==
X-Gm-Message-State: APjAAAWujbfyDlqS3d2wLQ1pTcDa0bL8N6K4Rl5xGB6AINX7+I8nPZdg
 aW0ygohP9AC614BQD25POXA=
X-Google-Smtp-Source: APXvYqxWtXcBjxk3th2tVx8wtmCQ0UYIsKyvBM0qSL2J6dcXMRSGsrHUJ0VF50xtg3lnR/z27H95lA==
X-Received: by 2002:a05:600c:34b:: with SMTP id
 u11mr14412599wmd.172.1571057451484; 
 Mon, 14 Oct 2019 05:50:51 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id s1sm26157158wrg.80.2019.10.14.05.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:50:50 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 00/14] drm/tegra: Miscellaneous cleanups
Date: Mon, 14 Oct 2019 14:50:35 +0200
Message-Id: <20191014125049.425101-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GgdWGOJECNveIsaNtl+AyHGRoV+8tWMLO9eybpPm16w=;
 b=PHpvE6d0ajOD2Um5j6df0769ekrMEuYnuTcINS3aTy533i4MU4InV2PCxLk9kTiVw1
 4OPElqvhOzUi+dYLcqtdprl/joliAs/TRqOb+lYjGVjEv6uSk//b0sM9oClnwjnwyGps
 SqU9lagnsIn2zfoSqyqmvwP0aOSfukjRTC7jd1ych2r3hKiJFjHi0G1AUP4rD1Ao+KM7
 6WGygZuN9/s6/qHmLPZLuBTYVy6IGcAq0RQ60AF3pme0XOiR0OaSr/cdC76P7n7q3lLG
 noVkj0HYhJdMG3gKe2cISONO3uQP+PjJ9/oafYEC7Kub0Eeo51OeFTK8cws3Mi5fpJtD
 gQlA==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClNvbWUgY2xlYW51cHMg
YW5kIG1pbm9yIGltcHJvdmVtZW50cywgbm90aGluZyBleGNpdGluZyBoZXJlLiBIb3dldmVyLAp0
aGVzZSBwcmVwYXJlIHRoZSB3YXkgZm9yIHNvbWUgbGFyZ2VyIHJld29yayB0aGF0IHdpbGwgY29u
dmVydCBleHBsaWNpdApJT01NVSBBUEkgdXNhZ2UgdG8gdGhlIERNQSBBUEksIHdoaWNoIG9wdGlv
bmFsbHkgY2FuIGJlIGJhY2tlZCBieSBhbgpJT01NVS4KClRoaWVycnkKClRoaWVycnkgUmVkaW5n
ICgxNCk6CiAgZ3B1OiBob3N0MXg6IERvIG5vdCBsaW1pdCBETUEgc2VnbWVudCBzaXplCiAgZ3B1
OiBob3N0MXg6IFJlbW92ZSBncmF0dWl0b3VzIGJsYW5rIGxpbmUKICBncHU6IGhvc3QxeDogRXhw
bGljaXRseSBpbml0aWFsaXplIGhvc3QxeF9pbmZvIHN0cnVjdHVyZXMKICBncHU6IGhvc3QxeDog
UmVxdWVzdCBjaGFubmVscyBmb3IgY2xpZW50cywgbm90IGRldmljZXMKICBkcm0vdGVncmE6IElu
aGVyaXQgZGV2aWNlIERNQSBwYXJhbWV0ZXJzIGZyb20gaG9zdDF4CiAgZHJtL3RlZ3JhOiBVc2Ug
RFJNX0RFQlVHX0RSSVZFUiBmb3IgZHJpdmVyIG1lc3NhZ2VzCiAgZHJtL3RlZ3JhOiB2aWM6IFNr
aXAgc3RyZWFtIElEIHByb2dyYW1taW5nIHdpdGhvdXQgSU9NTVUKICBkcm0vdGVncmE6IHZpYzog
SW5oZXJpdCBETUEgbWFzayBmcm9tIGhvc3QxeAogIGRybS90ZWdyYTogdmljOiBVc2UgY29tbW9u
IElPTU1VIGF0dGFjaC9kZXRhY2ggY29kZQogIGRybS90ZWdyYTogTW92ZSBJT01NVSBncm91cCBp
bnRvIGhvc3QxeCBjbGllbnQKICBkcm0vdGVncmE6IGdlbTogUmVuYW1lIHBhZGRyIC0+IGlvdmEK
ICBkcm0vdGVncmE6IGdlbTogVXNlIGRtYV9nZXRfc2d0YWJsZSgpCiAgZHJtL3RlZ3JhOiBnZW06
IEFsd2F5cyBtYXAgU0cgdGFibGVzIGZvciBETUEtQlVGcwogIGRybS90ZWdyYTogZ2VtOiBVc2Ug
c2dfYWxsb2NfdGFibGVfZnJvbV9wYWdlcygpCgogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMg
ICB8IDI0ICsrKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuaCAgIHwg
IDIgLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyAgfCAzMCArKysrKysrKysrLS0tLS0t
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uaCAgfCAgNiArKy0tLQogZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL2ZiLmMgICB8ICA0ICstLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5j
ICB8IDM3ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEv
Z2VtLmggIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9ncjJkLmMgfCAxMiArKysrLS0t
LS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9ncjNkLmMgfCAxMiArKysrLS0tLS0KIGRyaXZlcnMv
Z3B1L2RybS90ZWdyYS9odWIuYyAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5j
ICB8IDUxICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUv
aG9zdDF4L2J1cy5jICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9ob3N0MXgvY2hhbm5lbC5jIHwg
MTMgKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9ob3N0MXgvY2hhbm5lbC5oIHwgIDEgKwogZHJpdmVy
cy9ncHUvaG9zdDF4L2Rldi5jICAgICB8IDEyICsrKysrKysrKwogZHJpdmVycy9ncHUvaG9zdDF4
L2ludHIuYyAgICB8ICAxIC0KIGluY2x1ZGUvbGludXgvaG9zdDF4LmggICAgICAgfCAgNCArKy0K
IDE3IGZpbGVzIGNoYW5nZWQsIDExNCBpbnNlcnRpb25zKCspLCAxMDEgZGVsZXRpb25zKC0pCgot
LSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
