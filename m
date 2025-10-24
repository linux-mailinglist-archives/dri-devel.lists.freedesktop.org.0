Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BBCC0466C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 07:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A740E10E153;
	Fri, 24 Oct 2025 05:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="Mwu6CBMu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E1310E153
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 05:34:07 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-427060bc0f5so884231f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 22:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1761284046; x=1761888846;
 darn=lists.freedesktop.org; 
 h=in-reply-to:autocrypt:references:cc:to:from:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UdeClZXIUWVGOl1GLOaOrjFt7x8K2F6/WYmVgfCof5o=;
 b=Mwu6CBMuva5xup+AM21D0GX1Cc9G0Fu9tTkIAwNabhS4KuMSasreUnpwqyQLjILnrq
 eGRN8eNheg+dRxQL6RW4FZlQq6Z7XgmZpEZcwX10Ky6ZqSumZMkY1G0CXBf0niOcTYku
 hOipbMAKQDZvPc98y0ceBlqpv9QWqrmM+MzzR00ilYo1PXq22FmOfFUhsZ174Bxdm3la
 iDsc2H7JgqHOA7oD5GV8VFrEjURgACK8BhJmH/rOBo+1zKUaZu5dT3+qibNh9qmV7MJZ
 Bsz+KYLMqEuqZmPzr6Aexi7bBwBNrGMV54IAhefwTgYzaFYNGyvxZ/p5U1QWut51S99Y
 kE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761284046; x=1761888846;
 h=in-reply-to:autocrypt:references:cc:to:from:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UdeClZXIUWVGOl1GLOaOrjFt7x8K2F6/WYmVgfCof5o=;
 b=crzT7UFs/TO8LfootaLBkGZfNg3sJ+HV+X3L+746C8xoV/ns89+kjceKmJYALYifeA
 +Wt/GLr8tN11oIrWjs/I4rLnqYNbTwuGtcOMPVn2y/c2n0h9GYe+6rgEm+lXyCdzHiCx
 ptqdbdagGy7O4SYKkTBT/PeJ2zl1psBxgcDxJAXlrNhYmSydf0ZNEMJxp4e/HeKFxIcB
 ggcbnIiPESTk3D/xoCmKUzcaKUAZrRWqN+tWAGtH+aRCg7IO2RXZSqj7qzdJ0mDFv+LO
 TC7cwU4UDjpfAjho2e3TOnS42aPTv1AFOTAYNo0TdiBNtF/8LwimMZIGpjjx0xfICW5z
 RQfQ==
X-Gm-Message-State: AOJu0YyDol+oD6W2x6Wtg+JGgjBo87Z3Lqa+WjxNLs+V8EfbHebOADs3
 gSfPrzkHFQzc3Y3W1yNDpObK/wMDMObFdQvwAZMtBgcoDGamdUmVcbg=
X-Gm-Gg: ASbGncs2iP1cirZwtJDJfvjy7CZjYAtbx5DknsawXeTUlSTKTWFTUtFDi6Y0fwWGJ0I
 EB1Tj2upU1eGvSsGSOAFe9U3L0E/RsA/vVfm49DjqQmFXZgdiiKAEqsCrG8y+Fb9J7TnKNq9paM
 iiISmNKrhwGS/HomJoaL+Xhwxif2HjgcnjWue5UQoI81DLR1LhutZ7LTtIcr6SvWlX/HScevtz3
 B93UA0c3g6d9GNGYYUwI8RN53aV8FYKHoyMChwzIJpn7h6egbCxqfIws9qI9RMHP6C8E71DBfyq
 9edaFyFdq9wOeDPMz2QOr7qsR63vXMDKT8O5B0EH40V23Xfv6dPin5Sv00hAj5d2rqRgOpv7Cbv
 iQhZoCLZRXeL2/a9c9jdPe3BIvqDPllL8gYCubraHKq3S8SIYBNmrMLMzlttF4OeehImg4cXpSV
 D1u21HHTNHlpE4apylfEHxexNgiYstkioPw0x0AdekTVeLUyAoYMxfaQyA7VPezHI=
