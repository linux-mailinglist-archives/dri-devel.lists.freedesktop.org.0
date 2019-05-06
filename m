Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4C815645
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 01:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71129891E2;
	Mon,  6 May 2019 23:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4994D891E2
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 23:10:56 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r7so19430575wrr.13
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 16:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=JbDF9RBHMf9RP+rhPkFdU/1f1vmjjvEpIZiPZFunPk0=;
 b=TLMj9SRVsuhm2Vpc12MlwxETVVSmxphHsWHbV62Dnb2iSGqDLa+aETMcQVArP4b5t3
 BEI0XSevwqs40dIdOLuzbtC6Qla/9a6fsjp6+aVg1uFcfPw520Dj0apcKUTtij/DFp6p
 Y16snmokFsQnMEx14lrp8BdQ4TpjlVz20EJiS2xLMgNeM15x4k2euu1mZT8M0n6pGpuB
 RXX3kKzqPeGxGfaX0SSF7QsD3C7Z7VSwy4WoPcISstkBlF8RIxvON1VpX4ds5t9K1046
 H6lsOI6k/JD0btihNDqgMjBEWsrpjbYPYIm2Av01JWAer4OGiLR1ifv0vF0cjDpDdX44
 DYIw==
X-Gm-Message-State: APjAAAUgSXk64vW9hQ/kI5JelqDs5pw7dixLCVT1jFDBUCnR9i5MQRxq
 1I9g6kZfyv/Xi2q/Ky6c5G1YWHGkl3yuZw==
X-Google-Smtp-Source: APXvYqwlw94o1FOT+yyBr61+ME8gwN82z5/OCAmAjrtpAVRxV6tkzFwlqpHjJobK/rmUWgiUd34pUg==
X-Received: by 2002:adf:c748:: with SMTP id b8mr19854046wrh.292.1557184254853; 
 Mon, 06 May 2019 16:10:54 -0700 (PDT)
Received: from jrtc4a.trin.private.cam.ac.uk
 (global-184-8.nat-1.net.cam.ac.uk. [131.111.184.8])
 by smtp.gmail.com with ESMTPSA id h24sm14148632wmb.40.2019.05.06.16.10.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 16:10:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [PATCH] drm: Fix drm.h uapi header for GNU/kFreeBSD
From: James Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20190506081621.GE17751@phenom.ffwll.local>
Date: Tue, 7 May 2019 00:10:52 +0100
Message-Id: <1A1C5739-0A7C-4C3D-A01E-C4E1C3A92F12@jrtc27.com>
References: <20190115150418.68080-1-jrtc27@jrtc27.com>
 <20190115151723.GQ10517@phenom.ffwll.local> <877ef5hifi.fsf@anholt.net>
 <C2E5BBDF-DD8B-4024-8995-8E21549385C7@jrtc27.com>
 <20190506081621.GE17751@phenom.ffwll.local>
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailer: Apple Mail (2.3445.102.3)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=JbDF9RBHMf9RP+rhPkFdU/1f1vmjjvEpIZiPZFunPk0=;
 b=dTxWreWPESIVbuxmYK5xb9KYzgc4jtHGZQYuGGVlak810lrkim3P5iX9nC0xexKG/e
 FCCvCpnI8982Xc3jPPnL2zUKEfrDiJ07VfuhX2DT5E3jCiC7fIOHkZ34fi+oEn1tAAUe
 hzf+sMr9wY1JRKLNbDDZC3Fp4weOuZaJ6mFbI=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNiBNYXkgMjAxOSwgYXQgMDk6MTYsIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4g
