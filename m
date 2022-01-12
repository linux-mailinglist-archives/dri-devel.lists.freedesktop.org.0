Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A0448C1EF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 11:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3471137FD;
	Wed, 12 Jan 2022 10:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEFC1137FD
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 10:05:18 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id pj2so3852398pjb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 02:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3jFePgPT/JScz9mDuDmGccDwJEwAb6mDQ3FgJyAIldk=;
 b=TOh3NeNas+5hey/eNaEkfVACPygvId/WHpuYfInWhap/sYw9PSpvty1ZacbtCZbNp5
 pW3M2EV3M4DzIidSAmK6O8Rd+ZxoyZ90li129UTfjdTjF/sdlbz0rPGAD5XY9M0Uxsv3
 MZCh7oWHTYJKDg6amCVsuNI+uqhUeYw2v3FZsCZyrc6OsKC9HryXiLpyXASHVdL2qcXi
 qSmYDgZ+ZHRlswTiAv7pNPK8DNj5zIKXEouoyzmWAE534qirYiEKGPccKsnyXR4Cb7/b
 0cqe0HsMZJchf0nOKxBzyB/Vs5qEhSDAHkHkQFtyLjnGO8HBxLBvRow+UN0udaDOAlQO
 XADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3jFePgPT/JScz9mDuDmGccDwJEwAb6mDQ3FgJyAIldk=;
 b=rLergNvOA4oqH9Bs8QmzbHyrgiiCLnKr6rxpo7fb9AIcaJ4f0l6FwIiPxnx9KLr6dl
 zS+Q9ZsGUUhSJ6O9Lhn/hnHEe4qhK1PoXmcjYkr+Nj9ZfDqW8ijt/jeztR3uo9t1MtFZ
 1nFhsuX2+Fqa8PoWxqlfGXFUkbp5t35LwOWHtkCZ4vtBtq9c8KaaAhOVONncbqmh0Pnb
 EeDcAp3iKPRv328Jya3wB1JkACovUvhRL5mg0zdDWR53U/jr8D382FXYazG2Bk0Iug8F
 mNfokySeNZTrL+1a/xNHwoXgrQDCzt8PF43DYmagtYnHMiPwcKYmY4G6cubYvEAHC+iS
 dzBw==
X-Gm-Message-State: AOAM532xZCM9DBM8QyBnN6Fay8CEz5/VsNnle4pYBuDHb5z6+Jh/saIf
 8caEbpUzVjS+qJp4yIIhZHXJDLQUwavVL5nzWQiJvw==
X-Google-Smtp-Source: ABdhPJzPNGENNvB0VyAQyHdnjEVnzIPtk9o6WfPPk+rOMOSyJXNLKvO67XlZXhDPQwin6zKp6OJ8MKHTKbUvvfzCboE=
X-Received: by 2002:a17:90b:4c89:: with SMTP id
 my9mr8008530pjb.152.1641981918124; 
 Wed, 12 Jan 2022 02:05:18 -0800 (PST)
MIME-Version: 1.0
References: <20220111184347.502471-1-jagan@amarulasolutions.com>
In-Reply-To: <20220111184347.502471-1-jagan@amarulasolutions.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 12 Jan 2022 11:05:06 +0100
Message-ID: <CAG3jFytb_huJfmzPxeOwwBKbRjD0KXq1X49G2ODbif_e5cYp4g@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm: exynos: dsi: Convert to bridge driver"
To: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: multipart/alternative; boundary="000000000000f5300605d55fb446"
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000f5300605d55fb446
Content-Type: text/plain; charset="UTF-8"

Thank you again for catching this and submitting a revert.

Reviewed-by: Robert Foss <robert.foss@linaro.org

Applied to drm-misc-next.

--000000000000f5300605d55fb446
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Thank you again for catching this an=
d submitting a revert.<br></div><div dir=3D"auto"><br>Reviewed-by: Robert F=
oss &lt;<a href=3D"mailto:robert.foss@linaro.org">robert.foss@linaro.org</a=
><br><br></div><div>Applied to drm-misc-next.<br></div></div><br></div>

--000000000000f5300605d55fb446--
