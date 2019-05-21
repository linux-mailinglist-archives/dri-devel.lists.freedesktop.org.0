Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 804B424BDD
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 11:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30428926C;
	Tue, 21 May 2019 09:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392FF8926E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 09:42:43 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id j12so28427391eds.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 02:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=eeGRUPQWlPl60LwsGvBOzIwL3RQdIpZtbtwrOU0bve8=;
 b=pZqPTID+zvZl9c0+tW/Qnz9TPIBR7l0jLnwHneo94vxB2auQWCLh4DAIH7uLUSTqvI
 lfZjHyqYqPCvacBm7Aow7oD97cRIOgf3QWmfddmC6wImpRDy2opsfPLLtNA8oTEusLn0
 Xg1GYz/ALyImmDy3MospphrUSY6eFTBhyFeuSi8ekGCD9Yl+w02UWMuS3g7Qn0JxsMN4
 WB/GnB5O0mF8P79W+kryoC6g+/YsV34tTY9axwtgfq6++jqZSG6DLhU3nShpz/nTZhal
 vPoM75pjskJSUfJUaC4FxkiwsZ4j2MQJWqkfahnU11dYNiF3EJ105zjPd8SMuUnA8UH4
 x00g==
X-Gm-Message-State: APjAAAUoVV6rYcNv/+ogoXs7ZSfCMPbs/3MDDn/LORUKtlOjtkFh0Z3g
 3hwlNzSeGJ7siVlmCtDPd6q4YA==
X-Google-Smtp-Source: APXvYqzALh+zLSStNkWE2/itQFtbbZZqs4XTjc5Zl7du61kGBYydXpui1ZwGaUnUatwuUoUDR5ubWg==
X-Received: by 2002:a17:906:7d50:: with SMTP id
 l16mr63799873ejp.84.1558431761669; 
 Tue, 21 May 2019 02:42:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x40sm6126533edx.52.2019.05.21.02.42.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 02:42:40 -0700 (PDT)
