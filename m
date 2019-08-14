Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4F48E6D9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A1A6E8EF;
	Thu, 15 Aug 2019 08:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3373689B4D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 21:49:46 +0000 (UTC)
Received: from mail-qt1-f197.google.com ([209.85.160.197])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <alex.hung@canonical.com>)
 id 1hy19M-0002lk-Co
 for dri-devel@lists.freedesktop.org; Wed, 14 Aug 2019 21:49:44 +0000
Received: by mail-qt1-f197.google.com with SMTP id e2so557837qtm.19
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 14:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w1D8Zv52DMVI+1tJMrYZUNsEQ+/Ls5xmkyTop5o1js0=;
 b=YSO5qRM+7o4NSI8XYaHR3ol+tcgtZXEwEaQDQa++79AvA/xtnO6Jb87UHvzeYE5zpI
 jmMtvnACrRDmD92M7Px3wwy+DrRX8RYEOBmg7vFVAAifHpptIIY0Gx8mm8PWUJd2AE1Y
 65WDCOpQW6/MC62RPZXjAfFmb/O6BBQ9040VUU+bV/wcZgiq/OHCKf3cvKS5RRoi6fkT
 l97xltGxUahGWcSkfk5d4OTHIJ8qaQPKhtyLOOFHFzOIK72ISCy1dVUAePu7ZAKQbwf5
 sBrs5kLoNlh+lpD3GdPg1Y5CnLSCX6QAQ4aPwSMuR5cipooX0UvFaghKs5739wJ/YDNu
 ldzg==
X-Gm-Message-State: APjAAAUuEZtsGWtA0TuuwXiNPHiJQVGfsn/7KeJCEr1yGrVvLj590hgb
 W7y/ACdDG6gZIt59l3cSD/EqjZkuq+S/RDWIT3AuGW7v7fA1iMcMgwTlkBen4+q9MjG2TnhcmQZ
 nIzVvOidYQ1NLhOm8Q4mpa8S5NpSh+cGWjdCQIW0jUkaPfZlV9hx/G/oASxBlUg==
X-Received: by 2002:a0c:f706:: with SMTP id w6mr1203598qvn.98.1565819383602;
 Wed, 14 Aug 2019 14:49:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzcGzXZYUfIv5JuhgEy8csgt/G/+sxp+oSBTO1E+31KuR6LKUls9RsfxiIM2IRCFHVyk/GRcm+GmCe9i0bILN4=
X-Received: by 2002:a0c:f706:: with SMTP id w6mr1203573qvn.98.1565819383322;
 Wed, 14 Aug 2019 14:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
