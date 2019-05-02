Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD1C12199
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 20:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF4E89624;
	Thu,  2 May 2019 18:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8173896C7
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 18:03:52 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id bi2so1364671plb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 11:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KwVol6+NAKSj5claaoAPzFfVv/0b5wE9kH8oSQrsELw=;
 b=l4m+ES0oM0OVHsbeYUTZ8ZTO7WeXNkq5u8ltrKbUnZcZ+x772Jb4FyiUo3ZDpGxjp2
 kxpIxlCug6VnkJXoU3NMQ+UMBxz4Ryp/PkaKPcnPjNOCFato/IUJARMiQBBWVUaZsp/y
 c0HTe3tI9XGVIQIrVIgjyIsDOOM1AsFYhAj5pWLSWxoSLXzp589qOIfw+tU2mUfOKpJz
 50Svsu+b/xxGTO9Basqi1a9HBB+G1sDD+bgi4HFhqtvBav0eHCCsUdcKrzBhJffMyWl5
 eB4vGbxni2zxJ+Qdnj+heyToyDP3CnHHkdY70CCVSsG28XNv9kDDMCV94/7ZgfNNuXDA
 Kmow==
X-Gm-Message-State: APjAAAXHvi8WTFue1zetDx1fI8pyF1r3ZOv2mHNe0+JPcvF1iCd6y4C2
 tve2Whxqt6er18IYA1Yr5dcxihiHT74=
X-Google-Smtp-Source: APXvYqxdQTwKKcU21LwdRQIjdVvZ98Sfx9QUUzY2yxE9nyVZChVPu8kynaBWXQkGfs6WB28F/Lmmrw==
X-Received: by 2002:a17:902:9f8c:: with SMTP id
 g12mr5228709plq.256.1556820231855; 
 Thu, 02 May 2019 11:03:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:4e72:b9ff:fe99:466a])
 by smtp.gmail.com with ESMTPSA id
 c18sm90371672pfc.0.2019.05.02.11.03.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 11:03:50 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: dri-devel <dri-devel@lists.freedesktop.org>
Subject: [RFC][PATCH 1/3] mesa: android: Remove unnecessary dependency
 tracking rules
Date: Thu,  2 May 2019 11:03:44 -0700
Message-Id: <20190502180346.4769-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190502180346.4769-1-john.stultz@linaro.org>
References: <20190502180346.4769-1-john.stultz@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KwVol6+NAKSj5claaoAPzFfVv/0b5wE9kH8oSQrsELw=;
 b=Ae66Y7F/dz45twsOu9n7DNHzu7fDmDinbKFOhwOIDbzyel45V5/hlkdzCLhrBt80xs
 rQ1l085cqF7I7rLWcXnlFO/WizWbM0XDVooXVRAAuurmZBH35NnQinmLmyzRpocAwwSM
 TtK+VBUvoqcHQyttDaSBVmeT9ImkUDX5I7E3BprFrl+WprOceJI5SyiFRdlIpP0gi6/Z
 FNWxoyiwmZ0VG2JJp/R47NUEyUmy9Koru/29p+Aqf7XkcrTIwUllDbk16+RTBb1vtn4z
 b89YoTM7oNT7XEvMqJoowzKu6G9uCvyrK8f1x9rJeDWoejDrFscJeFeiwNMr6cfyTjn4
 vKtg==
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
Cc: Rob Clark <robdclark@chromium.org>, Amit Pundir <amit.pundir@linaro.org>,
 Greg Hartman <ghartman@google.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWxpc3RhaXIgU3RyYWNoYW4gPGFzdHJhY2hhbkBnb29nbGUuY29tPgoKVGhlIGN1cnJl
