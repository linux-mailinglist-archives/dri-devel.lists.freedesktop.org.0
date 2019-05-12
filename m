Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9BF1B0B9
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 09:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D17789598;
	Mon, 13 May 2019 07:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CBE899D5
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 17:46:16 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id j187so11558735wmj.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 10:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QVZfv1XrlSfCBKYSGVa1+qErP5NlTniZ7Uw0fXhDRsM=;
 b=OhV5D846k3RgGjjd6p0atE3PAjuwybwUeaFdILu2bagEMxJQS8FtJYzSfXY9oh3Dq2
 lCkuVzASbM6uwsSLSGz1TgxuljXoYioOzUzgq/dfemyHXBHPJBepexLGaRriHOzdpsw0
 gjoXbtBt/s2JVhFvjrbPFZ6AjKnqvG7pyWah1aDlstA9aYbO5Yu022Ci+3DHyphEn6LK
 nDDy9Ga3bLUiGeMdxvJNacZLc7IJ15O5Ja9shwmH+5hqrwdhDglVZ3uyWeslw9AcRoUq
 xzQlnX5CHYzXhAN7snUIdWlCVA4+VxSkj+BH1wxcZy7zMkii5nj9dlbSaTw0E0LzizjU
 0QoA==
X-Gm-Message-State: APjAAAXtXYtOf6S4fDRIUaLXCkGknBvzlstFWWSQ7M1LIw7lywuL44Sf
 oeMVO/PRxlHaPdALk+Zwjiw=
X-Google-Smtp-Source: APXvYqxhWeqE2lBh2k5a4dTcV7sEJ2M9qqkT8DQ/tBHx1rAhg4yUak6CGFAClz0i/26Aef9LHqGtXw==
X-Received: by 2002:a05:600c:254e:: with SMTP id
 e14mr1830396wma.70.1557683175358; 
 Sun, 12 May 2019 10:46:15 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id d14sm9090558wre.78.2019.05.12.10.46.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 May 2019 10:46:14 -0700 (PDT)
