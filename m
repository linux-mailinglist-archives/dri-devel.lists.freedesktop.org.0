Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84E42D3A4
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 04:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AAE6E030;
	Wed, 29 May 2019 02:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB9E6E030;
 Wed, 29 May 2019 02:15:05 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id g13so1099037edu.5;
 Tue, 28 May 2019 19:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MVuq7lYaXanQ2+muRBv1fL9MjUsN0jmBARMWs3+IXa4=;
 b=gChpztO5ga9a1YJHkN7pvYmjDkDByLycxutm8027KW+eDta61UfbsC9An9pfMAX78d
 dV/qgEEEj8Vdox3Pw51ZpWDnGN1429ZbQiv71ms4UukLT65kOyJ2ux0/ZzPeqyP9UKLZ
 WUXZrJqPRsUJgNc6C+KrEqh3qPgRpVjMnKqn0czPonxTunflP4olNmaF/Jugu0ICqvsH
 nHzqtSGJ+n6bJ82zSIoiVp23JSaESbpApcZjcrji7d5CYUElRFiY3i8EyvP8ItKV0K/P
 LO4YOIk0S7xWGvb76+XMEtv9PU8pDWyFkJNL4bkyF8s+pIGmqagrBhFA4OaC+B1fp2dC
 l19w==
X-Gm-Message-State: APjAAAVfkEYMyx89tviWYmfoNIkAbhSN/szFXdw3VjkQQShZUVmChMv5
 WLeVa/qGXOuKfMOSQGTDzQpAivymj9sGH0ltDXe8nEQkOic=
X-Google-Smtp-Source: APXvYqyOg5fgYNs1hVcgXxnSIALAf/v2b0IbtA6UkMpm8Me8LtYEdvXve0H0HiVXQItgpL6SOU+F0L3Z0HgnhF+z4oc=
X-Received: by 2002:a05:6402:1484:: with SMTP id
 e4mr2931835edv.57.1559096103705; 
 Tue, 28 May 2019 19:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190509020352.14282-1-masneyb@onstation.org>
 <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp>
