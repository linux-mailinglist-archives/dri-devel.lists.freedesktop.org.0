Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40B2DE8A8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 11:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D4789DB4;
	Mon, 21 Oct 2019 09:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B07489D86;
 Mon, 21 Oct 2019 09:54:51 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id y3so12593071ljj.6;
 Mon, 21 Oct 2019 02:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2ioAE/lCbaDrBdD3/67QZ6qtkIsHP6zYZBRbnhn/xwg=;
 b=SklkA8l69A7C0mi1eh+rCSLLodQ+qEuRCHbYG0Sb/RmOn8JMSLXSNje28mLlurz5fa
 hZjiw8BnFH4PT7PwPgZ8gVWx2kDu9umRtYGhPjWe/J+wApWyDp3t3L8c8xla6E1nnwpy
 LtJyQq23KqVvEisAGuUANomSZ91+aXEEnu1F0Vn3VArK4GWT9HtZW1zESz7UwHuX5RVL
 NSgNjKPMeYDZGY3tTTlhnxMGLCzdghUmq2FfG6VMoEEZQCcxZeZj9qzcW/7bz4zHmNoL
 t7WQ8APGsbkRGDL+vNsQbqHYaJLoVSMRQAMttLz7xKoV3KsKONHTJfYq95oF9xXAoA2j
 bCWw==
X-Gm-Message-State: APjAAAWRz4zQkpIwMxmoOoIzelAIOAhDMVTVAYvYheNm2U0CTM5mOVPK
 CQspqO7tes3nlj3FoQHWK7U=
X-Google-Smtp-Source: APXvYqwrLwkvwRh+ERVZri6+UvM2xfVCKPFTVDTPNLnM2AZOQEhfldYGPge2KvWGIkSk8YD190DGdQ==
X-Received: by 2002:a2e:81da:: with SMTP id s26mr13975715ljg.192.1571651689431; 
 Mon, 21 Oct 2019 02:54:49 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se.
 [85.224.241.81])
 by smtp.gmail.com with ESMTPSA id c69sm11510092ljf.32.2019.10.21.02.54.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 02:54:48 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
 (envelope-from <johan@kernel.org>)
 id 1iMUOy-00005x-If; Mon, 21 Oct 2019 11:55:01 +0200
Date: Mon, 21 Oct 2019 11:55:00 +0200
From: Johan Hovold <johan@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/4] treewide: fix interrupted release
Message-ID: <20191021095500.GE24768@localhost>
References: <20191010131333.23635-1-johan@kernel.org>
 <20191010135043.GA16989@phenom.ffwll.local>
 <20191011093633.GD27819@localhost>
 <20191014084847.GD11828@phenom.ffwll.local>
 <20191014161326.GO13531@localhost>
 <20191015140726.GN11828@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015140726.GN11828@phenom.ffwll.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Al Viro <viro@zeniv.linux.org.uk>, freedreno@lists.freedesktop.org,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Johan Hovold <johan@kernel.org>,
 Fabien Dessenne <fabien.dessenne@st.com>, linux-kernel@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDQ6MDc6MjZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBNb24sIE9jdCAxNCwgMjAxOSBhdCAwNjoxMzoyNlBNICswMjAwLCBKb2hhbiBI
