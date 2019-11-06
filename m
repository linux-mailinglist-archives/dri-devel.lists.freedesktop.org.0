Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F47EF1FDD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 21:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DDD6E2E0;
	Wed,  6 Nov 2019 20:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE0F6E2CF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 20:27:32 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id b2so709ybr.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 12:27:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=yqU4m+Ul25F5dxOvbaQspIiIMftbQaHIKycJ/zDAkZ0=;
 b=huo+kPwwN+KTrp7EELXACUdLbUsReTxY9wAPXwRv/BoXil/Ns3Qxy8QE47yHS8eXSk
 w+zhmLYsJsg5IYd4qVY/SI4kNLrJ7RljmADtIvdMR+cIdVR5ghhFxjdxMO8fi3Dx1wf/
 SqwjYC9UbozxBw/64fWR0HH2x//pjApE+lJQsU6P0UpmAx1ubjIrtb1ymlpZP4xLa9Rs
 axpmlFBIK2+7YUGhHxuS9vWcD1RHQvS4X2s8g/5VLfrnkO1cbVGoPaB48R046IwOIvyT
 ZF9fjDnBF1CWdP1wtlEWfR5cOm6LueM6FX+MoTw7kMEAwhkCVXWifd53ZQyUqrb2daoJ
 Kyfw==
X-Gm-Message-State: APjAAAVxQ6ikuM+HFSGp490loLTIwiekHV/wwdKn6RZKV0Lgzo6t35tM
 wCk3qBv+kKFOTgGc7/1DJA6h+TsN8M0=
X-Google-Smtp-Source: APXvYqzCwISHkxZ68LOE9Y2GGdYprtrghHR4fuGksKUm7XrK/zBLoOM2lmdjjkD1uqb5B87+LHE2gw==
X-Received: by 2002:a25:c385:: with SMTP id t127mr3897592ybf.141.1573072051776; 
 Wed, 06 Nov 2019 12:27:31 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id k125sm8043076ywe.66.2019.11.06.12.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 12:27:30 -0800 (PST)
Date: Wed, 6 Nov 2019 15:27:30 -0500
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20191106202730.GA199896@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=yqU4m+Ul25F5dxOvbaQspIiIMftbQaHIKycJ/zDAkZ0=;
 b=aCzh5pwUJ4eEgkVRjpz4l4RsyxWHgw/thA10gwNpzZ4TaTd+11pTGNbHMKTr4ZFSXL
 1JKjwcC5m/AS24wbGQs0ncibqJOKy3QhznExLDUX82Yus7xlRsvSm3XqII9zV63AcAmz
 4tm+Qa6SKTRMPBqbZGnebnnhPZtcUm9L/mjcKGKr/H/cVjKOQKCZ1OrTvI+HIUgDpyuv
 2szv/HPykotCM+CQ8qB50wtPxge3t4lHt9iT14BzcZEOCfmqJoBZr1Fk0LmhJqPIhop5
 096NdPBvu33Y2FY1OEyf2B+A/Gdf41Dt2IBfZ06RjfMWsy/RWhrAvUcmKiKS9/m8thga
 5HOQ==
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
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sharat Masetty <smasetty@codeaurora.org>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhdmUgJiBEYW5pZWwsCmRybS1taXNjLW5leHQtZml4ZXMgaXMgb3BlbiBhbmQganVzdCBh
IGNvdXBsZSBvZiBwYXRjaGVzIHRoaXMgd2Vlay4KCmRybS1taXNjLW5leHQtZml4ZXMtMjAxOS0x
MS0wNjoKLW1zbTogRml4IHVwIGE2eHggZGVidWdidXMgcmVnaXN0ZXIgbmFtZXMgKFNoYXJhdCkK
LW1zdDogQXZvaWQgdTY0IGRpdmlzaW9uIChTZWFuKQoKQ2M6IFNoYXJhdCBNYXNldHR5IDxzbWFz
ZXR0eUBjb2RlYXVyb3JhLm9yZz4KQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3Jn
PgoKQ2hlZXJzLCBTZWFuCgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBjZWEz
NWY1YWQ1ZmZhYzA2ZWEyOWUwZDdhN2Y3NDg2ODNlMWYxYjdkOgoKICBkcm0vaTkxNTogRG9uJ3Qg
c2VsZWN0IEJST0tFTiAoMjAxOS0xMS0wNiAwNTo0NjowNCArMTAwMCkKCmFyZSBhdmFpbGFibGUg
aW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9y
Zy9kcm0vZHJtLW1pc2MgdGFncy9kcm0tbWlzYy1uZXh0LWZpeGVzLTIwMTktMTEtMDYKCmZvciB5
b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBiMTQ5Y2JmZWVjYWEyYjI4NzBkMmM0Zjg3ODM4MmEw
MjRlNmU0OTc1OgoKICBkcm0vbXN0OiBGaXggdXAgdTY0IGRpdmlzaW9uICgyMDE5LTExLTA2IDE1
OjIwOjM3IC0wNTAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQotbXNtOiBGaXggdXAgYTZ4eCBkZWJ1Z2J1cyByZWdpc3Rl
ciBuYW1lcyAoU2hhcmF0KQotbXN0OiBBdm9pZCB1NjQgZGl2aXNpb24gKFNlYW4pCgpDYzogU2hh
cmF0IE1hc2V0dHkgPHNtYXNldHR5QGNvZGVhdXJvcmEub3JnPgpDYzogU2VhbiBQYXVsIDxzZWFu
cGF1bEBjaHJvbWl1bS5vcmc+CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClNlYW4gUGF1bCAoMSk6CiAgICAgIGRybS9tc3Q6
IEZpeCB1cCB1NjQgZGl2aXNpb24KClNoYXJhdCBNYXNldHR5ICgxKToKICAgICAgZHJtOiBtc206
IGE2eHg6IGZpeCBkZWJ1ZyBidXMgcmVnaXN0ZXIgY29uZmlndXJhdGlvbgoKIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwdS9k
cm0vbXNtL2FkcmVuby9hNnh4X2dwdV9zdGF0ZS5jIHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0t
LS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoK
LS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
