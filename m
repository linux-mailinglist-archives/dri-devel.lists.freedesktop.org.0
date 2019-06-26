Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4C256CEE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 16:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A415E6E41A;
	Wed, 26 Jun 2019 14:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D60F6E41A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 14:56:24 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 5369E807BA; Wed, 26 Jun 2019 16:56:07 +0200 (CEST)
Date: Wed, 26 Jun 2019 16:56:11 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 2/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190626145611.GA22348@xo-6d-61-c0.localdomain>
References: <20190624203114.93277-1-mka@chromium.org>
 <20190624203114.93277-3-mka@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624203114.93277-3-mka@chromium.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgo+IEV4cG9ydCB0aGUgdHlwZSBvZiB0aGUgYnJpZ2h0bmVzcyBjdXJ2ZSB2aWEgdGhlIG5l
dyBzeXNmcyBhdHRyaWJ1dGUKPiAnc2NhbGUnLiBUaGUgdmFsdWUgb2YgdGhlIGF0dHJpYnV0ZSBt
YXkgYmUgYSBzaW1wbGUgc3RyaW5nIGxpa2UKPiAnbGluZWFyJyBvciAnbm9uLWxpbmVhcicsIG9y
IGEgY29tcG9zaXRlIHN0cmluZyBzaW1pbGFyIHRvCj4gJ2NvbXBhdGlibGUnIHN0cmluZ3Mgb2Yg
dGhlIGRldmljZSB0cmVlLiBBIGNvbXBvc2l0ZSBzdHJpbmcgY29uc2lzdHMKPiBvZiBkaWZmZXJl
bnQgZWxlbWVudHMgc2VwYXJhdGVkIGJ5IGNvbW1hcywgc3RhcnRpbmcgd2l0aCB0aGUKPiBtb3N0
LWRldGFpbGVkIGRlc2NyaXB0aW9uIGFuZCBlbmRpbmcgd2l0aCB0aGUgbGVhc3QtZGV0YWlsZWQg
b25lLiBBbgo+IGV4YW1wbGUgZm9yIGEgY29tcG9zaXRlIHN0cmluZyBpcyAiY2llLTE5MzEscGVy
Y2VwdHVhbCxub24tbGluZWFyIgo+IFRoaXMgYnJpZ2h0bmVzcyBjdXJ2ZSB3YXMgZ2VuZXJhdGVk
IHdpdGggdGhlIENJRSAxOTMxIGFsZ29yaXRobSwgaXQKPiBpcyBwZXJjZXB0dWFsbHkgbGluZWFy
LCBidXQgbm90IGFjdHVhbGx5IGxpbmVhciBpbiB0ZXJtcyBvZiB0aGUKPiBlbWl0dGVkIGxpZ2h0
LiBJZiB1c2Vyc3BhY2UgZG9lc24ndCBrbm93IGFib3V0ICdjaWUtMTkzMScgb3IKPiAncGVyY2Vw
dHVhbCcgaXQgc2hvdWxkIGF0IGxlYXN0IGJlIGFibGUgdG8gaW50ZXJwcmV0IHRoZSAnbm9uLWxp
bmVhcicKPiBwYXJ0LgoKSSdtIG5vdCBzdXJlIHRoZSBjb21tYS1zZXBhcmF0ZWQgdGhpbmcgaXMg
YSBnb29kIGlkZWEuIElmIGl0IGlzLCBpdCBzaG91bGQgCmdvIHRvIHRoZSBEb2N1bWVudGF0aW9u
LCBub3QgdG8gY2hhbmdlbG9nLgoKPiArV2hhdDoJCS9zeXMvY2xhc3MvYmFja2xpZ2h0LzxiYWNr
bGlnaHQ+L3NjYWxlCj4gK0RhdGU6CQlKdW5lIDIwMTkKPiArS2VybmVsVmVyc2lvbjoJNS40Cj4g
K0NvbnRhY3Q6CURhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4g
K0Rlc2NyaXB0aW9uOgo+ICsJCURlc2NyaXB0aW9uIG9mIHRoZSBzY2FsZSBvZiB0aGUgYnJpZ2h0
bmVzcyBjdXJ2ZS4gVGhlCj4gKwkJZGVzY3JpcHRpb24gY29uc2lzdHMgb2Ygb25lIG9yIG1vcmUg
ZWxlbWVudHMgc2VwYXJhdGVkIGJ5Cj4gKwkJY29tbWFzLCBmcm9tIHRoZSBtb3N0IGRldGFpbGVk
IHRvIHRoZSBsZWFzdCBkZXRhaWxlZAo+ICsJCWRlc2NyaXB0aW9uLgo+ICsKPiArCQlQb3NzaWJs
ZSB2YWx1ZXMgYXJlOgo+ICsKPiArCQl1bmtub3duCj4gKwkJICBUaGUgc2NhbGUgb2YgdGhlIGJy
aWdodG5lc3MgY3VydmUgaXMgdW5rbm93bi4KPiArCj4gKwkJbGluZWFyCj4gKwkJICBUaGUgYnJp
Z2h0bmVzcyBjaGFuZ2VzIGxpbmVhcmx5IGluIHRlcm1zIG9mIHRoZSBlbWl0dGVkCj4gKwkJICBs
aWdodCwgY2hhbmdlcyBhcmUgcGVyY2VpdmVkIGFzIG5vbi1saW5lYXIgYnkgdGhlIGh1bWFuIGV5
ZS4KPiArCj4gKwkJbm9uLWxpbmVhcgo+ICsJCSAgVGhlIGJyaWdodG5lc3MgY2hhbmdlcyBub24t
bGluZWFybHkgaW4gdGVybXMgb2YgdGhlIGVtaXR0ZWQKPiArCQkgIGxpZ2h0LCBjaGFuZ2VzIG1p
Z2h0IGJlIHBlcmNlaXZlZCBhcyBsaW5lYXIgYnkgdGhlIGh1bWFuIGV5ZS4KCm5vbi1saW5lYXIg
aXMgbm90IHRvbyB1c2VmdWwgYXMgZGVzY3JpYmVkLgoKPiArCQlwZXJjZXB0dWFsLG5vbi1saW5l
YXIKPiArCQkgIFRoZSBicmlnaHRuZXNzIGNoYW5nZXMgbm9uLWxpbmVhcmx5IGluIHRlcm1zIG9m
IHRoZSBlbWl0dGVkCj4gKwkJICBsaWdodCwgY2hhbmdlcyBzaG91bGQgYmUgcGVyY2VpdmVkIGFz
IGxpbmVhciBieSB0aGUgaHVtYW4gZXllLgo+ICsKPiArCQljaWUtMTkzMSxwZXJjZXB0dWFsLG5v
bi1saW5lYXIKPiArCQkgIFRoZSBicmlnaHRuZXNzIGN1cnZlIHdhcyBjYWxjdWxhdGVkIHdpdGgg
dGhlIENJRSAxOTMxCj4gKwkJICBhbGdvcml0aG0uIEJyaWdodG5lc3MgY2hhbmdlcyBub24tbGlu
ZWFybHkgaW4gdGVybXMgb2YgdGhlCj4gKwkJICBlbWl0dGVkIGxpZ2h0LCBjaGFuZ2VzIHNob3Vs
ZCBiZSBwZXJjZWl2ZWQgYXMgbGluZWFyIGJ5IHRoZQo+ICsJCSAgaHVtYW4gZXllLgoKSXMgaXQg
dXNlZnVsIHRvIGtub3cgZGlmZmVyZW5jZSBiZXR3ZWVuIHBlcmNlcHR1YWwsIGFuZCBjaWUtMTkz
MT8KCldvdWxkIGl0IGJlIHVzZWZ1bCB0byBleHBvcnQgYWJzb2x1dGUgdmFsdWVzIGluIHNvbWUg
d2VsbC1rbm93biB1bml0cz8KCklmIEknbSBpbiBkYXJrIHJvb20sIEkgbWF5IHdhbnQgMTAwbVcv
bV4yIG9mIGJhY2tsaWdodC4uLiBBbmQgaXQgd291bGQKYmUgbmljZSBpZiBJIGNvdWxkIHNldCBz
YW1lIGJhY2tsaWdodCBpbnRlbnNpdHkgb24gYWxsIG15IGRldmljZXMgZWFzaWx5LgoKCQkJCQkJ
CQlQYXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
