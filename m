Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C75A012821
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 08:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D7889624;
	Fri,  3 May 2019 06:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113D889306
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 03:19:23 +0000 (UTC)
Received: from adsl-173-228-226-134.prtc.net ([173.228.226.134]
 helo=[172.20.29.49])
 by ale.deltatee.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <logang@deltatee.com>)
 id 1hMOiq-0006pS-Iv; Thu, 02 May 2019 21:18:53 -0600
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org,
 sboyd@kernel.org, shuah@kernel.org
References: <20190501230126.229218-1-brendanhiggins@google.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <ea36c3d6-8c13-2186-16f3-596d834aeebe@deltatee.com>
Date: Thu, 2 May 2019 21:18:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501230126.229218-1-brendanhiggins@google.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 173.228.226.134
X-SA-Exim-Rcpt-To: wfg@linux.intel.com, rostedt@goodmis.org,
 rientjes@google.com, richard@nod.at, pmladek@suse.com, mpe@ellerman.id.au,
 knut.omang@oracle.com, khilman@baylibre.com, julia.lawall@lip6.fr,
 joel@jms.id.au, jdike@addtoit.com, daniel@ffwll.ch, dan.j.williams@intel.com,
 dan.carpenter@oracle.com, amir73il@gmail.com, Tim.Bird@sony.com,
 Alexander.Levin@microsoft.com, linux-um@lists.infradead.org,
 linux-nvdimm@lists.01.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, shuah@kernel.org, sboyd@kernel.org,
 robh@kernel.org, mcgrof@kernel.org, kieran.bingham@ideasonboard.com,
 keescook@google.com, gregkh@linuxfoundation.org, frowand.list@gmail.com,
 brendanhiggins@google.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Mailman-Approved-At: Fri, 03 May 2019 06:54:46 +0000
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 khilman@baylibre.com, knut.omang@oracle.com, wfg@linux.intel.com,
 joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDE5LTA1LTAxIDU6MDEgcC5tLiwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+ICMjIFRM
RFIKPiAKPiBJIHJlYmFzZWQgdGhlIGxhc3QgcGF0Y2hzZXQgb24gNS4xLXJjNyBpbiBob3BlcyB0
aGF0IHdlIGNhbiBnZXQgdGhpcyBpbgo+IDUuMi4KPiAKCkFzIEkgc2FpZCBvbiB0aGUgbGFzdCBw
b3N0aW5nLCBJIGxpa2UgdGhpcyBhbmQgd291bGQgbGlrZSB0byBzZWUgaXQgbW92ZQpmb3J3YXJk
LiBJIHN0aWxsIGhhdmUgdGhlIHNhbWUgY29uY2VybnMgb3ZlciB0aGUgZG93bnNpZGVzIG9mIHVz
aW5nIFVNTAooaWUuIG5vdCBiZWluZyBhYmxlIHRvIGNvbXBpbGUgbGFyZ2Ugc3dhdGhzIG9mIHRo
ZSB0cmVlIGR1ZSB0byBmZWF0dXJlcwp0aGF0IGRvbid0IGV4aXN0IGluIHRoYXQgYXJjaCkgYnV0
IHRoZXNlIGFyZSBjb25jZXJucyBmb3IgbGF0ZXIuCgpJJ2QgcHJlZmVyIHRvIHNlZSB0aGUgdW5u
ZWNlc3NhcnkgaW5kaXJlY3Rpb24gdGhhdCBJIHBvaW50ZWQgb3V0IGluCnBhdGNoIDggY2xlYW5l
ZCB1cCBidXQsIGJlc2lkZXMgdGhhdCwgdGhlIGNvZGUgbG9va3MgZ29vZCB0byBtZS4KClJldmll
d2VkLWJ5OiBMb2dhbiBHdW50aG9ycGUgPGxvZ2FuZ0BkZWx0YXRlZS5jb20+CgpUaGFua3MhCgpM
b2dhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
