Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FB757C04B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 00:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CC518B0D0;
	Wed, 20 Jul 2022 22:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3D718B0D0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 22:50:24 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id z23so105087eju.8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xgi1z1ae5ziBlcC49Co3XBDsqsxEKGU7GKGo/g6/OU4=;
 b=ZEQZLa2dXunPpmjgStLAYenZf/8aoYz0Q3PUsLtPT8Wo3LfAR+Glg+kc2wyM4v8axn
 0X7fmWOLBu1LTE89OcO4bOsx98vxYmJdU3/ofl442ahCtlMuRoQzPdO072v/oUiXjTii
 XvEVNhH5AWbk5CWbwAqjNZZya+t8495tCoplk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xgi1z1ae5ziBlcC49Co3XBDsqsxEKGU7GKGo/g6/OU4=;
 b=c/0rZz3+wwiz5sb0+LdDWfHvK8DVnQCfcuVnwML3TMiqvkRjbQ8CJhxAUgYZ2h5GXu
 tw0I5dxhmPnZztWk3kgJqmqFH/U3Xo5mik2SRnhmNbxdU0ThZB1iiKcV4VGSthCu8oGg
 W79m6w8Oa1B4Muc5E2T6vjBLy87J+313WEBwL4yCKwyKMBHJl14uW6GcCcWe+S1w+x1R
 BSc7nc9fE8xoFv9zeXFDzoGjqAIFEfENhP3nrNVfkiOB/guIEubU0R8bWh+QXSaviCMn
 iBwh22dL/WPyvZ5bn2rgpqHy5RrtWYRml9DipcWmcp6UwhwXL3q75t2001+sKmHAjG0U
 tGvw==
X-Gm-Message-State: AJIora8Ms1tEFW3Qv7mPUnw+nhhWVHEIEet+ryCcWWDEELQAlNIx4sr3
 rEclVCOBpWOJCZkJMKtsI6FvsnCyzoKsorgA
X-Google-Smtp-Source: AGRyM1tOyQpLEBMnokujxiEPgoMgVF6QNDjFQHY+8uypRe6Yupse7jyxA9acoOvMwm+rVZWCDWWbMw==
X-Received: by 2002:a17:906:93ef:b0:72b:491c:a36e with SMTP id
 yl15-20020a17090693ef00b0072b491ca36emr38021482ejb.593.1658357423022; 
 Wed, 20 Jul 2022 15:50:23 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43]) by smtp.gmail.com with ESMTPSA id
 p8-20020a17090653c800b00726c0e60940sm135707ejo.100.2022.07.20.15.50.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 15:50:22 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id h8so5355340wrw.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:50:21 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr32646726wrr.617.1658357421541; Wed, 20
 Jul 2022 15:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220719203857.1488831-1-nfraprado@collabora.com>
 <20220719203857.1488831-2-nfraprado@collabora.com>
 <CAD=FV=XgWAMXGAfBw9dBoKB6Y6_AAT6ccAtLg=jy3qLa2HOxBA@mail.gmail.com>
 <194631de-2e3f-6e1f-65f6-76dbef04483e@collabora.com>
 <20220720185226.tf4y2ofmuz3ifejr@notapiano>
In-Reply-To: <20220720185226.tf4y2ofmuz3ifejr@notapiano>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Jul 2022 15:50:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WNOrV4XJdBzUiU31Cu7yCcRJfScUrYLhzbJwMzDFHb1w@mail.gmail.com>
Message-ID: <CAD=FV=WNOrV4XJdBzUiU31Cu7yCcRJfScUrYLhzbJwMzDFHb1w@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/panel-edp: Add panel entry for R140NWF5 RH
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jul 20, 2022 at 11:52 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Wed, Jul 20, 2022 at 09:49:35AM +0200, AngeloGioacchino Del Regno wrot=
e:
> > Il 20/07/22 00:40, Doug Anderson ha scritto:
> > > Hi,
> > >
> > > On Tue, Jul 19, 2022 at 1:39 PM N=C3=ADcolas F. R. A. Prado
> > > <nfraprado@collabora.com> wrote:
> > > >
> > > > Add panel identification entry for the IVO R140NWF5 RH (product ID:
> > > > 0x057d) panel.
> > > >
> > > > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com=
>
> > > >
> > > > ---
> > > > The comments on the driver indicate that the T3 timing should be se=
t on
> > > > hpd_absent, while hpd_reliable would have a shorter time just while=
 the
