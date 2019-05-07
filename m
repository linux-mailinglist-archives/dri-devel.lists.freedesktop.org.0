Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAF115F52
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 10:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012C189F3B;
	Tue,  7 May 2019 08:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F72B89F3B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 08:26:19 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w37so17871488edw.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 01:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=HBTBriep7d+5LYSoZwZAILWXsZiLIs+VqCOPup2DIz0=;
 b=iOcsW6Q7E+S3HSpjrv1La7NRDHU5Nrr4ZIoZXW7g0lZfh/jc+j7766ZRHcp5L960fP
 iddEGoSKTH8QG23vr8koqXoX9sdIG2AHq26RiuQ+Vb1/a54oafkHTbS8LOdSCdDofKEa
 czHVWKcuq7pAgA4DIXfLYrIRjmlN4V31ZFr4VWimZVOWkc+EiOGpqyMaiaNyjPDg4MWb
 P5aVIDjZK9bxRCwhzx5Z8i2/QZwX2Cw0g/1k33aU3f9Dxc/sXa2Oc+/NgQJs0ou8z2e1
 pye5aDzE+CEOQ/TpaGP7rqPxSXKlmsuP3lA0fKVYW58J6jVYJiRosFpqtnp/xenW/hOp
 ZiXQ==
X-Gm-Message-State: APjAAAV4WVl73SDA5fd1A9zBPacWhQirMtMsuyztYMBZ0Gc9/YyuNcCJ
 VuzwZUlgJNA4b2G/NY0QRfCK2BxBfrI=
X-Google-Smtp-Source: APXvYqwnGcuR5f9AyOY3TzD45Yj0dR7zq2rt9UNfcz4uZhL2qfgqPIG2JUTkkHugdWRB/olMm0rA3A==
X-Received: by 2002:aa7:c596:: with SMTP id g22mr31718172edq.32.1557217578133; 
 Tue, 07 May 2019 01:26:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x8sm2023876ejv.80.2019.05.07.01.26.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 May 2019 01:26:17 -0700 (PDT)
Date: Tue, 7 May 2019 10:26:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: James Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for GNU/kFreeBSD
Message-ID: <20190507082615.GM17751@phenom.ffwll.local>
References: <20190115150418.68080-1-jrtc27@jrtc27.com>
 <20190115151723.GQ10517@phenom.ffwll.local>
 <877ef5hifi.fsf@anholt.net>
 <C2E5BBDF-DD8B-4024-8995-8E21549385C7@jrtc27.com>
 <20190506081621.GE17751@phenom.ffwll.local>
 <1A1C5739-0A7C-4C3D-A01E-C4E1C3A92F12@jrtc27.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1A1C5739-0A7C-4C3D-A01E-C4E1C3A92F12@jrtc27.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HBTBriep7d+5LYSoZwZAILWXsZiLIs+VqCOPup2DIz0=;
 b=AXXCVhpWmmfH4IC0neHtCfgytQcJZFEZ3QqTCk7QQgsVcU37BnRQPpgsHCI8WpCxGG
 SmWpvDwhjvuGZ4GlZMHpEKb1HiD4BgsrGmGzr7whxCg+wx6cRjCVSRqzS4cdox+6fFX9
 sRKMv1lfK0EaMfQsBxqpQCzs05H59K8ZpjOI4=
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

