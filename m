Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BBAF9A6A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 21:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29E36E2E9;
	Tue, 12 Nov 2019 20:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73A26E2E9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 20:18:20 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-HNfekLEYM1WZ2P6uCt1s_A-1; Tue, 12 Nov 2019 15:18:16 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A98531005500;
 Tue, 12 Nov 2019 20:18:14 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D428D101E815;
 Tue, 12 Nov 2019 20:18:09 +0000 (UTC)
Date: Tue, 12 Nov 2019 15:18:08 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: Yiwei Zhang <zzyiwei@google.com>
Subject: Re: Proposal to report GPU private memory allocations with sysfs
 nodes [plain text version]
Message-ID: <20191112201808.GE31272@redhat.com>
References: <CAKT=dDnhth-6giOWgym7qpLNeH=86=XhQmPcgHM2J8B_L3myRQ@mail.gmail.com>
 <CAOWid-c_5+Z438kHpgn-h9KGt12kzoSD43nRfg0-v10NUKa+tw@mail.gmail.com>
 <CAKT=dD=Jyqn25hrZycQu96pwqcEWepjJFy2yVMyAp2RL42b+Hw@mail.gmail.com>
 <CAOWid-cy3LWHP5JZK1y_GiO_D1ioH2e4LVN-H4MruPr=dU-u=A@mail.gmail.com>
 <20191101103657.2107c6e1@eldfell.localdomain>
 <CAKT=dDmLao+P-hHrc2fsQ-7yyViFm-QFKKOEZ4D2EFobvAJLhg@mail.gmail.com>
 <20191105094719.GY10326@phenom.ffwll.local>
 <CAF6AEGsv7hJs6N6fqfcSEtHrquGyfDSBTgjWMqTp7GTEXB5o-g@mail.gmail.com>
 <CAKT=dDkOsX4L-HxtC-Ztr9FwNMn6DRKpjDD9xhRKHmkb7g5caw@mail.gmail.com>
 <CAKT=dDnZxQ0LJqSM-yHU-V7VeZOHkZMDsg9dj_QpJMnDkt-5wQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKT=dDnZxQ0LJqSM-yHU-V7VeZOHkZMDsg9dj_QpJMnDkt-5wQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: HNfekLEYM1WZ2P6uCt1s_A-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573589899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VK+5Rj1ZfTKNd2LtxtWQgHvNzgbUir2Up1CosMB6FGQ=;
 b=RBXIPYUo3stKiM4G4Do7JLplC+4vRQ6sRFTM4Ijd8/neeyQxqmai+e2Rl+48joGWpQ85jw
 BBGGjhLWaMkqq2ZXzVIqQSGxOHJu9t9Mwby4vjLe+bdPrzlBC+GsN0L40LxtQB5Mt+fDcn
 nCm2GeUeGrZ/WxgnM2RVgMtxhKfcPy4=
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
Cc: Alistair Delva <adelva@google.com>, Rohan Garg <rohan.garg@collabora.com>,
 Prahlad Kilambi <prahladk@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Kenny Ho <y2kenny@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <seanpaul@chromium.org>,
 Chris Forbes <chrisforbes@google.com>,
 Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMTA6MTc6MTBBTSAtMDgwMCwgWWl3ZWkgWmhhbmcgd3Jv
dGU6Cj4gSGkgZm9sa3MsCj4gCj4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQ6Cj4gPiBGb3IgdGhl
IHN5c2ZzIGFwcHJvYWNoLCBJJ20gYXNzdW1pbmcgdGhlIHVwc3RyZWFtIHZlbmRvcnMgc3RpbGwg
bmVlZAo+ID4gdG8gcHJvdmlkZSBhIHBhaXIgb2YgVU1EIGFuZCBLTUQsIGFuZCB0aGlzIGlvY3Rs
IHRvIGxhYmVsIHRoZSBCTyBpcwo+ID4ga2VwdCBhcyBkcml2ZXIgcHJpdmF0ZSBpb2N0bC4gVGhl
biB3aWxsIGVhY2ggZHJpdmVyIGp1c3QgZGVmaW5lIHRoZWlyCj4gPiBvd24gc2V0IG9mICJsYWJl
bCJzIGFuZCB0aGUgS01EIHdpbGwgb25seSBjb25zdW1lIHRoZSBjb3JyZXNwb25kaW5nCj4gPiBv
bmVzIHNvIHRoYXQgdGhlIHN5c2ZzIG5vZGVzIHdvbid0IGNoYW5nZSBhdCBhbGw/IFJlcG9ydCB6
ZXJvIGlmCj4gPiB0aGVyZSdzIG5vIGFsbG9jYXRpb24gb3IgcmUtdXNlIHVuZGVyIGEgcGFydGlj
dWxhciAibGFiZWwiLgoKVG8gbWUgdGhpcyBsb29rcyBsaWtlIGEgd2F5IHRvIGFidXNlIHRoZSBr
ZXJuZWwgaW50byBwcm92aWRlIGEgc3BlY2lmaWMKbWVzc2FnZSBwYXNzaW5nIEFQSSBiZXR3ZWVu
IHByb2Nlc3Mgb25seSBmb3IgR1BVLiBJdCB3b3VsZCBiZSBiZXR0ZXIgdG8KdXNlIGV4aXN0aW5n
IGtlcm5lbC91c2Vyc3BhY2UgQVBJIHRvIHBhc3MgbWVzc2FnZSBiZXR3ZWVuIHByb2Nlc3MgdGhh
bgphZGQgYSBuZXcgb25lIGp1c3QgZm9yIGEgc3BlY2lhbCBjYXNlLgoKTm90ZSB0aGF0IEkgYmVs
aWV2ZSB0aGF0IGxpc3RpbmcgR1BVIGFsbG9jYXRpb24gZm9yIGEgcHJvY2VzcyBtaWdodAp1c2Vm
dWwgYnV0IG9ubHkgaWYgaXQgaXMgYSBnZW5lcmljIHRoaW5nIGFjY3Jvc3MgYWxsIEdQVSAoZm9y
IHVwc3RyZWFtCkdQVSBkcml2ZXIgd2UgZG8gbm90IGNhcmUgYWJvdXQgbm9uIHVwc3RyZWFtKS4K
CkNoZWVycywKSsOpcsO0bWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
