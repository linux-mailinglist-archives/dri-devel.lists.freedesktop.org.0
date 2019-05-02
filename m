Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 128EE12538
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 01:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6B18917E;
	Thu,  2 May 2019 23:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FA88917E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 23:45:41 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id w130so2725849oie.6
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 16:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ylV5gAlOXI2nFNZnhMPfqqvANEP1/evAl3taiRkcInQ=;
 b=APlE7tgyeUnKPUWJtasrmBv6mh9NcPXcAJAbEL8uoeyxkOzr3F81UwJXOIUn3Vz7TX
 doaNb3kKHTb+lChkyFAg2i9VPReMhrcgcBhoPinzdcZJYHnvKOwnzzfTg6Um4na1DRZz
 GC+0d+UaCqn+2ZkUfPmJoX0ZQnJcSNh1jfqMoqs3YIA+oZXnqDkZtTErJAm8J/Y6Bx6J
 Hsz/EjZXQ6MC75n8AqOk59483YnlR23/aFIzOH22gGae9AhTfDOT38DbCB8pDKaSCC6e
 /U54oODjplCPPIwre/XKoqClRJ7PUq3cU0cBOdnny2O0aIaKPIT/degHU/so58W83LBl
 ud8Q==
X-Gm-Message-State: APjAAAWYJahqixhFnwxf11qd6c5uXnPilYEp/nVOtIWUiQEIDoKelIpi
 9mViuwjmWpvyLxRI72Ak+406dfVlhhKpn1q6mjyGFA==
X-Google-Smtp-Source: APXvYqza1ahwn/TDeWwW8NfzPMf/2RsvBcbxrAIWRnpkKGe/w6LvErCEtGQm7aaUbxq8tyCdcrjFzojfQN03A2rWnss=
X-Received: by 2002:aca:57d8:: with SMTP id l207mr4208582oib.44.1556840740661; 
 Thu, 02 May 2019 16:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-13-brendanhiggins@google.com>
 <20190502110220.GD12416@kroah.com>
 <CAFd5g47t=EdLKFCT=CnPkrM2z0nDVo24Gz4j0VxFOJbARP37Lg@mail.gmail.com>
 <a49c5088-a821-210c-66de-f422536f5b01@gmail.com>
In-Reply-To: <a49c5088-a821-210c-66de-f422536f5b01@gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 2 May 2019 16:45:29 -0700
Message-ID: <CAFd5g44iWRchQKdJYtjRtPY6e-6e0eXpKXXsx5Ooi6sWE474KA@mail.gmail.com>
Subject: Re: [PATCH v2 12/17] kunit: tool: add Python wrappers for running
 KUnit tests
