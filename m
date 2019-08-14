Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9BE8DFD8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 23:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84E36E84E;
	Wed, 14 Aug 2019 21:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAE36E84C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 21:31:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y8so429920wrn.10
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 14:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OnqmTFBl6UH0AjitgL4NS1jwiF8ciOoeoor1qBPQFQM=;
 b=SP9W3hroMuehfX3Xn+4U0uCKtqoiedkMchtEUfJUERxoyFG7cNA7DJkDB9gozxDJCp
 ItfXN7f4pjiYzLR2X5xZGTYuxAto/0xDQBpcmjd3O4agvB+bW0bgSSTGepDKZE/y4kB0
 vlYIlvVbHsIauJznbziSmQ5kU4TVJnnCGMmn159ItLuLaRICDUz/gpjldgdXzaZvuhEv
 Or9CrOpZ77HMf+vic/A8cJYEohyAt62un2ei0GWgPN/rdoVMlcbl15bSmyqsTxSLJxMm
 qHXZ/dtVP61PPbt7K20t89WUvprsNg14Pu/7m5fvMadFK7dY/hc175F9uxARm5Ou3Rcz
 iKDw==
X-Gm-Message-State: APjAAAU1qdJFRKkmM2S12LJJOKukJGzyV4wrZntnZ1gPjodxCBGRTbFO
 2SYW5l28G9PKHud9DEjeuIn/sQ==
X-Google-Smtp-Source: APXvYqzSVT+o3wy2DXl2BjBaEcVKdDbY4rCB1w2Yu2iz4eCbRD6vvvxvJe0FB/RLEmTeX7aqPb9o/w==
X-Received: by 2002:adf:ce05:: with SMTP id p5mr1630518wrn.197.1565818283445; 
 Wed, 14 Aug 2019 14:31:23 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8108:453f:d1a0:28d1:9d88:57f6:f95b])
 by smtp.gmail.com with ESMTPSA id r17sm2095134wrg.93.2019.08.14.14.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 14:31:22 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to enable dGPU
 direct output"
Date: Wed, 14 Aug 2019 23:31:12 +0200
Message-Id: <20190814213118.28473-2-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814213118.28473-1-kherbst@redhat.com>
References: <20190814213118.28473-1-kherbst@redhat.com>
MIME-Version: 1.0
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
Cc: Karol Herbst <kherbst@redhat.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Alex Hung <alex.hung@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCAyODU4NmE1MWVlYTY2NmQ1NTMxYmNhZWYyZjY4ZTRhYmJkODcy
NDJjLgoKVGhlIG9yaWdpbmFsIGNvbW1pdCBtZXNzYWdlIGRpZG4ndCBldmVuIG1ha2Ugc2Vuc2Uu
IEFNRCBfZG9lc18gc3VwcG9ydCBpdCBhbmQKaXQgd29ya3Mgd2l0aCBOb3V2ZWF1IGFzIHdlbGwu
CgpBbHNvIHdoYXQgd2FzIHRoZSBpc3N1ZSBiZWluZyBzb2x2ZWQgaGVyZT8gTm8gcmVmZXJlbmNl
cyB0byBhbnkgYnVncyBhbmQgbm90CmV2ZW4gZXhwbGFpbmluZyBhbnkgaXNzdWUgYXQgYWxsIGlz
bid0IHRoZSB3YXkgd2UgZG8gdGhpbmdzLgoKQW5kIGV2ZW4gaWYgaXQgbWVhbnMgYSBtdXhlZCBk
ZXNpZ24sIHRoZW4gdGhlIGZpeCBpcyB0byBtYWtlIGl0IHdvcmsgaW5zaWRlIHRoZQpkcml2ZXIs
IG5vdCBhZGRpbmcgc29tZSBoYWNreSB3b3JrYXJvdW5kIHRocm91Z2ggQUNQSSB0cmlja3MuCgpB
bmQgd2hhdCBvdXQgb2YgdHJlZSBkcml2ZXJzIGRvIG9yIGRvIG5vdCBzdXBwb3J0IHdlIGRvbid0
IGNhcmUgb25lIGJpdCBhbnl3YXkuCgpTaWduZWQtb2ZmLWJ5OiBLYXJvbCBIZXJic3QgPGtoZXJi
c3RAcmVkaGF0LmNvbT4KQ0M6IEFsZXggSHVuZyA8YWxleC5odW5nQGNhbm9uaWNhbC5jb20+CkND
OiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsLmoud3lzb2NraUBpbnRlbC5jb20+CkNDOiBEYXZl
IEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpDQzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0
LmNvbT4KQ0M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2Fj
cGkvb3NpLmMgfCA3IC0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9vc2kuYyBiL2RyaXZlcnMvYWNwaS9vc2kuYwppbmRleCBi
ZWMwYmViYzdmNTIuLjliMjBhYzRkNzlhMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9hY3BpL29zaS5j
CisrKyBiL2RyaXZlcnMvYWNwaS9vc2kuYwpAQCAtNjEsMTMgKzYxLDYgQEAgb3NpX3NldHVwX2Vu
dHJpZXNbT1NJX1NUUklOR19FTlRSSUVTX01BWF0gX19pbml0ZGF0YSA9IHsKIAkgKiBhIEJJT1Mg
d29ya2Fyb3VuZC4KIAkgKi8KIAl7IkxpbnV4LUxlbm92by1OVi1IRE1JLUF1ZGlvIiwgdHJ1ZX0s
Ci0JLyoKLQkgKiBMaW51eC1IUEktSHlicmlkLUdyYXBoaWNzIGlzIHVzZWQgYnkgQklPUyB0byBl
bmFibGUgZEdQVSB0bwotCSAqIG91dHB1dCB2aWRlbyBkaXJlY3RseSB0byBleHRlcm5hbCBtb25p
dG9ycyBvbiBIUCBJbmMuIG1vYmlsZQotCSAqIHdvcmtzdGF0aW9ucyBhcyBOdmlkaWEgYW5kIEFN
RCBWR0EgZHJpdmVycyBwcm92aWRlIGxpbWl0ZWQKLQkgKiBoeWJyaWQgZ3JhcGhpY3Mgc3VwcG9y
dHMuCi0JICovCi0JeyJMaW51eC1IUEktSHlicmlkLUdyYXBoaWNzIiwgdHJ1ZX0sCiB9OwogCiBz
dGF0aWMgdTMyIGFjcGlfb3NpX2hhbmRsZXIoYWNwaV9zdHJpbmcgaW50ZXJmYWNlLCB1MzIgc3Vw
cG9ydGVkKQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
