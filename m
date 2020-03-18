Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F51189448
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 04:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813226E5CD;
	Wed, 18 Mar 2020 03:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BBE6E5CD
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 03:12:24 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200318031220epoutp027690a55ff9fd573745a516c6ac5ea32c~9R2RkHpdD0432804328epoutp02v
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 03:12:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200318031220epoutp027690a55ff9fd573745a516c6ac5ea32c~9R2RkHpdD0432804328epoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584501140;
 bh=4xX9NivP9RedFKlnTL4lk+r9c8gUmHHDv5lvT9UCc00=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=hvHq4hh1Q3tQ2Vcqwb8xRarbP1F6kajbK2HKXpLMT+wDLF0b59dbUYPC3yBZ469Hg
 MpVeeQP/Sr09tTG3uQiQjbatoLYkh4ueNGc/9uDp9QR4gVZ6itPGYiAq6T+3frXyX5
 VPXfv8EwMaVYJ03i2iMWVpogxtF9njsVCMNpGixg=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200318031220epcas1p48b55eb7df700eed739da1d3fde765db6~9R2RWb73X2842328423epcas1p4r;
 Wed, 18 Mar 2020 03:12:20 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.156]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 48hw7j0HY3zMqYkV; Wed, 18 Mar
 2020 03:12:17 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 F0.89.04145.091917E5; Wed, 18 Mar 2020 12:12:17 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200318031216epcas1p102e1519db5bd502f4ef9c5748db30922~9R2N-TWYy2081020810epcas1p1N;
 Wed, 18 Mar 2020 03:12:16 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200318031216epsmtrp12d97ed2e8c15c49a9155f18adee9535c~9R2N_lFX51700717007epsmtrp1L;
 Wed, 18 Mar 2020 03:12:16 +0000 (GMT)
X-AuditID: b6c32a35-28dff70000001031-21-5e719190b8b9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 36.01.04024.091917E5; Wed, 18 Mar 2020 12:12:16 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200318031216epsmtip1f6775704cab3c0a8ccc20fae17f2e918~9R2NxsJD70198001980epsmtip1b;
 Wed, 18 Mar 2020 03:12:16 +0000 (GMT)
Subject: Re: [GIT PULL] exynos-drm-next
To: Dave Airlie <airlied@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <ffdb2c6b-b2cb-958e-17fb-5fe6b0c6241d@samsung.com>
Date: Wed, 18 Mar 2020 12:16:53 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAPM=9tzrQM4CiFNZDmyDFLC7ODyZVD-O9vmiJw4myPmz3HoAEA@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+917t13DxW1anuy1bkQozXa12SytwKhFQooFFbF1cZdtuMd1
 dxsZFkZUZkkte9jKR1YSRS8zH5FWi1IRSkGd9BR60IOykglaaJvXyP8+55zv4XvO73dIXHFC
 Gkta7C7OaWettHQqUf84Tq3yevP06kN52rZANaYtedaOabuDA1Jt2fMWbA2ha/K9lukahvol
 urdHWjHdYO28TGJ7bqqZY42cU8nZcxxGi92URm/MNqQbNMlqRsWkaJfTSjtr49LotRmZqnUW
 a8iRVnpYqzuUymQFgV66KtXpcLs4pdkhuNJojjda+RQ+QWBtgttuSshx2FYwanWiJiTcmWse
 GD6M8dWzdlVffyQrRJ3RxSiCBGoZ3Pg2ghWjqaSCakRw/NUfiRj8QlBX+GoiGELQ2/ME+9dS
 +uQaLhaaEYyVPCTEYADBja8f8bAqiloMZ05+GudoaiF8ePxbFhbhVDGCmq4PKFyQUovAe+Wt
 NMxyahUMXyiThJkI5c+2DobsSHIGtRU6gqwomQ7tZ98TYY6gsmBfX4UszDgVAy/eV2Iiz4f9
 d8+NTwdUmxSuBRuQOPZaaPbfnuAo+NJaJxM5Fj4fOygTG/Yj8JZ1YGJQhOD1uwAhqpLgweXS
 8YlwKg5u3lsqphdA0+9yJDpPg+/Bo5KwBCg5FB1UiBIannb1TfgCdF7ySkXWQWX/A+w4WuCb
 tJtv0j6+Sfv4/htXIeIqmsnxgs3ECQzPTP7vWjR+j/GaRnTyWYYfUSSiI+XkLV6vkLAeId/m
 R0DidLT8Yp5Dr5Ab2fzdnNNhcLqtnOBHmtDLe/HYGTmO0HXbXQZGk5iUlKRdxiRrGIaOkZ8K
 WPUKysS6uFyO4znnvz6MjIgtRC0Vwcq9R5/eOZGVkqx6lFqSUKTtbJLlMPGbo0dn1xwYrOpQ
 LjdtSK3qbuNfEs0Wz5rI9p+XW3oNqh89m+tnjfwZXaL+en+lZgrS+xrSr1fljpWT2QXp/Z9G
 jOc3VUT27ghkd2nmJ673zM0/LVu9h0MF1ByzpzSwBS5a3qiHt2XThGBmmXjcKbB/AfBpR0Cl
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRmVeSWpSXmKPExsWy7bCSnO6EiYVxBr0fZSxOXF/EZNF77iST
 xZWv79ksZpzfx+TA4rFz1l12j+3fHrB63O8+zuTxeZNcAEsUl01Kak5mWWqRvl0CV8b7n51M
 BYskKxatPcjewHhBpIuRk0NCwERi8tHVzF2MXBxCArsZJbpf/WDrYuQASkhIbNnKAWEKSxw+
 XAxR8pZR4uKOLnaQXmEBdYnpU14wg9giAsoSTw//ZgcpYhboYpRoeXySBaLjHqPEmd3bGEGq
 2ARUJSauuM8GYvMK2En8XDiDFcRmAYrPPP6ZCcQWFYiQeL79BiNEjaDEyZlPWEBsToFAicYb
 88A2MwNt/jPvEjOELS5x68l8JghbXqJ562zmCYxCs5C0z0LSMgtJyywkLQsYWVYxSqYWFOem
 5xYbFhjmpZbrFSfmFpfmpesl5+duYgTHg5bmDsbLS+IPMQpwMCrx8CZsKogTYk0sK67MPcQo
 wcGsJMK7uDA/Tog3JbGyKrUoP76oNCe1+BCjNAeLkjjv07xjkUIC6YklqdmpqQWpRTBZJg5O
 qQbGfh3z2fOePg0WTDIREtjstGgpx7wKEa/lWUX9fe8u8+19KXbm7oboqpcHlLYu2i14TsuJ
 +abwlwMJPXXvzB12W0fqz9IV9k3itszT7TLqEXER/3czJb19wuMAjtCFCms09MtEsrcdX3Rl
 daZu38sTb7asnjjx45zE/NgvD/zmn1u7xfHZ/opYJZbijERDLeai4kQAUpoKKIMCAAA=
