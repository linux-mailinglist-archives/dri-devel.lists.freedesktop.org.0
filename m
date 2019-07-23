Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 887BB71F12
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2D56E369;
	Tue, 23 Jul 2019 18:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418386E323
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 17:26:29 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id x17so47636615iog.8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 10:26:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to:cc;
 bh=18dpD/naihNOjoNrgGIrjwwIJhV9RriEpPtRMJT/ORo=;
 b=fH2p+DnzD8bRxI3ahDghwKsji5RJq3b0SB7J8bIkGVsDFoM1YIO1VQ2mm4CqGYhNsY
 a7zgFejYg/JRTs2RgFJanhy48sGsdIeE3HyL/iAKQ1sC9pBxMWJBQUft0Yk601gkXnGE
 m59nvJYk5VvDx/dG2bUYgemrUdEtnLxcjXVCrCb2FkNs8Kv87CxkLQFLLcRsuyc3Sxa+
 WSP9+ar7Pc8mhscBcJz0AxyDhapH4J/bRyRgJf1nUTWDgM5DygCxfEQ+uuxL4mlQj5oo
 XoqRA+q9fNF7sWynq6cI4gLRGtSgepDW+y3czIJO2sXCEQK6Nm4i4UhV3zFbdblfBJ6h
 4UuA==
X-Gm-Message-State: APjAAAXnkKJTaDmZcTSPnhlHlzzftrfa+jMapJBQFUdceVFQa3oaxHpz
 v1GABXzsS8zqe9s8vG7pa0RaM47HUtwOfyndJS/tytOb3Gy/
X-Google-Smtp-Source: APXvYqyCe7AfPrluXBIbZlQzVEeh9JxvWJ4U1jT02MrsCAmY9jj6X4SXKsEfnTom19bvNkP5FIZFgnFlrHkpQva5F/PA/CCuwooO
MIME-Version: 1.0
X-Received: by 2002:a5d:9acf:: with SMTP id x15mr44816852ion.190.1563902788559; 
 Tue, 23 Jul 2019 10:26:28 -0700 (PDT)
Date: Tue, 23 Jul 2019 10:26:28 -0700
In-Reply-To: <5d37433a832d_3aba2ae4f6ec05bc3a@john-XPS-13-9370.notmuch>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002cec2e058e5c7e63@google.com>
Subject: Re: Re: kernel panic: stack is corrupted in pointer
From: syzbot <syzbot+79f5f028005a77ecb6bb@syzkaller.appspotmail.com>
To: John Fastabend <john.fastabend@gmail.com>
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
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
Cc: daniel@iogearbox.net, airlied@linux.ie, netdev@vger.kernel.org,
 john.fastabend@gmail.com, ast@kernel.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 bpf@vger.kernel.org, leo.liu@amd.com, christian.koenig@amd.com,
 dvyukov@google.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBEbWl0cnkgVnl1a292IHdyb3RlOgo+PiBPbiBXZWQsIEp1bCAxNywgMjAxOSBhdCAxMDo1OCBB
