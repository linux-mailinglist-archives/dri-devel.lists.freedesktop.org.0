Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 559EA1CFD21
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 20:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728C86E963;
	Tue, 12 May 2020 18:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32E26E963
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 18:21:46 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z72so15128484wmc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 11:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9l3CA79+13bWuu9J2EgJ1Ury/GE/2gpZcI31ubE68xA=;
 b=NHRzWZ4ZdWBEpeDwCvKocC3GhhXI9vCFx7OI3OzblzSO4Lig2GsthSzMG89OUyZscI
 X7/Zw90DQLUcf70xVaLECqoo1v7rvwuBbjbMCeTux60apc2yR8aSS+15GiKHUPFBrAP9
 1FNPNcqx1mOZ7a5wMYfA1l578q2cAgAUjWnJVes4784t/ey1GLxRUWWI9S551TLSf4qV
 av4wYq0pk7j4pFbaj4iD2LdJ10oM1t8Oh2NEakLuNArZe2uQ6/0jcBf582rGHFOfchAL
 mWZrA3TJZXq6sQ0BoUs3pEGC8H7IR4NRK/Li+xGbilVIBREzOBlzq10QU1owXtL1aUA+
 QcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9l3CA79+13bWuu9J2EgJ1Ury/GE/2gpZcI31ubE68xA=;
 b=NdB8UmEW1m+B5H23lGLqsT+y0Y8JgOjESqHEcIsnXpcm4j39cwooJjCZpRD8itAR/b
 vp8ifFj9j5JeITCY24y9xlX+lk5G2xVNgC9w7zkjMAvGUXhYDLtd1pvi2nb1t76npm0r
 UWK660o2H6ZgANq+RtOyoS+jM9FmjUKm45TlTCx1efhvxLndbMOwECRvei95y5ZzAe5p
 u5G0WTdB389y248TKU6ZH+DMTwS4f6oUwPQ/pmbRN6STTN0/dC5nRQl4VtZZUeKuU/2m
 5zRJlB2vDJgnPzZmBDIZ98q66venx2TwUZ+LofGok4ZtwDM8kBlJli+n3aCFwJFGP2dZ
 7bYQ==
X-Gm-Message-State: AGi0PubruaQiWbLjt0PF477EBsr3CYkPvzWRdhD/Efb62ne4VDyRMRqY
 ihDsIrYsYpfxUMr4kCLkQrRkOiU0aXy3d64bWh0=
X-Google-Smtp-Source: APiQypI7BabITRRXxI0xTK8paxcIrh4DeI0cqvA0io/MiPkqY9GV2+hN2mrDkCGySwnqVGAukXiyO9w50HuPnb/jdnE=
X-Received: by 2002:a05:600c:243:: with SMTP id
 3mr34580085wmj.73.1589307705607; 
 Tue, 12 May 2020 11:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
 <CALjTZvZcg60rgDux7+Kh3zaMBkd-OiqoJ7GyYrLxfvnwgc4Xng@mail.gmail.com>
 <CADnq5_M61r7CMtfMBx6Cf_N9SnJJn0PouiMjVg8wytEMF1YZfw@mail.gmail.com>
 <c5d29422-21bd-b786-c822-5643730ab8a6@daenzer.net>
 <CALjTZvZOHyEFVv-2RV94dFKDFQY4zxYEHt5uQ+1B48Npo4AwRw@mail.gmail.com>
 <alpine.DEB.2.02.2005121124110.28199@scenergy.dfmk.hu>
 <CADnq5_PwY5czTPepDwzc5qoMJ3cKc4Mui=uN=k1EOtmOD42Log@mail.gmail.com>
 <CAKMK7uG3R4uve41MkkcFSiDJ+p=MwW81gcFW7NFENjKbdDUZ+g@mail.gmail.com>
 <CALjTZvabx+-Hg3A1vZ=zt5=zrL8wuOLZ5=BZD6iio+-Oj7qBgQ@mail.gmail.com>
