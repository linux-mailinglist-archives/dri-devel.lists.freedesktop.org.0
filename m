Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4169FBD3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 09:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DB989BD5;
	Wed, 28 Aug 2019 07:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEADE89BD5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 07:32:35 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id b1so1816267otp.6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 00:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QD99J6UIVZGmimTy0Hqij9Z3+TZVwBN/634gcbM0Yv4=;
 b=G6Plj8InOpkaBgywWF6/k1iLp1jQJpFOOhWWab6m98eFI1fewdJvnPiTotQb+USH5X
 KmE5Ee89U+bMlS+3f+3uz2HDdykb6QC+V9ywUEpLUAQCJ4D/PZNMBvx4wKkcu3DIRD4E
 GuPENQlpdA/LxQ0PGdd3oHyRPxgLuxOfCIjPCojOTU97ea52IfEHqjsU7IV2Pq5P21Mp
 kcOBn4nqP+9sYmh6hWi4gmGxCq/RtWQQYyA7VKJxiqcYbGL95HQOA70XvMpssiNEXYJq
 cY9exDcOto2YIHKamm2WvImpA6cN9GTdyPVFl0uGceVpGFce4fl8ywu4J74AZT9yNY84
 H1ew==
X-Gm-Message-State: APjAAAV++ISare0LvqALGYWLUjU5mIZnqVHYu90m5zna6ZZHB9kSd/Xh
 pSqlKsxSXSMJxM9ua5dbRj1pgtSU36ma1nm9g2c=
X-Google-Smtp-Source: APXvYqyjpqxjoBfQdEroCM3USq4z3WK8KF4ynWsTexmjyyVEiyc1iC6TSH5m59LwXn2dzLN+wuwlk6qaA8SwDNUYR5U=
X-Received: by 2002:a9d:2cc:: with SMTP id 70mr2099177otl.145.1566977554932;
 Wed, 28 Aug 2019 00:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-3-jacopo+renesas@jmondi.org>
 <20190827202945.GA3488@bogus>
In-Reply-To: <20190827202945.GA3488@bogus>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Aug 2019 09:32:23 +0200
Message-ID: <CAMuHMdUP1kZF4z=NkAb5LCV74dyCMw9pZACMYjOTFE=r2vvR3A@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] dt-bindings: display, renesas,
 du: Document cmms property
To: Rob Herring <robh@kernel.org>
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
Cc: muroya@ksk.co.jp, Ulrich Hecht <uli@fpond.eu>,
 Simon Horman <horms@verge.net.au>, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMTA6MjkgUE0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gT24gU3VuLCBBdWcgMjUsIDIwMTkgYXQgMDM6NTE6NDJQTSArMDIwMCwg
SmFjb3BvIE1vbmRpIHdyb3RlOgo+ID4gRG9jdW1lbnQgdGhlIG5ld2x5IGFkZGVkICdjbW1zJyBw
cm9wZXJ0eSB3aGljaCBhY2NlcHRzIGEgbGlzdCBvZiBwaGFuZGxlCj4gPiBhbmQgY2hhbm5lbCBp
bmRleCBwYWlycyB0aGF0IHBvaW50IHRvIHRoZSBDTU0gdW5pdHMgYXZhaWxhYmxlIGZvciBlYWNo
Cj4gPiBEaXNwbGF5IFVuaXQgb3V0cHV0IHZpZGVvIGNoYW5uZWwuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgo+ID4gUmV2aWV3
ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3JlbmVzYXMsZHUudHh0IHwgNSArKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcmVuZXNhcyxkdS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dAo+ID4gaW5kZXggYzk3ZGZhY2FkMjgxLi5jMjI2
NWUyYTFhZjIgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxkdS50eHQKPiA+IEBAIC00NSw2ICs0NSwxMCBA
QCBSZXF1aXJlZCBQcm9wZXJ0aWVzOgo+ID4gICAgICBpbnN0YW5jZSB0aGF0IHNlcnZlcyB0aGUg
RFUgY2hhbm5lbCwgYW5kIHRoZSBjaGFubmVsIGluZGV4IGlkZW50aWZpZXMgdGhlCj4gPiAgICAg
IExJRiBpbnN0YW5jZSBpbiB0aGF0IFZTUC4KPiA+Cj4gPiArICAtIGNtbXM6IEEgbGlzdCBvZiBw
aGFuZGxlcyB0byB0aGUgQ01NIGluc3RhbmNlcyBwcmVzZW50IGluIHRoZSBTb0MsIG9uZQo+ID4g
KyAgICBmb3IgZWFjaCBhdmFpbGFibGUgRFUgY2hhbm5lbC4gVGhlIHByb3BlcnR5IHNoYWxsIG5v
dCBiZSBzcGVjaWZpZWQgZm9yCj4gPiArICAgIFNvQ3MgdGhhdCBkbyBub3QgcHJvdmlkZSBhbnkg
Q01NIChzdWNoIGFzIFYzTSBhbmQgVjNIKS4KPgo+IHJlbmVzYXMsY21tcwoKU28gSSBndWVzcyB3
ZSByZWFsbHkgd2FudGVkIHRvIGhhdmUgdGhlIHByZWZpeCBmb3IgdGhlIHZzcHMgcHJvcGVydHks
IHRvbz8KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQK
Ci0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBp
YTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdp
dGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBU
b3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
