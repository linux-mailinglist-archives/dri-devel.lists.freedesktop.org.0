Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF6AC52FC4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 16:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6883D10E0CA;
	Wed, 12 Nov 2025 15:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="cLAOA1xj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75DF10E0A9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 15:23:43 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 9EFD033F79C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 15:23:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1762961021; bh=9+zQf/AuWGRSxTZP5IIE+dPc0uwpxiiRW5VchLQjh8Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cLAOA1xjOjmXj3QFn4tKznXfNg7hpeyWYm7a43pEJZrfhBsnWMWOtT8Sf8RTTUuQi
 1zYLD7NJMFSR5s0nQHF9ztdu6JiESfR1MN+2t35W1RyBVRiP8o2YXrvwi7K1cV+tNk
 3Z0dtirbiJ2CzPbHrNyoaFNJ4HUraGNmDQAa4/Bts0ZYPGythcfDp2SmiNzfbG8OXW
 vXCCOP7gDqmfQG10eYYEIE8aefWbVUddshW7nCBv5oGYqnsaZKcctlsSlJR1V4RNTQ
 409XCB8xn4lBpAMhfLfNcs5GbrG6rgGMfI/+cdtnGj74V+ESGgcwBKvZu0VaKYI8Wr
 ysFd9tkc9fuHg==
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6418738efa0so1729053a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 07:23:41 -0800 (PST)
X-Gm-Message-State: AOJu0YzyJ+dNZo9L98uHrN+0dYzy85rr5oSYPne55dLpP26tobsamhvs
 LVcTJMxJ+uv321Fx3JXLplhZFtYKu/qmxPkvwBg7d+zFMYSD78/OIUNxiJwf8C+ZAPUVvwRjUiK
 y3hVgB1zSAYnbwlWOjou7ZHuJcjyLE3s=
X-Google-Smtp-Source: AGHT+IEqSUhcHB9yzt3lWAOifWAVCmWJzXd9fR72pSxiuzeiA6zz2iFZfZ0vI5EWVrqsgz7fN02K33GdkNguZOl/z14=
X-Received: by 2002:a17:907:d644:b0:b72:b7e1:5c90 with SMTP id
 a640c23a62f3a-b7331a838e7mr335564166b.34.1762961021159; Wed, 12 Nov 2025
 07:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20251112151832.77867-1-xaver.hugl@kde.org>
 <20251112151832.77867-3-xaver.hugl@kde.org>
In-Reply-To: <20251112151832.77867-3-xaver.hugl@kde.org>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Wed, 12 Nov 2025 16:23:29 +0100
X-Gmail-Original-Message-ID: <CAFZQkGwapJxp7uPdiULV-1RnctYp0oDsS2rJ8iN+O-JQpwuOLg@mail.gmail.com>
X-Gm-Features: AWmQ_bkw2gqpOSedb7znZ28oKqgOzGMfWx1QgisgRQ5Rzi9R74GASAMkAR1MPn4
Message-ID: <CAFZQkGwapJxp7uPdiULV-1RnctYp0oDsS2rJ8iN+O-JQpwuOLg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm,
 amdgpu: add the "FreeSync HDR Mode" connector property
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Note that I've only tested this on a single monitor so far, a Samsung
C49RG9, which is the only one I have that supports FreeSync 2 HDR. It
would be nice if more people could test it; the compositor side of
this is at https://invent.kde.org/plasma/kwin/-/merge_requests/8423

Also worth mentioning is
https://gitlab.freedesktop.org/emersion/libdisplay-info/-/issues/51,
if anyone wants to help out with figuring out the userspace side of
detecting whether or not a given display is actually FreeSync HDR
capable.

- Xaver