TSBzeXpib3QKPj4gPHN5emJvdCs3OWY1ZjAyODAwNWE3N2VjYjZiYkBzeXprYWxsZXIuYXBwc3Bv
dG1haWwuY29tPiB3cm90ZToKPj4gPgo+PiA+IEhlbGxvLAo+PiA+Cj4+ID4gc3l6Ym90IGZvdW5k
IHRoZSBmb2xsb3dpbmcgY3Jhc2ggb246Cj4+ID4KPj4gPiBIRUFEIGNvbW1pdDogICAgMTQzOGNk
ZTcgQWRkIGxpbnV4LW5leHQgc3BlY2lmaWMgZmlsZXMgZm9yIDIwMTkwNzE2Cj4+ID4gZ2l0IHRy
ZWU6ICAgICAgIGxpbnV4LW5leHQKPj4gPiBjb25zb2xlIG91dHB1dDogIAo+PiBodHRwczovL3N5
emthbGxlci5hcHBzcG90LmNvbS94L2xvZy50eHQ/eD0xMzk4ODA1ODYwMDAwMAo+PiA+IGtlcm5l
bCBjb25maWc6ICAgCj4+IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94
PTM0MzBhMTUxZTE0NTIzMzEKPj4gPiBkYXNoYm9hcmQgbGluazogIAo+PiBodHRwczovL3N5emth
bGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9NzlmNWYwMjgwMDVhNzdlY2I2YmIKPj4gPiBjb21w
aWxlcjogICAgICAgZ2NjIChHQ0MpIDkuMC4wIDIwMTgxMjMxIChleHBlcmltZW50YWwpCj4+ID4g
c3l6IHJlcHJvOiAgICAgICAKPj4gaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXBy
by5zeXo/eD0xMTFmYzhhZmEwMDAwMAoKPj4gIEZyb20gdGhlIHJlcHJvIGl0IGxvb2tzIGxpa2Ug
dGhlIHNhbWUgYnBmIHN0YWNrIG92ZXJmbG93IGJ1Zy4gK0pvaG4KPj4gV2UgbmVlZCB0byBkdXAg
dGhlbSBvbnRvIHNvbWUgY2Fub25pY2FsIHJlcG9ydCBmb3IgdGhpcyBidWcsIG9yIHRoaXMKPj4g
YmVjb21lcyB1bm1hbmFnZWFibGUuCgo+IEZpeGVzIGluIGJwZiB0cmVlIHNob3VsZCBmaXggdGhp
cy4gSG9wZWZ1bGx5LCB3ZSB3aWxsIHNxdWFzaCB0aGlzIG9uY2UgIAo+IGZpeGVzCj4gcGVyY29s
YXRlIHVwLgoKPiAjc3l6IHRlc3Q6IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9icGYvYnBmLmdpdAoKIj4iIGRvZXMgbm90IGxvb2sgbGlrZSBhIHZhbGlkIGdp
dCBicmFuY2ggb3IgY29tbWl0LgoKCgo+PiAjc3l6IGR1cDoga2VybmVsIHBhbmljOiBjb3JydXB0
ZWQgc3RhY2sgZW5kIGluIGRwdXQKCj4+ID4gVGhlIGJ1ZyB3YXMgYmlzZWN0ZWQgdG86Cj4+ID4K
Pj4gPiBjb21taXQgOTZhNWQ4ZDQ5MTVmM2UyNDFlYmI0OGQ1ZGVjZGQxMTBhYjljN2RjZgo+PiA+
IEF1dGhvcjogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgo+PiA+IERhdGU6ICAgRnJpIEp1bCAx
MyAxNToyNjoyOCAyMDE4ICswMDAwCj4+ID4KPj4gPiAgICAgIGRybS9hbWRncHU6IE1ha2Ugc3Vy
ZSBJQiB0ZXN0cyBmbHVzaGVkIGFmdGVyIElQIHJlc3VtZQo+PiA+Cj4+ID4gYmlzZWN0aW9uIGxv
ZzogICAKPj4gaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9iaXNlY3QudHh0P3g9MTRh
NDYyMDA2MDAwMDAKPj4gPiBmaW5hbCBjcmFzaDogICAgIAo+PiBodHRwczovL3N5emthbGxlci5h
cHBzcG90LmNvbS94L3JlcG9ydC50eHQ/eD0xNmE0NjIwMDYwMDAwMAo+PiA+IGNvbnNvbGUgb3V0
cHV0OiAgCj4+IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvbG9nLnR4dD94PTEyYTQ2
MjAwNjAwMDAwCj4+ID4KPj4gPiBJTVBPUlRBTlQ6IGlmIHlvdSBmaXggdGhlIGJ1ZywgcGxlYXNl
IGFkZCB0aGUgZm9sbG93aW5nIHRhZyB0byB0aGUgIAo+PiBjb21taXQ6Cj4+ID4gUmVwb3J0ZWQt
Ynk6IHN5emJvdCs3OWY1ZjAyODAwNWE3N2VjYjZiYkBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29t
Cj4+ID4gRml4ZXM6IDk2YTVkOGQ0OTE1ZiAoImRybS9hbWRncHU6IE1ha2Ugc3VyZSBJQiB0ZXN0
cyBmbHVzaGVkIGFmdGVyIElQCj4+ID4gcmVzdW1lIikKPj4gPgo+PiA+IEtlcm5lbCBwYW5pYyAt
IG5vdCBzeW5jaW5nOiBzdGFjay1wcm90ZWN0b3I6IEtlcm5lbCBzdGFjayBpcyBjb3JydXB0ZWQg
IAo+PiBpbjoKPj4gPiBwb2ludGVyKzB4NzAyLzB4NzUwIGxpYi92c3ByaW50Zi5jOjIxODcKPj4g
PiBTaHV0dGluZyBkb3duIGNwdXMgd2l0aCBOTUkKPj4gPiBLZXJuZWwgT2Zmc2V0OiBkaXNhYmxl
ZAo+PiA+Cj4+ID4KPj4gPiAtLS0KPj4gPiBUaGlzIGJ1ZyBpcyBnZW5lcmF0ZWQgYnkgYSBib3Qu
IEl0IG1heSBjb250YWluIGVycm9ycy4KPj4gPiBTZWUgaHR0cHM6Ly9nb28uZ2wvdHBzbUVKIGZv
ciBtb3JlIGluZm9ybWF0aW9uIGFib3V0IHN5emJvdC4KPj4gPiBzeXpib3QgZW5naW5lZXJzIGNh
biBiZSByZWFjaGVkIGF0IHN5emthbGxlckBnb29nbGVncm91cHMuY29tLgo+PiA+Cj4+ID4gc3l6
Ym90IHdpbGwga2VlcCB0cmFjayBvZiB0aGlzIGJ1ZyByZXBvcnQuIFNlZToKPj4gPiBodHRwczov
L2dvby5nbC90cHNtRUojc3RhdHVzIGZvciBob3cgdG8gY29tbXVuaWNhdGUgd2l0aCBzeXpib3Qu
Cj4+ID4gRm9yIGluZm9ybWF0aW9uIGFib3V0IGJpc2VjdGlvbiBwcm9jZXNzIHNlZTogIAo+PiBo
dHRwczovL2dvby5nbC90cHNtRUojYmlzZWN0aW9uCj4+ID4gc3l6Ym90IGNhbiB0ZXN0IHBhdGNo
ZXMgZm9yIHRoaXMgYnVnLCBmb3IgZGV0YWlscyBzZWU6Cj4+ID4gaHR0cHM6Ly9nb28uZ2wvdHBz
bUVKI3Rlc3RpbmctcGF0Y2hlcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
