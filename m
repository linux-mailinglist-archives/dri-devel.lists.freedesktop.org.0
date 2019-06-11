Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7CC3CB88
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 14:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6F288E4B;
	Tue, 11 Jun 2019 12:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3C488E4B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 12:30:44 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k21so16488518edq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 05:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=98w8kwDvoFHXd9IwMdM47Fy1DAIHUsUmNhEulT8HBK4=;
 b=LPsUC9sVuGH2m2WrWYd+YHkIFQycDXP7hT2ampB5ev7okCGnhbXn9720McH4wEqh6S
 F5+ctpnyvp8NMCgF/vK6tBQQVTaoMfgQ5kp1b1PDvIW5GohLkpqoXDIRlSwbdhCccROQ
 XWVMdDOLSJX/VIwwA+PCAgdcSlo/QByxEL0/qyRVhX/oMm7U8FIvrvKNESwnJXsJ4P7Q
 jFiiVtLT5Vq1rvZQpT7DnSfm2PSxUQs0TXF5EWB+yM07angjpZXrtD5Wrzf/UHOhem6I
 4hbWIbAWmiCAWH0IEs4wkpV9kfSMpGVBKbIFCm46RP6hhhEzB9ThcrEg3qRZCpv+TT5w
 Zbvg==
X-Gm-Message-State: APjAAAUzOothBQ/xiY0JsurvDnqbP6Lqn0HYAcPd35q5nH8+cDd7xjrp
 UBoSCmm7IcLDfk28/WWF0OKUxg==
X-Google-Smtp-Source: APXvYqzHQupV7Rmfh5ij3V00vLmNZH3ALvTxarM+XMmPX3T/9+vt9lBZBgQcrNIWb/U3FURLETC1mw==
X-Received: by 2002:a50:8465:: with SMTP id 92mr3529325edp.151.1560256242889; 
 Tue, 11 Jun 2019 05:30:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id a9sm3781447edc.44.2019.06.11.05.30.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 05:30:40 -0700 (PDT)
Date: Tue, 11 Jun 2019 14:30:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH v2 2/2] drm/komeda: Adds komeda_kms_drop_master
Message-ID: <20190611123038.GC2458@phenom.ffwll.local>
Mail-Followup-To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Brian Starkey <Brian.Starkey@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
 nd <nd@arm.com>
