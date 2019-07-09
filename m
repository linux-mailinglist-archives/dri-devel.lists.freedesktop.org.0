Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE63D63C00
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 21:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0319B89D86;
	Tue,  9 Jul 2019 19:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D46389D86
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 19:37:24 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1BBB380821
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 21:37:21 +0200 (CEST)
Date: Tue, 9 Jul 2019 21:37:14 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 0/33] drm: drop use of drmp.h in drm-misc
Message-ID: <20190709193714.GA26349@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190630061922.7254-1-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=YJY2jtIU5UeJZr4N-qcA:9 a=CjuIK1q_8ugA:10
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

SGkgYWxsLgoKT24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMDg6MTg6NDlBTSArMDIwMCwgU2FtIFJh
dm5ib3JnIHdyb3RlOgo+IFRoaXMgcGF0Y2ggc2V0IHJlbW92ZXMgYSBmYXIgc2hhcmUgb2YgdGhl
IHJlbWFpbmluZyB1c2VzIG9mIGRybVAuaC4KPiBDb21tb24gZm9yIGFsbCBwYXRjaGVzIGFyZSB0
aGF0IHRoZSByZXNwZWN0aXZlIGZpbGVzIGFyZSBtYWludGFpbmVkCj4gaW4gZHJtLW1pc2MuCj4g
QWxsIHBhdGNoZXMgYXJlIGluZGVwZW5kZW50IGV4Y2VwdCBbUEFUQ0ggMzJdIGRybS9hc3QsCj4g
W1BBVENIIDMxXSBkcm0vYm9jaHMgYW5kIFtQQVRDSCAzM10gZHJtL2hpc2lsaWNvbi4KPiBUaGV5
IG5lZWQgdGhlIGZpeCB0byBkcm1fdnJhbV9tbV9oZWxwZXIuaCBbUEFUQ0ggMzBdLgo+IAo+IFBh
dGNoZXMgaGF2ZSBhbGwgYmVlbiBidWlsZCB0ZXN0ZWQgd2l0aCB2YXJpb3VzIGNvbmZpZ3MgYW5k
IHZhcmlvdXMKPiBhcmNoaXRlY3R1cmVzLgo+IFRoZXJlIGFyZSBsaWtlbHkgaW50cm9kdWNlZCBh
IGZldyBidWlsZCBpc3N1ZXMgdGhhdCByYW5kY29uZmlnCj4gYnVpbGQgd2lsbCByZXZlYWwsIGJ1
dCBmb3IgYWxsIGNvbmZpZ3MgSSBoYXZlIHVzZWQgdGhlIGJ1aWxkIHdhcyBPSy4KPiAKPiBUaGlz
IHBhdGNoc2V0IGRvZXMgbm90IGNvbmNsdWRlIHRoZSBxdWVzdCB0byBraWxsIGFsbCB1c2VzCj4g
b2YgZHJtUC5oLCBidXQgaXQgaXMgYSBtYWpvciBzdGVwIHRvd2FyZHMgdGhlIGdvYWwuCj4gCj4g
UGxlYXNlIHJldmlldy9hY2suCj4gSSBwbGFuIHRvIGFwcGx5IHRoZSBwYXRjaGVzIHRvIGRybS1t
aXNjLCBidXQgZmVlbCBmcmVlCj4gdG8gZG8gaXQgeW91cnNlbGYuCk9uIGhvbGlkYXkgdGhpcyB3
ZWVrLCB3aWxsIHByb2Nlc3MgcGF0Y2hlcyBuZXh0IHdlZWsuCgpQbGFuIHRvIGFwcGx5IHJldmll
d2VkIHBhdGNoZXMgdG8gZHJtLW1pc2MtbmV4dCBhbmQgaG9wZQp0byBoYXZlIGFsbW9zdCBhbGwg
b2YgaXQgcmVhZHkgZm9yIDUuMy4KRmluYWwgcmVtb3ZhbCBvZiBkcm1QLmggd2lsbCBiZSBhZnRl
ciA1LjMgZHVlIHRvIGRlcGVuZGVuY2llcwp3aXRoIG90aGVyIHRyZWVzLgpUaGlzIGlzIGhvdyBJ
IHNlZSBpdCBvdXRsaW5lZCBub3csIHBsYW5zIG1heSBjaGFuZ2UgYXMgcmVhbGl0eQpzdHJpa2Vz
LgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
