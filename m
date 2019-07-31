Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205A77EEB6
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54236ECF4;
	Fri,  2 Aug 2019 08:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B17389BFC
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 13:46:42 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id r7so31909796pfl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 06:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RYIopWVWcpN8sf8fn3WkAJoSebITP0aCuEJMOu9tUgo=;
 b=bMTWqtnbsQYB2BSquOfMEh0m6P/qFrr9HWtNU4RRNxJoUlL15wf1MWtRl43dIRAie2
 wWkf0O1cCJV8q6MQpbMMnmpDXKpXtLzVtY0xcE7rRauybZmU1RffUqBHpwB9+V4M4g+h
 7G08Hay3XOdVa7JD8u3/3HOb9nXkwwo/T9XDjD+01Ci2+fol4Eq7Qw2XcqyKIOYZ4eMU
 Ch5K92IGRnRqd4k84G3wXbRIRgAXlMSDkbG0x7uSdmfhj1kH0Cvonk8VKecmLn91Ks0J
 Qw8DYT8OuqFemvpZ9w/nyFanMKLyZJqLl0aGSYUdzzDUGC5XU08FKzDddAnUEK8UzeES
 O1eQ==
X-Gm-Message-State: APjAAAW4hm92oCipofWmktFoH0Us3arwTvWxEiysZPopMLP/VRDTSb1V
 ffwhc8dv2OrMarhLZT5yJfs=
X-Google-Smtp-Source: APXvYqyJ632HMr8qTa4ZHPJ7wJMKy+mNNR1MgRTMRnjyHAyoRP9i2yT3EBmczwD7Wk7y+Y9PJWFOLg==
X-Received: by 2002:a63:cb4f:: with SMTP id m15mr38212861pgi.100.1564580801437; 
 Wed, 31 Jul 2019 06:46:41 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id u134sm66894809pfc.19.2019.07.31.06.46.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 06:46:40 -0700 (PDT)
