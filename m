Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA06CA2419C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 18:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F29B10E3FE;
	Fri, 31 Jan 2025 17:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kmouL5kH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFC410E3FE
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 17:13:05 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-385deda28b3so1225585f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 09:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738343584; x=1738948384; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v73pmvXqiho5WEdT7QxUjB8R4XydyyW0ihhgFNC55Qc=;
 b=kmouL5kHuAUBnyZk/kQrARWQ95qjRUtnNul8oHevN3hLvlbfswVEEcPpMwJoU77CUL
 +jOtZ/YrXo1NLZt9anG4ih+ieykUk2wcxjzVCGvhw4SRfiowvuL3jduJw68O9WExvATg
 TXvMKPWoc80C3fED27OFQnl+qcJn501wg8vkAu/r8IEIypSAhHSOQN3uaNxwsQfSiGN+
 wdAVSKvOyOfxiDoP4LKB5nSRyTJ5z2KY0eKGI33LLMCv09A6/6S0NblKt7PqzpDygNNX
 VcH82yzE5WBctKpl2YYKEYQ8YQ5eaXWdFbE85bBbuYqCMUciweKYJG00OKF3SHqk52kz
 AvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738343584; x=1738948384;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v73pmvXqiho5WEdT7QxUjB8R4XydyyW0ihhgFNC55Qc=;
 b=ahgY1yZn/rqhf8fUI35q3pcKW7zesqFlgTxJwOGYHttmbCtwLHaKMvW7KSDySfXLtC
 APbUNqMThMy1II+Sk5kW5LpMZthKJinsXq5ohtHmPrG9KTH9fDTCGJapZS9ygPF+UjIR
 kuZOmePpsPmL/Pz91Lx05r9w4oEt9E59wdhHP+e3+3h+jYAhfxNN2opSv2+QiSxsnjFw
 inbfLiBxXUR8n4bgfypE7L8D6MYAyN+ZFL/b8CrzzGteBOFoZHEwfeKxjOvd2EzSKlQQ
 Hk5PiGHuUv3/fvRQTrMbuG7kMfPWa6+wcifUDduVi7/NUpa8zhjqtner03+YAwE3R5sP
 EQmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZFD0KsIj8v7Z4l1sClTqc/deVCQkDWnegBDd7OsZFQ/DUpudBgtFxZio/0WQiLeai8hztS7JlStM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLlR68PDxV8JniWlAGAqhDto4gNGuh2iKjdZW+n0PakT1vg41B
 P9VhdbSatv4PqS1DzIkyEPRYEBiKHGJcDmj1tyIzAyurJvQ74IV2
X-Gm-Gg: ASbGncuxqUXjk7Eknu71FqdoTysCWsALFgfJ+dcQxLcpfS6zUc7Bp0g5kvDd9rBQ0pq
 h52TMNYt6EDzByx/WiXMlOiUoTnRCQKxOhgbrRfpuYDZS/DwXOOLuxg97zjsXL0PEPDWlReSXkq
 PNHpkHjngg9NO5Ljfkz7Nuu02MeI3YyYCeDIDtmZ7WIAxXKySZOg8Ot9oFvSFso8BpseevBPgml
 Y+DtlrhKY/DhNeBWp8TYXjmQM47nTwL1HJUQnBe4XSabwrs3Lr+RmlnccG4lh1NZuyc9i5miPgE
 Ds/2/PVkLHrRQw==
X-Google-Smtp-Source: AGHT+IH3K/xx7YhzgmmclYzzwfqAMEGQp3+WnMXLWIxhdFN6PQfffMt+hjRULJsW6CLlEBnPW87OKA==
X-Received: by 2002:a5d:64e4:0:b0:38a:88b8:99af with SMTP id
 ffacd0b85a97d-38c51951c62mr10419121f8f.22.1738343583672; 
 Fri, 31 Jan 2025 09:13:03 -0800 (PST)
Received: from fedora ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cfccasm5200973f8f.92.2025.01.31.09.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 09:13:03 -0800 (PST)
Date: Fri, 31 Jan 2025 18:13:01 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] drm/vkms: Allow to configure device
Message-ID: <Z50EnT31Fm8EWBX3@fedora>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <Z5uDGr445jEfdt5L@louis-chauvet-laptop> <Z5yYVov9_z6CDU46@fedora>
 <Z5zJ1rEZyBEgd7DN@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5zJ1rEZyBEgd7DN@louis-chauvet-laptop>
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

On Fri, Jan 31, 2025 at 02:02:14PM +0100, Louis Chauvet wrote:
> On 31/01/25 - 10:31, José Expósito wrote:
> > On Thu, Jan 30, 2025 at 02:48:10PM +0100, Louis Chauvet wrote:
> > > On 29/01/25 - 12:00, José Expósito wrote:
> > > > Hi everyone,
> > > > 
> > > > In preparation for ConfigFS support, a flexible way to configure VKMS device(s)
> > > > is required.
> > > > This series adds the required APIs to create a configuration, the code changes
> > > > required to apply it and KUnit test validating the changes.
> > > 
> > > Hi José,
> > 
> > Hi Louis,
> > 
> > Thanks a lot for the quick review!
> > 
> > > Thanks a lot!
> > > 
> > > This series is amazing and better than mine on many points. I have few 
> > > comments:
> > > - a "strange" naming pair: add/destroy (I expect add/remove or 
> > >   create/destroy like other function in DRM)
> > 
> > I used "add" because the function creates and adds a display pipeline
> > items and "destroy" because the opposite function removes it and frees
> > its memory, so I wanted to emphasize that the action was destructive.
> > 
> > However, I don't have a strong preference about the naming. If you
> > prefer another pair of verbs, I'll be happy to change the function
> > names.
> 
> So, I think create/destroy is a bit better: `create` with the 
> `vkms_config` parameter is enough to tell "it allocates stuff in 
> `vkms_config`". 

