Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 741FD36C7A2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 16:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F3D6E212;
	Tue, 27 Apr 2021 14:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58646E212
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 14:18:31 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 i21-20020a05600c3555b029012eae2af5d4so7217863wmq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 07:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=165yj5PkdwmVik5VeyWeaT6sFuK6E9xbEbgXNsgUc+4=;
 b=MpGLSY3sBoEXBf9vni3QXebi/HlCEjyvl/3T1NAr9wrrEtnqp2eLbVuAtT7TPb/l6+
 SvIuSVer3YMVAtobnyfM1cPYRbuVxh6GQ3UOQ7KiIWuWTOA0MCOs0yM9Gbzjtg85hqHY
 loL6/qzCn7aKddRcCJ4b3iauO2QyeJgFeU41jpH3r6KgNGRXCVxBq4QOpC+5ILc8tdw+
 V+sLgidc3dBUrBQ9RkegXbJ5tvT37jqsnhQ2ek1pJ/KAAfDy/v2z4KIYtynUxJhYCbng
 N/Yd1sJUMSzfNLVyU52qCWQJFx1XB6jwEWUyElDG9lZxWmr4FBj1FvF1vZPK4GKhQdvO
 KMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=165yj5PkdwmVik5VeyWeaT6sFuK6E9xbEbgXNsgUc+4=;
 b=NgGlxqQRr9D77GVYrdDmm71wW6RMvl98fv3NThO8DMFZ/7Noz38Aw0Ib1XNqPBBfIW
 ah9d7YSOMZ/w8bkYQJm01+dBp0YZxe70iolBKFGGoQ95K+5YN678rQe0wZ1Ap1MxfM1e
 rZigLVI/rIN4kTkw+Q++QU9hqEqxPZgSiwDpQWOQB7btj3uDgZ/QEoArwdSrT+Gm9pX/
 oUhKXsQfULm0ELXkgRXnJ9zWpsQjkmePRsNoQEz6F4GjSyXhl1giNaMXM4EDX4k2SSIY
 /lRurLSZK60MprYBsxNedGgtlJ2EQUb982N255JYEOxl6Qewg73UXYcqJ6ucM2NJ9hOV
 1J2w==
X-Gm-Message-State: AOAM532yuYXK20hnnJcMuGftGTl+ycnWVu1vpZk6zfIGftiEHVtARPwO
 aGme5GCKIaZwmMIrhZECtULt/A==
X-Google-Smtp-Source: ABdhPJw2Eu9SuVUUFa4vKzSfI0cO927HfuqA0NePw24pctc6Whx6Wu2Bgryqm1sUeD2Ua3ObsQVy9Q==
X-Received: by 2002:a1c:254:: with SMTP id 81mr4552291wmc.125.1619533110304;
 Tue, 27 Apr 2021 07:18:30 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:2338:91ec:bf8:872b?
 ([2a01:e0a:90c:e290:2338:91ec:bf8:872b])
 by smtp.gmail.com with ESMTPSA id o82sm15350wmo.36.2021.04.27.07.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 07:18:29 -0700 (PDT)
Subject: Re: [PATCH] drm: bridge: add missing word in Analogix help text
From: Neil Armstrong <narmstrong@baylibre.com>
To: Robert Foss <robert.foss@linaro.org>
References: <20210424061817.7339-1-rdunlap@infradead.org>
 <ecbe576f-1a96-a873-3716-6fa478a8269e@baylibre.com>
 <CAG3jFyv1kc3+B6SkVwdV7gNV+HUEWMAjmH8GSXaw8rDcHLadeQ@mail.gmail.com>
 <481c3f44-1686-2c58-29fa-c71fec520ba7@baylibre.com>
