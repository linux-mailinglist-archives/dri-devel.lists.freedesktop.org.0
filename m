Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AB056CF2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 16:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D59F6E450;
	Wed, 26 Jun 2019 14:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B5B6E450
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 14:56:25 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id ABF5F807C0; Wed, 26 Jun 2019 16:56:13 +0200 (CEST)
Date: Wed, 26 Jun 2019 16:56:18 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 4/4] backlight: pwm_bl: Set scale type for brightness
 curves specified in the DT
Message-ID: <20190626145617.GB22348@xo-6d-61-c0.localdomain>
References: <20190624203114.93277-1-mka@chromium.org>
 <20190624203114.93277-5-mka@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624203114.93277-5-mka@chromium.org>
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

T24gTW9uIDIwMTktMDYtMjQgMTM6MzE6MTMsIE1hdHRoaWFzIEthZWhsY2tlIHdyb3RlOgo+IENo
ZWNrIGlmIGEgYnJpZ2h0bmVzcyBjdXJ2ZSBzcGVjaWZpZWQgaW4gdGhlIGRldmljZSB0cmVlIGlz
IGxpbmVhciBvcgo+IG5vdCBhbmQgc2V0IHRoZSBjb3JyZXNwb25kaW5nIHByb3BlcnR5IGFjY29y
ZGluZ2x5LiBUaGlzIG1ha2VzIHRoZQo+IHNjYWxlIHR5cGUgYXZhaWxhYmxlIHRvIHVzZXJzcGFj
ZSB2aWEgdGhlICdzY2FsZScgc3lzZnMgYXR0cmlidXRlLgo+IAo+IFRvIGRldGVybWluZSBpZiBh
IGN1cnZlIGlzIGxpbmVhciBpdCBpcyBjb21wYXJlZCB0byBhIGludGVycG9sYXRlZCBsaW5lYXIK
PiBjdXJ2ZSBiZXR3ZWVuIG1pbiBhbmQgbWF4IGJyaWdodG5lc3MuIFRoZSBjdXJ2ZSBpcyBjb25z
aWRlcmVkIGxpbmVhciBpZgo+IG5vIHZhbHVlIGRldmlhdGVzIG1vcmUgdGhhbiArLy01JSBvZiAk
e2JyaWdodG5lc3NfcmFuZ2V9IGZyb20gdGhlaXIKPiBpbnRlcnBvbGF0ZWQgdmFsdWUuCgpJIGRv
bid0IHRoaW5rIHRoaXMgd29ya3MuIFNvbWUgaGFyZHdhcmUgZG9lcyB0YWtlcyBicmlnaHRuZXNz
IGluIHBlcmNlcHR1YWwgdW5pdHMsCmNvbnZlcnRpbmcgaXQgaW4gdGhlIExFRCBjb250cm9sbGVy
LgoKCQkJCQkJCQkJUGF2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
