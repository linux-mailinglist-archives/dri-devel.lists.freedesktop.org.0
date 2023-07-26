Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E672763CCF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 18:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B4610E49B;
	Wed, 26 Jul 2023 16:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E8110E49B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 16:45:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 081A261BEA;
 Wed, 26 Jul 2023 16:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BA1C433C8;
 Wed, 26 Jul 2023 16:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690389956;
 bh=jZXU5ruoejJhbuBwYdY1ZLLXNDtD+W4XvI24g/fO+KE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W2GX0KSPedlzHVDnCDMF579Ei8TNx3SeQuZGttRTDbua0P/7iPBHdQrodkKvKz53q
 ko95RC5W4SGMm2SMMHVOTaobkjO24mJ6Ypy4bSuugKBy7qT+nsdq5DrgpsI52CPR2L
 uwNwruMz9AK4peZEO7k6wY+Iv2Gn482iFMcPojVDYrZp2ivX0pZlrCfk4eMa0fWVIl
 ikzgZSI8G2YAzFObXRsuw7mu9/Ak1aC4V5gzFBUsLntUj3NDhREmvdADY2S83IWzai
 aQM5dMHQuwMgCvkzilvUWxjVyoXqGRdfVX3dIKpw5tgyNoqVMnn6Fzsfz7sZNRBNac
 4C9OxIis2Sv9A==
Date: Wed, 26 Jul 2023 18:45:48 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 08/10] HID: i2c-hid: Support being a panel follower
Message-ID: <bcshx6a3twlvvcwwzndep6gwczlppou3llwqyle6hmp26v57tk@7erwnkxfngse>
References: <20230725203545.2260506-1-dianders@chromium.org>
 <20230725133443.v3.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
 <rorhwk3jx72twmqnxqb45uhm7azxxfirvferwyznbhbfmdf7ja@6k6ebhehmsn4>
 <CAD=FV=VX=ACR3K+GYAvP8J4ebP4GtTpXQmX21NkJ4BJ7vN+o8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VX=ACR3K+GYAvP8J4ebP4GtTpXQmX21NkJ4BJ7vN+o8w@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Jul 26 2023, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jul 26, 2023 at 1:57 AM Benjamin Tissoires <bentiss@kernel.org> wrote:
> >
> > > @@ -1143,7 +1208,14 @@ void i2c_hid_core_remove(struct i2c_client *client)
> > >       struct i2c_hid *ihid = i2c_get_clientdata(client);
> > >       struct hid_device *hid;
> > >
> > > -     i2c_hid_core_power_down(ihid);
> > > +     /*
> > > +      * If we're a follower, the act of unfollowing will cause us to be
> > > +      * powered down. Otherwise we need to manually do it.
> > > +      */
> > > +     if (ihid->is_panel_follower)
> > > +             drm_panel_remove_follower(&ihid->panel_follower);
> >
> > That part is concerning, as we are now calling hid_drv->suspend() when removing
> > the device. It might or not have an impact (I'm not sure of it), but we
> > are effectively changing the path of commands sent to the device.
> >
> > hid-multitouch might call a feature in ->suspend, but the remove makes
> > that the physical is actually disconnected, so the function will fail,
> > and I'm not sure what is happening then.
> 
> It's not too hard to change this if we're sure we want to. I could
> change how the panel follower API works, though I'd rather keep it how
> it is now for symmetry. Thus, if we want to do this I'd probably just
> set a boolean at the beginning of i2c_hid_core_remove() to avoid the
> suspend when the panel follower API calls us back.

I was more thinking on a boolean. No need to overload the API.

> 
> That being said, are you sure you want me to do that?
> 
> 1. My patch doesn't change the behavior of any existing hardware. It
> will only do anything for hardware that indicates it needs the panel
> follower logic. Presumably these people could confirm that the logic
> is OK for them, though I'll also admit that it's likely not many of
> them will test the remove() case.

Isn't trogdor (patch 10/10) already supported? Though you should be the
one making tests, so it should be fine ;)

> 
> 2. Can you give more details about why you say that the function will
> fail? The first thing that the remove() function will do is to
> unfollow the panel and that can cause the suspend to happen. At the
> time this code runs all the normal communications should work and so
> there should be no problems calling into the suspend code.

Now that I think about it more, maybe I am too biased by USB where the
device remove would happened *after* the device has been physically
unplugged. And this doesn't apply of course in the I2C world.

> 
> 3. You can correct me if I'm wrong, but I'd actually argue that
> calling the suspend code during remove actually fixes issues and we
> should probably do it for the non-panel-follower case as well. I think
> there are at least two benefits. One benefit is that if the i2c-hid
> device is on a power rail that can't turn off (either an always-on or
> a shared power rail) that we'll at least get the device in a low power
> state before we stop managing it with this driver. The second benefit
> is that it implicitly disables the interrupt and that fixes a
> potential crash at remove time(). The crash in the old code I'm
> imagining is:
> 
> a) i2c_hid_core_remove() is called.
> 
> b) We try to power down the i2c hid device, which might not do
> anything if the device is on an always-on rail.
> 
> c) We call hid_destroy_device(), which frees the hid device.
> 
> d) An interrupt comes in before the call to free_irq() and we try to
> dispatch it to the already freed hid device and crash.
> 
> 
> If you agree that my reasoning makes sense, I can add a separate patch
> before this one to suspend during remove.

Yep, I agree with you :)

Adding a separate patch would be nice, yes. Thanks!

Cheers,
Benjamin
