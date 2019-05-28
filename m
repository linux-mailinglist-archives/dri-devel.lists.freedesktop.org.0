Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 674CD2CD50
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8E489722;
	Tue, 28 May 2019 17:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C8189EB7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 15:10:09 +0000 (UTC)
Received: by mail-it1-x142.google.com with SMTP id u186so4477850ith.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a29Mb9q0C2eZLyL56q8iGFbn8bX3U+5p/qd7Soix2Vo=;
 b=AwpOjKPmZBa8FZcmLWV9rY46dj4A7YL2OMIOhzOQOOvQaqYuhzAR5dH1XgFEpjADnk
 7oeMlEYD0Z5T5E1ywz6q8ykfhDo3o9OHURFdKi8e4/RTHrpQ1TIBIbnpGKKXqmgkKbmm
 bn9weaBbz1ShBoHLjWRmX7YCQ+zFeKopf1Ob3aREoqyZKpHKUu2+eICAwYcp/CSdG4pT
 9Tzf2foZ4urJpZihxZDo5v2iJzfkI0B9Ats6z1ky95qCGxRQ1hfDRt6yKzWdPAX1ytRy
 0ylK1KlNA+bsMutBBe8alnB45ja96r1NBoMJTql0d5vv9NXPRIGCuxSrom7BbVmXlfQL
 KZlQ==
X-Gm-Message-State: APjAAAXZUs3Fmcj9zLfrNrqXagamORB6kSAsyfSHbw/9Fz2WwCYBGZfF
 sxdVN0YkVpD7dOdQwdBj+r39uA0/xyPs4LXcnFs=
X-Google-Smtp-Source: APXvYqyS95K39vUT/x85/XSoxgAsyI08vS5uN9aEZf7PB+V6sP+WxMIYGLpEtufzwHkNYsN5cM1qs/J1V9dicbdpae0=
X-Received: by 2002:a02:ccd2:: with SMTP id k18mr5763435jaq.3.1559056209051;
 Tue, 28 May 2019 08:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
In-Reply-To: <af325707-3e42-493d-e858-77878ef06138@ti.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 28 May 2019 08:09:57 -0700
Message-ID: <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailman-Approved-At: Tue, 28 May 2019 17:13:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=a29Mb9q0C2eZLyL56q8iGFbn8bX3U+5p/qd7Soix2Vo=;
 b=dJ4VLVqBqWx1Dh/6J39dSmZIhfUbFJpeEYQYlvy8X2L7onF4s2LkyNH3mLAdjQwL4m
 jDVEgJfD4dV/7W7J0CE9mIC1iOZ5afiOM/2qO0/n2vn5X9rptNDNPh8/8EPx30w9l3pw
 bgjOdWto43Xvd8pwRbGun48dHHITVKZxq9w0aKJW0mLRintI9Gxo1uwdYdglBA7FOoYH
 4Aw71ad0voCHLkl195lQQCP5nlxBd2kXBMmDcnWa1b29dT85oYDQqaN8Tp8qXVypspcp
 VwMMwXuRifst+if6ud6PWlGbs36HwzCr4Nka7qLBlQWM4WVsJs+rukJAjfGkS62zhERH
 6aMg==
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
 devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh+dt@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>,
 Adam Ford <adam.ford@logicpd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgNDoxMSBBTSBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxr
ZWluZW5AdGkuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMTAvMDUvMjAxOSAyMjo0MiwgQWRh
bSBGb3JkIHdyb3RlOgo+ID4gQ3VycmVudGx5IHRoZSBzb3VyY2UgY29kZSBpcyBjb21waWxlZCB1
c2luZyBoYXJkLWNvZGVkIHZhbHVlcwo+ID4gZnJvbSBDT05GSUdfT01BUDJfRFNTX01JTl9GQ0tf
UEVSX1BDSy4gIFRoaXMgcGF0Y2ggYWxsb3dzIHRoaXMKPiA+IGNsb2NrIGRpdmlkZXIgdmFsdWUg
dG8gYmUgbW92ZWQgdG8gdGhlIGRldmljZSB0cmVlIGFuZCBiZSBjaGFuZ2VkCj4gPiB3aXRob3V0
IGhhdmluZyB0byByZWNvbXBpbGUgdGhlIGtlcm5lbC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBB
ZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4KPgo+IEkgdW5kZXJzdGFuZCB3aHkgeW91IHdh
bnQgdG8gZG8gdGhpcywgYnV0IEknbSBub3Qgc3VyZSBpdCdzIGEgZ29vZCBpZGVhLgo+IEl0J3Mg
cmVhbGx5IHNvbWV0aGluZyB0aGUgZHJpdmVyIHNob3VsZCBmaWd1cmUgb3V0LCBhbmQgaWYgd2Ug
YWRkIGl0IHRvCj4gdGhlIERULCBpdCBlZmZlY3RpdmVseSBiZWNvbWVzIGFuIEFCSS4KPgo+IFRo
YXQgc2FpZC4uLiBJJ20gbm90IHN1cmUgaG93IGdvb2Qgb2YgYSBqb2IgdGhlIGRyaXZlciBjb3Vs
ZCBldmVyIGRvLCBhcwo+IGl0IGNhbid0IGtub3cgdGhlIGZ1dHVyZSBzY2FsaW5nIG5lZWRzIG9m
IHRoZSB1c2Vyc3BhY2UgYXQgdGhlIHRpbWUgaXQKPiBpcyBjb25maWd1cmluZyB0aGUgY2xvY2su
IEFuZCBzbywgSSdtIG5vdCBuYWNraW5nIHRoaXMgcGF0Y2gsIGJ1dCBJCj4gZG9uJ3QgZmVlbCB2
ZXJ5IGdvb2QgYWJvdXQgdGhpcyBwYXRjaC4uLgo+Cj4gVGhlIHNldHRpbmcgYWxzbyBhZmZlY3Rz
IGFsbCBvdXRwdXRzIChleGx1ZGluZyB2ZW5jKSwgd2hpY2ggbWF5IG5vdCBiZQo+IHdoYXQgdGhl
IHVzZXIgd2FudHMuIFRoZW4gYWdhaW4sIEkgdGhpbmsgdGhpcyBzZXR0aW5nIGlzIHJlYWxseSBv
bmx5Cj4gbmVlZGVkIG9uIE9NQVAyICYgMywgd2hpY2ggaGF2ZSBvbmx5IGEgc2luZ2xlIG91dHB1
dC4gQnV0IHRoYXQncyB0aGUKPiBzYW1lIHdpdGggdGhlIGN1cnJlbnQga2NvbmZpZyBvcHRpb24s
IG9mIGNvdXJzZS4KPgo+IFNvLCB0aGUgY3VycmVudCBDT05GSUdfT01BUDJfRFNTX01JTl9GQ0tf
UEVSX1BDSyBpcyBhbiB1Z2x5IGhhY2ssIGluIG15Cj4gb3BpbmlvbiwgYW5kIG1vdmluZyBpdCB0
byBEVCBtYWtlcyBpdCBhIHdvcnNlIGhhY2sgPSkuIEJ1dCBJIGRvbid0IGhhdmUKPiBhbnkgZ29v
ZCBzdWdnZXN0aW9ucyBlaXRoZXIuCgpBcyBpdCBzdGFuZHMgdGhlIExvZ2ljIFBEIE9NQVAzNSBh
bmQgQU0zNy9ETTM3IGJvYXJkcyAoU09NLUxWIGFuZApUb3JwZWRvKSByZXF1aXJlIHRoaXMgdG8g
YmUgaGFyZCBjb2RlZCB0byA0IG9yIGl0IGhhbmdzIGR1cmluZyBzdGFydC4KVGhpcyBpcyB0aGUg
Y2FzZSBmb3IgYWxsIHZlcnNpb25zIDQuMisuICBJIGhhdmVuJ3QgdGVzdGVkIGl0IHdpdGgKb2xk
ZXIgc3R1ZmYuICBUb255IGhhcyBhIERNMzczMCBUb3JwZWRvIGtpdCBhbmQgcmVwb3J0ZWQgdGhl
IGhhbmdpbmcKaXNzdWUgdG8gbWUuIEkgdG9sZCBoaW0gdG8gc2V0IHRoYXQgdmFsdWUgdG8gNCB0
byBtYWtlIGl0IG5vdCBoYW5nLgpIZSBhc2tlZCB0aGF0IEkgbW92ZSBpdCB0byB0aGUgRFQgdG8g
YXZvaWQgY3VzdG9tIGtlcm5lbHMuICBJIGFncmVlCml0J3MgYSBoYWNrLCBidXQgaWYgaXQncyBj
cmVhdGUgYSBjdXN0b21pemVkIGRlZmNvbmZpZyBmaWxlIGZvciA0CmJvYXJkcyBvciBtb2RpZnkg
dGhlIGRldmljZSB0cmVlLCBpdCBzZWVtcyBsaWtlIHRoZSBkZXZpY2UgdHJlZQphcHByb2FjaCBp
cyBsZXNzIGludHJ1c2l2ZS4KCmFkYW0KPgo+ICAgVG9taQo+Cj4gLS0KPiBUZXhhcyBJbnN0cnVt
ZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KPiBZLXR1
bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5r
aQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
