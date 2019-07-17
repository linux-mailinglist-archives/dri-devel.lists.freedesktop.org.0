Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A926CA0E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 09:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FAF6E326;
	Thu, 18 Jul 2019 07:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC45D6E151
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 16:32:02 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id v18so24243551ljh.6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 09:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:to:from:subject:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:content-language
 :content-transfer-encoding;
 bh=E75NjAXiWhvCZvdE/u04pYeja5zqL3MqVrXHa7H4HfY=;
 b=KQ+C9+9BrhpPzT/fw3/CYRBCl0Hmb0fTpv0bd5u0QipRZjrHtNT1GC9AUHERYqyGjI
 AZAkU6Hqsscl3ZfMCHhrpCJTk+O3fzGsaRuhDne9UtNuVyfAN5xzMftpn6ejaAAwJK69
 rzsl15/OYQBA9zCEtnaYfknPoUWI0eACSYxHo7lhkoiSHWXZp7TTr1rztbua5/vs+s4P
 iec/HdvFgr6/xMLt352GNgnFeT19/MsooTKjKgFQCw7HJc6r4rr7fwkXBI8eMw3+dfnb
 GW9nYG4wpOhR75BTb6/x3zUPL3dNDSu8bGNk45WRYvz3JIgxNaM+JlQ9iVewKLcnnZtu
 eu4w==
X-Gm-Message-State: APjAAAWkxKdx01oaxQSFYys3rypMi9RkTsK4UXD+0j1o38IqZlxzx0wX
 v9Ye8gG7rIrE4NtrHMemXRE=
X-Google-Smtp-Source: APXvYqw8/yzTJs6CxTi/F2Af1OajkefZ36GPQOQNQraarNA3wXnfgWI3z9FIK37oPgVQgrECoeTI2A==
X-Received: by 2002:a2e:7604:: with SMTP id r4mr21491517ljc.225.1563381121256; 
 Wed, 17 Jul 2019 09:32:01 -0700 (PDT)
Received: from [192.168.42.115] ([213.87.160.6])
 by smtp.gmail.com with ESMTPSA id b17sm4573698ljf.34.2019.07.17.09.31.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jul 2019 09:32:00 -0700 (PDT)
To: Laura Abbott <labbott@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 arve@android.com, Todd Kjos <tkjos@android.com>,
 Martijn Coenen <maco@android.com>, Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <christian@brauner.io>,
 Riley Andrews <riandrews@android.com>, devel@driverdev.osuosl.org,
 linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Brian Starkey <brian.starkey@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Mark Brown <broonie@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Linux-MM <linux-mm@kvack.org>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@google.com>, syzkaller@googlegroups.com
From: Alexander Popov <alex.popov@linux.com>
Subject: Limits for ION Memory Allocator
Openpgp: preference=signencrypt
Autocrypt: addr=alex.popov@linux.com; prefer-encrypt=mutual; keydata=
 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
 jXz/74kjFsyRgZA+d6a1pGtOwITEBxtxxg==
