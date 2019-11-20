Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BC8104559
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 21:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5813C6E7C6;
	Wed, 20 Nov 2019 20:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F196E7D3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 20:49:47 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id q140so506911ywg.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 12:49:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=WNeLavihiY35/Bti+M2/ppnGXPlLgOgcLTijhR7e7j4=;
 b=chlgImUZA1TZ3n2/ADf7U6AtAG7rcLoSrEU8B/QLZz4ueFb8d/+C8hc8EZLmcRkCNx
 cXnoxTi1IB7Hu3ElX/tDtGk3OUZnT3zO/YFqXQTRAQSfXQfM5yjIEe3otQOvwKEBZTpO
 LrOELlp7nE5nmCCpTk2uW9iMTr0uA5UpJQG0AcSHJpOm5kEta1M51448vWFHtTW/cD9R
 pejFUDg38kXHFCkBlZq5YXhzd0PPibo62NfmLFw4qRyTwER+r6oBzTtrUZ5+J08jLNA/
 3OvjE/KN45zMwRMMi1s+33HgcVhS5B4Emx/HBhCcSPelaH1QHYFrKaQa5WrQLy8HlH5V
 l/1w==
X-Gm-Message-State: APjAAAUiQoVDNUfe+BTgpS0GAvVtkygSdJ2oMB7z8attnp0ZyCuDqrnH
 b6lDp4ncDRV7hAUTEZjSey1Lo7NfQ3o=
X-Google-Smtp-Source: APXvYqxJULa4u9zVjW13ZdKYjGU/GhRFefUGq/5gFIO5deiHXNLTrJDR3ETezg+m+f+K/yhG7xUWIw==
X-Received: by 2002:a81:3dd5:: with SMTP id k204mr3135454ywa.454.1574282987098; 
 Wed, 20 Nov 2019 12:49:47 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id 197sm264538ywf.42.2019.11.20.12.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 12:49:46 -0800 (PST)
Date: Wed, 20 Nov 2019 15:49:46 -0500
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20191120204946.GA120328@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=WNeLavihiY35/Bti+M2/ppnGXPlLgOgcLTijhR7e7j4=;
 b=R/+NiXNhs2jyeuM/anmN8G+Fs9BhzkwBj95eNQiMM5w+jadzDNWWUlFjGEQJfomVkw
 WS/fVR95eryT64qjLHJ1KEz0JPjOGbxYEZ0feAy7xmxNYkR8uilfPsDVHjMlQTbyKs0x
 DjGUjcbXDsgPJ+1HCvFQkEllBPb4AXtSJzZpC6QTvnI2Yt0imy9IzYtsRZpFQ45C5pEA
 QdoEPD7HJIrCL8tYwxZIbRI/nPoDBtnuiSqlKn7VR5MXlCx4Tc6DIgwEeUt8ltwh/REF
 23Vatzce9F0jww+UomVJ4VXderGpgoKdc5NtIslfDcPcf4MejPPPmjG4xk4PxzwaXb34
 VfgQ==
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhdmUgJiBEYW5pZWwsCkp1c3Qgb25lIHBhdGNoIHRoaXMgd2VlayB3aGljaCBmaXhlcyB0
aGUgYm8gcmVmY291bnRzIHdoZW4gbW1hcCdpbmcgdHRtIGJ1ZmZlcnMKdXNpbmcgdGhlIG5ldyAt
Pm1tYXAoKSBob29rLgoKCmRybS1taXNjLW5leHQtZml4ZXMtMjAxOS0xMS0yMDoKLSBGaXggdHRt
IGJvIHJlZmNudCB3aGVuIHVzaW5nIHRoZSBuZXcgZ2VtIG9iaiBtbWFwIGhvb2sgKFRob21hcykK
CkNjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KCkNoZWVycywgU2VhbgoKClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYTY0ZmMxMWI5YTUyMGM1NWNhMzRkODJl
NWNhMzIyNzRmNDliNmIxNToKCiAgZHJtL21zbTogZml4IG1lbWxlYWsgb24gcmVsZWFzZSAoMjAx
OS0xMS0xMyAxNTozNDoxNSAtMDUwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0
b3J5IGF0OgoKICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MgdGFn
cy9kcm0tbWlzYy1uZXh0LWZpeGVzLTIwMTktMTEtMjAKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdl
cyB1cCB0byA5Nzg2YjY1YmM2MWFjZWM2M2Y5MjM5NzhjNzVlNzA3YWZiYjc0YmM3OgoKICBkcm0v
dHRtOiBmaXggbW1hcCByZWZjb3VudGluZyAoMjAxOS0xMS0xNSAwODowMDowOCArMDEwMCkKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KLSBGaXggdHRtIGJvIHJlZmNudCB3aGVuIHVzaW5nIHRoZSBuZXcgZ2VtIG9iaiBtbWFw
IGhvb2sgKFRob21hcykKCkNjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KR2VyZCBIb2ZmbWFubiAoMSk6CiAgICAgIGRybS90dG06IGZpeCBtbWFwIHJlZmNvdW50
aW5nCgogZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyAgICAgICAgICAgIHwgMjQgKysrKysrKysr
KysrKystLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmMgfCAx
MyArKysrKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDExIGRl
bGV0aW9ucygtKQoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENo
cm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
