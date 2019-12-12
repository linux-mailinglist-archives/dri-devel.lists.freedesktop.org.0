Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2C811C89B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5EE6ECC1;
	Thu, 12 Dec 2019 08:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B623E89FD3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 03:15:12 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id p6so540726vsj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 19:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=n+IMRSBvLhX9ZAtekffVS6aoliiMjMgKjGaw03DCk1Y=;
 b=OkW1wjQYgp1rTb4pyECvRZEwTWY6ho7S+kKh9ZiAC8ozL1+tVW5OzWIstHGmPlJTct
 ZyLlzd2Y5ptK24HA4ra4kNNbCu9GAIXfU1YCVuA/C3xfW9aMpCVdCTqf05/c3BUIYOjs
 DCUBtXffE3dMXRwCUn8EC7vH6WwHDtr01+5bDBCG2tNu+YaTIomcEQld1wbxmt+5pUc1
 E7ZRaIFKkFxuu+P011UnMUWxt5qp1xlqN7+RullaQqGYCJq62qeH3r4Cc1tJ7IJNIFx8
 IuZl+Et2F2C1qHYHIWEL76e2kv57ZGNma1tHpFZ3Q5GDqATOIz/UhBBCM8523lCsVf8l
 Omww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=n+IMRSBvLhX9ZAtekffVS6aoliiMjMgKjGaw03DCk1Y=;
 b=Nem94gVeJc7Sj8B2S4mVf0p5FRBp8KsV/Hq6kG0FrmptxvU+RPyPQfEhrzIPS8xTwc
 rqllNmDButrznmRFzk2JG6UWrqJK8A8w6VG/cEYRooisF7RvIhFJPr7XwuIwzzCqOWAg
 ZsyHPEnp6vdD1kpYrkJlPVIxsIrv6X4X+Wf1sHvyq97BtNa9O//71fMNKz7S9kHOUV4A
 Y7kzCrHxk8lLaXtLmTlDp4pwVzQtyz87qTc8bUiXdqv6ZC8Q9a1F6+c/vFwQAxKvHpLB
 pHSsC+mPzuns0CTisDgNZ+baDyEv1VffxRWDqN8b88KUurPtYsnT4ZUtLpNXARaNb2Fu
 fzMA==
X-Gm-Message-State: APjAAAUdIzJo+OZOPGk52n3r9T24nSfMGl2Q5GKsphjcBowmBYZvb+Iu
 YeP/u4s6XpEPmQJsEUCUyjB+emAbHBnNWH1oFALeFC+8bKs=
X-Google-Smtp-Source: APXvYqxmHuW13M0eAa6FB/vw5iZZ1e1Z/U/N4mAnIbLUIN6/bs/iceKU+nAcF/OzzvNgQ4s3PXXhy5lSkfFk7Kg7XSQ=
X-Received: by 2002:a67:e248:: with SMTP id w8mr5290591vse.74.1576120511619;
 Wed, 11 Dec 2019 19:15:11 -0800 (PST)
MIME-Version: 1.0
From: AceLan Kao <acelan@gmail.com>
Date: Thu, 12 Dec 2019 11:15:01 +0800
Message-ID: <CAMz9Wg-SzJvtZ7s4A9jPAUjR-JvNLUk+yL7adBzORmfqs3=8rw@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/i915: Force DPCD backlight mode on X1 Extreme 2nd
 Gen 4K AMOLED panel
To: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I don't have this panel, but adding the first 3 OUI bytes to the
quirk, another platform which has DPCD aux brightness control works
well.

Tested-by: AceLan Kao <acelan.kao@canonical.com>

-- 
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