In-Reply-To: <20190814213118.28473-2-kherbst@redhat.com>
From: Alex Hung <alex.hung@canonical.com>
Date: Wed, 14 Aug 2019 15:49:32 -0600
Message-ID: <CAJ=jquaoA+_WmTJtcGq4b0A_Sb=Aw_3_TsUR-8nxJ+rJTdoFPA@mail.gmail.com>
Subject: Re: [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to enable
 dGPU direct output"
To: Karol Herbst <kherbst@redhat.com>
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
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
Cc: nouveau@lists.freedesktop.org,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB0aGUgc2VyaWVzIG9mIGZpeGVzLiBJIHdpbGwgY2hlY2sgd2hldGhlciB0aGVz
ZSBmaXhlcyB3b3JrCm9uIHRoZSBvcmlnaW5hbCBpbnRlbmRlZCBzeXN0ZW1zLgoKT24gV2VkLCBB
dWcgMTQsIDIwMTkgYXQgMzozMSBQTSBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4g
d3JvdGU6Cj4KPiBUaGlzIHJldmVydHMgY29tbWl0IDI4NTg2YTUxZWVhNjY2ZDU1MzFiY2FlZjJm
NjhlNGFiYmQ4NzI0MmMuCj4KPiBUaGUgb3JpZ2luYWwgY29tbWl0IG1lc3NhZ2UgZGlkbid0IGV2
ZW4gbWFrZSBzZW5zZS4gQU1EIF9kb2VzXyBzdXBwb3J0IGl0IGFuZAo+IGl0IHdvcmtzIHdpdGgg
Tm91dmVhdSBhcyB3ZWxsLgo+Cj4gQWxzbyB3aGF0IHdhcyB0aGUgaXNzdWUgYmVpbmcgc29sdmVk
IGhlcmU/IE5vIHJlZmVyZW5jZXMgdG8gYW55IGJ1Z3MgYW5kIG5vdAo+IGV2ZW4gZXhwbGFpbmlu
ZyBhbnkgaXNzdWUgYXQgYWxsIGlzbid0IHRoZSB3YXkgd2UgZG8gdGhpbmdzLgo+Cj4gQW5kIGV2
ZW4gaWYgaXQgbWVhbnMgYSBtdXhlZCBkZXNpZ24sIHRoZW4gdGhlIGZpeCBpcyB0byBtYWtlIGl0
IHdvcmsgaW5zaWRlIHRoZQo+IGRyaXZlciwgbm90IGFkZGluZyBzb21lIGhhY2t5IHdvcmthcm91
bmQgdGhyb3VnaCBBQ1BJIHRyaWNrcy4KPgo+IEFuZCB3aGF0IG91dCBvZiB0cmVlIGRyaXZlcnMg
ZG8gb3IgZG8gbm90IHN1cHBvcnQgd2UgZG9uJ3QgY2FyZSBvbmUgYml0IGFueXdheS4KPgo+IFNp
Z25lZC1vZmYtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgo+IENDOiBBbGV4
IEh1bmcgPGFsZXguaHVuZ0BjYW5vbmljYWwuY29tPgo+IENDOiBSYWZhZWwgSi4gV3lzb2NraSA8
cmFmYWVsLmoud3lzb2NraUBpbnRlbC5jb20+Cj4gQ0M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJl
ZGhhdC5jb20+Cj4gQ0M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gQ0M6IEJlbiBT
a2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9hY3BpL29zaS5jIHwg
NyAtLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvYWNwaS9vc2kuYyBiL2RyaXZlcnMvYWNwaS9vc2kuYwo+IGluZGV4IGJlYzBi
ZWJjN2Y1Mi4uOWIyMGFjNGQ3OWEwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYWNwaS9vc2kuYwo+
ICsrKyBiL2RyaXZlcnMvYWNwaS9vc2kuYwo+IEBAIC02MSwxMyArNjEsNiBAQCBvc2lfc2V0dXBf
ZW50cmllc1tPU0lfU1RSSU5HX0VOVFJJRVNfTUFYXSBfX2luaXRkYXRhID0gewo+ICAgICAgICAg
ICogYSBCSU9TIHdvcmthcm91bmQuCj4gICAgICAgICAgKi8KPiAgICAgICAgIHsiTGludXgtTGVu
b3ZvLU5WLUhETUktQXVkaW8iLCB0cnVlfSwKPiAtICAgICAgIC8qCj4gLSAgICAgICAgKiBMaW51
eC1IUEktSHlicmlkLUdyYXBoaWNzIGlzIHVzZWQgYnkgQklPUyB0byBlbmFibGUgZEdQVSB0bwo+
IC0gICAgICAgICogb3V0cHV0IHZpZGVvIGRpcmVjdGx5IHRvIGV4dGVybmFsIG1vbml0b3JzIG9u
IEhQIEluYy4gbW9iaWxlCj4gLSAgICAgICAgKiB3b3Jrc3RhdGlvbnMgYXMgTnZpZGlhIGFuZCBB
TUQgVkdBIGRyaXZlcnMgcHJvdmlkZSBsaW1pdGVkCj4gLSAgICAgICAgKiBoeWJyaWQgZ3JhcGhp
Y3Mgc3VwcG9ydHMuCj4gLSAgICAgICAgKi8KPiAtICAgICAgIHsiTGludXgtSFBJLUh5YnJpZC1H
cmFwaGljcyIsIHRydWV9LAo+ICB9Owo+Cj4gIHN0YXRpYyB1MzIgYWNwaV9vc2lfaGFuZGxlcihh
Y3BpX3N0cmluZyBpbnRlcmZhY2UsIHUzMiBzdXBwb3J0ZWQpCj4gLS0KPiAyLjIxLjAKPgoKCi0t
IApDaGVlcnMsCkFsZXggSHVuZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
