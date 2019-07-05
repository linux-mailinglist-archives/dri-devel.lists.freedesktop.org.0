Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE446031F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 11:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C654D6E45F;
	Fri,  5 Jul 2019 09:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C006E457
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 09:27:54 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id n9so34668wrr.4
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 02:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=foXuwNSs6hVpxiUDGSpsuSBV8gmJTCv8FWha8cAiqsQ=;
 b=abgxBSyCttKFQEUVHb+CCzPUiCOVsITJp6SW5ff0i9/Y5ruDs5ibv4cH8Xt1Mzv58/
 o6IV6kf+m3bIF1Q+PMI1DBtLv/55/Pk5WffoRBuzjc2hd0pkL3bSQsrDAlZzDY7rA7ZG
 2FWGwh4hsYZ8+0DnzLAZWJMKTkap8bfFrxmfk6wFr+cGlLAuBrBzx3CnpzT/ZgoRibre
 y3Bi0xJqwhaWDjbvkDGTN0SnH9yVVpxZ6kWJOTen7y8O8gSL8k886yEwy/M8i6X7isa0
 XdRa1yK9lQKRMbCGGwqz+nsYI+7IOr6jdc6u4/uQxGyPij+TPfRzQRCZeWHWaFTAdXWd
 7+Aw==
X-Gm-Message-State: APjAAAVINJK6yUEVTuUdOC8cDOLkuruPRGRThCM4JHFQm9WphiM1HJKI
 EAvYIAn6k9SpGre2I5z0dS4=
X-Google-Smtp-Source: APXvYqyWTvpXP46rqKIin02j4yf5z5SQWKAIQaEhoWaRDl5vkpp1KmSw3GPm8o3dlm6uVTyLPblGXg==
X-Received: by 2002:adf:d4cc:: with SMTP id w12mr3198649wrk.121.1562318873030; 
 Fri, 05 Jul 2019 02:27:53 -0700 (PDT)
Received: from Timur-XPS (catv-80-99-228-232.catv.broadband.hu.
 [80.99.228.232])
 by smtp.gmail.com with ESMTPSA id h11sm9294041wrx.93.2019.07.05.02.27.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 02:27:52 -0700 (PDT)
Message-ID: <ba05faee86fd702f0ba9baa2322a5e32c27432d7.camel@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Marek =?UTF-8?Q?Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>, Michel
 =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Date: Fri, 05 Jul 2019 11:27:51 +0200
In-Reply-To: <CAAxE2A4hgaJ6+AoOGz=b+1aRQEb+eKB88N82KGkcU1w_dnffOQ@mail.gmail.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <c3b38b60-7c1a-730d-8de0-e3c880902003@daenzer.net>
 <627b7fff64edcba0f8d8b5ced79a351821c419c7.camel@gmail.com>
 <792d0f36-b8ae-bef9-3b07-95677637ba00@daenzer.net>
 <f986d6687e2b1f1fc8a93f86cbc8fd1ab971663a.camel@gmail.com>
 <d1dfe289-8501-8848-6324-c43d6e66a77f@daenzer.net>
 <CAAxE2A4hgaJ6+AoOGz=b+1aRQEb+eKB88N82KGkcU1w_dnffOQ@mail.gmail.com>
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Jul 2019 09:30:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=foXuwNSs6hVpxiUDGSpsuSBV8gmJTCv8FWha8cAiqsQ=;
 b=lEcW4mSo2iI9AwKDQhDmuTY8x47oeDKofZzS/tNmtPRG+/beuG+tk7RJeyDe/2nQs/
 KDg40DiNfjSllpUtWjRMC/Wa1lT/nihLG+IDaBcIrzHfUzIG4IpIKYgGOtsvmfdRBkDF
 sl9EIVXO6WOlWNQhVnYJAuTv3VtdhBYHayRmllwh9nDp7aMFmRr9Ief6u5zsc4ugyWAj
 YoH07XeSfCziuU3NFzKcj2bY6lEfK204Y8E4cZTyfvE7cNvnoU4Crm1fqXUDwLfYiDf3
 RHPboEBXjfc6U1HtVQlf93Hq8W+r2hkPKAgbeAo0HMwMEyaPx6iBKsmTaoBW+gliPKuF
 5pvQ==
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
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA3LTAzIGF0IDE0OjQ0IC0wNDAwLCBNYXJlayBPbMWhw6FrIHdyb3RlOgo+
IFlvdSBjYW4gcnVuOgo+IEFNRF9ERUJVRz10ZXN0ZG1hcGVyZiBnbHhnZWFycwo+IAo+IEl0IHRl
c3RzIHRyYW5zZmVyIHNpemVzIG9mIHVwIHRvIDEyOCBNQiwgYW5kIGl0IHRlc3RzIH42MCBzbGln
aHRseQo+IGRpZmZlcmVudCBtZXRob2RzIG9mIHRyYW5zZmVyaW5nIGRhdGEuCj4gCj4gTWFyZWsK
CgpUaGFua3MgTWFyZWssIEkgZGlkbid0IGtub3cgYWJvdXQgdGhhdCBvcHRpb24uClRyaWVkIGl0
LCBoZXJlIGlzIHRoZSBvdXRwdXQ6IGh0dHBzOi8vcGFzdGViaW4uY29tL3Jhdy85U0FBYmJBQQoK
SSdtIG5vdCBxdWl0ZSBzdXJlIGhvdyB0byBpbnRlcnByZXQgdGhlIG51bWJlcnMsIHRoZXkgYXJl
IGluY29uc2lzdGVudAp3aXRoIHRoZSByZXN1bHRzIGZyb20gYm90aCBwY2llX2J3IGFuZCBhbWRn
cHUuYmVuY2htYXJrLCBmb3IgZXhhbXBsZQpHVFQtPlZSQU0gYXQgYSAxMjggS0IgaXMgYXJvdW5k
IDE0MDAgTUIvcyAoSSBhc3N1bWUgdGhhdCBpcyBtZWdhYnl0ZXMgLwpzZWMsIHJpZ2h0PykuCgpJ
dCBpcyBhbHNvIHdlaXJkIHRoYXQgdW5saWtlIGFtZGdwdS5iZW5jaG1hcmssIHRoZSBsYXJnZXIg
dGhhbiAxMjggS0IKdHJhbnNmZXJzIGRpZG4ndCBhY3R1YWxseSBnZXQgc2xpZ2h0bHkgc2xvd2Vy
LgoKTWljaGVsLCBjYW4geW91IG1ha2Ugc2Vuc2Ugb2YgdGhpcz8KCkJlc3QgcmVnYXJkcywKVGlt
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
