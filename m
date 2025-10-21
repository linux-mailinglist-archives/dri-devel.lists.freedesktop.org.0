Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29385BF56A0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 11:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1B210E5A8;
	Tue, 21 Oct 2025 09:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ugk2So33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1374710E5A1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 09:06:57 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-651c1eddfd4so2554117eaf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 02:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761037616; x=1761642416; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WQ/kfPH+p9DG+gxOwqgXhBptn0gdWYUtVGxmrwmvL5Y=;
 b=Ugk2So333YwsR+IooY2TP/WubjUifT2mtgVOnRbFKoL/mJKkgfDhiSM1LZNBSt7C7v
 pGeCmuu55ZzLygNBmAJIcc0PgFfH/4lx6q3YbiWT2cCjN0p3gbTjMDRHSPhdFURPROvI
 UbFY7sSRC4DT7QbV1y0fZqVAJ9P8xSz89UkkKSqrJEIvDgWnVZQzGYuEeaia+m9MxTp6
 K2tNAP12pVvdXYpDsNa1Kd91J7S1egMNZXqD/NBNwQTL3uFgRod/UYTbAN6nGeOgxmFA
 yXjufqBbHKGetT0R9GFqcYJJGNFS1Vm31Flnv7WCsjSRomRxgv3ZyX7r2+9cAP6TK9ME
 p4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761037616; x=1761642416;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WQ/kfPH+p9DG+gxOwqgXhBptn0gdWYUtVGxmrwmvL5Y=;
 b=XYUVLt1UNGrkn7IYw7+C3FgUTV429w10XZUvMUrfBXSR9jCK81/aK0vGQceVDCeoNq
 6CwNsSNqAHX9kQTqlPqm9nkNOntPPNFCT3+uO/ScDLGSgSV+/C5L0ZzQVMPjf5PbDWth
 YlDvhd+pgJGeXfxhmit0Rpua8f++RBPDrZCO1fh86kX7GDLvw2RZh4yO/xxGao73+eMK
 hRsUKTfeU3+07AS4UsD9iTCcwyYJOpH8jMxSLCGbI/DimT9/JRmHRiQNZmEo9HdUT5zf
 X8e4i0tg+RTm778uEsuBZO8uvYrO+x9L5U76HCdgqKxn14mXifS3qOyNLDUeAnS9mtCS
 3ruA==
X-Gm-Message-State: AOJu0YwbOMBvc0cmVtmI6yw8sznLUW6xQNXvWcgRqNbm9GpFGg32gq5w
 7cQCGpMXtfiIALlwqvgRMfNRAiCRyY5xo9n9zFsfkpIb1gg/6NQxe5WmVcQQfI79mEaifzHbEQe
 tsB/fHXQRzPpOXRTz7gD0u7iCe9/vpIWgyLQXu9M=
X-Gm-Gg: ASbGnctbQsSKS5pkxmU87LbXt7SmsTNPCj8Nod+ggjsQWHAjRp/5pz/GoA5Etig7TjP
 xCQyDfNJRk0Y5/9jxms1l12ViR0EAuIlZt2v/jikfYX+NcFXwaMU7julZzTjSqANTwf5drAF87P
 cqC3lVdKphxQ6VzYPhtVz6wNeN3LHP5NATrq0eHRFZnvpC3ibygaHwWRKGljuCSVFowTD2nStRZ
 NVq7Te9W4DPv6YXpGRaLCAch4aDZIXPpKTtOVpZqdjCcV6nNnrIJF0iyQf/Mb2g5yTgwA==
X-Google-Smtp-Source: AGHT+IEF/0bsWisgXztXITPqpawPuUt0q4Fp6zPD+1s6m9tbVIrGky2c8KGjP6tkr76i/71g2apJAJ1ienEh/nprREE=
X-Received: by 2002:a05:6808:448d:b0:442:2ce:46ce with SMTP id
 5614622812f47-443a2e97f7fmr7373799b6e.11.1761037616022; Tue, 21 Oct 2025
 02:06:56 -0700 (PDT)
MIME-Version: 1.0
From: John Smith <itistotalbotnet@gmail.com>
Date: Tue, 21 Oct 2025 11:06:45 +0200
X-Gm-Features: AS18NWAindI0HB-XIJPm2-aDSWxcgwTQ67tv8gPrlgCvOBhVc-Kc8_7zo_ejpe8
Message-ID: <CAGkpkRWV2o93Ejrb0YjoPTxVy23U6pYcwGtLOf_y+jPrk4NCtw@mail.gmail.com>
Subject: [PATCH v2 0/2] drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel
 value on Fiji and Iceland
To: dri-devel@lists.freedesktop.org
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

This series is a continuation of the first patch for fixing the
PCIeBootLinkLevel value on Fiji, which fixed an issue
on an environment where PCIe generation switching does not seem to
function properly, leaving the device stuck
on PCI Express Gen 1.

changes in v2:
- Included the same patch for Iceland
- Reworded the patch messages
