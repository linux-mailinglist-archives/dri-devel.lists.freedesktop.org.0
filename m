Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FBFC4856
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E160A6E8F7;
	Wed,  2 Oct 2019 07:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0C56E7A3
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 13:45:57 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id c21so21593452qtj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 06:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=T00f8oMdHVkq3W+YEv58SmUAyov+mXAtsvXMMacWUW0=;
 b=ZQXpt4jK7IlWdh47LggGIKCtjDOBNQdhh+XTUDAioHOnxeXzz3gs3Tii5yuMfTeGJ0
 mPox4UxQygiudw/E3nuBQGWA99MIqBtIvG1C3XrPmzVm9HPXeFA3Est12P7UP5INNpNx
 EVWWhRAmy/hYOHJ9nGjMYew6Z884rzrc8IA0fTW0a8/nUSi2uHDBvI4CT8MDTCTFnyJq
 pVsRo2856JppHAw2UBUD4fRzvETByvTFnmdhh1SJSK7oS0wq8Hw1rK5c/OLTHC1SNJJs
 6p1DvPkMRRH6rEstOdoGX9GzHFwrw4Hgi4xJWIdsAUT91XPj6tyt7DqNU+hAn8fnVojE
 IN/Q==
X-Gm-Message-State: APjAAAV9EOBfxJa0d4Nm613ALcJKE+O+slckLGJrp2AwQZXJPfwfdt05
 TvInDxucoAvqBkSZJtyaahQXzQ==
X-Google-Smtp-Source: APXvYqwiG/lt+iFDKSmGAhOXggR1gSAbWoLCXPkRzTmBM7QvGMyE3m+0mokw3wsruQ7dNlyt9RXdvA==
X-Received: by 2002:ac8:5243:: with SMTP id y3mr30415686qtn.51.1569937556568; 
 Tue, 01 Oct 2019 06:45:56 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id g3sm6948383qkb.117.2019.10.01.06.45.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 01 Oct 2019 06:45:55 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iFITT-00058C-Ek; Tue, 01 Oct 2019 10:45:55 -0300
