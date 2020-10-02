Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBC528145D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 15:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7796E9AE;
	Fri,  2 Oct 2020 13:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12086E0AF
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 13:42:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 7E7E629DCF4
Subject: Re: [PATCH v3 2/2] tty/sysrq: Add configurable handler to execute a
 compound action
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200818112825.6445-1-andrzej.p@collabora.com>
 <20200818112825.6445-3-andrzej.p@collabora.com>
 <20201002125429.GA3350322@kroah.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <db7fe4ed-19a4-3303-a544-eb789badb8a1@collabora.com>
Date: Fri, 2 Oct 2020 15:42:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002125429.GA3350322@kroah.com>
Content-Language: en-US
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
Cc: linux-input@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jiri Slaby <jslaby@suse.com>, kernel@collabora.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpXIGRuaXUgMDIuMTAuMjAyMCBvwqAxNDo1NCwgR3JlZyBLcm9haC1IYXJ0bWFuIHBpc3pl
Ogo+IE9uIFR1ZSwgQXVnIDE4LCAyMDIwIGF0IDAxOjI4OjI1UE0gKzAyMDAsIEFuZHJ6ZWogUGll
dHJhc2lld2ljeiB3cm90ZToKPj4gVXNlcmxhbmQgbWlnaHQgd2FudCB0byBleGVjdXRlIGUuZy4g
J3cnIChzaG93IGJsb2NrZWQgdGFza3MpLCBmb2xsb3dlZAo+PiBieSAncycgKHN5bmMpLCBmb2xs
b3dlZCBieSAxMDAwIG1zIGRlbGF5IGFuZCB0aGVuIGZvbGxvd2VkIGJ5ICdjJyAoY3Jhc2gpCj4+
IHVwb24gYSBzaW5nbGUgbWFnaWMgU3lzUnEuIE9yIG9uZSBtaWdodCB3YW50IHRvIGV4ZWN1dGUg
dGhlIGZhbW91cyAiUmFpc2luZwo+PiBFbGVwaGFudHMgSXMgU28gVXR0ZXJseSBCb3JpbmciIGFj
dGlvbi4gVGhpcyBwYXRjaCBhZGRzIGEgY29uZmlndXJhYmxlCj4+IGhhbmRsZXIsIHRyaWdnZXJl
ZCB3aXRoICdDJywgZm9yIHRoaXMgZXhhY3QgcHVycG9zZS4gVGhlIHVzZXIgc3BlY2lmaWVzIHRo
ZQo+PiBjb21wb3NpdGlvbiBvZiB0aGUgY29tcG91bmQgYWN0aW9uIHVzaW5nIHN5bnRheCBzaW1p
bGFyIHRvIGdldG9wdCwgd2hlcmUKPj4gZWFjaCBsZXR0ZXIgY29ycmVzcG9uZHMgdG8gYW4gaW5k
aXZpZHVhbCBhY3Rpb24gYW5kIGEgY29sb24gZm9sbG93ZWQgYnkgYQo+PiBudW1iZXIgY29ycmVz
cG9uZHMgdG8gYSBkZWxheSBvZiB0aGF0IG1hbnkgbWlsbGlzZWNvbmRzLCBlLmcuOgo+Pgo+PiB3
czoxMDAwYwo+Pgo+PiBvcgo+Pgo+PiByOjEwMGVpczoxMDAwdWIKPiAKPiBBIG1hY3JvIGxhbmd1
YWdlIGZvciBzeXNycSBjb21tYW5kcywgd2hvIHdvdWxkIGhhdmUgdGhvdWdodC4uLgo+IAo+IEFu
eXdheSwgX3doeV8gd291bGQgdXNlcmxhbmQgd2FudCB0byBkbyBzb21ldGhpbmcgc28gY3Jhenkg
YXMgdGhpcz8KPiBXaGF0IGlzIHRoZSB1c2UtY2FzZSBoZXJlPwo+IAoKQSB1c2UtY2FzZSBpcyBD
aHJvbWVib29rcyB3aGljaCBkbyB3YW50IHRvIGV4ZWN1dGUgJ3cnLCAncycsCndhaXQgMTAwMG1z
IGFuZCB0aGVuICdjJyB1bmRlciBvbmUga2V5IGNvbWJpbmF0aW9uLiBIYXZpbmcgdGhhdCBzdXBw
b3J0ZWQKdXBzdHJlYW0gYnJpbmdzIHVzIG9uZSBsaXR0bGUgc3RlcCBjbG9zZXIgdG8gdGhvc2Ug
bWFjaGluZXMgcnVubmluZwp1cHN0cmVhbSBrZXJuZWwuCgpBbm90aGVyIGFyZ3VtZW50IGZvciBz
dWNoIGEgIm1hY3JvIGxhbmd1YWdlIiBpcyB3aGVuIGEgbWFjaGluZSdzIHN5c3RlbQprZWVwcyBk
ZWdyYWRpbmcgb3ZlciB0aW1lLCBwb3NzaWJseSBkZWdyYWRpbmcgKHJlbGF0aXZlbHkpIGZhc3Qu
CiJSYWlzaW5nIEVsZXBoYW50cyBJcyBTbyBVdHRlcmx5IEJvcmluZyIgY29uc2lzdHMgb2YgNiBh
Y3Rpb25zLCBlYWNoCm9mIHdoaWNoIHJlcXVpcmVzIHByZXNzaW5nIHNldmVyYWwga2V5cy4gVGhl
IHVzZXIgbWlnaHQgYmUgdW5hYmxlCnRvIGNvbXBsZXRlIGFsbCB0aGUgNiBzdGVwcywgd2hpbGUg
YSAibWFjcm8iIHJlcXVpcmVzIHVzZXIncyBpbnZvbHZlbWVudApmb3IgY2Fycnlpbmcgb3V0IGp1
c3Qgb25lIHN0ZXAuCgpSZWdhcmRzLAoKQW5kcnplagpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
