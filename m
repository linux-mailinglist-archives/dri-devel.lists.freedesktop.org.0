Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C88EF9CE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 10:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7296E97B;
	Tue,  5 Nov 2019 09:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6556E97B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 09:43:03 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o28so20494734wro.7
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 01:43:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=4/VJ6M2+7hwOEEdLHqHiPh0eW3cGFy3lItJn6scbrkU=;
 b=jgvgytEoLUqUcKuiPwIWj1BfMpzXb4OpgPjgIlfRjlTtQNXl5rS1iLipPb+B1HuAIS
 sjM/zFmcPG5cjylfS9i5YNcfRWIjf1+4lpsjoCV4+V0tfYAEe5pY1Q7wwYoHz3zYiDU2
 1+Ua2bbaEIeViB2ToDjGG9LQi7XDHsi2FyTWdTaHX3lCTqNmCRCMrnL+31MDqpHdRTue
 OVKQwtm8yeQufHchKAnBi3w2DJ880JFRQ7SH7No31PSgxjDAhWzatD7eqnXppBfKJPTv
 UA/w/Dx5PY4mibI1ZBtIMdEEOApDweLK6xG7yaWXEstNfyLnkDB8aJFQlAINd4Zs6y2J
 dAeg==
X-Gm-Message-State: APjAAAXTdZBuraCMnPmif/cdSsLlgbg0yYsDGgs8aOh5iwD41f+hxKGj
 V6lR3cPO/5kFPU7R6Ai0YMPtlw==
X-Google-Smtp-Source: APXvYqzjhUTNVruYhgZfTmLkZ34XimMiuypNBa3cC7z8/2/Ifk+JRdi+Kaed6KOmzy91cnLXEvZNOg==
X-Received: by 2002:adf:e682:: with SMTP id r2mr12546257wrm.358.1572946982169; 
 Tue, 05 Nov 2019 01:43:02 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id q6sm20672730wrx.30.2019.11.05.01.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 01:43:01 -0800 (PST)
Date: Tue, 5 Nov 2019 10:42:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 0/2] Allow DMA BUF heaps to be loaded as modules
Message-ID: <20191105094259.GX10326@phenom.ffwll.local>
Mail-Followup-To: John Stultz <john.stultz@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Sandeep Patil <sspatil@google.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>,
 Liam Mark <lmark@codeaurora.org>, Yue Hu <huyue2@yulong.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Pratik Patel <pratikp@codeaurora.org>