From: peron.clem@gmail.com
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v4 0/8] Allwinner H6 Mali GPU support
Date: Sun, 12 May 2019 19:46:00 +0200
Message-Id: <20190512174608.10083-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 May 2019 07:04:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QVZfv1XrlSfCBKYSGVa1+qErP5NlTniZ7Uw0fXhDRsM=;
 b=nBmE7w7P+u/frCbPSdZZa0Xz+mMQkcFFkWsU3I6Hta0YBTEF9DDgCHpCIVFXrcFstD
 CEvhmQNCSykn2g8xZMk77WWw626Ia3fV1rSp5z1dYf6OVEkMUXY/QD5FRaZ2qY8VVstE
 m5OJQirNJgPgxvv28WYnq8sJXVTdvAmynUI37JIyuZY8Sb/1XxRABptKzWNvbjmnJlnV
 DOwj5L1QUQOvOzZarMkEh80NzOQX8/f1msKgmIyc/ms/1s2dhTxCPcptMh/feRm+rBsI
 QpSQD6JEXJzk1T5/RbL472yHbo/VkcuOMhf15pXbJKuBPmBJ7uTDTF4QBpCLjtJbyZf9
 iXzg==
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KCkhpLAoKVGhlIEFs
bHdpbm5lciBINiBoYXMgYSBNYWxpLVQ3MjAgTVAyLiBUaGUgZHJpdmVycyBhcmUKb3V0LW9mLXRy
ZWUgc28gdGhpcyBzZXJpZXMgb25seSBpbnRyb2R1Y2UgdGhlIGR0LWJpbmRpbmdzLgoKVGhlIGZp
cnN0IHBhdGNoIGlzIGZyb20gTmVpbCBBbXN0cm9uZyBhbmQgaGFzIGJlZW4gYWxyZWFkeQptZXJn
ZWQgaW4gbGludXgtYW1sb2dpYy4gSXQgaXMgcmVxdWlyZWQgZm9yIHRoaXMgc2VyaWVzLgoKVGhl
IHNlY29uZCBwYXRjaCBpcyBmcm9tIEljZW5vd3kgWmhlbmcgd2hlcmUgSSBjaGFuZ2VkIHRoZQpv
cmRlciBoYXMgcmVxdWlyZWQgYnkgUm9iIEhlcnJpbmcuClNlZTogaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wYXRjaC8xMDY5OTgyOS8KClRoYW5rcywKQ2zDqW1lbnQKCkNoYW5nZXMgaW4g
djQ6CiAtIEFkZCBSb2IgSGVycmluZyByZXZpZXdlZC1ieSB0YWcKIC0gUmVzZW50IHdpdGggY29y
cmVjdCBNYWludGFpbmVycwoKQ2hhbmdlcyBpbiB2MyAoVGhhbmtzIHRvIE1heGltZSBSaXBhcmQp
OgogLSBSZWF1dGhvciBJY2Vub3d5IGZvciBoZXIgcGF0Y2gKCkNoYW5nZXMgaW4gdjIgKFRoYW5r
cyB0byBNYXhpbWUgUmlwYXJkKToKIC0gRHJvcCBHUFUgT1BQIFRhYmxlCiAtIEFkZCBjbG9ja3Mg
YW5kIGNsb2NrLW5hbWVzIGluIHJlcXVpcmVkCgpDbMOpbWVudCBQw6lyb24gKDYpOgogIGR0LWJp
bmRpbmdzOiBncHU6IG1hbGktbWlkZ2FyZDogQWRkIEg2IG1hbGkgZ3B1IGNvbXBhdGlibGUKICBh
cm02NDogZHRzOiBhbGx3aW5uZXI6IEFkZCBBUk0gTWFsaSBHUFUgbm9kZSBmb3IgSDYKICBhcm02
NDogZHRzOiBhbGx3aW5uZXI6IEFkZCBtYWxpIEdQVSBzdXBwbHkgZm9yIFBpbmUgSDY0CiAgYXJt
NjQ6IGR0czogYWxsd2lubmVyOiBBZGQgbWFsaSBHUFUgc3VwcGx5IGZvciBCZWVsaW5rIEdTMQog
IGFybTY0OiBkdHM6IGFsbHdpbm5lcjogQWRkIG1hbGkgR1BVIHN1cHBseSBmb3IgT3JhbmdlUGkg
Qm9hcmRzCiAgYXJtNjQ6IGR0czogYWxsd2lubmVyOiBBZGQgbWFsaSBHUFUgc3VwcGx5IGZvciBP
cmFuZ2VQaSAzCgpJY2Vub3d5IFpoZW5nICgxKToKICBkdC1iaW5kaW5nczogZ3B1OiBhZGQgYnVz
IGNsb2NrIGZvciBNYWxpIE1pZGdhcmQgR1BVcwoKTmVpbCBBcm1zdHJvbmcgKDEpOgogIGR0LWJp
bmRpbmdzOiBncHU6IG1hbGktbWlkZ2FyZDogQWRkIHJlc2V0cyBwcm9wZXJ0eQoKIC4uLi9iaW5k
aW5ncy9ncHUvYXJtLG1hbGktbWlkZ2FyZC50eHQgICAgICAgICB8IDI3ICsrKysrKysrKysrKysr
KysrKysKIC4uLi9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1iZWVsaW5rLWdzMS5kdHMgICB8ICA1
ICsrKysKIC4uLi9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1vcmFuZ2VwaS0zLmR0cyAgICB8ICA1
ICsrKysKIC4uLi9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1vcmFuZ2VwaS5kdHNpICAgICB8ICA1
ICsrKysKIC4uLi9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LXBpbmUtaDY0LmR0cyB8ICA1
ICsrKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi5kdHNpICB8IDE0
ICsrKysrKysrKysKIDYgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKQoKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
