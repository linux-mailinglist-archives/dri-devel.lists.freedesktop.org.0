Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80706245D5B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6E96E575;
	Mon, 17 Aug 2020 07:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521F36E2ED
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 16:17:25 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 140so7150855lfi.5
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 09:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L2Tn5wRvOs/DSBbKAD6j6c1/papflA9Lc8de+NweZX8=;
 b=VoumfpBG/21qxzj+0ZlSLzuG3wfSOi7D+wRpUUt3o6jD76eRHBO+19V9K6IxIM2qMp
 o0TWgcZzmIYr/XZhx+1PQWDTVOaI2B/Fqpq838Y6A8wannrIKgg1HDyN0egE9+mQB1CD
 DVPzg08Fn8T5enmTf5HSuYykt/Sr4EV+J0+LfF9rygx2jhC1315JwA/RFJMRSqEpX1A7
 YMj5/sbhFp6JYWpu5tOvBXJM/D4dAiI6ylke95d5ipgUt7Nw0iAwXsO3WvNzB3oouDtN
 wmGLf2M5XoKV+IdWyblItCWEh8FinO/bkRxe07Gxzba6BhosidjtYSAtnoYD7zZaHRJ6
 rKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L2Tn5wRvOs/DSBbKAD6j6c1/papflA9Lc8de+NweZX8=;
 b=COWVQT1jewFzWjeyLWvBZFYADx6/ylq9OyHmN6o0OTGwfJjHg/OFTgffMInIfgzO5m
 +z18IdQ8O1ZE9ew4bQwrR3JDauQ9h2rxWGGSs7KzSkpw6G892LkiVWy3LsD6fLpzLrq+
 vxJsChif5IDArDuvpJS1kVwQ/CRavodc+gH/eSlSZBbqXp0PbzS4wk4RQFQmRhxfassS
 OUaS1Pd1WzQyYyPFacWV9nVpRf3xfHfIJiZh41X4n1JbmPEFeo1MVrg3TtU6DLmFsq1K
 7ly4XZblTfZ2ALqiUbi+srHfYEi40OBmON8Temy2v2aX7f4IiSfagXgu/OUvfnnHmm/E
 FmAA==
X-Gm-Message-State: AOAM5331iEq/k6wkBnSvMyHcUrUNN4kRow3zxjn/dPuONVTNll98LWjU
 WBN7FzQAeGnCcrGcj0Ctstc=
X-Google-Smtp-Source: ABdhPJziCVK3idhEDoxtMrVVaiDN9SWIPK00GHPbNv1yI21z8kcSHD6CbPuaCcaDnDEPAnM98C21Rg==
X-Received: by 2002:ac2:494c:: with SMTP id o12mr5558237lfi.181.1597594643715; 
 Sun, 16 Aug 2020 09:17:23 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id e17sm3860081ljg.85.2020.08.16.09.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2020 09:17:22 -0700 (PDT)
Subject: Re: [PATCH RESEND v12 0/4] Panel rotation patches
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200813215609.28643-1-digetx@gmail.com>
 <20200816151749.GA1394979@ravnborg.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f98d8952-18e6-f761-ae5c-da7738919d08@gmail.com>
