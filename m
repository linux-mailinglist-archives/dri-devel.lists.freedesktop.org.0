Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBA710F129
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD0C6E31E;
	Mon,  2 Dec 2019 19:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12566E31E;
 Mon,  2 Dec 2019 19:55:52 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id cy15so674923edb.4;
 Mon, 02 Dec 2019 11:55:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OMJrw1j/pvu1iTGY8pM0wCN2Z1+KfJ2O6ateeNGld0I=;
 b=jRQijufJ03b4Qw4+PWpdltjzQKdXlBT/yfNE76T92UnmWySLDicfg9EIY3jebAFDSb
 Sxhsb8XtgXYYYDa9Mp7UAWmt1WPmAazGaunA+WZ70VgPH20BWQlP3Mu1wJQk8AFelOG4
 e9BT9Hzs+5FxWSfZRHk1dxSIWObi48QaUFVf9+WPeo/41et/VtTec2D5MrC2ibmU1Q61
 wJ9gfxsQDAT32+Owbr9lGObNR1GsbdYi7nO8jbkcxeDQ+hcZBs/zXb3MSwiUFR4hRUYr
 UW4SpMgRsRFIi4KxTdBDdhCwwI1mFE8gjKtWHSF/WoN3veOrUZUhqwMYtRc4BF+65PmI
 mhuQ==
X-Gm-Message-State: APjAAAVunS7AWbHJZXDH99HBCQqYTOQE7Z01y/xGosPuGR5ucwSD6K+2
 SbG3K/UqSRXSVgQFFWUu+npJWeohurS0L7l5DuU=
X-Google-Smtp-Source: APXvYqzhBu0NZunAmV85IeuYNwR4VFGS6U/nWViEG3owaoouFkOXT76zHxBLe+Fv+kgzYb//3znvP/A636d5rkEOJ04=
X-Received: by 2002:a17:906:b6c8:: with SMTP id
 ec8mr1133332ejb.64.1575316551333; 
 Mon, 02 Dec 2019 11:55:51 -0800 (PST)
MIME-Version: 1.0
References: <1575011105-28172-1-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1575011105-28172-1-git-send-email-harigovi@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 2 Dec 2019 11:55:40 -0800
Message-ID: <CAF6AEGuSb1p1=hPYwRgo8hWJc629ywK_qCg2vBLyXQKvjGvM3A@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm: add support for 2.4.1 DSI version for sc7180
 soc
