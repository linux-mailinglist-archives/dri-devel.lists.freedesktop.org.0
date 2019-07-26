Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E5276806
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 15:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AC86ED6A;
	Fri, 26 Jul 2019 13:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711EF6ED6A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 13:41:49 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2800E22CF8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 13:41:49 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id g18so39031670qkl.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 06:41:49 -0700 (PDT)
X-Gm-Message-State: APjAAAXXfIbfnZrme1+hBtTcYtXcOXkR8fVTzRyC0pe99VqK3cvJC+nu
 2VhtTjcVEXK8qRqG9e9WxyvnhtPNXkk1OjoP1g==
X-Google-Smtp-Source: APXvYqxjuwBX7ksE7JbZB0mI6ceV0xcxiT8SPZ6Gi56d7P4U1vzH0bY2zZ15ZhXiikKw8Sd4XxO8RlHxVifobutyBU8=
X-Received: by 2002:a37:a010:: with SMTP id j16mr64220208qke.152.1564148507205; 
 Fri, 26 Jul 2019 06:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564140865.git.mchehab+samsung@kernel.org>
 <430ed96cb234805d1deb216e8c8559da22cc6bac.1564140865.git.mchehab+samsung@kernel.org>
In-Reply-To: <430ed96cb234805d1deb216e8c8559da22cc6bac.1564140865.git.mchehab+samsung@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 26 Jul 2019 07:41:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK_rfHehrKW_NS89BOV0=dYoao0H=zOzG=D-724vKduKw@mail.gmail.com>
Message-ID: <CAL_JsqK_rfHehrKW_NS89BOV0=dYoao0H=zOzG=D-724vKduKw@mail.gmail.com>
Subject: Re: [PATCH 1/7] docs: fix broken doc references due to renames
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564148509;
 bh=zX30Y7I8lGQSE39mcBLgCQnD1zhzLqgkvgnTgW8bI/U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=k7/MYg0MGLbki0g3EqS6d5XoAuDjmxLmZ5gir1IHBeua4yDd4S/goV17so5PiFt8n
 +FJh7ZVsJa/LcxUvub/nflNlyhoyELQboQqE6meOYLtPh7zlfMdNwoyEKTbOxO4dvN
 n1+yN7Rq6NuEbvgyeiChNQerVHe6alV6d3tfnU8g=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Andrea Parri <andrea.parri@amarulasolutions.com>,
 Ajay Gupta <ajayg@nvidia.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Akira Yokosawa <akiyks@gmail.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Jerry Hoemann <jerry.hoemann@hpe.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 David Howells <dhowells@redhat.com>, Linux I2C <linux-i2c@vger.kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, Will Deacon <will@kernel.org>,
 "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 SCSI <linux-scsi@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Wolfram Sang <wsa@the-dreams.de>, esc.storagedev@microsemi.com,
 Maxime Ripard <maxime.ripard@bootlin.com>, Ingo Molnar <mingo@redhat.com>,
 Alan Stern <stern@rowland.harvard.edu>, Jade Alglave <j.alglave@ucl.ac.uk>,
 Daniel Lustig <dlustig@nvidia.com>, Guenter Roeck <linux@roeck-us.net>,
 Don Brace <don.brace@microsemi.com>, devicetree@vger.kernel.org,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 Steven Rostedt <rostedt@goodmis.org>, rcu@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Nicholas Piggin <npiggin@gmail.com>, Luc Maranget <luc.maranget@inria.fr>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgNTo0NyBBTSBNYXVybyBDYXJ2YWxobyBDaGVoYWIKPG1j
aGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IFNvbWUgZmlsZXMgZ290IHJlbmFt
ZWQgYnV0IHByb2JhYmx5IGR1ZSB0byBzb21lIG1lcmdlIGNvbmZsaWN0cywKPiBhIGZldyByZWZl
cmVuY2VzIHN0aWxsIHBvaW50IHRvIHRoZSBvbGQgbG9jYXRpb25zLgo+Cj4gU2lnbmVkLW9mZi1i
eTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK3NhbXN1bmdAa2VybmVsLm9yZz4KPiBB
Y2tlZC1ieTogV29sZnJhbSBTYW5nIDx3c2FAdGhlLWRyZWFtcy5kZT4gIyBJMkMgcGFydAo+IFJl
dmlld2VkLWJ5OiBKZXJyeSBIb2VtYW5uIDxqZXJyeS5ob2VtYW5uQGhwZS5jb20+ICMgaHB3ZHQu
cnN0Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vUkNVL3JjdWxpc3RfbnVsbHMudHh0ICAgICAgICAg
ICAgICAgICAgIHwgIDIgKy0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9pZGxlLXN0YXRlcy50eHQgfCAgMiArLQo+ICBEb2N1bWVudGF0aW9uL2xvY2tpbmcvc3Bpbmxv
Y2tzLnJzdCAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KPiAgRG9jdW1lbnRhdGlvbi9tZW1v
cnktYmFycmllcnMudHh0ICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBEb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy9rb19LUi9tZW1vcnktYmFycmllcnMudHh0ICB8ICAyICstCj4gIERv
Y3VtZW50YXRpb24vd2F0Y2hkb2cvaHB3ZHQucnN0ICAgICAgICAgICAgICAgICAgICAgIHwgIDIg
Ky0KPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAxMCArKysrKy0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1udmlk
aWEtZ3B1LmMgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3Njc2kvaHBzYS5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KPiAgMTAgZmlsZXMg
Y2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpBY2tlZC1ieTogUm9i
IEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
