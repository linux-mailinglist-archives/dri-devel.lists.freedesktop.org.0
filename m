Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F768302770
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 17:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AD06E11C;
	Mon, 25 Jan 2021 16:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292BF6E11C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 16:05:59 +0000 (UTC)
Date: Mon, 25 Jan 2021 16:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1611590756;
 bh=F8sy6YI15yt6Oeqom1Bo70w01sQ0vkfvVR8edTIX47Y=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=UYXGcBPv9vb6F3trC8G5HZtJSkQwtGcb88IxhrB4Y0m/wFe46tdESyOAkxv3eaDyO
 hrdDI+OEZO417FnvbFxYOGvRI7kl2EDuPNhMCT5aY8x6AY1m/4b61RWZG+TzLACeH0
 owqoEceg0y/qRqIaQ8tvLCUxoST4k1tH+gnc+O9nvccSqq+FFuZbkpkXIThHVcaNnc
 I7V6TFutpbvuTbjzGJC49eHAKNA0iTV5SJillqMJRdr84mK2OhH0ue7nx5j15FzmRH
 jBptT2GukNqpk7sJ92MsjDMWrjgXcdiodhCTtKy5E9pYz5nu6jmKALaYvki0SUaYBz
 1eu3TBiZc1adA==
To: Mario Kleiner <mario.kleiner.de@gmail.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Fix HDMI_STATIC_METADATA_TYPE1 constant.
Message-ID: <7Zl9uZ-uolN1JkU8Muxro-A5gTSN2SmmxYhs9g2UYfTFCJIoZVMIdkcPBbR6nkTxb3gWSwqTAsCfnlrtNzH133HdIZ9dCYcwZchv0iXZCnA=@emersion.fr>
In-Reply-To: <CAEsyxyiK+bDyLDsk-jG3GGYWBjkGZeFamutmtDiNYvJSm4qegg@mail.gmail.com>
References: <20210124044010.18678-1-mario.kleiner.de@gmail.com>
 <86DkveYU9PqmKT4KfDgHvFG_SytoDc4EyfmehALDIJBt7oH3Arn8O97o-pQ3yRU-kfHi-RuwA9zdI-Kz1aZUQBuOSnqmz1GdrRUNPNRsEu4=@emersion.fr>
 <CAEsyxyj-dHAk0qkkpOsycqfpPi_FW5zh_58hs1gi+6h1M_b8-Q@mail.gmail.com>
 <yEq1_Ipkzm_vP4BD6cKlonRVfMbfGXrlvxOG4XDkk_wg1UkPCdLj95I8pknonGjf2Bs1zYeErr1WXerrQjprE3k1vswj3E2Nzq-imF58ytM=@emersion.fr>
 <CAEsyxyhXhJohDYuDDLoQeg-QqhnWQ953GRO0Kf6Puj=f_NkU4w@mail.gmail.com>
 <YA61Aa07PhDucMyG@intel.com>
 <-NvMjiGAV79IMWvTOWrb2u_SHe2U36XumXbITMgCCqpMVg-FcvGRJbeTHaiUwkBSxZS5XaXYziZnoTdXJENA-JYQWNi-28F01___0SsWvv0=@emersion.fr>
 <CAEsyxyiK+bDyLDsk-jG3GGYWBjkGZeFamutmtDiNYvJSm4qegg@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Uma Shankar <uma.shankar@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ4oCQIE9yaWdpbmFsIE1lc3NhZ2Ug4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ
4oCQCgpPbiBNb25kYXksIEphbnVhcnkgMjV0aCwgMjAyMSBhdCA1OjAwIFBNLCBNYXJpbyBLbGVp
bmVyIDxtYXJpby5rbGVpbmVyLmRlQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IE9uIE1vbiwgSmFuIDI1
LCAyMDIxIGF0IDE6MTQgUE0gU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPiB3cm90ZToK
Pgo+ID4gPiBUaGlzIGlzIG5vdCBhbiB1YXBpIGRlZmludGlvbiBhbnl3YXkgc28gZml4aW5nIHNo
b3VsZCBiZSBmaW5lLgo+ID4KPiA+IE9oLCBteSBiYWQsIEkgdGhvdWdodCB0aGlzIHdhcyBpbiBk
cm1fbW9kZS5oLCBidXQgaXQncyBub3QuIFRoZW4geWVhaAo+ID4KPiA+IHNob3VsZCBiZSBjb21w
bGV0ZWx5IGZpbmUgdG8gZml4IGl0Lgo+Cj4gR29vZCEgVGhlIGJlZ2lubmluZyBvZiB0aGUgZW5k
IG9mIGEgc2FkIHN0b3J5IDspLiBTbyBpIGd1ZXNzIGkgY2FuCj4gZ2V0IHlvdXIgci1iJ3MgZm9y
IGl0PwoKU29ycnksIEkgaGF2ZW4ndCB2ZXJpZmllZCB0aGF0IHRoaXMgd291bGRuJ3QgYnJlYWsg
dGhlIHdvcmxkLCBzbyBJJ20Kbm90IGNvbWZvcnRhYmxlIGdpdmluZyBhIFItYi4KCj4gV2lsbCB0
aGlzIGZpeCBwcm9wYWdhdGUgaW50byBpZ3QgYW5kIGxpYmRybT8gT3IgYXJlIHNlcGFyYXRlIGZp
eHVwIHBhdGNoZXMgbmVlZGVkPwoKTm8sIHNpbmNlIHRoaXMgaXMgbm90IHBhcnQgb2YgVUFQSS4K
Cj4gU2ltb24sIGNvdWxkIHlvdSBsZXQgdGhlIEtvZGkgZGV2cyBrbm93IGluIGNhc2UgeW91IGhh
dmUgYSBsaW5lIHRvCj4gdGhlbT8gSSBkaWRuJ3Qga25vdyB0aGF0IHRoZXJlIGlzIGV2ZW4gb25l
IG1vcmUgcmVhbC13b3JsZCBIRFIgY2xpZW50Cj4gZm9yIExpbnV4LCBhcGFydCBmcm9tIEFNRCdz
IGFtZHZsayBWdWxrYW4gZHJpdmVyLCB3aGljaCBkb2VzIHRoaW5ncwo+IHJpZ2h0IGFuZCBkb2Vz
bid0IG5lZWQgZml4aW5nLgoKU2VlbXMgbGlrZSBLb2RpIGhhcmRjb2RlcyB0aGUgYmFkIHZlcnNp
b246CgpodHRwczovL2dpdGh1Yi5jb20veGJtYy94Ym1jL2Jsb2IvYWE1YzJlNzljMDY5YmE3ZDBh
YjFkOGFkOTMwZTQyOTRiZjU1NDY4MC94Ym1jL2NvcmVzL1ZpZGVvUGxheWVyL0J1ZmZlcnMvVmlk
ZW9CdWZmZXJEUk1QUklNRS5oI0wyNAoKTWF5YmUgd2Ugc2hvdWxkIGFkZCB0aGUgZ29vZCB2ZXJz
aW9uIGluIFVBUEkgaGVhZGVyPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
