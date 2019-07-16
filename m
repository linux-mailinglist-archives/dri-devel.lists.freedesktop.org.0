Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205FD6B71F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F396E250;
	Wed, 17 Jul 2019 07:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA6B88DAA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 10:14:19 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 19so8885252pfa.4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 03:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tmWzuRj9Y8Rn/r16lIRyg5jwtGJ9nynfw0uohRu6k2o=;
 b=AoBf32N0NmzVt1iaVotauVvBWYK43bfIr0qYnqBpdeUkrJs0VC5Gr59ManN3DtLeC/
 1iTP/+Ysyt7EskKsFqnNG1BkyZD1QNPkYwZnsSqzcdL8lHgMBKMKZsILLJuTWI6Bi4dF
 m9pvBi7vl4+v8GxiLBf9dfbkLuAPh7XmTDDZ72/5ObbIVXitt2uL3mj7IjHdFMJQxcsG
 L8lMBleDZlZ59dj3SGRf3VOJDTFYRrNAr/PruG9sl+Fr8GxI0y7vVSJEQdnoTEf5budr
 Nx4K9uX/Z7tbWg+6PiAOPc9o6P4cumZaZJNdg7pVZf4Az4a3tAUlc3Y5kPpy6pSd5qVJ
 vASA==
X-Gm-Message-State: APjAAAUIqDxiSgjxniTAkUjhoQyUaHyeacEos0SdN8QheMyotGF+5h4V
 va0GuAIHIaEevr6XIi99yMOfrw==
X-Google-Smtp-Source: APXvYqzBphLPq84GuNMQq2Ypj7vpkoiFF0ipulNv01B65gbXobE3Luly7Rk6v8kET2o+vxGtcp0/UQ==
X-Received: by 2002:a63:e1e:: with SMTP id d30mr32421799pgl.100.1563272058631; 
 Tue, 16 Jul 2019 03:14:18 -0700 (PDT)
Received: from localhost ([122.172.28.117])
 by smtp.gmail.com with ESMTPSA id f12sm17112423pgq.52.2019.07.16.03.14.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 03:14:18 -0700 (PDT)
Date: Tue, 16 Jul 2019 15:44:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 00/10] cpufreq: Migrate users of policy notifiers to QoS
 requests
Message-ID: <20190716101416.ntk353cfnrcykoek@vireshk-i7>
References: <cover.1563269894.git.viresh.kumar@linaro.org>
 <CAJZ5v0iqYHNt6NQy3Fi1B=XtjNOm2x0mX3+7eWBREgFZRpUS+w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0iqYHNt6NQy3Fi1B=XtjNOm2x0mX3+7eWBREgFZRpUS+w@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tmWzuRj9Y8Rn/r16lIRyg5jwtGJ9nynfw0uohRu6k2o=;
 b=KAtOigf2Oc9xYw3+dOxD9HqWXPLvbyeFTY1yERB+lcTUiKxn0onhKAn2eSSU2evMlN
 DV/XVJTUAM2BITFnkKRi6xErSZxL3AAhkWKFiuzIHWL4/J2i7Nh1jey+y3wQ/TYWuF3c
 a+Eo2P1WXSxGFIfJYyvmhhbFEexNIUH1jCbpjXVqUvler8kfIxS2uFrBoDgmsyMMMTik
 rvcdKRYaz24FEbxamPrZHZWVWb76QRqv9Z+FTSi6uVo5dEYFer2trAUwlcsVqiJHrdZS
 hD0SM75lfUioSSdZ+vSrLrjq1YeShNB4AfsrJAcT8PjYY38sTfsBKUobjvkFsI4XYiN4
 DD4A==
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
 Linux PM <linux-pm@vger.kernel.org>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Robert Moore <robert.moore@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zhang Rui <rui.zhang@intel.com>, Javi Merino <javi.merino@kernel.org>,
 Erik Schmauss <erik.schmauss@intel.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTYtMDctMTksIDEyOjA2LCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiBPbiBUdWUsIEp1
