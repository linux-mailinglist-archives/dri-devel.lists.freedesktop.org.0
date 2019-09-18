Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E65CB7431
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1E66F78F;
	Thu, 19 Sep 2019 07:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CB26EEEE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 11:53:08 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id w195so4226219vsw.11
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 04:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1KlX045+but4kZYDkxl79NCCq10iOcslEdRaiYLes50=;
 b=QuTEhZ0QRaMK+9qVuM50kRF0ZUgL5XPvNlrG8PNlaoWP1VzJIfKfdupo79k6tGBD0y
 UYjz/kyJszGdCSfmUmlI26PcFYNMkEUoV6iV8P6X1uijoTDIrMoKjd3uf/+R7/18azWr
 KAWjMqHCa1Cy1FNSGmp7hCPdWRbJBMmDTBrvstY075z+l6JJgAOYgwhC4M67qPK/5iBa
 XlwWnNCD9QCeypKAVnQzUtK91wqYVPxNDBlnTKUJ158VgYO9EWJFtcwEkG2TjSzlB9xX
 bjesTxPktRKjc3+O8b/ZqlIkYVDGvbs+vulGqlQb8fXdvGvPSgXLDCZGyeyAa+BJQBno
 10gA==
X-Gm-Message-State: APjAAAXYmJW6JuPtR52ABLiU6YyVm5cYvvCz8xiCdcj9e+S7tlbYKdHs
 7CqZUzooS3X/VPJLYa8lO11V2bfbfJl0Hs9qb0phYw==
X-Google-Smtp-Source: APXvYqyhL40Vy4UIINlY/uIQouC/knlNQeJfWaG2W2HqYygbGI5RQ+ggz1DPkhARkI89YhNy/gvof3y7jgV5PmDT70U=
X-Received: by 2002:a67:db8d:: with SMTP id f13mr1855977vsk.163.1568807586619; 
 Wed, 18 Sep 2019 04:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190918082500.209281-1-cychiang@chromium.org>
 <20190918082500.209281-3-cychiang@chromium.org>
 <1j7e663sfu.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j7e663sfu.fsf@starbuckisacylon.baylibre.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 18 Sep 2019 19:52:39 +0800
Message-ID: <CAFv8Nw+JssR+qJYWaQAjDRbHuNidHXQBPLsbOM7kNs4MN-Nkkw@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] drm: dw-hdmi-i2s: Use fixed id for codec device
To: Jerome Brunet <jbrunet@baylibre.com>
X-Mailman-Approved-At: Thu, 19 Sep 2019 07:35:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1KlX045+but4kZYDkxl79NCCq10iOcslEdRaiYLes50=;
 b=fego5LxIL6sB7nuVbbaJVJB9N7WNC8aIjmYR0y5szXrjm/cLvc2AEl4CT76peU8LyO
 ovgIJAkEcVdo/HQkTbgy73bCOznMQ54xCR6vuEpJF43zd/anX3d2aaBum9pZVtNEW2/S
 KaQ6549ctO0oKG1CzL2x+C+6Ci98YSp8YZRfo=
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
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Takashi Iwai <tiwai@suse.com>, linux-rockchip@lists.infradead.org,
 Dylan Reid <dgreid@chromium.org>, tzungbi@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, Liam Girdwood <lgirdwood@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgNDo0MyBQTSBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJh
