Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4C17370E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 20:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F016E622;
	Wed, 24 Jul 2019 18:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBA46E622;
 Wed, 24 Jul 2019 18:55:59 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 89EC180627;
 Wed, 24 Jul 2019 20:55:56 +0200 (CEST)
Date: Wed, 24 Jul 2019 20:55:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v4 0/4] drm/via: drop use of deprecated headers drmP.h +
 drm_os_linux.h
Message-ID: <20190724185555.GD22640@ravnborg.org>
References: <20190723200944.17285-1-sam@ravnborg.org>
 <20190724161821.GD24644@arch-x1c3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724161821.GD24644@arch-x1c3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8
 a=JG43a4zGtIXwf-iovqkA:9 a=CjuIK1q_8ugA:10 a=AbAUZ8qAyYyZVLSsDulk:22
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 openchrome-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>,
 dri-devel@lists.freedesktop.org, Ira Weiny <ira.weiny@intel.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW1pbC4KCk9uIFdlZCwgSnVsIDI0LCAyMDE5IGF0IDA1OjE4OjIxUE0gKzAxMDAsIEVtaWwg
VmVsaWtvdiB3cm90ZToKPiBPbiAyMDE5LzA3LzIzLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gPiBU
aGlzIGlzIHNvbWUgamFuaXRvcmlhbCB1cGRhdGVzIHRvIHRoZSB2aWEgZHJpdmVyCj4gPiB0aGF0
IGlzIHJlcXVpcmVkIHRvIGdldCByaWQgb2YgZGVwcmVjYXRlZCBoZWFkZXJzCj4gPiBpbiB0aGUg
ZHJtIHN1YnN5c3RlbS4KPiA+IAo+ID4gVGhlIGZpcnN0IHRocmVlIHBhdGNoZXMgcHJlcGFyZSBm
b3IgdGhlIHJlbW92YWwgb2YgZHJtUC5oLgo+ID4gVGhlIGxhc3QgcGF0Y2ggcmVtb3ZlIHVzZSBv
ZiBkcm1QLmggYW5kIHJlcGxhY2Ugd2l0aCBuZWNlc3NhcnkKPiA+IGluY2x1ZGUgZmlsZXMgdG8g
Zml4IGJ1aWxkLgo+ID4gCj4gPiBCdWlsZCB0ZXN0ZWQgd2l0aCB2YXJpb3VzIGNvbmZpZ3MgYW5k
IHZhcmlvdXMgYXJjaGl0ZWN0dXJlcy4KPiA+IAo+ID4gSSBoYWQgcHJlZmVycmVkIHRoYXQgdGhl
IHZpYSBkcml2ZXIgd2FzIHJlcGxhY2VkIGJ5IHRoZQo+ID4gb3BlbmNocm9tZSBkcml2ZXIsIGJ1
dCB1bnRpbCB3ZSBoYXZlIGl0IHRoZW4gd2UgbmVlZAo+ID4gdG8gZGVhbCB3aXRoIHRoZSBsZWdh
Y3kgdmlhIGRyaXZlciB3aGVuIHJlbW92aW5nIG9sZCBjcnVmdAo+ID4gaW4gdGhlIGRybSBzdWJz
eXN0ZW0uCj4gPiAKPiA+IHY0Ogo+ID4gLSBVc2UgYSBtb3JlIHN0YW5kYXJkIHZhcmlhbnQgZm9y
IHZpYV93cml0ZThfbWFzaygpIChFbWlsKQo+ID4gCj4gVGhhbmsgeW91LiBUaGUgc2VyaWVzIGlz
Ogo+IFJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29t
PgoKVGhhbmtzIGZvciB5b3VyIHBhdGllbmNlIHdpdGggbWUhCkkgd2lsbCBhcHBseSB3aGVuIEkg
YW0gYmFjayBob21lIHRvbW9ycm93LgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
