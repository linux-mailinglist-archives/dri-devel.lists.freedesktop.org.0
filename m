Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FEE4B7B0E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 00:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E0710E696;
	Tue, 15 Feb 2022 23:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AADD10E696
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 23:11:54 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id m185so289755iof.10
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 15:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RS9LJJqmWh2HshOHeCWOhECU3+chlrbjdRDe3zN6X9M=;
 b=H3bimkVRJOknA0aIROgu2Emj9m+d2cHFSVAZdO3VDMB9C2wmDyi0GpYAphtkdW5T9l
 t2vyE2yOlh0+55slm821IvlxRGaKvbnhxFvzX4eRbrxX7KE9aJqBlZqzyLfQbcaGAcB5
 i8Toqhd012JS44MZovroT1JLm5LHghliYvR6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RS9LJJqmWh2HshOHeCWOhECU3+chlrbjdRDe3zN6X9M=;
 b=fAXIKbRE1S2A4d0AZKdvbdHdwPoFfqPsJUZv246aitPrDgIzPZyFoBLV5dw4mwx9ix
 yvtZZROwRIfi1guqeu2ZPjvrF27OH5bAK7g34xyhTcGDyAO87BVk5xBP4Ws421n+U0T0
 75yDN28Fcy02NjOAP9/+G+FqJJg6dnrWNI03SFwGzStDd2Z9sKWaF08PafSwlmnLYYW8
 OeetDfZCg1B/fG3tmP1Gag6W4c3tZuKjN8DyIQIdG0P8pW2N03W+Idgy10t8zjTlkEWj
 6GZHaVFYa6DZQTE7GueaNKp8UZqis//W6G1p7VWJMhrRrdKc3Me1viTnTD9Jcm30Y1bk
 dA/Q==
X-Gm-Message-State: AOAM533oL70vqWBjeoN9jcmUDzfCKYCxG0YTpg/9LqornesWGuzV7DyO
 DYFx7lwjwR2jA4Hx6gpQI4dgl4+gC0x8LQ==
X-Google-Smtp-Source: ABdhPJwWdeNCHGqNknJOXb3pzzvi2gLJwNRKC9HmL16Zvu2V94bcpel1Zwv4kl73fVgh1/t58cNckg==
X-Received: by 2002:a05:6638:3003:: with SMTP id
 r3mr762795jak.239.1644966713673; 
 Tue, 15 Feb 2022 15:11:53 -0800 (PST)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com.
 [209.85.166.171])
 by smtp.gmail.com with ESMTPSA id k1sm24208122iov.6.2022.02.15.15.11.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 15:11:53 -0800 (PST)
Received: by mail-il1-f171.google.com with SMTP id c14so190326ilm.4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 15:11:53 -0800 (PST)
X-Received: by 2002:a05:6e02:12ef:b0:2be:2c34:17b2 with SMTP id
 l15-20020a056e0212ef00b002be2c3417b2mr39472iln.120.1644966712975; Tue, 15 Feb
 2022 15:11:52 -0800 (PST)
MIME-Version: 1.0
References: <20220205001342.3155839-1-dianders@chromium.org>
 <20220204161245.v2.2.Ib0bd5346135cbb0b63006b69b61d4c8af6484740@changeid>
 <5d60473d-be8f-e2dc-2ce9-bc0b9056e4b4@redhat.com>
 <e6670fd7-1f75-56f7-b668-20db9902cac6@intel.com>
In-Reply-To: <e6670fd7-1f75-56f7-b668-20db9902cac6@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Feb 2022 15:11:41 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ut3N9syXbN7i939mNsx3h7-u9cU9j6=XFkz9vrh0Vseg@mail.gmail.com>
Message-ID: <CAD=FV=Ut3N9syXbN7i939mNsx3h7-u9cU9j6=XFkz9vrh0Vseg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm: Plumb debugfs_init through to panels
To: Andrzej Hajda <andrzej.hajda@intel.com>
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
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, lschyi@chromium.org,
 Sam Ravnborg <sam@ravnborg.org>, jjsu@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Feb 15, 2022 at 2:20 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>
> On 15.02.2022 23:09, Javier Martinez Canillas wrote:
> > Hello Doug,
> >
> > On 2/5/22 01:13, Douglas Anderson wrote:
> >
> > [snip]
> >
> >> +static void panel_bridge_debugfs_init(struct drm_bridge *bridge,
> >> +                                  struct dentry *root)
> >> +{
> >> +    struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> >> +    struct drm_panel *panel = panel_bridge->panel;
> >> +
> >> +    root = debugfs_create_dir("panel", root);
> > This could return a ERR_PTR(-errno) if the function doesn't succeed.
> >
> > I noticed that most kernel code doesn't check the return value though...
> >
> >> +    if (panel->funcs->debugfs_init)
> > Probably if (!(IS_ERR(root) && panel->funcs->debugfs_init) ?
> >
> >> +            panel->funcs->debugfs_init(panel, root);
> >> +}
> > [snip]
> >
> >> @@ -436,6 +436,9 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
> >>      /* vrr range */
> >>      debugfs_create_file("vrr_range", S_IRUGO, root, connector,
> >>                          &vrr_range_fops);
> > Same here, wonder if the return value should be checked.

My plan (confirmed with Javier over IRC) is to land my patches and we
can address as needed with follow-up patches.

I actually wrote said follow-up patches and they were ready to go, but
when I was trying to come up with the right "Fixes" tag I found commit
b792e64021ec ("drm: no need to check return value of debugfs_create
functions"). So what's being requested is nearly the opposite of what
Greg did there.

I thought about perhaps only checking for directories but even that
type of check was removed by Greg's patch. Further checking shows that
start_creating() actually has:

if (IS_ERR(parent))
  return parent;

...so I guess that explains why it's fine to skip the check even for parents?

Sure enough I confirmed that if I pass `ERR_PTR(-EINVAL)` as the root
for `panel->funcs->debugfs_init()` that nothing bad seems to happen...


> I've seen sometimes that file/dir was already created with the same
> name, reporting error in such case will be helpful.

It sure looks like start_creating() already handles that type of
reporting... Sure enough, I tried to create the "force" file twice,
adding no error checking myself, and I see:

debugfs: File 'force' in directory 'eDP-1' already present!
debugfs: File 'force' in directory 'DP-1' already present!


So tl;dr is that I'm going to land the patches and now am _not_
planning on doing followup patches. However, if I'm confused about any
of the above then please let me know and I'll dig more / can send
follow-up patches.

-Doug
