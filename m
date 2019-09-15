Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3A8B30CD
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2019 18:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9966E094;
	Sun, 15 Sep 2019 16:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 366 seconds by postgrey-1.36 at gabe;
 Sun, 15 Sep 2019 16:03:29 UTC
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23B86E094
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 16:03:29 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-yjQD-Id4NQqe0KZODeWfkQ-1; Sun, 15 Sep 2019 11:57:20 -0400
Received: by mail-ed1-f72.google.com with SMTP id s3so3235692edr.15
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 08:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MJ9fhJA7r6kDPnaOWkkSmmCJSiduWVh74qish7keTII=;
 b=geV6kV8Apf2VuHNOl7TS6cY5PkRnyXpkdETFksv5pTJdmWp9k6nQLuxyHnw6sPrNeP
 eKKxpVWThqYJJS5vS095roLb80LolsVLD1DMYMSbjH8ccjrfF/bgNqntJ9ePaMWs8cTo
 mshCj5OWbxjN/7Ayse0pEgbwZ+8H8sWCwMQthEiYJ3D4l1hEL0lZIGt3xI2pvrB9pQvz
 c5B6C2D2950rDbWXNVLWMB1EjWL7UOAfySYkQFjeED26iia29B+t5WqNeC3R9SUFPEZq
 oUXVGUlVKPGNDL1iKYU7Loz89NzE9IE/yu/Eqni72Go1yTCFzkdwuwO82Vc87g8nZdMW
 Vn4Q==
X-Gm-Message-State: APjAAAUL9sVaF5aOwN0VHbQRRMY3MeQHaksI4WLOWssj8GQnw4Idi8Fl
 1D8MIIFkvC3ahRX1v1J1JxKqWosrHxqV7U+2m2R8qURwlQoPWqXcSH345QYxCH1hz1/eXjVrhx5
 UrsUddlgDmYUFLnOIOQ4EYYBuOW63
X-Received: by 2002:aa7:c586:: with SMTP id g6mr36830292edq.38.1568563038682; 
 Sun, 15 Sep 2019 08:57:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy9LXM6Rmx5RdhVk3BCS+Ruj2EACeM83RZ4LTG8b3e1iiB+ydIwSx81jBNzJcUoBFomrt0ijQ==
X-Received: by 2002:aa7:c586:: with SMTP id g6mr36830284edq.38.1568563038539; 
 Sun, 15 Sep 2019 08:57:18 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id g15sm410404edp.0.2019.09.15.08.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2019 08:57:17 -0700 (PDT)
Subject: Re: Recent tinydrm -> tiny drm drivers rename causes kernel-doc
 problems
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <d83a5434-00df-89cb-e0cf-3318fc12d3e8@redhat.com>
 <40883d3d-44d8-df51-ccc5-a1ecbbbf8827@tronnes.org>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <ea1ad9bf-834a-37c5-c350-97052a757669@redhat.com>
Date: Sun, 15 Sep 2019 17:57:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <40883d3d-44d8-df51-ccc5-a1ecbbbf8827@tronnes.org>
Content-Language: en-US
X-MC-Unique: yjQD-Id4NQqe0KZODeWfkQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1568563408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fkNbnzbGlBT0AP2EFBJQYF5OiWfSCZjZ3DvSCz9LBFo=;
 b=aeNCh7Pb2KpgC+srGkhvoxNFFafe89rgHPEwipaZYuaQSokJ4qGG1sBZOfs4TlaEgE2y8x
 TUA/jzfq68Szkd1CrGaLhamd7ScrqpLyRGU/nchFboLrdRq0O/2zxwxi5uONTiHnymBNd1
 bG5sE9EIPPSsXdTdToiQsq+tIjeKXuk=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxNS0wOS0yMDE5IDE3OjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gSGkgSGFu
cywKPiAKPiBEZW4gMTUuMDkuMjAxOSAxNi4zMiwgc2tyZXYgSGFucyBkZSBHb2VkZToKPj4gSGkg
Tm9yYWxmLAo+Pgo+PiBXaGlsZSBkb2luZyBhICJtYWtlIGh0bWxkb2NzIiBJIGp1c3Qgbm90aWNl
ZCB0aGUgZm9sbG93aW5nIGVycm9yczoKPj4KPj4gRXJyb3I6IENhbm5vdCBvcGVuIGZpbGUgLi9k
cml2ZXJzL2dwdS9kcm0vdGlueWRybS9jb3JlL3Rpbnlkcm0taGVscGVycy5jCj4+IEVycm9yOiBD
YW5ub3Qgb3BlbiBmaWxlIC4vZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vY29yZS90aW55ZHJtLWhl
bHBlcnMuYwo+PiBFcnJvcjogQ2Fubm90IG9wZW4gZmlsZSAuL2RyaXZlcnMvZ3B1L2RybS90aW55
ZHJtL2NvcmUvdGlueWRybS1waXBlLmMKPj4gRXJyb3I6IENhbm5vdCBvcGVuIGZpbGUgLi9kcml2
ZXJzL2dwdS9kcm0vdGlueWRybS9jb3JlL3Rpbnlkcm0tcGlwZS5jCj4+IEVycm9yOiBDYW5ub3Qg
b3BlbiBmaWxlIC4vZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vbWlwaS1kYmkuYwo+PiBFcnJvcjog
Q2Fubm90IG9wZW4gZmlsZSAuL2RyaXZlcnMvZ3B1L2RybS90aW55ZHJtL21pcGktZGJpLmMKPj4g
RXJyb3I6IENhbm5vdCBvcGVuIGZpbGUgLi9kcml2ZXJzL2dwdS9kcm0vdGlueWRybS9taXBpLWRi
aS5jCj4+Cj4+IEl0IGxvb2tzIGxpa2Ugc29tZSBvZiB0aGUgcnN0IGZpbGUgcmVmZXJlbmNlcyB0
byB0aW55ZHJtIHJlbGF0ZWQKPj4gdGhpbmdzIG5lZWQgdXBkYXRpbmcuCj4+Cj4gCj4gSSBkb24n
dCB1bmRlcnN0YW5kIGhvdyB5b3UgZ2V0IHRob3NlIGVycm9ycywgdGhlIGZpbmFsIHRpbnlkcm0g
ZG9jCj4gcmVmZXJlbmNlIHdhcyByZW1vdmVkIGluIGNvbW1pdDogZHJtL3Rpbnlkcm06IE1vdmUg
bWlwaS1kYmkKPiAKPiBodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYy9j
b21taXQ/aWQ9MTc0MTAyZjRkZTIzMGExYmY4NWU2ZWYyZjhjODNlNTBiM2JhMjJjOQoKVWdoLCB0
aGlzIGlzIG15IGJhZCwgSSBoYXZlIGNoZXJyeS1waWNrZWQgcGFydCBvZiB0aGUgc2VyaWVzIGFz
IGJhc2UKZm9yIHRoZSBnbTEydTMyMCBjbGVhbnVwIHNlcmllcywgYnV0IG5vdCBhbGwgb2YgdGhl
bSwgc29ycnkgZm9yIHRoZSBub2lzZS4KClJlZ2FyZHMsCgpIYW5zCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