X-Google-Smtp-Source: AGHT+IGTb0BhNtLXZjL89zHnvhnrIYZlTtJyn9gLCubUjapXa+451SyphIYoQs9g+1Ce4F+c0arbCA==
X-Received: by 2002:a05:6000:4011:b0:427:9d7:870f with SMTP id
 ffacd0b85a97d-4299070199dmr708125f8f.5.1761284045381; 
 Thu, 23 Oct 2025 22:34:05 -0700 (PDT)
Received: from [192.168.1.3] (p5b2b41b7.dip0.t-ipconnect.de. [91.43.65.183])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898acc63sm7417423f8f.27.2025.10.23.22.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 22:34:04 -0700 (PDT)
Message-ID: <045e6362-01db-47f3-9a4f-8a86b2c15d00@googlemail.com>
Date: Fri, 24 Oct 2025 07:34:03 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [REGRESSION][BISECTED] Screen goes blank with ASpeed AST2300 in
 6.18-rc2
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, regressions@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 jfalempe@redhat.com, airlied@redhat.com, dianders@chromium.org,
 nbowler@draconx.ca, Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <20251014084743.18242-1-tzimmermann@suse.de>
 <a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com>
 <43992c88-3a3a-4855-9f46-27a7e5fdec2e@suse.de>
 <798ba37a-41d0-4953-b8f5-8fe6c00f8dd3@googlemail.com>
 <bf827c5c-c4dd-46f1-962d-3a8e2a0a7fdf@suse.de>
 <5f8fba3b-2ee1-4a02-9b41-e6e1de1a507a@googlemail.com>
 <e2462c92-4049-486b-92d7-e78aaec4b05d@suse.de>
 <3ca10b2e-fb9c-4495-9219-5e8537314751@googlemail.com>
 <329a9f97-dd66-49c2-bc42-470566d01539@suse.de>
 <270ce9a3-5067-4ef8-9205-414b5667cf3a@googlemail.com>
Autocrypt: addr=pschneider1968@googlemail.com; keydata=
 xjMEY58biBYJKwYBBAHaRw8BAQdADPnoGTrfCUCyH7SZVkFtnlzsFpeKANckofR4WVLMtMzN
 L1BldGVyIFNjaG5laWRlciA8cHNjaG5laWRlcjE5NjhAZ29vZ2xlbWFpbC5jb20+wpwEExYK
 AEQCGyMFCQW15qgFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQSjgovXlszhGoyt6IZu
 OpLJLD/yRAUCY58b8AIZAQAKCRBuOpLJLD/yRIeIAQD0+/LMdKHM6AJdPCt+e9Z92BMybfnN
 RtGqkdZWtvdhDQD9FJkGh/3PFtDinimB8UOB7Gi6AGxt9Nu9ne7PvHa0KQXOOARjnxuIEgor
 BgEEAZdVAQUBAQdAw2GRwTf5HJlO6CCigzqH6GUKOjqR1xJ+3nR5EbBze0sDAQgHwn4EGBYK
 ACYWIQSjgovXlszhGoyt6IZuOpLJLD/yRAUCY58biAIbDAUJBbXmqAAKCRBuOpLJLD/yRONS
 AQCwB9qiEQoSnxHodu8kRuvUxXKIqN7701W+INXtFGtJygEAyPZH3/vSBJ4A7GUG7BZyQRcr
 ryS0CUq77B7ZkcI1Nwo=
In-Reply-To: <270ce9a3-5067-4ef8-9205-414b5667cf3a@googlemail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------krXW3u9GCz73FBYeJPBWkLil"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------krXW3u9GCz73FBYeJPBWkLil
Content-Type: multipart/mixed; boundary="------------sW3anxa1r6YezvSATKrGS7PM";
 protected-headers="v1"
