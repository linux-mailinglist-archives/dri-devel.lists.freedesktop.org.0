Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D718060BA30
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 22:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F46310E0A0;
	Mon, 24 Oct 2022 20:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAB610E00A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 20:28:41 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x2so6139332edd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 13:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FXgFJbS2a63KBWIYrk1JkOqFCuXa2BXSDEikjukgc/I=;
 b=a23igI6xFUkOVmrwWcYqJt/zrTqVWiDSUSusTeW1jwopdesRRdT8n6XfnDDeDLn/AL
 Bs14Yi6j6xJlpkkbsvxdFjZGU0B4I9nGF5b+LNvwUuLMAz038OKN1V+NN/1Bn3TcRIXX
 z03BE1QBny7+Oz1nv/l/M4Iyn0MKVmnZQlFHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FXgFJbS2a63KBWIYrk1JkOqFCuXa2BXSDEikjukgc/I=;
 b=TNdtVC6AGKBUcwIoGfq7NqVJFBxGK49Gj2VyU4wqvMMH3cwS3DrvNwJYheOG4R8iog
 0naUOidppjhtke8H85Ks7jhMYG53nQGw+vZ7MMPHlUR36vKOlCbEYLtFOUF2bjGmKzVG
 OdenoFiVve9K0NKRdmjYdvfkjEiyWueNChuJbYYQ0849IOc9NVIPXu0svan0qpnFEjvs
 /3M8RsFBXdy8itsNeUy8AM/pEnvFu+NCjnpRGFf0CKZC0iDJxB1ze9S/KL+dB4uvFjw9
 +fX1i5V+3aIStg4cms5DJb/4UDkjLz0G+98DjCrnQZF9cmGqGn1GjQJDCKG91hjgu0hH
 szSw==
X-Gm-Message-State: ACrzQf1n8/CBKMLuAGh2AhPyoeet1qb0rbBQX9b+whUcPFECo2wAexj5
 CRfutsDIabJ1Zb/uUhH5wVees8LK8K2+LIBj
X-Google-Smtp-Source: AMsMyM5y6VWbDHVG7FuOG3hiqOnAxw/wG3J5Gi7CYPsZAxpo+Johd1DJN5FXYu3fXkJ7j3YX0qgUSw==
X-Received: by 2002:aa7:cb09:0:b0:461:e6b6:4bad with SMTP id
 s9-20020aa7cb09000000b00461e6b64badmr3801708edt.27.1666643319385; 
 Mon, 24 Oct 2022 13:28:39 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 ky21-20020a170907779500b0079de6b05c99sm327721ejc.138.2022.10.24.13.28.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 13:28:37 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id l32so7189820wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 13:28:37 -0700 (PDT)
X-Received: by 2002:a05:600c:5493:b0:3c9:c18:87d5 with SMTP id
 iv19-20020a05600c549300b003c90c1887d5mr9525360wmb.188.1666643316677; Mon, 24
 Oct 2022 13:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221021130637.1.I8c2de0954a4e54e0c59a72938268e2ead91daa98@changeid>
 <e6bc800b-2d3b-aac9-c1cb-7c08d618fc8e@quicinc.com>
In-Reply-To: <e6bc800b-2d3b-aac9-c1cb-7c08d618fc8e@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Oct 2022 13:28:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V4m5HNavewSTkrh64_BzLAkivR2mRkTQdaxA8k9JKQbA@mail.gmail.com>
Message-ID: <CAD=FV=V4m5HNavewSTkrh64_BzLAkivR2mRkTQdaxA8k9JKQbA@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: Dump the EDID when drm_edid_get_panel_id() has
 an error
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Oct 21, 2022 at 2:18 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Doug
>
> On 10/21/2022 1:07 PM, Douglas Anderson wrote:
> > If we fail to get a valid panel ID in drm_edid_get_panel_id() we'd
> > like to see the EDID that was read so we have a chance of
> > understanding what's wrong. There's already a function for that, so
> > let's call it in the error case.
> >
> > NOTE: edid_block_read() has a retry loop in it, so actually we'll only
> > print the block read back from the final attempt. This still seems
> > better than nothing.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Instead of checkinf for edid_block_status_valid() on the base_block, do
> you want to use drm_edid_block_valid() instead?
>
> That way you get the edid_block_dump() for free if it was invalid.

I can... ...but it feels a bit awkward and maybe not quite how the
functions were intended to work together?

One thing I notice is that if I call drm_edid_block_valid() I'm doing
a bunch of duplicate work that already happened in edid_block_read(),
which already calls edid_block_check() and handles fixing headers. I
guess also if I call drm_edid_block_valid() then I should ignore the
"status" return value of edid_block_read() because we don't need to
pass it anywhere (because the work is re-done in
drm_edid_block_valid()).

So I guess I'm happy to do a v2 like that if everyone likes it better,
but to me it feels a little weird.

-Doug
