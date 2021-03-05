Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 831DF32F657
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 00:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095AD6EC81;
	Fri,  5 Mar 2021 23:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F8F6EC81
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 23:08:03 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id d20so3754412qkc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 15:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dNOfy+4JVngKRWmS3lpLOlIxvZssBG0MFQQkKbrKJlg=;
 b=O5GL+LmzFSaO5vYSK6DQ1VSdrnRjKWpzQWa1N/14LIh2qXKbGuJGk05JDwf7u+wLSZ
 yY/UoYFg5qyUg8Zq4MXqL+G11I+V0jQq+2oCXPPfhDMOFYC8ilkxTha6eM+T24xPGdp7
 rmXhMA7d5w1m0xRZdtnWjHhw8na3gTQBWw+Q/QwW/i10b6vbxTM7EhDuEnPFzXUM0rfy
 /VTebUQzz+sM+4Ez6VoeVlH6jeki/JUyPcj3sHzBgUkpgdM/5D+yzAjr/Lt+B3+6k5el
 nDw0UniH5uwGi5KXr7MnNwHIhA/BB377tBompL1e1ayIfffm4RNPrkPEmqrw7YGVYHSd
 rvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dNOfy+4JVngKRWmS3lpLOlIxvZssBG0MFQQkKbrKJlg=;
 b=UFBxQsWUoWaTsoBWJUSsvgDF+JCkPxfp9d5+2NTxzBa38vAqAmDG4VynKwFkgyJSGE
 MOKGdPRbLIp93rDPfg0Be19FISa1nJCDguUHzcg/G3QWv4Lm3Vg540tWSlruIaZ9PnTa
 08JFm+crp3y//+AQAPHyyBu9mBmJqZz2q5ZyhEQNXG3e7YXxyN12vmAGK8niLOxpjUbW
 edkFYduNjiB+jaG0/oBwK65so72u6V8EelC+zvrEUuxDIxkqHcs+QikvzrnEvSggT3pV
 ONNEbfjZKkVOB70OAAjzy9pc563/sJ6hCx3ODosCG6tAStHOagUjQyxccpoPsECCnlE4
 NU/Q==
X-Gm-Message-State: AOAM531p4rHR1g7HfHTaq/0sGxmnmw79ygRRIiUQ2UcKer0GPzZVxagP
 oCcV+GBKNQ5m14kZkIed3ExXZw==
