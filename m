Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7886B1E6F76
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 00:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC0B6E834;
	Thu, 28 May 2020 22:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC586E141
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 09:46:21 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id x1so31346203ejd.8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 02:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-org-tw.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6ssSQduh/qaifF816w5IytgkGWKHHYZpKW+7WTxibYE=;
 b=tg8BdJ/NeDWXpWiGgV95EV33XRJhxGSTVQk+D5ZZbI0D3SasA57Aum+k1470q/bIKR
 L7Olx8sR3Jz0N+TWBcCWh+GZ5I9aqsFatR1Oz37WXWGdf3zrmG7vXz+DwQ9+bq4h8+l6
 jdOxDaBppUNFgGy/zM3eKh8tgLUfg0iv2Zw5wFgUWbd4LylXwXWt6Qg2WI+UP7p29us2
 +PHkgq4g21ToSiMOGXNJkDeMq0elGyYA/hPd0UAJ9yV3CXhNYTyeOHO+pwLvr58VTMxR
 OTRqASo+qm8EbHAu0MgdMUX909w8SFAhrbuvN2APJTp1UMKb7euvXfqrcIeseH/TGrLv
 uBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6ssSQduh/qaifF816w5IytgkGWKHHYZpKW+7WTxibYE=;
 b=bjQ7Aln8YfUJnDYSBpMtPFG+Z434MUjxpSahXswd/aljm0LwuOtHswWyB+642nJ2eg
 2AyqhqVCPNMQABvpbdpfPdGzynut1NI/LxyRYuiRBc/E1NpydqzT1ewV03/GVp6iVut+
 7eKzW7W6EF5+nb9SVhU1lJz6PL4BIWHirNDTQVigP7JA+o08SNwySlUOZUUpJODHIS4k
 /U2RI1ERMe0Z7e1QbRrB5ECNFcTCAc4gMrJnv4fsgflH3woU62/Eb8Ca6i7ysysAxpxF
 dcWMt5cmuS/exXiKyjY6SJDSk4BUkAwQr10Kn0amMBOBr5YSrXU2dHN/LS58LiyqBNpy
 oAPA==
X-Gm-Message-State: AOAM530gfjoPkFwohYttrWhf7aXkGBhWTWw5hp7pqfzc/c0RCI8ZAWDT
 CX255DPWbduF8Bq8MZwIch9Q6JGIfTuFLS7hxOKS4A==
X-Google-Smtp-Source: ABdhPJyQx7/DpqFliRN8Mfi2IEINj5rkr7DgpFOU3swyLrTWDY6THPR2JOAJV4Fr2bk3kJF1cDI0M3UshVrEjHA/8N4=
X-Received: by 2002:a17:906:b817:: with SMTP id
 dv23mr2136914ejb.185.1590659180297; 
 Thu, 28 May 2020 02:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200523154426.1088988-1-issor.oruam@gmail.com>
 <CAKMK7uGKps4AfLKTSP2HZTHd1cm+1dMD9r8M9rKobqwXGgv5EQ@mail.gmail.com>
 <2xZF5q7722pK-_L_0jQjYv33oMS6WS4Jm06tbVwUo9SQO9QBv48_HaVhzVHTb2OLnz3JUj3O1uRYn_y-JWGrWpD3c8J0y8Mr_qgwbNzsxDE=@emersion.fr>
In-Reply-To: <2xZF5q7722pK-_L_0jQjYv33oMS6WS4Jm06tbVwUo9SQO9QBv48_HaVhzVHTb2OLnz3JUj3O1uRYn_y-JWGrWpD3c8J0y8Mr_qgwbNzsxDE=@emersion.fr>
From: Chih-Wei Huang <cwhuang@linux.org.tw>
Date: Thu, 28 May 2020 17:46:08 +0800
Message-ID: <CAHUn7wPfaEuWAc7iDGtfCdT71dwYkt7fNgMdPtfZL=COmKBaiQ@mail.gmail.com>
Subject: Re: [PATCH] xf86drm: add drmOpenByFB
To: Simon Ser <contact@emersion.fr>
X-Mailman-Approved-At: Thu, 28 May 2020 22:46:32 +0000
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
Cc: Robert Foss <robert.foss@collabora.com>,
 Mauro Rossi <issor.oruam@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPiDmlrwgMjAyMOW5tDXmnIgyNeaXpSDpgLHk
