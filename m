Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E7CEE768
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 19:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A6C6E804;
	Mon,  4 Nov 2019 18:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8266E804
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 18:30:27 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a15so18266932wrf.9
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 10:30:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=twaj5yyxcDdPGXd17zYXggs1yIoJjp94ssuxTdaG1b4=;
 b=tq3rbjP+b0EbcRCr3tiWtnw7CPkWR2Nduu+JLBQXBkycj+pbVdTIUbdRmd+hkaYQod
 ntNlCSp2CmvwNDgGLlDRJEf7S+t0L9xjE9fIiTSiuMrzu0pFB09Gj0o5aJXZcvaP5+tZ
 0p6YOIMtueOivCvtkBSFpJzYSRb5HXOldpGiVbuQG/n2EIW0a4THvCyU+ww2RYHBaf2t
 k8EA1LlIe9BabKF4onejKXJwpj9g8xspAYcQFUn38Pd866EzYSniVKgygC8PWA4Cizd6
 XO+Gfga2WRZLQdomXijVXEXmqS+DYlCA2PjZOfIoN6mVsDdZ3OUjhLe1b4rbt+KPdlg0
 Sksg==
X-Gm-Message-State: APjAAAU5zjq4zYRLgxhva2lT4ncKkfRpttYnemfy7624ZSVvpMX6RudD
 AQ/QTYlokkGXr7tIuW8gHVo21w==
X-Google-Smtp-Source: APXvYqxk41HJP3PPJEHlHzwOpDyEm0dkOeYtuPZJYqFWRsapimpT9MoYoBDqaw8vb+XXjo5nNZB9qg==
X-Received: by 2002:adf:fbc4:: with SMTP id d4mr26510325wrs.265.1572892226034; 
 Mon, 04 Nov 2019 10:30:26 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id l14sm19260528wrr.37.2019.11.04.10.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 10:30:25 -0800 (PST)
Date: Mon, 4 Nov 2019 19:30:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [PATCH v14 1/5] dma-buf: Add dma-buf heaps framework
Message-ID: <20191104183023.GT10326@phenom.ffwll.local>
Mail-Followup-To: Brian Starkey <Brian.Starkey@arm.com>,
 Dave Airlie <airlied@gmail.com>, Hillf Danton <hdanton@sina.com>,
 Sudipto Paul <Sudipto.Paul@arm.com>,
 Sandeep Patil <sspatil@google.com>,
 Alistair Strachan <astrachan@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>,
 Chenbo Feng <fengc@google.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, "Andrew F. Davis" <afd@ti.com>,
 Christoph Hellwig <hch@infradead.org>, nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>,
 Pratik Patel <pratikp@codeaurora.org>
References: <20191101214238.78015-1-john.stultz@linaro.org>
 <20191101214238.78015-2-john.stultz@linaro.org>
 <20191104102410.66wlyoln5ahlgkem@DESKTOP-E1NTVVP.localdomain>
 <CAPM=9tydXxV-6++HkkA+JX9GPWE1sN_8CGVCVn-Mwfgfzcn=hg@mail.gmail.com>
 <20191104174341.m6hjzog2vibc3ek3@DESKTOP-E1NTVVP.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191104174341.m6hjzog2vibc3ek3@DESKTOP-E1NTVVP.localdomain>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=twaj5yyxcDdPGXd17zYXggs1yIoJjp94ssuxTdaG1b4=;
 b=NPeUFIBj9heab4iA/fGSR6J8A6Uny8oEMQbURIVhWq0itWYWJKJyAPHxmW6c3r3wvd
 Lh6dmGjTfnpIapb7Tf39ygHg817Nv3zsF53dY/IKU6o4F75LNrrY1+CV3VfTIn3fEOWw
 DGFfUKYCZgcAswxwTUz0BnzXKloumDEkcTOJw=
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
Cc: Hillf Danton <hdanton@sina.com>, nd <nd@arm.com>,
 Sandeep Patil <sspatil@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 lkml <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Andrew F. Davis" <afd@ti.com>, Hridya Valsaraju <hridya@google.com>,
 Sudipto Paul <Sudipto.Paul@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDU6NDM6NTFQTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBIaSBEYXZlLAo+IAo+IE9uIFR1ZSwgTm92IDA1LCAyMDE5IGF0IDAyOjU4OjE3QU0g