In-Reply-To: <CALjTZvabx+-Hg3A1vZ=zt5=zrL8wuOLZ5=BZD6iio+-Oj7qBgQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 May 2020 14:21:34 -0400
Message-ID: <CADnq5_Otu2vVpXysmt7icsVgJ_OyR9VJBEdF0JxTcr8mwWN3TQ@mail.gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Rui Salvaterra <rsalvaterra@gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "Karoly Balogh \(Charlie/SGR\)" <charlie@scenergy.dfmk.hu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTIsIDIwMjAgYXQgMTowMiBQTSBSdWkgU2FsdmF0ZXJyYSA8cnNhbHZhdGVy
cmFAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgMTIgTWF5IDIwMjAgYXQgMTc6MzgsIERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gPgo+ID4gT3RoZXJ3aXNlIGFs
bCBhZ3JlZSwgYWdwIGlzIGEgbWlnaHR5IG1lc3MgYW5kIGVzc2VudGlhbGx5IGp1c3QKPiA+IGNy
YXBzaG90IG91dHNpZGUgb2YgeDg2LiBJdCBraW5kYSB3b3JrZWQgZm9yIHRoZSBtdWNoIG1vcmUg
c3RhdGljCj4gPiBhbGxvY2F0aW9ucyBmb3IgZHJpMSwgYnV0IHdpdGggaW4ta2VybmVsIG1lbW9y
eSBtYW5hZ2VycyBhbGwgdGhlIGNhY2hlCj4gPiBmbHVzaGluZyBpc3N1ZXMgc2hvd2VkIHVwIGJp
ZyB0aW1lIGFuZCBpdCBhbGwgZmVsbCB0byBwaWVjZXMuIFBsdXMgYQo+ID4gbG90IG9mIHRoZXNl
IGhvc3QgY2hpcHNldCBiYWNrIHRoZW4gd2hlcmUgZGVzaWduZWQgZm9yIHRoZSByYXRoZXIKPiA+
IHN0YXRpYyB3aW5kb3dzIGdwdSBtYW5hZ2Vycywgc28gZXZlbiBvbiB4ODYgdGhlIGNvaGVyZW5j
eSBpc3N1ZXMgZm9yCj4gPiBhZ3AgbW9kZSB3aGVuIHVzZWQgdG9nZXRoZXIgd2l0aCB0dG0gb3Ig
c29tZXRoaW5nIGVsc2UgcmVhbGx5IGR5bmFtaWMKPiA+IGlzIHByZXR0eSBiYWQgYmVjYXVzZSB0
aGUgaHcganVzdCBkb2Vzbid0IHJlYWxseSBjb3BlIGFuZCBoYXMgYWxsCj4gPiBraW5kcyBvZiBm
bHVzaGluZyB0cm91YmxlcyBhbmQgcmFjZXMuIEkgdGhpbmsgdGhlIGxhdGVyIGFncCBjaGlwc2V0
cwo+ID4gd2VyZSBiZXR0ZXIuCj4KPiBUaGF0IHdhcyByYXRoZXIgaW5zaWdodGZ1bCwgdGhhbmtz
LiBJIHdhcyBzdGFydGluZyB0byBkb3VidCBteSBvd24KPiBtZW1vcnksIGFzIEkgd2FzIGFsbW9z
dCBzdXJlIEkgbmV2ZXIgaGFkIGFueSBoYW5ncyB3aXRoIEFHUCBvbiBQb3dlclBDCj4gYmVmb3Jl
IEtNUyB3YXMgYSB0aGluZy4gQnV0IGV2ZW4gb24geDg2LCBJIGRpc3RpbmN0bHkgcmVtZW1iZXIg
bmV2ZXIKPiBiZWluZyBhYmxlIHRvIGdldCBzaWRlYmFuZCBhZGRyZXNzaW5nIHdvcmtpbmcgd2l0
aCBhbnkgQUdQIGNhcmRzLCBteQo+IHN5c3RlbSB3b3VsZCByYW5kb21seSBoYW5nIHRvby4KPiBJ
J20gc3RhcnRpbmcgdG8gYmVsaWV2ZSBBR1Agd2FzIHNob2Vob3JuZWQgaW50byBQQ0kgdGhlIHNh
bWUgd2F5IFZMQgo+IHdhcyBzaG9laG9ybmVkIGludG8gSVNBIChhbmQgZm9yIHRoZSBzYW1lIHJl
YXNvbikuIEhpc3RvcnkgcmVwZWF0cwo+IGl0c2VsZuKApiA6KQoKUHJlLUtNUywgdGhlIGtlcm5l
bCBqdXN0IGFsbG9jYXRlZCBhIHN0YXRpYyByZWxhdGl2ZWx5IHNtYWxsIChlLmcuLCA4Ck1CKSBB
R1AgYnVmZmVyIHdoaWNoIG5ldmVyIGNoYW5nZWQuICBJbiB0aGF0IGNhc2UsIHRoaW5ncyB3ZXJl
CnNvbWV3aGF0IG1vcmUgcmVsaWFibGUuCgpBbGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
