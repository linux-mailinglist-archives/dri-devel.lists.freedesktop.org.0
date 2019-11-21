Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3484105A40
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 20:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424296E192;
	Thu, 21 Nov 2019 19:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE8B6E192
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 19:16:43 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id n5so4491097ljc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 11:16:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ziahN+ttEd97d/5G5z+3cx0j+N8D4TfwxF73+tgCoU0=;
 b=QJxU4Wx270BF7J5yp9qy9+hpsOzBwHyfMjpw/qUUbY9zszfvFI0T7o61IxUPPuFIOQ
 6V+wwFxR+EDBZSDn8qroodLFigLGhbUo7d5bw7M7I7JSbgT+K4z6iLTTQS51RmvtGm9b
 h/rMSgbRJWFTTKOoFiC81TBPs8Y/CS6wURJcW98XheSQYQxIiG4cCn67IRVpLLSuiddS
 BgqCEPfrgYe6MYpwvlkiwlamMjW/CAstV8SEzt608WCQzU9c+2mF2c+vxUGvJPeiLvF5
 qhyD7Y8rotdWYpnzf23hPmxtqXsT4bZEQKOgmgyDBBATv69gidYcyWcFw9SyeopBXUS5
 rGlg==
X-Gm-Message-State: APjAAAWkYVfbLYroMy86mmnXEVwFqYCJQkWCRUtarCSDIpwBacPQ0cPO
 OCJS3SDGxOi16GPhLY12zVfKSpHAPjBxTCqsruQ=
X-Google-Smtp-Source: APXvYqyjb5+/REtjK/bEEh0WptrT7h8T1UiI0QahdyGO8qMUxCXU5NSGXt8rKmXDp2mNfZV4+RB/PM8IYT9s+eyrh/A=
X-Received: by 2002:a2e:8e28:: with SMTP id r8mr8884490ljk.21.1574363801085;
 Thu, 21 Nov 2019 11:16:41 -0800 (PST)
MIME-Version: 1.0
References: <20191121071205.27511-1-james.qian.wang@arm.com>
 <20191121071205.27511-7-james.qian.wang@arm.com>
 <20191121094926.GC6236@phenom.ffwll.local>
 <20191121102101.GA32514@jamwan02-TSP300>