T24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMTI6MTA6NTJBTSArMDEwMCwgSmFtZXMgQ2xhcmtlIHdy
b3RlOgo+IE9uIDYgTWF5IDIwMTksIGF0IDA5OjE2LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+ID4gT24gU2F0LCBNYXkgMDQsIDIwMTkgYXQgMDk6NDM6MTRQTSArMDEw
MCwgSmFtZXMgQ2xhcmtlIHdyb3RlOgo+ID4+IE9uIDE1IEphbiAyMDE5LCBhdCAxODo0MSwgRXJp
YyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4gd3JvdGU6Cj4gPj4+IAo+ID4+PiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyaXRlczoKPiA+Pj4gCj4gPj4+PiBPbiBUdWUsIEphbiAx
NSwgMjAxOSBhdCAwMzowNDoxOFBNICswMDAwLCBKYW1lcyBDbGFya2Ugd3JvdGU6Cj4gPj4+Pj4g
TGlrZSBHTlUvTGludXgsIEdOVS9rRnJlZUJTRCdzIHN5cy90eXBlcy5oIGRvZXMgbm90IGRlZmlu
ZSB0aGUgdWludFhfdAo+ID4+Pj4+IHR5cGVzLCB3aGljaCBkaWZmZXJzIGZyb20gdGhlIEJTRHMn
IGhlYWRlcnMuIFRodXMgd2Ugc2hvdWxkIGluY2x1ZGUKPiA+Pj4+PiBzdGRpbnQuaCB0byBlbnN1
cmUgd2UgaGF2ZSBhbGwgdGhlIHJlcXVpcmVkIGludGVnZXIgdHlwZXMuCj4gPj4+Pj4gCj4gPj4+
Pj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgQ2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4KPiA+Pj4+
IAo+ID4+Pj4gV291bGQgYmUgZ29vZCB0byBnZXQgYW4gYWNrIGZyb20gc29tZSBvdGhlciAqYnNk
IHRoYXQgdGhpcyBpcyBzdGlsbCBhbGwKPiA+Pj4+IGZpbmUuIGxndG0gb3RoZXJ3aXNlLgo+ID4+
Pj4gLURhbmllbAo+ID4+PiAKPiA+Pj4gSSB0aGluayB0aGVyZSB3YXMgc29tZSBuZWVkIGZvciBp
bnR0eXBlcy5oIGluc3RlYWQgb2Ygc3RkaW50IGxpa2UgYQo+ID4+PiBkZWNhZGUgYWdvIHdoZW4g
SSB3YXMgd29ya2luZyBvbiBCU0RzLCBidXQgdGhhdCB3YXMgYWxyZWFkeSBhbG1vc3QKPiA+Pj4g
aXJyZWxldmFudCB0aGVuLgo+ID4+IAo+ID4+IEhpLCBqdXN0IGZvbGxvd2luZyB1cCBvbiB0aGlz
OyBpcyB0aGVyZSBzdGlsbCB0aGUgbmVlZCBmb3IgYW4gQUNLPwo+ID4gCj4gPiBZZWFoIGFuZCBh
Y2sgd2l0aG91dCBhICJkZWNhZGVzIGFnbyIgcXVhbGlmaWVyIHdvdWxkIGJlIG5pY2UuCj4gPiAt
RGFuaWVsCj4gCj4gSSBoYXZlIHRoZSBmb2xsb3dpbmcgZnJvbSBCcm9va3MgRGF2aXMsIEZyZWVC
U0QgY29udHJpYnV0b3IgYW5kIGNvcmUgdGVhbQo+IG1lbWJlcjoKPiAKPiAtLS0tLUJFR0lOIFBH
UCBTSUdORUQgTUVTU0FHRS0tLS0tCj4gSGFzaDogU0hBMQo+IAo+IENvbnRlbnQtVHlwZTogdGV4
dC9wbGFpbjsgY2hhcnNldD11cy1hc2NpaQo+IENvbnRlbnQtRGlzcG9zaXRpb246IGlubGluZQo+
IAo+IFdpdGggcmVzcGVjdCB0byB0aGUgdGhyZWFkOgo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LU1heS8yMTY3ODQuaHRtbAo+IAo+IEkgY2Fu
J3Qgc2VlIGFueSByZWFzb24gd2h5IHlvdSdkIHdhbnQgdG8gaW5jbHVkZSBpbnR0eXBlcy5oIGlu
c3RlYWQgb2YKPiBzdGRpbnQuaCB1bmxlc3MgeW91IHdhbnQgdGhlIGludG1heF90IHVzaW5nIHR5
cGVzL2Z1bmN0aW9ucyBpdCBkZWZpbmVzLgo+IFlvdXIgcGF0Y2ggaXMgY2VydGFpbmx5IHNhZmUg
b24gRnJlZUJTRC4KPiAKPiBBdCBhIGdsYW5jZSBpdCBsb29rcyBsaWtlIHRoZSBzYW1lIGlzIHRy
dWUgKHdpdGggc29tZXdoYXQgZGlmZmVyZW50Cj4gaW1wbGVtZW50YXRpb24pIG9uIE9wZW5CU0Qu
Cj4gCj4gLSAtLSBCcm9va3MKPiAKPiAtLS0tLUJFR0lOIFBHUCBTSUdOQVRVUkUtLS0tLQo+IAo+
IGlRRWNCQUVCQWdBR0JRSmMwTHdtQUFvSkVLelFYYlNlYmdmQXJySUlBSXRESGNERzVkOVFjTW5i
UWliaytkNncKPiBFVzFPbnZpamVWWjZQQ05jYkVFbGRaRUhYc1JGT2U3ekU4c1lLU1BlZ0RuWXZl
MXk4alZ5aDJZeUp0REk3ZVdMCj4gaEQyZFNZM0RHT0thdEVmZDNDeG9HMnZwTjh6djNnaURTMzVo
WElxTVJGMWlEMC9qWWl4VFlMY2ZaZ1E3VTZNbAo+IDM0Z3hlM3E2djMwWm9XSzVTSENEQ2FjNHow
T1lqZktUcHdabnlOa2FnL0RXNUNxcU9UUU9hbzZBSk9MY29zcUoKPiBvcklVWlZsMG52azBkSUd6
SzA5ZWYrQldPeVZBNWg2ZitWM0YzeC9jSzNFMnFpVFJ4VkxoaExWYUVnZEJEcDVDCj4gaFBYSDMz
cS9HSzU0bTVqV1ZhWjVCdHBLU0ExRXQ2SGpGNDgrd3lKQ0FEUWgvL0R4SVdHRUFhMWZtdktyeVF3
PQo+ID1vSkJxCj4gLS0tLS1FTkQgUEdQIFNJR05BVFVSRS0tLS0tCj4gCj4gSG9wZWZ1bGx5IHRo
ZSBzaWduYXR1cmUgc3Vydml2ZXM7IEkgY29udmVydGVkIGl0IGZyb20gUEdQL01JTUUgYW5kIGl0
IHNlZW1zIHRvCj4gdmVyaWZ5IGxvY2FsbHkuCgpJdCdzIG5vdCBhYm91dCB0aGUgc2lnbmF0dXJl
LCB3ZSBkb24ndCBjYXJlLCBpdCdzIGFib3V0IHRoZSBlbWFpbAphZGRyZXNzZXMsIHNvIGluIGNh
c2UgdGhlcmUncyBldmVyIGEgY2hhbmdlIGluIHRoZSBmdXR1cmUgd2UnbGwgaGF2ZQpwZW9wbGUg
dG8gY29udGFjdC4KCkNhbiB5b3UgcGxzIHJlc2VuZCB0aGF0IHBhdGNoIHdpdGggdGhvc2UgYWNr
cyAoaW5jbHVkaW5nIG1haWwgYWRkcmVzcykKYWRkZWQ/IE5lZWRzIHBlcm1pc3Npb24gb2YgdGhl
IHBlb3BsZSBpbnZvbHZlZCBvZmMgKHdoaWNoIGlzIHVzdWFsbHkKaW1wbGllZCBmb3IgcHVibGlj
IG1haWxpbmcgbGlzdHMsIGJ1dCB0aGlzIHNlZW1zIGxpa2UgYSBwcml2YXRlIG1haWwpLgoKVGhh
bmtzLCBEYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