From: Peter Schneider <pschneider1968@googlemail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, regressions@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 jfalempe@redhat.com, airlied@redhat.com, dianders@chromium.org,
 nbowler@draconx.ca, Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Message-ID: <045e6362-01db-47f3-9a4f-8a86b2c15d00@googlemail.com>
Subject: Re: [REGRESSION][BISECTED] Screen goes blank with ASpeed AST2300 in
 6.18-rc2
References: <20251014084743.18242-1-tzimmermann@suse.de>
 <a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com>
 <43992c88-3a3a-4855-9f46-27a7e5fdec2e@suse.de>
 <798ba37a-41d0-4953-b8f5-8fe6c00f8dd3@googlemail.com>
 <bf827c5c-c4dd-46f1-962d-3a8e2a0a7fdf@suse.de>
 <5f8fba3b-2ee1-4a02-9b41-e6e1de1a507a@googlemail.com>
 <e2462c92-4049-486b-92d7-e78aaec4b05d@suse.de>
 <3ca10b2e-fb9c-4495-9219-5e8537314751@googlemail.com>
 <329a9f97-dd66-49c2-bc42-470566d01539@suse.de>
 <270ce9a3-5067-4ef8-9205-414b5667cf3a@googlemail.com>
In-Reply-To: <270ce9a3-5067-4ef8-9205-414b5667cf3a@googlemail.com>

