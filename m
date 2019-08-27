Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A129E8B7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 15:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C8789AB5;
	Tue, 27 Aug 2019 13:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C25789AB5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 13:10:37 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0CD000F02F6C1468024718.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0c:d000:f02f:6c14:6802:4718])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 975791EC0B89;
 Tue, 27 Aug 2019 15:10:33 +0200 (CEST)
Date: Tue, 27 Aug 2019 15:10:29 +0200
From: Borislav Petkov <bp@alien8.de>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v2 2/4] x86/vmware: Add a header file for hypercall
 definitions
Message-ID: <20190827131029.GF29752@zn.tnic>
References: <20190823081316.28478-1-thomas_os@shipmail.org>
 <20190823081316.28478-3-thomas_os@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190823081316.28478-3-thomas_os@shipmail.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alien8.de; s=dkim; t=1566911433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1O36I11NR1TCXF+c0kx9q6zN8+NXYhHhq5Irre2ThJw=;
 b=eL3U/jP2V+9BgFmUx2XVAEzxHUZCz/v86h5uaRhGjMr31UHC+T2CTAkJSXBFSpwruJ1XvO
 gBUuQnvSiU8VFgpWBOnNbhbeKHz7Be5KDdYVQv8jCO1AI1FJMduxPKTWMaGj4DvmS1AVpf
 pDpkFlNfJpLwsKGI8UtliZUEbNSdwOM=
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
tm0gKFZNd2FyZSkgd3JvdGU6Cj4gRnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2
bXdhcmUuY29tPgo+IAo+IFRoZSBuZXcgaGVhZGVyIGlzIGludGVuZGVkIHRvIGJlIHVzZWQgYnkg
ZHJpdmVycyB1c2luZyB0aGUgYmFja2Rvb3IuCj4gRm9sbG93IHRoZSBrdm0gZXhhbXBsZSB1c2lu
ZyBhbHRlcm5hdGl2ZXMgc2VsZi1wYXRjaGluZyB0bwo+IGNob29zZSBiZXR3ZWVuIHZtY2FsbCwg
dm1tY2FsbCBhbmQgaW8gaW5zdHJ1Y3Rpb25zLgo+IAo+IEFsc28gZGVmaW5lIHR3byBuZXcgQ1BV
IGZlYXR1cmUgZmxhZ3MgdG8gaW5kaWNhdGUgaHlwZXJ2aXNvciBzdXBwb3J0Cj4gZm9yIHZtY2Fs
bC0gYW5kIHZtbWNhbGwgaW5zdHJ1Y3Rpb25zLgoKSSBjb3VsZCB1c2Ugc29tZSBvZiB0aGUgZXhw
bGFuYXRpb24gd2h5IHdlIG5lZWQgdHdvIGZlYXR1cmUgZmxhZ3MgYWRkZWQKaGVyZSBmcm9tOgoK
aHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvci85NzBkMmJiNi1hYjI5LTMxNWYtZjVkOC01ZDExMDk1
ODU5YWZAc2hpcG1haWwub3JnCgpUaHguCgotLSAKUmVnYXJkcy9HcnVzcywKICAgIEJvcmlzLgoK
R29vZCBtYWlsaW5nIHByYWN0aWNlcyBmb3IgNDAwOiBhdm9pZCB0b3AtcG9zdGluZyBhbmQgdHJp
bSB0aGUgcmVwbHkuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