d3JvdGU6Cj4gT24gU2F0LCBNYXkgMDQsIDIwMTkgYXQgMDk6NDM6MTRQTSArMDEwMCwgSmFtZXMg
Q2xhcmtlIHdyb3RlOgo+PiBPbiAxNSBKYW4gMjAxOSwgYXQgMTg6NDEsIEVyaWMgQW5ob2x0IDxl
cmljQGFuaG9sdC5uZXQ+IHdyb3RlOgo+Pj4gCj4+PiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyaXRlczoKPj4+IAo+Pj4+IE9uIFR1ZSwgSmFuIDE1LCAyMDE5IGF0IDAzOjA0OjE4
UE0gKzAwMDAsIEphbWVzIENsYXJrZSB3cm90ZToKPj4+Pj4gTGlrZSBHTlUvTGludXgsIEdOVS9r
RnJlZUJTRCdzIHN5cy90eXBlcy5oIGRvZXMgbm90IGRlZmluZSB0aGUgdWludFhfdAo+Pj4+PiB0
eXBlcywgd2hpY2ggZGlmZmVycyBmcm9tIHRoZSBCU0RzJyBoZWFkZXJzLiBUaHVzIHdlIHNob3Vs
ZCBpbmNsdWRlCj4+Pj4+IHN0ZGludC5oIHRvIGVuc3VyZSB3ZSBoYXZlIGFsbCB0aGUgcmVxdWly
ZWQgaW50ZWdlciB0eXBlcy4KPj4+Pj4gCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEphbWVzIENsYXJr
ZSA8anJ0YzI3QGpydGMyNy5jb20+Cj4+Pj4gCj4+Pj4gV291bGQgYmUgZ29vZCB0byBnZXQgYW4g
YWNrIGZyb20gc29tZSBvdGhlciAqYnNkIHRoYXQgdGhpcyBpcyBzdGlsbCBhbGwKPj4+PiBmaW5l
LiBsZ3RtIG90aGVyd2lzZS4KPj4+PiAtRGFuaWVsCj4+PiAKPj4+IEkgdGhpbmsgdGhlcmUgd2Fz
IHNvbWUgbmVlZCBmb3IgaW50dHlwZXMuaCBpbnN0ZWFkIG9mIHN0ZGludCBsaWtlIGEKPj4+IGRl
Y2FkZSBhZ28gd2hlbiBJIHdhcyB3b3JraW5nIG9uIEJTRHMsIGJ1dCB0aGF0IHdhcyBhbHJlYWR5
IGFsbW9zdAo+Pj4gaXJyZWxldmFudCB0aGVuLgo+PiAKPj4gSGksIGp1c3QgZm9sbG93aW5nIHVw
IG9uIHRoaXM7IGlzIHRoZXJlIHN0aWxsIHRoZSBuZWVkIGZvciBhbiBBQ0s/Cj4gCj4gWWVhaCBh
bmQgYWNrIHdpdGhvdXQgYSAiZGVjYWRlcyBhZ28iIHF1YWxpZmllciB3b3VsZCBiZSBuaWNlLgo+
IC1EYW5pZWwKCkkgaGF2ZSB0aGUgZm9sbG93aW5nIGZyb20gQnJvb2tzIERhdmlzLCBGcmVlQlNE
IGNvbnRyaWJ1dG9yIGFuZCBjb3JlIHRlYW0KbWVtYmVyOgoKLS0tLS1CRUdJTiBQR1AgU0lHTkVE
IE1FU1NBR0UtLS0tLQpIYXNoOiBTSEExCgpDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJz
ZXQ9dXMtYXNjaWkKQ29udGVudC1EaXNwb3NpdGlvbjogaW5saW5lCgpXaXRoIHJlc3BlY3QgdG8g
dGhlIHRocmVhZDoKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRl
dmVsLzIwMTktTWF5LzIxNjc4NC5odG1sCgpJIGNhbid0IHNlZSBhbnkgcmVhc29uIHdoeSB5b3Un
ZCB3YW50IHRvIGluY2x1ZGUgaW50dHlwZXMuaCBpbnN0ZWFkIG9mCnN0ZGludC5oIHVubGVzcyB5
b3Ugd2FudCB0aGUgaW50bWF4X3QgdXNpbmcgdHlwZXMvZnVuY3Rpb25zIGl0IGRlZmluZXMuCllv
dXIgcGF0Y2ggaXMgY2VydGFpbmx5IHNhZmUgb24gRnJlZUJTRC4KCkF0IGEgZ2xhbmNlIGl0IGxv
b2tzIGxpa2UgdGhlIHNhbWUgaXMgdHJ1ZSAod2l0aCBzb21ld2hhdCBkaWZmZXJlbnQKaW1wbGVt
ZW50YXRpb24pIG9uIE9wZW5CU0QuCgotIC0tIEJyb29rcwoKLS0tLS1CRUdJTiBQR1AgU0lHTkFU
VVJFLS0tLS0KCmlRRWNCQUVCQWdBR0JRSmMwTHdtQUFvSkVLelFYYlNlYmdmQXJySUlBSXRESGNE
RzVkOVFjTW5iUWliaytkNncKRVcxT252aWplVlo2UENOY2JFRWxkWkVIWHNSRk9lN3pFOHNZS1NQ
ZWdEbll2ZTF5OGpWeWgyWXlKdERJN2VXTApoRDJkU1kzREdPS2F0RWZkM0N4b0cydnBOOHp2M2dp
RFMzNWhYSXFNUkYxaUQwL2pZaXhUWUxjZlpnUTdVNk1sCjM0Z3hlM3E2djMwWm9XSzVTSENEQ2Fj
NHowT1lqZktUcHdabnlOa2FnL0RXNUNxcU9UUU9hbzZBSk9MY29zcUoKb3JJVVpWbDBudmswZElH
ekswOWVmK0JXT3lWQTVoNmYrVjNGM3gvY0szRTJxaVRSeFZMaGhMVmFFZ2RCRHA1QwpoUFhIMzNx
L0dLNTRtNWpXVmFaNUJ0cEtTQTFFdDZIakY0OCt3eUpDQURRaC8vRHhJV0dFQWExZm12S3J5UXc9
Cj1vSkJxCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQoKSG9wZWZ1bGx5IHRoZSBzaWduYXR1
cmUgc3Vydml2ZXM7IEkgY29udmVydGVkIGl0IGZyb20gUEdQL01JTUUgYW5kIGl0IHNlZW1zIHRv
CnZlcmlmeSBsb2NhbGx5LgoKUmVnYXJkcywKSmFtZXMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
