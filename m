Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF9B130A9
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 16:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7E26E7DA;
	Fri,  3 May 2019 14:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA996E7DA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 14:47:24 +0000 (UTC)
Received: from [IPv6:2a02:2450:102f:3e0:4816:540f:8d6f:7421] (unknown
 [IPv6:2a02:2450:102f:3e0:4816:540f:8d6f:7421])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: robertfoss)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 108AD2809B0;
 Fri,  3 May 2019 15:47:21 +0100 (BST)
Subject: Re: [PATCH] drm/virtio: allocate fences with GFP_KERNEL
To: Emil Velikov <emil.l.velikov@gmail.com>, Chia-I Wu <olvaffe@gmail.com>
References: <20190429221021.159784-1-olvaffe@gmail.com>
 <CACvgo522UzNkdv1vERKvH3O2T0JtpBejRTCdyhqPcTABdGcb4g@mail.gmail.com>
From: Robert Foss <robert.foss@collabora.com>
Message-ID: <5cd7912e-7f9c-0709-d5f1-99b78f25d0cb@collabora.com>
Date: Fri, 3 May 2019 16:47:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACvgo522UzNkdv1vERKvH3O2T0JtpBejRTCdyhqPcTABdGcb4g@mail.gmail.com>
Content-Language: en-US
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
Cc: Gustavo Padovan <gustavo.padovan@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDMuMDUuMTkgMTY6MzEsIEVtaWwgVmVsaWtvdiB3cm90ZToKPiBPbiBNb24sIDI5IEFwciAy
MDE5IGF0IDIzOjEwLCBDaGlhLUkgV3UgPG9sdmFmZmVAZ21haWwuY29tPiB3cm90ZToKPj4KPj4g
SXQgd2FzIGNoYW5nZWQgdG8gR0ZQX0FUT01JQyBpbiBjb21taXQgZWMyZjA1NzdjIChhZGQgJiB1
c2UKPj4gdmlydGlvX2dwdV9xdWV1ZV9mZW5jZWRfY3RybF9idWZmZXIpIGJlY2F1c2UgdGhlIGFs
bG9jYXRpb24gaGFwcGVuZWQKPj4gd2l0aCBhIHNwaW5sb2NrIGhlbGQuICBUaGF0IHdhcyBubyBs
b25nZXIgdHJ1ZSBhZnRlciBjb21taXQKPj4gOWZkZDkwYzBmIChhZGQgdmlydGlvX2dwdV9hbGxv
Y19mZW5jZSgpKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hpYS1JIFd1IDxvbHZhZmZlQGdtYWls
LmNvbT4KPj4gQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+PiBDYzogR3Vz
dGF2byBQYWRvdmFuIDxndXN0YXZvLnBhZG92YW5AY29sbGFib3JhLmNvbT4KPj4gQ2M6IFJvYmVy
dCBGb3NzIDxyb2JlcnQuZm9zc0Bjb2xsYWJvcmEuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBFbWls
IFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+IAo+IFNpZGU6Cj4gUm9iLCBz
aG91bGQgd2UgZm9sbG93LXVwIG9uIDlmZGQ5MGMwZiBhbmQgZHJvcCB0aGUKPiB2aXJ0aW9fZ3B1
X2ZlbmNlX2VtaXQoKSByZXR1cm4gdHlwZT8KCkdvb2QgaWRlYS4gTm9uZSBvZiB0aGUgY2FsbGVk
IGZ1bmN0aW9ucyByZXR1cm4gYW55dGhpbmcuCkknbGwgZ2V0IHJpZ2h0IG9uIGl0LgoKClJvYi4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