ACK, I'll change in v2.

> > > - usage of "complex" list accessors, can't we just create iterators?
> > 
> > Yes, on the first iteration, I used the underlying structure: list
> > iterators for planes/CRTCs/encoders/connectors and xa_for_each for
> > the possible_* items.
> > 
> > However, I found 2 main issues that made me rewrite this code:
> > 
> > The first one is that, if in the future, we change the internal data
> > type, we'll have to change all the code using it. On this way, like
> > I did with all the other vkms_config_*_get_*() functions, the data is
> > encapsulated.
> 
> In one of my comment I proposed a macro to help on this point. I think 
> this is sufficient to hide internals. (see patch 7/13)

That's a very good point, I like the vkms_config_for_each_plane()
macro you suggested. Also, it matches really well with similar macros
in drm, for example drm_connector_for_each_possible_encoder().

I'll add them in v2.

> > The second one is vkms_config_get_connectors(). Unlike the other
> > functions, this one filters by connector enabled status. If we let the
> > caller do the filtering, we'll duplicate that logic.
> 
> That something I missed, and a very good point.
> 
> I will try to create a macro that do the filtered iteration, if I succeed 
> and you agree on the previous point, I think it does not worth it to have 
> those huge amount of code just to iterate over a list.
> 
> > Because of these two reasons, I decided to add a getter for lists.
> > 
> > > - should we use pr_err in vkms_config_valid?
> > 
> > I think it is great to show to the user a reason why their device couldn't
> > be enabled in dmesg... But I'm not sure if there is a better way to do it.
> 
> I was not clear: I agree we want some logs, but pr_err is too 
> agressive (see patch 8/13).

Agreed, we can lower to warn.

> > > > Louis Chauvet and I are working on ConfigFS support. In this series I tried to
> > > > merge his changes [1] with mine [2].
> > > > I kept his Signed-off-by to reflect that, even if I show up as the author of
> > > > some/most of the patches, this was a joint effort.
> > > 
> > > To avoid confusion, you should add the Co-developped-by tag, so it will be 
> > > clear that we worked together on this.
> > 
> > Good point, I'll change it.
> > 
> > > > I'm still polishing the ConfigFS code [3] and its IGT tests [4] (connector
> > > > hot-add/remove bugs) but the IGT tests also exercise this series and can be used
> > > > for additional test coverage.
> > > 
> > > I will take a look at those series. For the connector hot-add/remove, do 
> > > you have any example of usage in the kernel? I did not found anything in 
> > > the documentation explaining they are hot-addable.
> > 
> > I pushed a couple of WIP commits to the kernel and IGT so you can see/test
> > the crashes and hopefully share some ideas.
> > 
> > About the documentation: I didn't find much information other than a few
> > mentions to hot-add/remove. However, in one of my rebases, two new functions, 
> > drm_connector_dynamic_init() and drm_connector_dynamic_register(), were added:
> > https://patchwork.freedesktop.org/patch/628418/
> 
> Ho! This is exactly one issue I had when developping IGT tests, sometimes 
> you fetch the connector list, and when querying info about a specific 
> connector you get nothing!

I'm not sure if it is the same issue, but when it happened to me, I was
missing a call to drm_mode_config_reset(). Credit to Maxime for helping
me with this error :)
 
> > I'm still trying to make them work, but I think they are what we need.
> 
> After reading the patch "https://patchwork.freedesktop.org/patch/628418/", 
> I don't think we really need to support "dynamic connector creation" right 
> now:
> - None of the existing driver do it (except MST, but MST need a lot of 
>   stuff to works)
> - If we want to support it later, just create a "useless" 
>   /configfs/vkms/DEV/connectors/CON/enable that you must write 1 before 
>   the device initialization to make the connector working. This way we 
>   will not have to break the UAPI (the file is already there, disabled by 
>   default)

Fair enough, we can add it in the future. To keep it backwars compatible
though, we'll need to enable by default "static" connectors so users don't
need to change the way they create devices.

For "dynamic" connectors (connectors created once the device is enabled) we
would need to set them disabled on creation, but this would be backwards
compatible, as we won't allow creating new connectors in the first version.

I'll remove the connector hot-add/remove on v2... Meaning that configfs + IGT
will be ready for review :)

> > Part of the crashes happen on the cleanup of drm_client_setup(). Adding a
> > connector adds modes in the DRM client, but removing the connector doesn't
> > remove them and, on cleanup, I get a NULL pointer.
> >
> > I'm a bit stuck, so help or tips are very welcome :)
> 
> I will look at it next week (same repo/branch?).

Yes, same repo.

Enjoy your weekend!
Jose

> Have a nice weekend,
> Louis Chauvet
> 
> > 
> > > Thanks again for this series,
> > > Louis Chauvet
> > 
> > I'll look with more time into your comments in the other patches next week.
> > 
> > Thanks,
> > Jose
> > 
> 
> [...]
