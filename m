Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 716C9EE8D5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 20:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4B06E852;
	Mon,  4 Nov 2019 19:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DBA6E854
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 19:36:24 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id v24so10173640otp.5
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 11:36:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eXh+XyYjVt4Pkzk3hYB9YYJ9vT2OyZQipdsfPeD6n3s=;
 b=JrXQF13Sftfyrt8yTzXP3fc6PszEp4QiYnBNZEEQ6elBUZGmzWuKDW2X4o11ffSaQp
 ycO/B5vBlWbBmmEv27cG9yd7YDsIIzbVmj00D/kArqhcM+a8sWwu5oSFE5R47fStImyy
 addW8A+roiUK31mmenBDRZvewMhcON2rMZJK0IbunPp+Xyl39WniVFPi/T5nK+IaU9nz
 qz9fZFipFgYm93AP5Xy9joNgp2Xa99pIygETWGaMMvmZnqbjyomV5yOTGcmcEeqp2ueX
 6r6GzwQK51/8BFadJlR224jEb8rsJfUTXwbIJ3FdbCMxA8qwXeJuxGDjEfPpPrJ3Fjqq
 rYRw==
X-Gm-Message-State: APjAAAUGDx3Ozw9ka7mHkUeYxcEWcRHz/oyWgtcGAiyXfLpmZYAB2ukp
 BM6libSqWG1jWr8hsPVrrA57kC2zNDzvGuAolVTYNw==
X-Google-Smtp-Source: APXvYqzfbbYgLTNfmyd+UspCAlEURyP4S8sOC8DTJ2KyVYYSpmCqgONBTPwkfMiVfz9R9z9xnGRv0uSAtsP7KUaF12s=
X-Received: by 2002:a05:6830:ca:: with SMTP id
 x10mr18725811oto.221.1572896183903; 
 Mon, 04 Nov 2019 11:36:23 -0800 (PST)
MIME-Version: 1.0
References: <20191101214238.78015-1-john.stultz@linaro.org>
 <20191101214238.78015-3-john.stultz@linaro.org>
 <20191103161348.GB13344@google.com>
 <CALAqxLUhot_nceaw5zpJ7QXcsfHNL8bOV-3MOeKu9c76Tfzx=g@mail.gmail.com>
In-Reply-To: <CALAqxLUhot_nceaw5zpJ7QXcsfHNL8bOV-3MOeKu9c76Tfzx=g@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 4 Nov 2019 11:36:12 -0800
Message-ID: <CALAqxLWjFKVQ_vVYThBo0+wGgee1EXyPTcqTPHEG5cY+eZ+dJg@mail.gmail.com>
Subject: Re: [PATCH v14 2/5] dma-buf: heaps: Add heap helpers
To: Sandeep Patil <sspatil@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=eXh+XyYjVt4Pkzk3hYB9YYJ9vT2OyZQipdsfPeD6n3s=;
 b=H1lIoRWjL4OYFkpqlyx8OmO6lY+KBz2M7Mz7iGNOYJa0J54H7QwoSEcuN/GSu+2AH0
 dFTzflkEqNe4Rm8kNrdSE2dvUX/YYWqAw89dXD0sp6/NXQYXmKIaLgQQSYw3qeOqTixZ
 nVjY8fLdmXHWlXOO2x5K7YMNc6hbyXyzdBIGJvWb82qxFUpwtr0H6DjGH3wVsVGCsMJn
 BXcdZxNaLamch4iTtp5zelRitudQkMU1s5KITIfPtfTbulq9AyOfOxo84ro30uj5vvSp
 lIf0syfuOUxAlFdvPw2y1mdmxjmSgiQbKY2t/5DRtXsYywV5UNIe8IGJhNhbU/eCulSC
 qmoQ==
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>,
 sspatil+mutt@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgNCwgMjAxOSBhdCAxMTozNCBBTSBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpA
bGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIE5vdiAzLCAyMDE5IGF0IDg6MTMgQU0gPHNz
cGF0aWxAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPiBPbiBGcmksIE5vdiAwMSwgMjAxOSBhdCAwOTo0
MjozNVBNICswMDAwLCBKb2huIFN0dWx0eiB3cm90ZToKPiA+ID4gQWRkIGdlbmVyaWMgaGVscGVy
IGRtYWJ1ZiBvcHMgZm9yIGRtYSBoZWFwcywgc28gd2UgY2FuIHJlZHVjZQo+ID4gPiB0aGUgYW1v
dW50IG9mIGR1cGxpY2F0aXZlIGNvZGUgZm9yIHRoZSBleHBvcnRlZCBkbWFidWZzLgo+ID4gPgo+
ID4gPiBUaGlzIGNvZGUgaXMgYW4gZXZvbHV0aW9uIG9mIHRoZSBBbmRyb2lkIElPTiBpbXBsZW1l
bnRhdGlvbiwgc28KPiA+ID4gdGhhbmtzIHRvIGl0cyBvcmlnaW5hbCBhdXRob3JzIGFuZCBtYWlu
dGFpbnRlcnM6Cj4gPiA+ICAgUmViZWNjYSBTY2h1bHR6IFphdmluLCBDb2xpbiBDcm9zcywgTGF1
cmEgQWJib3R0LCBhbmQgb3RoZXJzIQo+ID4gPgo+ID4gPiBDYzogTGF1cmEgQWJib3R0IDxsYWJi
b3R0QHJlZGhhdC5jb20+Cj4gPiA+IENjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2Fp
Z25hcmRAbGluYXJvLm9yZz4KPiA+ID4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxp
bmFyby5vcmc+Cj4gPiA+IENjOiBMaWFtIE1hcmsgPGxtYXJrQGNvZGVhdXJvcmEub3JnPgo+ID4g
PiBDYzogUHJhdGlrIFBhdGVsIDxwcmF0aWtwQGNvZGVhdXJvcmEub3JnPgo+ID4gPiBDYzogQnJp
YW4gU3RhcmtleSA8QnJpYW4uU3RhcmtleUBhcm0uY29tPgo+ID4gPiBDYzogVmluY2VudCBEb25u
ZWZvcnQgPFZpbmNlbnQuRG9ubmVmb3J0QGFybS5jb20+Cj4gPiA+IENjOiBTdWRpcHRvIFBhdWwg
PFN1ZGlwdG8uUGF1bEBhcm0uY29tPgo+ID4gPiBDYzogQW5kcmV3IEYuIERhdmlzIDxhZmRAdGku
Y29tPgo+ID4gPiBDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPgo+ID4g
PiBDYzogQ2hlbmJvIEZlbmcgPGZlbmdjQGdvb2dsZS5jb20+Cj4gPiA+IENjOiBBbGlzdGFpciBT
dHJhY2hhbiA8YXN0cmFjaGFuQGdvb2dsZS5jb20+Cj4gPiA+IENjOiBIcmlkeWEgVmFsc2FyYWp1
IDxocmlkeWFAZ29vZ2xlLmNvbT4KPiA+ID4gQ2M6IFNhbmRlZXAgUGF0aWwgPHNzcGF0aWxAZ29v
Z2xlLmNvbT4KPiA+ID4gQ2M6IEhpbGxmIERhbnRvbiA8aGRhbnRvbkBzaW5hLmNvbT4KPiA+ID4g
Q2M6IERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4KPiA+ID4gQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gUmV2aWV3ZWQtYnk6IEJlbmphbWluIEdhaWduYXJk
IDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgo+ID4gPiBSZXZpZXdlZC1ieTogQnJpYW4g
U3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgo+ID4gPiBBY2tlZC1ieTogTGF1cmEgQWJi
b3R0IDxsYWJib3R0QHJlZGhhdC5jb20+Cj4gPiA+IFRlc3RlZC1ieTogQXlhbiBLdW1hciBIYWxk
ZXIgPGF5YW4uaGFsZGVyQGFybS5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6
IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPgo+ID4KPiA+IEkgaGF2ZSBvbmUgcXVlc3Rpb24gYW5k
IGEgbmFtaW5nIHN1Z2dlc3RpbiBiZWxvdyAoc29ycnkpLgo+ID4KPiA+IEFja2VkLWJ5OiBTYW5k
ZWVwIFBhdGlsIDxzc3BhdGlsQGFuZHJvaWQuY29tPgo+Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyB2
b2lkIGRtYV9oZWFwX2J1ZmZlcl92bWFwX3B1dChzdHJ1Y3QgaGVhcF9oZWxwZXJfYnVmZmVyICpi
dWZmZXIpCj4gPiA+ICt7Cj4gPiA+ICsgICAgIGlmICghLS1idWZmZXItPnZtYXBfY250KSB7Cj4g
Pgo+ID4gbml0OiBqdXN0IGNoZWNraW5nIGhlcmUgY2F1c2UgSSBkb24ndCBrbm93IHRoZSBvcmRl
ciBpbiB3aGljaCB2bWFwX2dldCgpIGFuZAo+ID4gdm1hcF9wdXQoKSBpcyBleHBlY3RlZCB0byBi
ZSBjYWxsZWQgZnJvbSBkbWFidWYsIHRoZSBtYW51YWwgcmVmY291bnRpbmcKPiA+IGJhc2VkIG1h
cC91bm1hcCBpcyBvaz8KPiA+Cj4gPiBJIGtub3cgaW9uIGhhZCB0aGlzIGZvciBhIHdoaWxlIGFu
ZCBpdCB3b3JrZWQgZmluZSBvdmVyIHRoZSB5ZWFycywgYnV0IEkKPiA+IGRvbid0IGtub3cgaWYg
YW55Ym9keSBzYXcgYW55IGlzc3VlcyB3aXRoIGl0LgoKU29ycnksIEkgaGl0IHNlbmQgYmVmb3Jl
IHJlcGx5aW5nIHRvIHRoaXMgYml0LiBJJ2xsIGRvdWJsZSBjaGVjayBvbiB0aGlzLgoKdGhhbmtz
IGFnYWluIGZvciB0aGUgcmV2aWV3IQotam9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
