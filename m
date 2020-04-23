Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C50F1B5E58
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 16:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1B86E877;
	Thu, 23 Apr 2020 14:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8793A6E877
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 14:52:16 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id x77so3073656pfc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 07:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/sb3dlUj5FrGwmCMaw1i7cs39EU8HrExHVtJsyVG3VY=;
 b=oyIVHUIMteQ+Jyujbx3EDLFuw+ISWFk6HIHSvS6fYlUsxnyisljN8Ia6w8b2XrbWI5
 kn/ZnFcbY+qdKeF4vLEem6y/yZrATTRtLYUbkbxX3dq1jQP4X9U7bqOquWVm5PQ58wIk
 zQFJtrba2s5XmQtB/1CUeF+UNtgy0Yi8WYrsAzHDHbkhJbbtS8LHnkI2ZWLBtfq8FGl7
 n/e8I9fe0HozYBhAYBxbmkzDW7MPkIPONX9Wc16T4KH3D7OeN4TJyax0hcFB6T5/cnEQ
 PMi7d1gyQRk9aDLupdLrXQo4rLNH0emHJrkAKy0ai5BJJ6Z8/NjsAqq8kSnh0lLmjYHd
 d3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/sb3dlUj5FrGwmCMaw1i7cs39EU8HrExHVtJsyVG3VY=;
 b=Z01bkWDILesUuDUW5849FF1juxDTzmF5+hparAagmTu1XPGb9+8inv+lRANCGkJnNE
 9c7Qw0bJxhumgSt+180CtRTwoBiAAw1iJVkHygWxkfM6V9WZWtYrLe6O2r2pSWc3ynF4
 QylPPILU658WJ+G2E9S0xlQ7LNvbB+dcDXHWOZzZaZHADMedrR/r+WZ3DLXEaoYlCPy5
 xQssiV0IOFURzMR44eCqgIxU414QyplcOaeEegUvyBTKx5HVIa7VFY1FlOQe0NFgNIX0
 3XHf3/5ysdNUb8opvXO0rIJY30xqayrVN/4VmGEcD04RZnYSLqgSvCWU3m2d6v0Fho1h
 6UrA==
X-Gm-Message-State: AGi0PuYjd4PzpixoRgktuUnewigGLxoLd+A1+obQi+Hdh4pv9WItGNBl
 Zqgt3AP3Hv1fA0c2e1Zhg1xcTQ6uPSNbQ8Cvc5o=
X-Google-Smtp-Source: APiQypJYkHlH+G01ukIQTIcX4mw/JbzhQZYKNM2IW0V/S/oVOVH5kXUElwv3U/VvSlsvXAXK2gyRX1QXlKVJiRNAlsI=
X-Received: by 2002:a62:5ec7:: with SMTP id s190mr3964136pfb.130.1587653536121; 
 Thu, 23 Apr 2020 07:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200423142627.1820-1-zhengdejin5@gmail.com>
In-Reply-To: <20200423142627.1820-1-zhengdejin5@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 23 Apr 2020 17:52:09 +0300
Message-ID: <CAHp75Vf1_SMk=_WDUrB97BGR6K6EXOdtgQ92=hTyMdVUoyWQiw@mail.gmail.com>
Subject: Re: [PATCH v2] console: console: Complete exception handling in
 newport_probe()
To: Dejin Zheng <zhengdejin5@gmail.com>
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
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, FlorianSchandinat@gmx.de,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgMjMsIDIwMjAgYXQgNToyNiBQTSBEZWppbiBaaGVuZyA8emhlbmdkZWppbjVA
Z21haWwuY29tPiB3cm90ZToKPgo+IEEgY2FsbCBvZiB0aGUgZnVuY3Rpb24gwqHCsGRvX3Rha2Vf
b3Zlcl9jb25zb2xlwqHCsSBjYW4gZmFpbCBoZXJlLgo+IFRoZSBjb3JyZXNwb25kaW5nIHN5c3Rl
bSByZXNvdXJjZXMgd2VyZSBub3QgcmVsZWFzZWQgdGhlbi4KPiBUaHVzIGFkZCBhIGNhbGwgb2Yg
dGhlIGZ1bmN0aW9uIMKhwrBpb3VubWFwwqHCsSB0b2dldGhlciB3aXRoIHRoZSBjaGVjawo+IG9m
IGEgZmFpbHVyZSBwcmVkaWNhdGUuCgouLi4KCj4gQ0M6IEFuZHkgU2hldmNoZW5rbyA8YW5keS5z
aGV2Y2hlbmtvQGdtYWlsLmNvbT4KClVzZSBDYzogQmV0dGVyIHRvIHJlYWQuCgouLi4KCj4gdjEg
LT4gdjI6Cj4gICAgICAgICAtIG1vZGlmeSB0aGUgY29tbWl0IGNvbW1lbnRzIGJ5IE1hcmt1cydz
dWdnZXN0aW9uLgoKV2hhdCBzdWdnZXN0aW9uPyBZb3UgbmVlZCB0byBiZSBjbGVhciBpbiBjaGFu
Z2Vsb2cgd2hhdCBleGFjdGx5IGhhcwpiZWVuIGRvbmUgd2l0aG91dCBsb29raW5nIHRvIGFueSBw
cmV2aW91cyBtYWlsLgoKLi4uCgo+ICAgICAgICAgY29uc29sZV9sb2NrKCk7Cj4gICAgICAgICBl
cnIgPSBkb190YWtlX292ZXJfY29uc29sZSgmbmV3cG9ydF9jb24sIDAsIE1BWF9OUl9DT05TT0xF
UyAtIDEsIDEpOwo+ICAgICAgICAgY29uc29sZV91bmxvY2soKTsKPiArCj4gKyAgICAgICBpZiAo
ZXJyKQo+ICsgICAgICAgICAgICAgICBpb3VubWFwKCh2b2lkICopbnByZWdzKTsKPiAgICAgICAg
IHJldHVybiBlcnI7Cj4gIH0KCkkgaGF2ZSBicmllZmx5IGxvb2tlZCBhdCB0aGUgY29kZSAoaXQg
aXMgYWN0dWFsbHkgcXVpdGUgb2xkIG9uZSEpLCBhbmQKSSB0aGluayB0aGlzIGlzIGhhbGYtYmFr
ZWQgc29sdXRpb24sIGJlc2lkZXMgdGhlIGZhY3Qgb2YgbWlzc2VkCl9faW9tZW0gYW5ub3RhdGlv
biBhbmQgdXNlbGVzcyBleHBsaWNpdCBjYXN0aW5nLgpUaGUgcHJvcGVyIG9uZSBzZWVtcyB0byBz
d2l0Y2ggdG8gbWVtcmVtYXAoKSBhbmQgZG8gbWVtdW5tYXAoKSBoZXJlLgoKLS0gCldpdGggQmVz
dCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
