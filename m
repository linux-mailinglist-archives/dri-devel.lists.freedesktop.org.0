Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5B8A7651
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 23:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF69189700;
	Tue,  3 Sep 2019 21:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5DB892A6;
 Tue,  3 Sep 2019 21:36:13 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id w6so8730371lfl.2;
 Tue, 03 Sep 2019 14:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5c3lERoSBFKARRSEJjybtuQrS47BHT/FjEnyYEyNFQ4=;
 b=Kdjf4+aPsV0KC0My497IpetFjr43kJWP+GDRCuEP9nPbOm9jejanSZILRRkenNzdrY
 rtNp5fAoooD+yMWuyTQYPfwBzfbNyxm4cDa0vfnVo6RQiaOMB6xAc+ETQskFUvBqSX/B
 hTOVCN/XzSH4tpCVKiMdG29OfDyv9G4TsJl0nA5Y/MujKB60niRd68rmhMYUkqdL1d37
 1FQ34bmJOB659tNqlvETVBuYRj2t7MrCAzkcx93hpSRoxp7Nm011HBLKTYZv/0qt/ca7
 v9IGKScFMKB7SaZhUkmPzu9+8d7EBt1Vx6NF4TO66u5RWq3OJoQXhC8u7J9tV+RpjhfB
 Lvaw==
X-Gm-Message-State: APjAAAUg9PUe3sdIrI3tVgbWSCY9q8It3TWNjp0GXVRjkWeiMOidMPbC
 BAJlTkdVrIzrtmSOonXgjadgYkjjBn8wPbB6GW9qXg==
X-Google-Smtp-Source: APXvYqy2qhVjfLBh6LUVY+Z+vrZrMk+8/5OQwcJmo6NhFVQ3s89dwyA3XcD5DyAwHt4sP/Hll/Nzd4MOCtCsqEAmtqg=
X-Received: by 2002:ac2:530e:: with SMTP id c14mr11866722lfh.165.1567546571837; 
 Tue, 03 Sep 2019 14:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190903204645.25487-1-lyude@redhat.com>
 <20190903204645.25487-7-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-7-lyude@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 4 Sep 2019 07:35:59 +1000
Message-ID: <CAPM=9tx1vQMEsw4VjDVCbDYFUiaeHNCfP09aiSxnPnucQuB1JQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/27] drm/dp_mst: Combine redundant cases in
 drm_dp_encode_sideband_req()
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5c3lERoSBFKARRSEJjybtuQrS47BHT/FjEnyYEyNFQ4=;
 b=dxm8P2Ly/msbsWBeFRBcnitifyB3atAXYLi82sF0F0mHuVQSC6s5gkHpC87cEgYLt4
 f34KoYIhlfFxD3mXnngj8ImCRMTbWdei5YasUPMWWS/n/+jq9Wbn1kLrr0qrh7NXmfvN
 wSZjXyWYR130Jp31Zoq+YIYqVKcSCdgw1hc6bpSSOXSbjAbb7PDBY8f62BlbEa6UjUmY
 SuBoCbno0obv6HEu6lgdwrhqw237KiEFBG88Fmux0Tqbkn5Y/awAvyTtHXaneQJe9Bsy
 lxQMgKiSOohBTdUaheExu2nfYZMLqWEuzMqgOMlYr93Wxf/F0niZ4qroBYnH8aRfBgXA
 Kg2A==
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
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Harry Wentland <hwentlan@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Juston Li <juston.li@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA0IFNlcCAyMDE5IGF0IDA2OjQ4LCBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29t
PiB3cm90ZToKPgo+IE5vdGljZWQgdGhpcyB3aGlsZSB3b3JraW5nIG9uIGFkZGluZyBhIGRybV9k
cF9kZWNvZGVfc2lkZWJhbmRfcmVxKCkuCj4gRFBfUE9XRVJfRE9XTl9QSFkvRFBfUE9XRVJfVVBf
UEhZIGJvdGggdXNlIHRoZSBzYW1lIHN0cnVjdCwgc28gd2UgY2FuCj4ganVzdCBjb21iaW5lIHRo
ZWlyIGNhc2VzLgoKYm90aCB1c2UgdGhlIHNhbWUgc3RydWN0IGFzIGVudW0gcGF0aCByZXNvdXJj
ZXM/CgpTaW5jZSBvdGhlcndpc2UgdGhlIHBhdGNoIGRvZXNuJ3QgbWFrZSBzZW5zZS4KCldpdGgg
dGhhdCBmaXhlZDoKUmV2aWV3ZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
