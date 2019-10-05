Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5A6CCA51
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 16:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CEC6E373;
	Sat,  5 Oct 2019 14:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D796E373
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 14:19:24 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id x127so5657665pfb.7
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Oct 2019 07:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jdWK5vcnTFqPnDbfTqA+QzxqCP19t4414D5Iqnjivjw=;
 b=WU5zgn6oqnxWu01CCo5ZHCCxyMNGAp1UUu+mE71+I2NTVcFOqQt5xfaJZpxkVrkvqQ
 VIJjockEHADcHFtGuQstxXkbieO3TOc8QM8zL6FGWGOw8OeLg6QbdOixLWWGh6jON+O7
 j6xb9y3jUaKTDgB2Al/1NtcJ7ztDQOxwWiYRLoI8KZmmEH7ASY3Fh2BjaRQxZvv7sh4M
 zKvbouRZoGBCKYo15JZSGBcOGvmqz9OuqAguevr/nS/1V/7pLs9gEPuW2GiPmXBxTpyM
 +t2lDMFlihR4T4NXz+3qSUYpoRV8R9Hgdrsqk6NgU0oH7sbsUaudlNJE8odpzihEGyx2
 kpdA==
X-Gm-Message-State: APjAAAX/ure7ulq1xYgXk7ksbvW8nhh6LGkNe8Wj1W0+OGG8Maqhb7EQ
 Py8My+TCMU4fTVJdJQQqM0Qa2Q==
X-Google-Smtp-Source: APXvYqwk1UplFcpr14yl8Ol/aKp4v+RqV5P1b8raPNprUYPv/a1x8kHBAbG4SDprN6vZk6cwyggzxw==
X-Received: by 2002:a63:d754:: with SMTP id w20mr6349432pgi.74.1570285163831; 
 Sat, 05 Oct 2019 07:19:23 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.31])
 by smtp.gmail.com with ESMTPSA id y138sm8977604pfb.174.2019.10.05.07.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2019 07:19:22 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v10 0/6] drm/sun4i: Allwinner A64 MIPI-DSI support
Date: Sat,  5 Oct 2019 19:49:07 +0530
Message-Id: <20191005141913.22020-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jdWK5vcnTFqPnDbfTqA+QzxqCP19t4414D5Iqnjivjw=;
 b=RLuH2sZmuDvU+uZL9GR5HKUHIyvGHORFuotX786UAEAO4gjExN56qdYbwWBsyNCJB9
 lB2cWvH+S52Iu4E0wWtFxOctbuBR6AG5xSCkDqwE5f1QZ1hxqVVtCJMIZEnl9D49ZEbm
 U98Psud4qpBIol8tKfWnPmsQqbYwrRnDBOLeA=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyB2MTAgdmVyc2lvbiBmb3IgQWxsd2lubmVyIEE2NCBNSVBJLURTSSBzdXBwb3J0CmFu
