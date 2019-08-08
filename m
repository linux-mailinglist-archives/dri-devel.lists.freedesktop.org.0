Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5933387395
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A7C6ED0B;
	Fri,  9 Aug 2019 08:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3F86E8A9;
 Thu,  8 Aug 2019 18:41:52 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id t16so44552658pfe.11;
 Thu, 08 Aug 2019 11:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=ZZK+fyWZjI5hSA6Qnbu9v76+SqqCqOmIE8jtu8ZGPCs=;
 b=XrRVxAQX/iWcSQ8IuNpPWu/faemWTqNRhU0GKUrYnfEUPuRDV0aFsI+g2L4RFxEY2S
 E+eYgiJYDAZtpOPielOeIR5I+9tbJ7rZ2gNN7y3sz9Jz2VM8HTZwXt3jA+RldkHXwkCU
 acYhYsjDdEIma/8leFjthQKLH8gN41JpUT1bImO5q9nv8QB5gSr2bnHiV13LLozn7ITL
 8Ay5gpJnz9/blZxRErlJzEtWZM4Y015uRUPCpj0PBC9/PA37ft3LABiOrEIQAb+vNrHg
 LcdxqiGYklbUe6da1+kM+2MH2uaKLfmiu+EA2SpiXKmnNSx5aUYbu+NrxFWZjNQB5Y/T
 QB8A==
X-Gm-Message-State: APjAAAWqvirhbpE2X47WgMk2Wxu0+SI4Air98vakJlBgAvob5Fz8e++G
 M+f9RHrGP7er7gxcHbhAwwg=
X-Google-Smtp-Source: APXvYqx5EmGw/rrd/R2q+S2qeMRTUxcFUUR9uhxx05XW9ppoZP59FXTb8pky/sKgdxdcuILdqHHe+g==
X-Received: by 2002:a17:90a:7787:: with SMTP id
 v7mr5462994pjk.143.1565289712264; 
 Thu, 08 Aug 2019 11:41:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id n17sm102767545pfq.182.2019.08.08.11.41.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 11:41:51 -0700 (PDT)
Date: Thu, 8 Aug 2019 11:41:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: next/master build: 230 builds: 5 failed, 225 passed, 6 errors,
 1344 warnings (next-20190805)
Message-ID: <20190808184149.GA441@roeck-us.net>
References: <5d47f990.1c69fb81.a5d88.ee1f@mx.google.com>
 <20190805111205.GB6432@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805111205.GB6432@sirena.org.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Fri, 09 Aug 2019 08:00:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=ZZK+fyWZjI5hSA6Qnbu9v76+SqqCqOmIE8jtu8ZGPCs=;
 b=ExxwGCibE21sc8KG1HZ0UsxlIUpqyquINJWIphQpP5BWrLFQuJbqM4/Qa7y3EMxKGk
 u5GrGX64wvkaZU+q6huAtHVuqAWkaBkPCF09bpKs83rYE18bh7Opf6p/xeKnNX4sdGhC
 oDGkV/1+tjK/DcGSuQfRH1Z96wbZdk1yEiXeUCRmPxZjqQicjt4fbjddbAx7fQ9v3YRz
 cgNr5lvQHbORziE5OshBxu2MkX5j7ncutuywKLkv8ixmo964EOdprPS4GdWPqXMuYnQ2
 2CY8UqquYB980H1NQ5wV+zbU/siUvCMJLrAWUTzGsyDKN4UN8+vVrmXbb30AoINnzMAt
 HRFg==
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
Cc: linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org,
 David Airlie <airlied@linux.ie>, Tao Zhou <tao.zhou1@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-next@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Dennis Li <dennis.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMTI6MTI6MDVQTSArMDEwMCwgTWFyayBCcm93biB3cm90
ZToKPiBPbiBNb24sIEF1ZyAwNSwgMjAxOSBhdCAwMjo0MDozMkFNIC0wNzAwLCBrZXJuZWxjaS5v
cmcgYm90IHdyb3RlOgo+IAo+IFRvZGF5J3MgLW5leHQgZmFpbHMgdG8gYnVpbGQgYW4gYXJtIGFs
bG1vZGNvbmZpZyBkdWUgdG86Cj4gCj4gPiBhbGxtb2Rjb25maWcgKGFybSwgZ2NjLTgpIOKAlCBG
QUlMLCAyIGVycm9ycywgMTYgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCj4gPiAKPiA+
IEVycm9yczoKPiA+ICAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmM6Mjc5Ojk6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAncmVhZHEn
OyBkaWQgeW91IG1lYW4gJ3JlYWRiJz8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFy
YXRpb25dCj4gPiAgICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
OjI5ODozOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ3dyaXRlcSc7
IGRpZCB5b3UgbWVhbiAnd3JpdGViJz8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFy
YXRpb25dCj4gCj4gZHVlIHRvIDRmYTFjNmE2NzliYjAgKGRybS9hbWRncHU6IGFkZCBSUkVHNjQv
V1JFRzY0KF9QQ0lFKSBvcGVyYXRpb25zKQo+IHdoaWNoIGludHJvZHVjZXMgdXNlIG9mIHJlYWRx
KCkgYW5kIHdyaXRlcSgpLgoKQUZBSUNTIHRoaXMgcHJvYmxlbSBhZmZlY3RzIGFsbCAzMi1iaXQg
YnVpbGRzLCBpbmNsdWRpbmcgaTM4Ni4KSXMgaXQgaW4gdGhlIHByb2Nlc3Mgb2YgYmVpbmcgZml4
ZWQsIG9yIHNob3VsZCB3ZSBzdWJtaXQgYQpwYXRjaCBsaW1pdGluZyBEUk1fQU1ER1BVIHRvIDY0
LWJpdCBidWlsZHMgPwoKR3VlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
