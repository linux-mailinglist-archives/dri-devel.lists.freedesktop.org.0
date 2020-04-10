Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6F11A4511
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 12:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98836ECBF;
	Fri, 10 Apr 2020 10:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B416ECBF
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 10:18:36 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D106720029;
 Fri, 10 Apr 2020 12:18:32 +0200 (CEST)
Date: Fri, 10 Apr 2020 12:18:31 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: drm/tve200: Checking for a failed platform_get_irq() call in
 tve200_probe()
Message-ID: <20200410101831.GA27723@ravnborg.org>
References: <0263f4fb-c349-7651-b590-8722cdd30c85@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0263f4fb-c349-7651-b590-8722cdd30c85@web.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=P-IC7800AAAA:8
 a=VwQbUJbxAAAA:8 a=JCZqW-9RZpn1hzHRehAA:9 a=MPcP9uqrSlW2Lgt8:21
 a=4ciHVacbEfDAk_G1:21 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWFya3VzLgoKT24gVGh1LCBBcHIgMDksIDIwMjAgYXQgMDM6MDU6MTdQTSArMDIwMCwgTWFy
a3VzIEVsZnJpbmcgd3JvdGU6Cj4gSGVsbG8sCj4gCj4gSSBoYXZlIHRha2VuIGFub3RoZXIgbG9v
ayBhdCB0aGUgaW1wbGVtZW50YXRpb24gb2YgdGhlIGZ1bmN0aW9uIOKAnHR2ZTIwMF9wcm9iZeKA
nS4KPiBBIHNvZnR3YXJlIGFuYWx5c2lzIGFwcHJvYWNoIHBvaW50cyB0aGUgZm9sbG93aW5nIHNv
dXJjZSBjb2RlIG91dCBmb3IKPiBmdXJ0aGVyIGRldmVsb3BtZW50IGNvbnNpZGVyYXRpb25zLgo+
IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjYuMy9zb3VyY2UvZHJpdmVycy9n
cHUvZHJtL3R2ZTIwMC90dmUyMDBfZHJ2LmMjTDIxMgo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMv
Z3B1L2RybS90dmUyMDAvdHZlMjAwX2Rydi5jP2lkPTVkMzBiY2FjZDkxYWY2ODc0NDgxMTI5Nzk3
YWYzNjRhNTNjZDliNDYjbjIxMgo+IAo+IAlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDAp
Owo+IAlpZiAoIWlycSkgewo+IAkJcmV0ID0gLUVJTlZBTDsKPiAJCWdvdG8gY2xrX2Rpc2FibGU7
Cj4gCX0KPiAKPiAKPiBUaGUgc29mdHdhcmUgZG9jdW1lbnRhdGlvbiBpcyBwcm92aWRpbmcgdGhl
IGZvbGxvd2luZyBpbmZvcm1hdGlvbgo+IGZvciB0aGUgdXNlZCBwcm9ncmFtbWluZyBpbnRlcmZh
Y2UuCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9iYXNlL3BsYXRmb3JtLmM/aWQ9NWQzMGJjYWNk
OTFhZjY4NzQ0ODExMjk3OTdhZjM2NGE1M2NkOWI0NiNuMjIxCj4gaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjUuNi4zL3NvdXJjZS9kcml2ZXJzL2Jhc2UvcGxhdGZvcm0uYyNMMjAy
Cj4gCj4g4oCc4oCmCj4gICogUmV0dXJuOiBJUlEgbnVtYmVyIG9uIHN1Y2Nlc3MsIG5lZ2F0aXZl
IGVycm9yIG51bWJlciBvbiBmYWlsdXJlLgo+IOKApuKAnQo+IAo+IFdvdWxkIHlvdSBsaWtlIHRv
IHJlY29uc2lkZXIgdGhlIHNob3duIGNvbmRpdGlvbiBjaGVjaz8KVGhhbnNrIGZvciBzcG90dGlu
ZyB0aGlzLgoKVGhlIHJpZ2h0IHdheSB0byBjaGVjayBmb3IgZXJyb3JzIGlzIHRvIGNoZWNrIGlm
IHRoZSByZXR1cm4gdmFsdWUgaXMKbGVzcyB0aGFuIDAuCkNvdWxkIHlvdSBwbGVhc2UgYXVkaXQg
YWxsIHVzZXMgb2YgcGxhdGZvcm1fZ2V0X2lycSgpIGluIGRyaXZlcnMvZ3B1LwphbmQgc2VuZCBh
IHNlcmllcyBvZiBwYXRjaGVzLCBvbmUgZm9yIGVhY2ggZHJpdmVyLgoKQSBxdWljayAiZ2l0IGdy
ZXAgLUMgNSBwbGF0Zm9ybV9nZXRfaXJxIiBpZGVudGlmaWVkIGEgZmV3IGV4dHJhIGRyaXZlcnMK
dGhhdCBkb2VzIG5vdCBpbXBsZW1lbnQgdGhlIHJlY29tbWVuZCB3YXkgdG8gY2hlY2sgZm9yIGVy
cm9ycy4KClRyeSB0byBiZSBhIGJpdCBtb3JlIHRlcnNlIGluIHRoZSBjaGFuZ2Vsb2cgLSBidXQg
cmVmZXIgdG8KdGhlIGRvY3VtZW50YXRpb24gb2YgcGxhdGZvcm1fZ2V0X2lycSgpOgoKICogRXhh
bXBsZToKICoJCWludCBpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwogKgkJaWYgKGly
cSA8IDApCiAqCQkJcmV0dXJuIGlycTsKCkVhc2llciB0byBlbWJlZCBpdCAtIHJhdGhlciB0aGFu
IHRvIGxpbmsgaXQuCkZpbmUgd2l0aCBsaW5rcyBpbiB0aGUgaW50cm8gbWFpbC4KCiAJU2FtCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
