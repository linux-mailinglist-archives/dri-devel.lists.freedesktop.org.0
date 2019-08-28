Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C440E9FCF2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BC8899A7;
	Wed, 28 Aug 2019 08:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5543A89A32;
 Wed, 28 Aug 2019 01:27:58 +0000 (UTC)
Received: from [2601:1c0:6200:6e8::4f71]
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i2mkf-00068z-5y; Wed, 28 Aug 2019 01:27:57 +0000
Subject: Re: mmotm 2019-08-24-16-02 uploaded (intel_drv.h header check)
To: akpm@linux-foundation.org, broonie@kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz,
 mm-commits@vger.kernel.org, sfr@canb.auug.org.au,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20190824230323.REILuVBbY%akpm@linux-foundation.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b08dbe92-8e10-aa3a-7f92-12b53ee5b368@infradead.org>
Date: Tue, 27 Aug 2019 18:27:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190824230323.REILuVBbY%akpm@linux-foundation.org>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SsIBUUgqWoBft4g1qjISTKId449C/sPPvMGvzOhucFA=; b=NL0QwD9+KL+vnxXxnHD22icys
 mAORzuHaSIFUSHIhL3+yR6+3Kw+Qw6J/6PoYN0NLBELIl+FOSjq3AKOVb+iL+oSavoNWl9TEY6MtG
 ER7D89Yy16NJQ0AGslo98M6jwxfxiSGSs7N2/iUCcAJuhq0XUj+Cql+pHW58ej07QMxahlx7gxTr3
 bZgEBi9/26cO2G+efQVHUSRUCfF2WAZ3RT2cIoL7eQvyTkU+ay4lxFe38y0ds4WEwvDUppyReQeiK
 2/B425Y0hB/FAL3qGJg25iXIW4jLLKzEd7qJOMUDbQ5Jbav0vEpQGjFjIXP+Tn6sROyOQ47FbLVNk
 zNEYwo2fg==;
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yNC8xOSA0OjAzIFBNLCBha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnIHdyb3RlOgo+IFRo
ZSBtbS1vZi10aGUtbW9tZW50IHNuYXBzaG90IDIwMTktMDgtMjQtMTYtMDIgaGFzIGJlZW4gdXBs
b2FkZWQgdG8KPiAKPiAgICBodHRwOi8vd3d3Lm96bGFicy5vcmcvfmFrcG0vbW1vdG0vCj4gCj4g
bW1vdG0tcmVhZG1lLnR4dCBzYXlzCj4gCj4gUkVBRE1FIGZvciBtbS1vZi10aGUtbW9tZW50Ogo+
IAo+IGh0dHA6Ly93d3cub3psYWJzLm9yZy9+YWtwbS9tbW90bS8KPiAKPiBUaGlzIGlzIGEgc25h
cHNob3Qgb2YgbXkgLW1tIHBhdGNoIHF1ZXVlLiAgVXBsb2FkZWQgYXQgcmFuZG9tIGhvcGVmdWxs
eQo+IG1vcmUgdGhhbiBvbmNlIGEgd2Vlay4KPiAKPiBZb3Ugd2lsbCBuZWVkIHF1aWx0IHRvIGFw
cGx5IHRoZXNlIHBhdGNoZXMgdG8gdGhlIGxhdGVzdCBMaW51cyByZWxlYXNlICg1LngKPiBvciA1
LngtcmNZKS4gIFRoZSBzZXJpZXMgZmlsZSBpcyBpbiBicm9rZW4tb3V0LnRhci5neiBhbmQgaXMg
ZHVwbGljYXRlZCBpbgo+IGh0dHA6Ly9vemxhYnMub3JnL35ha3BtL21tb3RtL3Nlcmllcwo+IAo+
IFRoZSBmaWxlIGJyb2tlbi1vdXQudGFyLmd6IGNvbnRhaW5zIHR3byBkYXRlc3RhbXAgZmlsZXM6
IC5EQVRFIGFuZAo+IC5EQVRFLXl5eXktbW0tZGQtaGgtbW0tc3MuICBCb3RoIGNvbnRhaW4gdGhl
IHN0cmluZyB5eXl5LW1tLWRkLWhoLW1tLXNzLAo+IGZvbGxvd2VkIGJ5IHRoZSBiYXNlIGtlcm5l
bCB2ZXJzaW9uIGFnYWluc3Qgd2hpY2ggdGhpcyBwYXRjaCBzZXJpZXMgaXMgdG8KPiBiZSBhcHBs
aWVkLgo+IAo+IFRoaXMgdHJlZSBpcyBwYXJ0aWFsbHkgaW5jbHVkZWQgaW4gbGludXgtbmV4dC4g
IFRvIHNlZSB3aGljaCBwYXRjaGVzIGFyZQo+IGluY2x1ZGVkIGluIGxpbnV4LW5leHQsIGNvbnN1
bHQgdGhlIGBzZXJpZXMnIGZpbGUuICBPbmx5IHRoZSBwYXRjaGVzCj4gd2l0aGluIHRoZSAjTkVY
VF9QQVRDSEVTX1NUQVJULyNORVhUX1BBVENIRVNfRU5EIG1hcmtlcnMgYXJlIGluY2x1ZGVkIGlu
Cj4gbGludXgtbmV4dC4KCm9uIHg4Nl82NCBvciBpMzg2OgoKICBDQyAgICAgIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2ludGVsX2Rydi5oLnMKSW4gZmlsZSBpbmNsdWRlZCBmcm9tIDxjb21tYW5kLWxp
bmU+OjA6MDoKLi8uLi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kcnYuaDo0MDI6MjQ6IGVy
cm9yOiBmaWVsZCDigJhmb3JjZV9hdWRpb+KAmSBoYXMgaW5jb21wbGV0ZSB0eXBlCiAgZW51bSBo
ZG1pX2ZvcmNlX2F1ZGlvIGZvcmNlX2F1ZGlvOwogICAgICAgICAgICAgICAgICAgICAgICBefn5+
fn5+fn5+fgouLy4uL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2Rydi5oOjEyMjg6MjA6IGVy
cm9yOiBmaWVsZCDigJh0Y190eXBl4oCZIGhhcyBpbmNvbXBsZXRlIHR5cGUKICBlbnVtIHRjX3Bv
cnRfdHlwZSB0Y190eXBlOwogICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KCgotLSAKflJhbmR5
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
