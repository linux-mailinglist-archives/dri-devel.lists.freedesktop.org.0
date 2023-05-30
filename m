Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E93F47154C8
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 07:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99ED910E08E;
	Tue, 30 May 2023 05:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC4010E08E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 05:15:45 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-33b4e351c2aso13897295ab.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 22:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685423744; x=1688015744;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GPrZJ1FuK/lyhedvMoDkzqpf5lW1XKFTD6vF/dQBu7U=;
 b=RHduFg/SkfnNpEeH/Z8vVcemveNn2K0KJ8KJJxlqhyUzci5D1F0GWnxfQFmx4zY6bU
 7W72z1XSBRExMGDxJsL04fAQnnEQQ7FfGeDoRceqiRj4BGZqzz5JHQxR1a7MCOXSHrs6
 Rq+ivMx9W4zKYugEaw891iW/g7lyS3P3/dkVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685423744; x=1688015744;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GPrZJ1FuK/lyhedvMoDkzqpf5lW1XKFTD6vF/dQBu7U=;
 b=ilzgRalCs9CHKXLDZvuMSiQR6f/es1dVsFkVU7Kslyx2eNFdaTxicA9l4VbCuVBNiJ
 L7PB1KHEDjP0Q6ApEjFRapkC2rDp8dg5azuPaSqh0prGROdScJlF4N5s86KsZYGS6I9I
 FwZ+PVv/rBxkVpPoGwO0wCgT0CvSJv6axv1yIBjbomnE5gYrBBj1VE5YvZ1OW5QqqxSV
 wWbLGK57s4bzG6c99Va3yHHnKqFojYpHI8zDWq8dwnwigNQNPEtwDoWTJLPpujRSg1bI
 LZIsJI9Taq3mKLtaXgzB7CavvVDicVlckVKozMFmI0cAGCtWyjbSf7FLVkb2w6cGqIPD
 CpuA==
X-Gm-Message-State: AC+VfDxyAYO9vc9ExIW8Ax01BJ25jZoj+7bNrXt8eR2tcoWTEAXyTV9n
 OkvPrRYDzs8aCeK3AUUrACLLy+JmDNotnoIwcF3S3w==
X-Google-Smtp-Source: ACHHUZ7K98aHhjVDMkeWoR191KSh7oiEiY/tCoA0ZwWRYnyptB7ud8eWTxjjkXCQwzb9T0i5R2+d1js9IbzbwcvgFZE=
X-Received: by 2002:a92:cd49:0:b0:339:f011:77f8 with SMTP id
 v9-20020a92cd49000000b00339f01177f8mr1029659ilq.16.1685423744156; Mon, 29 May
 2023 22:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230331091145.737305-1-treapking@chromium.org>
 <20230331091145.737305-5-treapking@chromium.org>
 <CAE-0n51E5foFWQAsA73662_5e6XP426wuUCVVmcS5UWwiYpDmw@mail.gmail.com>
 <CAEXTbpdcbB_z4ZGCGzc-cM74ECKyxekbroKCWFnhH8eR=4HmvA@mail.gmail.com>
 <CAE-0n50atfmr-bFh5XtTCm4WpSijJGSe0B5JP8ni7CCYk7Bs5A@mail.gmail.com>
 <CAE-0n51Qy-KDGHOCr4Smpebq1fCURqvJ2RJz6KAtVpv5e+DSGA@mail.gmail.com>
 <CAEXTbpeKe1dVHp9cauMN-9nQb35oJ-ZhdFV-8BiWzjjhWAy0Zg@mail.gmail.com>
 <CAE-0n50bj303jou==v6eMabrZ3EL6Cq7tPJmCj9vM_B7FA8s2g@mail.gmail.com>
 <CAEXTbpcWfYV_58pw_VupjhAFZsUU3pkLRN_8JoASyLLBmgTYqQ@mail.gmail.com>
 <CAE-0n51i0kzSKYeUtzLV93miq2GcN1APDYh18p4wr9XxWGrfWA@mail.gmail.com>
In-Reply-To: <CAE-0n51i0kzSKYeUtzLV93miq2GcN1APDYh18p4wr9XxWGrfWA@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 30 May 2023 13:15:33 +0800
Message-ID: <CAEXTbpfb79Zh3rJ3FBJQ7V522W35WL_KsmXd2dvECD+_cTzmGQ@mail.gmail.com>
Subject: Re: [PATCH v15 04/10] dt-bindings: display: bridge: anx7625: Add
 mode-switch support
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Robert Foss <rfoss@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 jagan@amarulasolutions.com, Chen-Yu Tsai <wenst@chromium.org>,
 devicetree@vger.kernel.org,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Prashant Malani <pmalani@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 1:30=E2=80=AFAM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> Quoting Pin-yen Lin (2023-05-09 20:41:54)