bnQgQU9TUCBtYXN0ZXIgYnVpbGQgc3lzdGVtIGJyZWFrcyBidWlsZGluZyBtZXNhIGR1ZSB0byB0
aGUKZm9sbG93aW5nIGVycm9yOgoKZXh0ZXJuYWwvbWVzYTNkL3NyYy9jb21waWxlci9BbmRyb2lk
Lmdsc2wuZ2VuLm1rOjk0OiBlcnJvcjoKICB3cml0aW5nIHRvIHJlYWRvbmx5IGRpcmVjdG9yeTog
ImV4dGVybmFsL21lc2EzZC9zcmMvY29tcGlsZXIvZ2xzbC9pci5oIgoKVGhpcyBlcnJvciBpcyBi
b2d1cyAtLSBub3RoaW5nICJ3cml0ZXMiIHRvIGlyLmggLS0gYnV0IHRoZSBydWxlIGlzCnVubmVj
ZXNzYXJ5IGJlY2F1c2UgdGhlIGdlbmVyYXRlZCBoZWFkZXIgdGhhdCBpcyBhIGRlcGVuZGVuY3kg
b2YgdGhlCm5vbi1nZW5lcmF0ZWQgaGVhZGVyIHNob3VsZCBiZSBhZGRlZCB0byBMT0NBTF9HRU5F
UkFURURfU09VUkNFUyBhbmQgdGhpcwp3aWxsIHRyYWNrIGlmIHRoZSBkZXBlbmRlbmN5IG5lZWRz
IHRvIGJlIHJlZ2VuZXJhdGVkLgoKKFRoaXMgY2hhbmdlIGZpeGVzIGEgc2ltaWxhciBwcm9ibGVt
IGFmZmVjdGluZyBuaXIuaCB0b28uKQoKQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVt
Lm9yZz4KQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPgpDYzogQW1p
dCBQdW5kaXIgPGFtaXQucHVuZGlyQGxpbmFyby5vcmc+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0
LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogQWxpc3RhaXIgU3RyYWNoYW4gPGFzdHJhY2hhbkBnb29n
bGUuY29tPgpDYzogR3JlZyBIYXJ0bWFuIDxnaGFydG1hbkBnb29nbGUuY29tPgpDYzogVGFwYW5p
IFDDpGxsaSA8dGFwYW5pLnBhbGxpQGludGVsLmNvbT4KQ2M6IEphc29uIEVrc3RyYW5kIDxqYXNv
bkBqbGVrc3RyYW5kLm5ldD4KU2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgU3RyYWNoYW4gPGFzdHJh
Y2hhbkBnb29nbGUuY29tPgpbanN0dWx0ejogRm9yd2FyZCBwb3J0ZWQgYW5kIHR3ZWFrZWQgY29t
bWl0IHN1YmplY3RdClNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5h
cm8ub3JnPgotLS0KIHNyYy9jb21waWxlci9BbmRyb2lkLmdsc2wuZ2VuLm1rIHwgMiAtLQogc3Jj
L2NvbXBpbGVyL0FuZHJvaWQubmlyLmdlbi5tayAgfCAyIC0tCiAyIGZpbGVzIGNoYW5nZWQsIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc3JjL2NvbXBpbGVyL0FuZHJvaWQuZ2xzbC5nZW4u
bWsgYi9zcmMvY29tcGlsZXIvQW5kcm9pZC5nbHNsLmdlbi5tawppbmRleCAzYjk0ZWE3YmQyZi4u
MTMwOGRlMmRiOTcgMTAwNjQ0Ci0tLSBhL3NyYy9jb21waWxlci9BbmRyb2lkLmdsc2wuZ2VuLm1r
CisrKyBiL3NyYy9jb21waWxlci9BbmRyb2lkLmdsc2wuZ2VuLm1rCkBAIC05MCw4ICs5MCw2IEBA
ICQoaW50ZXJtZWRpYXRlcykvZ2xzbC9nbGNwcC9nbGNwcC1sZXguYzogJChMT0NBTF9QQVRIKS9n
bHNsL2dsY3BwL2dsY3BwLWxleC5sCiAkKGludGVybWVkaWF0ZXMpL2dsc2wvZ2xjcHAvZ2xjcHAt
cGFyc2UuYzogJChMT0NBTF9QQVRIKS9nbHNsL2dsY3BwL2dsY3BwLXBhcnNlLnkKIAkkKGNhbGwg
Z2xzbF9sb2NhbC15LXRvLWMtYW5kLWgpCiAKLSQoTE9DQUxfUEFUSCkvZ2xzbC9pci5oOiAkKGlu
dGVybWVkaWF0ZXMpL2dsc2wvaXJfZXhwcmVzc2lvbl9vcGVyYXRpb24uaAotCiAkKGludGVybWVk
aWF0ZXMpL2dsc2wvaXJfZXhwcmVzc2lvbl9vcGVyYXRpb24uaDogJChMT0NBTF9QQVRIKS9nbHNs
L2lyX2V4cHJlc3Npb25fb3BlcmF0aW9uLnB5CiAJQG1rZGlyIC1wICQoZGlyICRAKQogCSQoaGlk
ZSkgJChNRVNBX1BZVEhPTjIpICQ8IGVudW0gPiAkQApkaWZmIC0tZ2l0IGEvc3JjL2NvbXBpbGVy
L0FuZHJvaWQubmlyLmdlbi5tayBiL3NyYy9jb21waWxlci9BbmRyb2lkLm5pci5nZW4ubWsKaW5k
ZXggODk0ZmIxMmM0YmUuLjI2MTE1ZjQ0NmEzIDEwMDY0NAotLS0gYS9zcmMvY29tcGlsZXIvQW5k
cm9pZC5uaXIuZ2VuLm1rCisrKyBiL3NyYy9jb21waWxlci9BbmRyb2lkLm5pci5nZW4ubWsKQEAg
LTc2LDggKzc2LDYgQEAgJChpbnRlcm1lZGlhdGVzKS9uaXIvbmlyX29wY29kZXMuaDogJChuaXJf
b3Bjb2Rlc19oX2RlcHMpCiAJQG1rZGlyIC1wICQoZGlyICRAKQogCSQoaGlkZSkgJChNRVNBX1BZ
VEhPTjIpICQobmlyX29wY29kZXNfaF9nZW4pICQ8ID4gJEAKIAotJChMT0NBTF9QQVRIKS9uaXIv
bmlyLmg6ICQoaW50ZXJtZWRpYXRlcykvbmlyL25pcl9vcGNvZGVzLmgKLQogbmlyX29wY29kZXNf
Y19nZW4gOj0gJChMT0NBTF9QQVRIKS9uaXIvbmlyX29wY29kZXNfYy5weQogbmlyX29wY29kZXNf
Y19kZXBzIDo9IFwKIAkkKExPQ0FMX1BBVEgpL25pci9uaXJfb3Bjb2Rlcy5weSBcCi0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
