Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351AAD7CF3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 19:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EF16E045;
	Tue, 15 Oct 2019 17:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E816E045
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 17:09:20 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id k32so17599141otc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 10:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JHMlVw4tvcimgqLNE6cW+4izJ5ZEdiASsMVMnyNWIFE=;
 b=lb7Ir+Mu/5A5ltSDgX2XyT2b30pB8Srdr4gO/tiI3vXtisQYL/YDQFZr1kF7RfqV6K
 Ht5WbIIUre9jJuJo2mYxiTerBJy3WxxPfJ9Cq5T1j26/c9MAi3mTgiPF8hWBIHhW8M1H
 bzubespPn1Gx1RcCcLuGVi7dx546kHpyLBkh9xMloyHZFNpXnRUJDnouebeuA47GGnj4
 c1ULcooeamI8gjD8GWfbPi515KJOdaoXFMXpNG/IcjzSFEAexk1fuLk+KlYfUxrBib0Z
 2iROWrSl/FUW+5eXNH8NeyeJd4rqBGdyNY3y2wQh8FnS2RGhkIryR3MvEGL/kgPuVzFM
 Z/yQ==
X-Gm-Message-State: APjAAAWmmWBPpYpBE4ycs5ugvvyNzEESvFWkkXsOlL+7Z83xEwur24JR
 JlZks7Roa+lbwFcd8ek13w==
X-Google-Smtp-Source: APXvYqy2X9I15W25gmPVuvvFHsnO6LRLZtuacdrohlwkKPnx10p92ZlfGBeUKRra5d48a54FxaB9Kg==
X-Received: by 2002:a9d:70c3:: with SMTP id w3mr22943854otj.246.1571159359034; 
 Tue, 15 Oct 2019 10:09:19 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o184sm6585474oia.28.2019.10.15.10.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 10:09:18 -0700 (PDT)
Date: Tue, 15 Oct 2019 12:09:17 -0500
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v4] dt-bindings: display: Convert stm32 display bindings
 to json-schema
Message-ID: <20191015170917.GA8078@bogus>
References: <20191015123151.14828-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015123151.14828-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, alexandre.torgue@st.com,
 airlied@linux.ie, philippe.cornu@st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, yannick.fertre@st.com, robh+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxNSBPY3QgMjAxOSAxNDozMTo1MSArMDIwMCwgQmVuamFtaW4gR2FpZ25hcmQgd3Jv
dGU6Cj4gQ29udmVydCB0aGUgU1RNMzIgZGlzcGxheSBiaW5kaW5nIHRvIERUIHNjaGVtYSBmb3Jt
YXQgdXNpbmcganNvbi1zY2hlbWEuCj4gU3BsaXQgdGhlIG9yaWdpbmFsIGJpbmRpbmdzIGluIHR3
byB5YW1sIGZpbGVzOgo+IC0gb25lIGZvciBkaXNwbGF5IGNvbnRyb2xsZXIgKGx0ZGMpCj4gLSBv
bmUgZm9yIERTSSBjb250cm9sbGVyCj4gCj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR2FpZ25h
cmQgPGJlbmphbWluLmdhaWduYXJkQHN0LmNvbT4KPiAtLS0KPiBjaGFuZ2VzIGluIHY0Ogo+IC0g
ZGVzY3JpYmUgaW50ZXJydXB0aW9ucyBpdGVtcwo+IC0gcmVtb3ZlIHVuaXQgYWRkcmVzcyBmcm9t
IHBvcnQgcHJvcGVydHkKPiAtIHJlbW92ZSBkbWEtcmFuZ2VzIChEVCBwYXRjaGVzIHNlbmQgdG9v
KQo+IAo+IGNoYW5nZXMgaW4gdjM6Cj4gLSB1c2UgKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1
c2UpIGxpY2Vuc2UKPiAKPiBjaGFuZ2VzIGluIHYyOgo+IC0gdXNlIEJTRC0yLUNsYXVzZSBsaWNl
bnNlCj4gLSBhZGQgcGFuZWwgcHJvcGVydHkKPiAtIGZpeCBpZGVudGF0aW9uCj4gLSByZW1vdmUg
cGluY3RybC1uYW1lczogdHJ1ZQo+IC0gcmVtb3ZlIHBpbmN0cmwtWzAtOV0rOiB0cnVlCj4gLSBy
ZXdvcmsgcG9ydHMgYmxvY2sgdG8gaW5jbHVkZSBwb3J0QDAgYW5kIHBvcnRAMQo+IC0gdXNlIGNv
bnN0IGZvciAjYWRyZXNzLWNlbGxzIGFuZCAjc2l6ZS1jZWxscwo+IC0gYWRkIGFkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0
bTMyLWRzaS55YW1sICB8IDE1MSArKysrKysrKysrKysrKysrKysrKysKPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4dCAgfCAxNDQgLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRj
LnlhbWwgfCAgODEgKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAyMzIgaW5zZXJ0aW9u
cygrKSwgMTQ0IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItZHNpLnlhbWwKPiAgZGVsZXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0
LHN0bTMyLWx0ZGMudHh0Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnlhbWwKPiAKCkFwcGxpZWQsIHRo
YW5rcy4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
