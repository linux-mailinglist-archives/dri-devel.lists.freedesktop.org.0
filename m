Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2A07BA71
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF37B6E6C0;
	Wed, 31 Jul 2019 07:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9B28986D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 19:29:38 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 19so30350991pfa.4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 12:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Y+Z4pnc0JucsBU6cBRK5vZR18lsIs+7jdcMlSRJldAM=;
 b=GHKDqDx8llDZ2itM3JvazS8JQXMSW/mfF4lIbeiVtTp0N9WKuO/K9rZ7DVNCgHkxpf
 gi7cV1qQymtRzAGvRWWZxBSoPFDcbLFJa1Xf7FwSMft1jPt46t/MePvlKRT/6alJCgh9
 UhYHqD1mLOruBkb8taWvi/nDC0+LsdnJ45nUGcHZ2kbkh08MKNQumYkC1W+ERO5fY3Yp
 LwOWeuGRA71wuWOpfN+njzF8jgc7ZIQMWmnotaadMwIynnxf4C7IagcSYEMRC35H95UJ
 xM+RyRjX08krtRTGZK+fvO3TypDVeE8QUzfmP0ADMq4XVJTKSDFYKfVQxr+/QCHAizrE
 7veA==
X-Gm-Message-State: APjAAAWvFUHYkLTRH48AMySLweLrWGlVUR2/EmsmuvUZg5KUa+lB4mh1
 C+rj+GIE43gl0zIgOj/GBis=
X-Google-Smtp-Source: APXvYqzjX6/N73oQ92lnyuPiSRKxYuv2wQ9u6FtCOsJTd7+yl6rJuIeKSmKph3ilFfN340WUgdjYKw==
X-Received: by 2002:aa7:8817:: with SMTP id c23mr43961590pfo.146.1564514978219; 
 Tue, 30 Jul 2019 12:29:38 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([106.51.16.0])
 by smtp.gmail.com with ESMTPSA id o32sm62411228pje.9.2019.07.30.12.29.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 30 Jul 2019 12:29:37 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: FlorianSchandinat@gmx.de,
	b.zolnierkie@samsung.com
