Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288AA4C17F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 21:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337A36E45C;
	Wed, 19 Jun 2019 19:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E166E457
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 19:27:47 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id a15so401412qtn.7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 12:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=VbHxdpO7Q2+DXgJDf4+Ks/YOti0Ci+NtrdzX5AEvrRk=;
 b=O2/sYUctHt8dIacyjWLhyC5FgEH0Xycsr5lgFLMz6UqA7NFubfp+ZhnqIP9IscKdjf
 RM5pZZoh6bh2sIygm2Vm9e3rfWdOMANdqXT+yrBiCie3P3akgp49l5tTD0mcX0x5XL8y
 lzy99Zd7bPiTJIayymF0lGGG7RcuHYJ8WGd7Elus5I5QcAAacMSXEsJE4zGOmxuFTsKw
 ZdFOhTRds6saUYeonAABpznmaN26OtApqqnM0VIR2rVVR3T9QOXXViVNAtAk893p9cIP
 Gu/Suz3oVgJTBORfpBuU1zBtG9p6ceAdykEJnRtAFUf3X4Sl4cL4qeIaQ7HZbx+5BYjf
 lQ1g==
X-Gm-Message-State: APjAAAUdhnxPIodZQNwj/rSOqcfMUKFuTv74/aNmYT/sdSS07wEhJzaz
 QAlF9Qrmcz5ep8fR1D4aaDv0aA==
X-Google-Smtp-Source: APXvYqzxlR8S4IeyW9wtKYragnwYUBbUHU+6TEVShKU/NPOqaizYfIrRsJmOS+94BtC4eVBTr/bGxQ==
X-Received: by 2002:ac8:1978:: with SMTP id g53mr18415709qtk.3.1560972466705; 
 Wed, 19 Jun 2019 12:27:46 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id p37sm12023430qtc.35.2019.06.19.12.27.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 12:27:46 -0700 (PDT)
Date: Wed, 19 Jun 2019 15:27:45 -0400
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20190619192745.GA145841@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=VbHxdpO7Q2+DXgJDf4+Ks/YOti0Ci+NtrdzX5AEvrRk=;
 b=O4zy4PcjlXR+Htqe1RlNSKJZqO+2RF5hnBUN/THcnHW7n8qk4GX+xXvyLshfrZHp1Z
 yQsO6ph0Ri4AFIN2aLPB0kDXCqlI/Nb/0Xy8lyl5uOaU+lJ2u4z1NL0BpOrd6KUEIMHQ
 t4nGptd4o+AgcwltLzVFL3Q7mJ8r7PKqINvUUJkUD0loQSOOHd79lqvvjzzwqnFWiwSk
 LAK8gwBKgN8b2amj8dMoZ9dlQl9mcwTvxZ9en5utADdGGO3eH7Avl7F1YVu1LLCZQIti
 TmbsLWti3xu1KaYv/GBZtNPj1B9utPJfs+yXM8UGbLVgN8muloQOaXMN4IOquVIvWw7o
 wqqg==
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
 intel-gfx@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhleSB0ZWFtLAoyIGZpeGVzIHRoaXMgd2VlaywgdGhlIDUuMiB0cmlja2xlIGNvbnRpbnVlcy4K
Cgpkcm0tbWlzYy1maXhlcy0yMDE5LTA2LTE5OgpwYW5mcm9zdC0gT25seSB1bm1hcCBCTydzIGlm
IHRoZXkncmUgbWFwcGVkIChCb3JpcykKY29yZS0gSGFuZGxlIGJ1ZmZlciBkZXNjIGNvcHlfdG9f
dXNlciBmYWlsdXJlIHByb3Blcmx5IChEYW4pCgpDYzogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5i
cmV6aWxsb25AY29sbGFib3JhLmNvbT4KQ2M6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJA
b3JhY2xlLmNvbT4KCkNoZWVycywgU2VhbgoKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBj
b21taXQgNDhlYWViNzY2NGM3NjEzOTQzODcyNGQ1MjBhMWVhNGE4NGEzZWQ5MjoKCiAgZHJtOiBh
ZGQgZmFsbGJhY2sgb3ZlcnJpZGUvZmlybXdhcmUgRURJRCBtb2RlcyB3b3JrYXJvdW5kICgyMDE5
LTA2LTEyIDEzOjI2OjI1ICswMzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRv
cnkgYXQ6CgogIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYyB0YWdz
L2RybS1taXNjLWZpeGVzLTIwMTktMDYtMTkKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
byA3NGI2N2VmYThkN2I0ZjkwMTM3ZjBhYjlhODBkZDMxOWRhMDUwMzUwOgoKICBkcm06IHJldHVy
biAtRUZBVUxUIGlmIGNvcHlfdG9fdXNlcigpIGZhaWxzICgyMDE5LTA2LTE4IDEzOjA4OjQ4IC0w
NDAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpwYW5mcm9zdC0gT25seSB1bm1hcCBCTydzIGlmIHRoZXkncmUgbWFwcGVk
IChCb3JpcykKY29yZS0gSGFuZGxlIGJ1ZmZlciBkZXNjIGNvcHlfdG9fdXNlciBmYWlsdXJlIHBy
b3Blcmx5IChEYW4pCgpDYzogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFi
b3JhLmNvbT4KQ2M6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KQm9yaXMgQnJlemlsbG9uICgxKToKICAgICAgZHJtL3BhbmZyb3N0OiBNYWtlIHN1cmUg
YSBCTyBpcyBvbmx5IHVubWFwcGVkIHdoZW4gYXBwcm9wcmlhdGUKCkRhbiBDYXJwZW50ZXIgKDEp
OgogICAgICBkcm06IHJldHVybiAtRUZBVUxUIGlmIGNvcHlfdG9fdXNlcigpIGZhaWxzCgogZHJp
dmVycy9ncHUvZHJtL2RybV9idWZzLmMgICAgICAgICAgICAgIHwgNSArKysrLQogZHJpdmVycy9n
cHUvZHJtL2RybV9pb2MzMi5jICAgICAgICAgICAgIHwgNSArKysrLQogZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5jIHwgMyArKy0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9nZW0uaCB8IDEgKwogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X21tdS5jIHwgOCArKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAv
IENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
