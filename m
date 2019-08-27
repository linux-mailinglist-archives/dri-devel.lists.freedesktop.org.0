Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C426B9EF3F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 17:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051FF89AB2;
	Tue, 27 Aug 2019 15:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD2C89AB2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 15:44:28 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0CD000D58CEF7064D904CD.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0c:d000:d58c:ef70:64d9:4cd])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A98E31EC06E5;
 Tue, 27 Aug 2019 17:44:26 +0200 (CEST)
Date: Tue, 27 Aug 2019 17:44:22 +0200
From: Borislav Petkov <bp@alien8.de>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v2 2/4] x86/vmware: Add a header file for hypercall
 definitions
Message-ID: <20190827154422.GG29752@zn.tnic>
References: <20190823081316.28478-1-thomas_os@shipmail.org>
 <20190823081316.28478-3-thomas_os@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190823081316.28478-3-thomas_os@shipmail.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alien8.de; s=dkim; t=1566920666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHBR4nVac4hkcN25eNcINMCsBK8JU9h3vxB99dyirGI=;
 b=VcH1A54m6kJs1/No5Lu9Obxh+05iWmYgt7HIHUzgq5yivpuawF7Y+ULYNwUzDL/1G7j5Vl
 h05fl3yrd83hRgEl/hLOk5uYWhHXRiOP8k4vThzJScwOh1c4RVvFXVKOmxqmoTZTN3FUg2
 eJOqSSYYTMwyc712h39aGVIQ3zwNR1w=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, pv-drivers@vmware.com,
 x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Doug Covelli <dcovelli@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 linux-graphics-maintainer@vmware.com, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTA6MTM6MTRBTSArMDIwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKFZNd2FyZSkgd3JvdGU6Cj4gKy8qCj4gKyAqIFRoZSBoaWdoIGJhbmR3aWR0aCBvdXQgY2Fs
bC4gVGhlIGxvdyB3b3JkIG9mIGVkeCBpcyBwcmVzdW1lZCB0byBoYXZlIHRoZQo+ICsgKiBIQiBh
bmQgT1VUIGJpdHMgc2V0Lgo+ICsgKi8KPiArI2RlZmluZSBWTVdBUkVfSFlQRVJDQUxMX0hCX09V
VAkJCQkJCVwKPiArCUFMVEVSTkFUSVZFXzIoIm1vdncgJCIgVk1XQVJFX0hZUEVSVklTT1JfUE9S
VF9IQiAiLCAlJWR4OyByZXAgb3V0c2IiLCBcCgpIbW0sIHRoYXQgbG9va3MgZmlzaHk6CgpUaGlz
IGNhbGwgaW4gdm13X3BvcnRfaGJfb3V0KCksIGZvciBleGFtcGxlLCBnZXRzIGNvbnZlcnRlZCB0
byB0aGUgYXNtCmJlbG93IChJJ3ZlIGxlZnQgaW4gdGhlIGFzbSB0b3VjaGluZyBvbmx5IHJEWCku
CgojIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X21zZy5jOjE2MDogICAgICAgICAgICAg
IFZNV19QT1JUX0hCX09VVCgKI05PX0FQUAogICAgICAgIG1vdnp3bCAgMCglcmJwKSwgJWVkeCAg
ICMgY2hhbm5lbF8yMChEKS0+Y2hhbm5lbF9pZCwgY2hhbm5lbF8yMChEKS0+Y2hhbm5lbF9pZAoK
CS4uLgoKICAgICAgICBzYWxsICAgICQxNiwgJWVkeCAgICAgICAjLCB0bXAxNzIKICAgICAgICBv
cmwgICAgICQzLCAlZWR4ICAgICAgICAjLCB0bXAxNzMKCnRoaXMgaXMgYWRkaW5nIGNoYW5uZWxf
aWQgYW5kIGZsYWdzOgoKICAgICAgICAgICAgICAgICAgICAgICAgVk1XQVJFX0hZUEVSVklTT1Jf
SEIgfCAoY2hhbm5lbC0+Y2hhbm5lbF9pZCA8PCAxNikgfAogICAgICAgICAgICAgICAgICAgICAg
ICBWTVdBUkVfSFlQRVJWSVNPUl9PVVQsCgp0aGUgJDMgYmVpbmcgKFZNV0FSRV9IWVBFUlZJU09S
X0hCIHwgVk1XQVJFX0hZUEVSVklTT1JfT1VUKS4KCiAgICAgICAgbW92c2xxICAlZWR4LCAlcmR4
ICAgICAgIyB0bXAxNzMsIHRtcDE3NAoKSGVyZSBpdCBpcyBzaWduLWV4dGVuZGluZyBpdC4KCiNB
UFAKIyAxNjAgImRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X21zZy5jIiAxCiAgICAgICAg
cHVzaCAlcmJwO21vdiAlcjgsICVyYnA7IyBBTFQ6IG9sZGluc3RyMiAgICAgICAgIyBicAo2NjE6
CiAgICAgICAgbW92dyAkMHg1NjU5LCAlZHg7IHJlcCBvdXRzYgoKQW5kIG5vdyBoZXJlIHlvdSdy
ZSBvdmVyd3JpdGluZyB0aGUgbG93IHdvcmQgb2YgJWVkeC4gQW5kIG5vdyBpdApjb250YWluczoK
CjB4W2NoYW5uZWxfaWRdNTY1OQoKYW5kIHRoZSBsb3cgd29yZCBkb2Vzbid0IGNvbnRhaW4gdGhl
IDMsIGkuZS4sIChWTVdBUkVfSFlQRVJWSVNPUl9IQiB8ClZNV0FSRV9IWVBFUlZJU09SX09VVCkg
YW55bW9yZS4gQW5kIHRoYXQncyBiZWZvcmUgeW91IGRvIHRoZSBoeXBlcmNhbGwKc28gSSdtIGd1
ZXNzaW5nIHRoYXQgY2Fubm90IGJlIHJpZ2h0LgoKT3I/CgotLSAKUmVnYXJkcy9HcnVzcywKICAg
IEJvcmlzLgoKR29vZCBtYWlsaW5nIHByYWN0aWNlcyBmb3IgNDAwOiBhdm9pZCB0b3AtcG9zdGlu
ZyBhbmQgdHJpbSB0aGUgcmVwbHkuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
