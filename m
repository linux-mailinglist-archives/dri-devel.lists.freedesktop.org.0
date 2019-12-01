Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D7510E227
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2019 15:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A8C6E091;
	Sun,  1 Dec 2019 14:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5966E091
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Dec 2019 14:18:31 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id DD6E920049;
 Sun,  1 Dec 2019 15:18:26 +0100 (CET)
Date: Sun, 1 Dec 2019 15:18:25 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v2 4/5] drm/tidss: New driver for TI Keystone platform
 Display SubSystem
Message-ID: <20191201141825.GA696@ravnborg.org>
References: <cover.1575203210.git.jsarha@ti.com>
 <2928aed8df17794076547f00f0a34d53a840e441.1575203210.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2928aed8df17794076547f00f0a34d53a840e441.1575203210.git.jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=QpfBK6x6l_AAftyt6VkA:9 a=CjuIK1q_8ugA:10
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
Cc: yamonkar@cadence.com, praneeth@ti.com, sjakhade@cadence.com,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, subhajit_paul@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSnlyaQoKVGhhbmtzIGZvciB0aGUgdXBkYXRlLgoKT24gU3VuLCBEZWMgMDEsIDIwMTkgYXQg
MDM6NTA6MDdQTSArMDIwMCwgSnlyaSBTYXJoYSB3cm90ZToKPiBUaGlzIHBhdGNoIGFkZHMgYSBu
ZXcgRFJNIGRyaXZlciBmb3IgVGV4YXMgSW5zdHJ1bWVudHMgRFNTIElQcyB1c2VkIG9uCj4gVGV4
YXMgSW5zdHJ1bWVudHMgS2V5c3RvbmUgSzJHLCBBTTY1eCwgYW5kIEo3MjFlIFNvQ3MuIFRoZSBu
ZXcgRFNTIElQIGlzCj4gYSBtYWpvciBjaGFuZ2UgdG8gdGhlIG9sZGVyIERTUyBJUCB2ZXJzaW9u
cywgd2hpY2ggYXJlIHN1cHBvcnRlZCBieQo+IHRoZSBvbWFwZHJtIGRyaXZlci4gV2hpbGUgb24g
aGlnaGVyIGxldmVsIHRoZSBLZXlzdG9uZSBEU1MgcmVzZW1ibGVzCj4gdGhlIG9sZGVyIERTUyB2
ZXJzaW9ucywgdGhlIHJlZ2lzdGVycyBhcmUgY29tcGxldGVseSBkaWZmZXJlbnQgYW5kIHRoZQo+
IGludGVybmFsIHBpcGVsaW5lcyBkaWZmZXIgYSBsb3QuCj4gCj4gRFNTIElQIGZvdW5kIG9uIEsy
RyBpcyBhbiAidWx0cmEtbGlnaHQiIHZlcnNpb24sIGFuZCBoYXMgb25seSBhIHNpbmdsZQo+IHBs
YW5lIGFuZCBhIHNpbmdsZSBvdXRwdXQuIFRoZSBLZXlzdG9uZSAzIERTUyBJUHMgYXJlIGZvdW5k
IG9uIEFNNjV4Cj4gYW5kIEo3MjFFIFNvQ3MuIEFNNjV4IERTUyBoYXMgdHdvIHZpZGVvIHBvcnRz
LCBvbmUgZnVsbCB2aWRlbyBwbGFuZSwKPiBhbmQgYW5vdGhlciAibGl0ZSIgcGxhbmUgd2l0aG91
dCBzY2FsaW5nIHN1cHBvcnQuIEo3MjFFIGhhcyA0IHZpZGVvCj4gcG9ydHMsIDIgdmlkZW8gcGxh
bmVzIGFuZCAyIGxpdGUgcGxhbmVzLiBBTTY1eCBEU1MgaGFzIGFsc28gaW50ZWdyYXRlZAo+IE9M
REkgKExWRFMpIG91dHB1dC4KClBsZWFzZSBpbmNsdWRlIGEgc2hvcnQgbm90aWNlIG9uIHRoZSBj
aGFuZ2VzIGZyb20gdjEgPT4gdjIuClByZWZlcmFibHkgaW5zaWRlIHRoZSBjaGFuZ2Vsb2cgYXJl
YSBzbyB0aGUgY2hhbmdlbG9nIGlzIHByZXNlcnZlZAp3aGVuIHRoZSBwYXRjaCBpcyBjb21taXR0
ZWQuCgpTZWUgZm9yIGV4YW1wbGU6IGE2Yzk0OGY5ODIzOWNiZWMxZjVmMGRjNzQxYjU4NDEwMDhj
MjY0ZmYKKEp1c3QgYSByYW5kb20gaGl0IGluICJnaXQgbG9nIikKCglTYW0KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
