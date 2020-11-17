Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908B72B5C90
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 11:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9836E153;
	Tue, 17 Nov 2020 10:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B676E153
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 10:05:13 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m6so5365415wrg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 02:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=a5Wi2WgEQj4V/fZoMbuAUA0hIayxQxzUHqeI84Mc1FE=;
 b=jcwtfN8McGJzUoRDkq8qC68cj8dg0fKU3MjNMXmKmi/lxXkV95Q937dwb0jm5ofyRw
 b29Vkb7ZV6YcZYcAc08tixve5ngaIO9o4Ny/iiwjCUJUGUi7xdXJIT2lv1bq+/LdkU/Z
 aBCiT57QqqqzZCgmbnseFCB2XKKyzy29xnO9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=a5Wi2WgEQj4V/fZoMbuAUA0hIayxQxzUHqeI84Mc1FE=;
 b=khcBrl1vX4rePNE9XUwvE46693uFgz8tRUc2ksa6SGxjDyQ5QL8LmiLqdOQ08Cg6Ow
 aNxNeLpT90CF5GhqesWY8MvjRnXTm5M1H+VgNmjHdzTm80k2m+rNG1vo4dynsMai1pYC
 GrQGIYR31LXfpPsbI2SuxIc/XhF4alAY4M5iB41v3vQytMQMjLVLsTTBeXjO+pbVJDft
 SxtmHT+Q5tzGnB4FidaS0xJRcdkl2qTDWKbIMFrZxPyv9W0saUNiVa1juxgkjBdomEsL
 Q7Cw2JdV9zrNWwf2p91qglX1Ij4ozd1kVSWxt0SSPrGx+MN7GLVAzkyGINLZxwimF8qS
 7Ktg==
X-Gm-Message-State: AOAM531GTnVGwivYn/7soPs/U1PWqxZYr7OIVTLvW8hogmRsvIokBwCU
 xkeWrlS9qpz4q6jOGe+VcQfqTYIA7Z1F2g==
X-Google-Smtp-Source: ABdhPJyRMGrawjvmO5x/3ra1IWyMGFjfgvN36ipmgsKrzL1M9MQ0E0rIX/0e1m6SBMTLUu/PiZ0Mww==
X-Received: by 2002:a5d:4d02:: with SMTP id z2mr16395374wrt.109.1605607512109; 
 Tue, 17 Nov 2020 02:05:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t5sm2923320wmg.19.2020.11.17.02.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 02:05:11 -0800 (PST)
Date: Tue, 17 Nov 2020 11:05:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 02/30] include: drm: drm_atomic: Artificially use 'crtc'
 to avoid 'not used' warning
Message-ID: <20201117100509.GJ401619@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-3-lee.jones@linaro.org>
 <20201112202516.GA3340631@ravnborg.org>
 <20201113204959.GW401619@phenom.ffwll.local>
 <CAF2Aj3j6+fEFS66qg-a-0Z1XtNQ7EAEnu4ECZ9gLiH7buH=PLw@mail.gmail.com>
 <CAKMK7uEQwFLj+D4LfdQNfb+cQZCH34HZU7oJh8r=mjozuKmZGQ@mail.gmail.com>
 <CAF2Aj3jRFM95R7VaV_4Chi3Tr3ja31EjdVTeHeDkUWETweqCGA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF2Aj3jRFM95R7VaV_4Chi3Tr3ja31EjdVTeHeDkUWETweqCGA@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgMTA6MDE6NTdQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIEZyaSwgMTMgTm92IDIwMjAsIDIxOjMxIERhbmllbCBWZXR0ZXIsIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+IAo+ID4gT24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgOTo1MyBQTSBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4KPiA+ID4KPiA+
