Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D182F286F26
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 09:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB77189AA7;
	Thu,  8 Oct 2020 07:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726226E029
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 17:36:49 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id q26so2638140qtb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 10:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ey3YmoFgPTHM+T5ZPwxICgQJ5vkBQ0KmdtsXuWxeC1c=;
 b=cJyTco0o/X8Gh9Q8b6BPp6IdcS7VSLvnWTh3xcYJUFHbyiLWErf+iW1RZDOm9F9oY9
 /RwR5IXcdjrLUU0OXhaPFgLG8k7+Ef0dgsBndQomBoI20I5BBA+wnVg9YgfgY6tlExhJ
 GPN2ezDwTEsFX7Xe+3JJt1NoTy3V47hbuQQqb7ZxOE7Qs0x6JByqIFVEOs9dTvPQsYQc
 +nn+8vC8beQAGn1ifDdDcXjK9JilYqUSZdSn09CEzYb0FcsMaf0UaNceKgfHSfMJtgrO
 99pbN8eZQwww8IKq9rj7gOuxBmgO7TGhqfnOfXjY30NDWc4Ox8v1+I3IrM8kLatmbFcA
 5EaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ey3YmoFgPTHM+T5ZPwxICgQJ5vkBQ0KmdtsXuWxeC1c=;
 b=jRn1DmJ0I/3BQ64W9isNzF6qbflHjbhScJmcwdgROPhiJgiNbrVd+3AMfGrX6ZkhbZ
 +qlwc6nSqp/COJ4aBg8FTDya7edQy2td6jr4x2GOy4y1K2sSDkV2ggnczi51FWg6sTT1
 FzPyPK5VD+JDPAE2QFlHQwBSPcVhMPUv4UBYuIE+qcSAEh4k0ZoknJjjm1CK1ZX+uV3u
 4qasXC2hleURS4U22rI3vpJztHMITru/I86E3yazs8NeYwcRL7cWxJ4GK8yIGON5GhSH
 QrIF88tbKwYbQiyjSNu/FiGgMjcGj16FGiFFV18Rgcx8qibXgVmVDYndRB7wyGv/p/xN
 MrXQ==
X-Gm-Message-State: AOAM531IJZ3nPcDmOzdfQ7BxiOfsUr+6QDtFrTMCUotFYQpBl3u7Kd75
 1bBy2h7TEIdiodJ1415qa1qy2g==
X-Google-Smtp-Source: ABdhPJzIdI5AjZ18wbqTXo1CaYgRr7q4X6KZ4wyL31oqNFbKIHXkxY8LKkchscJ9sXfgT8LuTH1iOw==
X-Received: by 2002:ac8:33e8:: with SMTP id d37mr4225519qtb.310.1602092208628; 
 Wed, 07 Oct 2020 10:36:48 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id o4sm2006223qko.120.2020.10.07.10.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 10:36:47 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQDMt-00110d-DV; Wed, 07 Oct 2020 14:36:47 -0300