> > > > HPD line stabilizes on low after power is supplied.
> > >
> > > Right. Ideally hpd_reliable is 0 unless you've got a badly-designed p=
anel.
> > >
> > >
> > > > But can we really assume that the HPD line will be reliable at all
> > > > before the DDIC is done booting up, at which point the HPD line is
> > > > brought up? IOW, shouldn't we always delay T3 (by setting hpd_relia=
ble =3D
> > > > T3), since only then we're really sure that the DDIC is done settin=
g up
> > > > and the HPD line is reliable?
> > >
> > > If the panel is hooked up properly, then the HPD pin should be pulled
> > > low at the start and then should only go high after the panel is read=
y
> > > for us to talk to it, right? So it's not like the DDIC has to boot up
> > > and actively init the state. I would assume that the initial state of
> > > the "HPD output" from the panel's IC would be one of the following:
> > > * A floating input.
> > > * A pulled down input.
> > > * An output driven low.
> > >
> > > In any of those cases just adding a pull down on the line would be
> > > enough to ensure that the HPD line is reliable until the panel comes
> > > around and actively drives the line high.
> > >
> > > Remember, this is eDP and it's not something that's hot-plugged, so
> > > there's no debouncing involved and in a properly designed system ther=
e
> > > should be no time needed for the signal to stabilize. I would also
> > > point out that on the oficial eDP docs the eDP timing diagram doesn't
> > > show the initial state of "HPD" as "unknown". It shows it as low.
> > >
> > > Now, that all being said, I have seen at least one panel that glitche=
d
> > > itself at bootup. After you powered it on it would blip its HPD line
> > > high before it had actually finished booting. Then the HPD would go
> > > low again before finally going high after the panel finished booting.
> > > This is the reason for "hpd_reliable".
> > >
> > > If you've got a board with a well-designed panel but the hookup
> > > between the panel and the board is wrong (maybe the board is missing =
a
> > > pulldown on the HPD line?) then you can just set the "no-hpd" propert=
y
> > > for your board. That will tell the kernel to just always delay the
> > > "hpd-absent" delay.
> > >
>
> Thank you for the detailed explanation, this does clear all doubts from w=
hat me
> and Angelo were discussing.
>
> >
> > We were concerned exactly about glitchy HPD during DDIC init, as I didn=
't
> > want to trust it because the only testing we could do was on just two u=
nits...
> >
> > ...but if you're sure that I was too much paranoid about that, that's g=
ood,
> > as it means I will be a bit more "relaxed" on this topic next time :-)
> >
> > > > I've set the T3 delay to hpd_absent in this series, following what'=
s
> > > > instructed in the comments, but I'd like to discuss whether we shou=
ldn't
> > > > be setting T3 on hpd_reliable instead, for all panels, to be on the
> > > > safer side.
> > >
> > > The way it's specified right now is more flexible, though, isn't it?
> > > This way if you're on a board where the HPD truly _isn't_ stable then
> > > you can just set the "no-hpd" and it will automatically use the
> > > "hpd_absent" delay, right?
> > >
>
> Yes, indeed. I just wasn't sure that flexibility brought us anything, but=
 after
> your explanation above it makes much more sense now, thanks!
>
> >
> > For Chromebooks, that's totally doable, thanks to the bootloader seekin=
g for
> > proper machine compatibles, so yes I agree with that.
> >
> > >
> > > >   drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
> > > >   1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/pa=
nel/panel-edp.c
> > > > index 3626469c4cc2..675d793d925e 100644
> > > > --- a/drivers/gpu/drm/panel/panel-edp.c
> > > > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > > > @@ -1854,6 +1854,12 @@ static const struct panel_delay delay_100_50=
0_e200 =3D {
> > > >          .enable =3D 200,
> > > >   };
> > > >
> > > > +static const struct panel_delay delay_200_500_e200 =3D {
> > > > +       .hpd_absent =3D 200,
> > > > +       .unprepare =3D 500,
> > > > +       .enable =3D 200,
> > > > +};
> > > > +
> > > >   #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, produ=
ct_id, _delay, _name) \
> > > >   { \
> > > >          .name =3D _name, \
> > > > @@ -1882,6 +1888,8 @@ static const struct edp_panel_entry edp_panel=
s[] =3D {
> > > >
> > > >          EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea=
1.delay, "N116BCA-EA1"),
> > > >
> > > > +       EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200,=
 "R140NWF5 RH"),
> > > > +
> > >
> > > This looks fine to me:
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > I'm happy to apply this in a day or two assuming you're OK with my
> > > explanation above.
> >
> > Thank you for the long mail, your explanation was truly helpful!
> > (especially for me being paranoid :-P)
> >
> > So, I agree to go with that one, for which:
> >
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> >
> > Nic, green light?
>
> Yep.
>
> I haven't seen any issues with keeping the hpd_reliable as 0 in the machi=
ne I
> have access to, and Douglas' explanation cleared up all the doubts of how=
 this
> all works, so, Douglas, please feel free to merge this as is.
>
> In that case, since patch 3 was also merged already I'll send a v2 just f=
or
> patch 2 separately.

Great! I went ahead and applied to drm-misc-next then.

f6ff4570e567 drm/panel-edp: Add panel entry for R140NWF5 RH
