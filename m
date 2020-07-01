Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D500211CBB
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAFA6EA4F;
	Thu,  2 Jul 2020 07:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D086E064
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 12:39:06 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id t4so7701739iln.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 05:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=EReZ9zR+8dR7+SqZwrHpYhqfU0mqXK8g1rPXbw0a8vg=;
 b=SfPRSzciQBj9U+kUBv3LL6CSEIP+OdxWA9MWlf3WVnnrT6g8Jn01dyaFA2d++YKNDu
 9BidrCCAEfQJ3gAtsDa7dZTgcbIpGYSHEZ3WgmGt5JNHu8E951cQhvJmlGrEzIba3KZH
 fbA/zKJqG0hvbHy+O8/2mM432+tkjNORD31D/eUOweRR6hXWOeBYCK3pAG4qBnu/eqF3
 NQ5vFHo794GJx5y9TG4r1COjGNkSSgzG0U9n21pHng6PNWeNijUw67x+YW/Kpw5qjELI
 WcyrtXgQcd+iWMr1Uqc+OkwHzwOFC3x/IZbUzt8mMQf9AJoTRQeLjs+dY44JU4kH2ubO
 cNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EReZ9zR+8dR7+SqZwrHpYhqfU0mqXK8g1rPXbw0a8vg=;
 b=uWOm2jUPHsnT6CItSFbknZYrlvSp6hX8sqJ5KeCBZtkyo8VH0cW71hnZY6oX2Evfiv
 TZ0fLjO77Ff/VGeUBkqs4TPFpsoMTpk10NvoX0YW6VP0qdpKPwGxuE6MpGX8RZGAbbhE
 8lrCDdr0tCVodh/oCAn83x8S1CxBHfIbW0fWtnuFbbt+z8y4XR9tp+FT19INOJeQ3CjU
 1vhPFzWX3SxbVKd3qfKpEKNI1Pri+/2HuyJsAiTpy+cfvUP5ARLp8chPb6WUt8lp0pGK
 D7fyfq47nIWU37FvtZy5KrCDTNJ7n9MhcCq6SjY0LDzk3PYlUPgLoapsHtggF0FuX/YJ
 ojgQ==
X-Gm-Message-State: AOAM532WxqmL0qkdCgrnoTbF5CBZ9AA0BlfbH9olld04BUR+mV9yox4t
 rdAUfZO+JEzBoJnWuxrcWCMBPQ==
X-Google-Smtp-Source: ABdhPJw4evjNLH6QP6FR949PBuo7Ouh6EjJX5jpIIQIDva0wjtbaOuDdYinorz4vuLNeDWslW6UmfA==
X-Received: by 2002:a92:cd4e:: with SMTP id v14mr3896335ilq.247.1593607146307; 
 Wed, 01 Jul 2020 05:39:06 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id k3sm3175065ils.8.2020.07.01.05.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 05:39:05 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1jqc12-002XBF-LP; Wed, 01 Jul 2020 09:39:04 -0300
