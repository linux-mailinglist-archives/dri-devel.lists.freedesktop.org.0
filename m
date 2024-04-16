Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFA48A760A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 23:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F8710F345;
	Tue, 16 Apr 2024 21:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFEE10F345
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 21:00:33 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B4B3F4067F;
 Tue, 16 Apr 2024 23:00:30 +0200 (CEST)
Date: Tue, 16 Apr 2024 23:00:29 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm: Fix no_vblank field references in documentation
Message-ID: <diiw2ptq4hsqby2zacdejeqyhksc4225atvmos2j74rklnw4v3@tdr5d5c24tpf>
References: <20240416-drm-no_vblank-kdoc-link-v1-1-a1d8d1e9ff34@somainline.org>
 <4c882a69-8609-4b39-a95d-3128027373e1@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c882a69-8609-4b39-a95d-3128027373e1@infradead.org>
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

Hi Randy,

[..]

> Do you see differences in the generated html for these changes?

I have not yet generated the HTML locally to test this patch, but will surely do
if that's a requirement.

> "&struct somestruct" and "&somestruct" should both be OK AFAIK, although
> Documentation/doc-guide/kernel-doc.rst seems to say that using
> "&struct somestruct" is preferred.

Keep in mind that this patch is about field/member references.  Quoting the
relevant paragraph under "Highlights and cross-references":

  ``&struct_name->member`` or ``&struct_name.member``
    Structure or union member reference. The cross-reference will be to the struct
    or union definition, not the member directly.

This lacks the struct tag entirely, and observation shows that links with them
don't highlight correctly (hence this patch) while member links without struct
tag are clickable and have an anchor link to their parent struct.

- Marijn
