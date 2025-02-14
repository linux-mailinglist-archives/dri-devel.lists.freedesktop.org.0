Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCBBA3619E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED2F10ECC9;
	Fri, 14 Feb 2025 15:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="F566xvrg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0768B10ECC9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:26:18 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5452e6f2999so474632e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739546773; x=1740151573;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fHqSVsarbr9/GNSKcHw7mFlABcvHBZA79lxaZw7Ee7Y=;
 b=F566xvrg6d85mVM1pXfYLemj7TavyhBpAXgpm6r9ItZ9QusS94dOKx9yc6c3kMoYxF
 JdgyVLNDQJ9oDcbkafSakxyDhSd9dDYpiN/smHujDk9eD44FZLDRcN/ZS49QZ7GLUa86
 P3BAIZfs8oIBgAlwTdAATuqTTyrMjFjWYc0EA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739546773; x=1740151573;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fHqSVsarbr9/GNSKcHw7mFlABcvHBZA79lxaZw7Ee7Y=;
 b=Zp+fLsg4hoh1jZi/GbvhSJj/ZpQlT5MP5XbGFt+drlV3gkGneKIva9zEqncY1O+4Mi
 vYzKCMd05zCFPQRYecilt61eHip/DeqRUDxyrsjmrADV5d5TNcxwTQ/CvLnZa3zrDWSC
 WRqFFvAMVgkJoegiI92YtNive8Yfkhkn/8LhOSFibWD0qZW7bisWzyWhCgJJT0AhdcZW
 YCXiX070Ghif/8n1uqkNwYK9BmtsQWm+j2FoByW8dIN6g9zOX4PXUtFBozQuFza01ZKu
 rQ0gpxdI3cTdUGSH8SSlFi/zNF3HZOvOqVVNmLsQ699kEg/i9WImLWpxzrUUsoANxPvt
 +Cuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2jOnmxavAuOmT0ieDZx66dGQY8VmEdCvHnkCh4SwtXYuCyujJcOScK+OhZEGvKgoqEy/KUqu7AHc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHwOtin8OdNeYhKXj9OazXgpunHFGjkzzwFqafqmJ+l1nWOeyH
 /45L2QEdt8eY5HB+8ocLKCyoW8c15lU2KwOXRs2VySJpnEYqwjmJ6NeehvVK1Q3rHN3gr4JG0he
 V/Q==
X-Gm-Gg: ASbGncuZy56vi3wQtT4PpVhS+9TfYCCppqcdvQzN3Th7iQxU2DK4BOqpBQRnJ0+nK3U
 99yDijYxfWDXz1ECnG/TnJ9H4DYPbNYRB8eUB2QrJ5IGNE3sbIJ9s2vmkA8D7b8iI3oBEx697BU
 BJnG18Z+8GJAUFYgWMRGjJ6OXojfr4Fqh8twmtGTjR7/ZM5b3YKvUC9nyxJHyE5QUNWE+9e3PdS
 /h9VKaMMpuJFpAJUyCs6s3dlUwV6yLBvxG012pvapGHUtgae2hl36tNQJQ0PJ9n1cV6Ljn7dxNh
 VRORf92XIjVqO5wYT5bHUJFC7mKAnapmGaCjjD6zA1Ek4x8naa1jcYoaGi0=
X-Google-Smtp-Source: AGHT+IFbumr0MnyVWruFQ7n4XTe92EfLpEQ2XMXApIq8uEGwtL4JGileuizPF03QzRmgTDQXXcHPTA==
X-Received: by 2002:a05:6512:ba7:b0:545:2550:7d67 with SMTP id
 2adb3069b0e04-54525507f7bmr1492090e87.36.1739546773440; 
 Fri, 14 Feb 2025 07:26:13 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f09b24asm565596e87.65.2025.02.14.07.26.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 07:26:12 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-309191eec90so12257651fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:26:10 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU9Z6RIyV9SvdCKDSrorIiovXa1tYdu11hhtIJFl6d6Hp00PRyLZg67XzxOBcjFD5ACqNTpqVDz0l4=@lists.freedesktop.org
X-Received: by 2002:a2e:8a97:0:b0:308:eb58:6581 with SMTP id
 38308e7fff4ca-30914801891mr14311001fa.0.1739546770563; Fri, 14 Feb 2025
 07:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-2-7edb50524909@baylibre.com>
 <20250213-crown-clustered-81c6434c892b@spud>
 <1jv7tczytk.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jv7tczytk.fsf@starbuckisacylon.baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Feb 2025 07:25:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VeSrZktEbxNXXTgD80QGTpW5b-WiXUFko+a8FUzmN+fQ@mail.gmail.com>
X-Gm-Features: AWEUYZn5Dl35ky148QOOCnARP_86rg2vhIKgVTUOs7s9KbdYhXOWWeRWr_r9yF0
Message-ID: <CAD=FV=VeSrZktEbxNXXTgD80QGTpW5b-WiXUFko+a8FUzmN+fQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] reset: mpfs: use the auxiliary device creation
 helper
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Conor Dooley <conor@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Danilo Krummrich <dakr@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Feb 14, 2025 at 12:59=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
>
> > One think that's always felt a bit meh to me is this id number stuff,
> > I just threw in 666 for meme value.
>
> :)
>
> > The whole thing seems super
> > arbitrary, do any of the users of this helper actually put meaningful
> > values into the id parameter?
>
> In example changes I've sent, no.
>
> In other simple usages (those using container_of()) of the auxiliary
> bus, I think there are a few that uses 0 and 1 for 2 instances.
>
> I guess your question is "do we really need this parameter here ?"
>
> We could remove it and still address 90% of the original target.
>
> Keeping it leaves the door open in case the figure above does not hold
> and it is pretty cheap to do. It could also enable drivers requiring an
> IDA to use the helper, possibly.

FWIW, once you resolve the conflicts in drm-misc with ti-sn65dsi86
you'll need the ID value. ;-)

There was a big-ol' discussion here:

https://lore.kernel.org/r/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.17291804=
70.git.geert+renesas@glider.be

I eventually pushed v2 of the patch:

https://lore.kernel.org/r/7a68a0e3f927e26edca6040067fb653eb06efb79.17338400=
89.git.geert+renesas@glider.be


-Doug
