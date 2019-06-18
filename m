Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6FA49A0D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510EE6E0F6;
	Tue, 18 Jun 2019 07:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD486E0BD;
 Tue, 18 Jun 2019 02:02:02 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 0C3023E916;
 Tue, 18 Jun 2019 02:02:01 +0000 (UTC)
Date: Mon, 17 Jun 2019 22:02:00 -0400
From: Brian Masney <masneyb@onstation.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, robdclark@gmail.com
Subject: Re: [PATCH 5/6] soc: qcom: add OCMEM driver
Message-ID: <20190618020200.GB22330@onstation.org>
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-6-masneyb@onstation.org>
 <20190616174106.GO22737@tuxbook-pro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190616174106.GO22737@tuxbook-pro>
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:12:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1560823321;
 bh=JAWG9OebQfPvktQPpG6CYIPS1YvD0jFqxngPc+1oXh0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=juvZIEO1ymL2g7Jtys0xxTB1t19QT09rup43fCpXdYFr6bCbyJBitiaIrSHNDk8wR
 CUzBw6eaEuGGrDDOPMGa2ye3ldmqNo69eYto/gQn+jYwizJuYyjjHIcmZcnhYOOUCn
 zovvDMmI33/DtSu/zaNekWu9n62mDeu56yeiwzlg=
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, jonathan@marek.ca,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, david.brown@linaro.org,
 agross@kernel.org, dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iIENsYXJrLAoKT24gU3VuLCBKdW4gMTYsIDIwMTkgYXQgMTA6NDE6MDZBTSAtMDcwMCwg
Qmpvcm4gQW5kZXJzc29uIHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL3Fjb20v
b2NtZW0ueG1sLmggYi9kcml2ZXJzL3NvYy9xY29tL29jbWVtLnhtbC5oCj4gCj4gSSB3b3VsZCBw
cmVmZXIgdGhhdCB0aGVzZSBsaXZlZCBhdCB0aGUgdG9wIG9mIHRoZSBjIGZpbGUsIHJhdGhlciB0
aGFuCj4gYmVpbmcgZ2VuZXJhdGVkLgoKSSB0aGluayBpdCB3b3VsZCBiZSBuaWNlIHRvIG1ha2Ug
dGhpcyBjaGFuZ2UgYXMgd2VsbC4KClJvYiBDOiBZb3VyIG9yaWdpbmFsIGZpbGUgb2NtZW0ueG1s
Lmggd2FzIGxpY2Vuc2VkIHVuZGVyIHRoZSBNSVQKbGljZW5zZS4gSSBqdXN0IHdhbnRlZCBjb25m
aXJtYXRpb24gZnJvbSB5b3UgdGhhdCBpdCdzIE9LIHRvIHB1dAp0aGUgY29udGVudHMgb2YgdGhh
dCBmaWxlIGludG8gb2NtZW0uYyB3aGljaCBoYXMgdGhlIEdQTCAyLjAgb25seQpTUERYIGxpY2Vu
c2UgdGFnLiBUaGlzIHdpbGwgcmVsaWNlbnNlIHRoZSB3b3JrLiBJIGltYWdpbmUgaXQncyBub3QK
YW4gaXNzdWUgYnV0IEkganVzdCB3YW50ZWQgdG8gZ2V0IGNvbmZpcm1hdGlvbiBzbyB0aGVyZSBp
cyBubwphbWJpZ3VpdHkgcmVnYXJkaW5nIHRoZSBsaWNlbnNpbmcgaW4gdGhlIGZ1dHVyZS4KCkJy
aWFuCgoKPiAKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAu
LmI0YmZiODVkMWUzMwo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvZHJpdmVycy9zb2MvcWNv
bS9vY21lbS54bWwuaAo+ID4gQEAgLTAsMCArMSw4NiBAQAo+ID4gKy8qIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBNSVQgKi8KPiA+ICsKPiA+ICsjaWZuZGVmIE9DTUVNX1hNTAo+ID4gKyNkZWZp
bmUgT0NNRU1fWE1MCj4gPiArCj4gPiArLyogQXV0b2dlbmVyYXRlZCBmaWxlLCBETyBOT1QgRURJ
VCBtYW51YWxseSEKPiA+ICsKPiA+ICtUaGlzIGZpbGUgd2FzIGdlbmVyYXRlZCBieSB0aGUgcnVs
ZXMtbmctbmcgaGVhZGVyZ2VuIHRvb2wgaW4gdGhpcyBnaXQgcmVwb3NpdG9yeToKPiA+ICtodHRw
Oi8vZ2l0aHViLmNvbS9mcmVlZHJlbm8vZW52eXRvb2xzLwo+ID4gK2dpdCBjbG9uZSBodHRwczov
L2dpdGh1Yi5jb20vZnJlZWRyZW5vL2Vudnl0b29scy5naXQKPiA+ICsKPiA+ICtUaGUgcnVsZXMt
bmctbmcgc291cmNlIGZpbGVzIHRoaXMgaGVhZGVyIHdhcyBnZW5lcmF0ZWQgZnJvbSBhcmU6Cj4g
PiArLSAvaG9tZS9yb2JjbGFyay9zcmMvZnJlZWRyZW5vL2Vudnl0b29scy9ybm5kYi9hZHJlbm8v
b2NtZW0ueG1sICAgICAgICAgKCAgIDE3NzMgYnl0ZXMsIGZyb20gMjAxNS0wOS0yNCAxNzozMDow
MCkKPiA+ICsKPiA+ICtDb3B5cmlnaHQgKEMpIDIwMTMtMjAxNSBieSB0aGUgZm9sbG93aW5nIGF1
dGhvcnM6Cj4gPiArLSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+IChyb2JjbGFyaykK
PiA+ICsqLwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