Date: Sun, 16 Aug 2020 19:17:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200816151749.GA1394979@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:42 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Derek Basehore <dbasehore@chromium.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMDguMjAyMCAxODoxNywgU2FtIFJhdm5ib3JnINC/0LjRiNC10YI6Cj4gSGkgRG1pdHJ5Cj4g
Cj4gT24gRnJpLCBBdWcgMTQsIDIwMjAgYXQgMTI6NTY6MDVBTSArMDMwMCwgRG1pdHJ5IE9zaXBl
bmtvIHdyb3RlOgo+PiBIZWxsbyEKPj4KPj4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBk
aXNwbGF5IHBhbmVsJ3MgRFQgcm90YXRpb24gcHJvcGVydHkuIEl0J3MgYQo+PiBjb250aW51YXRp
b24gb2YgdGhlIHdvcmsgdGhhdCB3YXMgaW5pdGlhbGx5IHN0YXJ0ZWQgYnkgRGVyZWsgQmFzZWhv
cmUgZm9yCj4+IHRoZSBwYW5lbCBkcml2ZXIgdGhhdCBpcyB1c2VkIGJ5IHNvbWUgTWVkaWF0ZWsg
ZGV2aWNlIFsxXS4gSSBwaWNrZWQgdXAgdGhlCj4+IERlcmVrJ3MgcGF0Y2hlcyBhbmQgYWRkZWQg
bXkgdC1iIGFuZCByLWIgdGFncyB0byB0aGVtLCBJIGFsc28gYWRkZWQKPj4gcm90YXRpb24gc3Vw
cG9ydCB0byB0aGUgcGFuZWwtbHZkcyBhbmQgcGFuZWwtc2ltcGxlIGRyaXZlcnMuCj4+Cj4+IFdl
IG5lZWQgdGhlIHJvdGF0aW9uIHN1cHBvcnQgZm9yIHRoZSBOZXh1cyA3IHRhYmxldCBkZXZpY2Ug
d2hpY2ggaXMgbm93Cj4+IHN1cHBvcnRlZCBieSB0aGUgdXBzdHJlYW0ga2VybmVsLCB0aGUgZGV2
aWNlIGhhcyBkaXNwbGF5IHBhbmVsIG1vdW50ZWQKPj4gdXBzaWRlLWRvd24gYW5kIGl0IHVzZXMg
cGFuZWwtbHZkcyBbMl0uCj4+Cj4+IFsxXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAyMC8zLzUv
MTExOQo+PiBbMl0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvbmV4dC9saW51eC1uZXh0LmdpdC90cmVlL2FyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMzAtYXN1
cy1uZXh1czctZ3JvdXBlci1jb21tb24uZHRzaT8jbjEwMzYKPj4KPj4gQ2hhbmdlbG9nOgo+Pgo+
PiB2MTI6IC0gTm8gY29kZSBjaGFuZ2VzLiBUaGUgdjExIG1pc3NlZCB2NS45IHJlbGVhc2UsIHJl
LXNlbmRpbmcgcGF0Y2hlcwo+PiAgICAgICAgZm9yIHRoZSB2NS4xMCBrZXJuZWwuIFBsZWFzZSBy
ZXZpZXcgYW5kIGFwcGx5IHBhdGNoZXMgdG8gbGludXgtbmV4dCwKPj4gICAgICAgIHRoYW5rcyBp
biBhZHZhbmNlIQo+Pgo+PiB2MTE6IC0gVGhpcyBzZXJpZXMgaXMgZmFjdG9yZWQgb3V0IGZyb20g
dGhpcyBwYXRjaHNldCBbM10gYmVjYXVzZSB0aGVzZQo+PiAgICAgICAgcGF0Y2hlcyBkbyBub3Qg
aGF2ZSBoYXJkIGRlcGVuZGVuY3kgb24gdGhlIFRlZ3JhIERSTSBwYXRjaGVzIGFuZAo+PiAgICAg
ICAgaXQgc2hvdWxkIGJlIG5pY2VyIHRvIHJldmlldyBhbmQgYXBwbHkgdGhlIHByb3Blcmx5IGdy
b3VwZWQgcGF0Y2hlcy4KPj4KPj4gICAgICAtIEluaXRpYWxseSBbM10gb25seSB0b3VjaGVkIHRo
ZSBwYW5lbC1sdmRzIGRyaXZlciBhbmQgRW1pbCBWZWxpa292Cj4+ICAgICAgICBzdWdnZXN0ZWQg
dGhhdCBpdCB3aWxsIGJlIGJldHRlciB0byBzdXBwb3J0IG1vcmUgcGFuZWxzIGluIHRoZSByZXZp
ZXcKPj4gICAgICAgIGNvbW1lbnRzIHRvIFszXS4gU28gSSBpbmNsdWRlZCB0aGUgRGVyZWsncyBw
YXRjaCBmb3IgdGhlIEJPRSBwYW5lbAo+PiAgICAgICAgYW5kIGFkZGVkIHJvdGF0aW9uIHN1cHBv
cnQgdG8gdGhlIHBhbmVsLXNpbXBsZSBkcml2ZXIuIEkgdGVzdGVkIHRoYXQKPj4gICAgICAgIHBh
bmVsLWx2ZHMgYW5kIHBhbmVsLXNpbXBsZSB3b3JrIHByb3Blcmx5IHdpdGggdGhlIHJvdGF0ZWQg
cGFuZWwgdXNpbmcKPj4gICAgICAgIHRoZSBPcGVudGVncmEgWG9yZyBkcml2ZXIgWzRdIGFuZCBX
YXlsYW5kIFdlc3RvbiBbNV0uCj4+Cj4+ICAgICAgLSBUaGUgcGFuZWwtbHZkcyBkcml2ZXIgbm93
IHByaW50cyBhIGVycm9yIG1lc3NhZ2UgaWYgcm90YXRpb24gcHJvcGVydHkKPj4gICAgICAgIGZh
aWxzIHRvIGJlIHBhcnNlZC4KPj4KPj4gWzNdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwv
MjAyMDA2MTQyMDAxMjEuMTQxNDctMS1kaWdldHhAZ21haWwuY29tLwo+PiBbNF0gaHR0cHM6Ly9n
aXRodWIuY29tL2dyYXRlLWRyaXZlci94Zjg2LXZpZGVvLW9wZW50ZWdyYS9jb21taXQvMjhlYjIw
YTM5NTliYmU1YmMzYTNiNjdlNTU5NzcwOTNmZDUxMTRjYQo+PiBbNV0gaHR0cHM6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL3dheWxhbmQvd2VzdG9uLy0vbWVyZ2VfcmVxdWVzdHMvMzE1Cj4+Cj4+
IERlcmVrIEJhc2Vob3JlICgyKToKPj4gICBkcm0vcGFuZWw6IEFkZCBoZWxwZXIgZm9yIHJlYWRp
bmcgRFQgcm90YXRpb24KPj4gICBkcm0vcGFuZWw6IFJlYWQgcGFuZWwgb3JpZW50YXRpb24gZm9y
IEJPRSBUVjEwMVdVTS1OTDYKPj4KPj4gRG1pdHJ5IE9zaXBlbmtvICgyKToKPj4gICBkcm0vcGFu
ZWw6IGx2ZHM6IFJlYWQgcGFuZWwgb3JpZW50YXRpb24KPj4gICBkcm0vcGFuZWwtc2ltcGxlOiBS
ZWFkIHBhbmVsIG9yaWVudGF0aW9uCj4gCj4gVGhhbmtzIGZvciB5b3VyIHBlcnNpc3RlbmNlIHdp
dGggdGhlc2UgcGF0Y2hlcy4KPiBXaGlsZSBhcHBseWluZyBJIG1hZGUgYSBmZXcgdXBkYXRlczoK
PiAtIGZpeGVkIHR3byB0cml2aWFsIGNoZWNrcGF0Y2ggd2FybmluZ3MKPiAtIHNtYWxsIHVwZGF0
ZSB0byBrZXJuZWwtZG9jIGZvciB0aGUgbmV3IGZ1bmN0aW9uLCB0byBiZXR0ZXIgbWF0Y2gKPiAg
IHN1cnJvdW5kaW5nIHdvcmRpbmcKPiAtIGFkZGVkIGVycm9yIG1lc3NhZ2UgdG8gcGFuZWwtYm9l
LXR2MTAxd3VtLW5sNi5jIHdoZW4gZmFpbGVkIHRvIGdldAo+ICAgb3JpZW50YXRpb24KPiAtIHVz
ZSBzYW1lIHdvcmRpbmcgaW4gYWxsIGVycm9yIG1lc3NhZ2VzIGFuZCB1c2UgIm9yaWVudGF0aW9u
IiBhbmQgbm90Cj4gICByb3RhdGlvbiBhcyB0aGlzIG1hdGNoZXMgdGhlIGNhbGxlZCBmdW5jdGlv
bgoKSGVsbG8sIFNhbSEgVmVyeSBuaWNlIHRvIHNlZSB0aGUgcHJvZ3Jlc3MhIFRoYW5rIHlvdSB2
ZXJ5IG11Y2ghCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