X-Google-Smtp-Source: ABdhPJxw8pg7Vjat2LQVDgSIs8+7LU4dkFVLn4MTIo8uqHTehUq8Npi3JYT07t8hM0E3jHzk4La6QA==
X-Received: by 2002:a37:6244:: with SMTP id w65mr11172754qkb.393.1614985682638; 
 Fri, 05 Mar 2021 15:08:02 -0800 (PST)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca.
 [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id s133sm2870546qke.1.2021.03.05.15.08.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 15:08:01 -0800 (PST)
Subject: Re: [PATCH] drm/msm/dsi: support CPHY mode for 7nm pll/phy
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
References: <20210215162805.21481-1-jonathan@marek.ca>
 <3e511cd9-2dbc-abf0-23c0-26779eb1777f@linaro.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <cafc7dad-68bf-28f0-4134-e494c6f68256@marek.ca>
Date: Fri, 5 Mar 2021 18:06:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <3e511cd9-2dbc-abf0-23c0-26779eb1777f@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Konrad Dybcio <konradybcio@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMy81LzIxIDU6NDUgUE0sIERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6Cj4gT24gMTUvMDIvMjAy
MSAxOToyNywgSm9uYXRoYW4gTWFyZWsgd3JvdGU6Cj4+IEFkZCB0aGUgcmVxdWlyZWQgY2hhbmdl
cyB0byBzdXBwb3J0IDdubSBwbGwvcGh5IGluIENQSFkgbW9kZS4KPj4KPj4gVGhpcyBhZGRzIGEg
InFjb20sZHNpLXBoeS1jcGh5LW1vZGUiIHByb3BlcnR5IGZvciB0aGUgUEhZIG5vZGUgdG8gZW5h
YmxlCj4+IHRoZSBDUEhZIG1vZGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIE1hcmVr
IDxqb25hdGhhbkBtYXJlay5jYT4KPiAKPiBPdGhlciB0aGF0IGZldyBjb21tZW50cyBiZWxsb3c6
Cj4gCj4gUmV2aWV3ZWQtYnk6IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGlu
YXJvLm9yZz4KPiAKPj4gLS0tCj4+IMKgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bXNtL2RzaS50eHTCoMKgIHzCoCAxICsKPj4gwqAgZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNp
LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEyICstLQo+PiDCoCBkcml2ZXJz
L2dwdS9kcm0vbXNtL2RzaS9kc2kuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCA2ICstCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaS54bWwuaMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgMiArCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9o
b3N0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMzQgKysrKystLQo+PiDCoCBkcml2ZXJzL2dw
dS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeS5jwqDCoMKgwqDCoMKgwqDCoCB8IDQ5ICsrKysrKysr
Ky0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuaMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDMgKwo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeV83
bm0uY8KgwqDCoMKgIHwgODkgKysrKysrKysrKysrKystLS0tLQo+PiDCoCBkcml2ZXJzL2dwdS9k
cm0vbXNtL2RzaS9wbGwvZHNpX3BsbC5jwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArLQo+PiDCoCBk
cml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9wbGwvZHNpX3BsbC5owqDCoMKgwqDCoMKgwqDCoCB8wqAg
NSArLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9wbGwvZHNpX3BsbF83bm0uY8KgwqDC
oMKgIHwgNzEgKysrKysrKysrLS0tLS0tCj4+IMKgIDExIGZpbGVzIGNoYW5nZWQsIDIxMCBpbnNl
cnRpb25zKCspLCA2NiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kc2kudHh0IAo+PiBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kc2kudHh0Cj4+IGluZGV4IGI5
YTY0ZDNmZjE4NC4uN2ZmYzg2YTk4MTZiIDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dAo+PiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dAo+PiBAQCAtMTI0LDYg
KzEyNCw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4+IMKgIE9wdGlvbmFsIHByb3BlcnRpZXM6
Cj4+IMKgIC0gcWNvbSxkc2ktcGh5LXJlZ3VsYXRvci1sZG8tbW9kZTogQm9vbGVhbiB2YWx1ZSBp
bmRpY2F0aW5nIGlmIHRoZSAKPj4gTERPIG1vZGUgUEhZCj4+IMKgwqDCoCByZWd1bGF0b3IgaXMg
d2FudGVkLgo+PiArLSBxY29tLGRzaS1waHktY3BoeS1tb2RlOiBCb29sZWFuIHZhbHVlIGluZGlj
YXRpbmcgaWYgQ1BIWSBtb2RlIGlzIAo+PiB3YW50ZWQuCj4+IMKgIC0gcWNvbSxtZHNzLW1kcC10
cmFuc2Zlci10aW1lLXVzOsKgwqDCoCBTcGVjaWZpZXMgdGhlIGRzaSB0cmFuc2ZlciB0aW1lIAo+
PiBmb3IgY29tbWFuZCBtb2RlCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBwYW5lbHMgaW4gbWljcm9zZWNvbmRzLiBEcml2ZXIgdXNlcyB0aGlzIG51bWJlciAK
Pj4gdG8gYWRqdXN0Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB0aGUgY2xvY2sgcmF0ZSBhY2NvcmRpbmcgdG8gdGhlIGV4cGVjdGVkIAo+PiB0cmFuc2ZlciB0
aW1lLgo+IAo+IFRoaXMgc2hvdWxkIGdvIGluIGEgc2VwYXJhdGUgcGF0Y2gsIHNoYW4ndCBpdD8K
PiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaS5jIAo+PiBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaS5jCj4+IGluZGV4IDYyNzA0ODg1MWQ5OS4uNjhkODU0
N2Y3MjY0IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2kuYwo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2kuYwo+PiBAQCAtMTMsNyArMTMsNyBAQCBz
dHJ1Y3QgZHJtX2VuY29kZXIgKm1zbV9kc2lfZ2V0X2VuY29kZXIoc3RydWN0IAo+PiBtc21fZHNp
ICptc21fZHNpKQo+PiDCoMKgwqDCoMKgIHJldHVybiBtc21fZHNpLT5lbmNvZGVyOwo+PiDCoCB9
Cj4+IC1zdGF0aWMgaW50IGRzaV9nZXRfcGh5KHN0cnVjdCBtc21fZHNpICptc21fZHNpKQo+PiAr
c3RhdGljIGludCBkc2lfZ2V0X3BoeShzdHJ1Y3QgbXNtX2RzaSAqbXNtX2RzaSwgYm9vbCAqY3Bo
eV9tb2RlKQo+IAo+IEkgc2VlIG5vIG5lZWQgdG8gcGFzcyB0aGUgJ2NwaHlfbW9kZScgdGhyb3Vn
aCB0aGUgYm9vbCBwb2ludGVyIGFuZCBiYWNrIAo+IHRvIG1zbV9kc2lfaG9zdF9pbml0LiBXaGF0
IGFib3V0IGp1c3QgcHV0dGluZyBpdCBpbnRvIHN0cnVjdCBtc21fZHNpPwo+IAoKQmVjYXVzZSBp
dCBkb2Vzbid0IG5lZWQgdG8gYmUgc3RvcmVkIGluIG1zbV9kc2kgKG5lZWQgaXQgaW4gbXNtX2Rz
aV9ob3N0IAp3aGljaCBkb2Vzbid0IGhhdmUgYWNjZXNzIHRvIG1zbV9kc2kpLiBCdXQgSSBzdXBw
b3NlIGl0IGRvZXNuJ3QgaHVydCB0byAKYWxzbyBoYXZlIGl0IGluIG1zbV9kc2kgYW5kIG1ha2Ug
dGhpbmdzIGEgYml0IGNsZWFuZXIuCgo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldiA9IG1zbV9kc2ktPnBkZXY7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGh5X3BkZXY7Cj4+IEBAIC0yOSw2ICsyOSw3IEBAIHN0YXRpYyBpbnQg
ZHNpX2dldF9waHkoc3RydWN0IG1zbV9kc2kgKm1zbV9kc2kpCj4+IMKgwqDCoMKgwqAgaWYgKHBo
eV9wZGV2KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbXNtX2RzaS0+cGh5ID0gcGxhdGZvcm1fZ2V0
X2RydmRhdGEocGh5X3BkZXYpOwo+PiArwqDCoMKgICpjcGh5X21vZGUgPSBvZl9wcm9wZXJ0eV9y
ZWFkX2Jvb2wocGh5X25vZGUsIAo+PiAicWNvbSxkc2ktcGh5LWNwaHktbW9kZSIpOwo+PiDCoMKg
wqDCoMKgIG9mX25vZGVfcHV0KHBoeV9ub2RlKTsKPj4gwqDCoMKgwqDCoCBpZiAoIXBoeV9wZGV2
IHx8ICFtc21fZHNpLT5waHkpIHsKPj4gQEAgLTY1LDYgKzY2LDcgQEAgc3RhdGljIHZvaWQgZHNp
X2Rlc3Ryb3koc3RydWN0IG1zbV9kc2kgKm1zbV9kc2kpCj4+IMKgIHN0YXRpYyBzdHJ1Y3QgbXNt
X2RzaSAqZHNpX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gwqAgewo+PiDC
oMKgwqDCoMKgIHN0cnVjdCBtc21fZHNpICptc21fZHNpOwo+PiArwqDCoMKgIGJvb2wgY3BoeV9t
b2RlOwo+PiDCoMKgwqDCoMKgIGludCByZXQ7Cj4+IMKgwqDCoMKgwqAgaWYgKCFwZGV2KQo+PiBA
QCAtNzksMTMgKzgxLDEzIEBAIHN0YXRpYyBzdHJ1Y3QgbXNtX2RzaSAqZHNpX2luaXQoc3RydWN0
IAo+PiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+IMKgwqDCoMKgwqAgbXNtX2RzaS0+cGRldiA9
IHBkZXY7Cj4+IMKgwqDCoMKgwqAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgbXNtX2RzaSk7
Cj4+IC3CoMKgwqAgLyogSW5pdCBkc2kgaG9zdCAqLwo+PiAtwqDCoMKgIHJldCA9IG1zbV9kc2lf
aG9zdF9pbml0KG1zbV9kc2kpOwo+PiArwqDCoMKgIC8qIEdFVCBkc2kgUEhZICovCj4+ICvCoMKg
wqAgcmV0ID0gZHNpX2dldF9waHkobXNtX2RzaSwgJmNwaHlfbW9kZSk7Cj4+IMKgwqDCoMKgwqAg
aWYgKHJldCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZGVzdHJveV9kc2k7Cj4+IC3CoMKg
wqAgLyogR0VUIGRzaSBQSFkgKi8KPj4gLcKgwqDCoCByZXQgPSBkc2lfZ2V0X3BoeShtc21fZHNp
KTsKPj4gK8KgwqDCoCAvKiBJbml0IGRzaSBob3N0ICovCj4+ICvCoMKgwqAgcmV0ID0gbXNtX2Rz
aV9ob3N0X2luaXQobXNtX2RzaSwgY3BoeV9tb2RlKTsKPj4gwqDCoMKgwqDCoCBpZiAocmV0KQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBkZXN0cm95X2RzaTsKPiAKPiAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
