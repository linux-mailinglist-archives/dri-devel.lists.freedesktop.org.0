Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AB4CB569
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D7D6EAFE;
	Fri,  4 Oct 2019 07:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E3F6E117
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 20:27:30 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r3so4211345wrj.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 13:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cCeUwqFIszCC9NQ+XL/f8CT8wiYOe4tx7sKH/Re06VU=;
 b=txYkaTa+GMwfZW/4AFJ09OugdBrn7eKsp4IPHdzyyaYfmCpP8DrLv0Rd9tkaFe7s51
 kBebzPNy2q/M1xEseu5CwpZZ63/0XLRjxljldCihURxKHlwZpp425C2kGxZTIQ114HFf
 G3x/3zNld5MGmp8RkQQE7AroDtL5Qh5wBwaTMuZcwQ3RNBz2SOwYEyNW3g2R0fGHemGS
 6AlOLQnygXSjvoKoR4M4LH6Y3dkuW9wkORKFnf+N06Mh9KiKF0A8Kx3QkWKX/fLPmwSt
 IIG9TVHhA2kXS4EgnJFbySM2Unsy3T/J7zTzs+s79q0GrFSrhieG5pHEyy6ewYIamul0
 Oscg==
X-Gm-Message-State: APjAAAWC1IXAd4Q16yic/NcgDIiSygI93DI1adiaftQH1XuXXz8qIxHc
 zGiIfRSJ8YsR/9KTejN315I=
X-Google-Smtp-Source: APXvYqzDXXwvF3fjTVzYOL+mjaBfVdx+OphI3QnMeHFFgSVXWCrYPt1ORJ9wofAwCHJUUjRoW3JSBw==
X-Received: by 2002:a5d:4f8e:: with SMTP id d14mr8547099wru.384.1570134449314; 
 Thu, 03 Oct 2019 13:27:29 -0700 (PDT)
Received: from [192.168.1.19] (civ244.neoplus.adsl.tpnet.pl. [83.31.45.244])
 by smtp.gmail.com with ESMTPSA id b22sm3547460wmj.36.2019.10.03.13.27.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Oct 2019 13:27:28 -0700 (PDT)
Subject: Should regulator core support parsing OF based fwnode? (was: Re:
 [PATCH v8 2/5] leds: Add of_led_get() and led_put())
To: Mark Brown <broonie@kernel.org>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-3-jjhiblot@ti.com>
 <20191003104228.c5nho6eimwzqwxpt@earth.universe>
 <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
 <62591735-9082-1fd7-d791-07929ddaa223@gmail.com>
 <20191003183554.GA37096@sirena.co.uk>
 <25b9614f-d6be-9da5-0fe5-eb58c8c93850@gmail.com>
 <20191003194140.GE6090@sirena.co.uk>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <a9f668f9-ad26-4e18-178a-8403b8b3b1db@gmail.com>
Date: Thu, 3 Oct 2019 22:27:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191003194140.GE6090@sirena.co.uk>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cCeUwqFIszCC9NQ+XL/f8CT8wiYOe4tx7sKH/Re06VU=;
 b=qlA4lt7dq03I6pY3MVAZGNqRyK39pGu+0xDPkQjQZsBUp5vY1C+5Wn7/1up38CPOSN
 LgKZBXPZ3Ptr31MATGZeIyZHpuxpe8BXyZR7QdT+tFwa+rDWJFn/MhCr9LXWLjaE7/ki
 rP4rjPMEL+FTTFkFBwBwI5bhWaklEJwpvH/OAAUhNpKYpTpbY0IbTrFcCsYHW0W3gAg1
 4pg9j9676sUIIQFNcW5sy74ZsUCp45cSqwXbKM2u3oiqx0Xfd4szvPKDZc15srtKY6x3
 pEkgvtQ2j3v2dEIJqYioEZtK/lYJrwwbQyF45UYeXR/9c6lJ/7JlCgdLfyF2iDYTBXNl
 L3KQ==
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org,
 Liam Girdwood <lgirdwood@gmail.com>, tomi.valkeinen@ti.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, dmurphy@ti.com, pavel@ucw.cz,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMy8xOSA5OjQxIFBNLCBNYXJrIEJyb3duIHdyb3RlOgo+IE9uIFRodSwgT2N0IDAzLCAy
