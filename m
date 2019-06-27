Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C21B4587A5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 18:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE096E0D9;
	Thu, 27 Jun 2019 16:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Thu, 27 Jun 2019 16:51:30 UTC
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91CD6E0D9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 16:51:30 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id AA8634DA;
 Thu, 27 Jun 2019 12:44:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 27 Jun 2019 12:44:19 -0400
X-ME-Sender: <xms:YPIUXbYz4uVGFicZm3E9vkxFiL3Rnb1y33-oei5-NMQC0Ry8t_jSwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudekgddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekledrvddthedrudefie
 drvddvieenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
 necuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:YPIUXaH2RT0o7koS1e1MTdG5EPWVoCCfhzUYeD48Qp5tJzbj9EMmYg>
 <xmx:YPIUXT5baNsKQ6c7ZrAWhcCbG3NQ8Wxn441MKOqoNeSh_xvW4THzww>
 <xmx:YPIUXb5JOEZTj6f6GhQWmppFXc6zeguxWnlUBcaVv11m1nJkay0Dyw>
 <xmx:YvIUXfUlsC41Jaz8cDTMImQFCmkzxexJJ-a15g7no7P8OQEtze1zHFaB5L4>
Received: from localhost (unknown [89.205.136.226])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9ED34380083;
 Thu, 27 Jun 2019 12:44:15 -0400 (EDT)
Date: Fri, 28 Jun 2019 00:44:05 +0800
From: Greg KH <greg@kroah.com>
To: Lukas Schneider <lukas.s.schneider@fau.de>
Subject: Re: [PATCH] fbtft: Cleanup line over 80 character warnings
Message-ID: <20190627164405.GB9692@kroah.com>
References: <20190627121240.31584-1-lukas.s.schneider@fau.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627121240.31584-1-lukas.s.schneider@fau.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=rDFUjydPbLgsHZHBEgoxvpKuMK6
 XbRLR5IiACkCmvT4=; b=I6vSO2VNuWrji3LYrrKcLmA3Q16/Y9vYiMp0qg0Mj77
 9Fswf/GESw2QATxuYhgU6oCyeuTyu5Rk+1UfNEHnpkAZvufipskhyjlaYHB5LbiV
 6gkNkkYSrJ60fbIjq4PYNONXcRsxKT+n7WCOYW3UHpgfp+Gb+PqwPMpgIuADysVl
 U6WPAB5CS60jXFWoCp2W2FnSdgime72a3nfYaWtPLgnv/JQ0eie8luIW8SGxmUqt
 qNhRKd2dkaCPqXwGGdH787SSEqW80UZKaWybROp6o4HY/gOI6smT6igm42wdZ3g4
 kw6DEHA+m1znV0ednrwwCbpxow+ZzcHKBytAmpN+ItQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rDFUjy
 dPbLgsHZHBEgoxvpKuMK6XbRLR5IiACkCmvT4=; b=dD+Jzon7HcqaRUKKnkcOM4
 YQRPum6RVEfVcDAAWl0cP+tzyFjoNvnJvkmjHd2Dmb6uBd6ZVlD9ydpM9ikJ/tqM
 xH2zE50xMaliPVN+/YJcswyH6eQsI7ijUWVaduvqeErNDfu89t+G0ueDNhy3r/r4
 hrwvo/x3+ndHySevhQsMz8Z7fcsZBrK1YdcRA0ENWruQb2ot76qkuw/KVMjxcSL1
 UIiVTuV2tzDrsReKysASZxKdhYtn0J0XWF53WoOvlbPANg/Oyn0ezbiRQbZhPQRT
 DBZEX9I7hC/bobjuWOKbinSXnYTfxWK0nfiCoA0lKyH8BcuCUsqbX7MADUuAKmtg
 ==
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
Cc: devel@driverdev.osuosl.org, leobras.c@gmail.com,
 linux-fbdev@vger.kernel.org, digholebhagyashri@gmail.com,
 linux-kernel@i4.cs.fau.de, daniel.vetter@ffwll.ch, der_wolf_@web.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bhanusreemahesh@gmail.com, payal.s.kshirsagar.98@gmail.com,
 Jannik Moritz <jannik.moritz@fau.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDI6MTI6NDBQTSArMDIwMCwgTHVrYXMgU2NobmVpZGVy
