Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE64084E28
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 16:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3356E6F6;
	Wed,  7 Aug 2019 14:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E356E6F6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 14:06:37 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m10so86378911edv.6
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 07:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AJhh4xV0LSLkw0VOcj3qALl+bM7Er5DzqLmgnQpAsmA=;
 b=BpOmO0eu9l+ZBDRA6L8tRRnOoEE71xmuiNCmCFiW1Mq2knpNpAkZyvfBgNCUrPHZvz
 sdefoc7DswXqid2nT2z9PNJ3hI+6aFc1IuxOklK8Oew5QarkqmfS36tuEAK2D1f/aLhf
 z6kvUlifghCVzEk0MiSf/CXDxNQR3NgTXA3uPiC52Dv/1Ajz+aN4yZhRye/S0AouuH4W
 dF07X+XTGe1zHX6Ryb2hq4v+HCsIvCTDykigHwgWnQ61jUbkE+Ngq1C0C0bPAPB4oC0B
 RK4zdwAYgT8IutpLR7iXc9dMt0vbxiz1KN+IjR2Dj/TuuEp/1obDeRl0rLUnVAS11krB
 RLCA==
X-Gm-Message-State: APjAAAXdORvpvVuqN7lQ3/y717qQb9qvxPtvW38zUh5XHGRKCT2SF6sj
 VN35gh1rjt3fOThUjjasi20oPKWR
X-Google-Smtp-Source: APXvYqyYEbeJQV45sGrhFq0CQEgjohTkLpK6t2CydZYiJsi3XjfiVRgA2KC3bE+0lGzNmMhNSUD99g==
X-Received: by 2002:a50:8be8:: with SMTP id n37mr9903612edn.216.1565186796416; 
 Wed, 07 Aug 2019 07:06:36 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id o18sm20760309edq.18.2019.08.07.07.06.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 07:06:35 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: [GIT PULL] drm/tegra: Fixes for v5.3-rc4
Date: Wed,  7 Aug 2019 16:06:34 +0200
Message-Id: <20190807140634.29166-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AJhh4xV0LSLkw0VOcj3qALl+bM7Er5DzqLmgnQpAsmA=;
 b=Fj8c+dEn6FA8oZt2dkPXtmCkSgQup71CCK6a6tZ6+higq4BxlUuBlP/OtrrQlhzPUT
 8AySRSuJwW/0Fa7n2ivuLrbNlQIh3LmSRgf3Hjicuprnny/eNZSWBibwE725kaKeckzz
 QpjH1dWcpTbcCGWnyfmZGJ476eVz7raHofAah48ksC/gjjWBokoH7YKyo5u50fS9LeHF
 8Xukg1C2MoJ+jIsTAhOOEX/gjhPVYZzu63rcgIxOoJLcN3m9jdWrMQ/acnfTEpsm3BUR
 GQZLefwSFmBZbOmysiLnuP73bxEZjDd0ITdcuCLZvIwa6+gxdwGII8UhYFAMq79aknwM
 M2EQ==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNWY5ZTgzMmMxMzcw
NzUwNDVkMTVjZDY4OTlhYjA1MDVjZmIyY2E0YjoKCiAgTGludXMgNS4zLXJjMSAoMjAxOS0wNy0y
MSAxNDowNTozOCAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0
OgoKICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy90ZWdyYS9saW51eCB0YWdzL2RybS90
ZWdyYS9mb3ItNS4zLXJjNAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDJhNmZjM2Ni
NWNiNjg1OTdmMTA3MmJmZWVmMjhkMmNhMDIzMTAyMjA6CgogIGRybS90ZWdyYTogRml4IGdwaW9k
X2dldF9mcm9tX29mX25vZGUoKSByZWdyZXNzaW9uICgyMDE5LTA3LTI1IDE1OjIzOjI2ICswMjAw
KQoKVGhhbmtzLApUaGllcnJ5CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRybS90ZWdyYTogRml4ZXMgZm9yIHY1LjMtcmM0
CgpUaGlzIGNvbnRhaW5zIGEgc2luZ2xlIGZpeCBmb3IgYSByZWdyZXNzaW9uIGludHJvZHVjZWQg
YnkgYSBjb21iaW5hdGlvbgpvZiBhIEdQSU8gYW5kIGEgZHJtL3RlZ3JhIHBhdGNoIG1lcmdlZCBp
biB2NS4zLXJjMS4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KRG1pdHJ5IE9zaXBlbmtvICgxKToKICAgICAgZHJtL3RlZ3Jh
OiBGaXggZ3Bpb2RfZ2V0X2Zyb21fb2Zfbm9kZSgpIHJlZ3Jlc3Npb24KCiBkcml2ZXJzL2dwdS9k
cm0vdGVncmEvb3V0cHV0LmMgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
