Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0879C783D77
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 12:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD3B10E2EB;
	Tue, 22 Aug 2023 10:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0325C10E2EB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 10:01:54 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3197808bb08so3980440f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 03:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692698512; x=1693303312;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=sDCtXFEECpWJDk6quBpM0DOMAIiEbGdQcEBXF1hfO80=;
 b=gz9f5iqI2lgRcr6XunVYC1iJZsi5Sx+Un5Pj6leCbbYAMeJ+loIlbMYTK4Wq3+aCAc
 6h4GvKz+diIdph5d3RDI+3cCjWJxv6pqMMh77d9MXsDI52oCSb7MIeSyXqgBr0klWc/E
 GCOQw3dS7vfMRfuUoIxbsx6+GCfyFs/D1nqw/L87NIRrqQ9qHC+Oz5Cuhs9TVAIEGyXq
 rgXQHTo6ev0n05XcYC8AS5sv1Qq6kaFi7pd0KbsvX18kOvG7n4Z2b+Bcvp3hZwVZk/nS
 ZFpzqvHRSjoU5SYGLTWFwb6fssiRqgKdIX9zCxDHaZcBg0QiKZHqOLsnnZFReEnAuPMx
 ZcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692698512; x=1693303312;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sDCtXFEECpWJDk6quBpM0DOMAIiEbGdQcEBXF1hfO80=;
 b=JEK0LHHQRg/C8EuEGiriPwlMCQO2eO91kRnwFFBXlE9NGzPksHvdtjjzii4KB4rD33
 6Cc2skF+PwL4dtwLP9LRhR1ydtSAFy8BUoOPokaMhrtGjUlKzh7IUPxYS5MgdG57liqN
 IatVY8zknn8PsTtOXRDo/4bol+M3WKSJ2hex8aTYzw2Qq7VJYD5RFHRZJ1jylXSNRZk8
 cqmtm5rGlk5gywiJa4Bo4F3AicVo9lEjZ+cFCzxbpydg8LUTJ/Y6k8jFqht+QgtwzFKe
 G2P6Ds5pTL8E6oJqMEjv4Gu1OTpil9mnotoOE5WguKlvT3sG04zBfIf4CYLQdeuMGYGo
 V8cQ==
X-Gm-Message-State: AOJu0Yy3yvaBd/gSKAXj/2T4XFS5MDGOd1QcDQ3EcFrrS+NVhPI0M/XU
 gZDZYGmbKRCIcXKOBwmsH7FClHM93Jproh0rGkDQAvImxmg=
X-Google-Smtp-Source: AGHT+IFlp/ZrIxOe+hDi5tOMs7hIPqF1U49MLC+QL88ktYvP5lZXhq95YKYAC81AyFtlNURwWlR0wyAVyW/kLh0t8io=
X-Received: by 2002:adf:ec8a:0:b0:313:f61c:42ab with SMTP id
 z10-20020adfec8a000000b00313f61c42abmr6853719wrn.56.1692698512414; Tue, 22
 Aug 2023 03:01:52 -0700 (PDT)
MIME-Version: 1.0
From: Sharq Mohammad <sharq0406@gmail.com>
Date: Tue, 22 Aug 2023 12:01:41 +0200
Message-ID: <CANgPUHw7yHBXumXYMAG0Z4Xn6Pb1BNvU7saw=_gQ6m7Xdc-Pbg@mail.gmail.com>
Subject: TODO list task: Replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000008b5c2406038015e9"
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
Cc: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000008b5c2406038015e9
Content-Type: text/plain; charset="UTF-8"

Hello All,

I am a usual kernel developer, and wanted to contribute to the open source.
I saw a small TODO list in the DRM graphics subsystem, with some tasks.
So, just wanted to ask, is anyone working on the task:
*Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi*

Its on the TODO list.

Thanks and regards,
Sharique

--0000000000008b5c2406038015e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello All,</div><div><br></div><div>I am a usual kern=
el developer, and wanted to contribute to the open source.</div><div>I saw =
a small TODO list in the DRM
graphics subsystem, with some tasks.</div><div>So, just wanted to ask, is a=
nyone working on the task:</div><div><b>Replace drm_detect_hdmi_monitor() w=
ith drm_display_info.is_hdmi</b></div><div><b><br></b></div><div>Its on the=
 TODO list.</div><div><br></div><div>Thanks and regards,</div><div>Sharique=
<br></div><div><b><br></b></div></div>

--0000000000008b5c2406038015e9--
