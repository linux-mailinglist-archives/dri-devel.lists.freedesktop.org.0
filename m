Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B181D323A3
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2019 17:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84ADF89327;
	Sun,  2 Jun 2019 15:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0007689A5E
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 15:39:22 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id x10so2913049pfi.0
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Jun 2019 08:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=q9LeSxzzekMvPghgDp4XWodO/b6xbbc2XbiqEVR18MM=;
 b=Sl3RHlTQ6yub5M47rS9ln0bUouXd3e/EEuHFsDTSlogkiEnlOtzPoJhjbonhqE/b8J
 j1lFH/wKa7xy/iwid+bGqTwFqftNkhphONQmkio/CoHArErmEyDdGm4uqJpaR9GzqUMr
 nfqw/UKUuDzCUEHfMu8Zw2TgblEKehYALvdfywn1Y0Le6DtsoebWLhGvBrQEi02+bieY
 epsVaeNUSuG5DVEaJRvoCBFE2oxUzjjxd/7Z6Ehelt737JtjD2cmZzL3EZybkNTedBHg
 HstUI7jxuvUjA7PbUstQucAyhytceZXrLx+fNQe0Hn5gCS6su22FZOcPogTBa+z520vB
 y9Bw==
X-Gm-Message-State: APjAAAU2+F/NmZjpcjcr9egqQ22mNDhk3wlLk+ix7bGTU0/8tgRHshWo
 GmDfMgGydWVm2k+JVthyGjQ=
X-Google-Smtp-Source: APXvYqzcLoQNDgfzgq3jL8ACpRfpZsiUpTd97As+odqEvw0AbuKxTbxlTJahyaestnmy9nXM6s/f9w==
X-Received: by 2002:a63:e54d:: with SMTP id z13mr16288850pgj.132.1559403562558; 
 Sat, 01 Jun 2019 08:39:22 -0700 (PDT)
Received: from t-1000 (c-98-210-58-162.hsd1.ca.comcast.net. [98.210.58.162])
 by smtp.gmail.com with ESMTPSA id l63sm10562133pfl.181.2019.06.01.08.39.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 01 Jun 2019 08:39:22 -0700 (PDT)
Date: Sat, 1 Jun 2019 08:39:20 -0700
From: Shobhit Kukreti <shobhitkukreti@gmail.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH] video: fbdev: Fix Warning comparing pointer to 0 reported by
 coccicheck
Message-ID: <20190601153917.GA20765@t-1000>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Sun, 02 Jun 2019 15:00:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=q9LeSxzzekMvPghgDp4XWodO/b6xbbc2XbiqEVR18MM=;
 b=WehB/YFAv0SIjEPRFL61+ubhkNJPCjGCWNpFp6Cem68k3F4SYpnC5IFC5HsWJ3cIkn
 oDhpzHT2A63Zo5Q7J2jElxLZwuY/jqISyEHpqaxPyulFL6Y1y+JCFgRbv9Xo+3AOGKCQ
 hzo6UsCPif2BfeVy8AODX9EUt0xzr6YkWU5Edr1Aqd15n0TK+q1YBYasRj/VumZXVQ/D
 ETvTLlQPklJNMin7gLqoHfjJlMIT8/dPj03ppSRxxPvpotHN7+wSP1c1HxWo6SRnPyW0
 luyyuojDTK+drUmQ7r1FXtXul+CM45Sk6ouPVubZmGVmhayYFNwvSu8qh7A3Q+7kUOCk
 /eUQ==
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
Cc: shobhitkukreti@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJpdmVycy92aWRlby9mYmRldi9jb250cm9sZmIuYzogV0FSTklORyBjb21wYXJpbmcgcG9pbnRl
ciB0byAwCmRyaXZlcnMvdmlkZW8vZmJkZXYvY29udHJvbGZiLmM6IFdBUk5JTkcgY29tcGFyaW5n
IHBvaW50ZXIgdG8gMApkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvbnRyb2xmYi5jOiBXQVJOSU5HIGNv
bXBhcmluZyBwb2ludGVyIHRvIDAKClNpZ25lZC1vZmYtYnk6IFNob2JoaXQgS3VrcmV0aSA8c2hv
YmhpdGt1a3JldGlAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29udHJvbGZi
LmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29udHJvbGZiLmMgYi9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvbnRyb2xmYi5jCmluZGV4IDdhZjhkYjIuLjA3OTA3YzUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29udHJvbGZiLmMKKysrIGIvZHJpdmVycy92
aWRlby9mYmRldi9jb250cm9sZmIuYwpAQCAtMTgyLDcgKzE4Miw3IEBAIGludCBpbml0X21vZHVs
ZSh2b2lkKQogCWludCByZXQgPSAtRU5YSU87CiAKIAlkcCA9IG9mX2ZpbmRfbm9kZV9ieV9uYW1l
KE5VTEwsICJjb250cm9sIik7Ci0JaWYgKGRwICE9IDAgJiYgIWNvbnRyb2xfb2ZfaW5pdChkcCkp
CisJaWYgKGRwICE9IE5VTEwgJiYgIWNvbnRyb2xfb2ZfaW5pdChkcCkpCiAJCXJldCA9IDA7CiAJ
b2Zfbm9kZV9wdXQoZHApOwogCkBAIC01ODAsNyArNTgwLDcgQEAgc3RhdGljIGludCBfX2luaXQg
Y29udHJvbF9pbml0KHZvaWQpCiAJY29udHJvbF9zZXR1cChvcHRpb24pOwogCiAJZHAgPSBvZl9m
aW5kX25vZGVfYnlfbmFtZShOVUxMLCAiY29udHJvbCIpOwotCWlmIChkcCAhPSAwICYmICFjb250
cm9sX29mX2luaXQoZHApKQorCWlmIChkcCAhPSBOVUxMICYmICFjb250cm9sX29mX2luaXQoZHAp
KQogCQlyZXQgPSAwOwogCW9mX25vZGVfcHV0KGRwKTsKIApAQCAtNjgzLDggKzY4Myw4IEBAIHN0
YXRpYyBpbnQgX19pbml0IGNvbnRyb2xfb2ZfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKmRwKQog
CQlyZXR1cm4gLUVOWElPOwogCX0KIAlwID0ga3phbGxvYyhzaXplb2YoKnApLCBHRlBfS0VSTkVM
KTsKLQlpZiAocCA9PSAwKQotCQlyZXR1cm4gLUVOWElPOworCWlmIChwID09IE5VTEwpCisJCXJl
dHVybiAtRU5PTUVNOwogCWNvbnRyb2xfZmIgPSBwOwkvKiBzYXZlIGl0IGZvciBjbGVhbnVwcyAq
LwogCiAJLyogTWFwIGluIGZyYW1lIGJ1ZmZlciBhbmQgcmVnaXN0ZXJzICovCi0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
