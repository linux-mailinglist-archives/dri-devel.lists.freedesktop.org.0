Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801AE868350
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2956810E26A;
	Mon, 26 Feb 2024 21:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kali.org header.i=@kali.org header.b="hkXGKvtM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AE110E26A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 21:49:16 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-563fe793e1cso4853405a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 13:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kali.org; s=google; t=1708984155; x=1709588955; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LvqziGEBSPprOdiqXW0BtoohOCzdBYizN85hWV54RjA=;
 b=hkXGKvtMY3jKOVyQqa/NpeFYBjQEw4KXHxx6j/5v+m5H7DnVEi3+8PXhm6zBT76Nvc
 ZrJiHO5KnNrdudDYMitHs1TDkEBLGdTL0HabvLROfjbjf8gmdzX6hnMtyzc9HTBgyAOh
 9bRhaRbpDEzi63XIwWLlwBz4bcVRyxGqjwrKfHRrvjhTiYTfGa73/bMtjR6z3DVADJvT
 CdAgWpSJp+BKH5JX4vLTtdyCFLMVnuaYqzVyVO4Ds4l/qzVM2wkcJKd7HwcvNkrKTRDI
 ZLRMJLmRVvcweN+2ObH8YR1FVk+5Z1KjN9+3AxlMvgqqUngl4Ps9tBoag2sO59ZrGqUF
 Enfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708984155; x=1709588955;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LvqziGEBSPprOdiqXW0BtoohOCzdBYizN85hWV54RjA=;
 b=l7TnIgKlMPKXPO+4pda4oRyh+AyN78LWjTsCtx/ikgetQa6eGuAlMv7tGdD1CBR4w3
 wX0O0/0UUrsqPaIxWwJhNJKqlovb3MVPNkIR8C6c0cGo6XhjKA1fQBsudb+VGk+zakkQ
 QKYFkL0ii81G7p0G8gy+8cbStDewYPjF9ZgvlGpaps/tBw9eUN/ZmUYSEPqZvgGCyWkQ
 W9zizsh9NFksdzVLS+f/PNv3ak1G3Q7vyh1q+7vYNF1vkKyWsAGHS2TWAIVnLBxSzFS4
 dMNyceDuO0kAjbqVhDpaGmaZ+EpIlvxIHlYxEtk8VSMyQhYXFJ+E6c4kYi3L18z3nREn
 eD2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXco3XLFKjub0uah4FjTQ1cpD/UtKYCJGQTqEa/TOUBJXjjyRubX5QQlXZZLgtV7xJZ/Mvj9ZnTr/lDVoHso+DyhNXS3cpcx9qLgDu/xsI6
X-Gm-Message-State: AOJu0Yz3vkpgy31/vi+mk9273BsH9lgBeXhr9cPOgbnD83S+hEFhxFgv
 BLVclolmBdp/okOv3scM0SkvVEiD72uumeDXTw0jaPBtujZNmYg3K5v5/zkz2q3RuvpEjpSlbEr
 r2ehZQ7wYF29GxBkboeHP5wAHFPgOZc7LDTbVCg==
X-Google-Smtp-Source: AGHT+IFDhjQUIvtE3gXZFBzP+tu+CRDxsI0/hiztwW0bUlj1DLWQ7Od9BSLqqvs21UZ11Tq9oSJFYh+ttSPmumwWR38=
X-Received: by 2002:aa7:c609:0:b0:565:9e16:60da with SMTP id
 h9-20020aa7c609000000b005659e1660damr4977584edq.30.1708984154965; Mon, 26 Feb
 2024 13:49:14 -0800 (PST)
MIME-Version: 1.0
References: <20240202141109.1.I24277520ac754ea538c9b14578edc94e1df11b48@changeid>
 <CAJMQK-it9YMod4rHKnACq4O-iaGieK2SN4x5vQ018CghsA631A@mail.gmail.com>
 <CAD=FV=VfuFrK1cSKA0maMzT5dxzKEzADqrd69fZKXuAGrU2rmA@mail.gmail.com>
 <87sf1u58k0.fsf@intel.com>
 <CAD=FV=XQdLm3PcjEd_g_dBJ9QO8zAJtj5nrXS9=cjC80+-Jbfg@mail.gmail.com>
 <cbcd981f-bd5d-477e-8482-d3414be17057@linaro.org>
 <CAD=FV=UtakQZ6OEKwERW5gNeAfS88EqkuQAHkrQoN=SicDG1JA@mail.gmail.com>
 <87frxskef7.fsf@minerva.mail-host-address-is-not-set>
 <CAD=FV=WwfB=u2DVE0ux9cD3OCCccgcWCdJBxW2-9gg4qSFSv+A@mail.gmail.com>
