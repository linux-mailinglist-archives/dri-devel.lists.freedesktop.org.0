Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FD4103025
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C546E995;
	Tue, 19 Nov 2019 23:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 719 seconds by postgrey-1.36 at gabe;
 Tue, 19 Nov 2019 12:52:58 UTC
Received: from a27-21.smtp-out.us-west-2.amazonses.com
 (a27-21.smtp-out.us-west-2.amazonses.com [54.240.27.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F17E6E22C;
 Tue, 19 Nov 2019 12:52:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Date: Tue, 19 Nov 2019 12:40:58 +0000
From: dhar@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [v2] msm: disp: dpu1: add support to access hw irqs regs
 depending on revision
In-Reply-To: <5dcd8f05.1c69fb81.bdd4.2b0a@mx.google.com>
References: <1573710976-27551-1-git-send-email-dhar@codeaurora.org>
 <5dcd8f05.1c69fb81.bdd4.2b0a@mx.google.com>
Message-ID: <0101016e83ae256e-d09a6f18-5a58-4bce-8a60-7075ef0329a4-000000@us-west-2.amazonses.com>
X-Sender: dhar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2019.11.19-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574167258;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
 bh=CEhdhlN+M1OpAxIH/yMj19nrltuBHW5P13jllfaEM2s=;
 b=XqVxNf4pqeJpvpzIwYkg/otvtFkwRESepmw4w1ZUApOrDCRHCC0E3HrH8k+URMqZ
 MrNIsvRGzbS+/jzCLLZT9zAtZTKJ85wRN3GOwQ8awnnTH3r2r+fE8bppjb+z2fCJvlL
 pvxIcr4eGHkDGS0qsHwCfXE4PDQbGBIZ/9H39IGg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574167258;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
 bh=CEhdhlN+M1OpAxIH/yMj19nrltuBHW5P13jllfaEM2s=;
 b=HIQeNX1Ad51tMZYy6NryVIJd6XA1gGWEUHl78Or3QJ5mS9bFNNMJUdKGeMCVX9pz
 9RB2WkTbmfm/cam40GxqH0xmXvP7Q7F+NVHl7aUKvmw+X93wqlQvm4kBjUDHR0u8YnM
 5tLvaldSFYcG3Ih20mD1xcJ2CEVDe1wpypC0KIoI=
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, abhinavk@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org, chandanu@codeaurora.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMS0xNCAyMjo1OSwgU3RlcGhlbiBCb3lkIHdyb3RlOgo+IFF1b3RpbmcgU2h1Ymhh
c2hyZWUgRGhhciAoMjAxOS0xMS0xMyAyMTo1NjoxNikKPj4gQ3VycmVudCBjb2RlIGFzc3VtZXMg
dGhhdCBhbGwgdGhlIGlycXMgcmVnaXN0ZXJzIG9mZnNldHMgY2FuIGJlCj4+IGFjY2Vzc2VkIGlu
IGFsbCB0aGUgaHcgcmV2aXNpb25zOyB0aGlzIGlzIG5vdCB0aGUgY2FzZSBmb3Igc29tZQo+PiB0
YXJnZXRzIHRoYXQgc2hvdWxkIG5vdCBhY2Nlc3Mgc29tZSBvZiB0aGUgaXJxIHJlZ2lzdGVycy4K
PiAKPiBXaGF0IGhhcHBlbnMgaWYgd2UgcmVhZCB0aGUgaXJxIHJlZ2lzdGVycyB0aGF0IHdlICJz
aG91bGQgbm90IGFjY2VzcyI/Cj4gRG9lcyB0aGUgc3lzdGVtIHJlc2V0PyBJdCB3b3VsZCBiZSBl
YXNpZXIgdG8gbWFrZSB0aG9zZSByZWdpc3RlcnMgCj4gcmV0dXJuCj4gMCB3aGVuIHJlYWQgaW5k
aWNhdGluZyBubyBpbnRlcnJ1cHQgYW5kIGlnbm9yZSB3cml0ZXMgc28gdGhhdCAKPiBldmVyeXRo
aW5nCj4ga2VlcHMgd29ya2luZyB3aXRob3V0IGhhdmluZyB0byBza2lwIHJlZ2lzdGVycy4KPiAK
SW4gc29tZSBvZiB0aGUgaHcgcmV2aXNpb25zLCB0aGUgd2hvbGUgaHcgYmxvY2sgaXMgYWJzZW50
IGFuZCB0cnlpbmcgdG8gCmFjY2VzcyB0aG9zZQpyZWdpc3RlcnMgY2F1c2VzIHN5c3RlbSBwYW5p
YyhidXMgbm9jIGVycm9yKS4KCj4+IFRoaXMgY2hhbmdlIGFkZHMgdGhlIHN1cHBvcnQgdG8gc2Vs
ZWN0aXZlbHkgcmVtb3ZlIHRoZSBpcnFzIHRoYXQKPj4gYXJlIG5vdCBzdXBwb3J0ZWQgaW4gc29t
ZSBvZiB0aGUgaHcgcmV2aXNpb25zLgo+PiAKPj4gQ2hhbmdlLUlkOiBJNjA1MmI4MjM3YjcwM2Ex
YTllZGQ1Mzg5M2UwNGY3YmQ3MjIyM2RhMQo+IAo+IFBsZWFzZSByZW1vdmUgdGhlc2UgYmVmb3Jl
IHNlbmRpbmcgdXBzdHJlYW0uCj4gCj4+IFNpZ25lZC1vZmYtYnk6IFNodWJoYXNocmVlIERoYXIg
PGRoYXJAY29kZWF1cm9yYS5vcmc+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L2RwdTEvZHB1X2h3X2NhdGFsb2cuYyAgICB8ICAxICsKPj4gIGRyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9kcHUxL2RwdV9od19jYXRhbG9nLmggICAgfCAgMyArKysKPj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tc20vZGlzcC9kcHUxL2RwdV9od19pbnRlcnJ1cHRzLmMgfCAyMiAKPj4gKysrKysrKysrKysr
KysrKystLS0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2ludGVy
cnVwdHMuaCB8ICAxICsKPj4gIDQgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfaHdfY2F0YWxvZy5oIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9od19jYXRhbG9nLmgKPj4gaW5kZXggZWM3NmI4NjguLmRlZjhhM2YgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19jYXRhbG9nLmgKPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2NhdGFsb2cuaAo+PiBAQCAt
NjQ2LDYgKzY0Niw3IEBAIHN0cnVjdCBkcHVfcGVyZl9jZmcgewo+PiAgICogQGRtYV9mb3JtYXRz
ICAgICAgICBTdXBwb3J0ZWQgZm9ybWF0cyBmb3IgZG1hIHBpcGUKPj4gICAqIEBjdXJzb3JfZm9y
bWF0cyAgICAgU3VwcG9ydGVkIGZvcm1hdHMgZm9yIGN1cnNvciBwaXBlCj4+ICAgKiBAdmlnX2Zv
cm1hdHMgICAgICAgIFN1cHBvcnRlZCBmb3JtYXRzIGZvciB2aWcgcGlwZQo+PiArICogQG1kc3Nf
aXJxcyAgICAgICAgICBCaXRtYXAgd2l0aCB0aGUgaXJxcyBzdXBwb3J0ZWQgYnkgdGhlIHRhcmdl
dAo+IAo+IEhtbSBwcmV0dHkgc3VyZSB0aGVyZSBuZWVkcyB0byBiZSBhIGNvbG9uIHNvIHRoYXQg
a2VybmVsLWRvYyBjYW4gbWF0Y2gKPiB0aGlzIGJ1dCBtYXliZSBJJ20gd3JvbmcuCj4gCj4+ICAg
Ki8KPj4gIHN0cnVjdCBkcHVfbWRzc19jZmcgewo+PiAgICAgICAgIHUzMiBod3ZlcnNpb247Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
