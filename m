Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBE7AE420
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 08:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E3B6E81F;
	Tue, 10 Sep 2019 06:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CBC89688
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 11:50:08 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id o101so12100287ota.8
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2019 04:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tYnsX9gd/pntTIlgQ4B4VyJYL3dGeU36BYiNg93weko=;
 b=sXScL1srpZ0wfRaGJu9piO+2TjbZSi7ZqFkeGfMEr0sNCAz9Ab104emximhBDYR8dN
 +BjqJBUFSOcwvFlCVnXSKQSoQ+lWd44+oCXbsqTa8WuKmJDl6jgscP3gK2LpxtZ5+E/M
 pMMm9vRUQ4J8nleJlkPUsW1EaqTorDJSXGHIwbe71rUr9y5hYwY/yiYNjKMAw4dTGunL
 pjyqWv2U8bazEtD9lbA+z8aZmDj7hsNYXT1E3AnpRg61ks7bC4U5aAN/+33WyhjNtEAR
 tefVZEiYkh/smwTAkQTTJvcJpMstlyJdZyLB4YFrpmpf7JQ2a8F7UndJhDxQj3TKR2WG
 ludg==
X-Gm-Message-State: APjAAAWi7z9nfY0JZI+111bLAqxVOBmghYFYKRvakiCuSMgJKDjuS3qu
 4AlxTNDlVZCnCNwG6Pw3MFo=
X-Google-Smtp-Source: APXvYqz81/sZ3Pkc0lWDmNidgRCXz5Zv7nL6cj+W80+6srRNn+yisnyhjFJfvIBGQa2+i/z6zOhiWw==
X-Received: by 2002:a9d:3f4b:: with SMTP id m69mr19038806otc.301.1568029807760; 
 Mon, 09 Sep 2019 04:50:07 -0700 (PDT)
Received: from sreeram-MS-7B98 (cpe-173-174-83-82.austin.res.rr.com.
 [173.174.83.82])
 by smtp.gmail.com with ESMTPSA id o4sm5379170otp.43.2019.09.09.04.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2019 04:50:07 -0700 (PDT)
