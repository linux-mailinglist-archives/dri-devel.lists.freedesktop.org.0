Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730627EEBD
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF8C6ECFB;
	Fri,  2 Aug 2019 08:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D4D89C2A
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 13:10:49 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id p184so31849586pfp.7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 06:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rt+guMwNhJRHRn5IfYwFQ/sgOXInz6KxTo8lw7aiy5o=;
 b=YUkg/6rdNSCeBqDBN8EU2bMBRJH2JrHYQHGz6FuTZWOwdb1zXz/EM3imGjM8pIwR8u
 qmw/36C94PYC556y28Bmo7/uwpQhUEAyTtIxwB+AtWaK5DYXF8YgxVoULiFBTjCMBNaa
 H0aIoLCF/jFbDTDUNUCRSWzlJV8/IR9SvVc4il1nKwA1esgPdCGiHo9Kj7kZr57T20te
 IYyzH6IbwjJmzr/vfwYJv2qi+EpyrEJ3ZajwgrgnF7qRYRMOBjfo4Gth1bZiTxSW4JcE
 ibGPIEfVLX1impcFuV7fmibrY/nckaWAEE6XrRCmK5tzl1RVtVV/4PhlH7eDb8y+xsVk
 waJw==
X-Gm-Message-State: APjAAAWC6IT7nsG0c4thoWdSaKZkpltWsloYXDxkb4Nf91HeZoZXRO9U
 ZuhHx7jPtHzMZ/yQgI8xErsmQv4B
X-Google-Smtp-Source: APXvYqw6zrs3C36FlP+BQfVYwpgNJ/uT+OXNK7FouVI0RYpGcs21O7mEWzL/gYHEOWg9kiuYl3v9Hg==
X-Received: by 2002:a17:90a:b908:: with SMTP id
 p8mr2967626pjr.94.1564578649195; 
 Wed, 31 Jul 2019 06:10:49 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id r12sm47427239pgb.73.2019.07.31.06.10.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 06:10:48 -0700 (PDT)