--------------sW3anxa1r6YezvSATKrGS7PM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgVGhvbWFzLA0KDQoNCkFtIDIzLjEwLjIwMjUgdW0gMjE6MTEgc2NocmllYiBQZXRlciBT
Y2huZWlkZXI6DQo+IEhpIFRob21hcywNCj4gDQo+IEFtIDIzLjEwLjIwMjUgdW0gMTQ6NDYg
c2NocmllYiBUaG9tYXMgWmltbWVybWFubjoNCj4gWy4uLl0NCj4+IEkndmUgYmVlbiBhYmxl
IHRvIHJlcHJvZHVjZSB0aGUgcHJvYmxlbSB3aXRoIGFuIEFTVDIzMDAgdGVzdCBzeXN0ZW0u
IFRoZSBhdHRhY2hlZCBwYXRjaCBmaXhlcyB0aGUgcHJvYmxlbSBmb3IgbWUuIENhbiANCj4+
IHlvdSBwbGVhc2UgdGVzdCBhbmQgcmVwb3J0IG9uIHRoZSByZXN1bHRzPw0KPiANCj4gR3Jl
YXQhIC0gdGhpcyBwYXRjaCBvbiB0b3Agb2YgNi4xOC1yYzIgZml4ZXMgdGhlIGlzc3VlIGZv
ciBtZSwgdG9vLiBUaGFua3MgdmVyeSBtdWNoIGZvciB5b3VyIGVmZm9ydCENCj4gDQo+IFRl
c3RlZC1ieTogUGV0ZXIgU2NobmVpZGVyIDxwc2NobmVpZGVyMTk2OEBnb29nbGVtYWlsLmNv
bT4NCg0KTWVhbndoaWxlLCBJIGhhdmUgYWxzbyB0ZXN0ZWQgdGhpcyBhZ2FpbnN0IHN0YWJs
ZSA2LjEyLjU1IGFuZCA2LjE3LjUsIHdoZXJlIGluIC1yYzIsIEdyZWcgZHJvcHBlZCB5b3Vy
IG9yaWdpbmFsIHBhdGNoIA0Kd2l0aCB1cHN0cmVhbSBjb21taXQtaWQgNmY3MTkzNzNiOTQz
YTk1NWZlZTZmYzIwMTJhZWQyMDdiNjVlMjg1NCBiZWZvcmUgdGhlIGZpbmFsIHJlbGVhc2Ug
YmVjYXVzZSBvZiBteSByZXBvcnQuDQoNClNvIGZvciBib3RoLCBJIGJ1aWx0IHRoZW0sIG1h
ZGUgc3VyZSBpdCB3b3JrZWQgb2suIFRoZW4gSSBkaWQgImdpdCBjaGVycnktcGljayA2Zjcx
OTM3M2I5NDNhOTU1ZmVlNmZjMjAxMmFlZDIwN2I2NWUyODU0IiANCmFuZCB0ZXN0ZWQgdGhh
dCBpdCBpcyBicm9rZW4gYWdhaW4uIFRoZW4gSSBhcHBsaWVkIHlvdXIgbGFzdCBwYXRjaCBv
biB0b3Agb2YgaXQsIGFuZCBpdCB3b3JrZWQgZmluZSwgc28gd2l0aCB0aGF0IHRoZSANCmlz
c3VlIGlzIGZpeGVkIGluIGJvdGggc3RhYmxlIHZlcnNpb25zLCB0b28uDQoNCklmIHlvdSBz
ZW5kIGEgY29tYmluZWQgcGF0Y2ggdG8gR3JlZyBmb3Igc3RhYmxlLCBwbGVhc2UgZmVlbCBm
cmVlIHRvIGFkZCBteQ0KDQpUZXN0ZWQtYnk6IFBldGVyIFNjaG5laWRlciA8cHNjaG5laWRl
cjE5NjhAZ29vZ2xlbWFpbC5jb20+DQoNCg0KVGhhbmtzIGFnYWluIQ0KDQpCZXN0ZSBHcsO8
w59lLA0KUGV0ZXIgU2NobmVpZGVyDQoNCi0tIA0KQ2xpbWIgdGhlIG1vdW50YWluIG5vdCB0
byBwbGFudCB5b3VyIGZsYWcsIGJ1dCB0byBlbWJyYWNlIHRoZSBjaGFsbGVuZ2UsDQplbmpv
eSB0aGUgYWlyIGFuZCBiZWhvbGQgdGhlIHZpZXcuIENsaW1iIGl0IHNvIHlvdSBjYW4gc2Vl
IHRoZSB3b3JsZCwNCm5vdCBzbyB0aGUgd29ybGQgY2FuIHNlZSB5b3UuICAgICAgICAgICAg
ICAgICAgICAtLSBEYXZpZCBNY0N1bGxvdWdoIEpyLg0KDQpPcGVuUEdQOiAgMHhBMzgyOEJE
Nzk2Q0NFMTFBOENBREU4ODY2RTNBOTJDOTJDM0ZGMjQ0DQpEb3dubG9hZDogaHR0cHM6Ly93
d3cucGV0ZXJzLW5ldHpwbGF0ei5kZS9kb3dubG9hZC9wc2NobmVpZGVyMTk2OF9wdWIuYXNj
DQpodHRwczovL2tleXMubWFpbHZlbG9wZS5jb20vcGtzL2xvb2t1cD9vcD1nZXQmc2VhcmNo
PXBzY2huZWlkZXIxOTY4QGdvb2dsZW1haWwuY29tDQpodHRwczovL2tleXMubWFpbHZlbG9w
ZS5jb20vcGtzL2xvb2t1cD9vcD1nZXQmc2VhcmNoPXBzY2huZWlkZXIxOTY4QGdtYWlsLmNv
bQ0KDQo=

--------------sW3anxa1r6YezvSATKrGS7PM--

--------------krXW3u9GCz73FBYeJPBWkLil
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSjgovXlszhGoyt6IZuOpLJLD/yRAUCaPsPywUDAAAAAAAKCRBuOpLJLD/yRMTK
AQDvnxYz2SoIs89+Y3maGD8FqHLRNa/qNgyLwgJi8LTPgAEAz53/dKzJ2V6mQEzWOU1q434RwUzW
ArPxnqW9ZjujIwc=
=oSt3
-----END PGP SIGNATURE-----

--------------krXW3u9GCz73FBYeJPBWkLil--
