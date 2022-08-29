Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA31D5A5B30
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 07:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D489A10E2E1;
	Tue, 30 Aug 2022 05:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221C910E0DF
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 19:02:46 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id l5so6904921qtv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 12:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc; bh=pIxGeluzGYEKzBZac878nAVYb/MGQD02kaqzGhI5soE=;
 b=grYLPBfbpBFgKFqkSlWko72q8lwjufsjsE/1/jVNSz8M51ZLimPU4INaXeTpCGwbqu
 fpARIQTikb4m+fTiEvbEdTOUsCbm87y6kmK0y/IzPpe+uumC/F4xqZdfNn2rlMbsyY/j
 2ZgKYd/EfMOVNwJaLRlFuQfRnSWEgfHVdHM7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=pIxGeluzGYEKzBZac878nAVYb/MGQD02kaqzGhI5soE=;
 b=yc89NNVquxOA4uLhaxr7q0FwLQTSyp53JqeBUml5dq/9cULnfQyBFz2Q/hIk0H9IXl
 05DLYHkspVHWwMEGamhQLne080shHCc/goCaxuJBOzUgA2hkVkS6Z+DlxoYDwyZQt33g
 ekpVOuUh7hCmqYWxGK6/UxDqbORbAn8mQ3ryxmMwermbyJsu5VGs7osMoomyvsZOO4XK
 qYHQ4xt9EaaDAaqixqOe2bgQjUTy/d5iVjE0NvPshC/6tJ+CUM+0rjQRW3Yyr3kqdCFp
 Sa6Qrw62ACUqzWKNXuahuO1fxKTMAjgVcr+tKevFR/ZLEzoc164nZDcEAt9dgHhJo9yK
 +ckw==
X-Gm-Message-State: ACgBeo0hmvR+EItYpqXey4S8vnC5ASkLyDlLiA5CnB/lZJ4rHeBRk9wN
 VsW3ITDUzRKqrlC2wNoRYOfavg==
X-Google-Smtp-Source: AA6agR7cohvIoKMHY1SJ+uPe6QOIMSrdGY61QE9x43N6PZX9CYY3REZteRsH6f6P7prXXMGQNDmESg==
X-Received: by 2002:a05:622a:14cd:b0:344:6cfa:42f9 with SMTP id
 u13-20020a05622a14cd00b003446cfa42f9mr11639737qtx.147.1661799765067; 
 Mon, 29 Aug 2022 12:02:45 -0700 (PDT)
Received: from meerkat.local
 (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
 by smtp.gmail.com with ESMTPSA id
 t17-20020ac86a11000000b0031f287f58b4sm5405223qtr.51.2022.08.29.12.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 12:02:44 -0700 (PDT)
Date: Mon, 29 Aug 2022 15:02:42 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 01/41] drm/tests: Order Kunit tests in Makefile
Message-ID: <20220829190242.tk2hinttzzmzhnaj@meerkat.local>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-1-459522d653a7@cerno.tech>
 <f6289e5d-98e3-1a0d-f514-136e2b7978c1@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6289e5d-98e3-1a0d-f514-136e2b7978c1@tronnes.org>
X-Mailman-Approved-At: Tue, 30 Aug 2022 05:37:20 +0000
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 29, 2022 at 08:46:42PM +0200, Noralf Trønnes wrote:
> Something has gone wrong with this patchset, there are double line endings.

I noticed this, too, and I think the reason is because these patches were
generated with "b4 send -o", but actually sent using git-send-email. It's not
a use-case I've considered (or tested) and the breakage is because when b4
generates patches with "-o", they are written with CRLF line endings, which is
not something git-send-email expects.

Maxime, any reason you went this direction instead of just letting b4 send
these patches directly?

-K
