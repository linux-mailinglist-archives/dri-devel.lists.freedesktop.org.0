Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C1F76D516
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 19:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B1B10E557;
	Wed,  2 Aug 2023 17:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BB110E557
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 17:25:56 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-57a6df91b1eso82843217b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 10:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690997156; x=1691601956;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YpPXroXrivp2oqSXrd5mVrkzp3XdQTSk9hrAgVtYUMI=;
 b=di135iIWW+eTqzw4vL43zpQ02LIFyGoRZR7ZhFsNukaq27imiHGAlcaz3pSlptp5Dp
 EwYJEpfS5XBfF5e6JZQZijnreYABU5nMNqk6RCYQN8xlX/zNNnt+sjIiPokyWwZJbpqD
 TP8vfYN9zToVR9ljOLLtq1Frm9VQkuFkXVdHJ1BJ/u0xKQRp3x9v41IACG9ZhfVf3ZOS
 4UrbUOj1Hgihw7yx+7VZynYoM9+zSsWWOVZkbCu+FxF84jha0q3eO6wRgv+Qe9ihw2P7
 gWiqKytdPdybEIo2UORvZChskMiIVcvjQM+4JoXMYTRKUlSqb6gcjQsKlYBzV8GYvYDx
 V94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690997156; x=1691601956;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YpPXroXrivp2oqSXrd5mVrkzp3XdQTSk9hrAgVtYUMI=;
 b=gwRk4YbYJfA9YSQFWBuQ4MH38xXRw4A6OwJwoLz1K0aExk1WSHR6sX3D/L0SCcoNLa
 qA7bc7mtghFZCTkFnks5Lw7JDdFozLP2eNp2LhHHI0jcsTEpvjP/zR55/WFLe+vFd0kn
 mje4PxGMXjSlMl5z9ugDrQn4vvXh6BEPkMyP+avCaCh1vD2EcDrNlFdeJ+MDY5StX1bl
 JFu02MzI5jRy34DfvS2n77ga7ChdQTQbOs9AO7ZNoFVHWHUb2ozMy5Tj0nbH6c0/gN1o
 hu/FhudlndkJmjswVFs9Kqx0qH8v9iWYYXmIvVzPU9A5dYIfVznadmpsZl56z15gS23q
 cevA==
X-Gm-Message-State: ABy/qLbKfhEszXwWQ/4+JKpAhm1pD0mbbf3HrfdUfs2dTu3v6Wy3W/7Y
 1DOATM98zx+8nkbjMYElaMU=
X-Google-Smtp-Source: APBJJlEt7z7QZtDchjFQrTTiyOdhjoBA522GpyLibMtT4mAHwoGMoo1oTrWqNFzmBJaiw8V99Oc7mQ==
X-Received: by 2002:a81:c313:0:b0:576:f0d6:3d68 with SMTP id
 r19-20020a81c313000000b00576f0d63d68mr18840238ywk.32.1690997155892; 
 Wed, 02 Aug 2023 10:25:55 -0700 (PDT)
Received: from neuromancer. ([75.28.21.198]) by smtp.gmail.com with ESMTPSA id
 a135-20020a0dd88d000000b0057a67df3308sm4677099ywe.101.2023.08.02.10.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 10:25:55 -0700 (PDT)
Message-ID: <64ca91a3.0d0a0220.8e58d.89b3@mx.google.com>
X-Google-Original-Message-ID: <ZMqRoAEesL5GAflV@neuromancer.>
Date: Wed, 2 Aug 2023 12:25:52 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v3 02/10] drm/panel: Check for already prepared/enabled
 in drm_panel
References: <20230725203545.2260506-1-dianders@chromium.org>
 <20230725133443.v3.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid>
 <snx3fzvf3icauri2xuigydvpqxtzhp34mptdxvifi7jswm2evy@sx7jr7zwvjw5>
 <CAD=FV=VcsTik+HD11xeDM2Jq9ispcX0-j5QtK8D1qUkrGabRGg@mail.gmail.com>
 <i3cbgrc365lwscwux2itho6uv74ji3hsjuge4zoxfnlnhacyqc@r73mmifyxffj>
 <CADcbR4JB0h8fByM2Z6diByvWaFprW9GDapBNt+YLWr9-vKoe7A@mail.gmail.com>
 <kuctj2p353nsae24lrhcymqqpfajbc7qoqly63zpwvdp6lgu3b@kk4gpzsapxnn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kuctj2p353nsae24lrhcymqqpfajbc7qoqly63zpwvdp6lgu3b@kk4gpzsapxnn>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Doug Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 31, 2023 at 07:03:07PM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Jul 31, 2023 at 11:33:22AM -0500, Chris Morgan wrote:
> > In my case a few different panel drivers disable the regulators in the
> > unprepare/disable routines.
> 
> And that's totally fine.
> 
> > For at least the Rockchip DSI implementations for some reason the
> > panel gets unprepared more than once, which triggers an unbalanced
> > regulator disable.
> 
> "For some reason" being that DW-DSI apparently finds it ok to bypass any
> kind of abstraction and randomly calling panel functions by itself:
> 
> https://elixir.bootlin.com/linux/v6.4.7/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L868
> 
> It looks like it's fixed it current drm-misc-next though.

Good, when I get a chance I will test it out with the existing panels
I have at my disposal and submit some patches to clean them up.

> 
> > Obviously though the correct course of action is to fix the reason why
> > the panel is disabled more than once, but that's at least the root
> > cause of this behavior on the few panels I've worked with.
> 
> Like I said we already have a commit on the way to fix that, so it
> shouldn't be an issue anymore.
> 
> I stand by what I was saying earlier though, I think it's mostly
> cargo-cult or drivers being very wrong. If anything, the DW-DSI stuff
> made me even more convinced that we shouldn't even entertain that idea
> :)
> 
> Maxime

Thank you, and yes if a driver is doing something it shouldn't we
shouldn't be patching around that, we should be fixing things. Thanks
for providing me with the additional info.

Chris
