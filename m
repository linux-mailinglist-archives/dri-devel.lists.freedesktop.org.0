Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D014646B99
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 23:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B3F89954;
	Fri, 14 Jun 2019 21:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8B389760;
 Fri, 14 Jun 2019 21:14:49 +0000 (UTC)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D0D921473;
 Fri, 14 Jun 2019 21:14:48 +0000 (UTC)
Date: Fri, 14 Jun 2019 16:14:47 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v5] docs: power: convert docs to ReST and rename to *.rst
Message-ID: <20190614211447.GU13533@google.com>
References: <7dc94cb4-ebf1-22ab-29c9-fcb2b875a9ac@csail.mit.edu>
 <72d1f8f360d395958dd0b49165fc51b58801f57e.1560420621.git.mchehab+samsung@kernel.org>
 <20190614143631.7c99719f@lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614143631.7c99719f@lwn.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560546889;
 bh=wQlzv9GXi+d6YxFDj5qp88AVZygc6aohbfVT4AQR70Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ks0AHcQ3CMMcp8lXmC5Q1q+mNRhg76nx20zz7WGQfrHmET+emzaWoOodcXQ82HPjk
 /Q0wzICC14gHKtUH/c0hiVkAbFD6SklBQgeWeDifIfILXybbVlrUgOA2LE9404heew
 9zZ4/WlS27thwm4E7UDC674PGe7hBqVr8gYg2J1U=
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
Cc: Nishanth Menon <nm@ti.com>, linux-wireless@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Harry Wei <harryxiyou@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Alex Shi <alex.shi@linux.alibaba.com>,
 "Srivatsa S . Bhat" <srivatsa@csail.mit.edu>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-pci@vger.kernel.org,
 Len Brown <len.brown@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 intel-gfx@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDI6MzY6MzFQTSAtMDYwMCwgSm9uYXRoYW4gQ29yYmV0
IHdyb3RlOgo+IE9uIFRodSwgMTMgSnVuIDIwMTkgMDc6MTA6MzYgLTAzMDAKPiBNYXVybyBDYXJ2
YWxobyBDaGVoYWIgPG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPiB3cm90ZToKPiAKPiA+IENv
bnZlcnQgdGhlIFBNIGRvY3VtZW50cyB0byBSZVNULCBpbiBvcmRlciB0byBhbGxvdyB0aGVtIHRv
Cj4gPiBidWlsZCB3aXRoIFNwaGlueC4KPiA+IAo+ID4gVGhlIGNvbnZlcnNpb24gaXMgYWN0dWFs
bHk6Cj4gPiAgIC0gYWRkIGJsYW5rIGxpbmVzIGFuZCBpZGVudGF0aW9uIGluIG9yZGVyIHRvIGlk
ZW50aWZ5IHBhcmFncmFwaHM7Cj4gPiAgIC0gZml4IHRhYmxlcyBtYXJrdXBzOwo+ID4gICAtIGFk
ZCBzb21lIGxpc3RzIG1hcmt1cHM7Cj4gPiAgIC0gbWFyayBsaXRlcmFsIGJsb2NrczsKPiA+ICAg
LSBhZGp1c3QgdGl0bGUgbWFya3Vwcy4KPiA+IAo+ID4gQXQgaXRzIG5ldyBpbmRleC5yc3QsIGxl
dCdzIGFkZCBhIDpvcnBoYW46IHdoaWxlIHRoaXMgaXMgbm90IGxpbmtlZCB0bwo+ID4gdGhlIG1h
aW4gaW5kZXgucnN0IGZpbGUsIGluIG9yZGVyIHRvIGF2b2lkIGJ1aWxkIHdhcm5pbmdzLgo+ID4g
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIrc2Ftc3Vu
Z0BrZXJuZWwub3JnPgo+ID4gQWNrZWQtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9y
Zz4KPiA+IEFja2VkLWJ5OiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgo+ID4g
QWNrZWQtYnk6IFNyaXZhdHNhIFMuIEJoYXQgKFZNd2FyZSkgPHNyaXZhdHNhQGNzYWlsLm1pdC5l
ZHU+Cj4gCj4gU28gSSBjYW4ndCBhcHBseSB0aGlzIG9uZSBkdWUgdG8gY29uZmxpY3RzIGluIGlu
Y2x1ZGUvbGludXgvcGNpLmguICBCam9ybiwKPiBwZXJoYXBzIHRoZSBlYXNpZXN0IHRoaW5nIGlz
IGZvciB5b3UgdG8gdGFrZSB0aGlzIG9uZSB0aHJvdWdoIHlvdXIgdHJlZT8KCk9LLCBJIGFwcGxp
ZWQgdGhpcyB0byBwY2kvZG9jcyBmb3IgdjUuMy4gIEkgYXBwbGllZCB0aGlzIGVudGlyZSBwYXRj
aCwKYnV0IGlmIHlvdSB3b3VsZCBwcmVmZXIgdGhhdCBJIG9ubHkgYXBwbHkgdGhlIFBDSS1yZWxh
dGVkIHBhcnRzLCBsZXQKbWUga25vdyBhbmQgSSdsbCBzcGxpdCB0aG9zZSBvdXQuCgpCam9ybgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