Date: Wed, 1 Jul 2020 09:39:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
Message-ID: <20200701123904.GM25301@ziepe.ca>
References: <1593451903-30959-1-git-send-email-jianxin.xiong@intel.com>
 <20200629185152.GD25301@ziepe.ca>
 <MW3PR11MB4555A99038FA0CFC3ED80D3DE56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20200630173435.GK25301@ziepe.ca>
 <MW3PR11MB45553FA6D144BF1053571D98E56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <9b4fa0c2-1661-6011-c552-e37b05f35938@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b4fa0c2-1661-6011-c552-e37b05f35938@amd.com>
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 "Xiong, Jianxin" <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDEsIDIwMjAgYXQgMTE6MDM6MDZBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBbSAzMC4wNi4yMCB1bSAyMDo0NiBzY2hyaWViIFhpb25nLCBKaWFueGluOgo+
ID4gPiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KPiA+ID4gU2VudDogVHVl
c2RheSwgSnVuZSAzMCwgMjAyMCAxMDozNSBBTQo+ID4gPiBUbzogWGlvbmcsIEppYW54aW4gPGpp
YW54aW4ueGlvbmdAaW50ZWwuY29tPgo+ID4gPiBDYzogbGludXgtcmRtYUB2Z2VyLmtlcm5lbC5v
cmc7IERvdWcgTGVkZm9yZCA8ZGxlZGZvcmRAcmVkaGF0LmNvbT47IFN1bWl0IFNlbXdhbCA8c3Vt
aXQuc2Vtd2FsQGxpbmFyby5vcmc+OyBMZW9uIFJvbWFub3Zza3kKPiA+ID4gPGxlb25Aa2VybmVs
Lm9yZz47IFZldHRlciwgRGFuaWVsIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT47IENocmlzdGlh
biBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiA+ID4gU3ViamVjdDogUmU6IFtS
RkMgUEFUQ0ggdjIgMC8zXSBSRE1BOiBhZGQgZG1hLWJ1ZiBzdXBwb3J0Cj4gPiA+IAo+ID4gPiBP
biBUdWUsIEp1biAzMCwgMjAyMCBhdCAwNToyMTozM1BNICswMDAwLCBYaW9uZywgSmlhbnhpbiB3
cm90ZToKPiA+ID4gPiA+ID4gSGV0ZXJvZ2VuZW91cyBNZW1vcnkgTWFuYWdlbWVudCAoSE1NKSB1
dGlsaXplcwo+ID4gPiA+ID4gPiBtbXVfaW50ZXJ2YWxfbm90aWZpZXIgYW5kIFpPTkVfREVWSUNF
IHRvIHN1cHBvcnQgc2hhcmVkIHZpcnR1YWwKPiA+ID4gPiA+ID4gYWRkcmVzcyBzcGFjZSBhbmQg
cGFnZSBtaWdyYXRpb24gYmV0d2VlbiBzeXN0ZW0gbWVtb3J5IGFuZCBkZXZpY2UKPiA+ID4gPiA+
ID4gbWVtb3J5LiBITU0gZG9lc24ndCBzdXBwb3J0IHBpbm5pbmcgZGV2aWNlIG1lbW9yeSBiZWNh
dXNlIHBhZ2VzCj4gPiA+ID4gPiA+IGxvY2F0ZWQgb24gZGV2aWNlIG11c3QgYmUgYWJsZSB0byBt
aWdyYXRlIHRvIHN5c3RlbSBtZW1vcnkgd2hlbgo+ID4gPiA+ID4gPiBhY2Nlc3NlZCBieSBDUFUu
IFBlZXItdG8tcGVlciBhY2Nlc3MgaXMgcG9zc2libGUgaWYgdGhlIHBlZXIgY2FuCj4gPiA+ID4g
PiA+IGhhbmRsZSBwYWdlIGZhdWx0LiBGb3IgUkRNQSwgdGhhdCBtZWFucyB0aGUgTklDIG11c3Qg
c3VwcG9ydCBvbi1kZW1hbmQgcGFnaW5nLgo+ID4gPiA+ID4gcGVlci1wZWVyIGFjY2VzcyBpcyBj
dXJyZW50bHkgbm90IHBvc3NpYmxlIHdpdGggaG1tX3JhbmdlX2ZhdWx0KCkuCj4gPiA+ID4gQ3Vy
cmVudGx5IGhtbV9yYW5nZV9mYXVsdCgpIGFsd2F5cyBzZXRzIHRoZSBjcHUgYWNjZXNzIGZsYWcg
YW5kIGRldmljZQo+ID4gPiA+IHByaXZhdGUgcGFnZXMgYXJlIG1pZ3JhdGVkIHRvIHRoZSBzeXN0
ZW0gUkFNIGluIHRoZSBmYXVsdCBoYW5kbGVyLgo+ID4gPiA+IEhvd2V2ZXIsIGl0J3MgcG9zc2li
bGUgdG8gaGF2ZSBhIG1vZGlmaWVkIGNvZGUgZmxvdyB0byBrZWVwIHRoZSBkZXZpY2UKPiA+ID4g
PiBwcml2YXRlIHBhZ2UgaW5mbyBmb3IgdXNlIHdpdGggcGVlciB0byBwZWVyIGFjY2Vzcy4KPiA+
ID4gU29ydCBvZiwgYnV0IG9ubHkgd2l0aGluIHRoZSBzYW1lIGRldmljZSwgUkRNQSBvciBhbnl0
aGluZyBlbHNlIGdlbmVyaWMgY2FuJ3QgcmVhY2ggaW5zaWRlIGEgREVWSUNFX1BSSVZBVEUgYW5k
IGV4dHJhY3QgYW55dGhpbmcgdXNlZnVsLgo+ID4gQnV0IHBmbiBpcyBzdXBwb3NlZCB0byBiZSBh
bGwgdGhhdCBpcyBuZWVkZWQuCj4gPiAKPiA+ID4gPiA+IFNvLi4gdGhpcyBwYXRjaCBkb2Vzbid0
IHJlYWxseSBkbyBhbnl0aGluZyBuZXc/IFdlIGNvdWxkIGp1c3QgbWFrZSBhIE1SIGFnYWluc3Qg
dGhlIERNQSBidWYgbW1hcCBhbmQgZ2V0IHRvIHRoZSBzYW1lIHBsYWNlPwo+ID4gPiA+IFRoYXQn
cyByaWdodCwgdGhlIHBhdGNoIGFsb25lIGlzIGp1c3QgaGFsZiBvZiB0aGUgc3RvcnkuIFRoZQo+
ID4gPiA+IGZ1bmN0aW9uYWxpdHkgZGVwZW5kcyBvbiBhdmFpbGFiaWxpdHkgb2YgZG1hLWJ1ZiBl
eHBvcnRlciB0aGF0IGNhbiBwaW4KPiA+ID4gPiB0aGUgZGV2aWNlIG1lbW9yeS4KPiA+ID4gV2Vs
bCwgd2hhdCBkbyB5b3Ugd2FudCB0byBoYXBwZW4gaGVyZT8gVGhlIFJETUEgcGFydHMgYXJlIHJl
YXNvbmFibGUsIGJ1dCBJIGRvbid0IHdhbnQgdG8gYWRkIG5ldyBmdW5jdGlvbmFsaXR5IHdpdGhv
dXQgYSBwdXJwb3NlIC0gdGhlCj4gPiA+IG90aGVyIHBhcnRzIG5lZWQgdG8gYmUgc2V0dGxlZCBv
dXQgZmlyc3QuCj4gPiBBdCB0aGUgUkRNQSBzaWRlLCB3ZSBtYWlubHkgd2FudCB0byBjaGVjayBp
ZiB0aGUgY2hhbmdlcyBhcmUgYWNjZXB0YWJsZS4gRm9yIGV4YW1wbGUsCj4gPiB0aGUgcGFydCBh
Ym91dCBhZGRpbmcgJ2ZkJyB0byB0aGUgZGV2aWNlIG9wcyBhbmQgdGhlIGlvY3RsIGludGVyZmFj
ZS4gQWxsIHRoZSBwcmV2aW91cwo+ID4gY29tbWVudHMgYXJlIHZlcnkgaGVscGZ1bCBmb3IgdXMg
dG8gcmVmaW5lIHRoZSBwYXRjaCBzbyB0aGF0IHdlIGNhbiBiZSByZWFkeSB3aGVuCj4gPiBHUFUg
c2lkZSBzdXBwb3J0IGJlY29tZXMgYXZhaWxhYmxlLgo+ID4gCj4gPiA+IFRoZSBuZWVkIGZvciB0
aGUgZHluYW1pYyBtYXBwaW5nIHN1cHBvcnQgZm9yIGV2ZW4gdGhlIGN1cnJlbnQgRE1BIEJ1ZiBo
YWNreSBQMlAgdXNlcnMgaXMgcmVhbGx5IHRvbyBiYWQuIENhbiB5b3UgZ2V0IGFueSBHUFUgZHJp
dmVyIHRvCj4gPiA+IHN1cHBvcnQgbm9uLWR5bmFtaWMgbWFwcGluZz8KPiA+IFdlIGFyZSB3b3Jr
aW5nIG9uIGRpcmVjdCBkaXJlY3Rpb24uCj4gPiAKPiA+ID4gPiA+ID4gbWlncmF0ZSB0byBzeXN0
ZW0gUkFNLiBUaGlzIGlzIGR1ZSB0byB0aGUgbGFjayBvZiBrbm93bGVkZ2UgYWJvdXQKPiA+ID4g
PiA+ID4gd2hldGhlciB0aGUgaW1wb3J0ZXIgY2FuIHBlcmZvcm0gcGVlci10by1wZWVyIGFjY2Vz
cyBhbmQgdGhlIGxhY2sKPiA+ID4gPiA+ID4gb2YgcmVzb3VyY2UgbGltaXQgY29udHJvbCBtZWFz
dXJlIGZvciBHUFUuIEZvciB0aGUgZmlyc3QgcGFydCwgdGhlCj4gPiA+ID4gPiA+IGxhdGVzdCBk
bWEtYnVmIGRyaXZlciBoYXMgYSBwZWVyLXRvLXBlZXIgZmxhZyBmb3IgdGhlIGltcG9ydGVyLAo+
ID4gPiA+ID4gPiBidXQgdGhlIGZsYWcgaXMgY3VycmVudGx5IHRpZWQgdG8gZHluYW1pYyBtYXBw
aW5nIHN1cHBvcnQsIHdoaWNoCj4gPiA+ID4gPiA+IHJlcXVpcmVzIG9uLWRlbWFuZCBwYWdpbmcg
c3VwcG9ydCBmcm9tIHRoZSBOSUMgdG8gd29yay4KPiA+ID4gPiA+IE9EUCBmb3IgRE1BIGJ1Zj8K
PiA+ID4gPiBSaWdodC4KPiA+ID4gSHVtLiBUaGlzIGlzIG5vdCBhY3R1YWxseSBzbyBoYXJkIHRv
IGRvLiBUaGUgd2hvbGUgZG1hIGJ1ZiBwcm9wb3NhbCB3b3VsZCBtYWtlIGEgbG90IG1vcmUgc2Vu
c2UgaWYgdGhlICdkbWEgYnVmIE1SJyBoYWQgdG8gYmUgdGhlCj4gPiA+IGR5bmFtaWMga2luZCBh
bmQgdGhlIGRyaXZlciBoYWQgdG8gcHJvdmlkZSB0aGUgZmF1bHRpbmcuIEl0IHdvdWxkIG5vdCBi
ZSBzbyBoYXJkIHRvIGNoYW5nZSBtbHg1IHRvIGJlIGFibGUgdG8gd29yayBsaWtlIHRoaXMsIHBl
cmhhcHMuICh0aGUKPiA+ID4gbG9ja2luZyBtaWdodCBiZSBhIGJpdCB0cmlja3kgdGhvdWdoKQo+
ID4gVGhlIG1haW4gaXNzdWUgaXMgdGhhdCBub3QgYWxsIE5JQ3Mgc3VwcG9ydCBPRFAuCj4gCj4g
WW91IGRvbid0IG5lZWQgb24tZGVtYW5kIHBhZ2luZyBzdXBwb3J0IGZyb20gdGhlIE5JQyBmb3Ig
ZHluYW1pYyBtYXBwaW5nIHRvCj4gd29yay4KPiAKPiBBbGwgeW91IG5lZWQgaXMgdGhlIGFiaWxp
dHkgdG8gc3RvcCB3YWl0IGZvciBvbmdvaW5nIGFjY2Vzc2VzIHRvIGVuZCBhbmQKPiBtYWtlIHN1
cmUgdGhhdCBuZXcgb25lcyBncmFiIGEgbmV3IG1hcHBpbmcuCgpTd2FwIGFuZCBmbHVzaCBpc24n
dCBhIGdlbmVyYWwgSFcgYWJpbGl0eSBlaXRoZXIuLgoKSSdtIHVuY2xlYXIgaG93IHRoaXMgY291
bGQgYmUgdXNlZnVsLCBpdCBpcyBndWFyZW50ZWVkIHRvIGNvcnJ1cHQKaW4tcHJvZ3Jlc3Mgd3Jp
dGVzPwoKRGlkIHlvdSBtZWFuIHBhdXNlLCBzd2FwIGFuZCByZXN1bWU/IFRoYXQncyBPRFAuCgpK
YXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
