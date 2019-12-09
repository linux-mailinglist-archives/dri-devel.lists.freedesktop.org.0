Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030A1116A01
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DB86E37C;
	Mon,  9 Dec 2019 09:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E096E08A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 01:51:55 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id z21so5143339pjq.13
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2019 17:51:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ERb9yBdFArvuw0F4UZndRbeaDjmJTRBm8ir0cd63sUs=;
 b=plGYNksKmKOQ8ze736BLNV1RVVkl3gLO90rXBMy3CAoGjPqPmj7JwUFDE/LT0S3Wwg
 zRjaJnh8AblUZoJ0PQ72l3W6DbD0MzUE6ibJkHhhI+EDxhkrFxa6LOIwVIjowQzlEYUW
 yzSEdtZJvcBpPLOZtneUYeCG8D3alZPwGPbATkd8gmCo9GsNmhmP37qBw+UEm1yKfcRf
 ASRwgUGSI/HavfbvjNPpGKctQC8AJN1YkieSrDBBUfaIPrglkkUvz12d29z3k0zVB87M
 ds+qgLZBM9fLXmmPopywKjWmeIo+YrUVVQI/AQBtatbpyymmnYPnN+0Piiel9XU5eNw9
 TvaA==
X-Gm-Message-State: APjAAAUChJXLO68S1Qf3XlyXLiOYuPJoLuV4qBqRbcAl15calVKDGWIF
 CGTH8taD10iKTJJJNRqVDLyxlTvF5159KxXH+9E=
X-Google-Smtp-Source: APXvYqzGd63aMywwbu7uUsfMSYS70gGbbHk0P0bkbkXB11cDiOy85ts6nGubS1VTVZddw+dweA7qpq848NvRptzF+rY=
X-Received: by 2002:a17:90a:a00c:: with SMTP id
 q12mr29993519pjp.102.1575856315282; 
 Sun, 08 Dec 2019 17:51:55 -0800 (PST)
MIME-Version: 1.0
References: <20191206074557.19221-1-jerry.han.hq@gmail.com>
 <201912080417.boBrXBiO%lkp@intel.com>
In-Reply-To: <201912080417.boBrXBiO%lkp@intel.com>
From: Jerry Han <jerry.han.hq@gmail.com>
Date: Mon, 9 Dec 2019 09:51:44 +0800
Message-ID: <CA+quO7KgDLCEFgApNxVDUsLNDOCXMC0qfPc64N2TbjLWDF_CVw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Add Boe Himax8279d MIPI-DSI LCD panel
To: kbuild test robot <lkp@intel.com>
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ERb9yBdFArvuw0F4UZndRbeaDjmJTRBm8ir0cd63sUs=;
 b=gBLCPjZIRF2V11h1N2yZPLmwVdWkSTGaDvu5CFEeeEv7NQmoYzW3Yr+Mw1QSKm5RSs
 BfuyGb/xXu9xZNcniDng4u8wivMp8VBZ6bcEkquvMJiDaIh8nVJJ6fcgfxOfCHT5V/oz
 485A6u+UFVAp3LiC/BlXjzdHcda9Gi6ndDvUdty0oqDbjGbpFAVksGHxzOLulf8sz2zg
 6mrNkovFGOmgOO7qRm2aDUHheCqqvg6QUrcDDi462JOljO7NXJvOX+fIMw1Dk5od3wlU
 TQnFknt8gng/ZKD60DaYm60QSs7Bj97QITg18dMTaRh6kcPAyRhYLNiPBlJsoAI9rOl9
 qgwA==
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, kbuild-all@lists.01.org,
 Rock wang <rock_wang@himax.com.cn>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pgo+IEhpIEplcnJ5LAo+Cj4gSSBsb3ZlIHlvdXIgcGF0Y2ghIFlldCBzb21ldGhpbmcgdG8gaW1w
