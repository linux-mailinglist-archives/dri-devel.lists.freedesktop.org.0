Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9180321B0A3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6078E6EB7D;
	Fri, 10 Jul 2020 07:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E636E02A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 14:03:27 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f139so1929123wmf.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 07:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0bst64xxtOjncsP7b3inl0oVV1GqFfKwarO1dVnIGUg=;
 b=RlSEx1k/0RDEcv7F8hmNo57u4SHIIMMlUeNJqyvpmORrfQKbSDRu0qFxXB4tthwLrH
 HE3hQtIm/nuFUnIaZuPs4dKydk36y5IaHnr7vlMN4XBj7aqdVy+x3PkkwOJ/UDp66aPE
 w8ofsVjx5cYdcUY2qwsMX6Cem+K1dEijvZSYtUSMR243HYuGBYkmGE/P2eiHiJcuMjXR
 UvxBA7zepgD8oCBKYqUTpX7p0SSW4MDUnEGp5kM6MO2iSpVbj3c9LXNOmeYcV4S3U+V8
 X+8MrB3iT+qpkTp4tIUOVBBhl57g/MO64lrm4cwAFSxwv10PnNA1nUPy8OW9F2pP2xlx
 WJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0bst64xxtOjncsP7b3inl0oVV1GqFfKwarO1dVnIGUg=;
 b=nue2DXzM0dsYeqOv8kFblYPt8rbS9nKDf806OMu+NEe0w27QHfZJwMxq2YJknbtrFT
 teb+QNY+OlyU8FMcCL6p7FJetCGIkudBJ6CZtC0g1wYB7pWZBkzYgVm+fkc728k6TGtr
 TaTD4bigRD3/nwlVdcaXeQIAnvS+k0gATpUUpZjKrd/s9mDpkjjHNbSOE7b5WSqOaUWD
 5EW+CG7EpAFb0fBlIjgrh2I+LNzXEHNloKzUTjN8EqlvVVvHmnq2R/wdm7MoB6D+1Aww
 JQRZWqM7Q7OFSuLEywDej+zPzBc/47eR0lJn19AeP6nHi8ODQaZPK25ZCzccX6btsJMH
 ILhQ==
X-Gm-Message-State: AOAM530oMl2I1/4D/fTn/ZtaVNXDmMCadUEKz9lCVvmmPkopQlN1gOJ2
 c28gqQkkYs7LWKhUxgXUaY65ZTtkFwA=
X-Google-Smtp-Source: ABdhPJw35y9hjR9Q2C+hP3Mo3vFj7fwqv6ZE43ESMYHi/sMQPswl2G73WQQZmMcjvlmstaGg4mM9PA==
X-Received: by 2002:a1c:345:: with SMTP id 66mr150233wmd.31.1594303405926;
 Thu, 09 Jul 2020 07:03:25 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s8sm5545256wru.38.2020.07.09.07.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 07:03:25 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 00/14] Add regulator devfreq support to Panfrost