To: Harigovindan P <harigovi@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OMJrw1j/pvu1iTGY8pM0wCN2Z1+KfJ2O6ateeNGld0I=;
 b=WlefZGQNVPxv1RDNohpw2YBv8o7ZCghZpIMAxbHdVopovNYnGv6BA1DTyWctuWWNAH
 ezPN6ifqps0iyargYIqrDc1QWz+TCqaf4mK9BK7FJ1ugJyAyn6eUpkqqh4P9jMmEdOWQ
 WbZjwGoSGGZBsfQCJHK4Q/XWfBPkgrewKudJdYG5IU4omAxdd0vBGz1OUcaOWcKr5gXX
 qrv5OlklCc545GX9ZMp7pir/5AQt4D0t1dKsaVqZcYDWqja1qbX7OOkiW1cJsQ1Cf8lk
 2zxcHI+bbAkV8lH8HN5OP2UMDvueBshl4YDl21e5rNOieZtV+oyr2LP9fRqeNgVoqNp8
 OfRw==
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMTE6MDUgUE0gSGFyaWdvdmluZGFuIFAgPGhhcmlnb3Zp
QGNvZGVhdXJvcmEub3JnPiB3cm90ZToKPgo+IENoYW5nZXMgaW4gdjE6Cj4gICAgICAgICAtTW9k
aWZ5IGNvbW1pdCB0ZXh0IHRvIGluZGljYXRlIERTSSB2ZXJzaW9uIGFuZCBTT0MgZGV0YWlsKEpl
ZmZyZXkgSHVnbykuCj4gICAgICAgICAtU3BsaXR0aW5nIHZpc2lvbm94IHBhbmVsIGRyaXZlciBj
b2RlIG91dCBpbnRvIGEKPiAgICAgICAgICBkaWZmZXJlbnQgcGF0Y2goc2V0KSwgc2luY2UgcGFu
ZWwgZHJpdmVycyBhcmUgbWVyZ2VkIGludG8KPiAgICAgICAgICBkcm0tbmV4dCB2aWEgYSBkaWZm
ZXJlbnQgdHJlZShSb2IgQ2xhcmspLgo+Cj4gU2lnbmVkLW9mZi1ieTogSGFyaWdvdmluZGFuIFAg
PGhhcmlnb3ZpQGNvZGVhdXJvcmEub3JnPgoKUmV2aWV3ZWQtYnk6IFJvYiBDbGFyayA8cm9iZGNs
YXJrQGdtYWlsLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcu
YyB8IDIxICsrKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9k
c2lfY2ZnLmggfCAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vZHNpL2RzaV9jZmcuYwo+IGluZGV4IGI3YjdjMWEuLjdiOTY3ZGQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5jCj4gQEAgLTEzMyw2ICsxMzMsMTAgQEAgc3RhdGlj
IGNvbnN0IGNoYXIgKiBjb25zdCBkc2lfc2RtODQ1X2J1c19jbGtfbmFtZXNbXSA9IHsKPiAgICAg
ICAgICJpZmFjZSIsICJidXMiLAo+ICB9Owo+Cj4gK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3Qg
ZHNpX3NjNzE4MF9idXNfY2xrX25hbWVzW10gPSB7Cj4gKyAgICAgICAiaWZhY2UiLCAiYnVzIiwK
PiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9jb25maWcgc2RtODQ1X2Rz
aV9jZmcgPSB7Cj4gICAgICAgICAuaW9fb2Zmc2V0ID0gRFNJXzZHX1JFR19TSElGVCwKPiAgICAg
ICAgIC5yZWdfY2ZnID0gewo+IEBAIC0xNDcsNiArMTUxLDIwIEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgbXNtX2RzaV9jb25maWcgc2RtODQ1X2RzaV9jZmcgPSB7Cj4gICAgICAgICAubnVtX2RzaSA9
IDIsCj4gIH07Cj4KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtc21fZHNpX2NvbmZpZyBzYzcxODBf
ZHNpX2NmZyA9IHsKPiArICAgICAgIC5pb19vZmZzZXQgPSBEU0lfNkdfUkVHX1NISUZULAo+ICsg
ICAgICAgLnJlZ19jZmcgPSB7Cj4gKyAgICAgICAgICAgICAgIC5udW0gPSAxLAo+ICsgICAgICAg
ICAgICAgICAucmVncyA9IHsKPiArICAgICAgICAgICAgICAgICAgICAgICB7InZkZGEiLCAyMTgw
MCwgNCB9LCAgICAvKiAxLjIgViAqLwo+ICsgICAgICAgICAgICAgICB9LAo+ICsgICAgICAgfSwK
PiArICAgICAgIC5idXNfY2xrX25hbWVzID0gZHNpX3NjNzE4MF9idXNfY2xrX25hbWVzLAo+ICsg
ICAgICAgLm51bV9idXNfY2xrcyA9IEFSUkFZX1NJWkUoZHNpX3NjNzE4MF9idXNfY2xrX25hbWVz
KSwKPiArICAgICAgIC5pb19zdGFydCA9IHsgMHhhZTk0MDAwIH0sCj4gKyAgICAgICAubnVtX2Rz
aSA9IDEsCj4gK307Cj4gKwo+ICBjb25zdCBzdGF0aWMgc3RydWN0IG1zbV9kc2lfaG9zdF9jZmdf
b3BzIG1zbV9kc2lfdjJfaG9zdF9vcHMgPSB7Cj4gICAgICAgICAubGlua19jbGtfZW5hYmxlID0g
ZHNpX2xpbmtfY2xrX2VuYWJsZV92MiwKPiAgICAgICAgIC5saW5rX2Nsa19kaXNhYmxlID0gZHNp
X2xpbmtfY2xrX2Rpc2FibGVfdjIsCj4gQEAgLTIwMSw2ICsyMTksOSBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG1zbV9kc2lfY2ZnX2hhbmRsZXIgZHNpX2NmZ19oYW5kbGVyc1tdID0gewo+ICAgICAg
ICAgICAgICAgICAmbXNtODk5OF9kc2lfY2ZnLCAmbXNtX2RzaV82Z192Ml9ob3N0X29wc30sCj4g
ICAgICAgICB7TVNNX0RTSV9WRVJfTUFKT1JfNkcsIE1TTV9EU0lfNkdfVkVSX01JTk9SX1YyXzJf
MSwKPiAgICAgICAgICAgICAgICAgJnNkbTg0NV9kc2lfY2ZnLCAmbXNtX2RzaV82Z192Ml9ob3N0
X29wc30sCj4gKyAgICAgICB7TVNNX0RTSV9WRVJfTUFKT1JfNkcsIE1TTV9EU0lfNkdfVkVSX01J
Tk9SX1YyXzRfMSwKPiArICAgICAgICAgICAgICAgJnNjNzE4MF9kc2lfY2ZnLCAmbXNtX2RzaV82
Z192Ml9ob3N0X29wc30sCj4gKwo+ICB9Owo+Cj4gIGNvbnN0IHN0cnVjdCBtc21fZHNpX2NmZ19o
YW5kbGVyICptc21fZHNpX2NmZ19nZXQodTMyIG1ham9yLCB1MzIgbWlub3IpCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcuaCBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZHNpL2RzaV9jZmcuaAo+IGluZGV4IGUyYjdhN2QuLjk5MTk1MzYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9kc2kvZHNpX2NmZy5oCj4gQEAgLTE5LDYgKzE5LDcgQEAKPiAgI2RlZmluZSBNU01fRFNJ
XzZHX1ZFUl9NSU5PUl9WMV80XzEgICAgMHgxMDA0MDAwMQo+ICAjZGVmaW5lIE1TTV9EU0lfNkdf
VkVSX01JTk9SX1YyXzJfMCAgICAweDIwMDAwMDAwCj4gICNkZWZpbmUgTVNNX0RTSV82R19WRVJf
TUlOT1JfVjJfMl8xICAgIDB4MjAwMjAwMDEKPiArI2RlZmluZSBNU01fRFNJXzZHX1ZFUl9NSU5P
Ul9WMl80XzEgICAgMHgyMDA0MDAwMQo+Cj4gICNkZWZpbmUgTVNNX0RTSV9WMl9WRVJfTUlOT1Jf
ODA2NCAgICAgIDB4MAo+Cj4gLS0KPiAyLjcuNAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
