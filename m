Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28F267A88
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 16:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD326E3EE;
	Sat, 13 Jul 2019 14:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599CD6E346
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 10:38:42 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id j8so3812003uan.6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 03:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NFlnVgtsH1wq+XzR7Jf0TraeqzPpP2anw1H9Vmw2tvM=;
 b=r9S93Lk9WPqSelH3Rlq5l3NClUM083KHVm5knt0RtJ/3T5bGFfsvvUU99Dvs2K4zM7
 BAeMtjJBh+CMG9XLNBKCnYoH3cgvVB04+yUPvg1FTUFKQVVbgxehRD6pB3TH1/trSXOT
 39cZhErxvWLg5q53FlC0xj6pRlpe5xcmqvgtNYktCq1dCG5zMETC1bqfVuSb6f9JMQtK
 nEhIgy2jFjVC50DsygWV5wDNEPqk8di8uzVy6zRHHd/kNzCx8LIA3SCHacCk+2s/1T2x
 jTeyzd/qH6ML+ijr3Bm6WJfzfoTxuQqln4vCZVMXFij+h3kB550BIi7F09JNORP76jdz
 ZKMA==
X-Gm-Message-State: APjAAAWUXNbQiOOuHm25juUvJbfWR1nfiiByAZD+vlu0vhRqz5OgcvT/
 Tp6hm7RC7zjSfrll5DAv8Y+mJ/kx8lx6GJtuqzPslQ==
X-Google-Smtp-Source: APXvYqwr8ViLkFyuDpuZsdv+4CeIPeQhpf+eg0vAcxLw4Fe8TNWMbS82tIBGOSDng7L1p4Sa5VlGPV5eMJFqWsRho94=
X-Received: by 2002:a9f:3605:: with SMTP id r5mr8414289uad.131.1562927921086; 
 Fri, 12 Jul 2019 03:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190712100443.221322-1-cychiang@chromium.org>
 <20190712100443.221322-6-cychiang@chromium.org>
In-Reply-To: <20190712100443.221322-6-cychiang@chromium.org>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Fri, 12 Jul 2019 18:38:14 +0800
Message-ID: <CAFv8NwKOhAz4B1da5MarXkVfavya6AYsvURa1Tq4LW=_nyZjiw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] FROMLIST: ASoC: rockchip_max98090: Add HDMI jack
 support
To: linux-kernel <linux-kernel@vger.kernel.org>
X-Mailman-Approved-At: Sat, 13 Jul 2019 14:24:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=NFlnVgtsH1wq+XzR7Jf0TraeqzPpP2anw1H9Vmw2tvM=;
 b=ZZWCRPdCfXzrnVtRzZdwa1ITRmB3qxf5geOYMDfWQUsSK85+lC95yAWwXfIWtojj3Z
 +U5nZwLyKEoHiF/KfrDvTV3RQwC3bWT6oq5DVauijG88SJsDnIFShBwLwjLw75Qqi3Pw
 uvgV0slD6iFweegv0PnpZ9YeoJUKQTa3aoJqg=
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
 <alsa-devel@alsa-project.org>, Doug Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tzungbi@chromium.org,
 Jaroslav Kysela <perex@perex.cz>, Hans Verkuil <hverkuil@xs4all.nl>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Dylan Reid <dgreid@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgNjowNiBQTSBDaGVuZy1ZaSBDaGlhbmcgPGN5Y2hpYW5n
QGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBJbiBtYWNoaW5lIGRyaXZlciwgY3JlYXRlIGEgamFj
ayBhbmQgbGV0IGhkbWktY29kZWMgcmVwb3J0IGphY2sgc3RhdHVzLgo+Cj4gU2lnbmVkLW9mZi1i
eTogQ2hlbmctWWkgQ2hpYW5nIDxjeWNoaWFuZ0BjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIHNvdW5k
L3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5jIHwgMjAgKysrKysrKysrKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9z
b3VuZC9zb2Mvcm9ja2NoaXAvcm9ja2NoaXBfbWF4OTgwOTAuYyBiL3NvdW5kL3NvYy9yb2NrY2hp
cC9yb2NrY2hpcF9tYXg5ODA5MC5jCj4gaW5kZXggYzgyOTQ4ZTM4M2RhLi5jODFjNGFjZGE5MTcg
MTAwNjQ0Cj4gLS0tIGEvc291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlwX21heDk4MDkwLmMKPiAr
KysgYi9zb3VuZC9zb2Mvcm9ja2NoaXAvcm9ja2NoaXBfbWF4OTgwOTAuYwo+IEBAIC0xMzQsNiAr
MTM0LDI1IEBAIGVudW0gewo+ICAgICAgICAgREFJTElOS19IRE1JLAo+ICB9Owo+Cj4gK3N0YXRp
YyBzdHJ1Y3Qgc25kX3NvY19qYWNrIHJrX2hkbWlfamFjazsKPiArCj4gK3N0YXRpYyBpbnQgcmtf
aGRtaV9pbml0KHN0cnVjdCBzbmRfc29jX3BjbV9ydW50aW1lICpydW50aW1lKQo+ICt7Cj4gKyAg
ICAgICBzdHJ1Y3Qgc25kX3NvY19jYXJkICpjYXJkID0gcnVudGltZS0+Y2FyZDsKPiArICAgICAg
IHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50ID0gcnVudGltZS0+Y29kZWNfZGFp
LT5jb21wb25lbnQ7Cj4gKyAgICAgICBpbnQgcmV0Owo+ICsKPiArICAgICAgIC8qIGVuYWJsZSBq
YWNrIGRldGVjdGlvbiAqLwo+ICsgICAgICAgcmV0ID0gc25kX3NvY19jYXJkX2phY2tfbmV3KGNh
cmQsICJIRE1JIEphY2siLCBTTkRfSkFDS19MSU5FT1VULAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICZya19oZG1pX2phY2ssIE5VTEwsIDApOwo+ICsgICAgICAgaWYgKHJl
dCkgewo+ICsgICAgICAgICAgICAgICBkZXZfZXJyKGNhcmQtPmRldiwgIkNhbid0IG5ldyBIRE1J
IEphY2sgJWRcbiIsIHJldCk7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAg
ICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIGhkbWlfY29kZWNfc2V0X2phY2tfZGV0ZWN0KGNvbXBv
bmVudCwgJnJrX2hkbWlfamFjayk7Cj4gK30KPiArCj4gIC8qIG1heDk4MDkwIGFuZCBIRE1JIGNv
ZGVjIGRhaV9saW5rICovCj4gIHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19kYWlfbGluayBya19kYWls
aW5rc1tdID0gewo+ICAgICAgICAgW0RBSUxJTktfTUFYOTgwOTBdID0gewo+IEBAIC0xNTEsNiAr
MTcwLDcgQEAgc3RhdGljIHN0cnVjdCBzbmRfc29jX2RhaV9saW5rIHJrX2RhaWxpbmtzW10gPSB7
Cj4gICAgICAgICAgICAgICAgIC5vcHMgPSAmcmtfYWlmMV9vcHMsCj4gICAgICAgICAgICAgICAg
IC5kYWlfZm10ID0gU05EX1NPQ19EQUlGTVRfSTJTIHwgU05EX1NPQ19EQUlGTVRfTkJfTkYgfAo+
ICAgICAgICAgICAgICAgICAgICAgICAgIFNORF9TT0NfREFJRk1UX0NCU19DRlMsCj4gKyAgICAg
ICAgICAgICAgIC5pbml0ID0gcmtfaGRtaV9pbml0LAo+ICAgICAgICAgICAgICAgICBTTkRfU09D
X0RBSUxJTktfUkVHKGhkbWkpLAo+ICAgICAgICAgfQo+ICB9Owo+IC0tCj4gMi4yMi4wLjUxMC5n
MjY0ZjJjODE3YS1nb29nCj4KClNvcnJ5IGZvciB0aGUgd3JvbmcgdGl0bGUuCkkgZm9yZ290IHRv
IHJlbW92ZSBGUk9NTElTVCBpbiB0aGUgdGl0bGUuCkknbGwgd2FpdCBmb3IgY29tbWVudHMgb24g
b3RoZXIgcGF0Y2hlcyBhbmQgZml4IHRoZSB0aXRsZSBpbiB2NC4KVGhhbmtzIQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
