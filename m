Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8C0404402
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 05:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E1A6E435;
	Thu,  9 Sep 2021 03:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32236E433;
 Thu,  9 Sep 2021 03:36:00 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id t19so648754ejr.8;
 Wed, 08 Sep 2021 20:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hpg40jsnlZx9RJsns1lWxt5GXbxG7WvlaTlyex72jpQ=;
 b=ReSkdrAOYOD7PLc7Tzr1WIUWjSr5yTPAc8J0j+SyAnzlTucknRCnuRZYHHo4xvhZ/e
 RxTlvpDLlsSFqSRrc0uMeA76+Wi7KLOHvJ1eDYGl2GlXcPXwlcKVzAwzUQQHycdX1hdd
 8+NCPpOxm53XFFm3RbdrXyVOS1O+RZnkX8PojXgCfgmm9F87CpaI+Qet6SQ5jddERiD7
 CSRSA6nYi/ND5hbhJl+gDzMJACw99k4dGexmw4M1hGmh1L2/M2BdFjUosj9N0/TGOeCH
 /DT79YFOPPQZNiHqlpUoUI58lKjJ+IZf2hiLqR+EeJ0ucUzY549Ms3wxnm10qjvLcVDp
 Y6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hpg40jsnlZx9RJsns1lWxt5GXbxG7WvlaTlyex72jpQ=;
 b=GrCQN03elxCXjk3+QHXvdKWjwZt62DDNdOjJfPHi69dGJHdG1x/Mz5VWp0rn+h7SeO
 a40RgIQsrkStCtUrsld2vQRDSDP+4RHnPF2TBTw5oAcUpbiKZjA0rFgh39T8tbE0pmnt
 EPrmdzJfN8rpZe3k2RuTJ2myY0obD1vnlr8mco/0ocqquJDR3nQr2IZGn9XKAbFtHNEO
 KuajeppjWMjDMT3blWhtQeFFFgFBIi21yilBRZwn2shW0kkj3kFmHEgmyQGKfhfLgdEM
 m9RAJVcW/j9d8/kQjf+HMYVNn18hpoLSnV7UjZFcx5I3d9RC/o3Bw6UJPipLHG5D2S7d
 T/8A==
X-Gm-Message-State: AOAM531dq3n0oesMtZQPEliLrNe0DBPu52NoZpGd3Ktkw3qnyVRB9nU9
 iLdr6MN6M4YOLcdfxnvCBI6bY0cBk0xmTaLtJZs=
X-Google-Smtp-Source: ABdhPJwqdbP1em7+rKNezTBkNmtEpqsIk4XXYmzIOL3JRthHhvxYTsa5tUyX0Q6yPMfvk1CKGlrIx2BTb6RvDTtbQgc=
X-Received: by 2002:a17:907:384:: with SMTP id
 ss4mr1067789ejb.478.1631158559323; 
 Wed, 08 Sep 2021 20:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <YTj2Y0MKu51CZdbW@linux-uq9g.fritz.box>
In-Reply-To: <YTj2Y0MKu51CZdbW@linux-uq9g.fritz.box>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 9 Sep 2021 13:35:48 +1000
Message-ID: <CAPM=9twpHCGLh3nYeTF69woSFWpuWUT+Zk48YyOX3zzNLFLw+g@mail.gmail.com>
Subject: Re: [PULL] drm-misc-fixes
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>
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

On Thu, 9 Sept 2021 at 03:44, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi Dave and Daniel,
>
> here's this week's PR for drm-misc-fixes. One patch is a potential deadlock
> in TTM, the other enables an additional plane in kmb. I'm slightly unhappy
> that the latter one ended up in -fixes as it's not a bugfix AFAICT.

To avoid messy merge window, I'm not pulling this until after rc1
unless there is some major reason?

the current drm-next doesn't have v5.14 in it, and the merge is rather
ugly right now.

(maybe I should always pull it in before sending to Linus to avoid
this in future).

Dave.