In-Reply-To: <20191121102101.GA32514@jamwan02-TSP300>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 22 Nov 2019 05:16:29 +1000
Message-ID: <CAPM=9tw8KDh1bkErYXGsc1Yvc0H9NEEUJ3eA0BSqgGOWDaPhxg@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] drm/komeda: Expose side_by_side by sysfs/config_id
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ziahN+ttEd97d/5G5z+3cx0j+N8D4TfwxF73+tgCoU0=;
 b=uLLUc/SvsjhbA0LZqgK5b/dX/fOzl5h51BgJE1HTB/13AunSW9a5zLHQ/cNfyDZg56
 Vy6dFsZCpM1+HZQd3aPHTfbIr0chJ1LCkFG6kUKta8v3pAwCLGQZ3jrMD1kCIrAT9yVB
 3yyZ2qX3hT2g7ECsWZJFGv9YGZi9Dn9ljrCS30bSJkalHUAzFy3G8jxFfM3zELT2Fwuc
 MNeJ4NBFMN3RkVGRqUHUpuYD9C+fiS5948R9TgHB62mJ80oDjuQK5c0fDJoCUhXEA73j
 1liNW4YTFW64VGm/iRRpn5TdmpEm7G1IedCMkceBsIyDlDGsG5vyEC4IzwOBce9YCoID
 KJfQ==
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>, nd <nd@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMSBOb3YgMjAxOSBhdCAyMDoyMSwgamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5v
bG9neSBDaGluYSkKPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPiB3cm90ZToKPgo+IE9uIFRodSwg
Tm92IDIxLCAyMDE5IGF0IDEwOjQ5OjI2QU0gKzAxMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4g
PiBPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCAwNzoxMjo1NUFNICswMDAwLCBqYW1lcyBxaWFuIHdh
bmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+ID4gVGhlcmUgYXJlIHNvbWUgcmVz
dHJpY3Rpb25zIGlmIEhXIHdvcmtzIG9uIHNpZGVfYnlfc2lkZSwgZXhwb3NlIGl0IHZpYQo+ID4g
PiBjb25maWdfaWQgdG8gdXNlci4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgUWlh
biBXYW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+
ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlk
cF9wcm9kdWN0LmggfCAzICsrLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZGV2LmMgICAgICB8IDEgKwo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF9wcm9kdWN0LmggYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5oCj4gPiA+IGluZGV4
IDEwNTNiMTEzNTJlYi4uOTZlMmU0MDE2MjUwIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5oCj4gPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF9wcm9kdWN0LmgKPiA+ID4g
QEAgLTI3LDcgKzI3LDggQEAgdW5pb24ga29tZWRhX2NvbmZpZ19pZCB7Cj4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgbl9zY2FsZXJzOjIsIC8qIG51bWJlciBvZiBzY2FsZXJzIHBlciBwaXBlbGlu
ZSAqLwo+ID4gPiAgICAgICAgICAgICAgICAgICAgIG5fbGF5ZXJzOjMsIC8qIG51bWJlciBvZiBs
YXllcnMgcGVyIHBpcGVsaW5lICovCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgbl9yaWNoczoz
LCAvKiBudW1iZXIgb2YgcmljaCBsYXllcnMgcGVyIHBpcGVsaW5lICovCj4gPiA+IC0gICAgICAg
ICAgICAgICAgICAgcmVzZXJ2ZWRfYml0czo2Owo+ID4gPiArICAgICAgICAgICAgICAgICAgIHNp
ZGVfYnlfc2lkZToxLCAvKiBpZiBIVyB3b3JrcyBvbiBzaWRlX2J5X3NpZGUgbW9kZSAqLwo+ID4g
PiArICAgICAgICAgICAgICAgICAgIHJlc2VydmVkX2JpdHM6NTsKPiA+ID4gICAgIH07Cj4gPiA+
ICAgICBfX3UzMiB2YWx1ZTsKPiA+ID4gIH07Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4gPiA+IGluZGV4IGMzZmE0ODM1Y2I4ZC4u
NGRkNDY5OWQ0ZTNkIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9kZXYuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+ID4gPiBAQCAtODMsNiArODMsNyBAQCBjb25maWdf
aWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRy
LCBjaGFyICpidWYpCj4gPgo+ID4gVWgsIHRoaXMgc3lzZnMgZmlsZSBoZXJlIGxvb2tzIGEgbG90
IGxpa2UgdWFwaSBmb3Igc29tZSBjb21wb3NpdG9yIHRvCj4gPiBkZWNpZGUgd2hhdCB0byBkby4g
RG8geW91IGhhdmUgdGhlIHVzZXJzcGFjZSBmb3IgdGhpcz8KPgo+IFllcywgb3VyIEhXQyBkcml2
ZXIgdXNlcyB0aGlzIGNvbmZpZ19pZCBhbmQgcHJvZHVjdF9pZCBmb3IgaWRlbnRpZnlpbmcgdGhl
Cj4gSFcgY2Fwcy4KPgoKVGhpcyBzZWVtcyBsaWtlIGl0IHNob3VsZCBiZSBkb25lIG1vcmUgaW4g
dGhlIGtlcm5lbCwgd2h5IGRvZXMKdXNlcnNwYWNlIG5lZWRzIGFsbCB0aGF0IGluZm8sIHRvIG1h
a2UgbW9yZSBpbmZvcm1lZCBkZWNpc2lvbnM/CgpIb3cgd291bGQgZHJtX2h3Y29tcG9zZXIgZ2V0
IHRoZSBzYW1lIHJlc3VsdD8KCkknZCBwcmVmZXIgd2UganVzdCByZW1vdmUgdGhlIHN5c2ZzIG5v
ZGVzIGZyb20gdXBzdHJlYW0gdW5sZXNzIHdlIGhhdmUKYW4gdXBzdHJlYW0gdXNlciBmb3IgdGhl
bS4KCkRhdmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
