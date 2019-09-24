Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF4CBC3F2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 10:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FB489F24;
	Tue, 24 Sep 2019 08:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5A589F24
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 08:14:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 55BEFABC7;
 Tue, 24 Sep 2019 08:14:19 +0000 (UTC)
Subject: Re: [PATCH v2 11/12] drm/mgag200: Reserve video memory for cursor
 plane
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190923172753.26593-1-tzimmermann@suse.de>
 <20190923172753.26593-12-tzimmermann@suse.de>
 <20190924075538.vvg7q2jrderil653@sirius.home.kraxel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <0e32b356-57c5-cd55-3423-50697bae8303@suse.de>
Date: Tue, 24 Sep 2019 10:14:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190924075538.vvg7q2jrderil653@sirius.home.kraxel.org>
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
Cc: corbet@lwn.net, airlied@linux.ie, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDI0LjA5LjE5IHVtIDA5OjU1IHNjaHJpZWIgR2VyZCBIb2ZmbWFubjoKPiAgICBIaSwK
PiAKPj4gKwkvKgo+PiArCSAqIEF0IHRoZSBoaWdoIGVuZCBvZiB2aWRlbyBtZW1vcnksIHdlIHJl
c2VydmUgc3BhY2UgZm9yCj4+ICsJICogYnVmZmVyIG9iamVjdHMuIFRoZSBjdXJzb3IgcGxhbmUg
dXNlcyB0aGlzIG1lbW9yeSB0byBzdG9yZQo+PiArCSAqIGEgZG91YmxlLWJ1ZmZlcmVkIGltYWdl
IG9mIHRoZSBjdXJyZW50IGN1cnNvci4gSGVuY2UsIGl0J3MKPj4gKwkgKiBub3QgYXZhaWxhYmxl
IGZvciBmcmFtZWJ1ZmZlcnMuCj4+ICsJICovCj4+ICsJbWRldi0+dnJhbV9mYl9hdmFpbGFibGUg
LT0gMiAqIHNpemU7Cj4gCj4gSG1tLCB0aGF0IGxvb2tzIGxpa2UgYSBsZWZ0b3ZlciBmcm9tIHRo
ZSBwcmV2aW91cyB2ZXJzaW9uIG9mIHRoZSBwYXRjaAo+IHNlcmllcyAuLi4KClRoaXMgYmVsb25n
cyBoZXJlLiBGb3Igc2V2ZXJhbCB0ZXN0cyB0aGUgc2l6ZSBvZiB0aGUgYXZhaWxhYmxlIApmcmFt
ZWJ1ZmZlciBtZW1vcnkgbmVlZHMgdG8gYmUga25vd24uIEl0J3Mgc3RvcmVkIGluIAptZGV2LT52
cmFtX2ZiX2F2YWlsYWJsZS4gbWdhZzIwMF9tbV9pbml0KCkgc2V0cyB0aGUgdmFsdWUgb2YgCm1k
ZXYtPnZyYW1fZmJfYXZhaWxhYmxlIHRvIHRoZSBmdWxsIHNpemUgb2YgdGhlIHZpZGVvIFJBTS4g
VGhlIGxpbmUgCmFib3ZlIHN1YnRyYWN0cyB0aGUgc2l6ZSBvZiAyIGN1cnNvciBidWZmZXJzLgoK
QmVzdCByZWdhcmRzClRob21hcwoKPiAKPiBjaGVlcnMsCj4gICAgR2VyZAo+IAoKLS0gClRob21h
cyBaaW1tZXJtYW5uCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKU1VTRSBMaW51eCBHbWJILCBN
YXhmZWxkc3RyYXNzZSA1LCA5MDQwOSBOdWVybmJlcmcsIEdlcm1hbnkKR0Y6IEZlbGl4IEltZW5k
w7ZyZmZlciwgTWFyeSBIaWdnaW5zLCBTcmkgUmFzaWFoCkhSQiAyMTI4NCAoQUcgTsO8cm5iZXJn
KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