> > On Sat, Apr 29, 2023 at 12:47=E2=80=AFPM Stephen Boyd <swboyd@chromium.=
org> wrote:
> > >
> > > Good point. I'm suggesting to make the drm bridge chain into a tree. =
We
> > > need to teach drm_bridge core about a mux, and have some logic to
> > > navigate atomically switching from one output to another. I was talki=
ng
> > > with dianders@ and he was suggesting to use bridge attach/detach for
> > > this. I'm not sure that will work though because that hook is only
> > > called when the encoder is attached to the bridge.
> > >
> > > It may also turn out that this helps with DP multi-stream transport
> > > (MST). As far as I can recall DP MST doesn't mesh well with drm_bridg=
e
> > > designs because it wants to operate on a drm_connector and
> > > drm_bridge_connector_init() wants to make only one drm_connector for =
a
> > > chain of bridges. If you squint, the anx7625 could be an MST "branch"
> > > that only supports one drm_connector being enabled at a time. Maybe t=
hat
> > > is what we should do here, make drm_bridge support creating more than
> > > one drm_connector and when there is a mux in the tree it walks both
> > > sides and runs a callback similar to struct
> > > drm_dp_mst_topology_cbs::add_connector() to tell the encoder that
> > > there's another possible drm_connector here.
> >
> > I have been surveying the approaches to change the bridge chain in
> > runtime, and I found this thread[1]. Quoting from Daniel:
>
> I find the lore links easier to read.
>
> > "... exchanging the bridge chain isn't supported, there's no locking
> > for that since it's assumed to be invariant over the lifetime of the
> > drm_device instance. The simplest way to make that happen right now is =
to
> > have 2 drm_encoder instances, one with the lvds bridge chain, the other
> > with the hdmi bridge chain, and select the right encoder/bridge chain
> > depending upon which output userspace picks.
> > ...
> > I wouldn't try to make bridge chains exchangeable instead, that's
> > headaches - e.g. with dp mst we've also opted for a bunch of fake
> > drm_encoders to model that kind of switching."
> >
> > I'm not sure how we register two encoders properly, though. Do we make
> > the encoder driver check all the downstream bridges and register two
> > drm_encoder when a bridge is acting as a mux?
>
> I honestly don't know because I'm not a DRM expert. Maybe Jagan or DRM
> bridge maintainers can add to the thread here.
>
> I kept reading the thread[2] and I think they settled on 2 drm_encoders
> because they're different display formats (LVDS vs. HDMI) and 2
> drm_connector structures. But then I watched the youtube video from this
> thread[3] and it seems like 1 drm_encoder is actually what should be
> done because there is really only DSI at the root. There's at least
> three people working on this topic of muxing displays though. Good news?
>
> The analogy between their gpio controlled mux and this anx part with a
> crosspoint switch is that the gpio is like the crosspoint switch, but
> the gpio is like a virtual mux? If the gpio is asserted for them, one
> display bridge is enabled (HDMI) and the other one is not (LVDS).
>
> In this case, the type-c cables may be connected to both
> usb-c-connectors and HPD may be asserted on both, but only one
> drm_connector will be able to attach to the 1 drm_encoder at a time. If
> we had 2 drm_encoders it would be possible to attach both encoders to
> both drm_connectors at the same time, which is impossible because it's a
> mux. Indicating that each connector is connected is OK when HPD is high
> on both usb-c-connectors. Userspace will have to attach an encoder to
> the drm_connector it wants to use, and the drm_connector will indicate
> which drm_encoders are possible for it, so all the information will be
> provided to userspace in this design.
>
> I think it really comes down to implementing the tree walking logic in
> the drm bridge APIs. The problem is things like
> drm_bridge_get_next_bridge(), drm_bridge_get_prev_bridge(), and
> drm_for_each_bridge_in_chain() which will have to operate on a tree
> instead of a list. There's also drm_bridge_chain_get_first_bridge() and
> drm_bridge_attach(). The good news is most of these APIs are used
> sparingly.
>
> Maybe the simplest way to handle this is to maintain a tree of bridges
> and generate bridge chains when an encoder is attached to a connector in
> the tree. Presumably there is only one connector possible for a leaf of
> the bridge tree, and one encoder at the root of the bridge chain. From
> the drm_bridge structure, you'll only be able to iterate over the bridge
> chain that is currently configured. Same for the encoder, you'll only be
> able to walk the currently configured bridge chain from struct
> drm_encoder::bridge_chain.

If I understand correctly, encoders are attached to connectors when
the driver initializes itself. Do you mean that the chain should be
generated when a connector is connected?

If so, "attach" becomes adding a bridge to the bridge "tree", and the
chain is only determined after a connector is plugged. When HPD fires,
we can use the .detect callback to find the right connector and form
the bridge chain. The following changes would need to be made to the
existing APIs:
(1) Some of the chain-traversing helpers (e.g.,
drm_for_each_bridge_in_chain()) need to be changed to traversing the
bridge tree.
(2) Drivers that hold a pointer to the connector need to either hold a
list of possible connectors or use a helper to get the active
connector at runtime.

I don't really know if this would work out. e.g., Do we really not
need the chain when the connector is disconnected? I will appreciate
any suggestions on this.

Regards,
Pin-yen

> This hinges on the idea that the bridge_chain is a list, not a tree, and
> that it only needs to exist when an encoder is attached to a connector.
> When an encoder isn't attached to a connector the bridges will be in the
> tree, and probably that tree structure will be maintained in the bridge
> driver itself knowing that there is one input side bridge and two output
> side bridges. When the input bridge is attached, it should be able to
> query the output side bridges for the connector that the encoder is
> attaching to and configure the mux and hook the input bridge to the
> correct output bridge.
>
> [2] https://lore.kernel.org/all/CAPj87rO7a=3DNbarOyZp1pE=3D19Lf2aGjWu7sru=
-eHwGjX0fpN+-A@mail.gmail.com/
> [3] https://lore.kernel.org/all/CAMty3ZAQyADGLVcB13qJdEy_BiZEKpyDfCr9QrM-=
ucFLFPZLcw@mail.gmail.com/
