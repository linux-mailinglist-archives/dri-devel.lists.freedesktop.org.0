Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE30AE501
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 10:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CA56E85D;
	Tue, 10 Sep 2019 08:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753A66E85D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 08:00:02 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id t6so3853366otp.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 01:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7L737Jm0wUHbnu/Pe3llxROQ1ln1ETh1uPMKDGHXXWU=;
 b=jLmn7FvdOtBWRRCvInvul516f3lXjaSPVbB5v3/bN+dI1fZqJNQIL6VQMk2qPxijl9
 hXjRhR2N0IhK1mXmkdrnNKaMDvTbWSGRvSJy7eS50iUbno7kYWPJgO06OFhv0lYzxCPW
 fUbFKJtmL9vqpK4x8G2/PuqrZ1xUQ6L7f4Ag8X3QHBae2K03y1eNP6aj3tXe36bbv/qS
 8fe5pjqD6K1DDBCUG+jckSmeIqWWjzVESqaT+/t+D03cLos2vMmLdzj64NT/8sDYxbGl
 7TVHlMIiKzM7AWhlWY8iPK89btqFrtNs14zQjcw9VfhnHlv4SLZqtlN22QiVM822tJpz
 SoDQ==
X-Gm-Message-State: APjAAAVCuMPYAJrd954mfIJEmBOl8w5Fj9YvkjQkNLRXLXPq9PNUP67k
 O6jYXc7cTHRvBijOVw+YeIGOBFtwq207AL4sTl0=
X-Google-Smtp-Source: APXvYqx+ZYhRUi69F2qvCMAq3GzxxBTk+IErSzk0oKplNMkzm1lwOtKf9GkZhd5n8JtQlhUnVL2qrnsx8/SENkFM0f0=
X-Received: by 2002:a9d:32a1:: with SMTP id u30mr19940081otb.107.1568102401646; 
 Tue, 10 Sep 2019 01:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190909012605.15051-1-srrmvlt@gmail.com>
 <20190909095625.GB17624@kroah.com>
 <20190909115006.GB3437@sreeram-MS-7B98>
