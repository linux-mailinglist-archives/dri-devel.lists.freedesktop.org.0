Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72586EDA29
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 08:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A7B6E152;
	Mon,  4 Nov 2019 07:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1616E117
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 01:40:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 12DE7B22B;
 Mon,  4 Nov 2019 01:40:27 +0000 (UTC)
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To: linux-realtek-soc@lists.infradead.org
Subject: [PATCH 1/7] dt-bindings: gpu: mali-midgard: Tidy up conversion to YAML
Date: Mon,  4 Nov 2019 02:39:26 +0100
Message-Id: <20191104013932.22505-2-afaerber@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191104013932.22505-1-afaerber@suse.de>
References: <20191104013932.22505-1-afaerber@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Nov 2019 07:54:21 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Guillaume Gardet <guillaume.gardet@arm.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiBncm91cGluZyBhbHBoYWJldGljYWxseSBieSB0aGlyZC1wYXJ0eSB2ZW5kb3Is
IGxlYWRpbmcgdG8Kb25lLWVsZW1lbnQgZW51bXMsIHNvcnQgYnkgTWFsaSBtb2RlbCBudW1iZXIs
IGFzIGRvbmUgZm9yIFV0Z2FyZC4KClRoaXMgYWxyZWFkeSBhbGxvd3MgdXMgdG8gZGUtZHVwbGlj
YXRlIHR3byAiYXJtLG1hbGktdDc2MCIgc2VjdGlvbnMgYW5kCndpbGwgbWFrZSBpdCBlYXNpZXIg
dG8gYWRkIG5ldyB2ZW5kb3IgY29tcGF0aWJsZXMuCgpGaXhlczogNTUzY2VkZjYwMDU2ICgiZHQt
YmluZGluZ3M6IENvbnZlcnQgQXJtIE1hbGkgTWlkZ2FyZCBHUFUgdG8gRFQgc2NoZW1hIikKRml4
ZXM6IDFiZTViNTRkMjZhZSAoImR0LWJpbmRpbmdzOiBncHU6IG1hbGktbWlkZ2FyZDogQWRkIHNh
bXN1bmcgZXh5bm9zNTI1MCBjb21wYXRpYmxlIikKQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+ClNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4K
LS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2FyZC55YW1sICB8
IDMyICsrKysrKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25z
KCspLCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2FyZC55YW1sCmluZGV4IDhlMDBhMjFi
MzZmNS4uZmZkYjI0YzRhYjZhIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQueWFtbApAQCAtMTYsMzYgKzE2
LDMyIEBAIHByb3BlcnRpZXM6CiAgICAgb25lT2Y6CiAgICAgICAtIGl0ZW1zOgogICAgICAgICAg
IC0gZW51bToKLSAgICAgICAgICAgICAtIGFsbHdpbm5lcixzdW41MGktaDYtbWFsaQotICAgICAg
ICAgIC0gY29uc3Q6IGFybSxtYWxpLXQ3MjAKLSAgICAgIC0gaXRlbXM6Ci0gICAgICAgICAgLSBl
bnVtOgotICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1neG0tbWFsaQotICAgICAgICAgIC0g
Y29uc3Q6IGFybSxtYWxpLXQ4MjAKKyAgICAgICAgICAgICAtIHNhbXN1bmcsZXh5bm9zNTI1MC1t
YWxpCisgICAgICAgICAgLSBjb25zdDogYXJtLG1hbGktdDYwNAogICAgICAgLSBpdGVtczoKICAg
ICAgICAgICAtIGVudW06CiAgICAgICAgICAgICAgLSBhcm0sanVuby1tYWxpCiAgICAgICAgICAg
LSBjb25zdDogYXJtLG1hbGktdDYyNAorICAgICAgIyAiYXJtLG1hbGktdDYyOCIKICAgICAgIC0g
aXRlbXM6CiAgICAgICAgICAgLSBlbnVtOgotICAgICAgICAgICAgIC0gcm9ja2NoaXAscmszMjg4
LW1hbGkKLSAgICAgICAgICAtIGNvbnN0OiBhcm0sbWFsaS10NzYwCisgICAgICAgICAgICAgLSBh
bGx3aW5uZXIsc3VuNTBpLWg2LW1hbGkKKyAgICAgICAgICAtIGNvbnN0OiBhcm0sbWFsaS10NzIw
CiAgICAgICAtIGl0ZW1zOgogICAgICAgICAgIC0gZW51bToKLSAgICAgICAgICAgICAtIHJvY2tj
aGlwLHJrMzM5OS1tYWxpCi0gICAgICAgICAgLSBjb25zdDogYXJtLG1hbGktdDg2MAorICAgICAg
ICAgICAgIC0gcm9ja2NoaXAscmszMjg4LW1hbGkKKyAgICAgICAgICAgICAtIHNhbXN1bmcsZXh5
bm9zNTQzMy1tYWxpCisgICAgICAgICAgLSBjb25zdDogYXJtLG1hbGktdDc2MAogICAgICAgLSBp
dGVtczoKICAgICAgICAgICAtIGVudW06Ci0gICAgICAgICAgICAgLSBzYW1zdW5nLGV4eW5vczUy
NTAtbWFsaQotICAgICAgICAgIC0gY29uc3Q6IGFybSxtYWxpLXQ2MDQKKyAgICAgICAgICAgICAt
IGFtbG9naWMsbWVzb24tZ3htLW1hbGkKKyAgICAgICAgICAtIGNvbnN0OiBhcm0sbWFsaS10ODIw
CisgICAgICAjICJhcm0sbWFsaS10ODMwIgogICAgICAgLSBpdGVtczoKICAgICAgICAgICAtIGVu
dW06Ci0gICAgICAgICAgICAgLSBzYW1zdW5nLGV4eW5vczU0MzMtbWFsaQotICAgICAgICAgIC0g
Y29uc3Q6IGFybSxtYWxpLXQ3NjAKLQotICAgICAgICAgICMgImFybSxtYWxpLXQ2MjgiCi0gICAg
ICAgICAgIyAiYXJtLG1hbGktdDgzMCIKLSAgICAgICAgICAjICJhcm0sbWFsaS10ODgwIgorICAg
ICAgICAgICAgIC0gcm9ja2NoaXAscmszMzk5LW1hbGkKKyAgICAgICAgICAtIGNvbnN0OiBhcm0s
bWFsaS10ODYwCisgICAgICAjICJhcm0sbWFsaS10ODgwIgogCiAgIHJlZzoKICAgICBtYXhJdGVt
czogMQotLSAKMi4xNi40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
