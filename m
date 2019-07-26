Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E094576B8B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 16:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3B46ED88;
	Fri, 26 Jul 2019 14:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9E16ED88
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 14:24:56 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id e3so53463965edr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 07:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=iKvptB00eRJtAAyTA2xD7jIbIFN8n5r7X55dRtJg5Cw=;
 b=OCtYzhdUWX+67Lug5uz28jGg92A7FxlNRAGjgGm2VbJ0uz0eKqlMNuHnfkvhNUiOpF
 nWnGplLcDfjP2zCRMBec9Yw5f29Vq+PW4VRfZy7i1ADo/oMiX9m4f3yDa4BMPb21D3AL
 TzpEtFveuPHGEnU/varITEfjNXPQ6vSSHt9eI18SQSyUcnXaMJXpExAmXsVnY+kDhjjY
 QyipEBIt6gi1PJANOUxjv23pWR8Q3vHyhHnYpRrMbg4RyXGTkcSZ7G6AQiZi7ESX6S1v
 pG8wXzV0lDlmwuQaQgfaf15abnN4qFXJQCVZFnF+uiGKCLK2tYSxyPKYC6iEwybOvbKr
 hMDA==
X-Gm-Message-State: APjAAAXfc7FR2toqqRC3tics9oL/V/zwRNUsPPKGzrGam5tb61jO9moN
 5YgqBCY5v4bjHrYVQL2qZxo=
X-Google-Smtp-Source: APXvYqziEeXaDKlMzj6WkqFhfWfsWvSAtDFO47Ob8pLZS5KABUGhUNYgZNlFDTi49ewicGXyP7F9Dg==
X-Received: by 2002:a50:ad48:: with SMTP id z8mr82669671edc.66.1564151094716; 
 Fri, 26 Jul 2019 07:24:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id m31sm14121701edd.42.2019.07.26.07.24.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 07:24:53 -0700 (PDT)
Date: Fri, 26 Jul 2019 16:24:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/7] docs: fix broken doc references due to renames
Message-ID: <20190726142450.GJ15868@phenom.ffwll.local>
Mail-Followup-To: Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 Josh Triplett <josh@joshtriplett.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mark Rutland <mark.rutland@arm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Andrea Parri <andrea.parri@amarulasolutions.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 David Howells <dhowells@redhat.com>,
 Jade Alglave <j.alglave@ucl.ac.uk>,
 Luc Maranget <luc.maranget@inria.fr>,
 Akira Yokosawa <akiyks@gmail.com>,
 Daniel Lustig <dlustig@nvidia.com>,
 Jerry Hoemann <jerry.hoemann@hpe.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Ajay Gupta <ajayg@nvidia.com>, Don Brace <don.brace@microsemi.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 rcu@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 devicetree@vger.kernel.org,
 "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, esc.storagedev@microsemi.com,
 SCSI <linux-scsi@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>
References: <cover.1564140865.git.mchehab+samsung@kernel.org>
 <430ed96cb234805d1deb216e8c8559da22cc6bac.1564140865.git.mchehab+samsung@kernel.org>
 <CAL_JsqK_rfHehrKW_NS89BOV0=dYoao0H=zOzG=D-724vKduKw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqK_rfHehrKW_NS89BOV0=dYoao0H=zOzG=D-724vKduKw@mail.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=iKvptB00eRJtAAyTA2xD7jIbIFN8n5r7X55dRtJg5Cw=;
 b=f5L5IA3ayQmsQHY5KhIVuOFZAzingVgEcKk8EvRC5mL0KaqQyGnWAI0cbPTrNNuCz7
 K18hM9pz10KIe5v0Z75fubUwSrYuFdOojHzAiYoIdyx9DO1Z5oW1vH1CNjwbsYziO6sT
 /QI7SGtnnJxli3UbqAjXRyOHKL5kB7R4In+E8=
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
 David Howells <dhowells@redhat.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Joel Fernandes <joel@joelfernandes.org>,
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

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDc6NDE6MzVBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgNTo0NyBBTSBNYXVybyBDYXJ2YWxobyBDaGVo
YWIKPiA8bWNoZWhhYitzYW1zdW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFNvbWUgZmls
ZXMgZ290IHJlbmFtZWQgYnV0IHByb2JhYmx5IGR1ZSB0byBzb21lIG1lcmdlIGNvbmZsaWN0cywK
PiA+IGEgZmV3IHJlZmVyZW5jZXMgc3RpbGwgcG9pbnQgdG8gdGhlIG9sZCBsb2NhdGlvbnMuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK3NhbXN1
bmdAa2VybmVsLm9yZz4KPiA+IEFja2VkLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYUB0aGUtZHJlYW1z
LmRlPiAjIEkyQyBwYXJ0Cj4gPiBSZXZpZXdlZC1ieTogSmVycnkgSG9lbWFubiA8amVycnkuaG9l
bWFubkBocGUuY29tPiAjIGhwd2R0LnJzdAo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9SQ1Uv
cmN1bGlzdF9udWxscy50eHQgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ID4gIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vaWRsZS1zdGF0ZXMudHh0IHwgIDIgKy0KPiA+
ICBEb2N1bWVudGF0aW9uL2xvY2tpbmcvc3BpbmxvY2tzLnJzdCAgICAgICAgICAgICAgICAgICB8
ICA0ICsrLS0KPiA+ICBEb2N1bWVudGF0aW9uL21lbW9yeS1iYXJyaWVycy50eHQgICAgICAgICAg
ICAgICAgICAgICB8ICAyICstCj4gPiAgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMva29fS1Iv
bWVtb3J5LWJhcnJpZXJzLnR4dCAgfCAgMiArLQo+ID4gIERvY3VtZW50YXRpb24vd2F0Y2hkb2cv
aHB3ZHQucnN0ICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+ICBNQUlOVEFJTkVSUyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEwICsrKysrLS0tLS0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICstCgpmb3IgdGhlIGRybSBwYXJ0OgoKQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+ID4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbnZpZGlh
LWdwdS5jICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+ICBkcml2ZXJzL3Njc2kvaHBzYS5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KPiA+ICAxMCBmaWxl
cyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiAKPiBBY2tlZC1i
eTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
