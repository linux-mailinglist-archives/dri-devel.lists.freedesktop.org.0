Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C318AC36A6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 16:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6FF6E7BD;
	Tue,  1 Oct 2019 14:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB79B6E7BD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 14:07:43 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53091
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <noralf@tronnes.org>)
 id 1iFIoX-0005Hl-Hu; Tue, 01 Oct 2019 16:07:41 +0200
Subject: Re: [1/3] drm/tinydrm/Kconfig: Remove menuconfig DRM_TINYDRM
To: Jason Gunthorpe <jgg@ziepe.ca>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
References: <20190725105132.22545-2-noralf@tronnes.org>
 <20191001123636.GA8351@ziepe.ca>
 <1fffe7b1-a738-a9e3-ea5f-9d696cb98650@tronnes.org>
 <20191001134555.GB22532@ziepe.ca>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <75055e2d-44f7-0cba-4e41-537097b73c3c@tronnes.org>
Date: Tue, 1 Oct 2019 16:07:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001134555.GB22532@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rOjfo7iJ4xoMy2FlBmLPoZd36TFqOKu/PofJxwLAs94=; b=hLKxiNOM+CvmkVJdUgOpZdVqk7
 T8kZfCetAhjDYNh+86H1QZYhq+O/dn9qAhU7qulKa2/yu1PujQ7nzteV3yX/GFeg0bfyws4FvWT7B
 tUYNfpMIqJmLRJceVhx4VkU70HsU9sePFt/mw9s7axURiK38VIilR5MoijU6LFnli0aSrKHRgYGfI
 p7VqEFX/IeGDGq6kAan+Of479Iw7NTPmkarUmvNbfAgQHYqLksMw3RMVd6znWJwaPjsrly2X8lyJy
 8tEVi7hk1V59irTFyckLRA4xK9tz4ZtP2uvRElon67VK+iSp1eTonr2YUPbGz76ji0oUnLL0HDis6
 u49hQ+xQ==;
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hdegoede@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgZHJtLW1pc2MgbWFpbnRhaW5lcnMsCgpJIGhhdmUganVzdCBhcHBsaWVkIGEgcGF0Y2ggdG8g
ZHJtLW1pc2MtbmV4dCB0aGF0IGFzIGl0IHR1cm5zIG91dCBzaG91bGQKaGF2ZSBiZWVuIGFwcGxp
ZWQgdG8gLWZpeGVzIGZvciB0aGlzIC1yYyBjeWNsZS4KClNob3VsZCBJIGNoZXJyeSBwaWNrIGl0
IHRvIGRybS1taXNjLW5leHQtZml4ZXM/CihJIGtub3cgdGhlcmUncyBhIGZsb3djaGFydCBpbiB0
aGUgZG9jcyBidXQgSSd2ZSBuZXZlciByZWFsbHkgdW5kZXJzdG9vZAppdC4pCgpOb3JhbGYuCgpE
ZW4gMDEuMTAuMjAxOSAxNS40NSwgc2tyZXYgSmFzb24gR3VudGhvcnBlOgo+IE9uIFR1ZSwgT2N0
IDAxLCAyMDE5IGF0IDAzOjI4OjQ2UE0gKzAyMDAsIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPj4K
Pj4KPj4gRGVuIDAxLjEwLjIwMTkgMTQuMzYsIHNrcmV2IEphc29uIEd1bnRob3JwZToKPj4+IE9u
IFRodSwgSnVsIDI1LCAyMDE5IGF0IDEyOjUxOjMwUE0gKzAyMDAsIE5vcmFsZiBUcsO4bm5lcyB3
cm90ZToKPj4+PiBUaGlzIG1ha2VzIHRoZSB0aW55IGRyaXZlcnMgdmlzaWJsZSBieSBkZWZhdWx0
IHdpdGhvdXQgaGF2aW5nIHRvIGVuYWJsZSBhCj4+Pj4ga25vYi4KPj4+Pgo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgo+Pj4+IFJldmlld2Vk
LWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPiB0byBpdCBvbmNlCj4+Pj4g
IGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSAgICAgICAgfCAgMiArLQo+Pj4+ICBkcml2ZXJzL2dw
dS9kcm0vdGlueWRybS9LY29uZmlnIHwgMzcgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tCj4+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25z
KC0pCj4+Pgo+Pj4gQmlzZWN0aW9uIHNheXMgdGhpcyBwYXRjaCAoMjhjNDdlMTZlYTJhMTlhZGI0
N2ZlMmMxODJjYmQ2MWNiODU0MjM3YykKPj4+IGJyZWFrcyBrY29uZmlnIHN0dWZmIGluIHY1LjQt
cmMgYnkgY3JlYXRpbmcgY2lyY3VsYXIKPj4+IGRlcGVuZGVuY2llcy4gQ291bGQgc29tZW9uZSBz
ZW5kIGEgLXJjIHBhdGNoIHRvIGZpeCB0aGlzIHBsZWFzZT8KPj4+Cj4+PiBUSElOS1BBRF9BQ1BJ
IChkZWZpbmVkIGF0IGRyaXZlcnMvcGxhdGZvcm0veDg2L0tjb25maWc6NDg0KSwgd2l0aCBkZWZp
bml0aW9uLi4uCj4+PiAuLi5kZXBlbmRzIG9uIEZCX1NTRDEzMDcgKGRlZmluZWQgYXQgZHJpdmVy
cy92aWRlby9mYmRldi9LY29uZmlnOjIyNTkpLCB3aXRoIGRlZmluaXRpb24uLi4KPj4+IC4uLmRl
cGVuZHMgb24gRkIgKGRlZmluZWQgYXQgZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnOjEyKSwg
d2l0aCBkZWZpbml0aW9uLi4uCj4+PiAuLi5kZXBlbmRzIG9uIERSTV9LTVNfRkJfSEVMUEVSIChk
ZWZpbmVkIGF0IGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnOjc5KSwgd2l0aCBkZWZpbml0aW9uLi4u
Cj4+PiAuLi5kZXBlbmRzIG9uIERSTV9LTVNfSEVMUEVSIChkZWZpbmVkIGF0IGRyaXZlcnMvZ3B1
L2RybS9LY29uZmlnOjczKSwgd2l0aCBkZWZpbml0aW9uLi4uCj4+PiAuLi5kZXBlbmRzIG9uIFRJ
TllEUk1fUkVQQVBFUiAoZGVmaW5lZCBhdCBkcml2ZXJzL2dwdS9kcm0vdGlueWRybS9LY29uZmln
OjUxKSwgd2l0aCBkZWZpbml0aW9uLi4uCj4+PiAuLi5kZXBlbmRzIG9uIFRIRVJNQUwgKGRlZmlu
ZWQgYXQgZHJpdmVycy90aGVybWFsL0tjb25maWc6NiksIHdpdGggZGVmaW5pdGlvbi4uLgo+Pj4g
Li4uZGVwZW5kcyBvbiBTRU5TT1JTX05QQ003WFggKGRlZmluZWQgYXQgZHJpdmVycy9od21vbi9L
Y29uZmlnOjEyODUpLCB3aXRoIGRlZmluaXRpb24uLi4KPj4+IC4uLmRlcGVuZHMgb24gSFdNT04g
KGRlZmluZWQgYXQgZHJpdmVycy9od21vbi9LY29uZmlnOjYpLCB3aXRoIGRlZmluaXRpb24uLi4K
Pj4+IC4uLmRlcGVuZHMgb24gVEhJTktQQURfQUNQSSAoZGVmaW5lZCBhdCBkcml2ZXJzL3BsYXRm
b3JtL3g4Ni9LY29uZmlnOjQ4NCksIHdpdGggZGVmaW5pdGlvbi4uLgo+Pj4gLi4uZGVwZW5kcyBv
biBBQ1BJX1ZJREVPIChkZWZpbmVkIGF0IGRyaXZlcnMvYWNwaS9LY29uZmlnOjE5MyksIHdpdGgg
ZGVmaW5pdGlvbi4uLgo+Pj4gLi4uZGVwZW5kcyBvbiBBQ0VSX1dNSSAoZGVmaW5lZCBhdCBkcml2
ZXJzL3BsYXRmb3JtL3g4Ni9LY29uZmlnOjE5KSwgd2l0aCBkZWZpbml0aW9uLi4uCj4+PiAuLi5k
ZXBlbmRzIG9uIEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0UgKGRlZmluZWQgYXQgZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvS2NvbmZpZzoxNDQpLCB3aXRoIGRlZmluaXRpb24uLi4KPj4+IC4uLmRlcGVu
ZHMgYWdhaW4gb24gVEhJTktQQURfQUNQSSAoZGVmaW5lZCBhdCBkcml2ZXJzL3BsYXRmb3JtL3g4
Ni9LY29uZmlnOjQ4NCkKPj4+Cj4+Cj4+IFdvdWxkIHRoaXMgY29tbWl0IGZpeCB0aGlzIGJ5IGFu
eSBjaGFuY2U6Cj4+Cj4+IGRybS90aW55OiBLY29uZmlnOiBSZW1vdmUgYWx3YXlzLXkgVEhFUk1B
TCBkZXAuIGZyb20gVElOWURSTV9SRVBBUEVSCj4+IGh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5v
cmcvZHJtL2RybS1taXNjL2NvbW1pdC8/aWQ9ZGZlZjk1OTgwM2M3MjhjNjE2YWQyOWIwMDhjZDkx
YjM0NDZhOTkzYQo+IAo+IFllcywgdGhhbmsgeW91LCBjYW4gc29tZW9uZSBzZW5kIHRoaXMgdG8g
LXJjIHRvIHVuYnJlYWsgNS40Pwo+IAo+IEphc29uCj4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