IHdyb3RlOgo+IENsZWFudXAgdGhlIGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXIgd2FybmluZ3MsIHJl
cG9ydGVkIGJ5IGNoZWNrcGF0Y2gKPiAKPiBTaWduZWQtb2ZmLWJ5OiBMdWthcyBTY2huZWlkZXIg
PGx1a2FzLnMuc2NobmVpZGVyQGZhdS5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBKYW5uaWsgTW9yaXR6
IDxqYW5uaWsubW9yaXR6QGZhdS5kZT4KPiBDYzogPGxpbnV4LWtlcm5lbEBpNC5jcy5mYXUuZGU+
Cj4gLS0tCj4gIGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1zeXNmcy5jIHwgIDMgKystCj4g
IGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC5oICAgICAgIHwgMjYgKysrKysrKysrKysrKysr
KysrKysrKy0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtc3lz
ZnMuYyBiL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1zeXNmcy5jCj4gaW5kZXggMmE1YzYz
MGRhYjg3Li43OGQyYjgxZWEyZTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2ZidGZ0
L2ZidGZ0LXN5c2ZzLmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtc3lzZnMu
Ywo+IEBAIC02OCw3ICs2OCw4IEBAIGludCBmYnRmdF9nYW1tYV9wYXJzZV9zdHIoc3RydWN0IGZi
dGZ0X3BhciAqcGFyLCB1MzIgKmN1cnZlcywKPiAgCQkJcmV0ID0gZ2V0X25leHRfdWxvbmcoJmN1
cnZlX3AsICZ2YWwsICIgIiwgMTYpOwo+ICAJCQlpZiAocmV0KQo+ICAJCQkJZ290byBvdXQ7Cj4g
LQkJCWN1cnZlc1tjdXJ2ZV9jb3VudGVyICogcGFyLT5nYW1tYS5udW1fdmFsdWVzICsgdmFsdWVf
Y291bnRlcl0gPSB2YWw7Cj4gKwkJCWN1cnZlc1tjdXJ2ZV9jb3VudGVyICogcGFyLT5nYW1tYS5u
dW1fdmFsdWVzCj4gKwkJCQkrIHZhbHVlX2NvdW50ZXJdID0gdmFsOwoKSWNrLCB0aGF0J3MgaG9y
cmlibGUgdG8gcmVhZCBub3csIHJpZ2h0PwoKPiAgCQkJdmFsdWVfY291bnRlcisrOwo+ICAJCX0K
PiAgCQlpZiAodmFsdWVfY291bnRlciAhPSBwYXItPmdhbW1hLm51bV92YWx1ZXMpIHsKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LmggYi9kcml2ZXJzL3N0YWdpbmcv
ZmJ0ZnQvZmJ0ZnQuaAo+IGluZGV4IDliNmJkYjYyMDkzZC4uY2RkYmZkNGZmYTEwIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC5oCj4gKysrIGIvZHJpdmVycy9zdGFn
aW5nL2ZidGZ0L2ZidGZ0LmgKPiBAQCAtMzQ4LDkgKzM0OCwyNSBAQCBtb2R1bGVfZXhpdChmYnRm
dF9kcml2ZXJfbW9kdWxlX2V4aXQpOwo+ICAKPiAgLyogc2hvcnRoYW5kIGRlYnVnIGxldmVscyAq
Lwo+ICAjZGVmaW5lIERFQlVHX0xFVkVMXzEJREVCVUdfUkVRVUVTVF9HUElPUwo+IC0jZGVmaW5l
IERFQlVHX0xFVkVMXzIJKERFQlVHX0xFVkVMXzEgfCBERUJVR19EUklWRVJfSU5JVF9GVU5DVElP
TlMgfCBERUJVR19USU1FX0ZJUlNUX1VQREFURSkKPiAtI2RlZmluZSBERUJVR19MRVZFTF8zCShE
RUJVR19MRVZFTF8yIHwgREVCVUdfUkVTRVQgfCBERUJVR19JTklUX0RJU1BMQVkgfCBERUJVR19C
TEFOSyB8IERFQlVHX1JFUVVFU1RfR1BJT1MgfCBERUJVR19GUkVFX0dQSU9TIHwgREVCVUdfVkVS
SUZZX0dQSU9TIHwgREVCVUdfQkFDS0xJR0hUIHwgREVCVUdfU1lTRlMpCj4gLSNkZWZpbmUgREVC
VUdfTEVWRUxfNAkoREVCVUdfTEVWRUxfMiB8IERFQlVHX0ZCX1JFQUQgfCBERUJVR19GQl9XUklU
RSB8IERFQlVHX0ZCX0ZJTExSRUNUIHwgREVCVUdfRkJfQ09QWUFSRUEgfCBERUJVR19GQl9JTUFH
RUJMSVQgfCBERUJVR19GQl9CTEFOSykKPiArI2RlZmluZSBERUJVR19MRVZFTF8yCShERUJVR19M
RVZFTF8xIHwJCVwKPiArCQkJIERFQlVHX0RSSVZFUl9JTklUX0ZVTkNUSU9OUyB8CVwKPiArCQkJ
IERFQlVHX1RJTUVfRklSU1RfVVBEQVRFKQo+ICsjZGVmaW5lIERFQlVHX0xFVkVMXzMJKERFQlVH
X0xFVkVMXzIgfAkJXAo+ICsJCQkgREVCVUdfUkVTRVQgfAkJCVwKPiArCQkJIERFQlVHX0lOSVRf
RElTUExBWSB8CQlcCj4gKwkJCSBERUJVR19CTEFOSyB8CQkJXAo+ICsJCQkgREVCVUdfUkVRVUVT
VF9HUElPUyB8CQlcCj4gKwkJCSBERUJVR19GUkVFX0dQSU9TIHwJCVwKPiArCQkJIERFQlVHX1ZF
UklGWV9HUElPUyB8CQlcCj4gKwkJCSBERUJVR19CQUNLTElHSFQgfAkJXAo+ICsJCQkgREVCVUdf
U1lTRlMpCj4gKyNkZWZpbmUgREVCVUdfTEVWRUxfNAkoREVCVUdfTEVWRUxfMiB8CQlcCj4gKwkJ
CSBERUJVR19GQl9SRUFEIHwJCVwKPiArCQkJIERFQlVHX0ZCX1dSSVRFIHwJCVwKPiArCQkJIERF
QlVHX0ZCX0ZJTExSRUNUIHwJCVwKPiArCQkJIERFQlVHX0ZCX0NPUFlBUkVBIHwJCVwKPiArCQkJ
IERFQlVHX0ZCX0lNQUdFQkxJVCB8CQlcCj4gKwkJCSBERUJVR19GQl9CTEFOSykKPiAgI2RlZmlu
ZSBERUJVR19MRVZFTF81CShERUJVR19MRVZFTF8zIHwgREVCVUdfVVBEQVRFX0RJU1BMQVkpCj4g
ICNkZWZpbmUgREVCVUdfTEVWRUxfNgkoREVCVUdfTEVWRUxfNCB8IERFQlVHX0xFVkVMXzUpCj4g
ICNkZWZpbmUgREVCVUdfTEVWRUxfNwkweEZGRkZGRkZGCgpBbGwgb2YgdGhlc2Ugc3BlY2lhbCBk
ZWJ1ZyAibGV2ZWxzIiBuZWVkIHRvIGdvIGF3YXkgbm93IHRoYXQgdGhlIGRyaXZlcnMKYXJlIHdv
cmtpbmcsIGFuZCBqdXN0IHVzZSB0aGUgaW4ta2VybmVsIGRlYnVnZ2luZyBtYWNyb3MgaW5zdGVh
ZC4KCnRoYW5rcywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
