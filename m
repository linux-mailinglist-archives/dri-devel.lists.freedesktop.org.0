Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9605D5C4A4
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C768989B9F;
	Mon,  1 Jul 2019 20:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466C889B66
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 16:01:46 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id n9so79415wmi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2019 09:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ehbX0A6FOUos8Li/RKI8TkgMSZDvG78bNwRzFM6xHgE=;
 b=lbAZYS2Yk64F17Zg7CfOj33369eN+dnx7e8g+vGbK2gPg/kBd1kZOQf4HJYE7gYMeQ
 FNzWOXCb5ONGCTbuLekccRTp+mePiAEdJlOuEpM3SgdveWW+4DwEgdBCbfCbm+pgGfWV
 J/fkwFSPxCuc2scRoJ/f1MrSZsjlT3sf3/oMRqLJa6tEBaHfUaf+SFN6kNefTzUtHUQ1
 ju3EkKBHXlK0u3Ee4xfvNiTIcQ1jn3wjj1vw/1/7YmIVMs1pc3YGlkY3hWyWCRSwvqXK
 kkpzAe8srbWaN8j10SAl8IpHUw8FzAQyIW4CNvuDm0UU37aS870+tqGUYFaE241OP6c/
 eiSQ==
X-Gm-Message-State: APjAAAV047/aQy8FacQZdnq875A2P1+rLWWUtiNvO4oXuCz255cfovb9
 PdrXQWgz7Vc5zhxyg6a3YUE=
X-Google-Smtp-Source: APXvYqyldw/ezw7fQEQn4F+5KG6hwTiGS+nIX5aCHURtyv2EM6g1Wmn0lcRj6drqBxSlvZJ8JVwU6A==
X-Received: by 2002:a7b:cbcb:: with SMTP id n11mr16322wmi.146.1561996904573;
 Mon, 01 Jul 2019 09:01:44 -0700 (PDT)
Received: from Timur-XPS ([152.66.80.213])
 by smtp.gmail.com with ESMTPSA id 31sm7827889wre.55.2019.07.01.09.01.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 09:01:43 -0700 (PDT)
Message-ID: <627b7fff64edcba0f8d8b5ced79a351821c419c7.camel@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>, Mika Westerberg
 <mika.westerberg@linux.intel.com>
Date: Mon, 01 Jul 2019 18:01:42 +0200
In-Reply-To: <c3b38b60-7c1a-730d-8de0-e3c880902003@daenzer.net>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <c3b38b60-7c1a-730d-8de0-e3c880902003@daenzer.net>
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=ehbX0A6FOUos8Li/RKI8TkgMSZDvG78bNwRzFM6xHgE=;
 b=tRDP9qd3uEe003ytI4aPxvK2LEz2WD1RDGR6Vtmb3I5Q+52GXuvlXb/o/BuctcnpRx
 EPTOcO0YDVyp+R6XExTpTNcTHpy8JWrdWiZCRvjnHtyRuijtIJr1uYyAfcZjFGHqtnaM
 j1X9a6r3oPtpfV6pCXzH6K3RjbhROIHlLuNqGFfjfJ7ZhRb2ZY186baJu3KA0XL19syC
 ea84iLu2WtglU87MyAsZ3mE1Tu/tjoWpHOAdfP9tLDpUJbUa3tqzfoCyUJy9yL3pKxRv
 5UoarwY3hKZGQYoqlk+pb6dUBpPMR4OfJtAiaV1f5KtwllT9H6QR2DqTxfaV6JMmcrX4
 1tAw==
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
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA3LTAxIGF0IDE2OjU0ICswMjAwLCBNaWNoZWwgRMOkbnplciB3cm90ZToK
PiBPbiAyMDE5LTA2LTI4IDI6MjEgcC5tLiwgVGltdXIgS3Jpc3TDs2Ygd3JvdGU6Cj4gPiBJIGhh
dmVuJ3QgZm91bmQgYSBnb29kIHdheSB0byBtZWFzdXJlIHRoZSBtYXhpbXVtIFBDSWUgdGhyb3Vn
aHB1dAo+ID4gYmV0d2VlbiB0aGUgQ1BVIGFuZCBHUFUsCj4gCj4gYW1kZ3B1LmJlbmNobWFyaz0z
Cj4gCj4gb24gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUgd2lsbCBtZWFzdXJlIHRocm91Z2hwdXQg
Zm9yIHZhcmlvdXMKPiB0cmFuc2Zlcgo+IHNpemVzIGR1cmluZyBkcml2ZXIgaW5pdGlhbGl6YXRp
b24uCgpUaGFua3MsIEkgd2lsbCBkZWZpbml0ZWx5IHRyeSB0aGF0LgpJcyB0aGlzIHRoZSBvbmx5
IHdheSB0byBkbyB0aGlzLCBvciBpcyB0aGVyZSBhIHdheSB0byBiZW5jaG1hcmsgaXQKYWZ0ZXIg
aXQgYWxyZWFkeSBib290ZWQ/Cgo+ID4gYnV0IEkgZGlkIHRha2UgYSBsb29rIGF0IEFNRCdzIHN5
c2ZzIGludGVyZmFjZSBhdAo+ID4gL3N5cy9jbGFzcy9kcm0vY2FyZDEvZGV2aWNlL3BjaWVfYncg
d2hpY2ggd2hpbGUgcnVubmluZyB0aGUKPiA+IGJvdHRsZW5lY2tlZAo+ID4gZ2FtZS4gVGhlIGhp
Z2hlc3QgdGhyb3VnaHB1dCBJIHNhdyB0aGVyZSB3YXMgb25seSAyLjQzIEdiaXQgL3NlYy4KPiAK
PiBQQ0llIGJhbmR3aWR0aCBnZW5lcmFsbHkgaXNuJ3QgYSBib3R0bGVuZWNrIGZvciBnYW1lcywg
c2luY2UgdGhleQo+IGRvbid0Cj4gY29uc3RhbnRseSB0cmFuc2ZlciBsYXJnZSBkYXRhIHZvbHVt
ZXMgYWNyb3NzIFBDSWUsIGJ1dCBzdG9yZSB0aGVtIGluCj4gdGhlIEdQVSdzIGxvY2FsIFZSQU0s
IHdoaWNoIGlzIGNvbm5lY3RlZCBhdCBtdWNoIGhpZ2hlciBiYW5kd2lkdGguCgpUaGVyZSBhcmUg
cmVhc29ucyB3aHkgSSB0aGluayB0aGUgcHJvYmxlbSBpcyB0aGUgYmFuZHdpZHRoOgoxLiBUaGUg
c2FtZSBpc3N1ZXMgZG9uJ3QgaGFwcGVuIHdoZW4gdGhlIEdQVSBpcyBub3QgdXNlZCB3aXRoIGEg
VEIzCmVuY2xvc3VyZS4KMi4gSW4gY2FzZSBvZiByYWRlb25zaSwgdGhlIHByb2JsZW0gd2FzIG1p
dGlnYXRlZCBvbmNlIE1hcmVrJ3MgU0RNQQpwYXRjaCB3YXMgbWVyZ2VkLCB3aGljaCBodWdlbHkg
cmVkdWNlcyB0aGUgUENJZSBiYW5kd2lkdGggdXNlLgozLiBJbiBsZXNzIG9wdGltaXplZCBjYXNl
cyAoZm9yIGV4YW1wbGUgRDlWSyksIHRoZSBwcm9ibGVtIGlzIHN0aWxsCnZlcnkgbm90aWNhYmxl
LgoKQmVzdCByZWdhcmRzLApUaW0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
