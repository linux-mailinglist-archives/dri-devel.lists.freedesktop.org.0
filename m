Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4D614CE1
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 16:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1750F89A4F;
	Mon,  6 May 2019 14:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209DB89A1F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 14:46:38 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p26so15607961edr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 07:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+J4AecpOs7wrslxkg+bAl6T47e+O2ANuzwMN3YlnNp0=;
 b=PymjX+7I2ivKRU4+nuV8uLR9XtdFwSuXgjxa2G+m5Bro0HTlToDdYDztT6F8b7yJhx
 sRIAbi/IbQKIr/PUKCxcbYJWipEDFcXPUzVj/hS53e9vFasgK1o4sinlpfQY577ZDzYR
 YxkosA2zHahckZNIo0dklbmc0XFkHFwYW9FzHgmIjIYHotDxU5NlfCunbD+8EA9LzhQ2
 YsqTZY1qdmSuudQeDx18RN9csoL5+0CiDBp2ibRR6BBEmocrKBh9HRhMDFajwfjiowQj
 9jT8TKzVGRGaIdCTWYL/b/gW+AaMHl8eZvMyoobvbb7O5rJIgtj5ilNILRDSowWhHfVW
 27PA==
X-Gm-Message-State: APjAAAXGY4T/jvuq95oqKb7VFRVxxq0aDiemB5SYJuUHuwQTImL2aGM7
 xqm+QMh4F0lrmpiMpwGOVD/2+4zWMLg=
X-Google-Smtp-Source: APXvYqxYrBxTJx2m9SyFNj8vP9rP0cdBbQwYm4/7wYsUkUBh1hUvHtMNb7ydJkZXTd87IaKc/53qWg==
X-Received: by 2002:a17:906:6b01:: with SMTP id
 q1mr3006924ejr.34.1557153996194; 
 Mon, 06 May 2019 07:46:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y22sm256810ejj.75.2019.05.06.07.46.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 07:46:34 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/doc: Improve docs for conn_state->best_encoder
Date: Mon,  6 May 2019 16:46:29 +0200
Message-Id: <20190506144629.5976-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+J4AecpOs7wrslxkg+bAl6T47e+O2ANuzwMN3YlnNp0=;
 b=E/d9zz+DYTm/cckzCbxabeY1tfcldbJW0t+KqHILI/pst9CQjSz06n9DrAPOn0rfuv
 3VMtfbo+nTvyu428+BNt+STpUY3MqAoxcM+bffPQ2+2hESn5noSl5aaZVSysKi3V8R5r
 fCRqtnpKxyuCC0MSNwjEebJFeclZ9EFZofM2s=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyBtYW5kYXRvcnkgYW5kIGNvbnNpZGVyZWQgY29yZSBzdGF0ZSBzaW5jZSBpb2N0bHMgcmVs
eSBvbiB0aGlzCndvcmtpbmcuCgpUaGFua3MgdG8gTGF1cmVudCBmb3IgcG9pbnRpbmcgb3V0IHRo
aXMgZ2FwLgoKdjI6IENsYXJpZnkgdG8gImF0b21pYyBkcml2ZXJzIiBvbmx5LgoKQ2M6IExhdXJl
bnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6IFNlYW4g
UGF1bCA8c2VhbkBwb29ybHkucnVuPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggfCA0
ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fY29ubmVjdG9yLmggYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKaW5k
ZXggMDJhMTMxMjAyYWRkLi5mNDNmNDBkNTg4OGEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9jb25uZWN0b3IuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKQEAgLTUxNyw2
ICs1MTcsMTAgQEAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgewogCSAqIFVzZWQgYnkgdGhl
IGF0b21pYyBoZWxwZXJzIHRvIHNlbGVjdCB0aGUgZW5jb2RlciwgdGhyb3VnaCB0aGUKIAkgKiAm
ZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MuYXRvbWljX2Jlc3RfZW5jb2RlciBvcgogCSAqICZk
cm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcy5iZXN0X2VuY29kZXIgY2FsbGJhY2tzLgorCSAqCisJ
ICogTk9URTogQXRvbWljIGRyaXZlcnMgbXVzdCBmaWxsIHRoaXMgb3V0IChlaXRoZXIgdGhlbXNl
bHZlcyBvciB0aHJvdWdoCisJICogaGVscGVycyksIGZvciBvdGhlcndpc2UgdGhlIEdFVENPTk5F
Q1RPUiBhbmQgR0VURU5DT0RFUiBJT0NUTHMgd2lsbAorCSAqIG5vdCByZXR1cm4gY29ycmVjdCBk
YXRhIHRvIHVzZXJzcGFjZS4KIAkgKi8KIAlzdHJ1Y3QgZHJtX2VuY29kZXIgKmJlc3RfZW5jb2Rl
cjsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
