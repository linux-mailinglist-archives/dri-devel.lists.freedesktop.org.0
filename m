Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FA81E58A
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 01:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA0589359;
	Tue, 14 May 2019 23:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEB389359
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 23:25:13 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id z26so298876pfg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 16:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4Jy0W2AOE8X2G5DhaX0aRTRku/ISFojI4Jx+xxzmku0=;
 b=o1wilG2sUyqkAVCoVV81HAhFUfA2Bgn7ZD+dUzbhuQnqGBM0+NqXck1u7PNSoVJRSY
 ML0SB13a0vvA/LaVb8uTxPsPlxyfPNrOAOOBCJPj6lY5PWVhdR1mgWi+hAHObRv7rqJT
 E0SdtlQ37WPaPAJYvy+U+ZWMF62mFFN5yS5upnX7X1Cvv4uMvSNeiOcAWefwVuR8jarD
 Soxx6WYaFumBJuzO1MLZg2IlR2QXxRJssO8G42owo6NFY5XG5HiQm1n0l8p5zIVsh6rh
 PhZ/mnurk5uXQv1lg5vMQMBPzpBCDS3Mt0+jZ9DgoFyn1BZ1K0dUnehXJXyn/JteI4Uq
 I6bA==
X-Gm-Message-State: APjAAAWGVYNITzQtQl6CnoB7WVA4xSXcig2yNQH0NqduIrzJadyY1ALT
 YUQtJdAS6JGPCXb6QoodXdVF3Q==
X-Google-Smtp-Source: APXvYqwFT36xTe7xIV4JHHBk0GWoU89u5XYlVl2IpbZ1GuRL1xHoENSFO5jHtT0PWOMWGfK71tbjWA==
X-Received: by 2002:a62:6585:: with SMTP id z127mr4445645pfb.179.1557876312369; 
 Tue, 14 May 2019 16:25:12 -0700 (PDT)
Received: from google.com ([2620:15c:2cd:2:d714:29b4:a56b:b23b])
 by smtp.gmail.com with ESMTPSA id 2sm205811pgc.49.2019.05.14.16.25.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 14 May 2019 16:25:11 -0700 (PDT)
Date: Tue, 14 May 2019 16:25:06 -0700
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com,
 keescook@google.com, kieran.bingham@ideasonboard.com,
 mcgrof@kernel.org, peterz@infradead.org, robh@kernel.org,
 sboyd@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
Subject: Re: [PATCH v4 16/18] MAINTAINERS: add entry for KUnit the unit
 testing framework
Message-ID: <20190514232506.GA16788@google.com>
References: <20190514221711.248228-1-brendanhiggins@google.com>
 <20190514221711.248228-17-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514221711.248228-17-brendanhiggins@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4Jy0W2AOE8X2G5DhaX0aRTRku/ISFojI4Jx+xxzmku0=;
 b=MQyJklXnbo6c96JLKB7QksEJHkSpFBHsrJS476t6XQjCpcmGuNq+IaehI46rq7cwoT
 5/83MudsTcPwLAbJQi+E/WmVnctS8ig6t3ILH9hcfgEVCDySDpa/WBKmvGuT+TW4+eQ/
 S0mwkFbAjmxc5fsPkl2wQBiW7k+GUPaiQJ2GyWSoGs0PuW8MdgL5cUCvBhefg1tJKEs1
 qTdCbxKYYLs1akDBll4MhMba7K4eHfr7lI87DpyzfvZwtlscx4zjYkzIKYzvyEhxi2i1
 yOVJ7B7mk2BP2yJFkPIlDEqeXR3rL1YA08yj2q7YWAYVfzf7Fawslh7NINITcHYKajd3
 6xGA==
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 khilman@baylibre.com, knut.omang@oracle.com, wfg@linux.intel.com,
 joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 richard@nod.at, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDM6MTc6MDlQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IEFkZCBteXNlbGYgYXMgbWFpbnRhaW5lciBvZiBLVW5pdCwgdGhlIExpbnV4IGtl
cm5lbCdzIHVuaXQgdGVzdGluZwo+IGZyYW1ld29yay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCcmVu
ZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEdy
ZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gUmV2aWV3ZWQt
Ynk6IExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNvbT4KPiAtLS0KPiAgTUFJTlRB
SU5FUlMgfCAxMSArKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggMmMy
ZmNlNzJlNjk0Zi4uOGE5MTg4N2M4ZDU0MSAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsr
KyBiL01BSU5UQUlORVJTCj4gQEAgLTg0NDgsNiArODQ0OCwxNyBAQCBTOglNYWludGFpbmVkCj4g
IEY6CXRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzLwo+ICBGOglEb2N1bWVudGF0aW9uL2Rldi10b29s
cy9rc2VsZnRlc3QqCj4gIAo+ICtLRVJORUwgVU5JVCBURVNUSU5HIEZSQU1FV09SSyAoS1VuaXQp
Cj4gK006CUJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiArTDoJ
bGludXgta3NlbGZ0ZXN0QHZnZXIua2VybmVsLm9yZwo+ICtMOglrdW5pdC1kZXZAZ29vZ2xlZ3Jv
dXBzLmNvbQo+ICtXOglodHRwczovL2dvb2dsZS5naXRodWIuaW8va3VuaXQtZG9jcy90aGlyZF9w
YXJ0eS9rZXJuZWwvZG9jcy8KPiArUzoJTWFpbnRhaW5lZAo+ICtGOglEb2N1bWVudGF0aW9uL2t1
bml0LwoKRGFuZyBpdCEgSSBmb3Jnb3QgdG8gdXBkYXRlIHRoZSBkb2N1bWVudGF0aW9uIHBhdGgu
Li4KCldpbGwgZml4IGluIG5leHQgcmV2aXNpb24uCgo+ICtGOglpbmNsdWRlL2t1bml0Lwo+ICtG
OglrdW5pdC8KPiArRjoJdG9vbHMvdGVzdGluZy9rdW5pdC8KPiArCj4gIEtFUk5FTCBVU0VSTU9E
RSBIRUxQRVIKPiAgTToJTHVpcyBDaGFtYmVybGFpbiA8bWNncm9mQGtlcm5lbC5vcmc+Cj4gIEw6
CWxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiAtLSAKPiAyLjIxLjAuMTAyMC5nZjI4MjBj
ZjAxYS1nb29nCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
