Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230FC26AF0C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 23:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E7E6E1D8;
	Tue, 15 Sep 2020 21:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71DA6E131;
 Tue, 15 Sep 2020 21:00:32 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id d4so770434wmd.5;
 Tue, 15 Sep 2020 14:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ijGU43Rg3f3PwSBnePSd9E3+WFzzYt7BXugXcmS9oI0=;
 b=juTjkiI9rt4oxEXyQqxc+cKEpkMOSYsQ1NuVeqrw7HYGhvlTVezCEz8QH4AnMGCKrV
 WVx2w8Qy/D9pmFbl9fbp/CS8OnXbFwGmuhAMz6kIDYgxDW+S2Uzk3i/p0Yipi4zrxORV
 RmNWqNr2R2j7xx/9gyif315GoG6J+pRf/8OsUVwB4QvoDRxWmWMchBtzGYvltui3OewG
 PN0oVobuyuRB8U9DYjnUKm43SGEtf53mGbSs1S/sRz95cq0L1v8IAuBzCHXVq0IWC3YO
 ZOvP0sZbBXKnU5YeOlTxa8VZUSCrpDNZUa5PyuIgGM7PxdMFYJGHHxZZyEXm9CiQNUCx
 SRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ijGU43Rg3f3PwSBnePSd9E3+WFzzYt7BXugXcmS9oI0=;
 b=NEAK8ssg+ca+Xq5mibVepeu34koGqgs1YAKrX2RbZ81lb0QTPsPml9KPtgGYpvmbvL
 MSqPbpREmLGTsGz2Jb+lzPxvKueKabGbpYMzJc2XOZnt1ubZQggrLiHoI/eeY0f084p6
 VhRuYs/i6QVUbuFwMLex+Krw6QYRfon4Imh1e4Ss8BixtT3gDA1WB8WsdgQ/bSA/hzP8
 bl5Lxd56/rQ6eygb1THIfc5+0ixzhvD1jM2VhW4TlC2/jlLumjfmjgArqtzRE5U/JEzE
 rfHUXnBVddn+D3LrybOSQc7x45K+0x+jQdHOu5jN/0xclaNWJBP8Zgep6b1Gr4K16sR8
 p/ug==
X-Gm-Message-State: AOAM532QCJBLgytwiqdIyZ5o/I6gNHw2u63BFzxbc/DES9Nuy4PH9PVX
 GsJObD4tEBQm6rY2JQSem7DA46Lu6bqT4kZpo98cudzu
X-Google-Smtp-Source: ABdhPJws8+SFIY9bXqIrGDE1VeovXol+Doyp4kGBPDDR9CLHbTZ9ckxNv3MionnwXm3Mc/lUbNIUSB/PMliZfwTSHeo=
X-Received: by 2002:a1c:a953:: with SMTP id s80mr1183855wme.70.1600203631572; 
 Tue, 15 Sep 2020 14:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200821165758.1106210-1-michel@daenzer.net>
 <20200904104304.41246-1-michel@daenzer.net>
 <20200907075716.GO2352366@phenom.ffwll.local>
 <d0c95272-9a1c-f9f0-f1b9-4e7ce1f319c7@daenzer.net>
 <c64d591b-8f3c-5384-f103-3283bcf15c9d@amd.com>
