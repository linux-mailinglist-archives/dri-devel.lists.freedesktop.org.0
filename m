Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EF8ABF78
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 20:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C9C6E0AD;
	Fri,  6 Sep 2019 18:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6956E067
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 18:36:19 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id y91so7137173ede.9
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2019 11:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=lO0nmJGj3qNeZy1jblunupcejeIOLFHpQMS8i+3jAJM=;
 b=GnNQhMcQq5DYqXZIqCzj/+Fxp88ikt7D4VFW4LDZ9eYDlPiyS2jPPoYQN2W+7c4SaL
 GA8aqfl4Q17S6BVx2nf3RQAHrz6WzoRQRdAfJ37RqR2VQu6ltgnXSU9u0Ceg+5+7T8hM
 CEoOUxgMBsjgXqySNcW1T5ZAjiCtoMiG1sYZzWJiiPMgx75AKXM0PjDJc4nco6wg8gFC
 Hj4g/BmB9LioaXZWeUYkusoSEQF2rSkltfNlC1uG4Tg09CulktcKSNH5Yxo7BQEWNNQL
 u2jxo4WJVz2fKECHMnEfnI1R/fm2qrsAWEfpAmk2ip8SzAwCeSYTz8enfkxnQKG2IL8h
 mMrQ==
X-Gm-Message-State: APjAAAUk3CNuB0GoX7vz9nDPvHszxyc4l/gvrcT0fQe+vPHWhVQFFsYZ
 BmWl29Aeqy1XMTczsSGuDD7eUul1J2E=
X-Google-Smtp-Source: APXvYqx789yzKS2n919Rr3nMiD7uU3gkBYDT8XJuEaRGbxTk9pLWcj32Sf9U9K93tl8wsjTyy9EXmA==
X-Received: by 2002:a17:906:1c46:: with SMTP id
 l6mr8652259ejg.304.1567794978426; 
 Fri, 06 Sep 2019 11:36:18 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id mh8sm654618ejb.74.2019.09.06.11.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 11:36:17 -0700 (PDT)
Date: Fri, 6 Sep 2019 20:36:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] fbdev/sa1100fb: Remove even more dead code
Message-ID: <20190906183615.GH3958@phenom.ffwll.local>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20190906151307.1127187-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906151307.1127187-1-arnd@arndb.de>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=lO0nmJGj3qNeZy1jblunupcejeIOLFHpQMS8i+3jAJM=;
 b=T69/NHgSRutH4MVQh4miV96D5Jy263UZJjwn3l9XZ00mlMus91OVBApb3qHZA+1PnS
 Ds8ho7fY0qEIQAJzR0Sf5dQt+RnwjBr4g5tblNF0pjifa8dFBR1hUP8GmB2CruSuPHPS
 d04b49rz+oyCgtPWI3Dms5bUXn9f2UP1Mrrgs=
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Viresh Kumar <viresh.kumar@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDU6MTM6MDBQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBUaGlzIGZ1bmN0aW9uIGxvc3QgaXRzIG9ubHkgY2FsbCBzaXRlIGFzIHBhcnQgb2YK
PiBlYXJsaWVyIGRlYWQgY29kZSByZW1vdmFsLCBzbyByZW1vdmUgaXQgYXMgd2VsbDoKPiAKPiBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L3NhMTEwMGZiLmM6OTc1OjIxOiBlcnJvcjogdW51c2VkIGZ1bmN0
aW9uICdzYTExMDBmYl9taW5fZG1hX3BlcmlvZCcgWy1XZXJyb3IsLVd1bnVzZWQtZnVuY3Rpb25d
Cj4gCj4gRml4ZXM6IDM5MGU1ZGUxMTI4NCAoImZiZGV2L3NhMTEwMGZiOiBSZW1vdmUgZGVhZCBj
b2RlIikKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKUXVl
dWQgZm9yIDUuNSBpbiBkcm0tbWlzYy1uZXh0IHNpbmNlIEJhcnQgaXMgYXdheSBmcm9tIG1lcmdl
IGR1dGllcyB1bnRpbAplbmQgb2YgdGhpcyBtb250aC4KLURhbmllbAo+IC0tLQo+ICBkcml2ZXJz
L3ZpZGVvL2ZiZGV2L3NhMTEwMGZiLmMgfCAxMyAtLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRl
di9zYTExMDBmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9zYTExMDBmYi5jCj4gaW5kZXggYWUy
YmNmZWUzMzhhLi44MWFkM2FhMWNhMDYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRl
di9zYTExMDBmYi5jCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9zYTExMDBmYi5jCj4gQEAg
LTk2NywxOSArOTY3LDYgQEAgc3RhdGljIHZvaWQgc2ExMTAwZmJfdGFzayhzdHJ1Y3Qgd29ya19z
dHJ1Y3QgKncpCj4gIH0KPiAgCj4gICNpZmRlZiBDT05GSUdfQ1BVX0ZSRVEKPiAtLyoKPiAtICog
Q2FsY3VsYXRlIHRoZSBtaW5pbXVtIERNQSBwZXJpb2Qgb3ZlciBhbGwgZGlzcGxheXMgdGhhdCB3
ZSBvd24uCj4gLSAqIFRoaXMsIHRvZ2V0aGVyIHdpdGggdGhlIFNEUkFNIGJhbmR3aWR0aCBkZWZp
bmVzIHRoZSBzbG93ZXN0IENQVQo+IC0gKiBmcmVxdWVuY3kgdGhhdCBjYW4gYmUgc2VsZWN0ZWQu
Cj4gLSAqLwo+IC1zdGF0aWMgdW5zaWduZWQgaW50IHNhMTEwMGZiX21pbl9kbWFfcGVyaW9kKHN0
cnVjdCBzYTExMDBmYl9pbmZvICpmYmkpCj4gLXsKPiAtCS8qCj4gLQkgKiBGSVhNRTogd2UgbmVl
ZCB0byB2ZXJpZnkgX2FsbF8gY29uc29sZXMuCj4gLQkgKi8KPiAtCXJldHVybiBzYTExMDBmYl9k
aXNwbGF5X2RtYV9wZXJpb2QoJmZiaS0+ZmIudmFyKTsKPiAtfQo+IC0KPiAgLyoKPiAgICogQ1BV
IGNsb2NrIHNwZWVkIGNoYW5nZSBoYW5kbGVyLiAgV2UgbmVlZCB0byBhZGp1c3QgdGhlIExDRCB0
aW1pbmcKPiAgICogcGFyYW1ldGVycyB3aGVuIHRoZSBDUFUgY2xvY2sgaXMgYWRqdXN0ZWQgYnkg
dGhlIHBvd2VyIG1hbmFnZW1lbnQKPiAtLSAKPiAyLjIwLjAKPiAKCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
