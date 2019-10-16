Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D187D970E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 18:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0F96E9A5;
	Wed, 16 Oct 2019 16:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 488 seconds by postgrey-1.36 at gabe;
 Wed, 16 Oct 2019 16:22:40 UTC
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F986E9A5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 16:22:40 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55454)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iKm4H-0003Un-TL; Wed, 16 Oct 2019 17:22:34 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iKm4G-0007Hf-VR; Wed, 16 Oct 2019 17:22:33 +0100
Date: Wed, 16 Oct 2019 17:22:32 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCHv8 2/2] drm: tda998x: set the connector info
Message-ID: <20191016162232.GY25745@shell.armlinux.org.uk>
References: <20191016133916.21475-1-hverkuil-cisco@xs4all.nl>
 <20191016133916.21475-3-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016133916.21475-3-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mrJvn3liV+DZQU5EJ5RJHD7FS7q5mla25X7BFGETVL8=; b=YgsBjABZYZX1KmRFqvLFkXUsN
 RBzZl0s67H5XDBRxy3ej4NMVKuWvb60ijdPj/iyk8siXmgfIHvNKvB4C7N1QxBr7zsDbcJO+5oitu
 2zkj3pJ/cTjaGyFiwWD7fJDhuZN9KqikpxPZdB2NpM6vIiDDPP+NguiQW8qwUJC2eA9mcIIWQDu9R
 rSOsUqdsVfsRUPMP4oGZ0DXIoWDlynqbELDZchU9fU6615HxG6w15Av2sLUMSiaxO/ynf8JwkiCNd
 gEv+sZegWk55vEM24YIFx8bUsGFSgNw8HIP3Oxn78Ab8h6ucA6o/gUte2253/o+tga3h95hd7P5gy
 ocFQA9VBg==;
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
Cc: Dariusz Marcinkiewicz <darekm@google.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMDM6Mzk6MTZQTSArMDIwMCwgSGFucyBWZXJrdWlsIHdy
b3RlOgo+IEZyb206IERhcml1c3ogTWFyY2lua2lld2ljeiA8ZGFyZWttQGdvb2dsZS5jb20+Cj4g
Cj4gRmlsbCBpbiB0aGUgY2VjX2Nvbm5lY3Rvcl9pbmZvIHdoZW4gY2FsbGluZyBjZWNfbm90aWZp
ZXJfY29ubl9yZWdpc3RlcigpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcml1c3ogTWFyY2lua2ll
d2ljeiA8ZGFyZWttQGdvb2dsZS5jb20+Cj4gVGVzdGVkLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJr
dWlsLWNpc2NvQHhzNGFsbC5ubD4KPiBTaWduZWQtb2ZmLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJr
dWlsLWNpc2NvQHhzNGFsbC5ubD4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTh4
X2Rydi5jIHwgMzEgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMv
dGRhOTk4eF9kcnYuYwo+IGluZGV4IDgyNjJiNDRiNzc2ZS4uYjA2MjA4NDJmYTNhIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYwo+IEBAIC0xMzM3LDYgKzEzMzcsOCBAQCBzdGF0aWMg
aW50IHRkYTk5OHhfY29ubmVjdG9yX2luaXQoc3RydWN0IHRkYTk5OHhfcHJpdiAqcHJpdiwKPiAg
CQkJCSAgc3RydWN0IGRybV9kZXZpY2UgKmRybSkKPiAgewo+ICAJc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3RvciA9ICZwcml2LT5jb25uZWN0b3I7Cj4gKwlzdHJ1Y3QgY2VjX2Nvbm5lY3Rv
cl9pbmZvIGNvbm5faW5mbzsKPiArCXN0cnVjdCBjZWNfbm90aWZpZXIgKm5vdGlmaWVyOwo+ICAJ
aW50IHJldDsKPiAgCj4gIAljb25uZWN0b3ItPmludGVybGFjZV9hbGxvd2VkID0gMTsKPiBAQCAt
MTM1Myw2ICsxMzU1LDE3IEBAIHN0YXRpYyBpbnQgdGRhOTk4eF9jb25uZWN0b3JfaW5pdChzdHJ1
Y3QgdGRhOTk4eF9wcml2ICpwcml2LAo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+ICAK
PiArCWNlY19maWxsX2Nvbm5faW5mb19mcm9tX2RybSgmY29ubl9pbmZvLCBjb25uZWN0b3IpOwo+
ICsKPiArCW5vdGlmaWVyID0gY2VjX25vdGlmaWVyX2Nvbm5fcmVnaXN0ZXIocHJpdi0+Y2VjX2ds
dWUucGFyZW50LAo+ICsJCQkJCSAgICAgIE5VTEwsICZjb25uX2luZm8pOwo+ICsJaWYgKCFub3Rp
ZmllcikKPiArCQlyZXR1cm4gLUVOT01FTTsKPiArCj4gKwltdXRleF9sb2NrKCZwcml2LT5jZWNf
bm90aWZ5X211dGV4KTsKPiArCXByaXYtPmNlY19ub3RpZnkgPSBub3RpZmllcjsKPiArCW11dGV4
X3VubG9jaygmcHJpdi0+Y2VjX25vdGlmeV9tdXRleCk7CgpBcyBwZXIgbXkgcHJldmlvdXMgY29t
bWVudHMsIHRoaXMgaXMgYSBzaW5nbGUtY29weSBhdG9taWMgb3BlcmF0aW9uLgpFaXRoZXIgcHJp
di0+Y2VjX25vdGlmeSBpcyBzZXQgb3IgaXQgaXNuJ3Q7IHRoZXJlIGlzIG5vIGludGVybWVkaWF0
ZQp2YWx1ZS4gIEl0IGNhbid0IGJlIHNldCB0byBhIHZhbHVlIHVudGlsIGNlY19ub3RpZmllcl9j
b25uX3JlZ2lzdGVyKCkKaGFzIGNvbXBsZXRlZC4gIFNvIHRoZSBsb2NrIGRvZXNuJ3QgaGVscC4K
Cj4gKwo+ICAJZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2RlcigmcHJpdi0+Y29ubmVjdG9yLAo+
ICAJCQkJICAgICBwcml2LT5icmlkZ2UuZW5jb2Rlcik7Cj4gIAo+IEBAIC0xMzcyLDYgKzEzODUs
MTEgQEAgc3RhdGljIHZvaWQgdGRhOTk4eF9icmlkZ2VfZGV0YWNoKHN0cnVjdCBkcm1fYnJpZGdl
ICpicmlkZ2UpCj4gIHsKPiAgCXN0cnVjdCB0ZGE5OTh4X3ByaXYgKnByaXYgPSBicmlkZ2VfdG9f
dGRhOTk4eF9wcml2KGJyaWRnZSk7Cj4gIAo+ICsJbXV0ZXhfbG9jaygmcHJpdi0+Y2VjX25vdGlm
eV9tdXRleCk7Cj4gKwljZWNfbm90aWZpZXJfY29ubl91bnJlZ2lzdGVyKHByaXYtPmNlY19ub3Rp
ZnkpOwo+ICsJcHJpdi0+Y2VjX25vdGlmeSA9IE5VTEw7Cj4gKwltdXRleF91bmxvY2soJnByaXYt
PmNlY19ub3RpZnlfbXV0ZXgpOwoKVGhpcyBpcyB0aGUgb25seSBjYXNlIHdoZXJlIHRoZSBsb2Nr
IG1ha2VzIHNlbnNlIC0gdG8gZW5zdXJlIHRoYXQgYW55Cm9mIHRoZSBjZWNfbm90aWZpZXJfc2V0
X3BoeXNfYWRkciooKSBmdW5jdGlvbnMgYXJlbid0IGNhbGxlZApjb25jdXJyZW50bHkgd2l0aCBp
dC4gIEhvd2V2ZXIsIHRoZXJlJ3Mgbm8gbG9ja2luZyBhcm91bmQgdGhlIGluc3RhbmNlCmluIHRk
YTk5OHhfY29ubmVjdG9yX2dldF9tb2RlcygpLCBzbyBoYXZlIHlvdSBlbnN1cmVkIHRoYXQgdGhh
dApmdW5jdGlvbiBjYW4ndCBiZSBjYWxsZWQgY29uY3VycmVudGx5PwoKVGhhbmtzLgoKLS0gClJN
SydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9w
YXRjaGVzLwpGVFRDIGJyb2FkYmFuZCBmb3IgMC44bWlsZSBsaW5lIGluIHN1YnVyYmlhOiBzeW5j
IGF0IDEyLjFNYnBzIGRvd24gNjIya2JwcyB1cApBY2NvcmRpbmcgdG8gc3BlZWR0ZXN0Lm5ldDog
MTEuOU1icHMgZG93biA1MDBrYnBzIHVwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
