Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 917C982415
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 19:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668B36E079;
	Mon,  5 Aug 2019 17:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0ECA6E079
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 17:39:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 74DB8C056807;
 Mon,  5 Aug 2019 17:39:06 +0000 (UTC)
Received: from rt4.app.eng.rdu2.redhat.com (rt4.app.eng.rdu2.redhat.com
 [10.10.161.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7C3E5DA60;
 Mon,  5 Aug 2019 17:39:01 +0000 (UTC)
Received: from rt4.app.eng.rdu2.redhat.com (localhost [127.0.0.1])
 by rt4.app.eng.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id x75Hd0BJ023399;
 Mon, 5 Aug 2019 13:39:00 -0400
Received: (from apache@localhost)
 by rt4.app.eng.rdu2.redhat.com (8.14.4/8.14.4/Submit) id x75Hcnwa023396;
 Mon, 5 Aug 2019 13:38:49 -0400
From: Red Hat Product Security <secalert@redhat.com>
X-PGP-Public-Key: https://www.redhat.com/security/650d5882.txt
Subject: [engineering.redhat.com #494100] Question on submitting patch for a
 security bug
In-Reply-To: <CAJ7L_Gp2HJoFOVxTgakCJw3LMuiPY0+60-giOtw3OwRD6zyNTQ@mail.gmail.com>
References: <RT-Ticket-494100@engineering.redhat.com>
 <CAJ7L_Gp2HJoFOVxTgakCJw3LMuiPY0+60-giOtw3OwRD6zyNTQ@mail.gmail.com>
Message-ID: <rt-4.0.13-23214-1565026728-1358.494100-5-0@engineering.redhat.com>
Precedence: bulk
X-RT-Loop-Prevention: engineering.redhat.com
RT-Ticket: engineering.redhat.com #494100
Managed-BY: RT 4.0.13 (http://www.bestpractical.com/rt/)
RT-Originator: pjp@redhat.com
To: b.zolnierkie@samsung.com, bob.liu@oracle.com, chuck.lever@oracle.com,
 davem@davemloft.net, emamd001@umn.edu, gregkh@linuxfoundation.org,
 kubakici@wp.pl, kvalo@codeaurora.org, navid.emamdoost@gmail.com,
 sam@ravnborg.org
MIME-Version: 1.0
X-RT-Original-Encoding: utf-8
Date: Mon, 5 Aug 2019 13:38:48 -0400
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Mon, 05 Aug 2019 17:39:08 +0000 (UTC)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Reply-To: secalert@redhat.com
Cc: kstewart@linuxfoundation.org, alexandre.belloni@bootlin.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, bfields@fieldses.org,
 linux-ide@vger.kernel.org, thierry.reding@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, jslaby@suse.com, matthias@redhat.com,
 alexandre.torgue@st.com, smccaman@umn.edu, kjlu@umn.edu, josef@toxicpanda.com,
 johnfwhitmore@gmail.com, nbd@other.debian.org, linux-block@vger.kernel.org,
 linux-mediatek@lists.infradead.org, nishkadg.linux@gmail.com,
 matthias.bgg@gmail.com, peppe.cavallaro@st.com, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, trond.myklebust@hammerspace.com,
 allison@lohutok.net, axboe@kernel.dk, mcoquelin.stm32@gmail.com,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 unglinuxdriver@microchip.com, vkoul@kernel.org, vishal@chelsio.com,
 colin.king@canonical.com, anna.schumaker@netapp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gTmF2aWQsCgpPbiBUaHUsIDE4IEp1bCAyMDE5IDAxOjMwOjIwIEdNVCwgZW1hbWQwMDFA
dW1uLmVkdSB3cm90ZToKPiBJJ3ZlIGZvdW5kIGEgbnVsbCBkZXJlZmVyZW5jZSBidWcgaW4gdGhl
IExpbnV4IGtlcm5lbCBzb3VyY2UgY29kZS4gSSB3YXMKPiB3b25kZXJpbmcgc2hvdWxkIEkgY2Mg
dGhlIHBhdGNoIHRvIHlvdSBhcyB3ZWxsIChhbG9uZyB3aXRoIHRoZQo+IG1haW50YWluZXJzKT8K
Ck5vLiBQbGVhc2UgZG8gbm90IGNjIDxzZWNhbGVydEByZWRoYXQuY29tPiBvbiB0aGUgdXBzdHJl
YW0ga2VybmVsIHBhdGNoZXMuCkl0IGlzIG1lYW50IGZvciByZXBvcnRpbmcgc2VjdXJpdHkgaXNz
dWVzIG9ubHkuCgpHb2luZyB0aHJvdWdoIHRoZSBwYXRjaGVzIGhlcmUKCjEuIElzc3VlcyBpbiAu
Li9zdGFnaW5nLyBkcml2ZXJzIGFyZSBub3QgY29uc2lkZXJlZCBmb3IgQ1ZFLCB0aGV5IGFyZSBu
b3QgdG8gYmUKdXNlZAppbiBwcm9kdWN0aW9uIGVudmlyb25tZW50LgoKMi4gTWFueSBvZiB0aGUg
cGF0Y2hlcyBsaXN0ZWQgZml4IE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSB3aGVuIG1lbW9yeQph
bGxvY2F0aW9uCmZhaWxzIGFuZCByZXR1cm5zIE5VTEwuCgozLiBEbyB5b3UgaGFwcGVuIHRvIGhh
dmUgcmVwcm9kdWNlcnMgZm9yIHRoZXNlIGlzc3Vlcz8gQ291bGQgYW4gdW5wcml2aWxlZ2VkCnVz
ZXIgdHJpZ2dlciB0aGVtPwoKPiBBbHNvLCBJIHdhcyB3b25kZXJpbmcgd2hhdCBhcmUgdGhlIHN0
ZXBzIHRvIGdldCBDVkUgZm9yIHRoZSBidWcgKHRoaXMgaXMKPiB0aGUgZmlyc3QgdGltZSBJIGFt
IHJlcG9ydGluZyBhIGJ1Zyk/CgpHZW5lcmFsbHkgQ1ZFIGlzIGFzc2lnbmVkIGFmdGVyIGNvbmZp
cm1pbmcgdGhhdCBhIGdpdmVuIGlzc3VlIHJlYWxseSBpcyBhCnNlY3VyaXR5IGlzc3VlLiBBbmQg
aXQgbWF5CmhhdmUgaW1wYWN0IHJhbmdpbmcgZnJvbSBpbmZvcm1hdGlvbiBsZWFrYWdlLCBEb1Mg
dG8gcHJpdmlsZWdlIGVzY2FsYXRpb24gb3IKbWF5YmUgYXJiaXRyYXJ5IGNvZGUKZXhlY3V0aW9u
LiBFdmVyeSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaXMgbm90IHNlY3VyaXR5IGlzc3VlLgoK
CkhvcGUgaXQgaGVscHMuIFRoYW5rIHlvdS4KLS0tClByYXNhZCBKIFBhbmRpdCAvIFJlZCBIYXQg
UHJvZHVjdCBTZWN1cml0eSBUZWFtCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
