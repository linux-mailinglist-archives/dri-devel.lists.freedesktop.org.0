Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD0275D28
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 04:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F0B6E85E;
	Fri, 26 Jul 2019 02:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84A86E85E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 02:46:44 +0000 (UTC)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E14462238C;
 Fri, 26 Jul 2019 02:46:42 +0000 (UTC)
Date: Thu, 25 Jul 2019 22:46:41 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: syzbot <syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com>
Subject: Re: memory leak in dma_buf_ioctl
Message-ID: <20190725224641.5d8baeb7@oasis.local.home>
In-Reply-To: <00000000000005dbbc058e8c608d@google.com>
References: <000000000000b68e04058e6a3421@google.com>
 <00000000000005dbbc058e8c608d@google.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: kaber@trash.net, mpe@ellerman.id.au, bsingharora@gmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, davem@davemloft.net,
 linaro-mm-sig@lists.linaro.org, coreteam@netfilter.org,
 netfilter-devel@vger.kernel.org, pablo@netfilter.org, kadlec@blackhole.kfki.hu,
 netdev@vger.kernel.org, mingo@redhat.com, duwe@suse.de, dvyukov@google.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNSBKdWwgMjAxOSAxOTozNDowMSAtMDcwMApzeXpib3QgPHN5emJvdCtiMjA5OGJj
NDQ3MjhhNGVmYjNlOUBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tPiB3cm90ZToKCj4gc3l6Ym90
IGhhcyBiaXNlY3RlZCB0aGlzIGJ1ZyB0bzoKPiAKPiBjb21taXQgMDRjZjMxYTc1OWVmNTc1Zjc1
MGE2Mzc3N2NlZTk1NTAwZTQxMDk5NAo+IEF1dGhvcjogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVs
bGVybWFuLmlkLmF1Pgo+IERhdGU6ICAgVGh1IE1hciAyNCAxMTowNDowMSAyMDE2ICswMDAwCj4g
Cj4gICAgICBmdHJhY2U6IE1ha2UgZnRyYWNlX2xvY2F0aW9uX3JhbmdlKCkgZ2xvYmFsCgpJdCdz
IHNhZCB0aGF0IEkgaGF2ZSB5ZXQgdG8gZmluZCBhIHNpbmdsZSBzeXpib3QgYmlzZWN0IHVzZWZ1
bC4gUmVhbGx5PwpzZXR0aW5nIGEgZnVuY3Rpb24gZnJvbSBzdGF0aWMgdG8gZ2xvYmFsIHdpbGwg
Y2F1c2UgYSBtZW1vcnkgbGVhayBpbiBhCmNvbXBsZXRlbHkgdW5yZWxhdGVkIGFyZWEgb2YgdGhl
IGtlcm5lbD8KCkknbSBhYm91dCB0byBzZXQgdGhlc2UgdG8gbXkgL2Rldi9udWxsIGZvbGRlci4K
Ci0tIFN0ZXZlCgoKPiAKPiBiaXNlY3Rpb24gbG9nOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3Bv
dC5jb20veC9iaXNlY3QudHh0P3g9MTU0MjkzZjQ2MDAwMDAKPiBzdGFydCBjb21taXQ6ICAgYWJk
ZmQ1MmEgTWVyZ2UgdGFnICdhcm1zb2MtZGVmY29uZmlnJyBvZiBnaXQ6Ly9naXQua2VybmVsLi4u
Cj4gZ2l0IHRyZWU6ICAgICAgIHVwc3RyZWFtCj4gZmluYWwgY3Jhc2g6ICAgIGh0dHBzOi8vc3l6
a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwb3J0LnR4dD94PTE3NDI5M2Y0NjAwMDAwCj4gY29uc29s
ZSBvdXRwdXQ6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvbG9nLnR4dD94PTEzNDI5
M2Y0NjAwMDAwCj4ga2VybmVsIGNvbmZpZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29t
L3gvLmNvbmZpZz94PWQzMWRlM2Q4ODA1OWI3ZmEKPiBkYXNoYm9hcmQgbGluazogaHR0cHM6Ly9z
eXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPWIyMDk4YmM0NDcyOGE0ZWZiM2U5Cj4gc3l6
IHJlcHJvOiAgICAgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwcm8uc3l6P3g9
MTI1MjZlNTg2MDAwMDAKPiBDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3Bv
dC5jb20veC9yZXByby5jP3g9MTYxNzg0ZjA2MDAwMDAKPiAKPiBSZXBvcnRlZC1ieTogc3l6Ym90
K2IyMDk4YmM0NDcyOGE0ZWZiM2U5QHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KPiBGaXhlczog
MDRjZjMxYTc1OWVmICgiZnRyYWNlOiBNYWtlIGZ0cmFjZV9sb2NhdGlvbl9yYW5nZSgpIGdsb2Jh
bCIpCj4gCj4gRm9yIGluZm9ybWF0aW9uIGFib3V0IGJpc2VjdGlvbiBwcm9jZXNzIHNlZTogaHR0
cHM6Ly9nb28uZ2wvdHBzbUVKI2Jpc2VjdGlvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