Date: Thu,  9 Jul 2020 16:03:08 +0200
Message-Id: <20200709140322.131320-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpUaGlzIHNlcmllIGNsZWFucyBhbmQgYWRkcyByZWd1bGF0b3Igc3VwcG9ydCB0byBQYW5m
cm9zdCBkZXZmcmVxLgpUaGlzIGlzIG1vc3RseSBiYXNlZCBvbiBjb21tZW50IGZvciB0aGUgZnJl
c2hseSBpbnRyb2R1Y2VkIGxpbWEKZGV2ZnJlcS4KCldlIG5lZWQgdG8gYWRkIHJlZ3VsYXRvciBz
dXBwb3J0IGJlY2F1c2Ugb24gQWxsd2lubmVyIHRoZSBHUFUgT1BQCnRhYmxlIGRlZmluZXMgYm90
aCBmcmVxdWVuY2llcyBhbmQgdm9sdGFnZXMuCgpGaXJzdCBwYXRjaGVzIFswMS0wN10gc2hvdWxk
IG5vdCBjaGFuZ2UgdGhlIGFjdHVhbCBiZWhhdmlvcgphbmQgaW50cm9kdWNlIGEgcHJvcGVyIHBh
bmZyb3N0X2RldmZyZXEgc3RydWN0LgoKUmVnYXJkcywKQ2zDqW1lbnQKCkNoYW5nZXMgc2luY2Ug
djI6CiAtIENvbGxlY3QgQWx5c3NhIFJvc2VuendlaWcgcmV2aWV3ZWQtYnkgdGFncwogLSBGaXgg
b3BwX3NldF9yZWd1bGF0b3IgYmVmb3JlIGFkZGluZyBvcHBfdGFibGUgKGludHJvZHVjZSBpbiB2
MikKIC0gQ2FsbCBlcnJfZmluaSBpbiBjYXNlIG9wcF9hZGRfdGFibGUgZmFpbGVkCgpDaGFuZ2Vz
IHNpbmNlIHYxOgogLSBDb2xsZWN0IFN0ZXZlbiBQcmljZSByZXZpZXdlZC1ieSB0YWdzCiAtIEZp
eCBzcGlubG9jayBjb21tZW50CiAtIERyb3AgT1BQIGNsb2NrLW5hbWUgcGF0aAogLSBEcm9wIGRl
dmljZV9wcm9wZXJ0eV90ZXN0IHBhdGNoCiAtIEFkZCByZW5hbWUgZXJyb3IgbGFiZWxzIHBhdGNo
CgoKQ2zDqW1lbnQgUMOpcm9uICgxNCk6CiAgZHJtL3BhbmZyb3N0OiBhdm9pZCBzdGF0aWMgZGVj
bGFyYXRpb24KICBkcm0vcGFuZnJvc3Q6IGNsZWFuIGhlYWRlcnMgaW4gZGV2ZnJlcQogIGRybS9w
YW5mcm9zdDogZG9uJ3QgdXNlIHBmZGV2ZnJlcS5idXN5X2NvdW50IHRvIGtub3cgaWYgaHcgaXMg
aWRsZQogIGRybS9wYW5mcm9zdDogaW50cm9kdWNlIHBhbmZyb3N0X2RldmZyZXEgc3RydWN0CiAg
ZHJtL3BhbmZyb3N0OiB1c2Ugc3BpbmxvY2sgaW5zdGVhZCBvZiBhdG9taWMKICBkcm0vcGFuZnJv
c3Q6IHByb3Blcmx5IGhhbmRsZSBlcnJvciBpbiBwcm9iZQogIGRybS9wYW5mcm9zdDogcmVuYW1l
IGVycm9yIGxhYmVscyBpbiBkZXZpY2VfaW5pdAogIGRybS9wYW5mcm9zdDogbW92ZSBkZXZmcmVx
X2luaXQoKS9maW5pKCkgaW4gZGV2aWNlCiAgZHJtL3BhbmZyb3N0OiBkeW5hbWljYWxseSBhbGxv
YyByZWd1bGF0b3JzCiAgZHJtL3BhbmZyb3N0OiBhZGQgcmVndWxhdG9ycyB0byBkZXZmcmVxCiAg
YXJtNjQ6IGRlZmNvbmZpZzogRW5hYmxlIGRldmZyZXEgY29vbGluZyBkZXZpY2UKICBhcm02NDog
ZHRzOiBhbGx3aW5uZXI6IGg2OiBBZGQgY29vbGluZyBtYXAgZm9yIEdQVQogIFtETyBOT1QgTUVS
R0VdIGFybTY0OiBkdHM6IGFsbHdpbm5lcjogaDY6IEFkZCBHUFUgT1BQIHRhYmxlCiAgW0RPIE5P
VCBNRVJHRV0gYXJtNjQ6IGR0czogYWxsd2lubmVyOiBmb3JjZSBHUFUgcmVndWxhdG9yIHRvIGJl
IGFsd2F5cwoKIC4uLi9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1iZWVsaW5rLWdzMS5kdHMgICB8
ICAgMSArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYuZHRzaSAgfCAx
MDIgKysrKysrKysrKwogYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZyAgICAgICAgICAgICAg
ICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMg
ICB8IDE3NSArKysrKysrKysrKystLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9kZXZmcmVxLmggICB8ICAzMCArKy0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9kZXZpY2UuYyAgICB8ICA2MSArKystLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9kZXZpY2UuaCAgICB8ICAxNCArLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2Rydi5jICAgICAgIHwgIDE1ICstCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3Rfam9iLmMgICAgICAgfCAgMTAgKy0KIDkgZmlsZXMgY2hhbmdlZCwgMjk2IGluc2VydGlv
bnMoKyksIDExMyBkZWxldGlvbnMoLSkKCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
