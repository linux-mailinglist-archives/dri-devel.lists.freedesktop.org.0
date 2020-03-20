Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 136C718DFA0
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 11:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B78B6E329;
	Sat, 21 Mar 2020 10:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0846EAFB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 09:21:53 +0000 (UTC)
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id 5d5f1abc
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Fri, 20 Mar 2020 02:21:52 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id A343A4D036;
 Fri, 20 Mar 2020 09:21:48 +0000 (UTC)
Date: Fri, 20 Mar 2020 17:21:43 +0800
In-Reply-To: <CACRpkdbeLAyhhkx115zAV0tdC7KJ4T0UoQ2QeDwTVN+btxp=Jw@mail.gmail.com>
References: <20200316133503.144650-1-icenowy@aosc.io>
 <20200316133503.144650-3-icenowy@aosc.io>
 <CACRpkdaVrfd1p+WyACy-gq-3BPsXJ_CZwi2OZe+=csseBcvcaA@mail.gmail.com>
 <491ADD02-5511-404B-88A8-5725EF061EAC@aosc.io>
 <CACRpkdbeLAyhhkx115zAV0tdC7KJ4T0UoQ2QeDwTVN+btxp=Jw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/5] dt-bindings: panel: add binding for Xingbangda
 XBD599 panel
To: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <7BA1F742-0403-47E3-8E91-738947EB4809@aosc.io>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1584696109;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references;
 bh=lyI5nTAxlpI3YgUaSp33pj/yy+1x1RPrFPLEcSJxVcM=;
 b=cbDXi+EpOG5NSTFJo99k2SiBcR6aPtIoHvmuqhtKqGPOJLBqN+Xcb6lh+lQlNaRxsW1w40
 kMAphAv/W6+0Y8pPo53QMQ//grkWEtYOWMa/kPOnFNJ8Qdqbs7onGp5omHzkXWqVFt0m54
 WgnGaY86aOx+VuMBKQJQupX7ZcPuVck=