In-Reply-To: <20190909115006.GB3437@sreeram-MS-7B98>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Sep 2019 09:59:50 +0200
Message-ID: <CAMuHMdXz568p=GFJmz6MfuxDxA_QkLMrGcK2hG3C99ReL1fH5A@mail.gmail.com>
Subject: Re: [PATCH] FBTFT: fb_agm1264k: usleep_range is preferred over udelay
To: Sreeram Veluthakkal <srrmvlt@gmail.com>
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
Cc: driverdevel <devel@driverdev.osuosl.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 nishadkamdar@gmail.com, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 payal.s.kshirsagar.98@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3JlZXJhbSwKCk9uIFR1ZSwgU2VwIDEwLCAyMDE5IGF0IDI6MjUgQU0gU3JlZXJhbSBWZWx1
dGhha2thbCA8c3JybXZsdEBnbWFpbC5jb20+IHdyb3RlOgo+IE9uIE1vbiwgU2VwIDA5LCAyMDE5
IGF0IDEwOjU2OjI1QU0gKzAxMDAsIEdyZWcgS0ggd3JvdGU6Cj4gPiBPbiBTdW4sIFNlcCAwOCwg
MjAxOSBhdCAwODoyNjowNVBNIC0wNTAwLCBTcmVlcmFtIFZlbHV0aGFra2FsIHdyb3RlOgo+ID4g
PiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZToKPiA+ID4gRklMRTogZHJpdmVycy9zdGFnaW5n
L2ZidGZ0L2ZiX2FnbTEyNjRrLWZsLmM6ODg6Cj4gPiA+IENIRUNLOiB1c2xlZXBfcmFuZ2UgaXMg
cHJlZmVycmVkIG92ZXIgdWRlbGF5OyBzZWUgRG9jdW1lbnRhdGlvbi90aW1lcnMvdGltZXJzLWhv
d3RvLnJzdAo+ID4gPiArICAgICAgIHVkZWxheSgyMCk7Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IFNyZWVyYW0gVmVsdXRoYWtrYWwgPHNycm12bHRAZ21haWwuY29tPgoKVGhhbmtzIGZvciB5
b3VyIHBhdGNoIQoKPiA+ID4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZiX2FnbTEyNjRr
LWZsLmMKPiA+ID4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZiX2FnbTEyNjRrLWZsLmMK
PiA+ID4gQEAgLTg1LDcgKzg1LDcgQEAgc3RhdGljIHZvaWQgcmVzZXQoc3RydWN0IGZidGZ0X3Bh
ciAqcGFyKQo+ID4gPiAgICAgZGV2X2RiZyhwYXItPmluZm8tPmRldmljZSwgIiVzKClcbiIsIF9f
ZnVuY19fKTsKPiA+ID4KPiA+ID4gICAgIGdwaW9kX3NldF92YWx1ZShwYXItPmdwaW8ucmVzZXQs
IDApOwo+ID4gPiAtICAgdWRlbGF5KDIwKTsKPiA+ID4gKyAgIHVzbGVlcF9yYW5nZSgyMCwgNDAp
Owo+ID4KPiA+IElzIGl0ICJzYWZlIiB0byB3YWl0IDQwPyAgVGhpcyBraW5kIG9mIGNoYW5nZSB5
b3UgY2FuIG9ubHkgZG8gaWYgeW91Cj4gPiBrbm93IHRoaXMgaXMgY29ycmVjdC4gIEhhdmUgeW91
IHRlc3RlZCB0aGlzIHdpdGggaGFyZHdhcmU/Cj4gPgo+ID4gdGhhbmtzLAo+ID4KPiA+IGdyZWcg
ay1oCj4KPiBIaSBHcmVnLCBObyBJIGhhdmVuJ3QgdGVzdGVkIGl0LCBJIGRvbid0IGhhdmUgdGhl
IGh3LiBJIGR1ZyBkZXBlZXIgaW4gdG8gdGhlIHVzbGVlcF9yYW5nZQo+Cj4gaHR0cHM6Ly9naXRo
dWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2tlcm5lbC90aW1lL3RpbWVyLmMjTDE5
OTMKPiAgICAgICAgIHU2NCBkZWx0YSA9ICh1NjQpKG1heCAtIG1pbikgKiBOU0VDX1BFUl9VU0VD
Owo+Cj4gICogVGhlIEBkZWx0YSBhcmd1bWVudCBnaXZlcyB0aGUga2VybmVsIHRoZSBmcmVlZG9t
IHRvIHNjaGVkdWxlIHRoZQo+ICAqIGFjdHVhbCB3YWtldXAgdG8gYSB0aW1lIHRoYXQgaXMgYm90
aCBwb3dlciBhbmQgcGVyZm9ybWFuY2UgZnJpZW5kbHkuCj4gICogVGhlIGtlcm5lbCBnaXZlIHRo
ZSBub3JtYWwgYmVzdCBlZmZvcnQgYmVoYXZpb3IgZm9yICJAZXhwaXJlcytAZGVsdGEiLAo+ICAq
IGJ1dCBtYXkgZGVjaWRlIHRvIGZpcmUgdGhlIHRpbWVyIGVhcmxpZXIsIGJ1dCBubyBlYXJsaWVy
IHRoYW4gQGV4cGlyZXMuCj4KPiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQga2VlcGluZyBkZWx0
YSAwIChtaW49bWF4PTIwKSB3b3VsZCBiZSBlcXVpdmFsZW50Lgo+IEkgY2FuIHJldmlzZSB0aGUg
cGF0Y2ggdG8gdXNsZWVwX3JhbmdlKDIwLCAyMCkgb3IgdXNsZWVwX3JhbmdlKDIwLCAyMSkgZm9y
IGEgMSB1c2VjIGRlbHRhLgo+IFdoYXQgZG8geW91IHN1Z2dlc3Q/CgpQbGVhc2UgcmVhZCB0aGUg
Y29tbWVudCBhYm92ZSB0aGUgbGluZSB5b3UncmUgcmVmZXJyaW5nIHRvOgoKICogSW4gbm9uLWF0
b21pYyBjb250ZXh0IHdoZXJlIHRoZSBleGFjdCB3YWtldXAgdGltZSBpcyBmbGV4aWJsZSwgdXNl
CiAqIHVzbGVlcF9yYW5nZSgpIGluc3RlYWQgb2YgdWRlbGF5KCkuICBUaGUgc2xlZXAgaW1wcm92
ZXMgcmVzcG9uc2l2ZW5lc3MKICogYnkgYXZvaWRpbmcgdGhlIENQVS1ob2dnaW5nIGJ1c3ktd2Fp
dCBvZiB1ZGVsYXkoKSwgYW5kIHRoZSByYW5nZSByZWR1Y2VzCiAqIHBvd2VyIHVzYWdlIGJ5IGFs
bG93aW5nIGhydGltZXJzIHRvIHRha2UgYWR2YW50YWdlIG9mIGFuIGFscmVhZHktCiAqIHNjaGVk
dWxlZCBpbnRlcnJ1cHQgaW5zdGVhZCBvZiBzY2hlZHVsaW5nIGEgbmV3IG9uZSBqdXN0IGZvciB0
aGlzIHNsZWVwLgoKSXMgdGhpcyBmdW5jdGlvbiBhbHdheXMgY2FsbGVkIGluIG5vbi1hdG9taWMg
Y29udGV4dD8KSWYgaXQgIG1heSBiZSBjYWxsZWQgaW4gYXRvbWljIGNvbnRleHQsIHJlcGxhY2lu
ZyB0aGUgdWRlbGF5KCkgY2FsbCBieSBhCnVzbGVlcCooKSBjYWxsIHdpbGwgYnJlYWsgdGhlIGRy
aXZlci4KClNlZSBhbHNvICJ0aGUgZmlyc3QgYW5kIG1vc3QgaW1wb3J0YW50IHF1ZXN0aW9uIiBp
bgpEb2N1bWVudGF0aW9uL3RpbWVycy90aW1lcnMtaG93dG8ucnN0LCBhcyByZWZlcnJlZCB0byBi
eSB0aGUgY2hlY2twYXRjaC5wbAptZXNzYWdlLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
