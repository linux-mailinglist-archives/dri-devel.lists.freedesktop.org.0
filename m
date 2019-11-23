Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAF9107DD5
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2019 09:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555396E046;
	Sat, 23 Nov 2019 08:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701436E046
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2019 08:59:16 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id EC00A80563;
 Sat, 23 Nov 2019 09:59:13 +0100 (CET)
Date: Sat, 23 Nov 2019 09:59:12 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/4] Replace hibmc code with generic implmentation
Message-ID: <20191123085912.GC17899@ravnborg.org>
References: <20191122083044.6627-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122083044.6627-1-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=E2RdJlEPI_pJ0UwoBvAA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: yuehaibing@huawei.com, airlied@linux.ie, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, z.liuxinliang@hisilicon.com,
 kong.kongxinwei@hisilicon.com, hslester96@gmail.com, kraxel@redhat.com,
 zourongrong@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLgoKCj4gVGhlIHBhdGNoIHNldCByZXBsYWNlcyBjb2RlIGluIGhpYm1jIHdpdGgg
Z2VuZXJpYyBpbXBsZW1lbnRhdGlvbi4KPiAKPiBQYXRjaGVzIDEgdG8gMyByZXBsYWNlIGZiZGV2
IGVtdWF0aW9uLCBmcmFtZWJ1ZmZlciBhbmQgY3JlYXRpb24gb2YKPiBkdW1iIGJ1ZmZlcnMgd2l0
aCByZXNwZWN0aXZlIGNvZGUgZnJvbSBEUk0gaGVscGVycy4gUGF0Y2ggNCBhZGRzIGFuCj4gYWRk
aXRpb25hbCBpbnRlcmZhY2UgdG8gZGVidWdmcyB0aGF0IGRpc3BsYXlzIHRoZSBhbGxvY2F0ZWQg
YW5kIGZyZWUKPiBhcmVhcyBpbiB2aWRlbyBtZW1vcnkuCj4gCj4gVGhlIHBhdGNoZXMgaGF2ZSBv
bmx5IGJlZW4gY29tcGlsZS10ZXN0ZWQuIEZ1cnRoZXIgdGVzdGluZyBpcwo+IGFwcHJlY2lhdGVk
LgoKQ2hhbmdlcyBsb29rcyBnb29kIGFuZCBkaWZmc3RhdCBpcyB2ZXJ5IG5pY2UuCkZyb20gbXkg
cXVpY2sgYnJvd3NpbmcgZXZlcnl0aGluZyB3YXMgZmluZSwgYSBzbWFsbCBjb21tZW50IG9uCm9u
ZSBvZiB0aGUgcGF0Y2hlcy4KCllvdSBjYW4gYWRkIG15OgpBY2tlZC1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgoKdG8gdGhlIHdob2xlIHNlcmllcy4KCglTYW0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