MDE5IGF0IDA5OjIxOjA2UE0gKzAyMDAsIEphY2VrIEFuYXN6ZXdza2kgd3JvdGU6Cj4+IE9uIDEw
LzMvMTkgODozNSBQTSwgTWFyayBCcm93biB3cm90ZToKPj4+IE9uIFRodSwgT2N0IDAzLCAyMDE5
IGF0IDA3OjQzOjE3UE0gKzAyMDAsIEphY2VrIEFuYXN6ZXdza2kgd3JvdGU6Cj4+Pj4gT24gMTAv
My8xOSAyOjQ3IFBNLCBKZWFuLUphY3F1ZXMgSGlibG90IHdyb3RlOgo+Pj4+PiBPbiAwMy8xMC8y
MDE5IDEyOjQyLCBTZWJhc3RpYW4gUmVpY2hlbCB3cm90ZToKPj4+Pj4+IE9uIFRodSwgT2N0IDAz
LCAyMDE5IGF0IDEwOjI4OjA5QU0gKzAyMDAsIEplYW4tSmFjcXVlcyBIaWJsb3Qgd3JvdGU6Cj4g
Cj4+PiBUaGlzIG1haWwgaGFzIG5vdGhpbmcgcmVsZXZhbnQgaW4gdGhlIHN1YmplY3QgbGluZSBh
bmQgcGFnZXMgb2YgcXVvdGVzCj4+PiBiZWZvcmUgdGhlIHF1ZXN0aW9uIGZvciBtZSwgaXQncyBr
aW5kIG9mIGx1Y2t5IEkgbm90aWNlZCBpdC4uLi4KPiAKPj4gSXNuJ3QgaXQgYWxsIGFib3V0IGNy
ZWF0aW5nIHByb3BlciBmaWx0ZXJzPwo+IAo+IE15IHBvaW50IHRoZXJlIGlzIHRoYXQgdGhlcmUn
cyBub3RoaW5nIG9idmlvdXMgaW4gdGhlIG1haWwgdGhhdCBzdWdnZXN0cwo+IGl0IHNob3VsZCBn
ZXQgcGFzdCBmaWx0ZXJzIC0ganVzdCBiZWluZyBDQ2VkIG9uIGEgbWFpbCBpc24ndCBzdXBlcgo+
IHJlbGlhYmxlLCBwZW9wbGUgb2Z0ZW4gZ2V0IHB1bGxlZCBpbiBkdWUgdG8gdGhpbmdzIGxpa2Ug
Y2hlY2twYXRjaCBvcgo+IHNvbWVvbmUgY29weWluZyBhIENDIGxpc3QgZnJvbSBhbiBlYXJsaWVy
IHBhdGNoIHNlcmllcyB3aGVyZSB0aGVyZSB3ZXJlCj4gdGhpbmdzIHdlcmUgcmVsZXZhbnQuCgpP
SywgdXBkYXRlZCB0aGUgc3ViamVjdC4KCj4+Pj4gSSB3b25kZXIgaWYgaXQgd291bGRuJ3QgbWFr
ZSBzZW5zZSB0byBhZGQgc3VwcG9ydCBmb3IgZndub2RlCj4+Pj4gcGFyc2luZyB0byByZWd1bGF0
b3IgY29yZS4gT3IgbWF5YmUgaXQgaXMgZWl0aGVyIHNvbWVob3cgc3VwcG9ydGVkCj4+Pj4gb3Ig
bm90IHN1cHBvcnRlZCBvbiBwdXJwb3NlPwo+IAo+Pj4gQW55dGhpbmcgYXR0ZW1wdGluZyB0byB1
c2UgdGhlIHJlZ3VsYXRvciBEVCBiaW5kaW5ncyBpbiBBQ1BJIGhhcyB2ZXJ5Cj4+PiBzZXJpb3Vz
IHByb2JsZW1zLCBBQ1BJIGhhcyBpdHMgb3duIHBvd2VyIG1vZGVsIHdoaWNoIGlzbid0IGNvbXBh
dGlibGUKPj4+IHdpdGggdGhhdCB1c2VkIGluIERULgo+IAo+PiBXZSBoYXZlIGEgbWVhbnMgZm9y
IGNoZWNraW5nIGlmIGZ3bm9kZSByZWZlcnMgdG8gb2Zfbm9kZToKPiAKPj4gaXNfb2Zfbm9kZShj
b25zdCBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlKQo+IAo+PiBDb3VsZG4ndCBpdCBiZSBl
bXBsb3llZCBmb3IgT0YgY2FzZT8KPiAKPiBXaHkgd291bGQgd2Ugd2FudCB0byBkbyB0aGF0PyAg
V2UnZCBjb250aW51ZSB0byBzdXBwb3J0IG9ubHkgRFQgc3lzdGVtcywKPiBqdXN0IHdpdGggY29k
ZSB0aGF0J3MgbGVzcyBvYnZpb3VzbHkgRFQgb25seSBhbmQgd291bGQgbmVlZCB0byBwdXQKPiBj
aGVja3MgaW4uICBJJ20gbm90IHNlZWluZyBhbiB1cHNpZGUgaGVyZS4KCkZvciBpbnN0YW5jZSBm
ZXcgd2Vla3MgYWdvIHdlIGhhZCBhIHBhdGNoIFswXSBpbiB0aGUgTEVEIGNvcmUgc3dpdGNoaW5n
CmZyb20gdXNpbmcgc3RydWN0IGRldmljZSdzIG9mX25vZGUgcHJvcGVydHkgdG8gZndub2RlIGZv
ciBjb252ZXlpbmcKZGV2aWNlIHByb3BlcnR5IGRhdGEuIEFuZCB0aGlzIHRyYW5zaXRpb24gdG8g
Zndub2RlIHByb3BlcnR5IEFQSSBjYW4gYmUKb2JzZXJ2ZWQgYXMgYSBmcmVxdWVudCBwYXR0ZXJu
IGFjcm9zcyBzdWJzeXN0ZW1zLgoKUmVjZW50bHkgdGhlcmUgaXMgYW4gb25nb2luZyBlZmZvcnQg
YWltaW5nIHRvIGFkZCBnZW5lcmljIHN1cHBvcnQgZm9yCmhhbmRsaW5nIHJlZ3VsYXRvcnMgaW4g
dGhlIExFRCBjb3JlIFsxXSwgYnV0IGl0IHR1cm5zIG91dCB0byByZXF1aXJlCmJyaW5naW5nIGJh
Y2sgaW5pdGlhbGl6YXRpb24gb2Ygb2Zfbm9kZSBwcm9wZXJ0eSBmb3IKZGV2bV9yZWd1bGF0b3Jf
Z2V0X29wdGlvbmFsKCkgdG8gd29yayBwcm9wZXJseS4KClN1cHBvcnQgZm9yIE9GIHJlbGF0ZWQg
Zndub2RlcyBpbiByZWd1bGF0b3IgY29yZSBjb3VsZCBoZWxwIHJlZHVjaW5nCnRoaXMgbm9pc2Uu
CgpbMF0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L2NvbW1pdC9kcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmM/aWQ9ZmQ4MWQ3
ZTk0NmM2YmRiODZkYmYwYmQ4OGZlZTNlMWE1NDVlNzk3OQpbMV0KaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtbGVkcy8yMDE5MDkyMzEwMjA1OS4xNzgxOC00LWpqaGlibG90QHRpLmNvbS8K
Ci0tIApCZXN0IHJlZ2FyZHMsCkphY2VrIEFuYXN6ZXdza2kKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
