Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FE082505
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 20:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E9A89ED6;
	Mon,  5 Aug 2019 18:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D126789ED6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 18:45:05 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id d17so86359613oth.5
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 11:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l0A2519yNK1w0fFCFDLTbYzcJ4RHoHgwBmYoGz/rYvo=;
 b=iwPAWfzyVSffHessqYQOnmWCG7ty2daI4B3UCituraTFQzQ2k6tmJ67xa7KwljXt4n
 QumVF9fHyPXxvLhvYRq0EdvUDAX9/p27Bzfz1lo/5l++bmzUvJ6cxEoIkNGCii38EUVd
 PacbxzfehD3EJdCod8favUyhWtx+aR5WS1lECTeFFAe5gHDvIDQEJIqe9mgF70ZtIX2+
 aUdfibWdtVxXi1Nxy/GCiJMkMQntIut+R6TUreRkn6rvTmv7xyDLyJPuruhg4wmCe3dP
 K8gqbNloX7XPuCDogxSlJC9OwmzFOWeCmVNQJ1dN7B8I+IZglt0RbjLufe3z7tRqYXIS
 8kuw==
X-Gm-Message-State: APjAAAUly7uXs6e24p64YWovUHgEXWXIe5d0t+h0TWGBFQIH+ra6MeLR
 YbO2KL/763uIQOlgRDB+GH+nWMzSgEphMWRUWig=
X-Google-Smtp-Source: APXvYqyvjXEpKNDgrdNLbKj9ZfIDw6XpAyxrq4Zg+gxWRCEYmbhIOlN7aIfLOnEz2xYTz+NvbRfTqWcqDREE2KaDfCE=
X-Received: by 2002:a05:6830:ce:: with SMTP id
 x14mr99332077oto.188.1565030704999; 
 Mon, 05 Aug 2019 11:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190804122653.6587-1-laurent.pinchart@ideasonboard.com>
 <20190805162815.GT7444@phenom.ffwll.local>
 <20190805171502.GA13149@pendragon.ideasonboard.com>