In-Reply-To: <CAD=FV=WwfB=u2DVE0ux9cD3OCCccgcWCdJBxW2-9gg4qSFSv+A@mail.gmail.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Mon, 26 Feb 2024 15:49:03 -0600
Message-ID: <CAKXuJqiXteBsrFF1q-dziaUvFYXXTk98Q2y7ZcDit0VxONsNmQ@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: Don't attempt AUX transfers when eDP panels are
 not powered
To: Doug Anderson <dianders@chromium.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>, neil.armstrong@linaro.org, 
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org,
 eizan@chromium.org, 
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Imre Deak <imre.deak@intel.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Johan Hovold <johan+linaro@kernel.org>
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

On Fri, Feb 16, 2024 at 9:30=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Feb 16, 2024 at 12:21=E2=80=AFAM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
> >
> > > The kernel tree we landed on was the v5.15 tree, which is currently
> > > serving all Qualcomm sc7180-based Chromebooks, all Mediatek 8173
> > > Chromebooks and all Mediatek 8186 Chromebooks. There are also a pile
> > > of x86 Chromebooks running our v5.15 kernel. This code shouldn't
> > > affect them because (unless I'm mistaken) they don't use the two
> > > affected panel drivers. In any case, I haven't heard any screams from
> > > them either. Given my landing plans of "the week of the 26th", this
> > > still gives another 1.5 weeks for any screams to reach my ears.
> > >
> > > ...or are you looking for non-ChromeOS test reports? I'm not sure how
> > > to encourage those. I suppose sometimes folks at Red Hat end up
> > > stumbling over similar panel problems to those of us in ChromeOS.
> > > Maybe +Javier would be interested in providing a Tested-by?
> > >
> >
> > I do have a SC7180 based HP X2 Chromebook and could test your patch (no=
t
> > today but I could do it early next week), although I haven't followed s=
o
> > if you could please let me know what exactly do you want me to verify.
> >
> > AFAIU the problem is that the fwupd daemon tries to scan DP busses even=
 if
> > the panel is turned off and that's what takes a lot of time (due retrie=
s),
> > and your patch makes the driver to bail out immediately ? If that's the
> > case, I guess that just starting fwupd daemon with an without your patc=
h
> > while the panel is turned off could be a good test ?
>
> Sorry! I wasn't trying to sign you up for extra work. I'm not
> convinced that any extra verification on a Chromebook is all that
> valuable since that's pretty covered by the fact that we've already
> pushed this patch out to real users on Chromebooks. I think Neil was
> hoping for some confirmation that my patch didn't break someone else's
> hardware. I think maybe good enough is if you have some type of
> hardware that uses eDP and that you could verify that my patch does
> break anything about it?
>
> I'm not aware of anyone with extensive DP AUX character device usage.
> I guess I thought of Javier because I remembered him at least also
> using fwupd and some of the fwupd plugins try to talk to DP things
> over the DP AUX character device.
>
> If someone is really in a testing mood and wanted to stress the char
> device, I guess something simple like "hexdump -C /dev/drm_dp_aux*"
> for whatever eDP AUX is associated with eDP would at least do some
> reading. You could stress turning the display on and off while doing
> that with and without my patch. Presumably it will be better (error
> out more quickly) with my patch.
>
> If you wanted to stress the i2c path, you could do something like this
> (the grep assumes you're using ti-sn65dsi86 as your eDP bridge chip,
> but hopefully easy to adjust):
>
> bus=3D$(i2cdetect -l | grep sn65 | sed 's/i2c-\([0-9]*\).*$/\1/')
> i2cdump ${bus} 0x50 i
>
> That should dump your EDID. Again it should error out quickly when the
> panel is off after my patch but should start working again when the
> panel is on.
>
>
> Hmmm, thinking about all the above, I guess there is one case that
> _could_ be broken by my patch. I really hope not, though. If someone
> has a panel that's on an always-on rail or on a shared rail with some
> other device (like the touchscreen) that's keeping the panel power on
> then without my patch it would be possible to do DP AUX transactions
> even when the panel was "off" from Linux's point of view. It would
> have worked mostly due to luck, but now luck will run out and it will
> stop working. I really hope nobody has userspace that is relying on
> this, but I suppose it's always possible that somewhere, someone's
> userspace is. If you are or know of someone who is then please shout.
>
> -Doug

Tested on my Thinkpad X13s, with display on, I get the did when
hexdumping /dev/drm_dp_aux2, with display off I get device/resource
busy.
Tested-by: Steev Klimaszewski <steev@kali.org>