References: <1560251589-31827-1-git-send-email-lowry.li@arm.com>
 <1560251589-31827-3-git-send-email-lowry.li@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560251589-31827-3-git-send-email-lowry.li@arm.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=98w8kwDvoFHXd9IwMdM47Fy1DAIHUsUmNhEulT8HBK4=;
 b=TDdftQpZMVzC4IfNr/u5BN6jeQVrrMKS019h77cvrJUOFVDKizki1g/tr26F8MSQ1q
 AO6qkfOfPQ6Yl+Ziymqed6eoJg3Un/jdD0/+RcRSsG0gKsD3mahTEkGa1ajRe0wgjIlz
 eijyc4arZLtf6hLGJtDiOguGvpspBBv2uf6bs=
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTE6MTM6NDVBTSArMDAwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBGcm9tOiAiTG93cnkgTGkgKEFybSBUZWNobm9sb2d5
IENoaW5hKSIgPExvd3J5LkxpQGFybS5jb20+Cj4gCj4gVGhlIGtvbWVkYSBpbnRlcm5hbCByZXNv
dXJjZXMgKHBpcGVsaW5lcykgYXJlIHNoYXJlZCBiZXR3ZWVuIGNydGNzLAo+IGFuZCByZXNvdXJj
ZXMgcmVsZWFzZSBieSBkaXNhYmxlX2NydGMuIFRoaXMgY29tbWl0IGlzIHdvcmtpbmcgZm9yIG9u
Y2UKPiB1c2VyIGZvcmdvdCBkaXNhYmxpbmcgY3J0YyBsaWtlIGFwcCBxdWl0IGFibm9tYWxseSwg
YW5kIHRoZW4gdGhlCj4gcmVzb3VyY2VzIGNhbiBub3QgYmUgdXNlZCBieSBhbm90aGVyIGNydGMu
IEFkZHMgZHJvcF9tYXN0ZXIgdG8KPiBzaHV0ZG93biB0aGUgZGV2aWNlIGFuZCBtYWtlIHN1cmUg
YWxsIHRoZSBrb21lZGEgcmVzb3VyY2VzIGhhdmUgYmVlbgo+IHJlbGVhc2VkIGFuZCBjYW4gYmUg
dXNlZCBmb3IgdGhlIG5leHQgdXNhZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFy
bSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgfCAxMyArKysrKysrKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKPiBpbmRleCA4NTQzODYwLi42
NDdiY2U1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfa21zLmMKPiBAQCAtNTQsMTEgKzU0LDI0IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBrb21l
ZGFfa21zX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRhdGEpCj4gIAlyZXR1cm4gc3RhdHVz
Owo+ICB9Cj4gIAo+ICsvKiBLb21lZGEgaW50ZXJuYWwgcmVzb3VyY2VzIChwaXBlbGluZXMpIGFy
ZSBzaGFyZWQgYmV0d2VlbiBjcnRjcywgYW5kIHJlc291cmNlcwo+ICsgKiBhcmUgcmVsZWFzZWQg
YnkgZGlzYWJsZV9jcnRjLiBCdXQgaWYgdXNlciBmb3JnZXQgZGlzYWJsaW5nIGNydGMgbGlrZSBh
cHAgcXVpdAo+ICsgKiBhYm5vcm1hbGx5LCB0aGUgcmVzb3VyY2VzIGNhbiBub3QgYmUgdXNlZCBi
eSBhbm90aGVyIGNydGMuCj4gKyAqIFVzZSBkcm9wX21hc3RlciB0byBzaHV0ZG93biB0aGUgZGV2
aWNlIGFuZCBtYWtlIHN1cmUgYWxsIHRoZSBrb21lZGEgcmVzb3VyY2VzCj4gKyAqIGhhdmUgYmVl
biByZWxlYXNlZCwgYW5kIGNhbiBiZSB1c2VkIGZvciB0aGUgbmV4dCB1c2FnZS4KPiArICovCgpO
by4gSWYgd2Ugd2FudCB0aGlzLCB3ZSBuZWVkIHRvIGltcGxlbWVudCB0aGlzIGFjcm9zcyBkcml2
ZXJzLCBub3Qgd2l0aApwZXItdmVuZG9yIGhhY2tzLgoKVGhlIGtlcm5lbGRvYyBzaG91bGQgaGF2
ZSBiZWVuIGEgc29saWQgaGludDogIk9ubHkgdXNlZCBieSB2bXdnZnguIgotRGFuaWVsCgo+ICtz
dGF0aWMgdm9pZCBrb21lZGFfa21zX2Ryb3BfbWFzdGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
Cj4gKwkJCQkgICBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdikKPiArewo+ICsJZHJtX2F0b21p
Y19oZWxwZXJfc2h1dGRvd24oZGV2KTsKPiArfQo+ICsKPiAgc3RhdGljIHN0cnVjdCBkcm1fZHJp
dmVyIGtvbWVkYV9rbXNfZHJpdmVyID0gewo+ICAJLmRyaXZlcl9mZWF0dXJlcyA9IERSSVZFUl9H
RU0gfCBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9BVE9NSUMgfAo+ICAJCQkgICBEUklWRVJfUFJJ
TUUgfCBEUklWRVJfSEFWRV9JUlEsCj4gIAkubGFzdGNsb3NlCQkJPSBkcm1fZmJfaGVscGVyX2xh
c3RjbG9zZSwKPiAgCS5pcnFfaGFuZGxlcgkJCT0ga29tZWRhX2ttc19pcnFfaGFuZGxlciwKPiAr
CS5tYXN0ZXJfZHJvcAkJCT0ga29tZWRhX2ttc19kcm9wX21hc3RlciwKPiAgCS5nZW1fZnJlZV9v
YmplY3RfdW5sb2NrZWQJPSBkcm1fZ2VtX2NtYV9mcmVlX29iamVjdCwKPiAgCS5nZW1fdm1fb3Bz
CQkJPSAmZHJtX2dlbV9jbWFfdm1fb3BzLAo+ICAJLmR1bWJfY3JlYXRlCQkJPSBrb21lZGFfZ2Vt
X2NtYV9kdW1iX2NyZWF0ZSwKPiAtLSAKPiAxLjkuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
