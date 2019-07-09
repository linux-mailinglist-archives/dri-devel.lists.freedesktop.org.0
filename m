Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF83E6339C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 11:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA4589F07;
	Tue,  9 Jul 2019 09:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D7889F9F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 09:43:01 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:64759
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hkmeJ-00038q-Os; Tue, 09 Jul 2019 11:42:59 +0200
Subject: Re: [PATCH] drm/client: remove the exporting of drm_client_close
To: Emil Velikov <emil.l.velikov@gmail.com>, Denis Efremov <efremov@linux.com>
References: <20190703170150.32548-1-efremov@linux.com>
 <CACvgo52N5v07qA_afJfw7vo1X6_Gt4cGqBZn3eBzQtokndjWxA@mail.gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <9590074a-dbc4-24d3-4f93-51d942981860@tronnes.org>
Date: Tue, 9 Jul 2019 11:42:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CACvgo52N5v07qA_afJfw7vo1X6_Gt4cGqBZn3eBzQtokndjWxA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=zDqbZz+4vdtztSUqfBA7a3vsGDNvhgQkVugt/N61WMU=; 
 b=nR4wmDhw2suZ++2I7+DukSELP6uxXS7S6lKw9OOwmrct0LSOUFldrHyyvOgkU097e22rPTQ9E0XzJcMv3pELcq7DUU+JYDsSfny6sLwBfJe30Y68kNLdwknz+NTpz/xEkCYWEWIjQ3c6oDBsG8aziyRYnhP4CEcelQb5nxGJl2wvhjoYU1KrHHNnCRiFHBskm1u5NGQ8pSCIM2n6/2YmDaDOGEj1Xab2/F8ea8fEyJtgMKF1xUMtmdNw6FAOrKj6ql+sFXSewLdygyaUBFgjnayHOlRS+3I6csDe3313EoV+g9jZwdkcEC86QeE4rBtuK4W2erD9EQW1ZlUQDbMUaA==;
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
Cc: "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDQuMDcuMjAxOSAxNi4wNywgc2tyZXYgRW1pbCBWZWxpa292Ogo+IE9uIFRodSwgNCBK
dWwgMjAxOSBhdCAwODoyNywgRGVuaXMgRWZyZW1vdiA8ZWZyZW1vdkBsaW51eC5jb20+IHdyb3Rl
Ogo+Pgo+PiBUaGUgZnVuY3Rpb24gZHJtX2NsaWVudF9jbG9zZSBpcyBkZWNsYXJlZCBhcyBzdGF0
aWMgYW5kIG1hcmtlZCBhcwo+PiBFWFBPUlRfU1lNQk9MLiBJdCdzIGEgYml0IGNvbmZ1c2luZyBm
b3IgYW4gaW50ZXJuYWwgZnVuY3Rpb24gdG8gYmUKPj4gZXhwb3J0ZWQuIFRoZSBhcmVhIG9mIHZp
c2liaWxpdHkgZm9yIHN1Y2ggZnVuY3Rpb24gaXMgaXRzIC5jIGZpbGUKPj4gYW5kIGFsbCBvdGhl
ciBtb2R1bGVzLiBPdGhlciAqLmMgZmlsZXMgb2YgdGhlIHNhbWUgbW9kdWxlIGNhbid0IHVzZSBp
dCwKPj4gZGVzcGl0ZSBhbGwgb3RoZXIgbW9kdWxlcyBjYW4uIFJlbHlpbmcgb24gdGhlIGZhY3Qg
dGhhdCB0aGlzIGlzIHRoZQo+PiBpbnRlcm5hbCBmdW5jdGlvbiBhbmQgaXQncyBub3QgYSBjcnVj
aWFsIHBhcnQgb2YgdGhlIEFQSSwgdGhlIHBhdGNoCj4+IHJlbW92ZXMgdGhlIEVYUE9SVF9TWU1C
T0wgbWFya2luZyBvZiBkcm1fY2xpZW50X2Nsb3NlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEZW5p
cyBFZnJlbW92IDxlZnJlbW92QGxpbnV4LmNvbT4KPiAKPiBOaWNlIG9uZToKPiBSZXZpZXdlZC1i
eTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClRoYW5rcywgYXBw
bGllZC4KCk5vcmFsZi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