In-Reply-To: <20190529011705.GA12977@basecamp>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 May 2019 19:14:50 -0700
Message-ID: <CAF6AEGu4JNePimAmBG6GFT8DAaQ56OXYqu5BSN_JQB4KaBt29Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5 display support
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MVuq7lYaXanQ2+muRBv1fL9MjUsN0jmBARMWs3+IXa4=;
 b=TI6pGipGG6Tmo7+0fwdqTp7wV3+aiOpsbht6be1dsWP2ku4I1dSCYO4gVu6KPzUuZS
 NnX8I9sQKcYRBPlwfle7uM66O8mHfggCXWP7BGbCb3beoGCVCid6ik75HNmMbeMgjHvx
 eDZwhDHipnxUE0I4rPjzPGXq1mqPyXndXUFxPWkR2kT3LLfC7nZ+KKyae6VYlFh6cKhT
 j9rZFyCnO3myUsy15l36yvHsrhFRGq9XCTJfVpBKyVSLJJ4x955ScGyl4wGeAJdPEkCD
 Tky+G1WtRi6GRjqJGi33sUaYvVSc0yMtncd6Rtxl2+KeBIHLIY3iWAJsvyyyqSwWxUrY
 lutw==
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 Dave Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgNjoxNyBQTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwMzo0NjoxNFBN
ICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+ID4gT24gVGh1LCBNYXkgOSwgMjAxOSBhdCA0
OjA0IEFNIEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPiB3cm90ZToKPiA+Cj4g
PiA+IEhlcmUgaXMgYSBwYXRjaCBzZXJpZXMgdGhhdCBhZGRzIGluaXRpYWwgZGlzcGxheSBzdXBw
b3J0IGZvciB0aGUgTEcKPiA+ID4gTmV4dXMgNSAoaGFtbWVyaGVhZCkgcGhvbmUuIEl0J3Mgbm90
IGZ1bGx5IHdvcmtpbmcgc28gdGhhdCdzIHdoeSBzb21lCj4gPiA+IG9mIHRoZXNlIHBhdGNoZXMg
YXJlIFJGQyB1bnRpbCB3ZSBjYW4gZ2V0IGl0IGZ1bGx5IHdvcmtpbmcuCj4gPiA+Cj4gPiA+IFRo
ZSBwaG9uZXMgYm9vdHMgaW50byB0ZXJtaW5hbCBtb2RlLCBob3dldmVyIHRoZXJlIGlzIGEgc2V2
ZXJhbCBzZWNvbmQKPiA+ID4gKG9yIG1vcmUpIGRlbGF5IHdoZW4gd3JpdGluZyB0byB0dHkxIGNv
bXBhcmVkIHRvIHdoZW4gdGhlIGNoYW5nZXMgYXJlCj4gPiA+IGFjdHVhbGx5IHNob3duIG9uIHRo
ZSBzY3JlZW4uIFRoZSBmb2xsb3dpbmcgZXJyb3JzIGFyZSBpbiBkbWVzZzoKPiA+Cj4gPiBJIHRl
c3RlZCB0byBhcHBseSBwYXRjaGVzIDItNiBhbmQgZ290IHRoZSBjb25zb2xlIHVwIG9uIHRoZSBw
aG9uZSBhcyB3ZWxsLgo+ID4gSSBzZWUgdGhlIHNhbWUgdGltb3V0cywgYW5kIEkgYWxzbyBub3Rp
Y2UgdGhlIHVwZGF0ZSBpcyBzbG93IGluIHRoZQo+ID4gZGlzcGxheSwgYXMgaWYgdGhlIERTSSBw
YW5lbCB3YXMgcnVubmluZyBpbiBsb3cgcG93ZXIgKExQKSBtb2RlLgo+ID4KPiA+IFdhcyBib290
aW5nIHRoaXMgdG8gZG8gc29tZSBvdGhlciB3b3JrLCBidXQgaGFwcHkgdG8gc2VlIHRoZSBwcm9n
cmVzcyEKPgo+IFRoYW5rcyEKPgo+IEkndmUgaGFkIHRocmVlIHBlb3BsZSBlbWFpbCBtZSBvZmYg
bGlzdCByZWdhcmRpbmcgdGhlIGRpc3BsYXkgd29ya2luZyBvbgo+IDQuMTcgYmVmb3JlIHRoZSBt
c20ga21zL2RybSBkcml2ZXIgd2FzIGNvbnZlcnRlZCB0byB0aGUgRFJNIGF0b21pYyBBUEkgc28K
PiB0aGlzIGVtYWlsIGlzIHRvIGdldCBzb21lIG1vcmUgaW5mb3JtYXRpb24gb3V0IHB1YmxpY2x5
Lgo+Cj4gSSBwdXNoZWQgdXAgYSBicmFuY2ggdG8gbXkgZ2l0aHViIHdpdGggMTUgcGF0Y2hlcyBh
cHBsaWVkIGFnYWluc3QgNC4xNwo+IHRoYXQgaGFzIGEgd29ya2luZyBkaXNwbGF5Ogo+Cj4gaHR0
cHM6Ly9naXRodWIuY29tL21hc25leWIvbGludXgvY29tbWl0cy9kaXNwbGF5LXdvcmtzLTQuMTcK
Pgo+IEl0J3MgaW4gbG93IHNwZWVkIG1vZGUgYnV0IGl0cyB1c2FibGUuIFRoZSBmaXJzdCAxMCBw
YXRjaGVzIGFyZSBpbgo+IG1haW5saW5lIG5vdyBhbmQgdGhlIGxhc3QgNSBhcmUgaW4gZXNzZW5j
ZSB0aGlzIHBhdGNoIHNlcmllcyB3aXRoIHRoZQo+IGV4Y2VwdGlvbiBvZiAnZHJtL2F0b21pYytt
c206IGFkZCBoZWxwZXIgdG8gaW1wbGVtZW50IGxlZ2FjeSBkaXJ0eWZiJy4KPiBUaGVyZSdzIGEg
c2xpZ2h0bHkgZGlmZmVyZW50IHZlcnNpb24gb2YgdGhhdCBwYXRjaCBpbiBtYWlubGluZSBub3cu
Cj4KPiBJJ20gcGxhbm5pbmcgdG8gd29yayBvbiB0aGUgbXNtODk3NCBpbnRlcmNvbm5lY3Qgc3Vw
cG9ydCBvbmNlIHNvbWUgb2YKPiB0aGUgb3V0c3RhbmRpbmcgaW50ZXJjb25uZWN0IHBhdGNoZXMg
Zm9yIHRoZSBtc20ga21zL2RybSBkcml2ZXIgYXJyaXZlCj4gaW4gbWFpbmxpbmUuIEknZCByZWFs
bHkgbGlrZSB0byB1bmRlcnN0YW5kIHdoeSB0aGUgZGlzcGxheSB3b3JrcyBvbgo+IDQuMTcgd2l0
aCB0aG9zZSBwYXRjaGVzIHRob3VnaC4gSSBhc3N1bWUgdGhhdCBpdCdzIHJlbGF0ZWQgdG8gdGhl
Cj4gdmJsYW5rIGV2ZW50cyBub3Qgd29ya2luZyBwcm9wZXJseT8gTGV0IG1lIHByZWZhY2UgdGhp
cyB3aXRoIEknbSBhCj4gdG90YWwgRFJNIG5ld2JpZSwgYnV0IGl0IGxvb2tlZCBsaWtlIHRoZSBw
cmUtRFJNLWF0b21pYyBkcml2ZXIgd2Fzbid0Cj4gbG9va2luZyBmb3IgdGhlc2UgZXZlbnRzIGlu
IHRoZSBhdG9taWMgY29tbWl0cyBiZWZvcmUgdGhlIG1pZ3JhdGlvbj8KPiBTZWUgY29tbWl0IDcw
ZGIxOGRjYTRlMCAoImRybS9tc206IFJlbW92ZSBtc21fY29tbWl0L3dvcmtlciwgdXNlIGF0b21p
Ywo+IGhlbHBlciBjb21taXQiKSwgc3BlY2lmaWNhbGx5IHRoZSBkcm1fYXRvbWljX2hlbHBlcl93
YWl0X2Zvcl92YmxhbmtzKCkKPiBjYWxsIHRoYXQgd2FzIGFkZGVkLgoKaW50ZXJjb25uZWN0IHBy
b2JhYmx5IGdvb2QgdG8gZ2V0IGdvaW5nIGFueXdheXMgKGFuZCBJIG5lZWQgdG8gZmluZApzb21l
IHRpbWUgdG8gcmVzcGluIHRob3NlIG1kcDUvZHB1IHBhdGNoZXMpIGJ1dCBJIGd1ZXNzIG5vdCBy
ZWxhdGVkIHRvCndoYXQgeW91IHNlZSAoaWUuIEknZCBleHBlY3QgaW50ZXJjb25uZWN0IGlzc3Vl
IHdvdWxkIHRyaWdnZXIKdW5kZXJmbG93IGlycSdzKS4uCgpJJ20gbm90IGVudGlyZWx5IHN1cmUg
d2h5IGF0b21pYyB3b3VsZCBicmVhayB0aGluZ3MgYnV0IGNtZCBtb2RlCnBhbmVscyBhcmVuJ3Qg
ZXNwZWNpYWxseSB3ZWxsIHRlc3RlZC4gIEkgY2FuJ3QgZmluZCBpdCBub3cgYnV0IHRoZXJlCndh
cyBhIHRocmVhZCAob3IgSVJDIGRpc2N1c3Npb24/KSB0aGF0IGludGYydmJsYW5rKCkgc2hvdWxk
IGJlCnJldHVybmluZyBNRFA1X0lSUV9QSU5HX1BPTkdfPG4+X0RPTkUgaW5zdGVhZCBvZgpNRFA1
X0lSUV9QSU5HX1BPTkdfPG4+X1JEX1BUUiwgd2hpY2ggc2VlbXMgbGlrZWx5IGFuZCBwb3NzaWJs
eSByZWxhdGVkCnRvIHZibGFuayB0aW1pbmcgaXNzdWVzLi4KCkJSLAotUgoKCgo+Cj4gQnJpYW4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