To: Frank Rowand <frowand.list@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ylV5gAlOXI2nFNZnhMPfqqvANEP1/evAl3taiRkcInQ=;
 b=OrjlPAypoDuLTmMWabsyH76U4J0Mgjkpr3DQnHBX1C/sWw9dQWGJZqdGNPLs+jVmSg
 c3bYyd65ExNrwdSzAF9/C3j2TwsTXUxo6mYRYKux2ifXavoN2kS9n00OiZWShZJ2VN9E
 Jey0nYLCGUng4+ySvL4+XGzNZ7sYP4XCUNcymRLj9xf6jLOnFx+3mvowrkn0pYKwRyZg
 3M2fA5czV+OipZELphNhEy5iD2t61ukDrrNzVoHA9OjKJNH0VGnLzAHCbuiCf9QjtvzN
 IDmzum+SPe0jeiAShs/g76LnFAxiI2OcVPBTp+1OnYkCXtTKkvmMFQSC+CcJJLS2aj7L
 YRtg==
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
Cc: Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Kevin Hilman <khilman@baylibre.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCAyOjE2IFBNIEZyYW5rIFJvd2FuZCA8ZnJvd2FuZC5saXN0
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiA1LzIvMTkgMTE6MDcgQU0sIEJyZW5kYW4gSGlnZ2lu
cyB3cm90ZToKPiA+IE9uIFRodSwgTWF5IDIsIDIwMTkgYXQgNDowMiBBTSBHcmVnIEtIIDxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBPbiBXZWQsIE1heSAwMSwg
MjAxOSBhdCAwNDowMToyMVBNIC0wNzAwLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gPj4+IEZy
b206IEZlbGl4IEd1byA8ZmVsaXhndW94aXVwaW5nQGdtYWlsLmNvbT4KPiA+Pj4KPiA+Pj4gVGhl
IHVsdGltYXRlIGdvYWwgaXMgdG8gY3JlYXRlIG1pbmltYWwgaXNvbGF0ZWQgdGVzdCBiaW5hcmll
czsgaW4gdGhlCj4gPj4+IG1lYW50aW1lIHdlIGFyZSB1c2luZyBVTUwgdG8gcHJvdmlkZSB0aGUg
aW5mcmFzdHJ1Y3R1cmUgdG8gcnVuIHRlc3RzLCBzbwo+ID4+PiBkZWZpbmUgYW4gYWJzdHJhY3Qg
d2F5IHRvIGNvbmZpZ3VyZSBhbmQgcnVuIHRlc3RzIHRoYXQgYWxsb3cgdXMgdG8KPiA+Pj4gY2hh
bmdlIHRoZSBjb250ZXh0IGluIHdoaWNoIHRlc3RzIGFyZSBidWlsdCB3aXRob3V0IGFmZmVjdGlu
ZyB0aGUgdXNlci4KPiA+Pj4gVGhpcyBhbHNvIG1ha2VzIHByZXR0eSBhbmQgZHluYW1pYyBlcnJv
ciByZXBvcnRpbmcsIGFuZCBhIGxvdCBvZiBvdGhlcgo+ID4+PiBuaWNlIGZlYXR1cmVzIGVhc2ll
ci4KPiA+Pj4KPiA+Pj4ga3VuaXRfY29uZmlnLnB5Ogo+ID4+PiAgIC0gcGFyc2UgLmNvbmZpZyBh
bmQgS2NvbmZpZyBmaWxlcy4KPiA+Pj4KPiA+Pj4ga3VuaXRfa2VybmVsLnB5OiBwcm92aWRlcyBo
ZWxwZXIgZnVuY3Rpb25zIHRvOgo+ID4+PiAgIC0gY29uZmlndXJlIHRoZSBrZXJuZWwgdXNpbmcg
a3VuaXRjb25maWcuCj4gPj4+ICAgLSBidWlsZCB0aGUga2VybmVsIHdpdGggdGhlIGFwcHJvcHJp
YXRlIGNvbmZpZ3VyYXRpb24uCj4gPj4+ICAgLSBwcm92aWRlIGZ1bmN0aW9uIHRvIGludm9rZSB0
aGUga2VybmVsIGFuZCBzdHJlYW0gdGhlIG91dHB1dCBiYWNrLgo+ID4+Pgo+ID4+PiBTaWduZWQt
b2ZmLWJ5OiBGZWxpeCBHdW8gPGZlbGl4Z3VveGl1cGluZ0BnbWFpbC5jb20+Cj4gPj4+IFNpZ25l
ZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiA+
Pgo+ID4+IEFoLCBoZXJlJ3MgcHJvYmFibHkgbXkgYW5zd2VyIHRvIG15IHByZXZpb3VzIGxvZ2dp
bmcgZm9ybWF0IHF1ZXN0aW9uLAo+ID4+IHJpZ2h0PyAgV2hhdCdzIHRoZSBjaGFuY2UgdGhhdCB0
aGVzZSB3cmFwcGVycyBvdXRwdXQgc3R1ZmYgaW4gYSBzdGFuZGFyZAo+ID4+IGZvcm1hdCB0aGF0
IHRlc3QtZnJhbWV3b3JrLXRvb2xzIGNhbiBhbHJlYWR5IHBhcnNlPyAgOikKClRvIGJlIGNsZWFy
LCB0aGUgdGVzdC1mcmFtZXdvcmstdG9vbHMgZm9ybWF0IHdlIGFyZSB0YWxraW5nIGFib3V0IGlz
ClRBUDEzWzFdLCBjb3JyZWN0PwoKTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGlzIHdoYXQga3Nl
bGZ0ZXN0IGlzIGJlaW5nIGNvbnZlcnRlZCB0byB1c2UuCgo+ID4KPiA+IEl0IHNob3VsZCBiZSBw
cmV0dHkgZWFzeSB0byBkby4gSSBoYWQgc29tZSBwYXRjaGVzIHRoYXQgcGFjayB1cCB0aGUKPiA+
IHJlc3VsdHMgaW50byBhIHNlcmlhbGl6ZWQgZm9ybWF0IGZvciBhIHByZXN1Ym1pdCBzZXJ2aWNl
OyBpdCBzaG91bGQgYmUKPiA+IHByZXR0eSBzdHJhaWdodGZvcndhcmQgdG8gdGFrZSB0aGUgc2Ft
ZSBsb2dpYyBhbmQganVzdCBjaGFuZ2UgdGhlCj4gPiBvdXRwdXQgZm9ybWF0Lgo+Cj4gV2hlbiBl
eGFtaW5pbmcgYW5kIHRyeWluZyBvdXQgdGhlIHByZXZpb3VzIHZlcnNpb25zIG9mIHRoZSBwYXRj
aCBJIGZvdW5kCj4gdGhlIHdyYXBwZXJzIHVzZWZ1bCB0byBwcm92aWRlIGluZm9ybWF0aW9uIGFi
b3V0IGhvdyB0byBjb250cm9sIGFuZCB1c2UKPiB0aGUgdGVzdHMsIGJ1dCBJIGhhZCBubyBpbnRl
cmVzdCBpbiB1c2luZyB0aGUgc2NyaXB0cyBhcyB0aGV5IGRvIG5vdAo+IGZpdCBpbiB3aXRoIG15
IHBlcnNvbmFsIGVudmlyb25tZW50IGFuZCB3b3JrZmxvdy4KPgo+IEluIHRoZSBwcmV2aW91cyB2
ZXJzaW9ucyBvZiB0aGUgcGF0Y2gsIHRoZXNlIGhlbHBlciBzY3JpcHRzIGFyZSBvcHRpb25hbCwK
PiB3aGljaCBpcyBnb29kIGZvciBteSB1c2UgY2FzZS4gIElmIHRoZSBoZWxwZXIgc2NyaXB0cyBh
cmUgcmVxdWlyZWQgdG8KClRoZXkgYXJlIHN0aWxsIG9wdGlvbmFsLgoKPiBnZXQgdGhlIGRhdGEg
aW50byB0aGUgcHJvcGVyIGZvcm1hdCB0aGVuIHRoZSBzY3JpcHRzIGFyZSBub3QgcXVpdGUgc28K
PiBvcHRpb25hbCwgdGhleSBiZWNvbWUgdGhlIGV4cGVjdGVkIGVudmlyb25tZW50LiAgSSB0aGlu
ayB0aGUgcHJvcGVyCj4gZm9ybWF0IHNob3VsZCBleGlzdCB3aXRob3V0IHRoZSBoZWxwZXIgc2Ny
aXB0cy4KClRoYXQncyBhIGdvb2QgcG9pbnQuIEEgY291cGxlIHRoaW5ncywKCkZpcnN0IG9mZiwg
c3VwcG9ydGluZyBUQVAxMywgZWl0aGVyIGluIHRoZSBrZXJuZWwgb3IgdGhlIHdyYXBwZXIKc2Ny
aXB0IGlzIG5vdCBoYXJkLCBidXQgSSBkb24ndCB0aGluayB0aGF0IGlzIHRoZSByZWFsIGlzc3Vl
IHRoYXQgeW91CnJhaXNlLgoKSWYgeW91ciBvbmx5IGNvbmNlcm4gaXMgdGhhdCB5b3Ugd2lsbCBh
bHdheXMgYmUgYWJsZSB0byBoYXZlIGh1bWFuCnJlYWRhYmxlIEtVbml0IHJlc3VsdHMgcHJpbnRl
ZCB0byB0aGUga2VybmVsIGxvZywgdGhhdCBpcyBhIGd1YXJhbnRlZQpJIGZlZWwgY29tZm9ydGFi
bGUgbWFraW5nLiBCZXlvbmQgdGhhdCwgSSB0aGluayBpdCBpcyBnb2luZyB0byB0YWtlIGEKbG9u
ZyB3aGlsZSBiZWZvcmUgSSB3b3VsZCBmZWVsIGNvbWZvcnRhYmxlIGd1YXJhbnRlZWluZyBhbnl0
aGluZyBhYm91dApob3cgd2lsbCBLVW5pdCB3b3JrLCB3aGF0IGtpbmQgb2YgZGF0YSBpdCB3aWxs
IHdhbnQgdG8gZXhwb3NlLCBhbmQgaG93Cml0IHdpbGwgYmUgb3JnYW5pemVkLiBJIHRoaW5rIHRo
ZSB3cmFwcGVyIHNjcmlwdCBwcm92aWRlcyBhIG5pY2UKZmFjYWRlIHRoYXQgSSBjYW4gbWFpbnRh
aW4sIGNhbiBtZWRpYXRlIGJldHdlZW4gdGhlIGltcGxlbWVudGF0aW9uCmRldGFpbHMgYW5kIHRo
ZSB1c2VyLCBhbmQgY2FuIG1lZGlhdGUgYmV0d2VlbiB0aGUgaW1wbGVtZW50YXRpb24KZGV0YWls
cyBhbmQgb3RoZXIgcGllY2VzIG9mIHNvZnR3YXJlIHRoYXQgbWlnaHQgd2FudCB0byBjb25zdW1l
CnJlc3VsdHMuCgpbMV0gaHR0cHM6Ly90ZXN0YW55dGhpbmcub3JnL3RhcC12ZXJzaW9uLTEzLXNw
ZWNpZmljYXRpb24uaHRtbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
