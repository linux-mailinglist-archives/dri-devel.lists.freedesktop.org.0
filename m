Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8276A624
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 12:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF7B6E077;
	Tue, 16 Jul 2019 10:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AA26E077
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 10:06:20 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id w196so15085818oie.7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 03:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SKSKLDsZNWfrDqHnwOUMB50WqSsunNsqcQ+sfiyuXlw=;
 b=Sha7TvcGhyE7Eact/ho0mFf+lxDD87mZMsdL/rSlfYxPwU+FfV/GVK1uHws2aWZHNh
 bDL2gJWFJl4AXIcfZfID5II2I5l9mZ5oN37xC1j0RUP9lh8XUMEahqcjXq8z1zt9LtdW
 Xw4UUjzWCAYCvF6vHbfqI/1L/9BGkHKOAkju053enSu9FKLyx8dhC2X/pvKUKJXDHGba
 c8fAbmc4M+ELCQ50ThktdZO8/LR5T91cImjP+Q9EWRLDxLP3ldh1Ds8AZdSBdBTvSU8U
 N6SDlckm9gfdUfa2U4QScCADYwFxamsgOTa69vKCSvT4CA1gwNPPuCbEBONWA7zfBRD9
 tB2A==
X-Gm-Message-State: APjAAAU1Ra9SXEwfbazCYKgpSPk3tJ+/XcClIYD6PTvP59NgsFyTkO2e
 dpaIGoaCBjiiq9ylYdP1xZpCtDsEfntWpdkZ9yY=
X-Google-Smtp-Source: APXvYqz+9SLeYZezhd1CiiqSz9N5lOWLlOsr+u93YAb04Q18lnnuxQ5teq8PO6tM0DnrmvA9w9XvcWX+j6bgyJjGrm4=
X-Received: by 2002:aca:edc8:: with SMTP id
 l191mr15705198oih.103.1563271579314; 
 Tue, 16 Jul 2019 03:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563269894.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1563269894.git.viresh.kumar@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 16 Jul 2019 12:06:08 +0200
Message-ID: <CAJZ5v0iqYHNt6NQy3Fi1B=XtjNOm2x0mX3+7eWBREgFZRpUS+w@mail.gmail.com>
Subject: Re: [PATCH 00/10] cpufreq: Migrate users of policy notifiers to QoS
 requests
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: "open list:ACPI COMPONENT ARCHITECTURE \(ACPICA\)" <devel@acpica.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Robert Moore <robert.moore@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux PM <linux-pm@vger.kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Javi Merino <javi.merino@kernel.org>, Erik Schmauss <erik.schmauss@intel.com>,
 Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMTE6NDkgQU0gVmlyZXNoIEt1bWFyIDx2aXJlc2gua3Vt
YXJAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IE5vdyB0aGF0IGNwdWZyZXEgY29y
ZSBzdXBwb3J0cyB0YWtpbmcgUW9TIHJlcXVlc3RzIGZvciBtaW4vbWF4IGNwdQo+IGZyZXF1ZW5j
aWVzLCBsZXRzIG1pZ3JhdGUgcmVzdCBvZiB0aGUgdXNlcnMgdG8gdXNpbmcgdGhlbSBpbnN0ZWFk
IG9mIHRoZQo+IHBvbGljeSBub3RpZmllcnMuCgpUZWNobmljYWxseSwgdGhpcyBzdGlsbCBpcyBs
aW51eC1uZXh0IG9ubHkuIDotKQoKPiBUaGUgQ1BVRlJFUV9OT1RJRlkgYW5kIENQVUZSRVFfQURK
VVNUIGV2ZW50cyBvZiB0aGUgcG9saWN5IG5vdGlmaWVycyBhcmUKPiByZW1vdmVkIGFzIGEgcmVz
dWx0LCBidXQgd2UgaGF2ZSB0byBhZGQgQ1BVRlJFUV9DUkVBVEVfUE9MSUNZIGFuZAo+IENQVUZS
RVFfUkVNT1ZFX1BPTElDWSBldmVudHMgdG8gaXQgZm9yIHRoZSBhY3BpIHN0dWZmIHNwZWNpZmlj
YWxseS4gU28KPiB0aGUgcG9saWN5IG5vdGlmaWVycyBhcmVuJ3QgY29tcGxldGVseSByZW1vdmVk
LgoKVGhhdCdzIG5vdCBlbnRpcmVseSBhY2N1cmF0ZSwgYmVjYXVzZSBhcmNoX3RvcG9sb2d5IGlz
IGdvaW5nIHRvIHVzZQpDUFVGUkVRX0NSRUFURV9QT0xJQ1kgbm93IHRvby4KCj4gQm9vdCB0ZXN0
ZWQgb24gbXkgeDg2IFBDIGFuZCBBUk0gaGlrZXkgYm9hcmQuIE5vdGhpbmcgbG9va2VkIGJyb2tl
biA6KQo+Cj4gVGhpcyBoYXMgYWxyZWFkeSBnb25lIHRocm91Z2ggYnVpbGQgYm90IGZvciBhIGZl
dyBkYXlzIG5vdy4KClNvIEknZCBwcmVmZXIgcGF0Y2hlcyBbNS04XSB0byBnbyByaWdodCBhZnRl
ciB0aGUgZmlyc3Qgb25lIGFuZCB0aGVuCmRvIHRoZSBjbGVhbnVwcyBvbiB0b3Agb2YgdGhhdCwg
YXMgc29tZWJvZHkgbWF5IHdhbnQgdG8gYmFja3BvcnQgdGhlCmVzc2VudGlhbCBjaGFuZ2VzIHdp
dGhvdXQgdGhlIGNsZWFudXBzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