X-Mailman-Approved-At: Sat, 21 Mar 2020 10:44:31 +0000
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
Cc: Ondrej Jirman <megous@megous.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgrkuo4gMjAyMOW5tDPmnIgyMOaXpSBHTVQrMDg6MDAg5LiL5Y2INToxMToyMiwgTGludXMgV2Fs
bGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiDlhpnliLA6Cj5PbiBGcmksIE1hciAyMCwg
MjAyMCBhdCA5OjA3IEFNIEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4gd3JvdGU6Cj4+
IOS6jiAyMDIw5bm0M+aciDE55pelIEdNVCswODowMCDkuIvljYgxMDoxNDoyNywgTGludXMgV2Fs
bGVpago+PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4g5YaZ5YiwOgo+PiA+T24gTW9uLCBNYXIg
MTYsIDIwMjAgYXQgMjozNyBQTSBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MuaW8+Cj53cm90
ZToKPgo+PiA+QXMgbm90aWNlZCBpbiB0aGUgcmV2aWV3IG9mIHRoZSBkcml2ZXIsIHRoaXMgZGlz
cGxheSBpcyB2ZXJ5IGNsb3NlCj50bwo+PiA+aGltYXgsaHg4MzYzLgo+PiA+Cj4+ID5JIHRoaW5r
IHRoZSBiZXN0IGlzIHRvIGRldGVybWluIHdoYXQgYWN0dWFsIGRpc3BsYXkgY29udHJvbGxlciBp
dAo+aXMsCj4+ID5JIHRoaW5rIGl0IGlzIHNvbWUga2luZCBvZiBJbGl0ZWsgY29udHJvbGxlciBz
aW5jZSBJbGl0ZWsgaWxpOTM0MiBpcwo+PiA+Y2xlYXJseSB2ZXJ5IHNpbWlsYXIuCj4+Cj4+IEl0
J3MgU2l0cm9uaXggU1Q3NzAzLCBzYW1lIGFzIHRoZSBMaWJyZW0gNSBwYW5lbC4KPgo+SGVoLCBJ
IHdvbmRlciBob3cgaXQgY29tZXMgdGhhdCBpdCBpcyBzbyBzaW1pbGFyIHRvIElsaXRlay4KPkkg
Z3Vlc3MgSSB3aWxsIG5ldmVyIHVuZGVyc3RhbmQgaG93IHRoZSBzaWxpY29uIGVjb3N5c3RlbSB3
b3Jrcwo+aW4gYXNpYSAoSSBkaWQgcmVhZCBhIGxvdCBvZiBCdW5uaWUgSHVhbmcncyBhcnRpY2xl
cyBhbmQgaGFyZHdhcmUKPmhhY2tpbmcgYm9vayB0byB0cnkgdG8gdW5kZXJzdGFuZC4uLikKPgo+
VGhpcyBmaWxlIHNob3VsZCBiZSBuYW1lZCBzaXRyb25peCxzdDc3MDMueWFtbCB0aGVuLgo+Cj5B
Y2NvcmRpbmcgdG8gdGhlIGNvZGUgaW4gdGhlIExpYnJlbSA1Ogo+aHR0cHM6Ly9zb3VyY2UucHVy
aS5zbS9MaWJyZW01L2xpbnV4LW5leHQvYmxvYi9pbXg4LWN1cnJlbnQtbGlicmVtNS9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3NzAxLmMKPlRoZSBhY3R1YWwgbmFtZSBv
ZiB0aGUgZGlzcGxheSBpcyBUZWNoc3RhciB0czg1NTBiLgoKU29ycnksIGZvciBMaWJyZW0gNSBw
YW5lbCwgSSBtZWFuIFJvY2t0ZWNoIEpIMDU3TjAwOTAwIGhlcmUuCgpUaGlzIGlzIGFsc28gdGhl
IGNvZGUgdGhhdCBteSBwYXRjaHNldCBiYXNlZCBvbi4KCj5BbmQgdGhlIGRpc3BsYXkgY29udHJv
bGxlciBpcyBzdDc3MDEsIHNvIG1heWJlIHdlIHNob3VsZAo+YWN0dWFsbHkgbmFtZSBpdCBzaXRy
b25peCxzdDc3MHgueWFtbCBpZiB0aGVyZSBhcmUgc29tZQo+c3ViLXZhcmlhbnRzIG9mIHN0Nzcw
eD8KPgo+PiA+cHJvcGVydGllczoKPj4gPiAgY29tcGF0aWJsZToKPj4gPiAgICBpdGVtczoKPj4g
PiAgICAgIC0gY29uc3Q6IHhpbmdiYW5nZGEseGJkNTk5Cj4+ID4gICAgICAtIGNvbnN0OiBpbGl0
ZWssaWxpOTM0Mgo+PiA+Cj4+ID5Qb3NzaWJseSB1c2Ugb25lT2YgYW5kIGFkZCBzdXBwb3J0IGZv
ciB0aGUgaGltYXgsaHg4MzYzCj4+ID5hbHJlYWR5IHdoaWxlIHlvdSdyZSBhdCBpdC4KPgo+VGhp
cyBzaG91bGQgYXQgbGVhc3QgYmU6Cj4KPmNvbXBhdGlibGU6Cj4gICBpdGVtczoKPiAgICAgLSBl
bnVtOgo+ICAgICAgIC0geGluZ2JhbmdkYSx4YmQ1OTkKPiAgICAgICAtIGhpbWF4LGh4ODM2Mwo+
ICAgICAgIC0gdGVjaHN0YXIsdHM4NTUwYgo+ICAgICAtIGVudW06Cj4gICAgICAgLSBzaXRyb25p
eCxzdDc3MDEKPiAgICAgICAtIHNpdHJvbml4LHN0NzcwMwo+Cj5TbyBwYW5lbCBub2RlcyB1c2lu
ZyB0aGlzIHBhbmVsIGJlY29tZQo+Y29tcGF0aWJsZSA9ICJ4aW5nYmFuZ2RhLHNiZDU5OSIsICJz
aXRyb25peCxzdDc3MDMiCj5ldGMuCj4KPlRoaXMgd2F5IGl0IGlzIHN0cmFpZ2h0LWZvcndhcmQg
Zm9yIGRyaXZlcnMgdG8gaWRlbnRpZnkgdGhlIHBhbmVsCj52ZW5kb3IgYW5kIGRpc3BsYXkgY29u
dHJvbGxlci4KPgo+WW91cnMsCj5MaW51cyBXYWxsZWlqCj4KPl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj5saW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dAo+bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj5odHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwKCi0tIArkvb/nlKgg
Sy05IE1haWwg5Y+R6YCB6Ieq5oiR55qEQW5kcm9pZOiuvuWkh+OAggpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