Date: Mon, 9 Sep 2019 06:50:06 -0500
From: Sreeram Veluthakkal <srrmvlt@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] FBTFT: fb_agm1264k: usleep_range is preferred over udelay
Message-ID: <20190909115006.GB3437@sreeram-MS-7B98>
References: <20190909012605.15051-1-srrmvlt@gmail.com>
 <20190909095625.GB17624@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190909095625.GB17624@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 10 Sep 2019 06:57:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tYnsX9gd/pntTIlgQ4B4VyJYL3dGeU36BYiNg93weko=;
 b=Lf7NSQawSCbhe/k3IJI1TCfhjpU0Y50olZ8SjBlQ9hCwUy6fpOWWBbCPNR+hH4nrVz
 Hwxk/Tj2RIJhqJgPHUYalGiHKyto6UmbF7nSjZhaSuTalrDaESOrIi4flyE7pjp00Zmo
 NxUnJaORjgsp6P6ixx7vEhCmzYyCXctFDkPqWKKK1hKrvq6fU4W/vAJqYnXiiucZV4JL
 68bLHtzxBU1oEEaIt+GfrSrh4hsKV4uvo6OUrzebd/+9wWDCOi3nes1rCtyfokF0TQRJ
 vYJdeTYOggNaey5ZVKYmMslDrVxRrzbfGO2rCm2tENMJZik9pQbW5QGQlrJmO+ZAMVvM
 NcPA==
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 nishadkamdar@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, payal.s.kshirsagar.98@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMTA6NTY6MjVBTSArMDEwMCwgR3JlZyBLSCB3cm90ZToK
PiBPbiBTdW4sIFNlcCAwOCwgMjAxOSBhdCAwODoyNjowNVBNIC0wNTAwLCBTcmVlcmFtIFZlbHV0
aGFra2FsIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgaXNzdWU6Cj4gPiBGSUxFOiBk
cml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJfYWdtMTI2NGstZmwuYzo4ODoKPiA+IENIRUNLOiB1c2xl
ZXBfcmFuZ2UgaXMgcHJlZmVycmVkIG92ZXIgdWRlbGF5OyBzZWUgRG9jdW1lbnRhdGlvbi90aW1l
cnMvdGltZXJzLWhvd3RvLnJzdAo+ID4gKyAgICAgICB1ZGVsYXkoMjApOwo+ID4gCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBTcmVlcmFtIFZlbHV0aGFra2FsIDxzcnJtdmx0QGdtYWlsLmNvbT4KPiA+IC0t
LQo+ID4gIGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYl9hZ20xMjY0ay1mbC5jIHwgMiArLQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZiX2FnbTEyNjRrLWZsLmMgYi9kcml2
ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJfYWdtMTI2NGstZmwuYwo+ID4gaW5kZXggZWVlZWVjOTdhZDI3
Li4yZGVjZTcxZmQzYjUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJf
YWdtMTI2NGstZmwuYwo+ID4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZiX2FnbTEyNjRr
LWZsLmMKPiA+IEBAIC04NSw3ICs4NSw3IEBAIHN0YXRpYyB2b2lkIHJlc2V0KHN0cnVjdCBmYnRm
dF9wYXIgKnBhcikKPiA+ICAJZGV2X2RiZyhwYXItPmluZm8tPmRldmljZSwgIiVzKClcbiIsIF9f
ZnVuY19fKTsKPiA+ICAKPiA+ICAJZ3Bpb2Rfc2V0X3ZhbHVlKHBhci0+Z3Bpby5yZXNldCwgMCk7
Cj4gPiAtCXVkZWxheSgyMCk7Cj4gPiArCXVzbGVlcF9yYW5nZSgyMCwgNDApOwo+IAo+IElzIGl0
ICJzYWZlIiB0byB3YWl0IDQwPyAgVGhpcyBraW5kIG9mIGNoYW5nZSB5b3UgY2FuIG9ubHkgZG8g
aWYgeW91Cj4ga25vdyB0aGlzIGlzIGNvcnJlY3QuICBIYXZlIHlvdSB0ZXN0ZWQgdGhpcyB3aXRo
IGhhcmR3YXJlPwo+IAo+IHRoYW5rcywKPiAKPiBncmVnIGstaAoKSGkgR3JlZywgTm8gSSBoYXZl
bid0IHRlc3RlZCBpdCwgSSBkb24ndCBoYXZlIHRoZSBody4gSSBkdWcgZGVwZWVyIGluIHRvIHRo
ZSB1c2xlZXBfcmFuZ2UKCmh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21h
c3Rlci9rZXJuZWwvdGltZS90aW1lci5jI0wxOTkzCgl1NjQgZGVsdGEgPSAodTY0KShtYXggLSBt
aW4pICogTlNFQ19QRVJfVVNFQzsKCiAqIFRoZSBAZGVsdGEgYXJndW1lbnQgZ2l2ZXMgdGhlIGtl
cm5lbCB0aGUgZnJlZWRvbSB0byBzY2hlZHVsZSB0aGUKICogYWN0dWFsIHdha2V1cCB0byBhIHRp
bWUgdGhhdCBpcyBib3RoIHBvd2VyIGFuZCBwZXJmb3JtYW5jZSBmcmllbmRseS4KICogVGhlIGtl
cm5lbCBnaXZlIHRoZSBub3JtYWwgYmVzdCBlZmZvcnQgYmVoYXZpb3IgZm9yICJAZXhwaXJlcytA
ZGVsdGEiLAogKiBidXQgbWF5IGRlY2lkZSB0byBmaXJlIHRoZSB0aW1lciBlYXJsaWVyLCBidXQg
bm8gZWFybGllciB0aGFuIEBleHBpcmVzLgoKTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGtlZXBp
bmcgZGVsdGEgMCAobWluPW1heD0yMCkgd291bGQgYmUgZXF1aXZhbGVudC4gCkkgY2FuIHJldmlz
ZSB0aGUgcGF0Y2ggdG8gdXNsZWVwX3JhbmdlKDIwLCAyMCkgb3IgdXNsZWVwX3JhbmdlKDIwLCAy
MSkgZm9yIGEgMSB1c2VjIGRlbHRhLgpXaGF0IGRvIHlvdSBzdWdnZXN0PwoKdGhhbmtzLApTcmVl
cmFtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