uIAg5LiK5Y2IMzoyNeWvq+mBk++8mgo+IE9uIFN1bmRheSwgTWF5IDI0LCAyMDIwIDg6NTMgUE0s
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gPiBPbiBTYXQsIE1heSAy
MywgMjAyMCBhdCA1OjQ0IFBNIE1hdXJvIFJvc3NpIGlzc29yLm9ydWFtQGdtYWlsLmNvbSB3cm90
ZToKPiA+Cj4gPiA+IE9wZW5CeUZCIGlzIGludHJvZHVjZWQgdG8gb3ZlcmNvbWUgR1BVIGRyaXZl
ciBsb2FkaW5nIG9yZGVyIGlzc3VlCj4gPiA+IG9uIGEgZGV2aWNlIHdpdGggbXVsdGlwbGUgR1BV
cywgZS5nLiBJbnRlbCBpR1BVIGFuZCBOdmlkaWEgZEdQVQo+ID4gPiB3aGVyZSB0aGUgZmlyc3Qg
ZHJtZmIga2VybmVsIG1vZHVsZSBsb2FkZWQgd2lsbCBiZWNvbWUgZGV2aWNlIGZpbGUKPiA+ID4g
L2Rldi9kcmkvY2FyZDAgYW5kIHRoZSBzZWNvbmQgd2lsbCBiZWNvbWUgL2Rldi9kcmkvY2FyZDEK
PiA+ID4gVGhlIHVzZSBjYXNlIGlzIHRvIHByZWZlciBJbnRlbCBpR1BVIG92ZXIgZEdQVSwgb3Ig
dmljZXZlcnNhLAo+ID4gPiBpbiBhIGRldGVybWluaXN0aWMgYW5kIHJlbGlhYmxlIG1hbm5lci4K
PiA+ID4gT3BlbkJ5RkIgZnVuY3Rpb24gb3BlbnMgdGhlIERSTSBkZXZpY2Ugd2l0aCBzcGVjaWZp
ZWQgZmIgYW5kIG5vZGUgdHlwZSwKPiA+ID4gdGh1cyBlbmFibGluZyBncmFsbG9jIHRvIG9wZW4g
dGhlIGNvcnJlY3QgZGV2aWNlIG5vZGUgb2YgdGhlIHByaW1hcnkgZmIsCj4gPiA+IHJlZ2FyZGxl
c3Mgb2YgdGhlIEdQVSBkcml2ZXIgbG9hZGluZyBvcmRlci4KPiA+Cj4gPiBUaGUgZmJkZXYgbG9h
ZCBvcmRlcmluZyBpcyBhcyBpbmNvbnNpc3RlbnQvcmFuZG9tIGFzIHRoZSBkcmkgbm9kZQo+ID4g
bG9hZGluZy4gV2VsbCBtb3JlIHNvLCBiZWNhdXNlIHlvdSBtaWdodCBoYXZlIHJhbmRvbSBmaXJt
d2FyZSBmYmRldgo+ID4gZHJpdmVycyBoYW5naW5nIG91dCB0aGVyZS4gSGVuY2UgSSdtIG5vdCBm
b2xsb3dpbmcgaG93IHRoaXMgc29sdmVzCj4gPiBhbnl0aGluZyBmb3IgeW91ciBwcm9ibGVtLgo+
ID4KPiA+IEkgdGhpbmsgdXN1YWxseSB3aGF0IHVzZXJzcGFjZSBkb2VzIGl0IGxvb2sgYXQgdGhl
IGJvb3RfdmdhIHByb3BlcnR5Cj4gPiBvZiB0aGUgdW5kZXJseWluZyBkZXZpY2UgaW4gc3lzZnMs
IGFuZCBwcmVmZXIgdGhhdCBvbmUuCgpUaGFuayB5b3UgZm9yIHRoZSByZXBseS4KSSdtIG5vdCB0
aGUgZXhwZXJ0IHNvCkkgY2FuJ3QgZnVsbHkgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuLgpXaGF0
IGRvZXMgJ2Jvb3RfdmdhJyBtZWFuIGFuZCBob3cgY291bGQgaXQgaGVscCBvdXIgcHJvYmxlbT8K
ClRoZSBtYWluIHByb2JsZW0gd2UncmUgdHJ5aW5nIHRvIHNvbHZlIGlzIHRvCmZpbmQgdGhlIERS
TSBkZXZpY2Ugb2YgdGhlIHByaW1hcnkgZnJhbWVidWZmZXIgKGZiMCkuCkkgYmVsaWV2ZSAvc3lz
L2NsYXNzL2dyYXBoaWNzL2ZiMC9kZXZpY2UvZHJtCmlzIHRoZSBjb3JyZWN0IG9uZSB3ZSBjb3Vs
ZCB1c2UuCkF0IGxlYXN0IGl0IHdvcmtzIG9uIGFsbCBkZXZpY2VzIEkndmUgdGVzdGVkCmluY2x1
ZGluZyBudmlkaWEgb3B0aW11cyBub3RlYm9va3MuCklmIHRoZXJlIGlzIGEgc2ltcGxlciB3YXkg
dG8gZ2V0IHRoZSBEUk0gZGV2aWNlIG9mIGZiMApJJ20gaGFwcHkgdG8gbGVhcm4uCgo+IFllcy4g
U2VlIFsxXSBmb3IgYW4gZXhhbXBsZSBvZiBob3cgdG8gZG8gdGhpcy4KPgo+IFsxXTogaHR0cHM6
Ly9naXRodWIuY29tL3N3YXl3bS93bHJvb3RzL2Jsb2IvNWM5NDJiZDU5NzJhZmVlOWE2OGNiMTVj
MTRhYTgzYjRiMGFhZjgyZC9iYWNrZW5kL3Nlc3Npb24vc2Vzc2lvbi5jI0wzMzEKClRoYW5rIHlv
dSBmb3IgdGhlIGV4YW1wbGUuCkhvd2V2ZXIsIG91ciB0YXJnZXQgcGxhdGZvcm0gaXMgQW5kcm9p
ZCBhbmQKQW5kcm9pZCBkb2Vzbid0IGhhdmUgdWRldi4gU28gSSdtIGFmcmFpZCB3ZSBjYW4ndCB1
c2UgaXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
