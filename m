Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B555DAD0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 03:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D258C6E0BC;
	Wed,  3 Jul 2019 01:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2512D6E0BC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 01:28:44 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p13so737082wru.10
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 18:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yy/jJe6Qlwwp1Uwe0Cit54zA7Vf11kpokyvinUCks7c=;
 b=Rh/ryMt5LYQuokFtSmtmdJBC6YLHWupa0nD2jSDccwWa2zSYdM3xPszgGSl36VUdcL
 3tvrARwD7EZS1+7USJtUYLmFk0wtUX4HcC4qbaYvGhc0csS1oUZhuFqGCdKy+I5N+fTc
 zAvz9zjSsiFfosq+GyoXGyFFInTQyzs2DSK7XsnoMkYp7z7pLGII0bnOiaZaku+AvWec
 1bYB9VECPjZ+CpSesCOhu9vTtb7Ov1r3US5IUR2uASm08M0RCilbneGJIh6k6TwlS5zI
 Ix/ooR2BverFcowcE9AukQoy0cHBNJLlnIQ9HHPePqmr1BRcRFf2RkKHoWaqiXt4NKz5
 XO5Q==
X-Gm-Message-State: APjAAAWwGOtX+Cxb83UHniiDLpxjb4fGB+czW8+xCDCkLm8g3KtKWte4
 5d8kRuagY/3aAG+OSqQUku54Z+UvVT1NGaCIPco=
X-Google-Smtp-Source: APXvYqzIEb02aajpAGNava/id0J1XqTeNG0vVxYK5uLbQYjjwdzYTBzNUK+/I5XN+jnCDfKY6KrEoXRwtDvbB0DH4xE=
X-Received: by 2002:adf:dec3:: with SMTP id i3mr14133575wrn.74.1562117322653; 
 Tue, 02 Jul 2019 18:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190701213304.34eeaef8@canb.auug.org.au>
 <20190701231036.GC23718@mellanox.com>
