Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB250B359E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 09:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F756E85F;
	Mon, 16 Sep 2019 07:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFA46E0FD;
 Mon, 16 Sep 2019 04:46:57 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id q12so1877979pff.9;
 Sun, 15 Sep 2019 21:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=eZFkBnflecr+DvKcb7QmnRx1V4AOQ4wu/rTk5RgsQlE=;
 b=m3+0cwkFtzHm3wjU9zeRl39Menx8H2H78YpO7O2rkNYCJ4LUVneYOw+X6rwXmHUwCJ
 LVDTGuSZMNSl3mmjRO54RmIjpcz+/Kz5VGpCFVwzvxB1my35UBQC30Ufgg9bI3VKxPCZ
 XJzRu6AzimXefgQ+JhLpwBcLWwFrVZEBIPW8QQCKD5eigKBCXwgSM6W3KX5vVSWoiJ+T
 Onre78rpPJmgcXhu0nyblIkxqMkuZml0M58fyA/IsgTPsGGRK6ugGqjSO0wTrzXi1Gkg
 byirJsBY6Y0gQPA0Xhoj9Olbif8BE2mm9Y4y7cLT2w+GuUGW7QKhVKn27yohldAtxOWK
 kw7A==
X-Gm-Message-State: APjAAAVmJ75VhUZXwJ5Nt7NvxvflvRRfMcK7y70rJaJednfZVtgZoDrU
 CFV6gvKg8vBMmiL+RfncLl8dze787nA=
X-Google-Smtp-Source: APXvYqwURLPCh7octjiUsD/AciT+W+XRQZ3HOhIT6iQWWnu5H75FNN8UbaqElu7/h1yhBEWH5uaobQ==
X-Received: by 2002:a17:90a:1903:: with SMTP id
 3mr18346227pjg.80.1568609217015; 
 Sun, 15 Sep 2019 21:46:57 -0700 (PDT)
Received: from LGEARND20B15 ([27.122.242.75])
 by smtp.gmail.com with ESMTPSA id 22sm6090674pfj.139.2019.09.15.21.46.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 15 Sep 2019 21:46:56 -0700 (PDT)
Date: Mon, 16 Sep 2019 13:46:51 +0900
From: Austin Kim <austindh.kim@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, Roman.Li@amd.com,
 yamada.masahiro@socionext.com
Subject: [PATCH] drm/amd/display: Fix compile error due to 'endif' missing
Message-ID: <20190916044651.GA72121@LGEARND20B15>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 16 Sep 2019 07:28:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=eZFkBnflecr+DvKcb7QmnRx1V4AOQ4wu/rTk5RgsQlE=;
 b=GRerCR5mayXn8ulWUW1HvXXend3toobCOp29hKe9BSHh3KDRoW9STMgGkvMr0s3j7y
 sR9Cfcu4sqkYO9uYRUU3Ldzx/b1gOT9uYiyn1TUn2X24dFT+Aakxvqub6ODcSFZ8RTc1
 sjhJAlYiGajTxbEDupG0gu3aKvGT6wY0hXHtqx45EVx9XQCCWVcng7tPc/elJZR/4NOw
 LCWM1GbyLxnuoUMhA/UMsfCBm838zYeWrGOCwqo7nECoPmaYWtOX/RDLttQUZeC7o/PB
 acveA2TaxK/KmLAnyBJHS53JI+O+ZkAn2XRkphXS3ATH1xo6H/4C3t6rKOe6R9E8vm2S
 /KhA==
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
Cc: austindh.kim@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Z2NjIHRocm93cyBjb21waWxlIGVycm9yIHdpdGggYmVsb3cgbWVzc2FnZToKCkhEUklOU1QgdXNy
L2luY2x1ZGUvZHJtL2k5MTVfZHJtLmgKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlz
cGxheS9kYy9kbWwvTWFrZWZpbGU6NzA6ICoqKiBtaXNzaW5nICdlbmRpZicuICBTdG9wLgpzY3Jp
cHRzL01ha2VmaWxlLm1vZGJ1aWx0aW46NTU6IHJlY2lwZSBmb3IgdGFyZ2V0ICdkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdScgZmFpbGVkCm1ha2VbM106ICoqKiBbZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHVdIEVycm9yIDIKbWFrZVszXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9i
cy4uLi4KICBIRFJJTlNUIHVzci9pbmNsdWRlL2RybS9vbWFwX2RybS5oCiAgSERSSU5TVCB1c3Iv
aW5jbHVkZS9kcm0vdGVncmFfZHJtLmgKICBIRFJJTlNUIHVzci9pbmNsdWRlL2RybS9kcm1fc2Fy
ZWEuaAogIEhEUklOU1QgdXNyL2luY2x1ZGUvZHJtL3BhbmZyb3N0X2RybS5oCiAgSERSSU5TVCB1
c3IvaW5jbHVkZS9kcm0vZHJtLmgKc2NyaXB0cy9NYWtlZmlsZS5tb2RidWlsdGluOjU1OiByZWNp
cGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUvZHJtJyBmYWlsZWQKbWFrZVsyXTogKioqIFtkcml2
ZXJzL2dwdS9kcm1dIEVycm9yIDIKc2NyaXB0cy9NYWtlZmlsZS5tb2RidWlsdGluOjU1OiByZWNp
cGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUnIGZhaWxlZAptYWtlWzFdOiAqKiogW2RyaXZlcnMv
Z3B1XSBFcnJvciAyCm1ha2VbMV06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4u
CgpBZGQgJ2VuZGlmJyB0byBNYWtlZmlsZSB0byBzdG9wIGNvbXBpbGUgZXJyb3IuCgpTaWduZWQt
b2ZmLWJ5OiBBdXN0aW4gS2ltIDxhdXN0aW5kaC5raW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvTWFrZWZpbGUgfCAxICsKIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kbWwvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL01h
a2VmaWxlCmluZGV4IGEyZWI1OWUuLjViMmE2NWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kbWwvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RtbC9NYWtlZmlsZQpAQCAtNDQsNiArNDQsNyBAQCBDRkxBR1NfJChBTUREQUxQ
QVRIKS9kYy9kbWwvZGNuMjAvZGlzcGxheV9tb2RlX3ZiYV8yMC5vIDo9ICQoZG1sX2NjZmxhZ3Mp
CiBDRkxBR1NfJChBTUREQUxQQVRIKS9kYy9kbWwvZGNuMjAvZGlzcGxheV9ycV9kbGdfY2FsY18y
MC5vIDo9ICQoZG1sX2NjZmxhZ3MpCiBDRkxBR1NfJChBTUREQUxQQVRIKS9kYy9kbWwvZGNuMjAv
ZGlzcGxheV9tb2RlX3ZiYV8yMHYyLm8gOj0gJChkbWxfY2NmbGFncykKIENGTEFHU18kKEFNRERB
TFBBVEgpL2RjL2RtbC9kY24yMC9kaXNwbGF5X3JxX2RsZ19jYWxjXzIwdjIubyA6PSAkKGRtbF9j
Y2ZsYWdzKQorZW5kaWYKIGlmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMQogQ0ZMQUdTXyQo
QU1EREFMUEFUSCkvZGMvZG1sL2RjbjIxL2Rpc3BsYXlfbW9kZV92YmFfMjEubyA6PSAkKGRtbF9j
Y2ZsYWdzKQogQ0ZMQUdTXyQoQU1EREFMUEFUSCkvZGMvZG1sL2RjbjIxL2Rpc3BsYXlfcnFfZGxn
X2NhbGNfMjEubyA6PSAkKGRtbF9jY2ZsYWdzKQotLSAKMi42LjIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