Message-ID: <3b922aa4-c6d4-e4a4-766d-f324ff77f7b5@linux.com>
Date: Wed, 17 Jul 2019 19:31:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Thu, 18 Jul 2019 07:39:55 +0000
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
Reply-To: alex.popov@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8hCgpUaGUgc3l6a2FsbGVyIFsxXSBoYXMgYSB0cm91YmxlIHdpdGggZnV6emluZyB0aGUg
TGludXgga2VybmVsIHdpdGggSU9OIE1lbW9yeQpBbGxvY2F0b3IuCgpTeXprYWxsZXIgdXNlcyBz
ZXZlcmFsIG1ldGhvZHMgWzJdIHRvIGxpbWl0IG1lbW9yeSBjb25zdW1wdGlvbiBvZiB0aGUgdXNl
cnNwYWNlCnByb2Nlc3NlcyBjYWxsaW5nIHRoZSBzeXNjYWxscyBmb3IgdGVzdGluZyB0aGUga2Vy
bmVsOgogLSBzZXRybGltaXQoKSwKIC0gY2dyb3VwcywKIC0gdmFyaW91cyBzeXNjdGwuCkJ1dCB0
aGVzZSBtZXRob2RzIGRvbid0IHdvcmsgZm9yIElPTiBNZW1vcnkgQWxsb2NhdG9yLCBzbyBhbnkg
dXNlcnNwYWNlIHByb2Nlc3MKdGhhdCBoYXMgYWNjZXNzIHRvIC9kZXYvaW9uIGNhbiBicmluZyB0
aGUgc3lzdGVtIHRvIHRoZSBvdXQtb2YtbWVtb3J5IHN0YXRlLgoKQW4gZXhhbXBsZSBvZiBhIHBy
b2dyYW0gZG9pbmcgdGhhdDoKCgojaW5jbHVkZSA8c3lzL3R5cGVzLmg+CiNpbmNsdWRlIDxzeXMv
c3RhdC5oPgojaW5jbHVkZSA8ZmNudGwuaD4KI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxs
aW51eC90eXBlcy5oPgojaW5jbHVkZSA8c3lzL2lvY3RsLmg+CgojZGVmaW5lIElPTl9JT0NfTUFH
SUMJCSdJJwojZGVmaW5lIElPTl9JT0NfQUxMT0MJCV9JT1dSKElPTl9JT0NfTUFHSUMsIDAsIFwK
CQkJCSAgICAgIHN0cnVjdCBpb25fYWxsb2NhdGlvbl9kYXRhKQoKc3RydWN0IGlvbl9hbGxvY2F0
aW9uX2RhdGEgewoJX191NjQgbGVuOwoJX191MzIgaGVhcF9pZF9tYXNrOwoJX191MzIgZmxhZ3M7
CglfX3UzMiBmZDsKCV9fdTMyIHVudXNlZDsKfTsKCmludCBtYWluKHZvaWQpCnsKCXVuc2lnbmVk
IGxvbmcgaSA9IDA7CglpbnQgZmQgPSAtMTsKCXN0cnVjdCBpb25fYWxsb2NhdGlvbl9kYXRhIGRh
dGEgPSB7CgkJLmxlbiA9IDB4MTNmNjVkOGMsCgkJLmhlYXBfaWRfbWFzayA9IDEsCgkJLmZsYWdz
ID0gMCwKCQkuZmQgPSAtMSwKCQkudW51c2VkID0gMAoJfTsKCglmZCA9IG9wZW4oIi9kZXYvaW9u
IiwgMCk7CglpZiAoZmQgPT0gLTEpIHsKCQlwZXJyb3IoIlstXSBvcGVuIC9kZXYvaW9uIik7CgkJ
cmV0dXJuIDE7Cgl9CgoJd2hpbGUgKDEpIHsKCQlwcmludGYoIml0ZXIgJWx1XG4iLCBpKTsKCQlp
b2N0bChmZCwgSU9OX0lPQ19BTExPQywgJmRhdGEpOwoJCWkrKzsKCX0KCglyZXR1cm4gMDsKfQoK
CkkgbG9va2VkIHRocm91Z2ggdGhlIGNvZGUgb2YgaW9uX2FsbG9jKCkgYW5kIGRpZG4ndCBmaW5k
IGFueSBsaW1pdCBjaGVja3MuCklzIGl0IGN1cnJlbnRseSBwb3NzaWJsZSB0byBsaW1pdCBJT04g
a2VybmVsIGFsbG9jYXRpb25zIGZvciBzb21lIHByb2Nlc3M/CgpJZiBub3QsIGlzIGl0IGEgcmln
aHQgaWRlYSB0byBkbyB0aGF0PwpUaGFua3MhCgpCZXN0IHJlZ2FyZHMsCkFsZXhhbmRlcgoKClsx
XTogaHR0cHM6Ly9naXRodWIuY29tL2dvb2dsZS9zeXprYWxsZXIKWzJdOiBodHRwczovL2dpdGh1
Yi5jb20vZ29vZ2xlL3N5emthbGxlci9ibG9iL21hc3Rlci9leGVjdXRvci9jb21tb25fbGludXgu
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
