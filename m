Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0797E3BA
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 22:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829D96E7A3;
	Thu,  1 Aug 2019 20:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0EA6E79F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 20:04:42 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id i138so26547383ywg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2019 13:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=HgG8M2gXF9KLcX7K8q5a5DHQVUwoAlp7Ry7QAboue7Q=;
 b=iKy4hOQZCGzn+C6CwGq83zJY6fRifhsR/cf7mfcbSyuMa7BKL6g6r7fygl2AwDdjFw
 yd0DbnPhejmzu09XEVWmhbld0nkPFlhfg+1A7GezYQsjj6sU6YcM+aElKs8WvbDyb9/v
 f8/ZjlrvBIKrZQTag6OqVPyaNlXBEaJngZ+MDjrbI+wWcjfrfc/WHShSg4ACWG4Iuda7
 prMJZKKrgV2qPAnS0Hn0RRkM/OgkWi1VrqJnoUh4cEkQGCAUX3uXe/iLxzPeT8ajkU64
 NuQ01Rj6CYoGJypZ97k5a1j0iQgmO4lrB+6yfZfZDDQPeFgqHR6UuNmV8jeBw8rq36iX
 s8xQ==
X-Gm-Message-State: APjAAAUF26UOkuvAgihfDDRr/plvZ7Z2tJjeGK5MSWT6pjnf+iwpyhm5
 M4fDtxUNcSimNyWiC48k63XqMw==
X-Google-Smtp-Source: APXvYqzh4KoHtTTGLwXgFp8IT2ooBjJjbH0lH6V2g+/Ez01h3SNyAfgXpwGQUNrvrIydxe/jWM9zZw==
X-Received: by 2002:a81:6056:: with SMTP id u83mr75542899ywb.331.1564689881522; 
 Thu, 01 Aug 2019 13:04:41 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d69sm16353842ywa.29.2019.08.01.13.04.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:04:40 -0700 (PDT)
Date: Thu, 1 Aug 2019 16:04:39 -0400
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [RESEND PULL] msm-fixes
Message-ID: <20190801200439.GV104440@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=HgG8M2gXF9KLcX7K8q5a5DHQVUwoAlp7Ry7QAboue7Q=;
 b=S27nJBcYP8KZdyj7v5tt00+H9moxOk4PwrokLphC6p0mUx4N+ajVfGl/cveao7Y77s
 clOVRGP8ZSf+vV71CFiKV8qfjlYuBQbtSpYCzIc23T7+rEDPDzoR1HbymMSXWAqOi2kg
 Byov6WCN2SfK16a0MAumYY4TTDkmy+JkclvBNf+PvvOGKdfu+E3faBCQlUPNd5lj8VZ+
 HCAQ4Fc35UprZrWOaE5z+ycouL+1QlQo82/kkUqcapTt/+x09yVyMWCMuYX9x6rngthm
 DtZ5q1rotS092Xy8Sm7mmrCAZfQrT4ugDOYboJGEz92JJ/6CbdRboAfQxjUJFHot3Kp2
 Ejow==
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
Cc: Rob Clark <robdclark@chromium.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGVhbSwKU29ycnkgSSBwdWxsZWQgdGhlIHRyaWdnZXIgYSBiaXQgZWFybHkgb24gdGhlIGxh
c3QgZW1haWwuIFRoaXMgb25lIGlzIHRoZSBzYW1lCnRhZywgYnV0IGNjJ3MgdGhlIGFwcHJvcHJp
YXRlIGxpc3RzL3Blb3BsZS4KClNpbmNlIEkgaGFuZGVkIGRybS1taXNjIGJhY2sgdG8gTWFhcnRl
biB0aGlzIHdlZWssIEknbGwgc2VuZCBtc20gZml4ZXMgZnJvbSB0aGUKbXNtIHRyZWUuIE5vdCB0
b28gaGVhdnksIGJ1dCBmaXhlcyBzb21lIGltcG9ydGFudCByZWdyZXNzaW9ucyBpbiA1LjMuCgpU
aGFua3MsCgpTZWFuCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDRkNTMwOGU3
ODUyNzQxMzE4ZTRkNDBmYjhkNDNkOTMxMWIzOTg0YWU6CgogIE1lcmdlIHRhZyAnZHJtLWZpeGVz
LTUuMy0yMDE5LTA3LTI0JyBvZiBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9s
aW51eCBpbnRvIGRybS1maXhlcyAoMjAxOS0wNy0yNiAxNDoxMDoyNiArMTAwMCkKCmFyZSBhdmFp
bGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvZHJtL21zbS5naXQgdGFncy9tc20tZml4ZXMtMjAxOV8wOF8wMQoKZm9yIHlvdSB0
byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDljYTdhZDZjNzcwNmVkZWFlMzMxYzE2MzJkMGM2Mzg5NzQx
OGViYWQ6CgogIGRybTogbXNtOiBGaXggYWRkX2dwdV9jb21wb25lbnRzICgyMDE5LTA4LTAxIDEy
OjUyOjIxIC0wNDAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQotIEZpeCB0aGUgZG1hX3N5bmMgY2FsbHMgYXBwbGllZCBs
YXN0IHdlZWsgKFJvYikKLSBGaXggbWRwNSBkc2kgY29tbWFuZCBtb2RlIChCcmlhbikKLSBTcXVh
c2ggZmFsbCB0aHJvdWdoIHdhcm5pbmdzIChKb3JkYW4pCi0gRG9uJ3QgYWRkIGRpc2FibGVkIGdw
dSBub2RlcyB0byB0aGUgb2YgZGV2aWNlIGxpc3QgKEplZmZyZXkpCgpDYzogSmVmZnJleSBIdWdv
IDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+CkNjOiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNv
ZGVhdXJvcmEub3JnPgpDYzogQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+CkNj
OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+CgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkJyaWFuIE1hc25l
eSAoMSk6CiAgICAgIGRybS9tc206IGFkZCBzdXBwb3J0IGZvciBwZXItQ1JUQyBtYXhfdmJsYW5r
X2NvdW50IG9uIG1kcDUKCkplZmZyZXkgSHVnbyAoMSk6CiAgICAgIGRybTogbXNtOiBGaXggYWRk
X2dwdV9jb21wb25lbnRzCgpKb3JkYW4gQ3JvdXNlICgxKToKICAgICAgZHJtL21zbTogQW5ub3Rh
dGUgaW50ZW50aW9uYWwgc3dpdGNoIHN0YXRlbWVudCBmYWxsIHRocm91Z2hzCgpSb2IgQ2xhcmsg
KDEpOgogICAgICBkcm0vbXNtOiBVc2UgdGhlIGNvcnJlY3QgZG1hX3N5bmMgY2FsbHMgaW4gbXNt
X2dlbQoKIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfZ3B1LmMgICAgIHwgIDIgKysK
IGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMgICAgIHwgIDEgKwogZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jICAgfCAgMSArCiBkcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NydGMuYyB8IDE2ICsrKysrKysrKystCiBkcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0v
bXNtL21zbV9kcnYuYyAgICAgICAgICAgICB8ICAzICstCiBkcml2ZXJzL2dwdS9kcm0vbXNtL21z
bV9nZW0uYyAgICAgICAgICAgICB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0K
IDcgZmlsZXMgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKLS0gClNl
YW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
