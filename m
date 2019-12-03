Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C05610FF17
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073BD898BE;
	Tue,  3 Dec 2019 13:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864A8898BE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:48:29 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id o11so1545189pjp.9
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 05:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7fyH+2F2a+rl1kectMRnZFlHTKNuWeTnYPoVBXe5Db4=;
 b=VWtcd2fHPwrR769vBnmhNkFr1Dilaky63lunUZprIoDXmzIMFn6C1GVGCYqpczatxV
 mBur681Az/bPRuMsuFuAayGiPbKS2XxprvdxE+CmxTWks4Fnr/+cbdw3M1mLqLDdzRTb
 okBPfyuwTRJTlSJJUoragn67kuBqxRVCEs1IdEypFa++iw+rssOq5K0uz07/yPxsmqUh
 3i2X4uJHw5/o07ovPYpuHRme4rvk4uYT+2B4E3BcT6vV1PK4VsvaFW52JtlITA22iuM3
 OzDvXQMM0MUDvoHHX8xx+RNUUhKey29DYS1vSVg/yvrU/p04m1WcO+VseqAtCXdZFO9U
 4TEg==
X-Gm-Message-State: APjAAAUOXNKkdHh+yarYUWMW1gipSN3ap5j3SJpTiQUvZYUU73HyQVx5
 aYBgMmCX65Ad6TUY1g4Ey+7FtA==
X-Google-Smtp-Source: APXvYqzbpkPoRAjx7jYyIBTmDtEHbDTA8NmXpToYJsChd3LnIUvBCuRXvE+x3s8pofxO0AXSfe7fjg==
X-Received: by 2002:a17:902:fe12:: with SMTP id
 g18mr4992444plj.20.1575380908885; 
 Tue, 03 Dec 2019 05:48:28 -0800 (PST)
Received: from localhost.localdomain ([115.97.190.29])
 by smtp.gmail.com with ESMTPSA id y144sm4397892pfb.188.2019.12.03.05.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 05:48:28 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v12 0/7] drm/sun4i: Allwinner A64 MIPI-DSI support
