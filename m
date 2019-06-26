Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE7157330
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 22:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5036E50D;
	Wed, 26 Jun 2019 20:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7EB76E50C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 20:56:17 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id w40so152302qtk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 13:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=HE409Ft4xGnYxUWHbRVNImMW3KuqdXOE50F2pPYBUVE=;
 b=e/4E6w02CaW9XFg4iOns+kQ8MlTd0JLtBXlMqAkvmI6w0zFuJVcKgP1jfEJkgnsfel
 xFncUmKNRTw0RVAaRL8c+racoYgZlGjQxsfCMHeKY3BqGCi/1EKhj5WzcqcMNTTC8yB+
 mD4VpVv0L6vcCINi2VFt1yZwXCwUCW4v0ZOH0OHFyzYhULUD1+LNxhcFupKnsPsJr7VU
 g31GNiGsy+vYUFqRacawb1KKJvPoZ4jI7/LrDrTts9m41FuscW9W+sTaNQ6Wn8EeSm/6
 paJurW9zMIr77wq//rS7qcAKoQsh5LvEAAdiG+lMwu3+7QFErw4SAgtm8ZwjLvKinTJZ
 oA+Q==
X-Gm-Message-State: APjAAAVt9MPPg8+qzLuCi6cqQKaY5BIdQBjzOaVk/cwgQPYXZz1ZGaCQ
 ypij7LwQCk+pdWBFBdPHoIwNOg==
X-Google-Smtp-Source: APXvYqxdQ9ym2CBfDpCO7S8CKdnYr41J29uFaKBPApbSGmSX0n5iUPjiOTSAg6Dj7ChnSjtxGvLr7A==
X-Received: by 2002:ac8:27b1:: with SMTP id w46mr1523524qtw.265.1561582576943; 
 Wed, 26 Jun 2019 13:56:16 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id k5sm9527431qkc.75.2019.06.26.13.56.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 13:56:16 -0700 (PDT)
Date: Wed, 26 Jun 2019 16:56:15 -0400
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20190626205615.GA123489@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=HE409Ft4xGnYxUWHbRVNImMW3KuqdXOE50F2pPYBUVE=;
 b=B2pXe28Hf8EpfYMAkOgpsag1+8Y74jw1DPu6xuKYS6atm1R4RSPzvDK7xtyV9ypCAd
 eC+SDL85nC9bmPs5DFDoTZVXMbRcK3CAiXAZ7vMoOTPOGsFbA76DqzuALhhkAWrvCqB5
 NW2V64qFolyCGqUqhPXML7dlt2maBYEEF4RNY7EG2Zchz0tNOVXRQyO6G2Ow3FxUYxKO
 lejrjjqgsJXu0lZNDHAlM8nhBl6sv0lzwYve1VnhNm4SFmcBkLg2dwO5m04icA3TGYCg
 qzS7uAoEbGxdKpNO5KyqdaZzAIaMswtK7zlF/wvHpNIt8ZgWqPbbexSQu1jJsJCoYiYh
 C7IQ==
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
Cc: dim-tools@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIG1haW50YWluZXJzLApPbmUgcGF0Y2ggdGhpcyB3ZWVrLCBubyBtYWdpYy4KCgpkcm0tbWlz
Yy1maXhlcy0yMDE5LTA2LTI2Ogp2aXJ0aW8tIERvbid0IGNhbGwgZHJtX2Nvbm5lY3Rvcl91cGRh
dGVfZWRpZF9wcm9wZXJ0eSgpIHdoaWxlIGhvbGRpbmcgc3BpbmxvY2sKCkNjOiBHZXJkIEhvZmZt
YW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KCkNoZWVycywgU2VhbgoKClRoZSBmb2xsb3dpbmcgY2hh
bmdlcyBzaW5jZSBjb21taXQgNWVhYjljZjg3YjZjMjYxZjRlMmY2Yzc2MjMxNzFjYzJmNWVhMWE5
YzoKCiAgTWVyZ2UgdGFnICdpbXgtZHJtLWZpeGVzLTIwMTktMDYtMjAnIG9mIGdpdDovL2dpdC5w
ZW5ndXRyb25peC5kZS9naXQvcHphL2xpbnV4IGludG8gZHJtLWZpeGVzICgyMDE5LTA2LTIxIDEx
OjQ0OjI0ICsxMDAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cgog
IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYyB0YWdzL2RybS1taXNj
LWZpeGVzLTIwMTktMDYtMjYKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA0MWRlNGJl
NmY2ZWZhNDEzMmIyOWFmNTExNThjZDY3MmQ5M2YyNTQzOgoKICBkcm0vdmlydGlvOiBtb3ZlIGRy
bV9jb25uZWN0b3JfdXBkYXRlX2VkaWRfcHJvcGVydHkoKSBjYWxsICgyMDE5LTA2LTI2IDExOjA1
OjA1ICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQp2aXJ0aW8tIERvbid0IGNhbGwgZHJtX2Nvbm5lY3Rvcl91cGRh
dGVfZWRpZF9wcm9wZXJ0eSgpIHdoaWxlIGhvbGRpbmcgc3BpbmxvY2sKCkNjOiBHZXJkIEhvZmZt
YW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KR2VyZCBIb2ZmbWFubiAoMSk6CiAgICAg
IGRybS92aXJ0aW86IG1vdmUgZHJtX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0eSgpIGNh
bGwKCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKLS0gClNlYW4gUGF1bCwgU29m
dHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