Date: Wed, 31 Jul 2019 06:46:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 00/10] drivers, provide a way to add sysfs groups easily
Message-ID: <20190731134638.GD147138@dtor-ws>
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
 <20190731131045.GB147138@dtor-ws>
 <20190731133840.GN23480@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731133840.GN23480@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RYIopWVWcpN8sf8fn3WkAJoSebITP0aCuEJMOu9tUgo=;
 b=mBtfxVJW9PnBRKrB+uQBu32BkJW1DpQZK21apuGw6xkdbEf29gIZyyKKBNKsyyZm7T
 Ga8GPsjvU27IBLreAzB7a7JBLV3nGCHxyflt8fC1EwA6VwdBfXDpx/LNS41rsT+kQ8Iy
 zDWh6KkJWPSgwX3Ly9uADX1D/I/alhwGVlE8+MoaV6yis/Nx0NxQzD8Vasx70JUoBQLl
 gFz9JRgRRM3XSE5pOVNr5yNywlr8SvsPxy3La4y8RJkVKMTT6V7kF44Efel3pU/5L+0q
 wvIeY52cfH5D1V9uo9EVXnVAONdv7VVM9tng9EvnE42YXqooX738ht5TCdp+HtDTUlBG
 PDkA==
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
Cc: x86@kernel.org, linux-input@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Tony Prisk <linux@prisktech.co.nz>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Richard Gong <richard.gong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDQ6Mzg6NDBQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IE9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDA2OjEwOjQ1QU0gLTA3MDAsIERtaXRy
eSBUb3Jva2hvdiB3cm90ZToKPiA+IE9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDAyOjQzOjM5UE0g
KzAyMDAsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToKPiA+ID4gVGhpcyBwYXRjaCBvcmlnaW5h
bGx5IHN0YXJ0ZWQgb3V0IGp1c3QgYXMgYSB3YXkgZm9yIHBsYXRmb3JtIGRyaXZlcnMgdG8KPiA+
ID4gZWFzaWx5IGFkZCBhIHN5c2ZzIGdyb3VwIGluIGEgcmFjZS1mcmVlIHdheSwgYnV0IHRoYW5r
cyB0byBEbWl0cnkncwo+ID4gPiBwYXRjaCwgdGhpcyBzZXJpZXMgbm93IGlzIGZvciBhbGwgZHJp
dmVycyBpbiB0aGUga2VybmVsIChoZXksIGEgdW5pZmllZAo+ID4gPiBkcml2ZXIgbW9kZWwgd29y
a3MhISEpCj4gPiA+IAo+ID4gPiBJJ3ZlIG9ubHkgY29udmVydGVkIGEgZmV3IHBsYXRmb3JtIGRy
aXZlcnMgaGVyZSBpbiB0aGlzIHNlcmllcyB0byBzaG93Cj4gPiA+IGhvdyBpdCB3b3JrcywgYnV0
IG90aGVyIGJ1c3NlcyBjYW4gYmUgY29udmVydGVkIGFmdGVyIHRoZSBmaXJzdCBwYXRjaAo+ID4g
PiBnb2VzIGludG8gdGhlIHRyZWUuCj4gPiA+IAo+ID4gPiBIZXJlJ3MgdGhlIG9yaWdpbmFsIDAw
IG1lc3NhZ2UsIGZvciBwZW9wbGUgdG8gZ2V0IGFuIGlkZWEgb2Ygd2hhdCBpcwo+ID4gPiBnb2lu
ZyBvbiBoZXJlOgo+ID4gPiAKPiA+ID4gSWYgYSBwbGF0Zm9ybSBkcml2ZXIgd2FudHMgdG8gYWRk
IGEgc3lzZnMgZ3JvdXAsIGl0IGhhcyB0byBkbyBzbyBpbiBhCj4gPiA+IHJhY3kgd2F5LCBhZGRp
bmcgaXQgYWZ0ZXIgdGhlIGRyaXZlciBpcyBib3VuZC4gIFRvIHJlc29sdmUgdGhpcyBpc3N1ZSwK
PiA+ID4gaGF2ZSB0aGUgcGxhdGZvcm0gZHJpdmVyIGNvcmUgZG8gdGhpcyBmb3IgdGhlIGRyaXZl
ciwgbWFraW5nIHRoZQo+ID4gPiBpbmRpdmlkdWFsIGRyaXZlcnMgbG9naWMgc21hbGxlciBhbmQg
c2ltcGxlciwgYW5kIHNvbHZpbmcgdGhlIHJhY2UgYXQKPiA+ID4gdGhlIHNhbWUgdGltZS4KPiA+
ID4gCj4gPiA+IEFsbCBvZiB0aGVzZSBwYXRjaGVzIGRlcGVuZCBvbiB0aGUgZmlyc3QgcGF0Y2gu
ICBJJ2xsIHRha2UgdGhlIGZpcnN0IG9uZQo+ID4gPiB0aHJvdWdoIG15IGRyaXZlci1jb3JlIHRy
ZWUsIGFuZCBhbnkgc3Vic3lzdGVtIG1haW50YWluZXIgY2FuIGVpdGhlciBhY2sKPiA+ID4gdGhl
aXIgaW5kaXZpZHVsIHBhdGNoIGFuZCBJIHdpbGwgYmUgZ2xhZCB0byBhbHNvIG1lcmdlIGl0LCBv
ciB0aGV5IGNhbgo+ID4gPiB3YWl0IHVudGlsIGFmdGVyIDUuNC1yYzEgd2hlbiB0aGUgY29yZSBw
YXRjaCBoaXRzIExpbnVzJ3MgdHJlZSBhbmQgdGhlbgo+ID4gPiB0YWtlIGl0LCBpdCdzIHVwIHRv
IHRoZW0uCj4gPiAKPiA+IE1heWJlIG1ha2UgYW4gaW1tdXRhYmxlIGJyYW5jaCBvZmYgNS4yIHdp
dGgganVzdCBwYXRjaCAxLzEwIHNvIHRoYXQKPiA+IHN1YnN5c3RlbXMgKGFuZCB0aGUgZHJpdmVy
IGNvcmUgdHJlZSBpdHNlbGYpIGNvdWxkIHB1bGwgaXQgaW4gYXQgdGhlaXIKPiA+IGxlaXN1cmUg
aW50byB0aGVpciAiKi1uZXh0IiBicmFuY2hlcyBhbmQgZGlkIG5vdCBoYXZlIHRvIHdhaXQgdGls
bCA1LjQKPiA+IG9yIHJpc2sgbWVyZ2UgY2xhc2hlcz8KPiAKPiBJc24ndCBjaGVycnktcGljayBl
bm91Z2ggZm9yIG9uZSBwYXRjaD8KCldpdGggY2hlcnJ5LXBpY2tpbmcgeW91IHJ1biBpbnRvIHBv
dGVudGlhbCBtZXJnZSBjb25mbGljdHMgaWYgR3JlZwpjaGFuZ2VzIG1vcmUgY29kZSBpbiB0aGUg
c2FtZSBhcmVhLiBQbHVzLCBvbmNlIGV2ZXJ5dGhpbmcgaXMgbWVyZ2VkIGludG8KTGludXMnIHRy
ZWUsIHRoZXJlIHdpbGwgYmUgTiBnaXQgY29tbWl0cyBhZGRpbmcgdGhlIHNhbWUgdGhpbmcuCgpX
aXRoIGltbXV0YWJsZSBicmFuY2ggdGhlcmUgaXMgYSBzaW5nbGUgZ2l0IGNvbW1pdCwgc28gbWVy
Z2VzIGFyZQpndWFyYW50ZWVkIHRvIGJlIGNsZWFuLCB3aXRoIG5vIGNvbmZsaWN0cy4KClRoYW5r
cy4KCi0tIApEbWl0cnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