In-Reply-To: <20190805171502.GA13149@pendragon.ideasonboard.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 5 Aug 2019 20:44:53 +0200
Message-ID: <CAKMK7uFR6pE5Lp79FBmqp7C5AiChHXi_rfbd9HPRREkzvW_MLA@mail.gmail.com>
Subject: Re: [PATCH] drm: connector: Clarify drm_connecter.ddc field
 documentation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=l0A2519yNK1w0fFCFDLTbYzcJ4RHoHgwBmYoGz/rYvo=;
 b=gMHcSkyA67s08xMlL5Kaor4Vw2/4e3UReOpXUDhbDMLIqa6BAfQpiPaH3Mq9o4AHFy
 qc5Jaj5PsVQYc8mCLqke4HTqw4rwAX5quClwtgLAdgX6iXivDF3VECJDpt29627srZ1s
 y4b1I7AGosoe9XlRUlOyZgMWNwg3eZ8kIcyI0=
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
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgNSwgMjAxOSBhdCA3OjE1IFBNIExhdXJlbnQgUGluY2hhcnQKPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cj4KPiBIaSBEYW5pZWwsCj4KPiBPbiBN
b24sIEF1ZyAwNSwgMjAxOSBhdCAwNjoyODoxNVBNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3Rl
Ogo+ID4gT24gU3VuLCBBdWcgMDQsIDIwMTkgYXQgMDM6MjY6NTNQTSArMDMwMCwgTGF1cmVudCBQ
aW5jaGFydCB3cm90ZToKPiA+ID4gSW1wcm92ZSB0aGUgZG9jdW1lbnRhdGlvbiBvZiB0aGUgZGRj
IGZpZWxkIGJ5IHVzaW5nIEREQyBhbmQgSTJDCj4gPiA+IGNvbnNpc3RlbnRseSwgYW5kIGV4cGxh
aW5pbmcgbW9yZSBjbGVhcmx5IHdoYXQgdGhlIGZpZWxkIHBvaW50cyB0by4KPiA+ID4KPiA+ID4g
U2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCB8
IDggKysrKy0tLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY29ubmVj
dG9yLmggYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPiA+ID4gaW5kZXggZmM1ZDA4NDM4
MzMzLi4wZDAxNjYyYWE0MGUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25u
ZWN0b3IuaAo+ID4gPiArKysgYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPiA+ID4gQEAg
LTEzMTUsMTAgKzEzMTUsMTAgQEAgc3RydWN0IGRybV9jb25uZWN0b3Igewo+ID4gPgo+ID4gPiAg
ICAgLyoqCj4gPiA+ICAgICAgKiBAZGRjOiBhc3NvY2lhdGVkIGRkYyBhZGFwdGVyLgo+ID4gPiAt
ICAgICogQSBjb25uZWN0b3IgdXN1YWxseSBoYXMgaXRzIGFzc29jaWF0ZWQgZGRjIGFkYXB0ZXIu
IElmIGEgZHJpdmVyIHVzZXMKPiA+ID4gLSAgICAqIHRoaXMgZmllbGQsIHRoZW4gYW4gYXBwcm9w
cmlhdGUgc3ltYm9saWMgbGluayBpcyBjcmVhdGVkIGluIGNvbm5lY3Rvcgo+ID4gPiAtICAgICog
c3lzZnMgZGlyZWN0b3J5IHRvIG1ha2UgaXQgZWFzeSBmb3IgdGhlIHVzZXIgdG8gdGVsbCB3aGlj
aCBpMmMKPiA+ID4gLSAgICAqIGFkYXB0ZXIgaXMgZm9yIGEgcGFydGljdWxhciBkaXNwbGF5Lgo+
ID4gPiArICAgICogV2hlbiB0aGUgY29ubmVjdG9yIGNhcnJpZXMgRERDIHNpZ25hbHMsIHRoaXMg
ZmllbGQgcG9pbnRzIHRvIHRoZSBJMkMKPiA+Cj4gPiBzL0REQy9hIEREQy8KPgo+IEREQyBpcyBj
YXJyaWVkIGJ5IHR3byBzaWduYWxzIChhdCBsZWFzdCBmb3IgRERDMiwgdGhlIG1vc3RseQo+IHVu
aW1wbGVtZW50ZWQgRERDMSB1c2VkIGEgc2luZ2xlIHNpZ25hbCksIHNvICJjYXJyaWVzIEREQyBz
aWduYWxzIiBzZWVtcwo+IGFwcHJvcHJpYXRlIHRvIG1lLgoKSSBvdmVybG9va2VkIHRoZSBwbHVy
YWwsIGxvb2tzIGdvb2QgYXMtaXMuCi1EYW5pZWwKCj4KPiA+ID4gKyAgICAqIGFkYXB0ZXIgY29u
bmVjdGVkIHRvIHRoZSBEREMgc2lnbmFscywgaWYgYW55LiBXaGVuIHRoaXMgZmllbGQgaXMgbm90
Cj4gPiBzL25vdCBOVUxML2lzIHNldC8gb3RoZXJ3aXNlIHBhcnNpbmcgaGljY3VwIG9uIHRoZSBk
b3VibGUgbmVnYXRpdmUgOi0pCj4gPgo+ID4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gPgo+ID4gPiArICAgICogTlVMTCBhIHN5bWJvbGljIGxp
bmsgaXMgY3JlYXRlZCBpbiB0aGUgY29ubmVjdG9yJ3Mgc3lzZnMgZGlyZWN0b3J5Cj4gPiA+ICsg
ICAgKiB0byBleHBvc2UgdGhlIEkyQyBhZGFwdGVyIHVzZWQgYnkgdGhlIGNvbm5lY3Rvci4KPiA+
ID4gICAgICAqCj4gPiA+ICAgICAgKiBUaGUgZmllbGQgc2hvdWxkIGJlIHNldCBieSBjYWxsaW5n
IGRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYygpLgo+ID4gPiAgICAgICovCj4KPiAtLQo+IFJl
Z2FyZHMsCj4KPiBMYXVyZW50IFBpbmNoYXJ0CgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6
Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