Date: Tue,  3 Dec 2019 19:18:09 +0530
Message-Id: <20191203134816.5319-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7fyH+2F2a+rl1kectMRnZFlHTKNuWeTnYPoVBXe5Db4=;
 b=O7md203+f98TyLan33Yz4aeIVna2Ip1fUra9eSfxZt0oM+104KLRNIYxIR3+igDF91
 ZSIlXuIuSFdOCRwQA6VRzSsU2uUWuWRdGZ3LpLOzawoqqBUauMRZWt0AH5gcrW+KIbbg
 TGcdTj7F2aaAZV+V9yBZPetyHggQ+sa8SJ5gI=
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
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyB2MTIgdmVyc2lvbiBmb3IgQWxsd2lubmVyIEE2NCBNSVBJLURTSSBzdXBwb3J0CmFu
ZCBoZXJlIGlzIHRoZSBwcmV2aW91cyB2ZXJzaW9uIHNldFsxXQoKQ2hhbmdlcyBmb3IgdjEyOgot
IHVzZSBlbnVtIGluc3RlZCBvZiBvbmVPZitjb25zdAotIGhhbmRsZSBidXMgY2xvY2sgdXNpbmcg
cmVnbWFwIGF0dGFjaCBjbGsKLSB0ZXN0ZWQgb24gQTY0LCBBMzMgYm9hcmRzLgpDaGFuZ2VzIGZv
ciB2MTE6Ci0gZml4IGR0LWJpbmRpbmdzIGZvciBkcGh5Ci0gZml4IGR0LWJpbmRpbmdzIGZvciBk
c2kgY29udHJvbGxlcgotIGFkZCBidXMgY2xvY2sgaGFuZGxpbmcgY29kZQotIHRlc3RlZCBvbiBB
NjQsIEEzMyBib2FyZHMuCkNoYW5nZXMgZm9yIHYxMDoKLSB1cGRhdGVkIGR0LWJpbmRpbmdzIGFz
IHBlciAueWFtbCBmb3JtYXQKLSByZWJhc2VkIG9uIGRybS1taXNjL2Zvci1saW51eC1uZXh0CkNo
YW5nZXMgZm9yIHY5OgotIG1vdmVkIGRzaSBmaXhlcyBpbiBzZXBhcmF0ZSBzZXJpZXMgb24gdG9w
IG9mIEEzMwotIHJlYmFzZSBvbiBsaW51eC1uZXh0CkNoYW5nZXMgZm9yIHY4OgotIHJlYmFzZWQg
b24gZHJtLW1pc2MgY2hhbmdlIGFsb25nIHdpdGggbGludXgtbmV4dAotIHJld29ya2VkIHZpZGVv
IHN0YXJ0IGRlbGF5IHBhdGNoCi0gdGVzdGVkIG9uIDQgZGlmZmVyZW50IGRzaSBwYW5lbHMKLSBy
ZXdvcmtlZCBjb21taXQgbWVzc2FnZXMKQ2hhbmdlcyBmb3Igdjc6Ci0gbW92ZWQgdmNjLWRzaSBi
aW5kaW5nIHRvIHJlcXVpcmVkIGZpbGVkLgotIGRyb3AgcXVvdGVzIG9uIGZhbGxiYWNrIGRwaHkg
YmluZGluZ3MuCi0gZHJvcCBtaW5fcmF0ZSBjbG9jayBwbGwtbWlwaSBwYXRjaGVzLgotIGludHJv
ZHVjZSBkY2xrIGRpdmlkZXIgY29tcHV0YXRpb24gYXMgbGlrZSBBNjQgQlNQLgotIGFkZCBBNjQg
RFNJIHF1YXJrIHBhdGNoZXMuCi0gZml4ZWQgQTY0IERTSSBwaXBlbGluZS4KLSBhZGQgcHJvcGVy
IGNvbW1pdCBtZXNzYWdlcy4KLSBjb2xsZWN0IE1lcmxpam4gV2FqZXIgVGVzdGVkLWJ5IGNyZWRp
dHMuCkNoYW5nZXMgZm9yIHY2OgotIGRyb3BwZWQgdW5uZWVkZWQgY2hhbmdlcywgcGF0Y2hlcwot
IGZpeGVkIGFsbCBidXJzdCBtb2RlIHBhdGNoZXMgYXMgcGVyIHByZXZpb3VzIHZlcnNpb24gY29t
bWVudHMKLSByZWJhc2Ugb24gbWFzdGVyCi0gdXBkYXRlIHByb3BlciBjb21taXQgbWVzc2FnZQot
IGRyb3BwZWQgdW5uZWVkZWQgY29tbWVudHMKLSBvcmRlciB0aGUgcGF0Y2hlcyB0aGF0IG1ha2Ug
cmV2aWV3IGVhc3kKQ2hhbmdlcyBmb3IgdjU6Ci0gY29sbGVjdCBSb2IsIEFja2VkLWJ5Ci0gZHJv
cGVkICJGaXggVkJQIHNpemUgY2FsY3VsYXRpb24iIHBhdGNoCi0gdXBkYXRlZCB2YmxrIHRpbWlu
ZyBjYWxjdWxhdGlvbi4KLSBkcm9wZWQgdGVjaHN0YXIsIGJhbmFuYXBpIGRzaSBwYW5lbCBkcml2
ZXJzIHdoaWNoIG1heSByZXF1aXJlCiAgYnJpZGdlIG9yIG90aGVyIHNldHVwLiBpdCdzIHVuZGVy
IGRpc2N1c3Npb24uCkNoYW5nZXMgZm9yIHY0OgotIGRyb3Bwb2VkIHVudGVzdGVkIENDVV9GRUFU
VVJFX0ZJWEVEX1BPU1RESVYgY2hlY2sgY29kZSBpbgogIG5rbSBtaW4sIG1heCByYXRlIHBhdGNo
ZXMKLSBjcmVhdGUgdHdvIHBhdGNoZXMgZm9yICJBZGQgQWxsd2lubmVyIEE2NCBNSVBJIERTSSBz
dXBwb3J0IgogIG9uZSBmb3IgaGFzX21vZF9jbGsgcXVpcmsgYW5kIG90aGVyIG9uZSBmb3IgQTY0
IHN1cHBvcnQKLSB1c2UgZXhpc3RpbmcgZHJpdmVyIGNvZGUgY29uc3RydWN0IGZvciBoYmxrIGNv
bXB1dGF0aW9uCi0gZHJvcHBlZCAiSW5jcmVhc2UgaGZwIHBhY2tldCBvdmVyaGVhZCIgcGF0Y2gg
WzJdLCB0aG91Z2ggQlNQIGFkZGVkCiAgdGhpcyBidXQgd2UgaGF2ZSBubyBpc3N1ZXMgYXMgb2Yg
bm93LgogIChubyBpc3N1ZXMgb24gcGFuZWwgc2lkZSB3L28gdGhpcyBjaGFuZ2UpCi0gY3JlYXRl
IHNlcGFyYXRlIGZ1bmN0aW9uIGZvciB2YmxrIGNvbXB1dGF0aW9uIAotIGVuYWJsZSB2Y2MtZHNp
IHJlZ3VsYXRvciBpbiBkc2lfcnVudGltZV9yZXN1bWUKLSBjb2xsZWN0IFJvYiwgQWNrZWQtYnkK
LSB1cGRhdGUgTUFJTlRBSU5FUlMgZmlsZSBmb3IgcGFuZWwgZHJpdmVycwotIGNsZWFudXAgY29t
bWl0IG1lc3NhZ2VzCi0gZml4ZWQgY2hlY2twYXRjaCB3YXJuaW5ncy9lcnJvcnMKClsxXSBodHRw
czovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzY4NTc5LwoKQW55IGlucHV0cz8K
SmFnYW4uCgpKYWdhbiBUZWtpICg3KToKICBkdC1iaW5kaW5nczogc3VuNmktZHNpOiBEb2N1bWVu
dCBBNjQgTUlQSS1EU0kgY29udHJvbGxlcgogIGR0LWJpbmRpbmdzOiBzdW42aS1kc2k6IEFkZCBB
NjQgRFBIWSBjb21wYXRpYmxlICh3LyBBMzEgZmFsbGJhY2spCiAgZHJtL3N1bjRpOiBkc2k6IEFk
ZCBoYXNfbW9kX2NsayBxdWlyawogIGRybS9zdW40aTogZHNpOiBIYW5kbGUgYnVzIGNsb2NrIHZp
YSByZWdtYXBfbW1pb19hdHRhY2hfY2xrCiAgZHJtL3N1bjRpOiBkc2k6IEFkZCBBbGx3aW5uZXIg
QTY0IE1JUEkgRFNJIHN1cHBvcnQKICBhcm02NDogZHRzOiBhbGx3aW5uZXI6IGE2NDogQWRkIE1J
UEkgRFNJIHBpcGVsaW5lCiAgW0RPIE5PVCBNRVJHRV0gYXJtNjQ6IGR0czogYWxsd2lubmVyOiBi
YW5hbmFwaS1tNjQ6IEVuYWJsZSBCYW5hbmFwaSBTMDcwV1YyMC1DVDE2IERTSSBwYW5lbAoKIC4u
Li9kaXNwbGF5L2FsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1kc2kueWFtbCB8IDIwICsrKystCiAu
Li4vcGh5L2FsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1kcGh5LnlhbWwgICAgfCAgNiArLQogLi4u
L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC1iYW5hbmFwaS1tNjQuZHRzIHwgMzEgKysrKysrKwog
YXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC5kdHNpIHwgMzcgKysrKysr
KysKIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jICAgICAgICB8IDg2ICsr
KysrKysrKysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5o
ICAgICAgICB8ICA1ICsrCiA2IGZpbGVzIGNoYW5nZWQsIDE2NCBpbnNlcnRpb25zKCspLCAyMSBk
ZWxldGlvbnMoLSkKCi0tIAoyLjE4LjAuMzIxLmdmZmM2ZmEwZTMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