Date: Tue, 21 May 2019 11:42:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v7 09/11] drm: uevent for connector status change
Message-ID: <20190521094238.GK21222@phenom.ffwll.local>
References: <CAKMK7uGMJMZiOP4rhhiu=Obu6sO0oav5se-vy8bNLu8dfoZmvA@mail.gmail.com>
 <20190515103731.16855195@eldfell.localdomain>
 <20190515082449.GA17751@phenom.ffwll.local>
 <20190516112211.1cd5a8c6@eldfell.localdomain>
 <20190516122455.GA3851@phenom.ffwll.local>
 <20190517130824.17372663@eldfell.localdomain>
 <20190520161107.GA21222@phenom.ffwll.local>
 <20190521095505.7ef1cbdf@eldfell.localdomain>
 <CAKMK7uGoVhAOkZN7G1fuzdUjihjxqRhVuVvE3K5HFZwGjyC6Hg@mail.gmail.com>
 <20190521120129.2d06d88e@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521120129.2d06d88e@eldfell.localdomain>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eeGRUPQWlPl60LwsGvBOzIwL3RQdIpZtbtwrOU0bve8=;
 b=gQ2D1HFMJBfIGyT/Kbb2PxLvfCkTTa2GtHJd44U6DeV2lAbPqm/kfdEtgj+7ez4N/0
 J2wdsrAsh1I2O/r23kF8BGKycTJEyi4p/ZLn9F4J4CqO8+k199Jj+Rp/PlYftOb8XPLn
 WXh7zNcmG8vPhasXt/bB2bvWX7CyCX7+85dJQ=
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
Cc: "Ser, Simon" <simon.ser@intel.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMTI6MDE6MjlQTSArMDMwMCwgUGVra2EgUGFhbGFuZW4g
d3JvdGU6Cj4gSGkgRGFuaWVsLAo+IAo+IHdoYXQgc2F5cyB0aGUgYXNzdW1wdGlvbiBvZiB0aGUg
b25seSBtb25pdG9yIGJlaW5nIGRyaXZlbiBieSBDUlRDIDAKPiB3YXMgYSBiYWQgb25lPyA6LXAK
PiAKPiBJdCdzIHByb2JhYmx5IG5vdCBvYnZpb3VzIHRoYXQgdXNlcnNwYWNlIG5lZWRzIHRvIGV4
cGxpY2l0bHkgdHJ5IHRvCj4gYXZvaWQgaW52YWxpZCBjb25maWd1cmF0aW9uIGNvbWJpbmF0aW9u
cyBieSBpbnNwZWN0aW5nIHRoZSBjdXJyZW50IGZ1bGwKPiBjb25maWd1cmF0aW9uIGFuZCBub3Qg
anVzdCB0aGUgb25lIENSVEMvY29ubmVjdG9yIGl0IHdhbnRzIHRvIHVzZS4KCldlbGwgdGhlIGVu
dGlyZSBwb2ludCBvZiBhdG9taWMgaXMgdGhhdCB5b3UgZG8gc2V0IHRoZSBlbnRpcmUgY29uZmln
LiBUaGUKLW1vZGVzZXR0aW5nIGF0b21pYyBjb252ZXJzYXRpb24gdHJpZWQgdG8ganVzdCB1c2Ug
dGhlIGF0b21pYyBpb2N0bCBieSAxOjEKcmVwbGFjaW5nIGxlZ2FjeSBpb2N0bCBjYWxscywgYW5k
IHRoZXkgc2NyZXdlZCB0aGluZ3MgdXAuCgpJZiBpdCB3b3VsZCBoYXZlIGFwcGxpZWQgdGhlIGVu
dGlyZSBjb25maWd1cmF0aW9uIGluIG9uZSBnbywgaXQgd291bGQKd29yay4KCj4gPiBBbGwgY3Vy
cmVudCBhdG9taWMgaW4gLW1vZGVzZXR0aW5nIGNhbiBkbyBpcyBwYWdlZmxpcCBhbmQgZHBtcyBv
ZmYvb24KPiA+IG9uIHRoZSBmaXJzdCBzY3JlZW4gb24gdGhlIGZpcnN0IGNydGMuIEFueXRoaW5n
IG1vcmUgZmFuY3kgZ29lcyBib29tLAo+ID4gbGlrZSB3aGVyZSB5b3UgY2hhbmdlIHRoZSBjb25u
ZWN0b3IvY3J0YyBsaW5rcy4KPiA+IAo+ID4gSXQncyBfcmVhbGx5XyBicm9rZW4gOi0pCj4gCj4g
QnV0IGl0IHdvcmtlZCBleGFjdGx5IHRoYXQgbXVjaCwgdW50aWwgYSBrZXJuZWwgY2hhbmdlIGJy
b2tlIGl0LCByaWdodD8KPiBZZXMsIEkgdG90YWxseSBzZWUgdGhlIHNpbGx5bmVzcywgYnV0IGlm
IGl0IHdvcmtlZCBhbmQgd2UgaGF2ZSB0aGVzZQo+IG5vLXJlZ3Jlc3Npb24gcnVsZXMuLi4KCldo
aWNoIGlzIHdoeSB0aGUgb2ZmZW5kaW5nIHBhdGNoIGhhcyBiZWVuIHJldmVydGVkLiBBbnkgdGhl
IHdheSBmb3J3YXJkIGlzCnRvIGp1c3QgZGlzYWJsZSBhdG9taWMgZnJvbSB0aGUga2VybmVsIGZv
ciBYLm9yZywgYmVjYXVzZSB0aGUgbGVnYWN5IHBhdGgKYWN0dWFsbHkgd29ya3MuIFdlIGFsc28g
aGF2ZSBwYXRjaGVzIHRvIGRpc2FibGUgYXRvbWljIGluIC1tb2Rlc2V0dGluZywKYnV0IHRoZXkn
cmUgc3R1Y2suCgo+ID4gPiBJIGRvbid0IHBlcnNvbmFsbHkgcmVhbGx5IGxpa2UgdGhlc2UgcnVs
ZXMsIGJ1dCBpZiB0aGVzZSBhcmUgdGhlIHJ1bGVzLAo+ID4gPiB0aGVuIHNvIGJlIGl0LiBJbiBt
eSBvcGluaW9uIGl0IHdvdWxkIGJlIGEgaHVnZSBzdGVwIGZvcndhcmQgdG8gZ2V0IGFuZAo+ID4g
PiByZXF1aXJlIHVBUEkgc3BlY2lmaWNhdGlvbnMsIHRoYXQgcGVvcGxlIGNvdWxkIHZlcmlmeSBi
b3RoIGtlcm5lbCBhbmQKPiA+ID4gdXNlcnNwYWNlIGFnYWluc3QuIFZlcmlmeWluZyBhZ2FpbnN0
IGtlcm5lbCBjb2RlIHdpdGggbm8gc3BlYyBpcyB3aGF0Cj4gPiA+IGxlYWRzIHRvIHRoZSAtbW9k
ZXNldHRpbmcgaXNzdWUgYnkgdGhlIHNvdW5kcyBvZiBpdC4KPiA+ID4KPiA+ID4gRG9jdW1lbnRp
bmcga2VybmVsIGludGVybmFsIGludGVyZmFjZXMgaXMgbm90IGl0LiBQZW9wbGUgcmVhZGluZwo+
ID4gPiBEUk0gaW50ZXJuYWwgaW50ZXJmYWNlIGRvY3Mgd291bGQgbmVlZCB0byBrbm93IGhvdyBE
Uk0gd29ya3MgaW50ZXJuYWxseQo+ID4gPiBiZWZvcmUgdGhleSBjb3VsZCBtYXAgdGhhdCBpbmZv
cm1hdGlvbiBpbnRvIHVBUEksIHdoaWNoIG1ha2VzIGl0IGxlc3MKPiA+ID4gdXNlZnVsIGlmIG5v
dCBldmVuIHVzZWxlc3MgZm9yIHVzZXJzcGFjZSBkZXZlbG9wZXJzLiAgCj4gPiAKPiA+IHZnZW0g
aXMgdGhlIGlkZWEgaGVyZSBmb3IgdmFsaWRhdGlvbiwgYnV0IGlmIHBlb3BsZSBzaGlwIGF0b21p
YyBjb2RlCj4gPiB0aGF0IHdhcyBuZXZlciB0ZXN0ZWQgZXhjZXB0IGZvciAiYm9vdHMgb24gbXkg
bGFwdG9wIiwgdGhlbiBub3RoaW5nIGlzCj4gPiBnb2luZyB0byBoZWxwLgo+IAo+IEEgdGVzdGlu
ZyBwYXR0ZXJuIGxpYnJhcnkgd2l0aCB2a21zIHdvdWxkIGJlIGF3ZXNvbWUgaW5kZWVkLgo+IAo+
ID4gQW5kIHllcyB3ZSBoYXZlIGEgaHVnZSBnYXAgd2l0aCB1YXBpIGRvY3VtZW50YXRpb24uIGJ0
dyBmb3IgcHJvcGVydGllcwo+ID4gdGhvc2Ugc2VjdGlvbiBhcmUgbWVhbnQgdG8gYmUgdXNlZnVs
IGZvciB1c2Vyc3BhY2UgcGVvcGxlIHRvbzoKPiA+IAo+ID4gaHR0cHM6Ly9kcmkuZnJlZWRlc2t0
b3Aub3JnL2RvY3MvZHJtL2dwdS9kcm0ta21zLmh0bWwjc3RhbmRhcmQtY29ubmVjdG9yLXByb3Bl
cnRpZXMKPiA+IAo+ID4gYW5kIGFsbCBzdWJzZXF1ZW50IGNoYXB0ZXJzLiBJIGd1ZXNzIGl0J3Mg
YSBiaXQgYnVycmllZCwgYnV0IHRoaXMgcGFydAo+ID4gaXMgbWVhbnQgdG8gYmUgdGhlIHVhcGkg
c3BlYyBmb3IgcHJvcGVydGllcy4gSXMgdGhhdCBhbHNvIGZhaWxpbmcgeW91cgo+ID4gZXhwZWN0
YXRpb25zPwo+IAo+IFllczogaXQgaXMgaGFyZCB0byBmaW5kIChpdCBpcyBpbiBEcml2ZXIgRGV2
ZWxvcGVyJ3MgR3VpZGUsIGJ1cmllZAo+IHNldmVyYWwgY2hhcHRlcnMgaW4pLCBpdCBpcyBpbnRl
cmxlYXZlZCB3aXRoIGxvdHMgb2YgRFJNIGludGVybmFsCj4gZGV0YWlscywgbWFrZXMgcmVmZXJl
bmNlcyB0byBEUk0gaW50ZXJuYWwgZnVuY3Rpb25zLCBhbmQgcHJvYmFibHkKPiByZWxpZXMgb24g
RFJNIGludGVybmFscyBiZWhhdmlvdXIgdGhyb3VnaCB0aGUgcmVmZXJlbmNlcyBieSBub3QKPiBy
ZXBlYXRpbmcgd2hhdCB0aGV5IGRvLgo+IAo+IEl0IGlzIHVzZWZ1bCBvbmNlIHlvdSBmaW5kIGl0
LCBidXQgSSBkb24ndCB0aGluayBpdCdzIGVub3VnaCBmb3IgbWFraW5nCj4gZ29vZCB1c2UgaW4g
dXNlcnNwYWNlIGZvciBzb21lb25lIHdobyBoYXNuJ3QgYmVlbiBhIERSTSBrZXJuZWwKPiBkZXZl
bG9wZXIuCgpTdW1tYXJpemluZyBvdXIgbG9uZyBpcmMgY2hhdCBvbiB0aGlzOiBJIGFncmVlLCBl
dmVyeW9uZSBlbHNlIGFncmVlcywgYnV0Cml0J3MgYSBxdWVzdGlvbiBvZiBtYWtpbmcgaXQgaGFw
cGVuIGFuZCBoYXZpbmcgc29tZW9uZSB3aXRoIHN1ZmZpY2llbnQKdGVjaCB3cml0ZXIgZXhwZXJp
ZW5jZSB0byBtYWtlIGl0IHVzZWZ1bC4KCldoYXQgd2UgaGF2ZSBub3cgaXMgZXNzZW50aWFsbHkg
d2hhdCBoYXBwZW5zIGlmIEkgdHlwZSB1YXBpIHNwZWNzIChJCnB1c2hlZCBmb3IgdGhlc2UgcHJv
cGVydHkgZG9jcykuIEFzIHlvdSBjYW4gc2VlLCBpdCBhaW4ndCBwcmV0dHkgOi0vCgpJIHRoaW5r
IGF0IGxlYXN0IHRoZSBwcm9jZXNzIHY0bCBoYXMsIHdoZXJlIG1pc3NpbmcgZG9jcyBmb3IgdWFw
aSBjYXVzZXMKdGhlIGRvYyBidWlsZCB0byBmYWlsLCBpcyBzb3VuZC4gSSBoYXZlIG5vIGlkZWEg
aG93IHRvIGFkYXB0IHRoYXQgdG8gd2hhdAp3ZSBkbywgYm90aCBmcm9tIGEgInRoaXMgd2lsbCB0
YWtlIGEgZmV3IHllYXJzIHRvIGZpbGwgdGhlIGdhcHMgYW5kIEkKZG9uJ3Qga25vdyBob3cgdG8g
d3JpdGUgZ29vZCBzcGVjcyIgYW5kIG1vcmUgaW1wbGVtZW50YXRpb24gcG92IC0KcHJvcGVydGll
cyBjYW4gYmUgY3JlYXRlZCBhbnl3aGVyZSwgbm8gY2hhbmdlcyB0byBpbmNsdWRlL3VhcGkgcmVx
dWlyZWQuClNvIGhhcmQgdG8gc3BvdCBhdXRvbWF0aWNhbGx5LgoKQ2hlZXJzLCBEYW5pZWwKLS0g
CkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6
Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