b3ZvbGQgd3JvdGU6Cj4gPiBPbiBNb24sIE9jdCAxNCwgMjAxOSBhdCAxMDo0ODo0N0FNICswMjAw
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgoKPiA+ID4gRG8geW91IGhhdmUgYSBsZWdpdCB1c2VjYXNl
IGZvciBpbnRlcnJ1cHRpYmxlIHNsZWVwcyBpbiBmb3BzLT5yZWxlYXNlPwo+ID4gCj4gPiBUaGUg
dHR5IGxheWVyIGRlcGVuZHMgb24gdGhpcyBmb3IgZXhhbXBsZSB3aGVuIHdhaXRpbmcgZm9yIGJ1
ZmZlcmVkCj4gPiB3cml0ZXMgdG8gY29tcGxldGUgKHNvbWV0aGluZyB3aGljaCBtYXkgbmV2ZXIg
aGFwcGVuIHdoZW4gdXNpbmcgZmxvdwo+ID4gY29udHJvbCkuCj4gPiAKPiA+ID4gSSdtIG5vdCBl
dmVuIHN1cmUga2lsbGFibGUgaXMgbGVnaXQgaW4gdGhlcmUsIHNpbmNlIGl0J3MgYW4gZmQsIG5v
dCBhCj4gPiA+IHByb2Nlc3MgY29udGV4dCAuLi4KPiA+IAo+ID4gSXQgd2lsbCBiZSBydW4gaW4g
cHJvY2VzcyBjb250ZXh0IGluIG1hbnkgY2FzZXMsIGFuZCBmb3IgdHR5cyB3ZSdyZSBnb29kCj4g
PiBBRkFJQ1QuCj4gCj4gSHVoLCByZWFkIGl0IGEgYml0LCBhbGwgdGhlIC0+c2h1dGRvd24gY2Fs
bGJhY2tzIGhhdmUgdm9pZCByZXR1cm4gdHlwZS4KPiBCdXQgdGhlcmUncyBpbmRlZWQgaW50ZXJy
dXB0aWJsZSBzbGVlcHMgaW4gdGhlcmUuIERvZXNuJ3QgdGhpcyBicmVhawo+IHVzZXJzcGFjZSB0
aGF0IGV4cGVjdHMgdGhhdCBhIGNsb3NlKCkgYWN0dWFsbHkgZmx1c2hlcyB0aGUgdHR5PwoKVGhp
cyBiZWhhdmlvdXIgaGFzIGJlZW4gdGhlcmUgc2luY2UgImZvcmV2ZXIiIHNvIHRoZSBwcm9ibGVt
IGlzIHJhdGhlcgp0aGUgb3RoZXIgd2F5IHJvdW5kOyBjaGFuZ2luZyBpdCBub3cgbWlnaHQgYnJl
YWsgdXNlciBzcGFjZS4KCj4gSW1vIGlmIHlvdSdyZSAtPnJlbGVhc2UgY2FsbGJhY2tzIGZlZWxz
IGxpa2UgaXQgc2hvdWxkIGRvIGEgd2FpdCB0bwo+IGd1YXJhbnRlZWQgc29tZXRoaW5nIHVzZXJz
cGFjZSBleHBlY3RzLCB0aGVuIGRvaW5nIGEKPiB3YWl0X2ludGVycnVwdGlibGUva2lsbGFibGUg
ZmVlbHMgbGlrZSBhIGJ1Zy4gT3IgYWx0ZXJuYXRpdmVseSwgdGhlIHdhaXQKPiBpc24ndCByZWFs
bHkgbmVlZGVkIGluIHRoZSBmaXJzdCBwbGFjZS4KClBvc2l4IHNheXMgdGhhdCB0aGUgZmluYWwg
dHR5IGNsb3NlIHNob3VsZCBjYXVzZSBhbnkgb3V0cHV0IHRvIGJlIHNlbnQuCkFuZCBhcyBtZW50
aW9uZWQgYmVmb3JlLCBkdWUgdG8gZmxvdyBjb250cm9sIHRoaXMgbWF5IG5ldmVyIGZpbmlzaC4g
U28KZm9yIHVzYWJpbGl0eSByZWFzb25zLCB5b3Ugd2FudCB0byBiZSBhYmxlIHRvIGludGVycnVw
dCB0aGF0IGZpbmFsCmNsb3NlLCB3aGlsZSByZW1vdmluZyB0aGUgZmx1c2ggY29tcGxldGVseSB3
b3VsZCBicmVhayBhcHBsaWNhdGlvbnMKY3VycmVudGx5IGV4cGVjdGluZyBvdXRwdXQgdG8gYmUg
Zmx1c2hlZC4KCkFsc28gbm90ZSB0aGF0IHdlIGhhdmUgYW4gaW50ZXJmYWNlIGZvciBjb250cm9s
bGluZyBob3cgbG9uZyB0byB3YWl0IGZvcgpkYXRhIHRvIGJlIHNlbnQgKHR5cGljYWxseSAzMCBz
IGJ5IGRlZmF1bHQsIGJ1dCBjYW4gYmUgc2V0IHRvIHdhaXQKZm9yZXZlcikuCgo+ID4gPiA+IFRo
ZSByZXR1cm4gdmFsdWUgZnJvbSByZWxlYXNlKCkgaXMgaWdub3JlZCBieSB2ZnMsIGFuZCBhZGRp
bmcgYSBzcGxhdCBpbgo+ID4gPiA+IF9fZnB1dCgpIHRvIGNhdGNoIHRoZXNlIGJ1Z2d5IGRyaXZl
cnMgbWlnaHQgYmUgb3ZlcmtpbGwuCj4gPiA+IAo+ID4gPiBJbWUgb25jZSB5b3UgaGF2ZSBhIGhh
bmRmdWwgb2YgaW5zdGFuY2VzIG9mIGEgYnJva2VuIHBhdHRlcm4sIGNyZWF0aW5nIGEKPiA+ID4g
Y2hlY2sgZm9yIGl0ICh1bmRlciBhIGRlYnVnIG9wdGlvbiBvbmx5IG9mYykgaXMgdmVyeSBtdWNo
IGp1c3RpZmllZC4KPiA+ID4gT3RoZXJ3aXNlIHRoZXkganVzdCBjb21lIGJhY2sgdG8gbGlmZSBs
aWtlIHRoZSB1bmRlYWQsIGFsbCB0aGUgdGltZS4gQW5kCj4gPiA+IHRoZXJlJ3MgYSBfbG90XyBv
ZiBmb3BzLT5yZWxlYXNlIGNhbGxiYWNrcyBpbiB0aGUga2VybmVsLgo+ID4gCj4gPiBZZWFoLCB5
b3UgaGF2ZSBhIHBvaW50Lgo+ID4gCj4gPiBCdXQgdGFrZSB0dHkgYWdhaW4gYXMgYW4gZXhhbXBs
ZSwgdGhlIGNsb3NlIHR0eSBvcGVyYXRpb24gY2FsbGVkIGZyb20KPiA+IHJlbGVhc2UoKSBpcyBk
ZWNsYXJlZCB2b2lkIHNvIHRoZXJlJ3Mgbm8gcHJvcGFnYXRlZCByZXR1cm4gdmFsdWUgZm9yIHZm
cwo+ID4gdG8gY2hlY2suCj4gPiAKPiA+IEl0IG1heSBldmVuIGJlIGJldHRlciB0byBmaXggdXAg
dGhlIDEwMCBvciBzbyBjYWxsYmFja3MgcG90ZW50aWFsbHkKPiA+IHJldHVybmluZyBub24temVy
byBhbmQgbWFrZSBmb3BzLT5yZWxlYXNlIHZvaWQgc28gdGhhdCB0aGUgY29tcGlsZXIKPiA+IHdv
dWxkIGhlbHAgdXMgY2F0Y2ggYW55IGZ1dHVyZSBidWdzIGFuZCBhbHNvIHNlcnZlIGFzIGEgaGlu
dCBmb3IKPiA+IGRldmVsb3BlcnMgdGhhdCByZXR1cm5pbmcgZXJybm9zIGZyb20gZm9wcy0+cmVs
ZWFzZSBpcyBwcm9iYWJseSBub3QKPiA+IHdoYXQgeW91IHdhbnQgdG8gZG8uCj4gPiAKPiA+IEJ1
dCB0aGF0J3MgYSBsb3Qgb2YgY2h1cm4gb2YgY291cnNlLgo+IAo+IEhtIGluZGVlZCAtPnJlbGVh
c2UgaGFzIGludCBhcyByZXR1cm4gdHlwZS4gSSBndWVzcyB0aGF0J3MgbmVlZGVkIGZvcgo+IGZp
bGUgSS9PIGVycm5vIGFuZCBzaW1pbGFyIHN0dWZmIC4uLgo+IAo+IFN0aWxsIHZvaWQgcmV0dXJu
IHZhbHVlIGRvZXNuJ3QgY2F0Y2ggZnVubnkgc3R1ZmYgbGlrZSBkb2luZyBpbnRlcnJ1cHRpYmxl
Cj4gd2FpdHMgYW5kIG9jY2FzaW9uYWxseSBmYWlsaW5nIGlmIHlvdSBoYXZlIGEgcHJvY2VzcyB0
aGF0IGxpa2VzIHRvIHVzZQo+IHNpZ25hbHMgYW5kIGFsc28gdXNlcyBzb21lIGxpYnJhcnkgc29t
ZXdoZXJlIHRvIGRvIHNvbWV0aGluZy4gSW4gZ3JhcGhpY3MKPiB3ZSBoYXZlIHRoYXQsIHdpdGgg
WG9yZyBsb3Zpbmcgc2lnbmFscyBmb3IgdmFyaW91cyB0aGluZ3MuCgpSaWdodCwgYnV0IHNpbmNl
IHRoZXJlIGFyZ3VhYmxlIGFyZSBsZWdpdGltYXRlIHVzZXMgZm9yIGludGVycnVwdGlibGUKc2xl
ZXAgYXQgcmVsZWFzZSgpLCBJIGRvbid0IHNlZSBob3cgd2UgY2FuIGNhdGNoIHRoYXQgYXQgcnVu
dGltZS4KCkpvaGFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