In-Reply-To: <20190701231036.GC23718@mellanox.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 Jul 2019 21:28:30 -0400
Message-ID: <CADnq5_OGiOZaz8V1aLLNL9F88pkthKh4ytYMaaFZ8j3XbgOnkg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the hmm tree
To: Jason Gunthorpe <jgg@mellanox.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Yang, Philip" <Philip.Yang@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yy/jJe6Qlwwp1Uwe0Cit54zA7Vf11kpokyvinUCks7c=;
 b=aTQ/vUCfodZFR5bl0E3g9XXd7THPV9nPu2mYp1+I8zMhs9sW7E6Ryo+nF5yEJRUyNX
 fI8WUsDhjEVt5q7xnTAgk5AA+5WeigU53ZxjE4QoGIwbCvPIcq4EZoVsRxM6FKfrPuov
 Qv+OEuln/KI5BLM4Pcsc6t/+OoqYbY+FJfgqqCNBwH5J9qIXgp7HRmXM/Hp/6QQGgZD3
 RYP/lR0JWxJM/E4pW5wsV+9KSD10OM3lmMEU8ATdAqNCmgb6fDdjtBE+6ORfdyU9DXjd
 JVUjqtL75spzdpAY6myj7OjBc40Gef9T6W9tBjtXlgTblrPH+kg8uUbhXkFlI1Wc3GOk
 D0Yg==
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMiwgMjAxOSBhdCAzOjI0IEFNIEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxh
bm94LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1bCAwMSwgMjAxOSBhdCAwOTozMzowNFBNICsx
MDAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOgo+ID4gSGkgYWxsLAo+ID4KPiA+IEFmdGVyIG1l
cmdpbmcgdGhlIGhtbSB0cmVlLCB0b2RheSdzIGxpbnV4LW5leHQgYnVpbGQgKHg4Nl82NCBhbGxt
b2Rjb25maWcpCj4gPiBmYWlsZWQgbGlrZSB0aGlzOgo+ID4KPiA+IG1tL2htbS5jOiBJbiBmdW5j
dGlvbiAnaG1tX2dldF9vcl9jcmVhdGUnOgo+ID4gbW0vaG1tLmM6NTA6MjogZXJyb3I6IGltcGxp
Y2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdsb2NrZGVwX2Fzc2VydF9oZWxkX2V4Y2x1c2l2
ZSc7IGRpZCB5b3UgbWVhbiAnbG9ja2RlcF9hc3NlcnRfaGVsZF9vbmNlJz8gWy1XZXJyb3I9aW1w
bGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gPiAgIGxvY2tkZXBfYXNzZXJ0X2hlbGRfZXhj
bHVzaXZlKCZtbS0+bW1hcF9zZW0pOwo+ID4gICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fgo+ID4gICBsb2NrZGVwX2Fzc2VydF9oZWxkX29uY2UKPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90dG0uYzogSW4gZnVuY3Rpb24gJ2FtZGdwdV90dG1fdHRfZ2V0X3VzZXJf
cGFnZXMnOgo+ID4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jOjc3ODoy
ODogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMiBvZiAnaG1tX3JhbmdlX3JlZ2lzdGVyJyBmcm9t
IGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XZXJyb3I9aW5jb21wYXRpYmxlLXBvaW50ZXIt
dHlwZXNdCj4gPiAgIGhtbV9yYW5nZV9yZWdpc3RlcihyYW5nZSwgbW0sIHN0YXJ0LAo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+Cj4gPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jOjM1Ogo+ID4gaW5jbHVkZS9saW51
eC9obW0uaDo0NjQ6Mjk6IG5vdGU6IGV4cGVjdGVkICdzdHJ1Y3QgaG1tX21pcnJvciAqJyBidXQg
YXJndW1lbnQgaXMgb2YgdHlwZSAnc3RydWN0IG1tX3N0cnVjdCAqJwo+ID4gICAgICAgICAgIHN0
cnVjdCBobW1fbWlycm9yICptaXJyb3IsCj4gPiAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+
fl5+fn5+fgo+ID4KPiA+IENhdXNlZCBieSBjb21taXQKPiA+Cj4gPiAgIGUzNmFjZmU2Yzg2ZCAo
Im1tL2htbTogVXNlIGhtbV9taXJyb3Igbm90IG1tIGFzIGFuIGFyZ3VtZW50IGZvciBobW1fcmFu
Z2VfcmVnaXN0ZXIiKQo+ID4KPiA+IGludGVyYWN0aW5nIHdpdGggY29tbWl0Cj4gPgo+ID4gICA2
NmM0NTUwMGJmZGMgKCJkcm0vYW1kZ3B1OiB1c2UgbmV3IEhNTSBBUElzIGFuZCBoZWxwZXJzIikK
PiA+Cj4gPiBmcm9tIHRoZSBkcm0gdHJlZS4KPiA+Cj4gPiBBbGwgSSBjb3VsZCBkbyBmb3Igbm93
IHdhcyB0byBtYXJrIHRoZSBBTURHUFUgZHJpdmVyIGJyb2tlbi4gIFBsZWFzZQo+ID4gc3VibWl0
IGEgbWVyZ2UgZm9yIGZvciBtZSAoYW5kIGxhdGVyIExpbnVzKSB0byB1c2UuCj4KPiBUaGlzIGlz
IGV4cGVjdGVkLCB0aGUgQU1EIGd1eXMgaGF2ZSB0aGUgcmVzb2x1dGlvbiBmb3IgdGhpcyBmcm9t
IHdoZW4KPiB0aGV5IHRlc3RlZCBobW0uZ2l0Li4KPgo+IEkgdGhpbmsgd2UgYXJlIGdvaW5nIHRv
IGhhdmUgdG8gbWVyZ2UgaG1tLmdpdCBpbnRvIHRoZSBhbWRncHUgdHJlZSBhbmQKPiBwdXNoIHRo
ZSByZXNvbHV0aW9uIGZvcndhcmQsIGFzIGl0IGxvb2tzIGtpbmQgb2YgY29tcGxpY2F0ZWQgdG8g
c2hpZnQKPiBvbnRvIExpbnVzIG9yIERSTS4KPgo+IFByb2JhYmx5IGFtZGdwdSBuZWVkcyB0byBn
YWluIGEgZmV3IHBhdGNoZXMgbWFraW5nIHRoZSBobW1fbWlycm9yCj4gdmlzaWJsZSB0byBhbWRn
cHVfdHRtLmMgYW5kIHRoZW4gdGhlIG1lcmdlIHJlc29sdXRpb24gd2lsbCBiZSBzaW1wbGU/Cj4K
PiBBTUQvRFJNIHdlIGhhdmUgYSBmZXcgZGF5cyBsZWZ0IHRvIGRlY2lkZSBvbiBob3cgYmVzdCB0
byBoYW5kbGUgdGhlCj4gY29uZmxpY3QsIHRoYW5rcy4KClBoaWxpcCBhbmQgRmVsaXggaGF2ZSBi
ZWVuIHdvcmtpbmcgb24gYSBicmFuY2ggd2l0aCBobW0gbWVyZ2VkIGludG8KZHJtLW5leHQgd2l0
aCBhbGwgdGhlIGNvbmZsaWN0cyBmaXhlcyB1cC4gIEknbGwgcG9zdCBpdCBvdXQgdG9tb3Jyb3cK
b25jZSBJIGdldCBGZWxpeCdzIGxhdGVzdCByZXZpc2lvbnMuCgpBbGV4Cgo+Cj4gUmVnYXJkcywK
PiBKYXNvbgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