X-CMS-MailID: 20200318031216epcas1p102e1519db5bd502f4ef9c5748db30922
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200316010443epcas1p33627ec18d70b980b7a5c943de8cfa07d
References: <CGME20200316010443epcas1p33627ec18d70b980b7a5c943de8cfa07d@epcas1p3.samsung.com>
 <1584320957-9442-1-git-send-email-inki.dae@samsung.com>
 <CAPM=9tzrQM4CiFNZDmyDFLC7ODyZVD-O9vmiJw4myPmz3HoAEA@mail.gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwKCjIwLiAzLiAxOC4g7Jik7KCEIDExOjE37JeQIERhdmUgQWlybGllIOydtCjqsIAp
IOyTtCDquIA6Cj4gVGhpcyBzZWVtcyB0byBjb250YWluIGEgZXh5bm9zIGRybSBmaXhlcyBiYWNr
bWVyZ2UsIHBsZWFzZSBkb24ndCBkbwo+IHRoYXQgd2l0aG91dCBhIGhlYWRzdXAuCj4gCj4gQ2Fu
IHlvdSBzZW5kIG9uZSB3aXRob3V0IHRoYXQgb3IgZG8geW91IG5lZWQgYSBmaXhlcyBiYWNrbWVy
Z2UsIGlmIHNvCj4gcGxlYXNlIHJlcXVlc3QgbWUgdG8gZG8gdGhhdCBmaXJzdCwgdGhlbiByZWJh
c2UgdGhpcyBhbmQgc2VuZCBpdC4KClNvcnJ5IGZvciBjb25mdXNpbmcgeW91LiBEcm9wcGVkIHRo
ZSBiYWNrbWVyZ2UgZnJvbSBleHlub3MgZHJtIGZpeGVzIGFuZCBwdXNoZWQgaXQgYWdhaW4uClBs
ZWFzZSBsZXQgbWUga25vdyBpZiB0aGVyZSBpcyBhbnkgcHJvYmxlbS4KClRoYW5rcywKSW5raSBE
YWUKCj4gCj4gRGF2ZS4KPiAKPiBPbiBNb24sIDE2IE1hciAyMDIwIGF0IDExOjA0LCBJbmtpIERh
ZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Pgo+PiAgICAgICAgIEp1c3QgdHdvIGNs
ZWFudXBzIC0gb25lIGlzIHRvIG1hc2sgZW5jb2RlciBiaXRtYXNrIHVzaW5nCj4+ICAgICAgICAg
ZHJtX2VuY29kZXJfbWFzaygpLCBhbmQgb3RoZXIgaXMgdG8gdXNlIG1vZGUtPmNsb2NrCj4+ICAg
ICAgICAgaW5zdGVhZCBvZiBjYWxjdWxhdGluZyBpdCBhZ2Fpbi4KPj4KPj4gICAgICAgICBQbGVh
c2Uga2luZGx5IGxldCBtZSBrbm93IGlmIHRoZXJlIGlzIGFueSBwcm9ibGVtLgo+Pgo+PiBUaGFu
a3MsCj4+IElua2kgRGFlCj4+Cj4+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQg
NjlkZGNlMDk3MGQ5ZDFkZTYzYmVkOWMyNGVlZmEwODE0ZGIyOWE1YToKPj4KPj4gICBNZXJnZSB0
YWcgJ2FtZC1kcm0tbmV4dC01LjctMjAyMC0wMy0xMCcgb2YgZ2l0Oi8vcGVvcGxlLmZyZWVkZXNr
dG9wLm9yZy9+YWdkNWYvbGludXggaW50byBkcm0tbmV4dCAoMjAyMC0wMy0xMyAwOTowOToxMSAr
MTAwMCkKPj4KPj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgZ2l0IHJlcG9zaXRvcnkgYXQ6Cj4+Cj4+
ICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2RhZWlua2kv
ZHJtLWV4eW5vcyB0YWdzL2V4eW5vcy1kcm0tbmV4dC1mb3ItdjUuNwo+Pgo+PiBmb3IgeW91IHRv
IGZldGNoIGNoYW5nZXMgdXAgdG8gMGM5YTYwOWNhNDQ0Mjk4ZTQzOGVlOWM2ZGFhZjUzYzE0Mjc3
ZjFhZDoKPj4KPj4gICBkcm0vZXh5bm9zOiBVc2UgbW9kZS0+Y2xvY2sgaW5zdGVhZCBvZiByZXZl
cnNlIGNhbGN1bGF0aW5nIGl0IGZyb20gdGhlIHZyZWZyZXNoICgyMDIwLTAzLTE2IDA5OjUwOjI4
ICswOTAwKQo+Pgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IFR3byBjbGVhbnVwcwo+PiAuIFJlcGxhY2UgdGhlIGhh
bmQgcm9sbGVkIGVuY29kZXIgYml0bWFzayB0aGluZyB3aXRoIGRybV9lbmNvZGVyX21hc2soKQo+
PiAuIFVzZSBtb2RlLT5jbG9jayBpbnN0ZWFkIG9mIHJldmVyc2UgY2FsY3VsYXRpbmcgaXQgZnJv
bSB0aGUgdnJlZnJlc2gKPj4KPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiBJbmtpIERhZSAoMSk6Cj4+ICAgICAgIE1l
cmdlIHRhZyAnZXh5bm9zLWRybS1maXhlcy1mb3ItdjUuNi1yYzUtdjInIG9mIGdpdDovL2dpdC5r
ZXJuZWwub3JnLy4uLi9kYWVpbmtpL2RybS1leHlub3MgaW50byBleHlub3MtZHJtLW5leHQKPj4K
Pj4gTWFyZWsgU3p5cHJvd3NraSAoMSk6Cj4+ICAgICAgIGRybS9leHlub3M6IEZpeCBjbGVhbnVw
IG9mIElPTU1VIHJlbGF0ZWQgb2JqZWN0cwo+Pgo+PiBWaWxsZSBTeXJqw6Rsw6QgKDIpOgo+PiAg
ICAgICBkcm0vZXh5bm9zOiBVc2UgZHJtX2VuY29kZXJfbWFzaygpCj4+ICAgICAgIGRybS9leHlu
b3M6IFVzZSBtb2RlLT5jbG9jayBpbnN0ZWFkIG9mIHJldmVyc2UgY2FsY3VsYXRpbmcgaXQgZnJv
bSB0aGUgdnJlZnJlc2gKPj4KPj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zNTQzM19k
cm1fZGVjb24uYyB8ICA1ICsrKy0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczdf
ZHJtX2RlY29uLmMgICAgfCAgNyArKysrLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1fZG1hLmMgICAgICAgfCAyOCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0KPj4g
IGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcnYuYyAgICAgICB8ICA1ICsrLS0t
Cj4+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmggICAgICAgfCAgNiAr
KysrLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9maW1jLmMgICAgICB8
ICA1ICsrKy0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltZC5jICAg
ICAgfCAgNSArKystLQo+PiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2cyZC5j
ICAgICAgIHwgIDUgKysrLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9n
c2MuYyAgICAgICB8ICA1ICsrKy0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fcm90YXRvci5jICAgfCAgNSArKystLQo+PiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3NfZHJtX3NjYWxlci5jICAgIHwgIDYgKysrKy0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19taXhlci5jICAgICAgICAgfCAgNyArKysrKy0tCj4+ICAxMiBmaWxlcyBjaGFuZ2Vk
LCA1NiBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkKPj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vcHJvdGVjdDIuZmly
ZWV5ZS5jb20vdXJsP2s9MmY5OWU5NmYtNzIwZjUwMTgtMmY5ODYyMjAtMGNjNDdhMzEyYWIwLTZh
NThhMDM4YWRiMmUxNTImdT1odHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
