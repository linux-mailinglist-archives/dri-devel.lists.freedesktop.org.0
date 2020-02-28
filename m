Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8B7173732
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 13:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F766E172;
	Fri, 28 Feb 2020 12:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A7C6E172
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 12:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PqSQKcoq859PmNsBN7wYEqganIU4/zW+nvRfanijCh8=; b=lhePlhD+NMzVw6YHN9VFoz7n6h
 p+YBCd1EqoTyB43T+hFRiT0Qo9TmsmkACFxUfzQqNjaM6S/aKKH9q2HQSzuej7YoVYyfErmHwFlwm
 7i5fCuasfOxwO4FA0Svdn5dRTcBOO8eiY5bb1puuxnFbuydwaWT/zG0U2VbObuu3rkIjg227gOV80
 BR4zMFta5FsVjviNJO/iZsUEYQzu2g/6W6hnYkgnwlx2DrtqYdhgrqP//v3qC3Gxbj0dFwwr0l1v4
 ERpWIAJJUBc0a82Db7ek/LsKu2oBFn6Z55dKOnvyV1AjFbAmZHxKWFNRtmCTsMUdmoyziCsRgdh05
 /b4xXFdA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:49401
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1j7elM-0005it-7Q; Fri, 28 Feb 2020 13:29:04 +0100
Subject: Re: [PATCH v2 1/2] drm/client: Dual licence the file in GPL-2 and MIT
To: Emmanuel Vadot <manu@bidouilliste.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Emmanuel Vadot <manu@FreeBSD.org>,
 Jani Nikula <jani.nikula@intel.com>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, efremov@linux.com, kraxel@redhat.com,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sam@ravnborg.org, tzimmermann@suse.de
References: <20200215180911.18299-1-manu@FreeBSD.org>
 <20200215180911.18299-2-manu@FreeBSD.org> <877e0n66qi.fsf@intel.com>
 <158254443806.15220.5582277260130009235@skylake-alporthouse-com>
 <20200225091810.1de39ea4e0d578d363420412@bidouilliste.com>
 <20200225170313.GM2363188@phenom.ffwll.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <2a735cb0-5a78-8dcf-dcaa-30f5a5f77e2d@tronnes.org>
Date: Fri, 28 Feb 2020 13:28:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225170313.GM2363188@phenom.ffwll.local>
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

CgpEZW4gMjUuMDIuMjAyMCAxOC4wMywgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBPbiBUdWUsIEZl
YiAyNSwgMjAyMCBhdCAwOToxODoxMEFNICswMTAwLCBFbW1hbnVlbCBWYWRvdCB3cm90ZToKPj4g
T24gTW9uLCAyNCBGZWIgMjAyMCAxMTo0MDozOCArMDAwMAo+PiBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4gd3JvdGU6Cj4+Cj4+PiBRdW90aW5nIEphbmkgTmlrdWxhICgy
MDIwLTAyLTE1IDE4OjMzOjA5KQo+Pj4+IE9uIFNhdCwgMTUgRmViIDIwMjAsIEVtbWFudWVsIFZh
ZG90IDxtYW51QEZyZWVCU0Qub3JnPiB3cm90ZToKPj4+Pj4gRnJvbTogRW1tYW51ZWwgVmFkb3Qg
PG1hbnVARnJlZUJTRC5Pcmc+Cj4+Pj4+Cj4+Pj4+IENvbnRyaWJ1dG9ycyBmb3IgdGhpcyBmaWxl
IGFyZSA6Cj4+Pj4+IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+Pj4+
PiBEZW5pcyBFZnJlbW92IDxlZnJlbW92QGxpbnV4LmNvbT4KPj4+Pj4gSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGludGVsLmNvbT4KPj4+Pj4gTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwu
b3JnPgo+Pj4+PiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPj4+Pj4gU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+Pj4+PiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogRW1tYW51ZWwgVmFk
b3QgPG1hbnVARnJlZUJTRC5vcmc+Cj4+Pj4KPj4+PiBJJ3ZlIG9ubHkgY29udmVydGVkIHNvbWUg
bG9nZ2luZy4KPj4+Pgo+Pj4+IEFja2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50
ZWwuY29tPgo+Pj4KPj4+IEJvbnVzIGFjayBmcm9tIGFub3RoZXIgSW50ZWwgZW1wbG95ZWUgdG8g
Y292ZXIgYWxsIEludGVsIGNvcHlyaWdodCBpbgo+Pj4gdGhpcyBmaWxlLAo+Pj4gQWNrZWQtYnk6
IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+Pj4gLUNocmlzCj4+Cj4+
ICBUaGFua3MgQ2hyaXMsCj4+Cj4+ICBEYW5pZWwsIGlmIEknbSBjb3VudGluZyByaWdodCB0aGlz
IHdhcyB0aGUgbGFzdCBhY2sgbmVlZGVkLgo+IAo+IEknbSBjb3VudGluZyB0aGUgc2FtZSwgcGF0
Y2ggYXBwbGllZCBhbmQgdGhhbmtzIGZvciB0YWtpbmcgY2FyZSBvZiB0aGUKPiBwYXBlcndvcmsg
cHVzaGluZyBoZXJlLgo+IAoKTG9va3MgbGlrZSBpdCBnb3QgbG9zdCBzb21laG93LCBJIGNhbid0
IGZpbmQgaXQgaW4gZHJtLXRpcCBhdCBsZWFzdC4KCk5vcmFsZi4KCj4gVGhhbmtzLCBEYW5pZWwK
PiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