In-Reply-To: <c64d591b-8f3c-5384-f103-3283bcf15c9d@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Sep 2020 17:00:20 -0400
Message-ID: <CADnq5_MTinm97qJW7GxUzCMxSHPRJotgi-b6MHFgv21TEJhNzg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu/dc: Require primary plane to be enabled
 whenever the CRTC is
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Harry Wentland <hwentlan@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgU2VwIDE0LCAyMDIwIGF0IDEwOjM3IEFN
IEthemxhdXNrYXMsIE5pY2hvbGFzCjxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+IHdyb3Rl
Ogo+Cj4gT24gMjAyMC0wOS0xNCAzOjUyIGEubS4sIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+ID4g
T24gMjAyMC0wOS0wNyA5OjU3IGEubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPj4gT24gRnJp
LCBTZXAgMDQsIDIwMjAgYXQgMTI6NDM6MDRQTSArMDIwMCwgTWljaGVsIETDpG56ZXIgd3JvdGU6
Cj4gPj4+IEZyb206IE1pY2hlbCBEw6RuemVyIDxtZGFlbnplckByZWRoYXQuY29tPgo+ID4+Pgo+
ID4+PiBEb24ndCBjaGVjayBkcm1fY3J0Y19zdGF0ZTo6YWN0aXZlIGZvciB0aGlzIGVpdGhlciwg
cGVyIGl0cwo+ID4+PiBkb2N1bWVudGF0aW9uIGluIGluY2x1ZGUvZHJtL2RybV9jcnRjLmg6Cj4g
Pj4+Cj4gPj4+ICAgKiBIZW5jZSBkcml2ZXJzIG11c3Qgbm90IGNvbnN1bHQgQGFjdGl2ZSBpbiB0
aGVpciB2YXJpb3VzCj4gPj4+ICAgKiAmZHJtX21vZGVfY29uZmlnX2Z1bmNzLmF0b21pY19jaGVj
ayBjYWxsYmFjayB0byByZWplY3QgYW4gYXRvbWljCj4gPj4+ICAgKiBjb21taXQuCj4gPj4+Cj4g
Pj4+IGF0b21pY19yZW1vdmVfZmIgZGlzYWJsZXMgdGhlIENSVEMgYXMgbmVlZGVkIGZvciBkaXNh
YmxpbmcgdGhlIHByaW1hcnkKPiA+Pj4gcGxhbmUuCj4gPj4+Cj4gPj4+IFRoaXMgcHJldmVudHMg
YXQgbGVhc3QgdGhlIGZvbGxvd2luZyBwcm9ibGVtcyBpZiB0aGUgcHJpbWFyeSBwbGFuZSBnZXRz
Cj4gPj4+IGRpc2FibGVkIChlLmcuIGR1ZSB0byBkZXN0cm95aW5nIHRoZSBGQiBhc3NpZ25lZCB0
byB0aGUgcHJpbWFyeSBwbGFuZSwKPiA+Pj4gYXMgaGFwcGVucyBlLmcuIHdpdGggbXV0dGVyIGlu
IFdheWxhbmQgbW9kZSk6Cj4gPj4+Cj4gPj4+ICogVGhlIGxlZ2FjeSBjdXJzb3IgaW9jdGwgcmV0
dXJuZWQgRUlOVkFMIGZvciBhIG5vbi0wIGN1cnNvciBGQiBJRAo+ID4+PiAgICAod2hpY2ggZW5h
YmxlcyB0aGUgY3Vyc29yIHBsYW5lKS4KPiA+Pj4gKiBJZiB0aGUgY3Vyc29yIHBsYW5lIHdhcyBl
bmFibGVkLCBjaGFuZ2luZyB0aGUgbGVnYWN5IERQTVMgcHJvcGVydHkKPiA+Pj4gICAgdmFsdWUg
ZnJvbSBvZmYgdG8gb24gcmV0dXJuZWQgRUlOVkFMLgo+ID4+Pgo+ID4+PiB2MjoKPiA+Pj4gKiBN
aW5vciBjaGFuZ2VzIHRvIGNvZGUgY29tbWVudCBhbmQgY29tbWl0IGxvZywgcGVyIHJldmlldyBm
ZWVkYmFjay4KPiA+Pj4KPiA+Pj4gR2l0TGFiOgo+ID4+PiBodHRwczovL2dpdGxhYi5nbm9tZS5v
cmcvR05PTUUvbXV0dGVyLy0vaXNzdWVzLzExMDgKPiA+Pj4KPiA+Pj4gR2l0TGFiOgo+ID4+PiBo
dHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvbXV0dGVyLy0vaXNzdWVzLzExNjUKPiA+Pj4K
PiA+Pj4gR2l0TGFiOgo+ID4+PiBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvbXV0dGVy
Ly0vaXNzdWVzLzEzNDQKPiA+Pj4KPiA+Pj4gU3VnZ2VzdGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoZWwgRMOkbnpl
ciA8bWRhZW56ZXJAcmVkaGF0LmNvbT4KPiA+Pgo+ID4+IENvbW1pdCBtZXNzYWdlIGFncmVlcyB3
aXRoIG15IHVuZGVyc3RhbmQgb2YgdGhpcyBtYXplIG5vdywgc286Cj4gPj4KPiA+PiBBY2tlZC1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiA+Cj4gPiBUaGFua3Mg
RGFuaWVsIQo+ID4KPiA+Cj4gPiBOaWNrIC8gSGFycnksIGFueSBtb3JlIGZlZWRiYWNrPyBJZiBu
b3QsIGNhbiB5b3UgYXBwbHkgdGhpcz8KPiA+Cj4gPgo+ID4gUC5TLiBTaW5jZSBEQ04gZG9lc24n
dCBtYWtlIGEgZGlzdGluY3Rpb24gYmV0d2VlbiBwcmltYXJ5IG9yIG92ZXJsYXkKPiA+IHBsYW5l
cyBpbiBoYXJkd2FyZSwgY291bGQgQ2hyb21pdW1PUyBhY2hpZXZlIHRoZSBzYW1lIGVmZmVjdCB3
aXRoIG9ubHkKPiA+IHRoZSBwcmltYXJ5IHBsYW5lIGluc3RlYWQgb2Ygb25seSBhbiBvdmVybGF5
IHBsYW5lPyBJZiBzbywgbWF5YmUgdGhlcmUncwo+ID4gbm8gbmVlZCBmb3IgdGhlICJibGFjayBw
bGFuZSBoYWNrIi4KPiA+Cj4gPgo+Cj4gSSBvbmx5IGtub3cgdGhhdCBhdG9taWN0ZXN0IHRyaWVz
IHRvIGVuYWJsZSB0aGlzIGNvbmZpZ3VyYXRpb24uIE5vdCBzdXJlCj4gaWYgQ2hyb21pdW1PUyBv
ciBvdGhlciAicmVhbCIgdXNlcnNwYWNlIHRyaWVzIHRoaXMgY29uZmlndXJhdGlvbi4KPgo+IE1h
eWJlIGZvciBub3cgdGhpcyBjYW4gZ28gaW4gYW5kIGlmIHNvbWV0aGluZyBicmVha3Mgd2UgY2Fu
IGRlYWwgd2l0aAo+IHRoZSBmYWxsb3V0IHRoZW4uIFdlIGNhbiBhbHdheXMgZ28gYmFjayB0byBs
eWluZyB0byB1c2Vyc3BhY2UgYWJvdXQgdGhlCj4gY3Vyc29yIGJlaW5nIHZpc2libGUgaWYgdGhl
IGNvbW1pdCBmYWlscyBpbiB0aGF0IGNhc2UgSSBndWVzcyBzaW5jZSB0aGUKPiBibGFuayBwbGFu
ZSBoYWNrIGlzIGdvaW5nIHRvIGFkZCBhIHNpZ25pZmljYW50IGFtb3VudCBvZiBjb21wbGV4aXR5
IHRvIERNLgo+Cj4gUmV2aWV3ZWQtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmth
emxhdXNrYXNAYW1kLmNvbT4KPgo+IFJlZ2FyZHMsCj4gTmljaG9sYXMgS2F6bGF1c2thcwo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBt
YWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
