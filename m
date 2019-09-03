Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 572E0A73B0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 21:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320CE897DC;
	Tue,  3 Sep 2019 19:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BF4897DC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 19:31:59 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id y23so6139806lje.9
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 12:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eB6WrTAcLD9Gbp4iRCGmZgUvUmSFeTCckaUxifM5qYM=;
 b=uTxMhnC8Jf+31ZSbYnLtQBdfMYZXMQ6miiGcpkxIHaw32s63xyIIrIlxp8f9klHCBd
 tQZgedUEIJvSHiZejO0ld4I/1Fu+hM/1urERbU+hfUSGyJCgPpOl4NYV593+54XT3ESi
 c5A+C7rqNm1xdfucQLxsIkmxCp60T/wFz12alyQsL1dsAPww9zhFbCyZpdLevY5rAO+z
 aaxqksx5c/MmDrx59gcYSCH/yAopHF0jYrNVlae1/n+clMP0PJlHhcbkIdZA1KwVHN6F
 Sk9hGPiLynYwBuCh4xobwjMEQfpSzz4msuNCBHFlL22wfXipj1Yv+sjmUhzxu8SaDawO
 G0pw==
X-Gm-Message-State: APjAAAV2fyjSB9qWJogEPmzt2jfMOjijwK/j7ARCJVlerP9HRnmjFo7c
 84iRB51inGX8jJbaTraefNtQyWd5pwiXf6phXpA=
X-Google-Smtp-Source: APXvYqzdvQIu+wPn4w7MtsJE1czL9CYq6VG2Gy0tHfnx3EpAYCEpGYPXWRQRcP3BV0Hkd68Bq7QQx3ZRKX8GZxq8IJg=
X-Received: by 2002:a2e:6586:: with SMTP id e6mr14527471ljf.115.1567539117674; 
 Tue, 03 Sep 2019 12:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5Cuk+t16bNFA+sm5=ZEdf+BNRtSpX27OCoQ==DbEyBtCw@mail.gmail.com>
 <ec11a377-fca3-ed12-2a05-abb3de936f8b@arm.com>
 <CAOMZO5BK0CJ8aA0CdBrYF75FRRHjqm0aOM4TpS9C+nHVuD8M_w@mail.gmail.com>
 <CAF6AEGtGXshOACrHYE7kkfvsBXRZ_ZF3xugJDOEFP9zr--vB5g@mail.gmail.com>
 <95ae3680-02c7-a1b8-5ea6-1a4d89293649@marek.ca>
In-Reply-To: <95ae3680-02c7-a1b8-5ea6-1a4d89293649@marek.ca>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 3 Sep 2019 16:32:06 -0300
Message-ID: <CAOMZO5C7m6ZfFVXna18ZSZDgiggyTygK5VXZLxkx5Hg6Sy6G4w@mail.gmail.com>
Subject: Re: Adreno crash on i.MX53 running 5.3-rc6
To: Jonathan Marek <jonathan@marek.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=eB6WrTAcLD9Gbp4iRCGmZgUvUmSFeTCckaUxifM5qYM=;
 b=k3yYznrsbr9ZBoGW0GXkVHMcFGrZVadRQv2jaeI8yPQYXyrUBEa+zwqhISASCQSnpb
 /8s4wjPkoPZw6igj/eTgZtqZWw2S0kj029wMAWlR6iaAlOpl4YuuL/vwUWr4q/GZ30Kw
 cqu5cLN9iCeYr1M2JxaspW0vCv/fJtq8N5ujuJshTXcjZvH2Cvflpf92F4ij+Hx92gHT
 eaKS46lE0lRDThmmwxEHblgdJM4z9M3Ld78KsQvCxek6KZ1K/oPAe/Wbi/gMTcQWTZxq
 DYBV7P7VxyEE5apIYK6ezWiHjhHg9xHrrLLeKMGs8Wvr618C0nFCr+CQgwm5T/he3mmU
 9QUg==
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9uYXRoYW4sCgpPbiBUdWUsIFNlcCAzLCAyMDE5IGF0IDQ6MjUgUE0gSm9uYXRoYW4gTWFy
ZWsgPGpvbmF0aGFuQG1hcmVrLmNhPiB3cm90ZToKPgo+IEhpLAo+Cj4gSSB0cmllZCB0aGlzIGFu
ZCBpdCB3b3JrcyB3aXRoIHBhdGNoZXMgNCs1IGZyb20gUm9iJ3Mgc2VyaWVzIGFuZAo+IGNoYW5n
aW5nIGdwdW1tdSB0byB1c2Ugc2dfcGh5cyhzZykgaW5zdGVhZCBvZiBzZy0+ZG1hX2FkZHJlc3MK
PiAoZG1hX2FkZHJlc3MgaXNuJ3Qgc2V0IG5vdyB0aGF0IGRtYV9tYXBfc2cgaXNuJ3QgdXNlZCku
CgpUaGFua3MgZm9yIHRlc3RpbmcgaXQuIEkgaGF2ZW4ndCBoYWQgYSBjaGFuY2UgdG8gdGVzdCBp
dCB5ZXQuCgpSb2IsCgpJIGFzc3VtZSB5b3VyIHNlcmllcyBpcyB0YXJnZXRlZCB0byA1LjQsIGNv
cnJlY3Q/CgpJZiB0aGlzIGlzIHRoZSBjYXNlLCB3aGF0IHdlIHNob3VsZCBkbyBhYm91dCB0aGUg
aS5NWDUgcmVncmVzc2lvbiBvbiA1LjM/CgpXb3VsZCBhIHJldmVydCBvZiB0aGUgdHdvIGNvbW1p
dHMgYmUgYWNjZXB0YWJsZSBpbiA1LjMgaW4gb3JkZXIgdG8KYXZvaWQgdGhlIHJlZ3Jlc3Npb24/
CgpQbGVhc2UgYWR2aXNlLgoKVGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
