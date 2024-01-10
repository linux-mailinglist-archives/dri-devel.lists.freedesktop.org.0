Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4C1829B89
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 14:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC78C10E5CB;
	Wed, 10 Jan 2024 13:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBE710E5CB
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 13:43:01 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5e784ce9bb8so32965297b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 05:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yngvason.is; s=google; t=1704894180; x=1705498980; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yQ/U0Sa8v/CRYiVU6kq/by3KQsxjn5M1baHcHHM4a3M=;
 b=Ziqzmh1GRHmgTrQxBD6ozhrPqY2R5YswZhdunJ6XUieLQsssY9f0c1Zh9q1ai4RY9n
 8y0NyS1cLjU731V16YtfUaGwznfNNS/BH2yawKGppYpnEkhLwiDWViXyqNioMq3V/RPv
 Il65HCrOMsZaY83AMOugFn8hLXaeWdHa1bDpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704894180; x=1705498980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yQ/U0Sa8v/CRYiVU6kq/by3KQsxjn5M1baHcHHM4a3M=;
 b=fkpn6OoMzx7TKqUgOqx45H3w46YE4hCezvTHGL+Y32tLJL1/Q9wv3Hqz+mpeT4ucYw
 S8vFqzQ7kG3HxaCjiwu5fhVwaJq3Co+Oe9LV8zsQ5efvJ7+9kVg9fFc7gXm5OAzOoIh2
 D91Gt2RcElhob2T3AUPjyU8vXFXCczXGpJbpPaBVJf/RlhxrGjwZyx7vIVBvPkFE4Fwx
 9Vd/x1VReRqLoznhkgIm6sQx6PDtavDLZtcjNNKtQYYdGhjc79Xu76JVZunux368yb+D
 zBNpWgDb06U4Rjlr6XvEhhsQYRDshmqD3fmobBd0Gd3ALyqInQiddGOd4VtGtSItxhmp
 KGqA==
X-Gm-Message-State: AOJu0YwoOLkNI9u9hoQuZJbTi9KYu6q/J434r5mUYCEIl/MrQia2S2rp
 H2idIjgpoFXKHQUwSUh2xSdtJRsOdFor2bt3JRBETpAEikPGFw==
X-Google-Smtp-Source: AGHT+IGDsuO4mYJVVDxBUOZbdTOdu8bmcbR4SC1ZuMtCkzl9DP9p6Vo22kYDPHUl7Rp57fzCruInRV3SA2OPXVlQoBk=
X-Received: by 2002:a0d:db57:0:b0:5e8:a75f:df63 with SMTP id
 d84-20020a0ddb57000000b005e8a75fdf63mr49273ywe.47.1704894180474; Wed, 10 Jan
 2024 05:43:00 -0800 (PST)
MIME-Version: 1.0
References: <20240109181104.1670304-1-andri@yngvason.is>
 <20240109181104.1670304-6-andri@yngvason.is>
 <qdwv7sagqs5nmmsy5lko5hypldanfodafyzamrs3loj3n7jzlr@n5bacxkknkj4>
 <CAFNQBQzijyE4wR34AOLM45m+ryx128igVKO9zPJ5-M3afFQMxQ@mail.gmail.com>
 <92e20f9b-2cbf-4efe-b61b-989da0cc1668@tuxedocomputers.com>
In-Reply-To: <92e20f9b-2cbf-4efe-b61b-989da0cc1668@tuxedocomputers.com>
From: Andri Yngvason <andri@yngvason.is>
Date: Wed, 10 Jan 2024 13:42:24 +0000
Message-ID: <CAFNQBQxnMh4aPfm+U8vEfxoTdQ+FByfqwUUDnMTzgkrW2+ZZqw@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/uAPI: Add "preferred color format" drm property
 as setting for userspace
To: Werner Sembach <wse@tuxedocomputers.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mi=C3=B0., 10. jan. 2024 kl. 13:09 skrifa=C3=B0i Werner Sembach <wse@tuxedo=
computers.com>:
>
> Hi,
>
> Am 10.01.24 um 11:11 schrieb Andri Yngvason:
> > Hi,
> >
> > mi=C3=B0., 10. jan. 2024 kl. 09:27 skrifa=C3=B0i Maxime Ripard <mripard=
@kernel.org>:
> >> On Tue, Jan 09, 2024 at 06:11:02PM +0000, Andri Yngvason wrote:
> >>> From: Werner Sembach <wse@tuxedocomputers.com>
> >>>
> >>> Add a new general drm property "preferred color format" which can be =
used
> >>> by userspace to tell the graphic drivers to which color format to use=
.
> >>>
> >>> Possible options are:
> >>>      - auto (default/current behaviour)
> >>>      - rgb
> >>>      - ycbcr444
> >>>      - ycbcr422 (not supported by both amdgpu and i915)
> >>>      - ycbcr420
> >>>
> >>> In theory the auto option should choose the best available option for=
 the
> >>> current setup, but because of bad internal conversion some monitors l=
ook
> >>> better with rgb and some with ycbcr444.
> >> I looked at the patch and I couldn't find what is supposed to happen i=
f
> >> you set it to something else than auto, and the driver can't match tha=
t.
> >> Are we supposed to fallback to the "auto" behaviour, or are we suppose
> >> to reject the mode entirely?
> >>
> >> The combination with the active output format property suggests the
> >> former, but we should document it explicitly.
> > It is also my understanding that it should fall back to the "auto"
> > behaviour. I will add this to the documentation.
>
> Yes, that was the intention, and then userspace can check, but it wasn't =
well
> received: https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_964530
>
> Actually a lot of the thoughts that went into the original patch set can =
be
> found in that topic.
>
> There was another iteration of the patch set that I never finished and se=
nt to
> the LKML because I got discouraged by this:
> https://lore.kernel.org/dri-devel/20210623102923.70877c1a@eldfell/

Well, I've implemented this for sway and wlroots now and Simon has
reacted positively, so this does appear likely to end up as a feature
in wlroots based compositors.

>
> I can try to dig it up, but it is completely untested and I don't think I=
 still
> have the respective TODO list anymore, so I don't know if it is a better =
or
> worst starting point than the last iteration I sent to the LKML.
>

You can send the patches to me if you want and I can see if they're
useful. I'm really only interested in the color format part though.
Alternatively, you can continue your work and post it to LKML and I
can focus on the userspace side and testing. By the way, I have an
HDMI analyzer that can tell me the actual color format.

Thanks,
Andri