cm92ZToKPgo+IFthdXRvIGJ1aWxkIHRlc3QgRVJST1Igb24gZHJtLWV4eW5vcy9leHlub3MtZHJt
LW5leHRdCj4gW2Fsc28gYnVpbGQgdGVzdCBFUlJPUiBvbiBkcm0taW50ZWwvZm9yLWxpbnV4LW5l
eHQgbGludXMvbWFzdGVyIHY1LjQgbmV4dC0yMDE5MTIwMl0KPiBbaWYgeW91ciBwYXRjaCBpcyBh
cHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwgcGxlYXNlIGRyb3AgdXMgYSBub3RlIHRvIGhl
bHAKPiBpbXByb3ZlIHRoZSBzeXN0ZW0uIEJUVywgd2UgYWxzbyBzdWdnZXN0IHRvIHVzZSAnLS1i
YXNlJyBvcHRpb24gdG8gc3BlY2lmeSB0aGUKPiBiYXNlIHRyZWUgaW4gZ2l0IGZvcm1hdC1wYXRj
aCwgcGxlYXNlIHNlZSBodHRwczovL3N0YWNrb3ZlcmZsb3cuY29tL2EvMzc0MDY5ODJdCj4KPiB1
cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4L2NvbW1pdHMvSmVycnktSGFu
L2RybS1wYW5lbC1BZGQtQm9lLUhpbWF4ODI3OWQtTUlQSS1EU0ktTENELXBhbmVsLzIwMTkxMjA4
LTAxNDI1OAo+IGJhc2U6ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvZGFlaW5raS9kcm0tZXh5bm9zLmdpdCBleHlub3MtZHJtLW5leHQKPiBjb25maWc6
IGM2eC1hbGx5ZXNjb25maWcgKGF0dGFjaGVkIGFzIC5jb25maWcpCj4gY29tcGlsZXI6IGM2eC1l
bGYtZ2NjIChHQ0MpIDcuNS4wCj4gcmVwcm9kdWNlOgo+ICAgICAgICAgd2dldCBodHRwczovL3Jh
dy5naXRodWJ1c2VyY29udGVudC5jb20vaW50ZWwvbGtwLXRlc3RzL21hc3Rlci9zYmluL21ha2Uu
Y3Jvc3MgLU8gfi9iaW4vbWFrZS5jcm9zcwo+ICAgICAgICAgY2htb2QgK3ggfi9iaW4vbWFrZS5j
cm9zcwo+ICAgICAgICAgIyBzYXZlIHRoZSBhdHRhY2hlZCAuY29uZmlnIHRvIGxpbnV4IGJ1aWxk
IHRyZWUKPiAgICAgICAgIEdDQ19WRVJTSU9OPTcuNS4wIG1ha2UuY3Jvc3MgQVJDSD1jNngKPgo+
IElmIHlvdSBmaXggdGhlIGlzc3VlLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWcKPiBSZXBvcnRl
ZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4KPiBBbGwgZXJyb3JzIChu
ZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6Cj4KPiA+PiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtYm9lLWhpbWF4ODI3OWQuYzozMjoxOiBlcnJvcjogZXhwZWN0ZWQgJzsnLCBpZGVudGlmaWVy
IG9yICcoJyBiZWZvcmUgJ3N0cnVjdCcKPiAgICAgc3RydWN0IHBhbmVsX2Rlc2Mgewo+ICAgICBe
fn5+fn4KPiAgICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLWhpbWF4ODI3OWQuYzog
SW4gZnVuY3Rpb24gJ3BhbmVsX2FkZCc6Cj4gPj4gZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LWJvZS1oaW1heDgyNzlkLmM6OTA2OjI6IGVycm9yOiB0b28gZmV3IGFyZ3VtZW50cyB0byBmdW5j
dGlvbiAnZHJtX3BhbmVsX2luaXQnCj4gICAgICBkcm1fcGFuZWxfaW5pdCgmcGluZm8tPmJhc2Up
Owo+ICAgICAgXn5+fn5+fn5+fn5+fn4KPiAgICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS1oaW1heDgyNzlkLmM6MjI6MDoKPiAgICBpbmNsdWRl
L2RybS9kcm1fcGFuZWwuaDoxNTk6Njogbm90ZTogZGVjbGFyZWQgaGVyZQo+ICAgICB2b2lkIGRy
bV9wYW5lbF9pbml0KHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsLCBzdHJ1Y3QgZGV2aWNlICpkZXYs
Cj4gICAgICAgICAgXn5+fn5+fn5+fn5+fn4KPgo+IHZpbSArMzIgZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLWJvZS1oaW1heDgyNzlkLmMKPgo+ICAgICAzMQo+ICAgPiAzMiAgc3RydWN0IHBh
bmVsX2Rlc2Mgewo+ICAgICAzMyAgICAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9k
ZSAqZGlzcGxheV9tb2RlOwo+ICAgICAzNCAgICAgICAgICB1bnNpZ25lZCBpbnQgYnBjOwo+ICAg
ICAzNSAgICAgICAgICB1bnNpZ25lZCBpbnQgd2lkdGhfbW07Cj4gICAgIDM2ICAgICAgICAgIHVu
c2lnbmVkIGludCBoZWlnaHRfbW07Cj4gICAgIDM3Cj4gICAgIDM4ICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgbW9kZV9mbGFnczsKPiAgICAgMzkgICAgICAgICAgZW51bSBtaXBpX2RzaV9waXhlbF9m
b3JtYXQgZm9ybWF0Owo+ICAgICA0MCAgICAgICAgICB1bnNpZ25lZCBpbnQgbGFuZXM7Cj4gICAg
IDQxICAgICAgICAgIGNvbnN0IHN0cnVjdCBwYW5lbF9jbWQgKm9uX2NtZHM7Cj4gICAgIDQyICAg
ICAgICAgIHVuc2lnbmVkIGludCBvbl9jbWRzX251bTsKPiAgICAgNDMgIH07Cj4gICAgIDQ0Cj4K
PiAtLS0KPiAwLURBWSBrZXJuZWwgdGVzdCBpbmZyYXN0cnVjdHVyZSAgICAgICAgICAgICAgICAg
T3BlbiBTb3VyY2UgVGVjaG5vbG9neSBDZW50ZXIKPiBodHRwczovL2xpc3RzLjAxLm9yZy9oeXBl
cmtpdHR5L2xpc3Qva2J1aWxkLWFsbEBsaXN0cy4wMS5vcmcgSW50ZWwgQ29ycG9yYXRpb24KT0ss
IFRoYW5rcywKSSBoYXZlIHN5bmNocm9uaXplZCB0byB0aGUgbGF0ZXN0IGJyYW5jaC4KYW5kIEkg
aGF2ZSBmaXhlZCBpdC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