Date: Wed, 31 Jul 2019 06:10:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 00/10] drivers, provide a way to add sysfs groups easily
Message-ID: <20190731131045.GB147138@dtor-ws>
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731124349.4474-1-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rt+guMwNhJRHRn5IfYwFQ/sgOXInz6KxTo8lw7aiy5o=;
 b=gs78//H7LNShCsnjSw8NmM/oTXR89tctjqExwGarNFR1HPDda39C7FVxzEan5zMHdK
 6cB24JjcjAbQy8XtUkZodo4u6df686F71Mv/q7oDld/FoFf/tUwpH8Ya396ePXCTfD0o
 Dvgu62a6MeZYYZInpUcG3Fb+JTJxaZenxvpq3gvsy/xll4qitJKWbPeGlVPtgYnCNQLR
 EPlshKNhjkQhbqyB0pQFFls299RawuFj12qdOUx2n+J0Ko7JvNfb1x0RR0EIG+LYodIQ
 anMWP0EuZVFFnYgh1OC+Xwui/N0TFC1OY/jUToGF5CcotzxoYJGX807D8jgfAJdSfeIG
 A3ug==
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Tony Prisk <linux@prisktech.co.nz>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Richard Gong <richard.gong@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDI6NDM6MzlQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IFRoaXMgcGF0Y2ggb3JpZ2luYWxseSBzdGFydGVkIG91dCBqdXN0IGFzIGEg
d2F5IGZvciBwbGF0Zm9ybSBkcml2ZXJzIHRvCj4gZWFzaWx5IGFkZCBhIHN5c2ZzIGdyb3VwIGlu
IGEgcmFjZS1mcmVlIHdheSwgYnV0IHRoYW5rcyB0byBEbWl0cnkncwo+IHBhdGNoLCB0aGlzIHNl
cmllcyBub3cgaXMgZm9yIGFsbCBkcml2ZXJzIGluIHRoZSBrZXJuZWwgKGhleSwgYSB1bmlmaWVk
Cj4gZHJpdmVyIG1vZGVsIHdvcmtzISEhKQo+IAo+IEkndmUgb25seSBjb252ZXJ0ZWQgYSBmZXcg
cGxhdGZvcm0gZHJpdmVycyBoZXJlIGluIHRoaXMgc2VyaWVzIHRvIHNob3cKPiBob3cgaXQgd29y
a3MsIGJ1dCBvdGhlciBidXNzZXMgY2FuIGJlIGNvbnZlcnRlZCBhZnRlciB0aGUgZmlyc3QgcGF0
Y2gKPiBnb2VzIGludG8gdGhlIHRyZWUuCj4gCj4gSGVyZSdzIHRoZSBvcmlnaW5hbCAwMCBtZXNz
YWdlLCBmb3IgcGVvcGxlIHRvIGdldCBhbiBpZGVhIG9mIHdoYXQgaXMKPiBnb2luZyBvbiBoZXJl
Ogo+IAo+IElmIGEgcGxhdGZvcm0gZHJpdmVyIHdhbnRzIHRvIGFkZCBhIHN5c2ZzIGdyb3VwLCBp
dCBoYXMgdG8gZG8gc28gaW4gYQo+IHJhY3kgd2F5LCBhZGRpbmcgaXQgYWZ0ZXIgdGhlIGRyaXZl
ciBpcyBib3VuZC4gIFRvIHJlc29sdmUgdGhpcyBpc3N1ZSwKPiBoYXZlIHRoZSBwbGF0Zm9ybSBk
cml2ZXIgY29yZSBkbyB0aGlzIGZvciB0aGUgZHJpdmVyLCBtYWtpbmcgdGhlCj4gaW5kaXZpZHVh
bCBkcml2ZXJzIGxvZ2ljIHNtYWxsZXIgYW5kIHNpbXBsZXIsIGFuZCBzb2x2aW5nIHRoZSByYWNl
IGF0Cj4gdGhlIHNhbWUgdGltZS4KPiAKPiBBbGwgb2YgdGhlc2UgcGF0Y2hlcyBkZXBlbmQgb24g
dGhlIGZpcnN0IHBhdGNoLiAgSSdsbCB0YWtlIHRoZSBmaXJzdCBvbmUKPiB0aHJvdWdoIG15IGRy
aXZlci1jb3JlIHRyZWUsIGFuZCBhbnkgc3Vic3lzdGVtIG1haW50YWluZXIgY2FuIGVpdGhlciBh
Y2sKPiB0aGVpciBpbmRpdmlkdWwgcGF0Y2ggYW5kIEkgd2lsbCBiZSBnbGFkIHRvIGFsc28gbWVy
Z2UgaXQsIG9yIHRoZXkgY2FuCj4gd2FpdCB1bnRpbCBhZnRlciA1LjQtcmMxIHdoZW4gdGhlIGNv
cmUgcGF0Y2ggaGl0cyBMaW51cydzIHRyZWUgYW5kIHRoZW4KPiB0YWtlIGl0LCBpdCdzIHVwIHRv
IHRoZW0uCgpNYXliZSBtYWtlIGFuIGltbXV0YWJsZSBicmFuY2ggb2ZmIDUuMiB3aXRoIGp1c3Qg
cGF0Y2ggMS8xMCBzbyB0aGF0CnN1YnN5c3RlbXMgKGFuZCB0aGUgZHJpdmVyIGNvcmUgdHJlZSBp
dHNlbGYpIGNvdWxkIHB1bGwgaXQgaW4gYXQgdGhlaXIKbGVpc3VyZSBpbnRvIHRoZWlyICIqLW5l
eHQiIGJyYW5jaGVzIGFuZCBkaWQgbm90IGhhdmUgdG8gd2FpdCB0aWxsIDUuNApvciByaXNrIG1l
cmdlIGNsYXNoZXM/CgpUaGFua3MuCgotLSAKRG1pdHJ5Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
