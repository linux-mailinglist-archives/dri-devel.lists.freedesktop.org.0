Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAC741A418
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 02:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602A789CD7;
	Tue, 28 Sep 2021 00:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255FB89CCE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 00:16:47 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id h129so25184428iof.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 17:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/5dEdhTiuiXUcKyE8+qu27KWg9nkXOmkfc3S6tONh9w=;
 b=eV1eZYpgLdAFLMSBnQumKi/NMNPzCruD5J7NcP4BHYyTIn+LWVnWO0xiT3PxB+26Ss
 zbF+nMv39DFBxk93ke10knTVmSoUanCgN2HbO8LN8QuKskolr2kP+uBdo6Nt+wiQa17m
 7HSqYbZAlgk1TyuIsMvPDN9pbxmto1TS6bB3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/5dEdhTiuiXUcKyE8+qu27KWg9nkXOmkfc3S6tONh9w=;
 b=ypJwNDI7wP/k5Tjebqgmg8Bk27fxS3ksprc+Hjkj2/ePvklAtUhMVD+SkT7upi9bGE
 s27EfvbewmyntcuG7099q7+tD3pt2/K0QisZ/m4DRHPFzCSy6Kbm2ZsxeBFvVXLMnlAG
 OdKXbK54PapTrhlpy8gZl8gCaJouSCMgCFjCP6wn4vVzCM0aBH1RKHObTHbM4CPzpfXN
 dS0i6U8XOYNGYz1v8MD5L5h1P28gaYsdugovsT7vnY9bn9czehAsjWdXflwbHtZmD0RA
 rbwwLljWyuPZSmXf+FiUxf4D9poz8l8FbE/35yxOWzbeHw4TtHWwb3n7OSAdSurnioYb
 dz9Q==
X-Gm-Message-State: AOAM532CyLhuh0vAnTM3wkMuElxVGaIFHBmPOw40wE6H7Pb/b7r/+wlL
 iHtQ9NtY9t/ETO3K32YEhaKS/D82xl8r/g==
X-Google-Smtp-Source: ABdhPJy/qebBgilj1074Q3d/O+fVP7guCwv+kQODLCMUdT9pZh60st8vBATrEl35BOFk9X0KG5B9Lw==
X-Received: by 2002:a05:6602:2188:: with SMTP id
 b8mr1753215iob.217.1632788206402; 
 Mon, 27 Sep 2021 17:16:46 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com.
 [209.85.166.169])
 by smtp.gmail.com with ESMTPSA id i132sm9325927ioa.14.2021.09.27.17.16.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 17:16:45 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id k13so6026528ilo.7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 17:16:45 -0700 (PDT)
X-Received: by 2002:a05:6e02:1847:: with SMTP id
 b7mr2160620ilv.180.1632788204948; 
 Mon, 27 Sep 2021 17:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210927074104.1.Ibf22f2a0b75287a5d636c0570c11498648bf61c6@changeid>
In-Reply-To: <20210927074104.1.Ibf22f2a0b75287a5d636c0570c11498648bf61c6@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 27 Sep 2021 17:16:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XrAk087-ft3c5kYAkWSUGyrXGqT2YnyrDa9XmSDupiLQ@mail.gmail.com>
Message-ID: <CAD=FV=XrAk087-ft3c5kYAkWSUGyrXGqT2YnyrDa9XmSDupiLQ@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: Fix drm_edid_encode_panel_id() kerneldoc warning
To: dri-devel <dri-devel@lists.freedesktop.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 LKML <linux-kernel@vger.kernel.org>
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

Hi,

On Mon, Sep 27, 2021 at 7:41 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> Due to a simple typo (apparently I can't count. It goes 0, 1, 2 and
> not 0, 2, 3) we were getting a kernel doc warning that looked like
> this:
>
> include/drm/drm_edid.h:530: warning:
>   Function parameter or member 'vend_chr_1' not described in 'drm_edid_encode_panel_id'
> include/drm/drm_edid.h:530: warning:
>   Excess function parameter 'vend_chr_3' description in 'drm_edid_encode_panel_id'
>
> Fix it.
>
> Fixes: 7d1be0a09fa6 ("drm/edid: Fix EDID quirk compile error on older compilers")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  include/drm/drm_edid.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Pushed with Randy's Ack to drm-misc-next:

116e5947d7bf drm/edid: Fix drm_edid_encode_panel_id() kerneldoc warning