KzEwMDAsIERhdmUgQWlybGllIHdyb3RlOgo+ID4gT24gTW9uLCA0IE5vdiAyMDE5IGF0IDIwOjI0
LCBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5jb20+IHdyb3RlOgo+ID4gPgo+ID4g
PiBIaSBKb2huLAo+ID4gPgo+ID4gPiBPbiBGcmksIE5vdiAwMSwgMjAxOSBhdCAwOTo0MjozNFBN
ICswMDAwLCBKb2huIFN0dWx0eiB3cm90ZToKPiA+ID4gPiBGcm9tOiAiQW5kcmV3IEYuIERhdmlz
IiA8YWZkQHRpLmNvbT4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgZnJhbWV3b3JrIGFsbG93cyBhIHVu
aWZpZWQgdXNlcnNwYWNlIGludGVyZmFjZSBmb3IgZG1hLWJ1Zgo+ID4gPiA+IGV4cG9ydGVycywg
YWxsb3dpbmcgdXNlcmxhbmQgdG8gYWxsb2NhdGUgc3BlY2lmaWMgdHlwZXMgb2YgbWVtb3J5Cj4g
PiA+ID4gZm9yIHVzZSBpbiBkbWEtYnVmIHNoYXJpbmcuCj4gPiA+ID4KPiA+ID4gPiBFYWNoIGhl
YXAgaXMgZ2l2ZW4gaXRzIG93biBkZXZpY2Ugbm9kZSwgd2hpY2ggYSB1c2VyIGNhbiBhbGxvY2F0
ZQo+ID4gPiA+IGEgZG1hLWJ1ZiBmZCBmcm9tIHVzaW5nIHRoZSBETUFfSEVBUF9JT0NfQUxMT0Mu
Cj4gPiA+ID4KPiA+ID4gPiBBZGRpdGlvbmFsbHkgc2hvdWxkIHRoZSBpbnRlcmZhY2UgZ3JvdyBp
biB0aGUgZnV0dXJlLCB3ZSBoYXZlIGEKPiA+ID4gPiBETUFfSEVBUF9JT0NfR0VUX0ZFQVRVUkVT
IGlvY3RsIHdoaWNoIGNhbiByZXR1cm4gZnV0dXJlIGZlYXR1cmUKPiA+ID4gPiBmbGFncy4KPiA+
ID4KPiA+ID4gVGhlIHVzZXJzcGFjZSBwYXRjaCBkb2Vzbid0IHVzZSB0aGlzIC0gYW5kIHRoZXJl
J3Mgbm8gaW5kaWNhdGlvbiBvZgo+ID4gPiB3aGF0IGl0J3MgaW50ZW5kZWQgdG8gYWxsb3cgaW4g
dGhlIGZ1dHVyZS4gSSBtaXNzZWQgdGhlIGRpc2N1c3Npb24KPiA+ID4gYWJvdXQgaXQsIGRvIHlv
dSBoYXZlIGEgbGluaz8KPiA+ID4KPiA+ID4gSSB0aG91Z2h0IHRoZSBwcmVmZXJyZWQgYXBwcm9h
Y2ggd2FzIHRvIGFkZCB0aGUgbmV3IGlvY3RsIG9ubHkgd2hlbiB3ZQo+ID4gPiBuZWVkIGl0LCBh
bmQgbmV3IHVzZXJzcGFjZSBvbiBvbGQga2VybmVscyB3aWxsIGdldCAiRU5PU1lTIiB0byBrbm93
Cj4gPiA+IHRoYXQgdGhlIGtlcm5lbCBkb2Vzbid0IHN1cHBvcnQgaXQuCj4gPiAKPiA+IFRoaXMg
d29ya3Mgb25jZSwgZXhwYW5kIHRoZSBpbnRlcmZhY2UgMyBvciA0IHRpbWVzIHdpdGggbm8gZmVh
dHVyZXMKPiA+IGlvY3RsLCBhbmQgeW91IHN0YXJ0IGJlaW5nIGhvc3RpbGUgdG8gdXNlcnNwYWNl
LCB3aGljaCBmZWF0dXJlIGRvZXMKPiA+IEVOT1NZUyBtZWFuIGlzbid0IHN1cHBvcnRlZCBldGMu
Cj4gCj4gU29ycnksIHBlcmhhcHMgSSB3YXNuJ3QgY2xlYXIgKG9yIEkgbWlzdW5kZXJzdGFuZCB3
aGF0IHlvdSdyZSBzYXlpbmcKPiBhYm91dCB3b3JraW5nIG9ubHkgb25jZSkuIEknbSBub3QgYWdh
aW5zdCBhZGRpbmcgYSBnZXRfZmVhdHVyZXMgaW9jdGwsCj4gSSBqdXN0IGRvbid0IHNlZSB3aHkg
d2UnZCBhZGQgaXQgYmVmb3JlIHdlIGhhdmUgYW55IGZlYXR1cmVzPwo+IAo+IFdoZW4gd2UgZ2Fp
biB0aGUgZmlyc3QgImZlYXR1cmUiLCBjYW4ndCB3ZSBhZGQgdGhlIGdldF9mZWF0dXJlcyBpb2N0
bAo+IHRoZW4/IEZvciBGdXR1cmUgU1cgdGhhdCBrbm93cyBhYm91dCBGdXR1cmUgZmVhdHVyZXMs
ICJFTk9TWVMiIHdpbGwKPiBhbHdheXMgbWVhbiAibm8gZmVhdHVyZXMiLiBJZiBpdCBkb2Vzbid0
IGdldCBFTk9TWVMsIHRoZW4gaXQgY2FuIHVzZQo+IHRoZSBpb2N0bCB0byBmaW5kIG91dCB3aGF0
IGZlYXR1cmVzIGl0IGhhcy4KPiAKPiBPdGhlcndpc2Ugd2UncmUgYWRkaW5nIGFuIGlvY3RsIHdo
aWNoIGRvZXNuJ3QgZG8gYW55dGhpbmcsIGJhc2VkIG9uCj4gdGhlIGFzc3VtcHRpb24gdGhhdCBp
biB0aGUgZnV0dXJlIGl0IF93aWxsXyBkbyBzb21ldGhpbmcuLi4gYnV0IHdlCj4gZG9uJ3Qga25v
dyB0aGF0IHRoYXQgaXMgeWV0Li4uIGJ1dCB3ZSdyZSBwcmV0dHkgc3VyZSB3aGF0ZXZlciBpdCB3
aWxsCj4gZG8gY2FuIGJlIGRlc2NyaWJlZCB3aXRoIGEgdTY0Pwo+IAo+IFdoeSBub3Qgd2FpdCB1
bnRpbCB3ZSBrbm93IHdoYXQgd2Ugd2FudCBpdCBmb3IsIGFuZCB0aGVuIGltcGxlbWVudCBpdAo+
IHdpdGggYW4gaW50ZXJmYWNlIHdoaWNoIHdlIGtub3cgaXMgYXBwcm9wcmlhdGUgYXQgdGhhdCB0
aW1lPwoKWWVhaCBJJ20gd2l0aCBCcmlhbiwgYWRkaW5nIHRoZSBnZXRfZmVhdHVyZSBpb2N0bCB3
aGVuIHdlIG5lZWQgaXQuCk90aGVyd2lzZSBpdCdzIGdvaW5nIHRvIGJlIGJyb2tlbiBzb21laG93
IGFuZCB3ZSdsbCBpbW1lZGlhdGVseSByZWYgdG8KZ2V0X2ZlYXR1cmVzMiA6LSkKLURhbmllbAoK
PiA+IE5leHQgdXNlcnNwYWNlIHN0YXJ0cyB0byByZWx5IG9uIGtlcm5lbCB2ZXJzaW9uLCBidXQg
dGhlbiBzb21lb25lCj4gPiBiYWNrcG9ydHMgYSBmZWF0dXJlLCBkb3duIHRoZSByYWJiaXQgaG9s
ZSB3ZSBnby4KPiA+IAo+IAo+IEkgc3VwcG9zZSB0aGF0IGFkZGluZyB0aGUgZmVhdHVyZSBpb2N0
bCBsYXRlciB3b3VsZCBtZWFuIHRoYXQgaXQgbWlnaHQKPiBiZSBwb3NzaWJsZSB0byBiYWNrcG9y
dCBhIGZlYXR1cmUgd2l0aG91dCBhbHNvIGJhY2twb3J0aW5nIHRoZSBpb2N0bCwKPiBkZXBlbmRp
bmcgb24gaG93IHRoZSBwYXRjaGVzIGFyZSBzcGxpdCB1cC4gSSB0aGluayBpdCB3b3VsZCBiZSBw
cmV0dHkKPiBoYXJkIHRvIGRvIGFjY2lkZW50YWxseSB0aG91Z2guCj4gCj4gVGhhbmtzLAo+IC1C
cmlhbgo+IAo+ID4gQmUgbmljZSB0byB1c2Vyc3BhY2UgZ2l2ZSB0aGVtIGEgZmVhdHVyZXMgaW9j
dGwgdGhleSBjYW4gdXNlIHRvIGZpZ3VyZQo+ID4gb3V0IGluIGFkdmFuY2Ugd2hpY2ggb2YgdGhl
IDQgdWFwaXMgdGhlIGtlcm5lbCBzdXBwb3J0cy4KPiA+IAo+ID4gRGF2ZS4KPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApEYW5pZWwg
VmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5m
ZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