eWxpYnJlLmNvbT4gd3JvdGU6Cj4KPgo+IE9uIFdlZCAxOCBTZXAgMjAxOSBhdCAxMDoyNCwgQ2hl
bmctWWkgQ2hpYW5nIDxjeWNoaWFuZ0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gPiBUaGUgcHJv
YmxlbSBvZiB1c2luZyBhdXRvIElEIGlzIHRoYXQgdGhlIGRldmljZSBuYW1lIHdpbGwgYmUgbGlr
ZQo+ID4gaGRtaS1hdWRpby1jb2RlYy48aWQgbnVtYmVyPi5hdXRvLgo+ID4KPiA+IFRoZSBudW1i
ZXIgbWlnaHQgYmUgY2hhbmdlZCB3aGVuIHRoZXJlIGFyZSBvdGhlciBwbGF0Zm9ybSBkZXZpY2Vz
IGJlaW5nCj4gPiBjcmVhdGVkIGJlZm9yZSBoZG1pLWF1ZGlvLWNvZGVjIGRldmljZS4KPiA+IFVz
ZSBhIGZpeGVkIG5hbWUgc28gbWFjaGluZSBkcml2ZXIgY2FuIHNldCBjb2RlYyBuYW1lIG9uIHRo
ZSBEQUkgbGluay4KPiA+Cj4gPiBVc2luZyB0aGUgZml4ZWQgbmFtZSBzaG91bGQgYmUgZmluZSBi
ZWNhdXNlIHRoZXJlIHdpbGwgb25seSBiZSBvbmUKPiA+IGhkbWktYXVkaW8tY29kZWMgZGV2aWNl
Lgo+Cj4gV2hpbGUgdGhpcyBpcyB0cnVlIGFsbCBwbGF0Zm9ybXMgd2Uga25vdyBvZiAoSSBzdXBw
b3NlKSwgSXQgbWlnaHQgbm90IGJlCj4gdGhlIGNhc2UgbGF0ZXIgb24uIEkgd29uZGVyIGlmIG1h
a2luZyBzdWNoIGFzc3VtcHRpb24gaXMgcmVhbGx5Cj4gZGVzaXJhYmxlIGluIGEgY29kZSB3aGlj
aCBpcyB1c2VkIGJ5IHF1aXRlIGEgZmV3IGRpZmZlcmVudCBwbGF0Zm9ybXMuCj4KPiBJbnN0ZWFk
IG9mIHRyeWluZyB0byBwcmVkaWN0IHdoYXQgdGhlIGRldmljZSBuYW1lIHdpbGwgYmUsIGNhbid0
IHlvdSBqdXN0Cj4gcXVlcnkgaXQgaW4geW91ciBtYWNoaW5lIGRyaXZlciA/IFVzaW5nIGEgZGV2
aWNlIHRyZWUgcGhhbmRsZSBtYXliZSA/Cj4KPiBJdCBpcyBxdWl0ZSB1c3VhbCB0byBzZXQgdGhl
IGRhaSBsaW5rcyB0aGlzIHdheSwgInNpbXBsZS1jYXJkIiBpcyBhIGdvb2QKPiBleGFtcGxlIG9m
IHRoaXMuCj4KCkhpIEplcm9tZSwKVGhhbmtzIGZvciB0aGUgcXVpY2sgcmVwbHkhCkFuZCB0aGFu
a3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LgpJIGZvdW5kIHRoYXQKc29jX2NvbXBvbmVudF90b19u
b2RlIHNlYXJjaGVzIHVwd2FyZCBmb3Igb25lIGxheWVyIHNvIGl0IGNhbiBmaW5kIHRoZQpub2Rl
IHdoaWNoIGNyZWF0ZXMgaGRtaS1hdWRpby1jb2RlYyBpbiBydW50aW1lLiBUaGlzIHdvcmtzIGV2
ZW4gdGhhdApoZG1pLWF1ZGlvLWNvZGVjIGRvZXMgbm90IGhhdmUgaXRzIG93biBub2RlIGluIGR0
cy4KSSB3aWxsIGNoYW5nZSBhY2NvcmRpbmdseSBpbiB2Ny4KVGhhbmtzIQoKCgo+ID4KPiA+IEZp
eCB0aGUgY29kZWMgbmFtZSBpbiByb2NrY2hpcCByazMyODhfaGRtaV9hbmFsb2cgbWFjaGluZSBk
cml2ZXIuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbmctWWkgQ2hpYW5nIDxjeWNoaWFuZ0Bj
aHJvbWl1bS5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWktaTJzLWF1ZGlvLmMgfCAyICstCj4gPiAgc291bmQvc29jL3JvY2tjaGlwL3JrMzI4
OF9oZG1pX2FuYWxvZy5jICAgICAgICAgICAgIHwgMyArKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCj4gPiBpbmRleCBk
N2U2NWM4Njk0MTUuLjg2YmQ0ODJiOWY5NCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYwo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCj4gPiBAQCAtMTkzLDcg
KzE5Myw3IEBAIHN0YXRpYyBpbnQgc25kX2R3X2hkbWlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKPiA+Cj4gPiAgICAgICBtZW1zZXQoJnBkZXZpbmZvLCAwLCBzaXplb2YocGRl
dmluZm8pKTsKPiA+ICAgICAgIHBkZXZpbmZvLnBhcmVudCAgICAgICAgID0gcGRldi0+ZGV2LnBh
cmVudDsKPiA+IC0gICAgIHBkZXZpbmZvLmlkICAgICAgICAgICAgID0gUExBVEZPUk1fREVWSURf
QVVUTzsKPiA+ICsgICAgIHBkZXZpbmZvLmlkICAgICAgICAgICAgID0gUExBVEZPUk1fREVWSURf
Tk9ORTsKPiA+ICAgICAgIHBkZXZpbmZvLm5hbWUgICAgICAgICAgID0gSERNSV9DT0RFQ19EUlZf
TkFNRTsKPiA+ICAgICAgIHBkZXZpbmZvLmRhdGEgICAgICAgICAgID0gJnBkYXRhOwo+ID4gICAg
ICAgcGRldmluZm8uc2l6ZV9kYXRhICAgICAgPSBzaXplb2YocGRhdGEpOwo+ID4gZGlmZiAtLWdp
dCBhL3NvdW5kL3NvYy9yb2NrY2hpcC9yazMyODhfaGRtaV9hbmFsb2cuYyBiL3NvdW5kL3NvYy9y
b2NrY2hpcC9yazMyODhfaGRtaV9hbmFsb2cuYwo+ID4gaW5kZXggNzY3NzAwYzM0ZWUyLi44Mjg2
MDI1YTg3NDcgMTAwNjQ0Cj4gPiAtLS0gYS9zb3VuZC9zb2Mvcm9ja2NoaXAvcmszMjg4X2hkbWlf
YW5hbG9nLmMKPiA+ICsrKyBiL3NvdW5kL3NvYy9yb2NrY2hpcC9yazMyODhfaGRtaV9hbmFsb2cu
Ywo+ID4gQEAgLTE1LDYgKzE1LDcgQEAKPiA+ICAjaW5jbHVkZSA8bGludXgvZ3Bpby5oPgo+ID4g
ICNpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+Cj4gPiAgI2luY2x1ZGUgPHNvdW5kL2NvcmUuaD4K
PiA+ICsjaW5jbHVkZSA8c291bmQvaGRtaS1jb2RlYy5oPgo+ID4gICNpbmNsdWRlIDxzb3VuZC9q
YWNrLmg+Cj4gPiAgI2luY2x1ZGUgPHNvdW5kL3BjbS5oPgo+ID4gICNpbmNsdWRlIDxzb3VuZC9w
Y21fcGFyYW1zLmg+Cj4gPiBAQCAtMTQyLDcgKzE0Myw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
c25kX3NvY19vcHMgcmtfb3BzID0gewo+ID4gIFNORF9TT0NfREFJTElOS19ERUZTKGF1ZGlvLAo+
ID4gICAgICAgREFJTElOS19DT01QX0FSUkFZKENPTVBfRU1QVFkoKSksCj4gPiAgICAgICBEQUlM
SU5LX0NPTVBfQVJSQVkoQ09NUF9DT0RFQyhOVUxMLCBOVUxMKSwKPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgICBDT01QX0NPREVDKCJoZG1pLWF1ZGlvLWNvZGVjLjIuYXV0byIsICJpMnMtaGlm
aSIpKSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICBDT01QX0NPREVDKEhETUlfQ09ERUNf
RFJWX05BTUUsICJpMnMtaGlmaSIpKSwKPiA+ICAgICAgIERBSUxJTktfQ09NUF9BUlJBWShDT01Q
X0VNUFRZKCkpKTsKPiA+Cj4gPiAgc3RhdGljIHN0cnVjdCBzbmRfc29jX2RhaV9saW5rIHJrX2Rh
aWxpbmsgPSB7Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
