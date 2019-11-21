Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2202A104C68
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8736C6EB30;
	Thu, 21 Nov 2019 07:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590766EB30
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 07:26:17 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19280906-1500050 for multiple; Thu, 21 Nov 2019 07:26:09 +0000
MIME-Version: 1.0
To: kernel test robot <lkp@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <5dd63a8f.BFdOlqs/XZAJHDfR%lkp@intel.com>
References: <5dd63a8f.BFdOlqs/XZAJHDfR%lkp@intel.com>
Message-ID: <157432116576.24852.2065478066028556019@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: 2989f64510 ("dma-buf: Add selftests for dma-fence"): WARNING:
 CPU: 0 PID: 1 at lib/debugobjects.c:524 __debug_object_init
Date: Thu, 21 Nov 2019 07:26:05 +0000
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
Cc: philip.li@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 LKP <lkp@lists.01.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBrZXJuZWwgdGVzdCByb2JvdCAoMjAxOS0xMS0yMSAwNzoxOTo0MykKPiBHcmVldGlu
Z3MsCj4gCj4gMGRheSBrZXJuZWwgdGVzdGluZyByb2JvdCBnb3QgdGhlIGJlbG93IGRtZXNnIGFu
ZCB0aGUgZmlyc3QgYmFkIGNvbW1pdCBpcwo+IAo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdCBtYXN0ZXIKPiAKPiBjb21t
aXQgMjk4OWY2NDUxMDg0YWVkM2Y4Y2M5OTkyNDc3ZjdhOWJmNTdhMzcxNgo+IEF1dGhvcjogICAg
IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IEF1dGhvckRhdGU6IE1v
biBBdWcgMTkgMTA6NTk6MjcgMjAxOSArMDEwMAo+IENvbW1pdDogICAgIENocmlzIFdpbHNvbiA8
Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IENvbW1pdERhdGU6IE1vbiBBdWcgMTkgMTg6MDk6
NDYgMjAxOSArMDEwMAoKVGhhdCdzIGEgYmVsYXRlZCByZXBvcnQsIGZpeGVkIGJ5Cgpjb21taXQg
NmFjM2EwZWJmY2MyZjBjNzVjYTBjYTY5NzQzODljZTQyMWFhNWNiZApBdXRob3I6IENocmlzIFdp
bHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpEYXRlOiAgIFR1ZSBBdWcgMjAgMTM6MjE6
MTggMjAxOSArMDEwMAoKCWRtYWJ1ZjogTWFyayB1cCBvbnN0YWNrIHRpbWVyIGZvciBzZWxmdGVz
dHMKCk5vPwotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
