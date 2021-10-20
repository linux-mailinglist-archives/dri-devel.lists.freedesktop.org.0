Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B56043510B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 19:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3857E6E13A;
	Wed, 20 Oct 2021 17:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1926E13A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 17:14:24 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 y15-20020a9d460f000000b0055337e17a55so1618407ote.10
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 10:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bH8bzWordrBPaRkjYl4H2o6uElofK80vQkMqzZLeV8k=;
 b=Dd5sDh9GAh1DnLARXlVR24rfGMecPEynsV8E1Xb1ZPcCgUDkTCSGtfKuNknTzBcTXJ
 4sSQF/82dDDzAUony3UsNvdilaWDMgQgw4/6VXfHyEzA7USmRPa/OZ8nMkJscsfqMpk+
 YeZtWvvCok9ewpLXFfah1Mt0O0BvBgTzLaM8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bH8bzWordrBPaRkjYl4H2o6uElofK80vQkMqzZLeV8k=;
 b=OVxTQ/2xrTEPxZhqEomdFsG38+2njANxsMD+5OP/MEdLcAFmRq76y/Yqi9+Au8xH9u
 AuI3nPSuSyy7srTp5PZfvABoayMJ3ZmQl/dGYrQczSt07+LgKAwfyjkVFODsONlTYMMD
 FlVYGBYbl+sGA+6uJNv+z2BC45xbYas7wkO9ZeMK2Ciymq1QNDSPAv8osCyHGxIxV91X
 dxgpH1RfqEDp/itGmm+ULGAqnfJQ7SG7P5bto6R6nosysgab/w0YBqi/mZMea9CTqwN5
 I2TOIqN7Ybl3yal0qbRrcAg6q4+Afcjty5lB8zAowb3ftISUHJ+mgAWJVDVWDJ7JR0eK
 xDWQ==
X-Gm-Message-State: AOAM530WfZhgmaF/mN6R7zpnlEUDn5+n2/y381pFvF/st6fPO4aeyVjc
 aA1Eh6kgAYH3i7hC5UzdsHacZjd1bsSWYg==
X-Google-Smtp-Source: ABdhPJz/NkEi4Jrm0miMG8Nb/R921Ryid5QI97ArYitntPKAKFscTGRNbHzvhVJfaEoByAnD1h7YqA==
X-Received: by 2002:a9d:1c8f:: with SMTP id l15mr383424ota.337.1634750063028; 
 Wed, 20 Oct 2021 10:14:23 -0700 (PDT)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com.
 [209.85.161.47])
 by smtp.gmail.com with ESMTPSA id t24sm552449otk.58.2021.10.20.10.14.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 10:14:22 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id
 r1-20020a4a9641000000b002b6b55007bfso2205562ooi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 10:14:21 -0700 (PDT)
X-Received: by 2002:a4a:be0a:: with SMTP id l10mr381504oop.64.1634750061332;
 Wed, 20 Oct 2021 10:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211019175932.1.I96669f75475cbb0ae1749940217876aa8991b703@changeid>
In-Reply-To: <20211019175932.1.I96669f75475cbb0ae1749940217876aa8991b703@changeid>
From: Brian Norris <briannorris@chromium.org>
Date: Wed, 20 Oct 2021 10:14:10 -0700
X-Gmail-Original-Message-ID: <CA+ASDXN5_NrXfaoE-SVphyQG4Qqqktrk85QQX0W16=dOiaro7A@mail.gmail.com>
Message-ID: <CA+ASDXN5_NrXfaoE-SVphyQG4Qqqktrk85QQX0W16=dOiaro7A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Fixup drm-misc website link
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Tue, Oct 19, 2021 at 5:59 PM Brian Norris <briannorris@chromium.org> wrote:
>
> https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html gives
> HTTP 404, and https://drm.pages.freedesktop.org/maintainer-tools/
> redirects to freedesktop.org now.

With a dash of irony, I actually listed the wrong URLs in the
description. (I used the properly-redirected ones, and claimed that
they were the broken ones.)

I'll send a v2, so a maintainer doesn't have to fix that up for me.

Brian
