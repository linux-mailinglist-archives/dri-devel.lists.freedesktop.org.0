Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FB14B5ED
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 12:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A97989D86;
	Wed, 19 Jun 2019 10:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A59389D86
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 10:08:59 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1EB121479
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 10:08:58 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id u10so11619157lfm.12
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 03:08:58 -0700 (PDT)
X-Gm-Message-State: APjAAAUdCJuZWEBtZCKsSB5kqLriBsJ5diD633dkr+lGaMUUkxtsdWlU
 CRoxT9sBkdLQq1OBS6gFNP4VUXMsS2lt1+v/EjE=
X-Google-Smtp-Source: APXvYqw8QzBck4su84jvxKMOq+3rh/piGZ7mbYb6bKW0wol+fphlsvgB8RGiXr8AGwrbQ/+jguHe0FrtMGU6s3ny/Uk=
X-Received: by 2002:a19:4f50:: with SMTP id a16mr253073lfk.24.1560938936806;
 Wed, 19 Jun 2019 03:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190618190534.4951-1-krzk@kernel.org>
 <CGME20190618190551epcas2p38f3c93da2a05117c7741468bb5a7784c@epcas2p3.samsung.com>
 <20190618190534.4951-2-krzk@kernel.org>
 <9d16d4f7-8353-e0f0-a005-1b04457d70f0@samsung.com>
In-Reply-To: <9d16d4f7-8353-e0f0-a005-1b04457d70f0@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 19 Jun 2019 12:08:45 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeBBXd2vhBPq6BMzvdRf1_f8d9Pd=_N1X0chHLVbhi0rQ@mail.gmail.com>
Message-ID: <CAJKOXPeBBXd2vhBPq6BMzvdRf1_f8d9Pd=_N1X0chHLVbhi0rQ@mail.gmail.com>
Subject: Re: [RFT 01/10] dt-bindings: gpu: mali: Add Samsung compatibles for
 Midgard and Utgard
To: Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560938939;
 bh=KKvDwu+I2C1EkI77Psheqy+KG+PofgRIdUQS/TBoP64=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UyI997+YuS2xnVlzmo5wKGej2P2Ay4u//ydoLlc1kZ+fFsr7x3BNtk8A0JXPQUdwq
 4pAeNxELN5wdf1nLJ2k16enZ9Qqdvouqb+NrFeoPAcupz2NXKOVuidBk9XfNdANmvD
 dsWBqVIKvgVTu7uEGfO2DZbWBZVi572XTeuej3Do=
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, Will Deacon <will.deacon@arm.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, dri-devel@lists.freedesktop.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org,
 Joseph Kogut <joseph.kogut@gmail.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBKdW4gMjAxOSBhdCAxMjowMSwgTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93
c2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IEhpIEtyenlzenRvZiwKPgo+IE9uIDIwMTktMDYt
MTggMjE6MDUsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPiBBZGQgdmVuZG9yIGNvbXBh
dGlibGVzIGZvciBzcGVjaWZpYyBpbXBsZW1lbnRhdGlvbiBvZiBNYWxpIFV0Z2FyZAo+ID4gKEV4
eW5vczMyNTAsIEV4eW5vczQtZmFtaWx5KSBhbmQgTWlkZ2FyZCAoRXh5bm9zNTQzMywgRXh5bm9z
NykuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJu
ZWwub3JnPgo+ID4gLS0tCj4gPiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9n
cHUvYXJtLG1hbGktbWlkZ2FyZC50eHQgfCAxICsKPiA+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS11dGdhcmQudHh0ICB8IDEgKwo+ID4gICAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQudHh0IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dAo+ID4g
aW5kZXggZTVhZDNiMmFmZTE3Li45YjI5OGVkZWM1YjIgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQudHh0Cj4gPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdh
cmQudHh0Cj4gPiBAQCAtMTcsNiArMTcsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4gICAg
ICogd2hpY2ggbXVzdCBiZSBwcmVjZWRlZCBieSBvbmUgb2YgdGhlIGZvbGxvd2luZyB2ZW5kb3Ig
c3BlY2lmaWNzOgo+ID4gICAgICAgKyAiYWxsd2lubmVyLHN1bjUwaS1oNi1tYWxpIgo+ID4gICAg
ICAgKyAiYW1sb2dpYyxtZXNvbi1neG0tbWFsaSIKPiA+ICsgICAgKyAic2Ftc3VuZyxleHlub3M1
NDMzLW1hbGkiCj4gPiAgICAgICArICJyb2NrY2hpcCxyazMyODgtbWFsaSIKPiA+ICAgICAgICsg
InJvY2tjaGlwLHJrMzM5OS1tYWxpIgo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLXV0Z2FyZC50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLXV0Z2FyZC50eHQKPiA+IGluZGV4
IGFlNjNmMDlmZGE3ZC4uNTE5MDE4Y2I4NjBiIDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS11dGdhcmQudHh0Cj4gPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLXV0Z2FyZC50eHQK
PiA+IEBAIC0xNyw2ICsxNyw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgICsg
YW1sb2dpYyxtZXNvbjhiLW1hbGkKPiA+ICAgICAgICAgKyBhbWxvZ2ljLG1lc29uLWd4YmItbWFs
aQo+ID4gICAgICAgICArIGFtbG9naWMsbWVzb24tZ3hsLW1hbGkKPiA+ICsgICAgICArIHNhbXN1
bmcsZXh5bm9zMzI1MC1tYWxpCj4gSSB3b3VsZCBwcmVmZXIgJ3NhbXN1bmcsZXh5bm9zNC1tYWxp
JywgYmVjYXVzZSBoaXN0b3JpY2FsbHkgRXh5bm9zNCB3YXMKPiB0aGUgZmlyc3QgU29DIHdpdGgg
TWFsaTQwMCBhbmQgc3VjaCBwcmVmaXggaXMgYWxyZWFkeSB1c2VkIGZvciBtYW55IGh3Cj4gYmxv
Y2tzLgoKVGhlbiBtYXliZSBzYW1zdW5nLGV4eW5vczQyMTAtbWFsaSBzbyBpdCB3aWxsIG5vdCBi
ZSBjb25mdXNlZCB3aXRoIEV4eW5vczQ0MTU/CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
