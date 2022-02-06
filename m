Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F614AB1C5
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 20:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A185510E524;
	Sun,  6 Feb 2022 19:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ip-94-112-206-30.net.upcbroadband.cz [94.112.206.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DD210E524
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 19:40:54 +0000 (UTC)
Received: from [10.0.0.111] (_gateway [10.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id 2DA9A20056;
 Sun,  6 Feb 2022 20:40:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1644176453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GszLNhMexLpLLdemM84LTJhxhkHraxd8L6Hl1gvyo7k=;
 b=W8l16qF2FXpoSLj8nP+5jXthayGpPU4iuSNBhwCiDHSMvlzNUqvdrdwl00mzY9Re2QYC15
 5HvtPQ+bbo5MkvAlVZLQOOK4dVUkPpup9+73rDeb6gtuZSy1AISm/k9M+69BoFiE1NYbNU
 8cmHzahnRWjvujlkCMufvh/rruC+Q9s=
Date: Sun, 06 Feb 2022 20:40:47 +0100
From: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] drm/panel: JDI LT070ME05000 remove useless warning
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <ZNEW6R.0SLJU7L5A6PW2@ixit.cz>
In-Reply-To: <YgAg+lklFqPhVgS8@ravnborg.org>
References: <20220206190702.450643-1-david@ixit.cz>
 <YgAg+lklFqPhVgS8@ravnborg.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 ~okias/devicetree@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 6 2022 at 20:26:50 +0100, Sam Ravnborg <sam@ravnborg.org> 
wrote:
> dev_err_probe

Amazing, thanks I'll send fix right away.
Davi


