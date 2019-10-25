Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90BDE6E09
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090656E443;
	Mon, 28 Oct 2019 08:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAA889DB8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 08:20:23 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id c2so968521oic.13
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 01:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3QSehhTBv+oV2bOVzdw6czmc0B+M6tw77a55Dji3J1U=;
 b=haeW2UZ+y+2oFIC07arAdOahzkYxYR0dnFyr1SpF6n6mEpJgxn9vUhDLPzrO2meQJM
 yP4oTUzHzfMMYhUlDmKl+lv6cpOkF+KmxlClDx5YVzK91rU42aHaXuZW0KcZferBxrdC
 oLDmp9us4iJVq/YzlNGX8ITohz7SZ+E2NmYdT609wcwtjNUT48yMrE9zR4VOKyfsMah3
 ztVnP1HXb4Tg9m6OSoUkCuQf41+FMXgwjoFVjDWwBy7fqIz7u7c5frGGItl/vFPyaY49
 6DBb+hEK1LZKJN7u0Dk5jitb2zqHAxJuy6sp9LNUZWKZaEwNQLT5UezdU4TusNW3Vo9w
 BYSw==
X-Gm-Message-State: APjAAAWsrNP/FG5Dyl/Kb2hVaLOTYaALqD7pNrcZ0lNjG2WqAKH6pwZB
 xspwhELfZqnfxxcmC9vIvUTfsoH4+HnU03QxkRkQ0w==
X-Google-Smtp-Source: APXvYqzXhlrklZOiLaOAMMT35ZVC4VF9VvqBqS/K1m/jWf5/igEHNlHkN8toTKLYVnrW8KVqyCX5HupAFPKzw8aWvSo=
X-Received: by 2002:aca:5015:: with SMTP id e21mr1974486oib.174.1571991622869; 
 Fri, 25 Oct 2019 01:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <1571984808-4552-1-git-send-email-bhanusreemahesh@gmail.com>
 <20191025073436.GM11828@phenom.ffwll.local>
In-Reply-To: <20191025073436.GM11828@phenom.ffwll.local>
From: Bhanusree Mahesh <bhanusreemahesh@gmail.com>
Date: Fri, 25 Oct 2019 13:50:11 +0530
Message-ID: <CAB0Mk-OnP1L5RGT6YCLG+SR74NpdJCtTAerWr3Db+viAAOHYxQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/gpu: Fix checkpatch.pl warnings
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=3QSehhTBv+oV2bOVzdw6czmc0B+M6tw77a55Dji3J1U=;
 b=h82JkW3M4bJTyveA1fnYWMYlndBIlfd5LFi+F3XUK5rZAKHzH1goyo6p7MSZYSFE+q
 BDrFQBW3VQv6To4nlysiurJsGC9ij64dfFM0D5VQQQoHkQEBxcRHlzu24E20BphAlUUt
 vQ128Cw9w0iHlapfugH0txLlcqSpsQcIXZRZXnq3cfY/+w4TxDOLIGtEQxYNAzULR3Cz
 CBAWB9bOi4CCwMUqoUAexhoka5dMR8cnnCH+bprcOtwRHKOJMi0RxZZKmCEowzonyjxO
 048bz/UWU2GvCY9G8mzs2FKBszc0xQs/1IHKN1zmU4HRbxKUpOhvCBWAJ3GMudUTw2nL
 AO8A==
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3VyZS4gSSBzaGFsbCB0YWtlIGNhcmUgb2YgaXQgZnJvbSBuZXh0IHBhdGNoZXMuIFNoYWxsIEkg
cmVzZW5kIHRoZW0Kd2l0aCBvdXRyZWFjaHkgZ3JvdXAgaW4gY2M/CgpUaGFua3MmcmVnYXJkcywK
QmhhbnVzcmVlIFBvbGEuCgpPbiBGcmksIDI1IE9jdCAyMDE5IGF0IDEzOjA0LCBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gT24gRnJpLCBPY3QgMjUsIDIwMTkgYXQg
MTE6NTY6NDhBTSArMDUzMCwgQmhhbnVzcmVlIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBzZXJpZXMg
Y2xlYXJzIHRoZSBjaGVja3BhdGNoLnBsIHdhcm5pbmdzCj4gPiBbUEFUQ0ggMS8yXTpGaXggTWlz
c2luZyBibGFuayBsaW5lIGFmdGVyIGRlY2xhcmF0aW9ucwo+ID4gW1BBVENIIDIvMl06Rml4IE1l
bW9yeSBiYXJyaWVyIHdpdGhvdXQgY29tbWVudAo+ID4KPiA+IEJoYW51c3JlZSAoMik6Cj4gPiAg
IGRybS9ncHU6IEZpeCBNaXNzaW5nIGJsYW5rIGxpbmUgYWZ0ZXIgZGVjbGFyYXRpb25zCj4gPiAg
IGRybS9ncHU6IEZpeCBNZW1vcnkgYmFycmllciB3aXRob3V0IGNvbW1lbnQgSXNzdWUKPgo+IFRo
ZSB0aHJlYWRpbmcgaW4gdGhpcyBzdWJtaXNzaW9uIGlzIGJyb2tlbiBzb21laG93IC4uLiBEaWQg
eW91IHNlbmQgdGhlc2UKPiBwYXRjaGVzIG91dCBpbmRpdmlkdWFsbHk/IEVpdGhlciBkbyB0aGVt
IGFsbCB0b2dldGhlciwgb3IgZG8gaW52aWRpZHVhbAo+IHN0YW5kLWFsb25lIHBhdGNoZXMuIEFs
c28gZm9yIGFueXRoaW5nIG91dHJlYWNoeSBwbHMgYWx3YXlzIGNjIHRoZQo+IG91dHJlYWNoeSBs
aXN0IHRvby4KPgo+IFRoYW5rcywgRGFuaWVsCj4KPiA+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9jYWNoZS5jIHwgMTAgKysrKysrLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gLS0KPiA+IDIuNy40Cj4gPgo+Cj4gLS0KPiBE
YW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