Subject: [PATCH] video: fbdev:via: Remove dead code
Date: Wed, 31 Jul 2019 01:03:20 +0530
Message-Id: <1564515200-5020-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Y+Z4pnc0JucsBU6cBRK5vZR18lsIs+7jdcMlSRJldAM=;
 b=J3J6fSLgyRAglDa91wM/WVpOub0dsDIGNqdsu1Tea+QoDMMw2jma8/oHcfiQ674cxV
 SGM7oWPI9HxiZD/zSFxrolfjn7ArdtnRmmMU+e9BgYatHIQBpxtcR++ss8iB6UHaq69T
 0ANSCqVVCNzXEKPO5jeo3kbhlSzMhZJipJNOmcNRU2FeHa4Ugjn2ZFEVEw2zF1xI/YMu
 os/CS4b8e8cLNF43RyPEXshPbDam8jORD/qqygREThewtg1ghM/f8AKfNYZLkXDfVs1+
 NVSlY+R1xu/gK7xGenjd36jma6jr6N2VOXQ4GT+0j1PHdAdwqbJT+tk4SvWjJE8b/NHo
 hd9A==
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Souptick Joarder <jrdr.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBkZWFkIGNvZGUgc2luY2UgMy4xNS4gSWYgdGhlcmUgaXMgbm8gcGxhbiB0byB1c2UK
aXQgZnVydGhlciwgdGhpcyBjYW4gYmUgcmVtb3ZlZCBmb3JldmVyLgoKU2lnbmVkLW9mZi1ieTog
U291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy92aWRl
by9mYmRldi92aWEvdmlhLWNvcmUuYyB8IDQzIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aWRlby9mYmRldi92aWEvdmlhLWNvcmUuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYv
dmlhL3ZpYS1jb3JlLmMKaW5kZXggZTJiMjA2Mi4uZmZhMmNhMiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy92aWRlby9mYmRldi92aWEvdmlhLWNvcmUuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Zp
YS92aWEtY29yZS5jCkBAIC0yMjEsNDkgKzIyMSw2IEBAIHZvaWQgdmlhZmJfcmVsZWFzZV9kbWEo
dm9pZCkKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKHZpYWZiX3JlbGVhc2VfZG1hKTsKIAotCi0jaWYg
MAotLyoKLSAqIENvcHkgYSBzaW5nbGUgYnVmZmVyIGZyb20gRkIgbWVtb3J5LCBzeW5jaHJvbm91
c2x5LiAgVGhpcyBjb2RlIHdvcmtzCi0gKiBidXQgaXMgbm90IGN1cnJlbnRseSB1c2VkLgotICov
Ci12b2lkIHZpYWZiX2RtYV9jb3B5X291dCh1bnNpZ25lZCBpbnQgb2Zmc2V0LCBkbWFfYWRkcl90
IHBhZGRyLCBpbnQgbGVuKQotewotCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Ci0JaW50IGNzcjsKLQot
CW11dGV4X2xvY2soJnZpYWZiX2RtYV9sb2NrKTsKLQlpbml0X2NvbXBsZXRpb24oJnZpYWZiX2Rt
YV9jb21wbGV0aW9uKTsKLQkvKgotCSAqIFByb2dyYW0gdGhlIGNvbnRyb2xsZXIuCi0JICovCi0J
c3Bpbl9sb2NrX2lycXNhdmUoJmdsb2JhbF9kZXYucmVnX2xvY2ssIGZsYWdzKTsKLQl2aWFmYl9t
bWlvX3dyaXRlKFZETUFfQ1NSMCwgVkRNQV9DX0VOQUJMRXxWRE1BX0NfRE9ORSk7Ci0JLyogRW5h
YmxlIGludHM7IG11c3QgaGFwcGVuIGFmdGVyIENTUjAgd3JpdGUhICovCi0JdmlhZmJfbW1pb193
cml0ZShWRE1BX01SMCwgVkRNQV9NUl9URElFKTsKLQl2aWFmYl9tbWlvX3dyaXRlKFZETUFfTUFS
TDAsIChpbnQpIChwYWRkciAmIDB4ZmZmZmZmZjApKTsKLQl2aWFmYl9tbWlvX3dyaXRlKFZETUFf
TUFSSDAsIChpbnQpICgocGFkZHIgPj4gMjgpICYgMHhmZmYpKTsKLQkvKiBEYXRhIHNoZWV0IHN1
Z2dlc3RzIERBUjAgc2hvdWxkIGJlIDw8NCwgYnV0IGl0IGxpZXMgKi8KLQl2aWFmYl9tbWlvX3dy
aXRlKFZETUFfREFSMCwgb2Zmc2V0KTsKLQl2aWFmYl9tbWlvX3dyaXRlKFZETUFfRFFXQ1IwLCBs
ZW4gPj4gNCk7Ci0JdmlhZmJfbW1pb193cml0ZShWRE1BX1RNUjAsIDApOwotCXZpYWZiX21taW9f
d3JpdGUoVkRNQV9EUFJMMCwgMCk7Ci0JdmlhZmJfbW1pb193cml0ZShWRE1BX0RQUkgwLCAwKTsK
LQl2aWFmYl9tbWlvX3dyaXRlKFZETUFfUE1SMCwgMCk7Ci0JY3NyID0gdmlhZmJfbW1pb19yZWFk
KFZETUFfQ1NSMCk7Ci0JdmlhZmJfbW1pb193cml0ZShWRE1BX0NTUjAsIFZETUFfQ19FTkFCTEV8
VkRNQV9DX1NUQVJUKTsKLQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZnbG9iYWxfZGV2LnJlZ19s
b2NrLCBmbGFncyk7Ci0JLyoKLQkgKiBOb3cgd2UganVzdCB3YWl0IHVudGlsIHRoZSBpbnRlcnJ1
cHQgaGFuZGxlciBzYXlzCi0JICogd2UncmUgZG9uZS4KLQkgKi8KLQl3YWl0X2Zvcl9jb21wbGV0
aW9uX2ludGVycnVwdGlibGUoJnZpYWZiX2RtYV9jb21wbGV0aW9uKTsKLQl2aWFmYl9tbWlvX3dy
aXRlKFZETUFfTVIwLCAwKTsgLyogUmVzZXQgaW50IGVuYWJsZSAqLwotCW11dGV4X3VubG9jaygm
dmlhZmJfZG1hX2xvY2spOwotfQotRVhQT1JUX1NZTUJPTF9HUEwodmlhZmJfZG1hX2NvcHlfb3V0
KTsKLSNlbmRpZgotCiAvKgogICogRG8gYSBzY2F0dGVyL2dhdGhlciBETUEgY29weSBmcm9tIEZC
IG1lbW9yeS4gIFlvdSBtdXN0IGhhdmUgZG9uZQogICogYSBzdWNjZXNzZnVsIGNhbGwgdG8gdmlh
ZmJfcmVxdWVzdF9kbWEoKSBmaXJzdC4KLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
