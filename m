Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ACDB2277
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 16:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8746F3D2;
	Fri, 13 Sep 2019 14:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33ED6F3D2;
 Fri, 13 Sep 2019 14:46:31 +0000 (UTC)
Received: from localhost (195-23-252-136.net.novis.pt [195.23.252.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5411B20693;
 Fri, 13 Sep 2019 14:46:30 +0000 (UTC)
Date: Fri, 13 Sep 2019 10:46:27 -0400
From: Sasha Levin <sashal@kernel.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 4.19 092/190] drm/nouveau: Dont WARN_ON VCPI allocation
 failures
Message-ID: <20190913144627.GH1546@sasha-vm>
References: <20190913130559.669563815@linuxfoundation.org>
 <20190913130606.981926197@linuxfoundation.org>
 <CAKb7UviY0sjFUc6QqjU4eKxm2b-osKoJNO2CSP9HmQ5AdORgkw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7UviY0sjFUc6QqjU4eKxm2b-osKoJNO2CSP9HmQ5AdORgkw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568385990;
 bh=J5xCS6qDfWqX/oR/dT/1Krr6MkClnbbp6RqL+ShUXQ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qKf1IuthaIjCB+zSvask72TPeBzRFN8Ar5q/TDdAxFErkCDtaxsXaJ1TWNTPIq/im
 oOQ6BFWJohGM+8q9q7obhn+kZwljstP3SdPxiX4E00PnKa2ykv330kpfrXMiGwldXu
 nu1toTtSNJ/FacVeCW4muLpnHjq98kmPEf/MoRQI=
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, "# 3.9+" <stable@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMDk6MzM6MzZBTSAtMDQwMCwgSWxpYSBNaXJraW4gd3Jv
dGU6Cj5IaSBHcmVnLAo+Cj5UaGlzIGZlZWxzIGxpa2UgaXQncyBtaXNzaW5nIGEgRnJvbTogbGlu
ZS4KPgo+Y29tbWl0IGI1MTNhMThjZjFkNzA1YmQwNGVmZDkxYzQxN2U3OWU0OTM4YmUwOTMKPkF1
dGhvcjogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPkRhdGU6ICAgTW9uIEphbiAyOCAx
NjowMzo1MCAyMDE5IC0wNTAwCj4KPiAgICBkcm0vbm91dmVhdTogRG9uJ3QgV0FSTl9PTiBWQ1BJ
IGFsbG9jYXRpb24gZmFpbHVyZXMKPgo+SXMgdGhpcyBhbiBhcnRpZmFjdCBvZiB5b3VyIG5vdGlm
aWNhdGlvbi1vZi1wYXRjaGVzIHByb2Nlc3MgYW5kIEkKPm5ldmVyIG5vdGljZWQgYmVmb3JlLCBv
ciB3YXMgdGhlIHBhdGNoIGluZ2VzdGVkIGluY29ycmVjdGx5PwoKSXQgd2FzIGFsd2F5cyBsaWtl
IHRoaXMgZm9yIHBhdGNoZXMgdGhhdCBjYW1lIHRocm91Z2ggbWUuIEdyZWcncyBzY3JpcHQKZ2Vu
ZXJhdGVzIGFuIGV4cGxpY2l0ICJGcm9tOiIgbGluZSBpbiB0aGUgcGF0Y2gsIGJ1dCBJIG5ldmVy
IHNhdyB0aGUKdmFsdWUgaW4gdGhhdCBzaW5jZSBnaXQgZG9lcyB0aGUgcmlnaHQgdGhpbmcgYnkg
bG9va2luZyBhdCB0aGUgIkZyb206IgpsaW5lIGluIHRoZSBtYWlsIGhlYWRlci4KClRoZSByaWdo
dCB0aGluZyBpcyBiZWluZyBkb25lIGluIHN0YWJsZS1yYyBhbmQgZm9yIHRoZSByZWxlYXNlcy4g
Rm9yCnlvdXIgZXhhbXBsZSBoZXJlLCB0aGlzIGlzIGhvdyBpdCBsb29rcyBsaWtlIGluIHRoZSBz
dGFibGUtcmMgdHJlZToKCmNvbW1pdCBiZGNjODg1YmU2ODI4OWEzN2QwZDA2M2NkOTQzOTBkYTgx
ZmQ4MTc4CkF1dGhvcjogICAgIEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CkF1dGhvckRh
dGU6IE1vbiBKYW4gMjggMTY6MDM6NTAgMjAxOSAtMDUwMApDb21taXQ6ICAgICBHcmVnIEtyb2Fo
LUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpDb21taXREYXRlOiBGcmkgU2Vw
IDEzIDE0OjA1OjI5IDIwMTkgKzAxMDAKCiAgICBkcm0vbm91dmVhdTogRG9uJ3QgV0FSTl9PTiBW
Q1BJIGFsbG9jYXRpb24gZmFpbHVyZXMKCi0tClRoYW5rcywKU2FzaGEKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