References: <20191025234834.28214-1-john.stultz@linaro.org>
 <20191104095823.GD10326@phenom.ffwll.local>
 <CALAqxLW_CoAn-KXki0dGKK+vo-R4CTnjt1Azrw=mRdL8BUFGWw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALAqxLW_CoAn-KXki0dGKK+vo-R4CTnjt1Azrw=mRdL8BUFGWw@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=4/VJ6M2+7hwOEEdLHqHiPh0eW3cGFy3lItJn6scbrkU=;
 b=kTl+haPDx5U6Fx1XlOyiFqVx0h+M0wDWGpkPmdSzIZx09oMjctwEGNnt327IEBPAu3
 Ih1Z4srBFKmE/cWxitDHZaMhrhUpZ2RvSWB+041gOx1qNYaNb3w684F1JJFCZlzrW3Gd
 /6PnBpS0F3UISGPTN6qcGSzBJ9c9z6SzqlIL8=
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
Cc: Sandeep Patil <sspatil@google.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 lkml <linux-kernel@vger.kernel.org>, Yue Hu <huyue2@yulong.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMTA6NTc6NDRBTSAtMDgwMCwgSm9obiBTdHVsdHogd3Jv
dGU6Cj4gT24gTW9uLCBOb3YgNCwgMjAxOSBhdCAxOjU4IEFNIERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4gd3JvdGU6Cj4gPiBPbiBGcmksIE9jdCAyNSwgMjAxOSBhdCAxMTo0ODozMlBN
ICswMDAwLCBKb2huIFN0dWx0eiB3cm90ZToKPiA+ID4gTm93IHRoYXQgdGhlIERNQSBCVUYgaGVh
cHMgY29yZSBjb2RlIGhhcyBiZWVuIHF1ZXVlZCwgSSB3YW50ZWQKPiA+ID4gdG8gc2VuZCBvdXQg
c29tZSBvZiB0aGUgcGVuZGluZyBjaGFuZ2VzIHRoYXQgSSd2ZSBiZWVuIHdvcmtpbmcKPiA+ID4g
b24uCj4gPiA+Cj4gPiA+IEZvciB1c2Ugd2l0aCBBbmRyb2lkIGFuZCB0aGVpciBHS0kgZWZmb3J0
LCBpdCBpcyBkZXNpcmVkIHRoYXQKPiA+ID4gRE1BIEJVRiBoZWFwcyBhcmUgYWJsZSB0byBiZSBs
b2FkZWQgYXMgbW9kdWxlcy4gVGhpcyBpcyByZXF1aXJlZAo+ID4gPiBmb3IgbWlncmF0aW5nIHZl
bmRvcnMgb2ZmIG9mIElPTiB3aGljaCB3YXMgYWxzbyByZWNlbnRseSBjaGFuZ2VkCj4gPiA+IHRv
IHN1cHBvcnQgbW9kdWxlcy4KPiA+ID4KPiA+ID4gU28gdGhpcyBwYXRjaCBzZXJpZXMgc2ltcGx5
IHByb3ZpZGVzIHRoZSBuZWNlc3NhcnkgZXhwb3J0ZWQKPiA+ID4gc3ltYm9scyBhbmQgYWxsb3dz
IHRoZSBzeXN0ZW0gYW5kIENNQSBkcml2ZXJzIHRvIGJlIGJ1aWx0Cj4gPiA+IGFzIG1vZHVsZXMu
Cj4gPiA+Cj4gPiA+IER1ZSB0byB0aGUgZmFjdCB0aGF0IGRtYWJ1ZidzIGFsbG9jYXRlZCBmcm9t
IGEgaGVhcCBtYXkKPiA+ID4gYmUgaW4gdXNlIGZvciBxdWl0ZSBzb21lIHRpbWUsIHRoZXJlIGlz
bid0IGEgd2F5IHRvIHNhZmVseQo+ID4gPiB1bmxvYWQgdGhlIGRyaXZlciBvbmNlIGl0IGhhcyBi
ZWVuIGxvYWRlZC4gVGh1cyB0aGVzZQo+ID4gPiBkcml2ZXJzIGRvIG5vIGltcGxlbWVudCBtb2R1
bGVfZXhpdCgpIGZ1bmN0aW9ucyBhbmQgd2lsbAo+ID4gPiBzaG93IHVwIGluIGxzbW9kIGFzICJb
cGVybWFuZW50XSIKPiA+ID4KPiA+ID4gRmVlZGJhY2sgYW5kIHRob3VnaHRzIG9uIHRoaXMgd291
bGQgYmUgZ3JlYXRseSBhcHByZWNpYXRlZCEKPiA+Cj4gPiBEbyB3ZSBhY3R1YWxseSB3YW50IHRo
aXM/Cj4gCj4gSSBndWVzcyB0aGF0IGFsd2F5cyBkZXBlbmRzIG9uIHRoZSBkZWZpbml0aW9uIG9m
ICJ3ZSIgOikKPiAKPiA+IEkgZmlndXJlZCBpZiB3ZSBqdXN0IHN0YXRlIHRoYXQgdmVuZG9ycyBz
aG91bGQgc2V0IHVwIGFsbCB0aGUgcmlnaHQKPiA+IGRtYS1idWYgaGVhcHMgaW4gZHQsIGlzIHRo
YXQgbm90IGVub3VnaD8KPiAKPiBTbyBldmVuIGlmIHRoZSBoZWFwcyBhcmUgY29uZmlndXJlZCB2
aWEgRFQgKHdoaWNoIGF0IHRoZSBtb21lbnQgdGhlcmUKPiBpcyBubyBzdWNoIGJpbmRpbmcsIHNv
IHRoYXQncyBub3QgcmVhbGx5IGEgdmFsaWQgbWV0aG9kIHlldCksIHRoZXJlJ3MKPiBzdGlsbCB0
aGUgcXVlc3Rpb24gb2YgaWYgdGhlIGhlYXAgaXMgbmVjZXNzYXJ5L21ha2VzIHNlbnNlIG9uIHRo
ZQo+IGRldmljZS4gQW5kIHRoZSBEVCB3b3VsZCBvbmx5IGNvbnRyb2wgdGhlIGF2YWlsYWJpbGl0
eSBvZiB0aGUgaGVhcAo+IGludGVyZmFjZSwgbm90IGlmIHRoZSBoZWFwIGRyaXZlciBpcyBsb2Fk
ZWQgb3Igbm90LgoKSG0gSSB0aG91Z2h0IHRoZSBjbWEgcmVnaW9ucyBhcmUgY29uZmlndXJlZCBp
biBEVD8gSG93IGRvZXMgdGhhdCB3b3JrIGlmCml0J3Mgbm90IHVzaW5nIERUPwoKPiBPbiB0aGUg
SGlLZXkvSGlLZXk5NjAgYm9hcmRzLCB3ZSBoYXZlIHRvIGFsbG9jYXRlIGNvbnRpZ3VvdXMgYnVm
ZmVycwo+IGZvciB0aGUgZGlzcGxheSBmcmFtZWJ1ZmZlci4gU28gZ3JhbGxvYyB1c2VzIElPTiB0
byBhbGxvY2F0ZSBmcm9tIHRoZQo+IENNQSBoZWFwLiBIb3dldmVyIG9uIHRoZSBkYjg0NWMsIGl0
IGhhcyBubyBzdWNoIHJlc3RyaWN0aW9ucywgc28gdGhlCj4gQ01BIGhlYXAgaXNuJ3QgbmVjZXNz
YXJ5LgoKV2h5IGRvIHlvdSBoYXZlIGEgQ01BIHJlZ2lvbiBmb3IgdGhlIDJuZCBib2FyZCBpZiB5
b3UgZG9uJ3QgbmVlZCBpdD8KX1RoYXRfIHNvdW5kcyBsaWtlIHNvbWUgc2VyaW91cyBtZW1vcnkg
d2FzdGVyLCBub3QgYSBmZXcgbGluZXMgb2YgY29kZQpsb2FkZWQgZm9yIG5vdGhpbmcgOi0pCgo+
IFdpdGggQW5kcm9pZCdzIEdLSSBlZmZvcnQsIHRoZXJlIG5lZWRzIHRvIGJlIG9uZSBrZXJuZWwg
dGhhdCB3b3JrcyBvbgo+IGFsbCB0aGUgZGV2aWNlcywgYW5kIHRoZXkgYXJlIHVzaW5nIG1vZHVs
ZXMgdG8gdHJ5IHRvIG1pbmltaXplIHRoZQo+IGFtb3VudCBvZiBtZW1vcnkgc3BlbnQgb24gZnVu
Y3Rpb25hbGl0eSB0aGF0IGlzbid0IHVuaXZlcnNhbGx5IG5lZWRlZC4KPiBTbyBvbiBkZXZpY2Vz
IHRoYXQgZG9uJ3QgbmVlZCB0aGUgQ01BIGhlYXAsIHRoZXknZCBwcm9iYWJseSBwcmVmZXIgbm90
Cj4gdG8gbG9hZCB0aGUgQ01BIGRtYWJ1ZiBoZWFwIGRyaXZlciwgc28gaXQgd291bGQgYmUgYmVz
dCBpZiBpdCBjb3VsZCBiZQo+IGJ1aWx0IGFzIGEgbW9kdWxlLiAgSWYgd2Ugd2FudCB0byBidWls
ZCB0aGUgQ01BIGhlYXAgYXMgYSBtb2R1bGUsIHRoZQo+IHN5bWJvbHMgaXQgdXNlcyBuZWVkIHRv
IGJlIGV4cG9ydGVkLgoKWWVhaCwgSSBndWVzcyBJJ20gZGlzYWdyZWVpbmcgb24gd2hldGhlciBk
bWEtYnVmIGhlYXBzIGFyZSBjb3JlIG9yIG5vdC4KCj4gPiBFeHBvcnRpbmcgc3ltYm9scyBmb3Ig
bm8gcmVhbCBpbi10cmVlIHVzZXJzIGZlZWxzIGZpc2h5Lgo+IAo+IEknbSBzdWJtaXR0aW5nIGFu
IGluLXRyZWUgdXNlciBoZXJlLiBTbyBJJ20gbm90IHN1cmUgd2hhdCB5b3UgbWVhbj8gIEkKPiBz
dXNwZWN0IHlvdSdyZSB0aGlua2luZyB0aGVyZSBpcyBzb21lIGhpZGRlbi9uZWZhcmlvdXMgcGxh
biBoZXJlLCBidXQKPiByZWFsbHkgdGhlcmUgaXNuJ3QuCgpJIHdhcyB3b3JraW5nIHVuZGVyIHRo
ZSBhc3N1bXB0aW9uIHRoYXQgeW91J3JlIG9ubHkgZXhwb3J0aW5nIHRoZSBzeW1ib2xzCmZvciBv
dGhlciBoZWFwcywgYW5kIGtlZXAgdGhlIGN1cnJlbnQgb25lcyBpbi10cmVlLiBBcmUgdGhlcmUg
ZXZlbiBhbnkKb3V0LW9mLXRyZWUgZG1hLWJ1ZiBoZWFwcyBzdGlsbD8gb3V0LW9mLXRyZWUgYW5k
IGxlZ2l0IGRpZmZlcmVudCB1c2UtY2FzZQpJIG1lYW4gb2ZjLCBub3QganVzdCBvdXQtb2YtdHJl
ZSBiZWNhdXNlIGluZXJ0aWEgOi0pCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUg
RW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
