Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A28361B670E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FD66EA1A;
	Thu, 23 Apr 2020 22:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AA2891DD
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 14:29:13 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id g6so2962282pgs.9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 07:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=euZIJ/M801FkiIRohqJykf0KTV1d7R1eB6u3qEkTjI0=;
 b=Ko6BUx5ma8P13bvtmuvtoClR1kdW1PNfQ5Mdcb5ut/b6dbYDkx4snP1pcDRIaxOAWt
 OrjLtoxwLINDnrWAmg7a5CQU5PcYxBNmj260qRjWiFDyutI3obuDy12DDb+0FtQabOsJ
 /3rVzC3AOzR+z+YJlDXnT1BweMe1w5xONexIwTNdYDkMCNDJRsU1inGD2jUIRLgKCL0k
 1bpmI47cx+gGudFoSqsQaGbVCfn+4Mj1YLSG3N0PQxFoc3IwdALS/MkBBF2+D3kD6rLt
 XH+krkBwKgcXAWWSnTzI88j3+8S+pBK0gz36DD/o1UpqdI95hODX2seSYE5abCiWGtNs
 2Z5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=euZIJ/M801FkiIRohqJykf0KTV1d7R1eB6u3qEkTjI0=;
 b=dZ7Ky0a7IybE84vm8mY17eRifMPh/YyjG+niEPT35JSHhI1d1RA+afgkBgZrLR5A77
 xBb1OX/aQY2DLLz+GdI8WM4iJFCA9UgqqczG/L/EizH5oH8Q4Xe9KLUueAnpmwQrF6x6
 2nCWThzLc3/m1RiqAPcyKCpPaVO93fhM9OgamGg1XiN/R29cFMa4+/rFk9z5+or+HHjK
 UJ/0LPadJiwXgEral3MLp51UBc21udrmwzCRh5A4BZrUUfK6OCMtWMF5mpT9FXm7CUGd
 JNVi/e7xKtqLF8LHVmCCFd04iRITo1DLwUjUW6ACRKtpBmlVaR6TXuxvIwALrT0IxqdN
 xuMA==
X-Gm-Message-State: AGi0PuaBZOLcjsdpHR/Vf0L271HPyV+FOThmZMvjJbA6FJbwApTq7xEI
 aY4xwZ1QzNbKL1lHA0iDpTI6nzjFfyQ=
X-Google-Smtp-Source: APiQypLCBsvdXjd0LfkUeemwgs+0ri7ASlr6IwzFVhcmjfzaxZE5iJago8sKARkvbGq9vjBLA4PJvA==
X-Received: by 2002:aa7:96c1:: with SMTP id h1mr4085226pfq.212.1587652153207; 
 Thu, 23 Apr 2020 07:29:13 -0700 (PDT)
Received: from localhost (176.122.158.71.16clouds.com. [176.122.158.71])
 by smtp.gmail.com with ESMTPSA id h5sm2537837pjv.4.2020.04.23.07.29.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Apr 2020 07:29:12 -0700 (PDT)
Date: Thu, 23 Apr 2020 22:29:09 +0800
From: Dejin Zheng <zhengdejin5@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v1] console: fix an issue about ioremap leak.
Message-ID: <20200423142909.GB1562@nuc8i5>
References: <c62ec54f-348b-2eae-59eb-374dde4d49ad@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c62ec54f-348b-2eae-59eb-374dde4d49ad@web.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Thomas =?utf-8?Q?Bogend=C3=B6rfer?= <tsbogend@alpha.franken.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Ralf =?utf-8?Q?B=C3=A4chle?= <ralf@linux-mips.org>,
 Thomas Gleixner <tglx@linutronix.de>, Coccinelle <cocci@systeme.lip6.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgMjMsIDIwMjAgYXQgMDE6MTA6MTRQTSArMDIwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gPiBpZiBkb190YWtlX292ZXJfY29uc29sZSgpIHJldHVybiBhbiBlcnJvciBpbiB0
aGUgbmV3cG9ydF9wcm9iZSgpLAo+ID4gZHVlIHRvIHRoZSBpbyB2aXJ0dWFsIGFkZHJlc3MgaXMg
bm90IHJlbGVhc2VkLCBpdCB3aWxsIGNhdXNlIGEgbGVhay4KPiAKPiBIb3cgZG8geW91IHRoaW5r
IGFib3V0IGEgd29yZGluZyB2YXJpYW50IGxpa2UgdGhlIGZvbGxvd2luZz8KPiAKPiAgICBTdWJq
ZWN0Ogo+ICAgIFtQQVRDSCB2Ml0gY29uc29sZTogQ29tcGxldGUgZXhjZXB0aW9uIGhhbmRsaW5n
IGluIG5ld3BvcnRfcHJvYmUoKQo+IAo+ICAgIENoYW5nZSBkZXNjcmlwdGlvbjoKPiAgICBBIGNh
bGwgb2YgdGhlIGZ1bmN0aW9uIOKAnGRvX3Rha2Vfb3Zlcl9jb25zb2xl4oCdIGNhbiBmYWlsIGhl
cmUuCj4gICAgVGhlIGNvcnJlc3BvbmRpbmcgc3lzdGVtIHJlc291cmNlcyB3ZXJlIG5vdCByZWxl
YXNlZCB0aGVuLgo+ICAgIFRodXMgYWRkIGEgY2FsbCBvZiB0aGUgZnVuY3Rpb24g4oCcaW91bm1h
cOKAnSB0b2dldGhlciB3aXRoIHRoZSBjaGVjawo+ICAgIG9mIGEgZmFpbHVyZSBwcmVkaWNhdGUu
Cj4KVGhhbmtzIQoKPiAKPiBJIHdvdWxkIGxpa2UgdG8gcG9pbnQgb3V0IHRoYXQgdGhlcmUgaXMg
YSBzY3JpcHQgZm9yIHRoZSBzZW1hbnRpYwo+IHBhdGNoIGxhbmd1YWdlIHdoaWNoIHdvdWxkIGRl
dGVjdCBvdGhlciBxdWVzdGlvbmFibGUgc291cmNlIGNvZGUuCj4gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC9sb2cvc2Ny
aXB0cy9jb2NjaW5lbGxlL2ZyZWUvaW91bm1hcC5jb2NjaQo+IAo+IEhvdyBkbyB5b3UgdGhpbmsg
YWJvdXQgdG8gZXh0ZW5kIHByZXNlbnRlZCBzb2Z0d2FyZSBhbmFseXNpcyBhcHByb2FjaGVzPwo+
ClNvcnJ5LCBJIGFtIG5vdCBmYW1pbGlhciB3aXRoIGl0LCBJIGRvbid0IGtub3cuCgpCUiwKRGVq
aW4KCj4gUmVnYXJkcywKPiBNYXJrdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
