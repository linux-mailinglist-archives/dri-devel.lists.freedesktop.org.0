Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E738B1B1024
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 17:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D866E5CC;
	Mon, 20 Apr 2020 15:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8D16E5CA;
 Mon, 20 Apr 2020 15:30:25 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s10so3569942wrr.0;
 Mon, 20 Apr 2020 08:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PD5DeOdqi6e0MkxPAfwdJyP3eDR+86tLjrIumXPzzT4=;
 b=bp8Y7lB6hXvn9JH54tFD2UDbpwmiblTLlKAIT3+DCmvZle1bg3aC3vYn1nqOyiR5OY
 HgL3OGsbeJva2GrenO/QQ9jEXf99AjvliEDPB66I7Q3lm0BMgokvt7k9nT4P1r6k8aCn
 5PLeAowMTscry4PrfawUrthTM4pC+ndE/nZL5Zv9YlQ0cyO1KWbw11HmyXClk5QiMx+G
 1A+0vJ5x/0My02ge4tzFk8os5rcxhHmpPqt88QASYX3j7OJFqLDkeX20CT4Ald8jIsYD
 jUITLIwrB69buHlkbfNn8nJX2dyIUQkrPgAK9AToP92RpJSZ0C5ftuPFuOyAtZ5ipn3C
 ralw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PD5DeOdqi6e0MkxPAfwdJyP3eDR+86tLjrIumXPzzT4=;
 b=XsFhJEUrHUbPHgYvaDcFM98G3jZp7kw5MFUxnwEAqzb2p4zz5akTOz5AC8QJ/pJRRP
 hCiCrMRLtd+hBgan0YkabcnTC5MExCkOs/xD6yHDspg0E6oa1nkZwY1bM309qTI1I1dj
 NuKwAD8TGWzBgQqDM/bgBpgYwzhl1x3T5ZXOappANoygTk2l7FK2qkcl6khi/TI/7BGX
 hQ9HfeynFBNDL8f7AIpdRXyuybvB5uxqA3EHSz99eD104GQi4GsQ1jtfMUhoUVDTBILh
 IcDi9DgrwWQ26+Auoh1jlmYa2llzT0yGHbLpkoz6bNpCASnu79ngFA+cowtGPWhwq3bd
 SMFQ==
X-Gm-Message-State: AGi0PuZYSSNKz/wPtYp7JI4igOyb0LuGGt4rf6KR6rpL5RhpHsXtvgsZ
 /T2zWiW5hio3j6FdlcaLjlaRZ5tz7lbDa/25UMg4DGuV
X-Google-Smtp-Source: APiQypJNVGW7y4CcAc7fYlBuLAQtsl07x5NtoSods0LPEQbSJ1ymdgu97+hTSGZ3nDodKZ90UfA1dTb1tUYmxNTUDzs=
X-Received: by 2002:a5d:498d:: with SMTP id r13mr20138167wrq.374.1587396623955; 
 Mon, 20 Apr 2020 08:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsN=SNp7Ub3KHmsGrg+5R1g13HMea2+Jw+hTer3g74q21Q@mail.gmail.com>
 <4a9ae285-f126-c83b-b55f-36bd7a4403a0@gmail.com>
 <CABXGCsNSni7cjufva_n-VZQ4HKY2osBL4JB2kk_z7Pzv2u10MQ@mail.gmail.com>
In-Reply-To: <CABXGCsNSni7cjufva_n-VZQ4HKY2osBL4JB2kk_z7Pzv2u10MQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 Apr 2020 11:30:12 -0400
Message-ID: <CADnq5_NXtSfn1C8kceQ_Bfmu9LbgRTPVq_s6yk-6BG23ZB10Qg@mail.gmail.com>
Subject: Re: BUG: kernel NULL pointer dereference, address: 0000000000000026
 after switching to 5.7 kernel
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
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
Cc: Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Russell,
 Kent" <Kent.Russell@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBBcHIgMTgsIDIwMjAgYXQgNzoxMyBBTSBNaWtoYWlsIEdhdnJpbG92CjxtaWtoYWls
LnYuZ2F2cmlsb3ZAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFNhdCwgMTEgQXByIDIwMjAgYXQg
MTQ6NTYsIENocmlzdGlhbiBLw7ZuaWcKPiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5j
b20+IHdyb3RlOgo+ID4KPiA+IFllYWgsIHRoYXQgaXMgYSBrbm93biBpc3N1ZS4KPiA+Cj4gPiBZ
b3UgY291bGQgdHJ5IHRoZSBhdHRhY2hlZCBwYXRjaCwgYnV0IHBsZWFzZSBiZSBhd2FyZSB0aGF0
IGl0IGlzIG5vdAo+ID4gZXZlbiBjb21waWxlIHRlc3RlZCBiZWNhdXNlIG9mIHRoZSBFYXN0ZXIg
aG9saWRheXMgaGVyZS4KPiA+Cj4KPiBMb29rcyBnb29kIHRvIG1lLCBzbyBpdCdzIHBpdHkgdGhh
dCB0aGlzIHBhdGNoIGRpZCBub3QgZXhpc3QgaW4gdGhlCj4gcHVsbCByZXF1ZXN0IGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTE0OTIwODMvCgpJdCBzaG91bGQgc2hvdyB1cCBp
biB0aGUgbmV4dCBkcm0tbWlzYyBQUjoKaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0v
ZHJtLW1pc2MvY29tbWl0Lz9oPWRybS1taXNjLWZpeGVzJmlkPTg2MjNiNTI1NWFlN2NjYWYyNzZh
YWMzOTIwNzg3YmY1NzVmYTZiMzcKCkFsZXgKCj4KPiAtLQo+IEJlc3QgUmVnYXJkcywKPiBNaWtl
IEdhdnJpbG92Lgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
