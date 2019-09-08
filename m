Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEAEAD023
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2019 19:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE5889261;
	Sun,  8 Sep 2019 17:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD4A89261
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2019 17:11:54 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 39E3280607;
 Sun,  8 Sep 2019 19:11:52 +0200 (CEST)
Date: Sun, 8 Sep 2019 19:11:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 0/2] drm/panel: Extend panels to report their types
Message-ID: <20190908171151.GB20115@ravnborg.org>
References: <20190904132804.29680-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904132804.29680-1-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=OLL_FvSJAAAA:8
 a=xq3W2uTSAAAA:8 a=cMWFZjDW593CE7z2QwcA:9 a=CjuIK1q_8ugA:10
 a=hvHtWMA9nZ4A:10 a=c1NVVqRKIsoA:10 a=oIrB72frpwYPwTMnlWqB:22
 a=P5L7wpMTXyg1GfFA3Gwx:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudC4KCk9uIFdlZCwgU2VwIDA0LCAyMDE5IGF0IDA0OjI4OjAyUE0gKzAzMDAsIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gSGVsbG8sCj4gCj4gVGhpcyBzZXJpZXMsIHdob3NlIHBy
ZXZpb3VzIHZlcnNpb24gd2FzIG5hbWVkICJbUEFUQ0ggdjIgMC80XSBkcm0vcGFuZWw6Cj4gRXh0
ZW5kIHBhbmVscyB0byByZXBvcnQgdGhlaXIgdHlwZXMiIGFuZCBpcyBhdmFpbGFibGUgYXQKPiBo
dHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9kcmktZGV2ZWwvbXNnMjI0NTc5Lmh0bWwsIGFs
bG93cyBwYW5lbHMgdG8KPiByZXBvcnQgdGhlaXIgdHlwZSwgaW4gb3JkZXIgdG8gY3JlYXRlIGRy
bV9jb25uZWN0b3IgaW5zdGFuY2VzIHdpdGgKPiBhcHByb3ByaWF0ZSB0eXBlcyBpbiB0aGUgdXBw
ZXIgbGF5ZXJzLgo+IAo+IEluIHBhdGNoIDEvMiB0aGUgZHJtX3BhbmVsIHN0cnVjdHVyZSByZWNl
aXZlcyBhIG5ldyBjb25uZWN0b3JfdHlwZSBmaWVsZAo+IHRvIHJlcG9ydCBpdHMgdHlwZSwgc2V0
IHRocm91Z2ggZHJtX3BhbmVsX2luaXQoKSwgYW5kIGFsbCBjb25uZWN0b3IKPiBkcml2ZXJzIGFy
ZSB1cGRhdGVkIGFjY29yZGluZ2x5LiBUaGUgcGFuZWwtc2ltcGxlIGRyaXZlciBob3dldmVyIG9u
bHkKPiByZXBvcnRzIHRoZSBMVkRTIGNvbm5lY3RvciB0eXBlIGZvciBrbm93bi10by1iZS1MVkRT
IHBhbmVscywgd2hpbGUgYWxsCj4gb3RoZXIgbGVhdmUgdGhlIGZpZWxkIGluaXRpYWxpc2VkIHRv
IDAsIGNvcnJlc3BvbmRpbmcgdG8KPiBEUk1fTU9ERV9DT05ORUNUT1JfVW5rbm93bi4gUGFuZWxz
IHN1cHBvcnRlZCBieSB0aGF0IGRyaXZlciB3aWxsIG5lZWQgdG8KPiBiZSByZXZpZXdlZCBvbmUg
Ynkgb25lIGFuZCB0aGVpciB0eXBlIHVwZGF0ZWQuIFRoaXMgd2FzIGRvbmUgdG8gYXZvaWQKPiBy
ZXBvcnRpbmcgYW4gaW5jb3JyZWN0IHR5cGUsIGFsbG93aW5nIHVwcGVyIGxheWVycyB0byBjYXRj
aAo+IERSTV9NT0RFX0NPTk5FQ1RPUl9Vbmtub3duIGFuZCBXQVJOKCkgdG8gdHJpZ2dlciBhbiB1
cGRhdGUgb2YgdGhlCj4gY29ycmVzcG9uZGluZyBwYW5lbC4KPiAKPiBQYXRjaCAyLzIgdGhlbiBt
b2RpZmllcyBkcm1fcGFuZWxfYnJpZGdlX2FkZCgpIGFuZCBpdHMgZGV2bV8gY291bnRlcnBhcnQK
PiB0byByZXBsYWNlIHRoZSBjb25uZWN0b3IgdHlwZSBhcmd1bWVudCB3aXRoIHRoZSB0eXBlIHJl
cG9ydGVkIGJ5IHRoZQo+IHBhbmVsLiBUaGlzIGNhbid0IHVuZm9ydHVuYXRlbHkgYmUgZm9yY2Vk
IHVwb24gYWxsIGRyaXZlcnMgYXMgc2V2ZXJhbCBvZgo+IHRoZW0gaGFyZGNvZGUgYSBEUk1fTU9E
RV9DT05ORUNUT1JfVW5rbm93biB0eXBlLCBhbmQgd291bGQgdGhlbiBjaGFuZ2UKPiB0aGUgY29u
bmVjdG9yIHR5cGUgcmVwb3J0ZWQgdG8gdXNlcnNwYWNlLCBsZWFkaW5nIHRvIHBvc3NpYmxlIGJy
ZWFrYWdlcy4KPiBBIG5ldyBmdW5jdGlvbiwgZHJtX3BhbmVsX2JyaWRnZV9hZGRfdHlwZWQoKSwg
aXMgYWRkZWQgd2l0aCB0aGUgZXhpc3RpbmcKPiBiZWhhdmlvdXIgb2YgZHJtX3BhbmVsX2JyaWRn
ZV9hZGQoKSB0byBjcmVhdGUgYSBwYW5lbCBicmlkZ2Ugd2l0aCBhCj4gZm9yY2VkIGNvbm5lY3Rv
ciB0eXBlLCBhbmQgZHJpdmVycyBhcmUgc3dpdGNoZWQgdG8gdXNpbmcgdGhhdCBmdW5jdGlvbi4K
PiBUaGV5IHNob3VsZCB0aGVuIGJlIHN3aXRjaGVkIGJhY2sgb25lIGJ5IG9uZSB0byBkcm1fcGFu
ZWxfYnJpZGdlX2FkZCgpCj4gYWZ0ZXIgY2FyZWZ1bCByZXZpZXcgKGFuZCBjbGV2ZXIgaGFuZGxp
bmcgb2YgdGhlIGNvbm5lY3RvciB0eXBlIGNoYW5nZQo+IGlzc3VlKS4gVGhlIGRybV9wYW5lbF9i
cmlkZ2VfYWRkX3R5cGVkKCkgZnVuY3Rpb24gaXMgbWFya2VkIGFzCj4gZGVwcmVjYXRlZCBhbmQg
c2hvdWxkIG5vdCBiZSB1c2VkIGluIG5ldyBjb2RlLgo+IAo+IER1cmluZyByZXZpZXcgb2YgdjIs
IHRoZSBxdWVzdGlvbiBvZiB3aGV0aGVyIHRvIGludHJvZHVjZSBhIG5ldwo+IERSTV9NT0RFX0NP
Tk5FQ1RPUl9QQU5FTCB3YXMgcmFpc2VkLiBUaGlzIGlzIHN0aWxsIGJlaW5nIGRpc2N1c3NlZCwg
YnV0Cj4gc3VjaCBhIGNoYW5nZSB3b3VsZCBzdGlsbCBuZWVkIHRvIGV4cG9zZSB0aGUgZXhpc3Rp
bmcgcGFuZWwgdHlwZXMgZm9yCj4gYmFja3dhcmQgY29tcGF0aWJpbGl0eSwgYW5kIHRoaXMgc2Vy
aWVzIHdvdWxkbid0IGhpbmRlciB0aGlzIGluIGFueSB3YXkuCj4gSSB0aHVzIGJlbGlldmUgdGhh
dCB3ZSBzaG91bGQgbWVyZ2UgaXQgc29vbmVyIHRoYW4gbGF0ZXIgd2l0aG91dCB3YWl0aW5nCj4g
Zm9yIHRoZSBEUk1fTU9ERV9DT05ORUNUT1JfUEFORUwgZGlzY3Vzc2lvbiB0byBzZXR0bGUuCkFn
cmVlZC4KCj4gCj4gVGhlIHBhdGNoZXMgYXJlIGF2YWlsYWJsZSBhdAo+IAo+IAlnaXQ6Ly9saW51
eHR2Lm9yZy9waW5jaGFydGwvbWVkaWEuZ2l0IG9tYXBkcm0vcGFuZWxzCj4gCj4gTGF1cmVudCBQ
aW5jaGFydCAoMik6Cj4gICBkcm0vcGFuZWw6IEFkZCBhbmQgZmlsbCBkcm1fcGFuZWwgdHlwZSBm
aWVsZAo+ICAgZHJtL2JyaWRnZTogcGFuZWw6IEluZmVyIGNvbm5lY3RvciB0eXBlIGZyb20gcGFu
ZWwgYnkgZGVmYXVsdAoKQXBwbGllZCBhbGwgdGhyZWUgcGF0Y2hlcyAoZGVzcGl0ZSB0aGlzIHNo
b3J0bG9nIG9ubHkgc2hvd3MgdHdvCnBhdGNoZXMpLgoKUHVzaGVkIHRvIGRybS1taXNjLW5leHQu
CgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