ZCBoZXJlIGlzIHRoZSBwcmV2aW91cyB2ZXJzaW9uIHNldFsxXS4KClRoaXMgc2VyaWVzIG9uIHRv
cCBvZiBkcm0tbWlzYy9mb3ItbGludXgtbmV4dCBhbG9uZyB3aXRoIHZpZGVvIHN0YXJ0CmRlbGF5
IGZpeCBbMl0KCkNoYW5nZXMgZm9yIHYxMDoKLSB1cGRhdGVkIGR0LWJpbmRpbmdzIGFzIHBlciAu
eWFtbCBmb3JtYXQKLSByZWJhc2VkIG9uIGRybS1taXNjL2Zvci1saW51eC1uZXh0CkNoYW5nZXMg
Zm9yIHY5OgotIG1vdmVkIGRzaSBmaXhlcyBpbiBzZXBhcmF0ZSBzZXJpZXMgb24gdG9wIG9mIEEz
MyBbMl0KLSByZWJhc2Ugb24gbGludXgtbmV4dCBhbmQgb24gdG9wIG9mIFsyXQpDaGFuZ2VzIGZv
ciB2ODoKLSByZWJhc2VkIG9uIGRybS1taXNjIGNoYW5nZSBhbG9uZyB3aXRoIGxpbnV4LW5leHQK
LSByZXdvcmtlZCB2aWRlbyBzdGFydCBkZWxheSBwYXRjaAotIHRlc3RlZCBvbiA0IGRpZmZlcmVu
dCBkc2kgcGFuZWxzCi0gcmV3b3JrZWQgY29tbWl0IG1lc3NhZ2VzCkNoYW5nZXMgZm9yIHY3Ogot
IG1vdmVkIHZjYy1kc2kgYmluZGluZyB0byByZXF1aXJlZCBmaWxlZC4KLSBkcm9wIHF1b3RlcyBv
biBmYWxsYmFjayBkcGh5IGJpbmRpbmdzLgotIGRyb3AgbWluX3JhdGUgY2xvY2sgcGxsLW1pcGkg
cGF0Y2hlcy4KLSBpbnRyb2R1Y2UgZGNsayBkaXZpZGVyIGNvbXB1dGF0aW9uIGFzIGxpa2UgQTY0
IEJTUC4KLSBhZGQgQTY0IERTSSBxdWFyayBwYXRjaGVzLgotIGZpeGVkIEE2NCBEU0kgcGlwZWxp
bmUuCi0gYWRkIHByb3BlciBjb21taXQgbWVzc2FnZXMuCi0gY29sbGVjdCBNZXJsaWpuIFdhamVy
IFRlc3RlZC1ieSBjcmVkaXRzLgpDaGFuZ2VzIGZvciB2NjoKLSBkcm9wcGVkIHVubmVlZGVkIGNo
YW5nZXMsIHBhdGNoZXMKLSBmaXhlZCBhbGwgYnVyc3QgbW9kZSBwYXRjaGVzIGFzIHBlciBwcmV2
aW91cyB2ZXJzaW9uIGNvbW1lbnRzCi0gcmViYXNlIG9uIG1hc3RlcgotIHVwZGF0ZSBwcm9wZXIg
Y29tbWl0IG1lc3NhZ2UKLSBkcm9wcGVkIHVubmVlZGVkIGNvbW1lbnRzCi0gb3JkZXIgdGhlIHBh
dGNoZXMgdGhhdCBtYWtlIHJldmlldyBlYXN5CkNoYW5nZXMgZm9yIHY1OgotIGNvbGxlY3QgUm9i
LCBBY2tlZC1ieQotIGRyb3BlZCAiRml4IFZCUCBzaXplIGNhbGN1bGF0aW9uIiBwYXRjaAotIHVw
ZGF0ZWQgdmJsayB0aW1pbmcgY2FsY3VsYXRpb24uCi0gZHJvcGVkIHRlY2hzdGFyLCBiYW5hbmFw
aSBkc2kgcGFuZWwgZHJpdmVycyB3aGljaCBtYXkgcmVxdWlyZQogIGJyaWRnZSBvciBvdGhlciBz
ZXR1cC4gaXQncyB1bmRlciBkaXNjdXNzaW9uLgpDaGFuZ2VzIGZvciB2NDoKLSBkcm9wcG9lZCB1
bnRlc3RlZCBDQ1VfRkVBVFVSRV9GSVhFRF9QT1NURElWIGNoZWNrIGNvZGUgaW4KICBua20gbWlu
LCBtYXggcmF0ZSBwYXRjaGVzCi0gY3JlYXRlIHR3byBwYXRjaGVzIGZvciAiQWRkIEFsbHdpbm5l
ciBBNjQgTUlQSSBEU0kgc3VwcG9ydCIKICBvbmUgZm9yIGhhc19tb2RfY2xrIHF1aXJrIGFuZCBv
dGhlciBvbmUgZm9yIEE2NCBzdXBwb3J0Ci0gdXNlIGV4aXN0aW5nIGRyaXZlciBjb2RlIGNvbnN0
cnVjdCBmb3IgaGJsayBjb21wdXRhdGlvbgotIGRyb3BwZWQgIkluY3JlYXNlIGhmcCBwYWNrZXQg
b3ZlcmhlYWQiIHBhdGNoIFsyXSwgdGhvdWdoIEJTUCBhZGRlZAogIHRoaXMgYnV0IHdlIGhhdmUg
bm8gaXNzdWVzIGFzIG9mIG5vdy4KICAobm8gaXNzdWVzIG9uIHBhbmVsIHNpZGUgdy9vIHRoaXMg
Y2hhbmdlKQotIGNyZWF0ZSBzZXBhcmF0ZSBmdW5jdGlvbiBmb3IgdmJsayBjb21wdXRhdGlvbiAK
LSBlbmFibGUgdmNjLWRzaSByZWd1bGF0b3IgaW4gZHNpX3J1bnRpbWVfcmVzdW1lCi0gY29sbGVj
dCBSb2IsIEFja2VkLWJ5Ci0gdXBkYXRlIE1BSU5UQUlORVJTIGZpbGUgZm9yIHBhbmVsIGRyaXZl
cnMKLSBjbGVhbnVwIGNvbW1pdCBtZXNzYWdlcwotIGZpeGVkIGNoZWNrcGF0Y2ggd2FybmluZ3Mv
ZXJyb3JzCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MTMx
MC8KWzJdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zMzQwODYvCgpB
bnkgaW5wdXRzPwpKYWdhbi4KCkphZ2FuIFRla2kgKDYpOgogIGR0LWJpbmRpbmdzOiBzdW42aS1k
c2k6IEFkZCBBNjQgTUlQSS1EU0kgY29tcGF0aWJsZQogIGR0LWJpbmRpbmdzOiBzdW42aS1kc2k6
IEFkZCBBNjQgRFBIWSBjb21wYXRpYmxlICh3LyBBMzEgZmFsbGJhY2spCiAgZHJtL3N1bjRpOiBk
c2k6IEFkZCBoYXNfbW9kX2NsayBxdWlyawogIGRybS9zdW40aTogZHNpOiBBZGQgQWxsd2lubmVy
IEE2NCBNSVBJIERTSSBzdXBwb3J0CiAgYXJtNjQ6IGR0czogYWxsd2lubmVyOiBhNjQ6IEFkZCBN
SVBJIERTSSBwaXBlbGluZQogIFtETyBOT1QgTUVSR0VdIGFybTY0OiBkdHM6IGFsbHdpbm5lcjog
YmFuYW5hcGktbTY0OiBFbmFibGUgQmFuYW5hcGkgUzA3MFdWMjAtQ1QxNiBEU0kKICAgIHBhbmVs
CgogLi4uL2Rpc3BsYXkvYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRzaS55YW1sIHwgIDQgKy0K
IC4uLi9waHkvYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRwaHkueWFtbCAgICB8ICA2ICsrLQog
Li4uL2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC1iYW5hbmFwaS1tNjQuZHRzIHwgMzEgKysrKysr
KysrKysrKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQuZHRzaSB8
IDM4ICsrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9k
c2kuYyAgICAgICAgfCA0MiArKysrKysrKysrKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3Vu
NGkvc3VuNmlfbWlwaV9kc2kuaCAgICAgICAgfCAgNSArKysKIDYgZmlsZXMgY2hhbmdlZCwgMTE0
IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKLS0gCjIuMTguMC4zMjEuZ2ZmYzZmYTBl
MwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