Date: Wed, 7 Oct 2020 14:36:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 11/13] mm: add unsafe_follow_pfn
Message-ID: <20201007173647.GW5177@ziepe.ca>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-12-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007164426.1812530-12-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Thu, 08 Oct 2020 07:20:54 +0000
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDcsIDIwMjAgYXQgMDY6NDQ6MjRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBXYXkgYmFjayBpdCB3YXMgYSByZWFzb25hYmxlIGFzc3VtcHRpb25zIHRoYXQgaW9t
ZW0gbWFwcGluZ3MgbmV2ZXIKPiBjaGFuZ2UgdGhlIHBmbiByYW5nZSB0aGV5IHBvaW50IGF0LiBC
dXQgdGhpcyBoYXMgY2hhbmdlZDoKPiAKPiAtIGdwdSBkcml2ZXJzIGR5bmFtaWNhbGx5IG1hbmFn
ZSB0aGVpciBtZW1vcnkgbm93YWRheXMsIGludmFsaWRhdGluZwo+IHB0ZXMgd2l0aCB1bm1hcF9t
YXBwaW5nX3JhbmdlIHdoZW4gYnVmZmVycyBnZXQgbW92ZWQKPiAKPiAtIGNvbnRpZ3VvdXMgZG1h
IGFsbG9jYXRpb25zIGhhdmUgbW92ZWQgZnJvbSBkZWRpY2F0ZWQgY2FydmV0b3V0cyB0bwo+IGNt
YSByZWdpb25zLiBUaGlzIG1lYW5zIGlmIHdlIG1pc3MgdGhlIHVubWFwIHRoZSBwZm4gbWlnaHQg
Y29udGFpbgo+IHBhZ2VjYWNoZSBvciBhbm9uIG1lbW9yeSAod2VsbCBhbnl0aGluZyBhbGxvY2F0
ZWQgd2l0aCBHRlBfTU9WRUFCTEUpCj4gCj4gLSBldmVuIC9kZXYvbWVtIG5vdyBpbnZhbGlkYXRl
cyBtYXBwaW5ncyB3aGVuIHRoZSBrZXJuZWwgcmVxdWVzdHMgdGhhdAo+IGlvbWVtIHJlZ2lvbiB3
aGVuIENPTkZJR19JT19TVFJJQ1RfREVWTUVNIGlzIHNldCwgc2VlIDMyMzRhYzY2NGE4Nwo+ICgi
L2Rldi9tZW06IFJldm9rZSBtYXBwaW5ncyB3aGVuIGEgZHJpdmVyIGNsYWltcyB0aGUgcmVnaW9u
IikKPiAKPiBBY2Nlc3NpbmcgcGZucyBvYnRhaW5lZCBmcm9tIHB0ZXMgd2l0aG91dCBob2xkaW5n
IGFsbCB0aGUgbG9ja3MgaXMKPiB0aGVyZWZvcmUgbm8gbG9uZ2VyIGEgZ29vZCBpZGVhLgo+IAo+
IFVuZm9ydHVuYXRlbHkgdGhlcmUncyBzb21lIHVzZXJzIHdoZXJlIHRoaXMgaXMgbm90IGZpeGFi
bGUgKGxpa2UgdjRsCj4gdXNlcnB0ciBvZiBpb21lbSBtYXBwaW5ncykgb3IgaW52b2x2ZXMgYSBw
aWxlIG9mIHdvcmsgKHZmaW8gdHlwZTEKPiBpb21tdSkuIEZvciBub3cgYW5ub3RhdGUgdGhlc2Ug
YXMgdW5zYWZlIGFuZCBzcGxhdCBhcHByb3ByaWF0ZWx5Lgo+IAo+IFRoaXMgcGF0Y2ggYWRkcyBh
biB1bnNhZmVfZm9sbG93X3Bmbiwgd2hpY2ggbGF0ZXIgcGF0Y2hlcyB3aWxsIHRoZW4KPiByb2xs
IG91dCB0byBhbGwgYXBwcm9wcmlhdGUgcGxhY2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBKYXNvbiBHdW50aG9ycGUg
PGpnZ0B6aWVwZS5jYT4KPiBDYzogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+Cj4g
Q2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgo+IENjOiBBbmRyZXcg
TW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IENjOiBKb2huIEh1YmJhcmQgPGpo
dWJiYXJkQG52aWRpYS5jb20+Cj4gQ2M6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQu
Y29tPgo+IENjOiBKYW4gS2FyYSA8amFja0BzdXNlLmN6Pgo+IENjOiBEYW4gV2lsbGlhbXMgPGRh
bi5qLndpbGxpYW1zQGludGVsLmNvbT4KPiBDYzogbGludXgtbW1Aa3ZhY2sub3JnCj4gQ2M6IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1zYW1zdW5nLXNv
Y0B2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6
IGt2bUB2Z2VyLmtlcm5lbC5vcmcKPiAtLS0KPiAgaW5jbHVkZS9saW51eC9tbS5oIHwgIDIgKysK
PiAgbW0vbWVtb3J5LmMgICAgICAgIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0KPiAgbW0vbm9tbXUuYyAgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKysKPiAgc2VjdXJp
dHkvS2NvbmZpZyAgIHwgMTMgKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDYzIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCk1ha2VzIHNlbnNlIHRvIG1lLgoKSSB3b25kZXIg
aWYgd2UgY291bGQgY2hhbmdlIHRoZSBvcmlnaW5hbCBmb2xsb3dfcGZuIHRvIHJlcXVpcmUgdGhl
CnB0ZXAgYW5kIHRoZW4gbG9ja2RlcF9hc3NlcnRfaGVsZCgpIGl0IGFnYWluc3QgdGhlIHBhZ2Ug
dGFibGUgbG9jaz8KCj4gK2ludCB1bnNhZmVfZm9sbG93X3BmbihzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyZXNzLAo+ICsJdW5zaWduZWQgbG9uZyAqcGZuKQo+
ICt7Cj4gKyNpZmRlZiBDT05GSUdfU1RSSUNUX0ZPTExPV19QRk4KPiArCXByX2luZm8oInVuc2Fm
ZSBmb2xsb3dfcGZuIHVzYWdlIHJlamVjdGVkLCBzZWUKPiBDT05GSUdfU1RSSUNUX0ZPTExPV19Q
Rk5cbiIpOwoKV29uZGVyIGlmIHdlIGNhbiBwcmludCBzb21ldGhpbmcgdXNlZnVsIGhlcmUsIGxp
a2UgdGhlIGN1cnJlbnQKUElEL3Byb2Nlc3MgbmFtZT8KCj4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5
L0tjb25maWcgYi9zZWN1cml0eS9LY29uZmlnCj4gaW5kZXggNzU2MWY2Zjk5ZjFkLi40ODk0NTQw
MmUxMDMgMTAwNjQ0Cj4gLS0tIGEvc2VjdXJpdHkvS2NvbmZpZwo+ICsrKyBiL3NlY3VyaXR5L0tj
b25maWcKPiBAQCAtMjMwLDYgKzIzMCwxOSBAQCBjb25maWcgU1RBVElDX1VTRVJNT0RFSEVMUEVS
X1BBVEgKPiAgCSAgSWYgeW91IHdpc2ggZm9yIGFsbCB1c2VybW9kZSBoZWxwZXIgcHJvZ3JhbXMg
dG8gYmUgZGlzYWJsZWQsCj4gIAkgIHNwZWNpZnkgYW4gZW1wdHkgc3RyaW5nIGhlcmUgKGkuZS4g
IiIpLgo+ICAKPiArY29uZmlnIFNUUklDVF9GT0xMT1dfUEZOCj4gKwlib29sICJEaXNhYmxlIHVu
c2FmZSB1c2Ugb2YgZm9sbG93X3BmbiIKPiArCWRlcGVuZHMgb24gTU1VCgpJIHdvdWxkIHByb2Jh
Ymx5IGludmVydCB0aGlzIENPTkZJR19BTExPV19VTlNBRkVfRk9MTE9XX1BGTgpkZWZhdWx0IG4K
Ckphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