ID4gT24gRnJpLCAxMyBOb3YgMjAyMCwgMjA6NTAgRGFuaWVsIFZldHRlciwgPGRhbmllbEBmZnds
bC5jaD4gd3JvdGU6Cj4gPiA+Pgo+ID4gPj4gT24gVGh1LCBOb3YgMTIsIDIwMjAgYXQgMDk6MjU6
MTZQTSArMDEwMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+ID4gPj4gPiBIaSBMZWUsCj4gPiA+PiA+
Cj4gPiA+PiA+IE9uIFRodSwgTm92IDEyLCAyMDIwIGF0IDA3OjAwOjExUE0gKzAwMDAsIExlZSBK
b25lcyB3cm90ZToKPiA+ID4+ID4gPiBUaGUgcHJlY2VkZW50IGhhcyBhbHJlYWR5IGJlZW4gc2V0
IGJ5IG90aGVyIG1hY3JvcyBpbiB0aGUgc2FtZSBmaWxlLgo+ID4gPj4gPiA+Cj4gPiA+PiA+ID4g
Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4gPiA+PiA+
ID4KPiA+ID4+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuYzo1NToxOTogd2Fy
bmluZzogdmFyaWFibGUg4oCYY3J0Y+KAmQo+ID4gc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQt
YnV0LXNldC12YXJpYWJsZV0KPiA+ID4+ID4gPiAgNTUgfCBzdHJ1Y3QgZHJtX2NydGMgKmNydGM7
Cj4gPiA+PiA+ID4gIHwgXn5+fgo+ID4gPj4gPiA+Cj4gPiA+PiA+ID4gQ2M6IE1hYXJ0ZW4gTGFu
a2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiA+PiA+ID4gQ2M6
IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiA+ID4+ID4gPiBDYzogVGhvbWFz
IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gPiA+PiA+ID4gQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+ID4+ID4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgo+ID4gPj4gPiA+IENjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5j
b20+Cj4gPiA+PiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+ID4g
Pj4gPgo+ID4gPj4gPiBBbHNvIGFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dC4KPiA+ID4+ID4gVGhp
cyB3YXMgdGhlIGxhc3QgcGF0Y2ggZnJvbSB0aGlzIGJhdGNoIEkgd2lsbCBwcm9jZXNzLgo+ID4g
Pj4gPiBUaGUgb3RoZXJzIGFyZSBsZWZ0IGZvciB0aGUgbWFpbnRhaW5lcnMgdG8gcGljayB1cC4K
PiA+ID4+Cj4gPiA+PiBidHcgZm9yIHBhdGNoZXMgdGhhdCBtYWludGFpbmVycyBkb24ndCBwaWNr
IHVwLCB0aGUgdXN1YWwgcHJvY2VzcyBpcwo+ID4gdGhhdAo+ID4gPj4gd2UgZ2l2ZSB0aGVtIDIg
d2Vla3MsIHRoZW4ganVzdCBtYXNzIGFwcGx5LiBOb3cgeW91J3JlIHByb2R1Y2luZyBhIGxvdAo+
ID4gb2YKPiA+ID4+IHBhdGNoZXMsIHRvbyBtdWNoIGZvciBtZSB0byBrZWVwIHRyYWNrLCBzbyBw
bGVhc2UganVzdCBwaW5nIG1lIHdpdGggYQo+ID4gPj4gcmVzZW5kIGZvciB0aG9zZSB0aGF0IGV4
cGlyZWQgYW5kIEknbGwgZ28gdGhyb3VnaCBhbmQgcGljayB0aGVtIGFsbCB1cC4KPiA+ID4KPiA+
ID4KPiA+ID4gVGhhdCdzIGdyZWF0IERhbmllbC4gVGhhbmtzIGZvciB5b3VyIHN1cHBvcnQuCj4g
PiA+Cj4gPiA+IEkgY2FuIGRvIG9uZSBiZXR0ZXIgdGhhbiB0aGF0Lgo+ID4gPgo+ID4gPiBXb3Vs
ZCBhIHB1bGwtcmVxdWVzdCBzdWl0IHlvdT8KPiA+Cj4gPiBXZSBoYXZlIGEgZmV3IHRyZWVzIGdv
aW5nIG9uLCBhbmQgeW91ciBwYXRjaGVzIGFyZSBsYW5kaW5nIHRocm91Z2ggYWxsCj4gPiBraW5k
cyBvZiB0aGVtLiBTbyB0aGlzIG1pZ2h0IGJlIG1vcmUgY29vcmRpbmF0aW9uIHBhaW4uIElmIHlv
dSBjYW4KPiA+IGV4Y2x1ZGUgcGF0Y2hlcyBmb3IgdGhlIHNlcGFyYXRlbHkgYW5kIHVzdWFsbHkg
ZmFpcmx5IHdlbGwgbWFpbnRhaW5lZAo+ID4gZHJpdmVycyBvdXQgb2YgdGhlIHB1bGwgaXQgc2hv
dWxkIHdvcmsgKGRybS9hbWQsIGRybS9yYWRlb24sIGRybS9pOTE1LAo+ID4gZHJtL25vdXZlYXUs
IGRybS9tc20gYW5kIGRybS9vbWFwZHJtIHByb2JhYmx5IHRoZSB1c3VhbCBvbmVzKS4KPiA+Cj4g
PiBPciB5b3UganVzdCBzZW5kIHRoZSBuZXh0IHBpbGUgYW5kIHdlJ2xsIHNlZS4KPiA+Cj4gPiBB
bHNvIEkgZ3Vlc3MgSSBjYW4ndCByZWFsbHkgaW50ZXJlc3QgeW91IGluIGNvbW1pdCByaWdodHMg
c28gdGhpcwo+ID4gcGF0Y2ggYm9tYnMgZ2V0IG9mZiBteSBiYWNrIGFnYWluPyA6LSkKPiA+Cj4g
Cj4gV2hhdCBkb2VzIHRoYXQgbWVhbj8gTWVyZ2UgbXkgb3duIHBhdGNoZXM/Cj4gCj4gTm90IHN1
cmUgaG93IHRoYXQgd29ya3Mgd2l0aCB5b3VyIGdyb3VwIG1haW50ZW5hbmNlIHNldHVwLgo+IAo+
IElzIGl0IGp1c3QgYSBgZ2l0IHB1c2hgPwoKSXQncyBhIGJ1bmNoIG9mIHNjcmlwdGluZyBhbmQg
c2V0dXAsIG1pZ2h0IG5vdCBiZSB3b3J0aCBpdCBmb3IganVzdCBvbmUKb2YuIFBsdXMgd2Ugc3Rp
bGwgdGFrZSBwdWxsIHJlcXVlc3RzIGZyb20gc3VibWFpbnRhaW5lcnMgc28gaXQncyBhbGwganVz
dAppZiB5b3UgZmVlbCBsaWtlIGl0LiBTb21lIGRvY3MgaWYgeW91J3JlIGN1cmlvdXM6CgpodHRw
czovL2RybS5wYWdlcy5mcmVlZGVza3RvcC5vcmcvbWFpbnRhaW5lci10b29scy9nZXR0aW5nLXN0
YXJ0ZWQuaHRtbAoKQ2hlZXJzLCBEYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
