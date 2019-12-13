Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD04411ED6A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 23:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5476EDE3;
	Fri, 13 Dec 2019 22:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514916EDD0;
 Fri, 13 Dec 2019 22:07:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 14:07:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,311,1571727600"; d="scan'208";a="216558857"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by orsmga006.jf.intel.com with ESMTP; 13 Dec 2019 14:07:27 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC v2 01/12] drm/i915/svm: Add SVM documentation
Date: Fri, 13 Dec 2019 13:56:03 -0800
Message-Id: <20191213215614.24558-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
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
Cc: kenneth.w.graunke@intel.com, sanjay.k.kumar@intel.com,
 sudeep.dutt@intel.com, dri-devel@lists.freedesktop.org,
 jason.ekstrand@intel.com, dave.hansen@intel.com, jglisse@redhat.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, dan.j.williams@intel.com,
 ira.weiny@intel.com, jgg@mellanox.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIFNoYXJlZCBWaXJ0dWFsIE1lbW9yeSAoU1ZNKSBzdXBwb3J0IGluZm9ybWF0aW9uLgoKQ2M6
IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT4KQ2M6IEpv
biBCbG9vbWZpZWxkIDxqb24uYmxvb21maWVsZEBpbnRlbC5jb20+CkNjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IFN1ZGVlcCBEdXR0IDxzdWRlZXAuZHV0dEBp
bnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEgPG5pcmFu
amFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPgotLS0KIERvY3VtZW50YXRpb24vZ3B1L2k5
MTUucnN0IHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvaTkxNS5y
c3QgYi9Eb2N1bWVudGF0aW9uL2dwdS9pOTE1LnJzdAppbmRleCBlNTM5YzQyYTNlNzguLjBiYzk5
OTk2MzQ4OSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvaTkxNS5yc3QKKysrIGIvRG9j
dW1lbnRhdGlvbi9ncHUvaTkxNS5yc3QKQEAgLTQxNSw2ICs0MTUsMzUgQEAgT2JqZWN0IFRpbGlu
ZyBJT0NUTHMKIC4uIGtlcm5lbC1kb2M6OiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9n
ZW1fdGlsaW5nLmMKICAgIDpkb2M6IGJ1ZmZlciBvYmplY3QgdGlsaW5nCiAKK1NoYXJlZCBWaXJ0
dWFsIE1lbW9yeSAoU1ZNKQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisKK1NoYXJlZCBW
aXJ0dWFsIE1lbW9yeSAoU1ZNKSBhbGxvd3MgdGhlIHByb2dyYW1tZXIgdG8gdXNlIGEgc2luZ2xl
IHZpcnR1YWwKK2FkZHJlc3Mgc3BhY2Ugd2hpY2ggd2lsbCBiZSBzaGFyZWQgYmV0d2VlbiB0aHJl
YWRzIGV4ZWN1dGluZyBvbiBDUFVzIGFuZCBHUFVzLgorSXQgYWJzdHJhY3RzIGF3YXkgZnJvbSB0
aGUgdXNlciB0aGUgbG9jYXRpb24gb2YgdGhlIGJhY2tpbmcgbWVtb3J5LCBhbmQgaGVuY2UKK3Np
bXBsaWZpZXMgdGhlIHVzZXIgcHJvZ3JhbW1pbmcgbW9kZWwuCitTVk0gc3VwcG9ydHMgdHdvIHR5
cGVzIG9mIHZpcnR1YWwgbWVtb3J5IGFsbG9jYXRpb24gbWV0aG9kcy4KK1J1bnRpbWUgYWxsb2Nh
dG9yIHJlcXVpcmVzIHRoZSBkcml2ZXIgdG8gcHJvdmlkZSBtZW1vcnkgYWxsb2NhdGlvbiBhbmQK
K21hbmFnZW1lbnQgaW50ZXJmYWNlLCBsaWtlIGJ1ZmZlciBvYmplY3QgKEJPKSBpbnRlcmZhY2Uu
CitXaGVyZWFzIHN5c3RlbSBhbGxvY2F0b3IgbWFrZXMgdXNlIG9mIGRlZmF1bHQgT1MgbWVtb3J5
IGFsbG9jYXRpb24gYW5kCittYW5hZ2VtZW50IHN1cHBvcnQgbGlrZSBtYWxsb2MoKS4KKworTGlu
dXgga2VybmVsIGhhcyBhIEhldGVyb2dlbmVvdXMgTWVtb3J5IE1hbmFnZW1lbnQgKEhNTSkgZnJh
bWV3b3JrIHRvCitTdXBwb3J0IFNWTSBzeXN0ZW0gYWxsb2NhdG9yLiBITU3igJlzIGFkZHJlc3Mg
c3BhY2UgbWlycm9yaW5nIHN1cHBvcnQgYWxsb3dzCitzaGFyaW5nIG9mIHRoZSBhZGRyZXNzIHNw
YWNlIGJ5IGR1cGxpY2F0aW5nIHNlY3Rpb25zIG9mIENQVSBwYWdlIHRhYmxlcyBpbiB0aGUKK2Rl
dmljZSBwYWdlIHRhYmxlcy4gVGhpcyBlbmFibGVzIGJvdGggQ1BVIGFuZCBHUFUgYWNjZXNzIGEg
cGh5c2ljYWwgbWVtb3J5Citsb2NhdGlvbiB1c2luZyB0aGUgc2FtZSB2aXJ0dWFsIGFkZHJlc3Mu
IExpbnV4IGtlcm5lbCBhbHNvIHByb3ZpZGVzIHRoZSBhYmlsaXR5Cit0byBwbHVnaW4gZGV2aWNl
IG1lbW9yeSB3aXRoIHRoZSBzeXN0ZW0gKGFzIGEgc3BlY2lhbCBaT05FX0RFVklDRSB0eXBlKSBh
bmQKK2FsbG9jYXRlcyBzdHJ1Y3QgcGFnZSBmb3IgZWFjaCBkZXZpY2UgbWVtb3J5IHBhZ2UuIEl0
IGFsc28gcHJvdmlkZXMgYSBtZWNoYW5pc20KK3RvIG1pZ3JhdGUgcGFnZXMgZnJvbSBob3N0IHRv
IGRldmljZSBtZW1vcnkgYW5kIHZpY2UgdmVyc2EuCitNb3JlIGluZm9ybWF0aW9uIG9uIEhNTSBj
YW4gYmUgZm91bmQgaGVyZS4KK2h0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRp
b24vdm0vaG1tLnJzdAorCitpOTE1IHN1cHBvcnRzIGJvdGggU1ZNIHN5c3RlbSBhbmQgcnVudGlt
ZSBhbGxvY2F0b3IuIEFzIFBDSWUgaXMgYSBub24tY29oZXJlbnQKK2J1cywgaXQgcGx1Z3MgaW4g
ZGV2aWNlIG1lbW9yeSBhcyBERVZJQ0VfUFJJVkFURSBhbmQgbm8gbWVtb3J5IGFjY2VzcyBhY3Jv
c3MKK1BDSWUgbGluayBpcyBhbGxvd2VkLiBBbnkgc3VjaCBhY2Nlc3Mgd2lsbCB0cmlnZ2VyIG1p
Z3JhdGlvbiBvZiB0aGUgcGFnZS9zCitvciBCT3MgYmVmb3JlIHRoZSBtZW1vcnkgaXMgYWNjZXNz
ZWQuCisKIE1pY3JvY29udHJvbGxlcnMKID09PT09PT09PT09PT09PT0KIAotLSAKMi4yMS4wLnJj
MC4zMi5nMjQzYTRjN2UyNwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