bCAxNiwgMjAxOSBhdCAxMTo0OSBBTSBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8u
b3JnPiB3cm90ZToKPiA+Cj4gPiBIZWxsbywKPiA+Cj4gPiBOb3cgdGhhdCBjcHVmcmVxIGNvcmUg
c3VwcG9ydHMgdGFraW5nIFFvUyByZXF1ZXN0cyBmb3IgbWluL21heCBjcHUKPiA+IGZyZXF1ZW5j
aWVzLCBsZXRzIG1pZ3JhdGUgcmVzdCBvZiB0aGUgdXNlcnMgdG8gdXNpbmcgdGhlbSBpbnN0ZWFk
IG9mIHRoZQo+ID4gcG9saWN5IG5vdGlmaWVycy4KPiAKPiBUZWNobmljYWxseSwgdGhpcyBzdGls
bCBpcyBsaW51eC1uZXh0IG9ubHkuIDotKQoKVHJ1ZSA6KQoKPiA+IFRoZSBDUFVGUkVRX05PVElG
WSBhbmQgQ1BVRlJFUV9BREpVU1QgZXZlbnRzIG9mIHRoZSBwb2xpY3kgbm90aWZpZXJzIGFyZQo+
ID4gcmVtb3ZlZCBhcyBhIHJlc3VsdCwgYnV0IHdlIGhhdmUgdG8gYWRkIENQVUZSRVFfQ1JFQVRF
X1BPTElDWSBhbmQKPiA+IENQVUZSRVFfUkVNT1ZFX1BPTElDWSBldmVudHMgdG8gaXQgZm9yIHRo
ZSBhY3BpIHN0dWZmIHNwZWNpZmljYWxseS4gU28KPiA+IHRoZSBwb2xpY3kgbm90aWZpZXJzIGFy
ZW4ndCBjb21wbGV0ZWx5IHJlbW92ZWQuCj4gCj4gVGhhdCdzIG5vdCBlbnRpcmVseSBhY2N1cmF0
ZSwgYmVjYXVzZSBhcmNoX3RvcG9sb2d5IGlzIGdvaW5nIHRvIHVzZQo+IENQVUZSRVFfQ1JFQVRF
X1BPTElDWSBub3cgdG9vLgoKWWVhaCwgSSB0aG91Z2h0IGFib3V0IHRoYXQgd2hpbGUgd3JpdGlu
ZyB0aGlzIHBhdGNoc2V0IGFuZApjb3ZlcmxldHRlci4gQnV0IGhhZCBpdCBub3QgYmVlbiByZXF1
aXJlZCBmb3IgQUNQSSwgSSB3b3VsZCBoYXZlIGRvbmUKaXQgZGlmZmVyZW50bHkgZm9yIHRoZSBh
cmNoLXRvcG9sb2d5IGNvZGUuIE1heWJlIGRpcmVjdCBjYWxsaW5nIG9mCmFyY2gtdG9wb2xvZ3kg
cm91dGluZSBmcm9tIGNwdWZyZXEgY29yZS4gSSB3YW50ZWQgdG8gZ2V0IHJpZCBvZiB0aGUKcG9s
aWN5IG5vdGlmaWVycyBjb21wbGV0ZWx5IGJ1dCBJIGNvdWxkbid0IGZpbmQgYSBiZXR0ZXIgd2F5
IG9mIGRvaW5nCml0IGZvciBBQ1BJIHN0dWZmLgoKPiA+IEJvb3QgdGVzdGVkIG9uIG15IHg4NiBQ
QyBhbmQgQVJNIGhpa2V5IGJvYXJkLiBOb3RoaW5nIGxvb2tlZCBicm9rZW4gOikKPiA+Cj4gPiBU
aGlzIGhhcyBhbHJlYWR5IGdvbmUgdGhyb3VnaCBidWlsZCBib3QgZm9yIGEgZmV3IGRheXMgbm93
Lgo+IAo+IFNvIEknZCBwcmVmZXIgcGF0Y2hlcyBbNS04XSB0byBnbyByaWdodCBhZnRlciB0aGUg
Zmlyc3Qgb25lIGFuZCB0aGVuCj4gZG8gdGhlIGNsZWFudXBzIG9uIHRvcCBvZiB0aGF0LCBhcyBz
b21lYm9keSBtYXkgd2FudCB0byBiYWNrcG9ydCB0aGUKPiBlc3NlbnRpYWwgY2hhbmdlcyB3aXRo
b3V0IHRoZSBjbGVhbnVwcy4KCkluIHRoZSBleGNlcHRpb25hbCBjYXNlIHdoZXJlIG5vYm9keSBm
aW5kcyBhbnl0aGluZyB3cm9uZyB3aXRoIHRoZQpwYXRjaGVzIChoaWdobHkgdW5saWtlbHkpLCBk
byB5b3Ugd2FudCBtZSB0byByZXNlbmQgd2l0aCByZW9yZGVyaW5nIG9yCnlvdSBjYW4gcmVvcmRl
ciB0aGVtIHdoaWxlIGFwcGx5aW5nPyBUaGVyZSBhcmUgbm8gZGVwZW5kZW5jaWVzIGJldHdlZW4K
dGhvc2UgcGF0Y2hlcyBhbnl3YXkuCgotLQp2aXJlc2gKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
