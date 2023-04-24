Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A206EC967
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 11:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B758110E448;
	Mon, 24 Apr 2023 09:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D6010E448;
 Mon, 24 Apr 2023 09:50:20 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-94eff00bcdaso747886166b.1; 
 Mon, 24 Apr 2023 02:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682329818; x=1684921818;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9Is2thnxMX0NfS0ATfXggVukIP4xt06PqoAtrJstbVw=;
 b=Y863QaepaDFc/zBRlmtqWeoRVTVKKterbJixxWjJYjqZD4Oo5MOaqD2gUS2FjoyFcv
 oOvOhGMxHoosA3Ja91da4xlxUK+eGWEqATjBaM/1ScTDlK1xQR03BfO3R/XIqW5a3G6d
 XgsRpbBnJywGLuG0H1K8cp8TR/ojcU7g5jMHMmdOsp1rUDr2qFyCtuOq+Fb5/YhJL5L7
 8JKWOiqVL4DfyDFbfvYzBAvMyClfWeapNecihQbJ0pHJ4Jm5c3QIvsNWiwSygrRGyZUi
 OdvcCMf87omaBkOx5i/vXXpJCKtMYqNX370sA5eJG56xieJ4RhcHN/SWlGZFrcQA4RvD
 /+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682329818; x=1684921818;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Is2thnxMX0NfS0ATfXggVukIP4xt06PqoAtrJstbVw=;
 b=jAzXqp59EazZbcArhPG5j74Er2S6qiOcRjYCriAiVKN4J1MJWh05lLg+CHrlhEdiDU
 l8XfWgpoOK0GHXTCxIDwbbap0AqcYs+Ec2CFPzFMU3SGRQmaLBckhfzcrsGPcL4Ac2Uz
 daymeuazbBXKLxAjd6Za5IMR8jAqizd8/3I32fGeOZAK0PnlJ+Q+Zr95wNNUcIhnYNLb
 2CnQ4Zo1YtGP4l1xdgWsYpi3t/z0+ABmYAbljdRns9gMeBCMmwAIKuamHMXvlVGeF2MP
 +YWsRIfmNHj0nTxcqx0doJyzqTfLFsWZrfrtHBFNVwcvDng2vrSqrRj+53amJI5pGoN9
 DvoQ==
X-Gm-Message-State: AAQBX9cHT2+NeV/Ix/0z3ciWr0mgNW15n+yZB/82vNeSdYNS41ICisZT
 c0EiLxsqdL5uLGeLxZESdxNd9wmQgGr4mbsth6M=
X-Google-Smtp-Source: AKy350a8PgtY0Rv9tw+XuKO2+y8O6JuUL4PcYTcSolhIOBGMSaCPgR6j0orK/qM1thAKjN0MD/AWnbDXvNKqyHQ0VBM=
X-Received: by 2002:a17:906:8a44:b0:94f:553:6fd6 with SMTP id
 gx4-20020a1709068a4400b0094f05536fd6mr9465953ejc.24.1682329818094; Mon, 24
 Apr 2023 02:50:18 -0700 (PDT)
MIME-Version: 1.0
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 24 Apr 2023 11:50:07 +0200
Message-ID: <CAKXUXMziSWC9oGVQxCPs6U5GsnuA2KbKsobj1Feo_eNUn3e4dg@mail.gmail.com>
Subject: In-flight collision: DRM_AMD_DC_DCN renaming
To: Michael Ellerman <mpe@ellerman.id.au>,
 Harry Wentland <harry.wentland@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

Dear Michael, dear Harry, dear Alex,

The commit 4652ae7a51b7 ("drm/amd/display: Rename DCN config to FP")
renames config DRM_AMD_DC_DCN to config DRM_AMD_DC_FP. The concurrent
commit 78f0929884d4 ("powerpc/64: Always build with 128-bit long
double") overrides the renaming change for the select in config
DRM_AMD_DC, and this leads to selecting the non-existent
DRM_AMD_DC_DCN.

It is easy to fix, adjust this one line to the renaming and 'select
DRM_AMD_DC_FP' once both commits are merged. For now, I am just
reporting to let you know; probably, it is best to get a quick fix-up
patch with -rc2, once all the changes landed in -rc1.


Best regards,

Lukas