Date: Tue, 1 Oct 2019 10:45:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [1/3] drm/tinydrm/Kconfig: Remove menuconfig DRM_TINYDRM
Message-ID: <20191001134555.GB22532@ziepe.ca>
References: <20190725105132.22545-2-noralf@tronnes.org>
 <20191001123636.GA8351@ziepe.ca>
 <1fffe7b1-a738-a9e3-ea5f-9d696cb98650@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1fffe7b1-a738-a9e3-ea5f-9d696cb98650@tronnes.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=T00f8oMdHVkq3W+YEv58SmUAyov+mXAtsvXMMacWUW0=;
 b=V39IyWmxk0rgxt/doIxYB7cVCye9DyolWnRUFJWdX2uiEJw7ZqTTPwOC1H3mTm/MtK
 uoZhI9uHFApcOHp2lrQGzysxHBQN5o53+a1xxXtTQ08W1tVyh9k+0Mt0lBJeORFCy2GA
 7HIA9QCLKhHlUqQj3SAwMG8+X93km5hvTjGxPjmLWjtn21OkVu8uKXt5ldVnVV79O5cy
 zvJLVp+dlA0WQo1Nl097b9bCI1HitM7j8Br4HOJ2iyZIdtSOBVJRL5hOUPM9sIMLqf8E
 vNlXR4mVpy2cUVYgHf68mTY4gEqW/+tBwqSGnGZn356X6XKR8EqtayopDV8AVpkMcUNm
 PP0g==
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

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDM6Mjg6NDZQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+IAo+IAo+IERlbiAwMS4xMC4yMDE5IDE0LjM2LCBza3JldiBKYXNvbiBHdW50aG9y
cGU6Cj4gPiBPbiBUaHUsIEp1bCAyNSwgMjAxOSBhdCAxMjo1MTozMFBNICswMjAwLCBOb3JhbGYg
VHLDuG5uZXMgd3JvdGU6Cj4gPj4gVGhpcyBtYWtlcyB0aGUgdGlueSBkcml2ZXJzIHZpc2libGUg
YnkgZGVmYXVsdCB3aXRob3V0IGhhdmluZyB0byBlbmFibGUgYQo+ID4+IGtub2IuCj4gPj4KPiA+
PiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiA+
PiBSZXZpZXdlZC1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4gdG8gaXQg
b25jZQo+ID4+ICBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgICAgICAgIHwgIDIgKy0KPiA+PiAg
ZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vS2NvbmZpZyB8IDM3ICsrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLQo+ID4+ICAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDE3
IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBCaXNlY3Rpb24gc2F5cyB0aGlzIHBhdGNoICgyOGM0N2Ux
NmVhMmExOWFkYjQ3ZmUyYzE4MmNiZDYxY2I4NTQyMzdjKQo+ID4gYnJlYWtzIGtjb25maWcgc3R1
ZmYgaW4gdjUuNC1yYyBieSBjcmVhdGluZyBjaXJjdWxhcgo+ID4gZGVwZW5kZW5jaWVzLiBDb3Vs
ZCBzb21lb25lIHNlbmQgYSAtcmMgcGF0Y2ggdG8gZml4IHRoaXMgcGxlYXNlPwo+ID4gCj4gPiBU
SElOS1BBRF9BQ1BJIChkZWZpbmVkIGF0IGRyaXZlcnMvcGxhdGZvcm0veDg2L0tjb25maWc6NDg0
KSwgd2l0aCBkZWZpbml0aW9uLi4uCj4gPiAuLi5kZXBlbmRzIG9uIEZCX1NTRDEzMDcgKGRlZmlu
ZWQgYXQgZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnOjIyNTkpLCB3aXRoIGRlZmluaXRpb24u
Li4KPiA+IC4uLmRlcGVuZHMgb24gRkIgKGRlZmluZWQgYXQgZHJpdmVycy92aWRlby9mYmRldi9L
Y29uZmlnOjEyKSwgd2l0aCBkZWZpbml0aW9uLi4uCj4gPiAuLi5kZXBlbmRzIG9uIERSTV9LTVNf
RkJfSEVMUEVSIChkZWZpbmVkIGF0IGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnOjc5KSwgd2l0aCBk
ZWZpbml0aW9uLi4uCj4gPiAuLi5kZXBlbmRzIG9uIERSTV9LTVNfSEVMUEVSIChkZWZpbmVkIGF0
IGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnOjczKSwgd2l0aCBkZWZpbml0aW9uLi4uCj4gPiAuLi5k
ZXBlbmRzIG9uIFRJTllEUk1fUkVQQVBFUiAoZGVmaW5lZCBhdCBkcml2ZXJzL2dwdS9kcm0vdGlu
eWRybS9LY29uZmlnOjUxKSwgd2l0aCBkZWZpbml0aW9uLi4uCj4gPiAuLi5kZXBlbmRzIG9uIFRI
RVJNQUwgKGRlZmluZWQgYXQgZHJpdmVycy90aGVybWFsL0tjb25maWc6NiksIHdpdGggZGVmaW5p
dGlvbi4uLgo+ID4gLi4uZGVwZW5kcyBvbiBTRU5TT1JTX05QQ003WFggKGRlZmluZWQgYXQgZHJp
dmVycy9od21vbi9LY29uZmlnOjEyODUpLCB3aXRoIGRlZmluaXRpb24uLi4KPiA+IC4uLmRlcGVu
ZHMgb24gSFdNT04gKGRlZmluZWQgYXQgZHJpdmVycy9od21vbi9LY29uZmlnOjYpLCB3aXRoIGRl
ZmluaXRpb24uLi4KPiA+IC4uLmRlcGVuZHMgb24gVEhJTktQQURfQUNQSSAoZGVmaW5lZCBhdCBk
cml2ZXJzL3BsYXRmb3JtL3g4Ni9LY29uZmlnOjQ4NCksIHdpdGggZGVmaW5pdGlvbi4uLgo+ID4g
Li4uZGVwZW5kcyBvbiBBQ1BJX1ZJREVPIChkZWZpbmVkIGF0IGRyaXZlcnMvYWNwaS9LY29uZmln
OjE5MyksIHdpdGggZGVmaW5pdGlvbi4uLgo+ID4gLi4uZGVwZW5kcyBvbiBBQ0VSX1dNSSAoZGVm
aW5lZCBhdCBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9LY29uZmlnOjE5KSwgd2l0aCBkZWZpbml0aW9u
Li4uCj4gPiAuLi5kZXBlbmRzIG9uIEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0UgKGRlZmluZWQgYXQg
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZzoxNDQpLCB3aXRoIGRlZmluaXRpb24uLi4K
PiA+IC4uLmRlcGVuZHMgYWdhaW4gb24gVEhJTktQQURfQUNQSSAoZGVmaW5lZCBhdCBkcml2ZXJz
L3BsYXRmb3JtL3g4Ni9LY29uZmlnOjQ4NCkKPiA+IAo+IAo+IFdvdWxkIHRoaXMgY29tbWl0IGZp
eCB0aGlzIGJ5IGFueSBjaGFuY2U6Cj4gCj4gZHJtL3Rpbnk6IEtjb25maWc6IFJlbW92ZSBhbHdh
eXMteSBUSEVSTUFMIGRlcC4gZnJvbSBUSU5ZRFJNX1JFUEFQRVIKPiBodHRwczovL2NnaXQuZnJl
ZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYy9jb21taXQvP2lkPWRmZWY5NTk4MDNjNzI4YzYxNmFk
MjliMDA4Y2Q5MWIzNDQ2YTk5M2EKClllcywgdGhhbmsgeW91LCBjYW4gc29tZW9uZSBzZW5kIHRo
aXMgdG8gLXJjIHRvIHVuYnJlYWsgNS40PwoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
