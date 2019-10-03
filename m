Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A953CA0E5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 17:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0656EA0C;
	Thu,  3 Oct 2019 15:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Thu, 03 Oct 2019 15:07:14 UTC
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net
 [194.109.24.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A506EA0C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 15:07:14 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud8.xs4all.net with ESMTPA
 id G2aEi3TBOop0AG2aHi8jEM; Thu, 03 Oct 2019 17:00:04 +0200
Subject: Re: [PATCH] drivers: video: hdmi: log ext colorimetry applicability
To: Johan Korsnes <jkorsnes@cisco.com>, dri-devel@lists.freedesktop.org
References: <20191003071549.31272-1-jkorsnes@cisco.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3d11335d-8e5c-f062-91f5-fb3bf87c77b9@xs4all.nl>
Date: Thu, 3 Oct 2019 16:59:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191003071549.31272-1-jkorsnes@cisco.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfKDkvMUeIn38ureWIwWMm33yN0MHYKU+4LnlBRDGrKBrH1fZG3iyKkvzqtMn7rEGttWC1u9qg42KbH6iL607wPofKbpFlq9kB8bgA421spce97zTBRN0
 HEFZR4vldaCjqMIcnEEw9WT02eRZ5YRp9YLFFZHtTilZ5yC12fX4UjHhDOEmWXzPg2Gdy1EtVhFhSsA53gbuYoATRm6B8fVtN75ZdIIO9cLEZjtNcB9QOdHE
 2TKA2onWe16C9aJUs+LB3Q==
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
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMy8xOSA5OjE1IEFNLCBKb2hhbiBLb3JzbmVzIHdyb3RlOgo+IFdoZW4gbG9nZ2luZyB0
aGUgQVZJIEluZm9GcmFtZSwgY2xlYXJseSBpbmRpY2F0ZSB3aGV0aGVyIG9yIG5vdCB0aGUKPiBl
eHRlbmRlZCBjb2xvcmltZXRyeSBhdHRyaWJ1dGUgaXMgYWN0aXZlLiBUaGlzIGlzIG9ubHkgdGhl
IGNhc2Ugd2hlbgo+IHRoZSBBVkkgSW5mb0ZyYW1lIGNvbG9yaW1ldHJ5IGF0dHJpYnV0ZSBpcyBz
ZXQgdG8gZXh0ZW5kZWQuIFswXQo+IAo+IFswXSBDVEEtODYxLUcgc2VjdGlvbiA2LjQgcGFnZSA1
Nwo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvaGFuIEtvcnNuZXMgPGprb3JzbmVzQGNpc2NvLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy92aWRlby9oZG1pLmMgfCA4ICsrKysrKystCj4gIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aWRlby9oZG1pLmMgYi9kcml2ZXJzL3ZpZGVvL2hkbWkuYwo+IGluZGV4IGYyOWRiNzI4
ZmYyOS4uYTcwOWUzOGE1M2NhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vaGRtaS5jCj4g
KysrIGIvZHJpdmVycy92aWRlby9oZG1pLmMKPiBAQCAtNjgyLDggKzY4MiwxNCBAQCBzdGF0aWMg
dm9pZCBoZG1pX2F2aV9pbmZvZnJhbWVfbG9nKGNvbnN0IGNoYXIgKmxldmVsLAo+ICAJaGRtaV9s
b2coIiAgICBhY3RpdmUgYXNwZWN0OiAlc1xuIiwKPiAgCQkJaGRtaV9hY3RpdmVfYXNwZWN0X2dl
dF9uYW1lKGZyYW1lLT5hY3RpdmVfYXNwZWN0KSk7Cj4gIAloZG1pX2xvZygiICAgIGl0YzogJXNc
biIsIGZyYW1lLT5pdGMgPyAiSVQgQ29udGVudCIgOiAiTm8gRGF0YSIpOwo+IC0JaGRtaV9sb2co
IiAgICBleHRlbmRlZCBjb2xvcmltZXRyeTogJXNcbiIsCj4gKwo+ICsJaWYgKGZyYW1lLT5jb2xv
cmltZXRyeSA9PSBIRE1JX0NPTE9SSU1FVFJZX0VYVEVOREVEKQo+ICsJCWhkbWlfbG9nKCIgICAg
ZXh0ZW5kZWQgY29sb3JpbWV0cnk6ICVzXG4iLAo+ICAJCQloZG1pX2V4dGVuZGVkX2NvbG9yaW1l
dHJ5X2dldF9uYW1lKGZyYW1lLT5leHRlbmRlZF9jb2xvcmltZXRyeSkpOwo+ICsJZWxzZQo+ICsJ
CWhkbWlfbG9nKCIgICAgZXh0ZW5kZWQgY29sb3JpbWV0cnk6IE4vQSAoMHgleClcbiIsCj4gKwkJ
CWZyYW1lLT5leHRlbmRlZF9jb2xvcmltZXRyeSk7Cj4gKwo+ICAJaGRtaV9sb2coIiAgICBxdWFu
dGl6YXRpb24gcmFuZ2U6ICVzXG4iLAo+ICAJCQloZG1pX3F1YW50aXphdGlvbl9yYW5nZV9nZXRf
bmFtZShmcmFtZS0+cXVhbnRpemF0aW9uX3JhbmdlKSk7Cj4gIAloZG1pX2xvZygiICAgIG51cHM6
ICVzXG4iLCBoZG1pX251cHNfZ2V0X25hbWUoZnJhbWUtPm51cHMpKTsKPiAKCkkganVzdCByZWFs
aXplZCB0aGF0IHRoZXJlIGFyZSBtb3JlIGZpZWxkcyBsaWtlIHRoYXQ6Cgpjb250ZW50X3R5cGUg
aXMgb25seSB2YWxpZCBpZiBpdGMgPT0gdHJ1ZQoKcXVhbnRpemF0aW9uX3JhbmdlIGlzIG9ubHkg
dmFsaWQgaWYgY29sb3JzcGFjZSBpcyBSR0IKCnljY19xdWFudGl6YXRpb25fcmFuZ2UgaXMgb25s
eSB2YWxpZCBpZiBjb2xvcnNwYWNlIGlzIFlDQwoKQ2FuIHlvdSBtYWtlIGEgdjIgd2hlcmUgdGhl
c2UgZmllbGRzIGFyZSBoYW5kbGVkIGluIHRoZSBzYW1lIHdheT8KVGhhdCB3b3VsZCByZWFsbHkg
aGVscCByZWR1Y2UgdGhlIGNvbmZ1c2lvbiB3aGVuIGxvZ2dpbmcgdGhlCkFWSSBJbmZvRnJhbWUu
CgpSZWdhcmRzLAoKCUhhbnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
