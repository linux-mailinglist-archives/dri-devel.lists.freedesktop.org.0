Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 966EAFBA75
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 22:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46546EE68;
	Wed, 13 Nov 2019 21:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA0F6EE68
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 21:10:58 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id h23so1565970ybg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 13:10:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=Aa4jqN7eZSty7hwt+mhI71DUPCbqeUIirkXXGZge00s=;
 b=s8GsU8qqwldxzeDM5Rnx7sj8QJkfIL9TFgwqSuw6y5MkqoWESvXVdw0n9GBt6geVEO
 RP44ida9qbazRA2ApmiywG5AJs+vQklsB9lUvUq0iRrzY3+AcJev0gPwasyrih2fbIeP
 +9n1A8knlyqUhxQUkuSDsi7Fyu9bv7W75Dl0nMcN6PYoTUonTbXXslL2C0p3isjZpEyr
 j2KQi/zegXO6nwjbFTQNk00I4z/53kvI8GrBtZrDlaS+HNB3FLO4cSeiAew0+PyBTqvE
 MNsLjRVp1iSz1/3qCb3g3VQalVTymoygYJ7sfx8H2W69DfCo/1Sk672PTOWxyllT6Dqf
 6Rlg==
X-Gm-Message-State: APjAAAVNiUf+9W6DPZF6Os3ZzBUTYvzXC3r6ChMtIdhpZkVSgee3SBFE
 oJJW/6C7oe47IqifQm/tSPwwdQ==
X-Google-Smtp-Source: APXvYqz3YtAW16sfEXGBeIzxYHeLjt2FZjYAGXWdcEkDr/mUNJ2nNU/SxevfCZodgOMKSQ3Ruod0+Q==
X-Received: by 2002:a25:360b:: with SMTP id d11mr4602261yba.86.1573679457438; 
 Wed, 13 Nov 2019 13:10:57 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id y196sm1145433ywa.5.2019.11.13.13.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 13:10:56 -0800 (PST)
Date: Wed, 13 Nov 2019 16:10:56 -0500
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20191113211056.GA78440@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=Aa4jqN7eZSty7hwt+mhI71DUPCbqeUIirkXXGZge00s=;
 b=MyofaNdxnmqj0qzDOa3bxuyD49APZhtbYlD5Gf5VddHPA/vFOFcIWyQ178zM5rHoNd
 SHIrWmiRJ2RMOG7fRj3EMqYs9ftQpzzt/+SYcfiD3DLDRq1XOOJuhWSPnI5kwx0lVaDG
 MF3VM7ezbeLnHBwy9iLjoI2c/JgIgoEhJuMJvvHxR9Wq3yFmFGcUdWWdLLC5/7xXJoue
 vIghpd0bVs7mCZG5qfNqDCRAxqCZyVodEMFizUV4a8VGekg/tZ3bjPfemOKz3EQG06xK
 hSGXSAt94XLOUcXYmsGoJ9sKe8Et/8hveBA/AWfC7AXeHC9/onAklbk/Rn9QCcP6rtO5
 5sxQ==
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
 Johan Hovold <johan@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhdmUgJiBEYW5pZWwsCkp1c3Qgb25lIG1zbSBwYXRjaCB0aGlzIHdlZWsuIExvb2tzIGxp
a2UgLW1pc2MgaXMgZ29pbmcgdG8gYmUgcGVyZmVjdCB3aGVuIG1lcmdlCndpbmRvdyByb2xscyBh
cm91bmQgOi0pCgoKZHJtLW1pc2MtbmV4dC1maXhlcy0yMDE5LTExLTEzOgotIEZpeCBtZW1vcnkg
bGVhayBpbiBncHUgZGVidWdmcyBub2RlJ3MgcmVsZWFzZSAoSm9oYW4pCgpDYzogSm9oYW4gSG92
b2xkIDxqb2hhbkBrZXJuZWwub3JnPgoKQ2hlZXJzLCBTZWFuCgoKVGhlIGZvbGxvd2luZyBjaGFu
Z2VzIHNpbmNlIGNvbW1pdCAzY2EzYTllYWI3MDg1YjNjOTM4YjVkMDg4YzMwMjAyNjljZmVjZGM4
OgoKICBNZXJnZSB0YWcgJ2RybS1taXNjLW5leHQtZml4ZXMtMjAxOS0xMS0wNicgb2YgZ2l0Oi8v
YW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjIGludG8gZHJtLW5leHQgKDIwMTkt
MTEtMDggMTY6NDg6MjIgKzEwMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9y
eSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjIHRhZ3Mv
ZHJtLW1pc2MtbmV4dC1maXhlcy0yMDE5LTExLTEzCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gYTY0ZmMxMWI5YTUyMGM1NWNhMzRkODJlNWNhMzIyNzRmNDliNmIxNToKCiAgZHJtL21z
bTogZml4IG1lbWxlYWsgb24gcmVsZWFzZSAoMjAxOS0xMS0xMyAxNTozNDoxNSAtMDUwMCkKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KLSBGaXggbWVtb3J5IGxlYWsgaW4gZ3B1IGRlYnVnZnMgbm9kZSdzIHJlbGVhc2UgKEpv
aGFuKQoKQ2M6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSm9oYW4g
SG92b2xkICgxKToKICAgICAgZHJtL21zbTogZml4IG1lbWxlYWsgb24gcmVsZWFzZQoKIGRyaXZl
cnMvZ3B1L2RybS9tc20vbXNtX2RlYnVnZnMuYyB8IDYgKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBF
bmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
