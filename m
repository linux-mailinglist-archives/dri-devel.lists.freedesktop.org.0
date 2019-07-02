Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D42055CD73
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 12:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C573989AC2;
	Tue,  2 Jul 2019 10:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380D989B11
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 10:23:41 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id c4so113962uad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 03:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tafKFW2tbKFip78WVBya7CouDwPtr3kMlmLoBhnp0QU=;
 b=Oy3SiTnx+L0j7zwuDR8LRKSutjByQXhHSm+30eYe7HbDxWBz0KNWmP1fQjrzI6qbVs
 rbxxM8cl3dr9r6r0pJP98age02tm1Zg3R6G9bNlkJIwUAhXav1jHtYB9zk27LlxxQTkT
 hH8yp00sej/r6g9NKD5p6f7zsTDL4RakjvB2J0OAT66BLvNQ6OIZPqC8SD4IuuAny3x4
 so5BMGXb5ADxVjMNUhwRz8S2D0zhoztY0IAxeFq7s8vCJDyp/9OVqDQZ321O6CAfaxq6
 11X4tNKDpl/wyCy2EKeI1WM4qfXzqMKDmiXSG7bCG+GhXDsiYUy5ezgHXgNwFL2PILqg
 sd8Q==
X-Gm-Message-State: APjAAAXvnLKjOoBezzc8tYpZMJ4bGxh1cvA/NehdM6DKMMdktmLIDGS7
 g1Rmd2u/6pjE+QKOy1rOyFsCxbVBlyFQ6QeJVkM=
X-Google-Smtp-Source: APXvYqx/0yclapm6mhaX4axPrdwHdxxm0v9N1Zt3yV+h5yDdvvJOJSbgYafSKpT3EEmbvf7PxhFClRlz/4AbFv0c3Qk=
X-Received: by 2002:ab0:2556:: with SMTP id l22mr12073210uan.46.1562063020307; 
 Tue, 02 Jul 2019 03:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190702080139.21814-1-tzimmermann@suse.de>
 <20190702080139.21814-6-tzimmermann@suse.de>
 <20190702092023.dv4sveiqb7s3k5ne@sirius.home.kraxel.org>
In-Reply-To: <20190702092023.dv4sveiqb7s3k5ne@sirius.home.kraxel.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Jul 2019 11:23:52 +0100
Message-ID: <CACvgo50hk5y8xf4u9g2=h=i05vXWmQ32EyNfL+4V=049zcAd1Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm/vram: Don't export driver callback functions
 for PRIME
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=tafKFW2tbKFip78WVBya7CouDwPtr3kMlmLoBhnp0QU=;
 b=bNIKy75wg5anNWcWHcj7W4q61ylb/XilZif1IdLAYevCj3xLLsoNyoidUmp3BJP6r4
 4N7oEpTV3ZrWflI/CXpNmYSry96+l/nZ3NBtoWGhDlmyL7/zD24IjQxCdfFyfcYkKakK
 cM8ixI73rO0ikIuqYZM+C/9ZDYVrGo+mQqne/cpT/iL77xyB8NDQYg+rgKAm6TB4FbrW
 0k/Mfnfi+XvQ24yfjPSRKq20i3XcXANFNpaw12QCUQoJN858DB1eEW5OIzsAN5f714CO
 C1/QlcUXOrUDZ6bG4q0os8f0B0Si4DSKzFJ/kCsH1b8y/WcBUIeNP/GOT58pAyvvorbj
 Xyyw==
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
Cc: Sean Paul <sean@poorly.run>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rongrong Zou <zourongrong@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyIEp1bCAyMDE5IGF0IDEwOjIwLCBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPiAgIEhpLAo+Cj4gPiArc3RhdGljIHZvaWQgZHJtX2dlbV92cmFtX29i
amVjdF9mcmVlKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtKQo+ID4gK3sKPiA+ICsgICAgIHN0
cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpnYm8gPSBkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKGdlbSk7
Cj4gPiArCj4gPiArICAgICBkcm1fZ2VtX3ZyYW1fcHV0KGdibyk7Cj4gPiArfQo+Cj4gSG1tLCBz
ZWVtcyBnaXQgZGlmZiBkaWRuJ3QgZmlndXJlIGl0J3MgdGhlIHNhbWUgZnVuYyBqdXN0IHJlbmFt
ZWQKPiAobGlrZXdpc2UgcGluL3VucGluL3ZtYXAvdnVubWFwKS4gIE1heWJlICJnaXQgZGlmZiAt
LW1pbmltYWwiIGdpdmVzCj4gYmV0dGVyIHJlc3VsdHMgaGVyZS4gIFBsYWNpbmcgdGhlIG9iamVj
dF9mdW5jcyBzdHJ1Y3QgKHBhdGNoIDEpIGF0IHRoZQo+IGVuZCBvZiB0aGUgZmlsZSBtaWdodCBo
ZWxwIHRvby4KPgpZZXMgcGxlYXNlLgoKPiA+IC0vKioKPiA+IC0gKiBkcm1fZ2VtX3ZyYW1fZHJp
dmVyX2dlbV9mcmVlX29iamVjdF91bmxvY2tlZCgpIC0gXAo+ID4gLSAgICAgSW1wbGVtZW50cyAm
c3RydWN0IGRybV9kcml2ZXIuZ2VtX2ZyZWVfb2JqZWN0X3VubG9ja2VkCj4gPiAtICogQGdlbTog
ICAgIEdFTSBvYmplY3QuIFJlZmVycyB0byAmc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QuZ2Vt
Cj4gPiAtICovCj4KPiBJIHRoaW5rIHdlIHNob3VsZCBrZWVwIHRoZSBkb2N1bWVudGF0aW9uIC4u
Lgo+Cj4gPiAtRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dlbV9mcmVlX29iamVj
dF91bmxvY2tlZCk7Cj4KPiBBbmQgdGhlIEVYUE9SVF9TWU1CT0wgdG9vLgo+Cj4gRHJpdmVycyBt
aWdodCB3YW50IHJvbGwgdGhlaXIgb3duIHZlcnNpb24gb2YgZHJtX2dlbV9vYmplY3RfZnVuY3Ms
Cj4gd2l0aCBzb21lIG9mIHRoZSBmdW5jdGlvbnMgcmVwbGFjZWQgYnkgZHJpdmVyLXNwZWNpZmlj
IHZlcnNpb25zIGluCj4gY2FzZSB0aGV5IGhhdmUgc29tZSBleHRyYSB3b3JrIHRvIGRvLgo+Cktl
ZXBpbmcgdGhlIGNvbW1lbnQgc291bmRzIHJlYXNvbmFibGUgSU1ITy4gQWx0aG91Z2ggSSdtIGxl
c3Mgc3VyZQphYm91dCBFWFBPUlRfU1lNQk9MLgpJZiB5b3UgaGF2ZSBXSVAgc2VyaWVzIHRoYXQg
bWFrZXMgdXNlIG9mIGl0LCBzdXJlLiBPdGhlcndpc2UgYW55CmRyaXZlciB3YW50cyB0byB1c2Ug
aXQsIHRoZXkgY2FuIHRyaXZpYWxseSByZWluc3RhdGUgdGhhdC4KCldpdGggdGhlIG5pdHBpY2tz
IGFib3ZlLCBmb3IgdGhlIHNlcmllczoKUmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52
ZWxpa292QGNvbGxhYm9yYS5jb20+CgotRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
