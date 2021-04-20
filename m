Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A933653F7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 10:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C3889DA8;
	Tue, 20 Apr 2021 08:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPTOSEGREL01.sonyericsson.com (jptosegrel01.sonyericsson.com
 [124.215.201.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9435789DA8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 08:22:44 +0000 (UTC)
From: Peter Enderborg <peter.enderborg@sony.com>
To: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alexey Dobriyan <adobriyan@gmail.com>, Andrew
 Morton <akpm@linux-foundation.org>, Muchun Song <songmuchun@bytedance.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>, Michal
 Hocko <mhocko@suse.com>, NeilBrown <neilb@suse.de>, Sami Tolvanen
 <samitolvanen@google.com>, Mike Rapoport <rppt@kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, Matthew Wilcox <willy@infradead.org>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees
 Cook <keescook@chromium.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Alexey Gladkov <gladkov.alexey@gmail.com>, Feng
 Tang <feng.tang@intel.com>, <linux-doc@vger.kernel.org>
Subject: [PATCH 0/2 V6]Add dma-buf counter
Date: Tue, 20 Apr 2021 10:22:18 +0200
Message-ID: <20210420082220.7402-1-peter.enderborg@sony.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=DLnxHBFb c=1 sm=1 tr=0
 a=9drRLWArJOlETflmpfiyCA==:117 a=IkcTkHD0fZMA:10 a=3YhXtTcJ-WEA:10
 a=QyXUC8HyAAAA:8 a=6icRsfec0oETIK1Ck8AA:9 a=QEXdDO2ut3YA:10
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-SEG-SpamProfiler-Score: 0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRtYS1idWYgY291bnRlciBpcyBhIG1ldHJpYyBmb3IgbWFwcGVkIG1lbW9yeSB1c2VkIGJ5
IGl0J3MgY2xpZW50cy4KSXQgaXMgYSBzaGFyZWQgYnVmZmVyIHRoYXQgaXMgdHlwaWNhbGx5IHVz
ZWQgZm9yIGludGVycHJvY2VzcyBjb21tdW5pY2F0aW9uCm9yIHByb2Nlc3MgdG8gaGFyZHdhcmUg
Y29tbXVuaWNhdGlvbi4gSW4gYW5kcm9pZCB3ZSB1c2VkIHRvIGhhdmUgSU9OLC4gYnV0Cml0IGlz
IG5vdyByZXBsYWNlZCB3aXRoIGRtYS1idWYuIElPTiBoYWQgc29tZSBvdmVydmlldyBtZXRyaWNz
IHRoYXQgd2FzIHNpbWlsYXIuCgoKClYxCglpbml0aWFsIHZlcnNpb24uIEFkZCBkbWEtYnVmIGNv
dW50ZXIKClYyCglGaXggYnVpbGQgZGVwZW5jZW5keSBlcnJvciBzdWdnZXN0ZWQgYnkgTWF0dGhl
dyBXaWxjb3gKCUV4dGVudCBjb21taXQgbWVzc2FnZSBzdWdnZWQgYnkgS8O2bmluZwoKVjMKCUNo
YW5nZSB2YXJpYWJsZSBhbmQgZnVuY3Rpb24gbmFtZXMuCgpWNAoJRml4IGZ1bmN0aW9uIG5hbWUg
aW4gY29kZSBkb2MKCVJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNv
bT4KClY1CglSZW1vdmVkIEVYUE9SVF9TWU1CT0xfR1BMIHN1Z2dlc3RlZCBieSBNdWNodW4gU29u
ZwoKVjYKCU1hZGUgaXQgYSBwYXRjaCBzZXQsIEFkZGluZyBhIGFkZGlvbmFsIHBhdGNoIGZvcgoJ
cHJpbnRpbmcgZG1hLWJ1ZiBjb3VudGVyIGluIHNob3dfbWVtLgoJU3VnZ2VzdGVkIGJ5IE1pY2hh
bCBIb2Nrby4KCgoKCgkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
