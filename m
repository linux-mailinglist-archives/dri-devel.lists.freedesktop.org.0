Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD9621F614
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 17:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891406E142;
	Tue, 14 Jul 2020 15:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416086E142
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 15:23:14 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id w17so13327208otl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 08:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cXIgj0iYr7P3K9BwnPZPhJf3MwNMTpVJeBZlv87Bh4I=;
 b=VLIaWTKC4PHL8JWLjq42ZsT9mY+u4qL1p7WxjpgKEl5De7mvV/iKccmYz4fTy5W0bX
 uwD6ShgNVxz/NJqIxDCK1jZ0AkTPAFmrweTkVH7sJq9pe+Uyk13OIivD+V7ejv2npjny
 COM+I7P0E87QnLBZ2ERPa5kKwcC4/ZCLIIjxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cXIgj0iYr7P3K9BwnPZPhJf3MwNMTpVJeBZlv87Bh4I=;
 b=FSyYF1M16UZVcotf9afN65x1veNZBNXut2BVamd1C/0wGt1PQxbr4hKbGOdTzivebI
 KrvvDbePQC60ANYj/btNhvrfeLBrwDoJjqwoBpOEVWtPB6+7ZH/oVALqaGjDM4bYiZqf
 5OLKCMMiBnVRzUjQ+NDVZWhYu5MxWC3sZ/u/DbY3Nq2m6yqPvWGcMnRnIeg5bmtSzmhV
 YRvgDKbeqPhlhIizIbxYPNZ9AE9Rzi40GZjcBPYbohGxLaZj7z4F+e3qhcn6u1xmZ82l
 MoodrLgfFP18m7OfXWQYTLTlBIzIAzIsjDnFS1UIS8WoTCBSXFXbMXnK6G0uqmS6q396
 hf8Q==
X-Gm-Message-State: AOAM5303lKn8Xh4K3M5KdE3hqG8n5b0v3YW1hZOu5J7T3U2tsDHB6Ov0
 HH93Hdfmb5unTxC83gADcp/YFQ++eFTDjCdWX/b60Q==
X-Google-Smtp-Source: ABdhPJzMWKFMzStVCDzj6VA6xehwdIqELDcKSwQ56B351nM2OHgHnA5N7zQOfA0uHd0eJVAYd4Qstl3xeb/ssJHcYdM=
X-Received: by 2002:a9d:d55:: with SMTP id 79mr4759005oti.281.1594740193436;
 Tue, 14 Jul 2020 08:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-5-daniel.vetter@ffwll.ch>
 <20200712222716.4rhvj7hryiecjthv@smtp.gmail.com>
 <20200714095717.njwk2u4tkgro54jn@smtp.gmail.com>
 <CAKMK7uGu4N2oe04N=haUodmVCLi6HnqFDORkObx8EPUQrEJ+MQ@mail.gmail.com>
 <20200714145553.zetjvbewixnf2rla@smtp.gmail.com>
