Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC073A5B5
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438218935B;
	Sun,  9 Jun 2019 12:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60707891D6
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 02:12:47 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id d15so2469368qkl.4
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 19:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wpShQkLbA04ODKXzG1qE5Ho3NFfEe7GrNzFNdw8N1fw=;
 b=hvUM3g03BpQYdOXV1E8yEXnPeYf9OmomcO7i70hXYnFMYimUGoyWxsnPhRd2FDd54H
 evpLQz2rcxthKbLz1OPFPwNttkHZHYETq87N1SNpVJ6+h44NJyWWW8pUNGD6hYdd9l8S
 iMLDwGHjo/NV6ZAheFirnqroVQxvsGxY5eFPYwShBQ9rY89DaarOMddlH4COCmJbWcDe
 Ra7daDTz5kt9Rn3KGY7LWcr5ISTllAMaF7IFiJHYyyJOhy09RIvI2hfhoM04EvwqRrTF
 SwQel7V6jz+F5sYpg/IuPZeBhqNvhEGnlC2BVyHM8lU37MX7nZWhMcAuImfBT8jfNk6d
 fQLw==
X-Gm-Message-State: APjAAAXkESHY8sX+NGDoJYxeuQEKk7b0nDWYcEPjvGzClJK7GlxL8raP
 tPf8v3jYx4B5aZVMLk+1BWqU4A==
X-Google-Smtp-Source: APXvYqyopt5iGds43Rcjcs2oGVXUS/CH/C4qYinnv741RxxtwZYKZ6rAvBmMWcCM3HDewJAkVTAcCw==
X-Received: by 2002:a37:a0e:: with SMTP id 14mr28116214qkk.203.1559959966493; 
 Fri, 07 Jun 2019 19:12:46 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id e66sm2067066qtb.55.2019.06.07.19.12.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 19:12:46 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hZQqb-0002RD-KJ; Fri, 07 Jun 2019 23:12:45 -0300
Date: Fri, 7 Jun 2019 23:12:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v2 hmm 11/11] mm/hmm: Remove confusing comment and logic
 from hmm_release
Message-ID: <20190608021245.GD7844@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-12-jgg@ziepe.ca>
 <61ea869d-43d2-d1e5-dc00-cf5e3e139169@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61ea869d-43d2-d1e5-dc00-cf5e3e139169@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wpShQkLbA04ODKXzG1qE5Ho3NFfEe7GrNzFNdw8N1fw=;
 b=KdtQ5fr+UogFRN2W3gb87flKQku8+8a2uZ9C8b+1HCumdi0y4HCUEWHcLy66b1nq4X
 4SF3bP3sHcLzah/aOrL8m3PeQIXdb3olf+OcEG8F0Zk0r1dByCU7dQ8gQWxZqd1j60eD
 H0U83e9gy23Ez5x9lmNcp/2PZehCzH6iXZwD864FqkleaoYKq7DKpUhTRd/PcAfMRBck
 iRixfqYtjrFpiHJCAu53qL/zRKhqJChLVgw/2BiGOLXoHCd7CuI4Ts0aPv/9PRdPQQMD
 /Xieh3rM2sehEaWUCQZ6m5stbB/HmTeC2fa3mc/tDRN0kLoaVFwSQ0Qo87NCLb/F4KIU
 D0pQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDI6Mzc6MDdQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gCj4gT24gNi82LzE5IDExOjQ0IEFNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4g
PiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gPiAKPiA+IGhtbV9y
ZWxlYXNlKCkgaXMgY2FsbGVkIGV4YWN0bHkgb25jZSBwZXIgaG1tLiBvcHMtPnJlbGVhc2UoKSBj
YW5ub3QKPiA+IGFjY2lkZW50YWxseSB0cmlnZ2VyIGFueSBhY3Rpb24gdGhhdCB3b3VsZCByZWN1
cnNlIGJhY2sgb250bwo+ID4gaG1tLT5taXJyb3JzX3NlbS4KPiA+IAo+ID4gVGhpcyBmaXhlcyBh
IHVzZSBhZnRlci1mcmVlIHJhY2Ugb2YgdGhlIGZvcm06Cj4gPiAKPiA+ICAgICAgICAgQ1BVMCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1BVMQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBobW1fcmVsZWFzZSgpCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdXBfd3JpdGUoJmhtbS0+bWlycm9y
c19zZW0pOwo+ID4gICBobW1fbWlycm9yX3VucmVnaXN0ZXIobWlycm9yKQo+ID4gICAgZG93bl93
cml0ZSgmaG1tLT5taXJyb3JzX3NlbSk7Cj4gPiAgICB1cF93cml0ZSgmaG1tLT5taXJyb3JzX3Nl
bSk7Cj4gPiAgICBrZnJlZShtaXJyb3IpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbWlycm9yLT5vcHMtPnJlbGVhc2UobWlycm9yKQo+ID4gCj4gPiBU
aGUgb25seSB1c2VyIHdlIGhhdmUgdG9kYXkgZm9yIG9wcy0+cmVsZWFzZSBpcyBhbiBlbXB0eSBm
dW5jdGlvbiwgc28gdGhpcwo+ID4gaXMgdW5hbWJpZ3VvdXNseSBzYWZlLgo+ID4gCj4gPiBBcyBh
IGNvbnNlcXVlbmNlIG9mIHBsdWdnaW5nIHRoaXMgcmFjZSBkcml2ZXJzIGFyZSBub3QgYWxsb3dl
ZCB0bwo+ID4gcmVnaXN0ZXIvdW5yZWdpc3RlciBtaXJyb3JzIGZyb20gd2l0aGluIGEgcmVsZWFz
ZSBvcC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFu
b3guY29tPgo+IAo+IEkgYWdyZWUgd2l0aCB0aGUgYW5hbHlzaXMgYWJvdmUgYnV0IEknbSBub3Qg
c3VyZSB0aGF0IHJlbGVhc2UoKSB3aWxsCj4gYWx3YXlzIGJlIGFuIGVtcHR5IGZ1bmN0aW9uLiBJ
dCBtaWdodCBiZSBtb3JlIGVmZmljaWVudCB0byB3cml0ZSBiYWNrCj4gYWxsIGRhdGEgbWlncmF0
ZWQgdG8gYSBkZXZpY2UgImluIG9uZSBwYXNzIiBpbnN0ZWFkIG9mIHJlbHlpbmcKPiBvbiB1bm1h
cF92bWFzKCkgY2FsbGluZyBobW1fc3RhcnRfcmFuZ2VfaW52YWxpZGF0ZSgpIHBlciBWTUEuCgpT
dXJlLCBidXQgaXQgc2hvdWxkIG5vdCBiZSBhbGxvd2VkIHRvIHJlY3Vyc2UgYmFjayB0bwpobW1f
bWlycm9yX3VucmVnaXN0ZXIuCgo+IEkgdGhpbmsgdGhlIGJpZ2dlciBpc3N1ZSBpcyBwb3RlbnRp
YWwgZGVhZGxvY2tzIHdoaWxlIGNhbGxpbmcKPiBzeW5jX2NwdV9kZXZpY2VfcGFnZXRhYmxlcygp
IGFuZCB0YXNrcyBjYWxsaW5nIGhtbV9taXJyb3JfdW5yZWdpc3RlcigpOgo+Cj4gU2F5IHlvdSBo
YXZlIHRocmVlIHRocmVhZHM6Cj4gLSBUaHJlYWQgQSBpcyBpbiB0cnlfdG9fdW5tYXAoKSwgZWl0
aGVyIHdpdGhvdXQgaG9sZGluZyBtbWFwX3NlbSBvciB3aXRoCj4gbW1hcF9zZW0gaGVsZCBmb3Ig
cmVhZC4KPiAtIFRocmVhZCBCIGhhcyBzb21lIHVucmVsYXRlZCBkcml2ZXIgY2FsbGluZyBobW1f
bWlycm9yX3VucmVnaXN0ZXIoKS4KPiBUaGlzIGRvZXNuJ3QgcmVxdWlyZSBtbWFwX3NlbS4KPiAt
IFRocmVhZCBDIGlzIGFib3V0IHRvIGNhbGwgbWlncmF0ZV92bWEoKS4KPgo+IFRocmVhZCBBICAg
ICAgICAgICAgICAgIFRocmVhZCBCICAgICAgICAgICAgICAgICBUaHJlYWQgQwo+IHRyeV90b191
bm1hcCAgICAgICAgICAgIGhtbV9taXJyb3JfdW5yZWdpc3RlciAgICBtaWdyYXRlX3ZtYQo+IGht
bV9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0Cj4gZG93bl9yZWFkKG1pcnJvcnNfc2VtKQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGRvd25fd3JpdGUobWlycm9yc19zZW0pCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgLy8gQmxvY2tlZCBvbiBBCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBkZXZpY2VfbG9jawo+IGRldmljZV9sb2NrCj4gLy8gQmxv
Y2tlZCBvbiBDCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtaWdyYXRlX3ZtYSgpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBobW1faW52YWxpZGF0ZV9yYW5nZV9zCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkb3duX3JlYWQobWlycm9yc19zZW0pCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvLyBCbG9j
a2VkIG9uIEIKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC8vIERlYWRsb2NrCgpPaC4uLiB5b3Uga25vdyBJIGRpZG4ndCBrbm93IHRoaXMgYWJvdXQg
cndzZW1zIGluIGxpbnV4IHRoYXQgdGhleSBoYXZlCmEgZmFpcm5lc3MgcG9saWN5IGZvciB3cml0
ZXMgdG8gYmxvY2sgZnV0dXJlIHJlYWRzLi4KClN0aWxsLCBhdCBsZWFzdCBhcyB0aGluZ3MgYXJl
IGRlc2lnbmVkLCB0aGUgZHJpdmVyIGNhbm5vdCBob2xkIGEgbG9jawppdCBvYnRhaW5zIHVuZGVy
IHN5bmNfY3B1X2RldmljZV9wYWdldGFibGVzKCkgYW5kIG5lc3Qgb3RoZXIgdGhpbmdzIGluCnRo
YXQgbG9jay4gSXQgY2VydGFpbmx5IGNhbid0IHJlY3Vyc2UgYmFjayBpbnRvIGFueSBtbXUgbm90
aWZpZXJzCndoaWxlIGhvbGRpbmcgdGhhdCBsb2NrLiAoYXMgeW91IHBvaW50IG91dCkKClRoZSBs
b2NrIGluIHN5bmNfY3B1X2RldmljZV9wYWdldGFibGVzKCkgbmVlZHMgdG8gYmUgdmVyeSBuYXJy
b3dseQpmb2N1c2VkIG9uIHVwZGF0aW5nIGRldmljZSBzdGF0ZSBvbmx5LgoKU28sIG15IGZpcnN0
IHJlYWN0aW9uIGlzIHRoYXQgdGhlIGRyaXZlciBpbiB0aHJlYWQgQyBpcyB3cm9uZywgYW5kCm5l
ZWRzIGEgZGlmZmVyZW50IGxvY2tpbmcgc2NoZW1lLiBJIHRoaW5rIHlvdSdkIGhhdmUgdG8gbWFr
ZSBhIHJlYWxseQpnb29kIGNhc2UgdGhhdCB0aGVyZSBpcyBubyBhbHRlcm5hdGl2ZSBmb3IgYSBk
cml2ZXIuLgoKPiBQZXJoYXBzIHdlIHNob3VsZCBjb25zaWRlciB1c2luZyBTUkNVIGZvciB3YWxr
aW5nIHRoZSBtaXJyb3ItPmxpc3Q/CgpJdCBtZWFucyB0aGUgZHJpdmVyIGhhcyB0byBkZWFsIHdp
dGggcmFjZXMgbGlrZSBpbiB0aGlzIHBhdGNoCmRlc2NyaXB0aW9uLiBBdCB0aGF0IHBvaW50IHRo
ZXJlIGlzIGFsbW9zdCBubyByZWFzb24gdG8gaW5zZXJ0IGhtbQpoZXJlLCBqdXN0IHVzZSBtbXUg
bm90aWZpZXJzIGRpcmVjdGx5LgoKRHJpdmVycyB3b24ndCBnZXQgdGhpcyByaWdodCwgaXQgaXMg
dG9vIGhhcmQuCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