Organization: Baylibre
Message-ID: <ee194435-3e17-f5c4-d300-a74cc0f8988c@baylibre.com>
Date: Tue, 27 Apr 2021 16:18:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <481c3f44-1686-2c58-29fa-c71fec520ba7@baylibre.com>
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
Cc: David Airlie <airlied@linux.ie>, Torsten Duwe <duwe@suse.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Maxime Ripard <maxime@cerno.tech>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYvMDQvMjAyMSAxMDo1OSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gT24gMjYvMDQvMjAy
MSAwOTo0MiwgUm9iZXJ0IEZvc3Mgd3JvdGU6Cj4+Cj4+Cj4+IE9uIE1vbiwgQXByIDI2LCAyMDIx
LCAwOToxNSBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20gPG1haWx0bzpu
YXJtc3Ryb25nQGJheWxpYnJlLmNvbT4+IHdyb3RlOgo+Pgo+Pgo+Pgo+PiAgICAgTGUgMjQvMDQv
MjAyMSDDoCAwODoxOCwgUmFuZHkgRHVubGFwIGEgw6ljcml0wqA6Cj4+ICAgICA+IEluc2VydCBh
IG1pc3Npbmcgd29yZCAicG93ZXIiIGluIEtjb25maWcgaGVscCB0ZXh0Lgo+PiAgICAgPgo+PiAg
ICAgPiBGaXhlczogNmFhMTkyNjk4MDg5ICgiZHJtL2JyaWRnZTogQWRkIEFuYWxvZ2l4IGFueDYz
NDUgc3VwcG9ydCIpCj4+ICAgICA+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxh
cEBpbmZyYWRlYWQub3JnIDxtYWlsdG86cmR1bmxhcEBpbmZyYWRlYWQub3JnPj4KPj4gICAgID4g
Q2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20gPG1haWx0bzphLmhhamRhQHNh
bXN1bmcuY29tPj4KPj4gICAgID4gQ2M6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxp
YnJlLmNvbSA8bWFpbHRvOm5hcm1zdHJvbmdAYmF5bGlicmUuY29tPj4KPj4gICAgID4gQ2M6IFJv
YmVydCBGb3NzIDxyb2JlcnQuZm9zc0BsaW5hcm8ub3JnIDxtYWlsdG86cm9iZXJ0LmZvc3NAbGlu
YXJvLm9yZz4+Cj4+ICAgICA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWUgPG1h
aWx0bzphaXJsaWVkQGxpbnV4LmllPj4KPj4gICAgID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaCA8bWFpbHRvOmRhbmllbEBmZndsbC5jaD4+Cj4+ICAgICA+IENjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxtYWlsdG86ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz4KPj4gICAgID4gQ2M6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbyA8bWFp
bHRvOmljZW5vd3lAYW9zYy5pbz4+Cj4+ICAgICA+IENjOiBWYXNpbHkgS2hvcnV6aGljayA8YW5h
cnNvdWxAZ21haWwuY29tIDxtYWlsdG86YW5hcnNvdWxAZ21haWwuY29tPj4KPj4gICAgID4gQ2M6
IFRvcnN0ZW4gRHV3ZSA8ZHV3ZUBzdXNlLmRlIDxtYWlsdG86ZHV3ZUBzdXNlLmRlPj4KPj4gICAg
ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPgo+PiAgICAgPiAtLS0KPj4g
ICAgID7CoCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L0tjb25maWcgfMKgIMKgIDIg
Ky0KPj4gICAgID7CoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPj4gICAgID4KPj4gICAgID4gLS0tIGxpbnV4LW5leHQtMjAyMTA0MjMub3JpZy9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L0tjb25maWcKPj4gICAgID4gKysrIGxpbnV4LW5leHQt
MjAyMTA0MjMvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9LY29uZmlnCj4+ICAgICA+
IEBAIC02LDcgKzYsNyBAQCBjb25maWcgRFJNX0FOQUxPR0lYX0FOWDYzNDUKPj4gICAgID7CoCDC
oCDCoCDCoHNlbGVjdCBEUk1fS01TX0hFTFBFUgo+PiAgICAgPsKgIMKgIMKgIMKgc2VsZWN0IFJF
R01BUF9JMkMKPj4gICAgID7CoCDCoCDCoCDCoGhlbHAKPj4gICAgID4gLcKgIMKgIMKgIMKgQU5Y
NjM0NSBpcyBhbiB1bHRyYS1sb3cgRnVsbC1IRCBEaXNwbGF5UG9ydC9lRFAKPj4gICAgID4gK8Kg
IMKgIMKgIMKgQU5YNjM0NSBpcyBhbiB1bHRyYS1sb3cgcG93ZXIgRnVsbC1IRCBEaXNwbGF5UG9y
dC9lRFAKPj4gICAgID7CoCDCoCDCoCDCoCDCoHRyYW5zbWl0dGVyIGRlc2lnbmVkIGZvciBwb3J0
YWJsZSBkZXZpY2VzLiBUaGUKPj4gICAgID7CoCDCoCDCoCDCoCDCoEFOWDYzNDUgdHJhbnNmb3Jt
cyB0aGUgTFZUVEwgUkdCIG91dHB1dCBvZiBhbgo+PiAgICAgPsKgIMKgIMKgIMKgIMKgYXBwbGlj
YXRpb24gcHJvY2Vzc29yIHRvIGVEUCBvciBEaXNwbGF5UG9ydC4KPj4gICAgID4KPj4KPj4gICAg
IFJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ3RAYmF5bGlicmUuY29tIDxt
YWlsdG86bmFybXN0cm9uZ3RAYmF5bGlicmUuY29tPj4KPj4KPj4KPj4gSSB0aGluayBhIHR5cG8g
aW4gdGhlIGVtYWlsIHNudWNrIGluIDspCj4+Cj4gCj4gQWggYWggaW5kZWVkICEKPiAKPiBSZXZp
ZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmd0QGJheWxpYnJlLmNvbT4KPiAKV293
LCB0d2ljZSB0aGUgc2FtZSBlcnJvci4uLiBNb25kYXkgd2FzIGEgYmVhZCBkYXkgZm9yIG1lCgpS
ZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
