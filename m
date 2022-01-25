Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D50D049BD94
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 22:00:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3365510E33A;
	Tue, 25 Jan 2022 21:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [IPv6:2607:f8b0:4864:20::a2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C59510E33A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 21:00:44 +0000 (UTC)
Received: by mail-vk1-xa2b.google.com with SMTP id y192so9789655vkc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 13:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=rb145q7OdVnMgixHq5IpFWIBmzblCxdOd+XXWn6jq1I=;
 b=hIRXrJX3BzLLNtpZFD5G2Xcb3hNHPG5fAmgmUQjsdkl2tSYa3jw8xnrL2YXC3UP2TA
 6j8x0+e2fkJAv5HwHBvdhMFxvA9+TmsPd02o/g5lm2+DfE5KGiHLbO5RSUdXOb7shg1p
 BXu9me4si3za9P9MPuLBUr487pex4f3GPuIO4wnn7UPTNhpfYWBlsP1T1pFG5o+G+R1X
 TZgjgLomY36mi2cm7o8qstSqld4mpZlvJzScBd/mIytD2KPet/hS71C95/3BloN35g+X
 N6WjaruhB8tzXQMslOKWRbqg3NDFOr/cT6h4N7RnLW0OMoG9AXIHOjCfHQxPzCvWXzGh
 1eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rb145q7OdVnMgixHq5IpFWIBmzblCxdOd+XXWn6jq1I=;
 b=icXzI0Cknb3sbDICNXGCqZU7HFWW3YyJFu9JpBwmgJsbF5YgSS8//OI/3aBFL058D6
 9ZZW8pMunqzy8UFcTolW23n7N2oPf2vXOxCNEvuSf6EXd7zn3fuHf7yA+FkkN8/Sy4Lj
 v4gNvNQhzzAzaf6Uo9Koz/dViGaO5ZzQ8+FlxmgFPGIZXU2qpjSpaygTEPIKqS/Kwkey
 m5dAwKByXn/vF+Sd7ihO5eecCHSsX9T2d7kiLi9ByfX8c9x+tB9zLwZGquXKHYwP4ZoG
 bLzUd68JeSj6KitKpRrmC4rjJd8ig/PtbsFBgaGAKy2UBrA0rq38bXuFKcgiLhHmmymT
 P/ww==
X-Gm-Message-State: AOAM531lroFVAKN0rz/H0N/z/ilPuITVYG5+TDJIro4oRiYESuJKbPG0
 AYL1W7LeLb/vjrsvq3FQWY9t0SFs9aeCZFMcBeIGmpBI0V4=
X-Google-Smtp-Source: ABdhPJwZosrSvzLPzq0+SIKwN0A6WNBelzLO5Ob7TZNVNW9bxIvoEneDLgFe6Gb69m+/IaBsQjfN11C1S7UU5KZI8PQ=
X-Received: by 2002:a05:6122:8c6:: with SMTP id 6mr8942863vkg.5.1643144443316; 
 Tue, 25 Jan 2022 13:00:43 -0800 (PST)
MIME-Version: 1.0
From: jim.cromie@gmail.com
Date: Tue, 25 Jan 2022 14:00:17 -0700
Message-ID: <CAJfuBxyv6u_FceO2v6H4p-qa=oOd-1ig62BCSZ2zZRzbFKR3mQ@mail.gmail.com>
Subject: help on CI fail for patchwork 21938
To: dri-devel <dri-devel@lists.freedesktop.org>
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

this patchwork CI test is failing.

https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21938/fi-kbl-soraka/igt@i915_selftest@live@evict.html

I dont understand what went wrong, but I dont see how patchset could
be involved,
it is drm.debug code, and I dont see evidence that it is even active.
It would have to be explicitly enabled from user-space, via:
echo 0x05 > /sys/module/drm/parameters/debug

I will be resending patchset here, for another pass thru CI,
so Im looking for hints more than specific fixes.

tia
