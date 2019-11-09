Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103C1F6CC1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DB26E83B;
	Mon, 11 Nov 2019 02:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516086FAA5;
 Sat,  9 Nov 2019 00:01:23 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id DA5DD61187; Sat,  9 Nov 2019 00:01:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 by smtp.codeaurora.org (Postfix) with ESMTP id 6BC1A60F74;
 Sat,  9 Nov 2019 00:01:21 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 08 Nov 2019 19:01:21 -0500
From: cohens@codeaurora.org
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/3] allow DRM drivers to limit creation of blobs
In-Reply-To: <20191108083448.GU23790@phenom.ffwll.local>
References: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
 <20191108083448.GU23790@phenom.ffwll.local>
Message-ID: <7072bcc51eb44d49ab4266e0ec216df6@codeaurora.org>
X-Sender: cohens@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
X-Mailman-Approved-At: Mon, 11 Nov 2019 02:29:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1573257682;
 bh=QFs2x+x4fIEuZOx7pz7201e961RZN+MksTxeVaGJTnE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Dh0vJccm1drtq/03VdtiQnlFwi0bDS6EjrrvryDfK9nwvvPowMGFqTfu++lxCWBEF
 zUubn8/aQ5hUaMhvHvr+eGDds6k1DGIr+4rzot32Os48DJEjLHIWJ7HBnYHpODuPKq
 SjINxGiyZI2gNoMnnOKgnB8LYsD1w2Vjicu1+Zn0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1573257681;
 bh=QFs2x+x4fIEuZOx7pz7201e961RZN+MksTxeVaGJTnE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WA26uZqmY2unk2FaSXIgqizhShISWXuLUSiujNPt1wPyPvzozvxP58besRG9/S3IV
 FubVHkrGeRScD1O/aMeGZ5KA7DrFxZ2XdJCLyS+e+31NEnw3EW7hyNXPYkP5yOZgF1
 uZgku3kH4pML1wAt5ugbm+sG0aEOLh6kfv4rWV7o=
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
Cc: adelva@google.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, pdhaval@codeaurora.org, seanpaul@chromium.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMS0wOCAwMzozNCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBUaHUsIE5vdiAw
NywgMjAxOSBhdCAwMjozOToxMVBNIC0wNTAwLCBTdGV2ZSBDb2hlbiB3cm90ZToKPj4gRnV6emVy
cyB1c2VkIGluIEFuZHJvaWQgY29tcGxpYW5jZSB0ZXN0aW5nIHJlcGVhdGVkbHkgY2FsbCB0aGUK
Pj4gY3JlYXRlIGJsb2IgSU9DVEwgd2hpY2ggZXZlbnR1YWxseSBleGhhdXN0cyB0aGUgc3lzdGVt
IG1lbW9yeS4KPj4gVGhpcyBzZXJpZXMgYWRkcyBhIGhvb2sgd2hpY2ggYWxsb3dzIGRyaXZlcnMg
dG8gaW1wb3NlIHRoZWlyIG93bgo+PiBsaW1pdGF0aW9ucyBvbiB0aGUgc2l6ZSBhbmQvb3IgbnVt
YmVyIG9mIGJsb2JzIGNyZWF0ZWQuCj4gCj4gUHJldHR5IHN1cmUgdGhpcyBpc24ndCBqdXN0IGEg
cHJvYmxlbSBmb3IgbXNtL2RwdSBhbG9uZSwgd2h5IHRoaXMgdmVyeQo+IGxpbWl0ZWQgYXBwcm9h
Y2g/Cj4gCkknbSBub3QgZmFtaWxpYXIgZW5vdWdoIHdpdGggdGhlIGJsb2IgcmVxdWlyZW1lbnRz
IGZvciBvdGhlcgp2ZW5kb3IncyBkcml2ZXJzIHRvIGltcG9zZSBhbnkgcmVzdHJpY3Rpb25zIG9u
IHRoZW0uIFRoZSBpZGVhCndhcyB0byBwcm92aWRlIHRoZSBob29rIGZvciB2ZW5kb3JzIHRvIGlt
cGxlbWVudCB0aGVpciBvd24KY2hlY2tzLiBTdXBwb3J0IGZvciBtc20vbWRwKiBkcml2ZXJzIHdp
bGwgYmUgYWRkZWQgaW4gdjIgaWYgdGhpcwphcHByb2FjaCBpcyBhY2NlcHRhYmxlLgoKPiBBbHNv
LCB3aHkgYXJlIHlvdXIgZnV6emVycyBub3QgYWxzbyBhbGxvY2F0aW5nIGVub3Jtb3VzIGFtb3Vu
dHMgb2YgZ2VtCj4gYnVmZmVycywgd2hpY2ggd2lsbCBhbHNvIGV4aGF1c3QgbWVtb3J5IGV2ZW50
dWFsbHk/CgpFeGNlbGxlbnQgcXVlc3Rpb24uLi4gVGhpcyB3aWxsIGxpa2VseSBjb21lIGluIGEg
Zm9sbG93LXVwIHNlcmllcy4KCj4gLURhbmllbAo+IAo+PiAKPj4gU3RldmUgQ29oZW4gKDMpOgo+
PiAgIGRybTogYWRkIGRyaXZlciBob29rIGZvciBjcmVhdGUgYmxvYiBsaW1pdGF0aW9ucwo+PiAg
IGRybS9tc206IGFkZCBzdXBwb3J0IGZvciBjcmVhdGVibG9iX2NoZWNrIGRyaXZlciBob29rCj4+
ICAgZHJtL21zbS9kcHU6IGNoZWNrIGJsb2IgbGltaXRhdGlvbnMgZHVyaW5nIGNyZWF0ZSBibG9i
IGlvY3RsCj4+IAo+PiAgZHJpdmVycy9ncHUvZHJtL2RybV9wcm9wZXJ0eS5jICAgICAgICAgIHwg
IDcgKysrKysrKwo+PiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jIHwg
MTQgKysrKysrKysrKysrKysKPj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jICAgICAg
ICAgICB8IDI1IAo+PiArKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICBkcml2ZXJzL2dwdS9k
cm0vbXNtL21zbV9rbXMuaCAgICAgICAgICAgfCAgMSArCj4+ICBpbmNsdWRlL2RybS9kcm1fZHJ2
LmggICAgICAgICAgICAgICAgICAgfCAgOSArKysrKysrKysKPj4gIDUgZmlsZXMgY2hhbmdlZCwg
NTYgaW5zZXJ0aW9ucygrKQo+PiAKPj4gLS0KPj4gVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2Vu
dGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIHRoZSBDb2RlIEF1cm9yYSAKPj4gRm9ydW0sCj4+IGEg
TGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QKPj4gCj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