In-Reply-To: <20200714145553.zetjvbewixnf2rla@smtp.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 14 Jul 2020 17:23:02 +0200
Message-ID: <CAKMK7uEyu8A3or00J+fBhf5sHhhq5Xz7X9Y=2AMajEPSaNB+-g@mail.gmail.com>
Subject: Re: [PATCH 04/25] drm/vkms: Annotate vblank timer
To: Melissa Wen <melissa.srw@gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTQsIDIwMjAgYXQgNDo1NiBQTSBNZWxpc3NhIFdlbiA8bWVsaXNzYS5zcndA
Z21haWwuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMDcvMTQsIERhbmllbCBWZXR0ZXIgd3Jv
dGU6Cj4gPiBPbiBUdWUsIEp1bCAxNCwgMjAyMCBhdCAxMTo1NyBBTSBNZWxpc3NhIFdlbiA8bWVs
aXNzYS5zcndAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gMDcvMTIsIFJvZHJpZ28g
U2lxdWVpcmEgd3JvdGU6Cj4gPiA+ID4gSGksCj4gPiA+ID4KPiA+ID4gPiBFdmVyeXRoaW5nIGxv
b2tzIGZpbmUgdG8gbWUsIEkganVzdCBub3RpY2VkIHRoYXQgdGhlIGFtZGdwdSBwYXRjaGVzIGRp
ZAo+ID4gPiA+IG5vdCBhcHBseSBzbW9vdGhseSwgaG93ZXZlciBpdCB3YXMgdHJpdmlhbCB0byBm
aXggdGhlIGlzc3Vlcy4KPiA+ID4gPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBSb2RyaWdvIFNpcXVl
aXJhIDxyb2RyaWdvc2lxdWVpcmFtZWxvQGdtYWlsLmNvbT4KPiA+ID4gPgo+ID4gPiA+IE1lbGlz
c2EsCj4gPiA+ID4gU2luY2UgeW91IGFyZSB1c2luZyB2a21zIHJlZ3VsYXJseSwgY291bGQgeW91
IHRlc3QgdGhpcyBwYXRjaCBhbmQgcmV2aWV3Cj4gPiA+ID4gaXQ/IFJlbWVtYmVyIHRvIGFkZCB5
b3VyIFRlc3RlZC1ieSB3aGVuIHlvdSBmaW5pc2guCj4gPiA+ID4KPiA+ID4gSGksCj4gPiA+Cj4g
PiA+IEkndmUgYXBwbGllZCB0aGUgcGF0Y2ggc2VyaWVzLCByYW4gc29tZSB0ZXN0cyBvbiB2a21z
LCBhbmQgZm91bmQgbm8KPiA+ID4gaXNzdWVzLiBJIG1lYW4sIHRoaW5ncyBoYXZlIHJlbWFpbmVk
IHN0YWJsZS4KPiA+ID4KPiA+ID4gVGVzdGVkLWJ5OiBNZWxpc3NhIFdlbiA8bWVsaXNzYS5zcndA
Z21haWwuY29tPgo+ID4KPiA+IERpZCB5b3UgdGVzdCB3aXRoIENPTkZJR19QUk9WRV9MT0NLSU5H
IGVuYWJsZWQgaW4gdGhlIGtlcm5lbCAuY29uZmlnPwo+ID4gV2l0aG91dCB0aGF0IGVuYWJsZWQs
IHRoZXJlJ3Mgbm90IHJlYWxseSBhbnkgY2hhbmdlIGhlcmUsIGJ1dCB3aXRoCj4gPiB0aGF0IGVu
YWJsZWQgdGhlcmUgbWlnaHQgYmUgc29tZSBsb2NrZGVwIHNwbGF0cyBpbiBkbWVzZyBpbmRpY2F0
aW5nIGEKPiA+IHByb2JsZW0uCj4gPgo+Cj4gRXZlbiB3aXRoIHRoZSBsb2NrIGRlYnVnZ2luZyBj
b25maWcgZW5hYmxlZCwgbm8gbmV3IGlzc3VlIGFyb3NlIGluIGRtZXNnCj4gZHVyaW5nIG15IHRl
c3RzIHVzaW5nIHZrbXMuCgpFeGNlbGxlbnQsIHRoYW5rcyBhIGxvdCBmb3IgY29uZmlybWluZyB0
aGlzLgotRGFuaWVsCgo+Cj4gTWVsaXNzYQo+Cj4gPiBUaGFua3MsIERhbmllbAo+ID4gPgo+ID4g
PiA+IFRoYW5rcwo+ID4gPiA+Cj4gPiA+ID4gT24gMDcvMDcsIERhbmllbCBWZXR0ZXIgd3JvdGU6
Cj4gPiA+ID4gPiBUaGlzIGlzIG5lZWRlZCB0byBzaWduYWwgdGhlIGZlbmNlcyBmcm9tIHBhZ2Ug
ZmxpcHMsIGFubm90YXRlIGl0Cj4gPiA+ID4gPiBhY2NvcmRpbmdseS4gV2UgbmVlZCB0byBhbm5v
dGF0ZSBlbnRpcmUgdGltZXIgY2FsbGJhY2sgc2luY2UgaWYgd2UgZ2V0Cj4gPiA+ID4gPiBzdHVj
ayBhbnl3aGVyZSBpbiB0aGVyZSwgdGhlbiB0aGUgdGltZXIgc3RvcHMsIGFuZCBoZW5jZSBmZW5j
ZXMgc3RvcC4KPiA+ID4gPiA+IEp1c3QgYW5ub3RhdGluZyB0aGUgdG9wIHBhcnQgdGhhdCBkb2Vz
IHRoZSB2YmxhbmsgaGFuZGxpbmcgaXNuJ3QKPiA+ID4gPiA+IGVub3VnaC4KPiA+ID4gPiA+Cj4g
PiA+ID4gPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gPiA+ID4gPiBDYzogbGlu
YXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gPiA+ID4gPiBDYzogbGludXgtcmRtYUB2Z2Vy
Lmtlcm5lbC5vcmcKPiA+ID4gPiA+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
ID4gPiA+ID4gQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gPiA+IENj
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiA+ID4gPiA+IENjOiBN
YWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4g
PiA+ID4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiA+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwu
Y29tPgo+ID4gPiA+ID4gQ2M6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1lbG9A
Z21haWwuY29tPgo+ID4gPiA+ID4gQ2M6IEhhbmVlbiBNb2hhbW1lZCA8aGFtb2hhbW1lZC5zYUBn
bWFpbC5jb20+Cj4gPiA+ID4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+
ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcnRjLmMg
fCA4ICsrKysrKystCj4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdmttcy92a21zX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3J0Yy5j
Cj4gPiA+ID4gPiBpbmRleCBhYzg1ZTE3NDI4ZjguLmE1M2E0MDg0OGE3MiAxMDA2NDQKPiA+ID4g
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3J0Yy5jCj4gPiA+ID4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NydGMuYwo+ID4gPiA+ID4gQEAgLTEsNSArMSw3
IEBACj4gPiA+ID4gPiAgLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArCj4gPiA+
ID4gPgo+ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9kbWEtZmVuY2UuaD4KPiA+ID4gPiA+ICsK
PiA+ID4gPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWMuaD4KPiA+ID4gPiA+ICAjaW5jbHVk
ZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+Cj4gPiA+ID4gPiAgI2luY2x1ZGUgPGRybS9kcm1f
cHJvYmVfaGVscGVyLmg+Cj4gPiA+ID4gPiBAQCAtMTQsNyArMTYsOSBAQCBzdGF0aWMgZW51bSBo
cnRpbWVyX3Jlc3RhcnQgdmttc192Ymxhbmtfc2ltdWxhdGUoc3RydWN0IGhydGltZXIgKnRpbWVy
KQo+ID4gPiA+ID4gICAgIHN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9ICZvdXRwdXQtPmNydGM7Cj4g
PiA+ID4gPiAgICAgc3RydWN0IHZrbXNfY3J0Y19zdGF0ZSAqc3RhdGU7Cj4gPiA+ID4gPiAgICAg
dTY0IHJldF9vdmVycnVuOwo+ID4gPiA+ID4gLSAgIGJvb2wgcmV0Owo+ID4gPiA+ID4gKyAgIGJv
b2wgcmV0LCBmZW5jZV9jb29raWU7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgZmVuY2VfY29v
a2llID0gZG1hX2ZlbmNlX2JlZ2luX3NpZ25hbGxpbmcoKTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAg
ICAgcmV0X292ZXJydW4gPSBocnRpbWVyX2ZvcndhcmRfbm93KCZvdXRwdXQtPnZibGFua19ocnRp
bWVyLAo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvdXRw
dXQtPnBlcmlvZF9ucyk7Cj4gPiA+ID4gPiBAQCAtNDksNiArNTMsOCBAQCBzdGF0aWMgZW51bSBo
cnRpbWVyX3Jlc3RhcnQgdmttc192Ymxhbmtfc2ltdWxhdGUoc3RydWN0IGhydGltZXIgKnRpbWVy
KQo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICBEUk1fREVCVUdfRFJJVkVSKCJDb21wb3Nl
ciB3b3JrZXIgYWxyZWFkeSBxdWV1ZWRcbiIpOwo+ID4gPiA+ID4gICAgIH0KPiA+ID4gPiA+Cj4g
PiA+ID4gPiArICAgZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5nKGZlbmNlX2Nvb2tpZSk7Cj4gPiA+
ID4gPiArCj4gPiA+ID4gPiAgICAgcmV0dXJuIEhSVElNRVJfUkVTVEFSVDsKPiA+ID4gPiA+ICB9
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gLS0KPiA+ID4gPiA+IDIuMjcuMAo+ID4gPiA+ID4KPiA+ID4g
Pgo+ID4gPiA+IC0tCj4gPiA+ID4gUm9kcmlnbyBTaXF1ZWlyYQo+ID4gPiA+IGh0dHBzOi8vc2lx
dWVpcmEudGVjaAo+ID4gPgo+ID4gPgo+ID4KPiA+Cj4gPiAtLQo+ID4gRGFuaWVsIFZldHRlcgo+
ID4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gPiBodHRwOi8vYmxvZy5m
ZndsbC5jaAoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
