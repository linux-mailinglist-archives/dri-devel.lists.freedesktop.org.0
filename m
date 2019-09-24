Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7FBBD246
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 21:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F256EAE8;
	Tue, 24 Sep 2019 19:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9246EAE8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 19:00:55 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id b136so7145854iof.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 12:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/poXcNaPImsCkHOsb+IHz5eVbMSJsczlFsct2m7oOgc=;
 b=JK3r6g3leq7UN1Vr/zOnhnQsqXXm7TUWp330wTsyGlusBeDUj9q9lNhtIX0+Ak8dM7
 6G2FbEvWUPSwyfIPSuSCMc5OW0qyE49lDhbgYx+jStDJQULPO7O9D3xlVnMsGCQvQwS2
 TVs37zVh5a/X1RyWw/btvaVQf04cL5SJNUD0l3QoCzYD7bUMfNtEyvzRrKVAedl6ucPW
 YQO+2Hw36qpXE0jPYsT4mIDuj80pLNTfw3+Bdc3qmn0+0pP46NEvCmR+NZCx4iJNLfJr
 1zjAz4W7C8cVkfg/pGVmPJI/d6DLq1PK8jI1J1DPkzONylaw2hiXHX5PnqL46NVxt5s/
 Ac9w==
X-Gm-Message-State: APjAAAX3ZsA+yKNZ/PtrzQRFOtGxcafvRHVyfN29Urhp+Ho24VqLyL9s
 TS9t5+5qxp2UBSbSNoOSP9JFLNDb52milYe1DCg=
X-Google-Smtp-Source: APXvYqy/VoYXHn8FHc4GUb/SVvX9H/ShxuZ2vA5n7J/xs1YmNhW/qWGzu14sSS7Rn1ed3AM95fvhp3hDB5tF927bIYs=
X-Received: by 2002:a05:6638:3a5:: with SMTP id z5mr307586jap.95.1569351654867; 
 Tue, 24 Sep 2019 12:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190923134449.22326-1-aford173@gmail.com>
 <20190923134449.22326-2-aford173@gmail.com>
 <CAL_JsqJB54aTWNxh+FsEOBRFEWXBi6WZE3pzqo+LJWM781v-PQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJB54aTWNxh+FsEOBRFEWXBi6WZE3pzqo+LJWM781v-PQ@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 24 Sep 2019 14:00:43 -0500
Message-ID: <CAHCN7xJy4=gdSz5Thhy_be-NNFhf4FaJ=iv8=F3sXbPwaQu1xA@mail.gmail.com>
Subject: Re: [PATCH V2 2/3] dt-bindings: Add Logic PD Type 28 display panel
To: Rob Herring <robh+dt@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/poXcNaPImsCkHOsb+IHz5eVbMSJsczlFsct2m7oOgc=;
 b=sHJ1UGr+A5LvATOEjqybLlMDMbqFel8di7dayKOPx29Eq4zK27NF6UK61rwXBgsVS8
 ExvK/uGFmCIem6mJf6kDaCQHrK9znWnzSrGVx7ZFlR8FaTy5PNI7OkBRqMErhI7G6ylc
 lRzUNSWihhvzFiExeDyjpZpO0NiW9VSiLSvJoDTyeuTlrifxOkTqM8jr1JQ188OE8+cT
 DrzKZy08l9YqSJke2WvzO4iUxr+6ObioHkazKnkgqjMV08uGMSsOAfAc+sOROOHnK8Ze
 13vCc6G82L4dBo9XVWvaV1WMJrL0FLVmor3AFyXIB9OkMqcwcebvN6Wx1Y/he54s8kQC
 DC+Q==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Adam Ford <adam.ford@logicpd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-omap <linux-omap@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgMTo1NiBQTSBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgU2VwIDIzLCAyMDE5IGF0IDg6NDUgQU0gQWRhbSBG
b3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IFRoaXMgcGF0Y2ggYWRkcyBk
b2N1bWVudGF0aW9uIG9mIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUgV1ZHQSBwYW5lbAo+
ID4gTG9naWMgUEQgVHlwZSAyOCBkaXNwbGF5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFkYW0g
Rm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPgo+ID4gLS0tCj4gPiBWMjogIFVzZSBZQU1MIGluc3Rl
YWQgb2YgVFhUIGZvciBiaW5kaW5nCj4KPiBGYWlscyB0byBidWlsZCB3aXRoICdtYWtlIGR0X2Jp
bmRpbmdfY2hlY2snOgo+Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8xMTY2
MDU3Lwo+Cj4gTG9va3MgbGlrZSBhIHRhYiBjaGFyYWN0ZXIgdXNlZCBwZXJoYXBzLgoKSSBhbSBu
b3QgZmFtaWxpYXIgd2l0aCB5YW1sLiAgSSB0aG91Z2h0IEkgY29waWVkIGFuIGV4aXN0aW5nIGZp
bGUgYnV0CmFwcGFyZW50bHkgaXQgZGlkbid0IHdvcmsuICBJcyB0aGVyZSBhIHJlY29tbWVuZGVk
IGVkaXRvciB0aGF0IGtub3cKdGhpcyBtYXJrdXAgbGFuZ3VhZ2U/ICBCZXR0ZXIgeWV0LCBpcyB0
aGVyZSBhIHNjcmlwdCBJIGNhbiBydW4gdG8KY29udmVydCBhIHRleHQgZmlsZSB0byB0aGUgeWFt
bD8KCmFkYW0KPgo+IFJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
