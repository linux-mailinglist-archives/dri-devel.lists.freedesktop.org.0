Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A351B6F26
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 09:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF386EA84;
	Fri, 24 Apr 2020 07:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD5C6EA84
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 07:40:38 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id b2so8919505ljp.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 00:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=PckO8R2cQEcoPkMpExJwz6XSqjHRurTWQmTHbIu9VMM=;
 b=c0CK8oGLjKj9MIx3lhQpDTAtdFeekNb8riwWzLUWPPjkslitFIq4G2H3SPKw8Zw8pv
 IJnNhZQf/s2yzxAX4xn5KSWWcXHTapw/bqrtK7/omPZ8IDmhMr4krv7RViL0uJLWzHz2
 IdsiD6XFj8bYF8LZ7+oUnLMD6iYGk7x/93rJAvgwEbPVdzyM3jpRIL7mViEmBTd1qFqO
 IsOYqZWaSwqth4RoFtXPIM0Qpx+vUeFGBA8gCiTkj3dNYV17PT3thEUd5vPnLXYYjBUX
 Sx8X5EMs6nEo2s2ddSBFBLaR4Dp2xlQCsEhfYgxqM/oxaMuBcvwqNZXXf9getGJG5yzx
 odCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=PckO8R2cQEcoPkMpExJwz6XSqjHRurTWQmTHbIu9VMM=;
 b=QKJeWU6VE6q9TOHn4zUoUaZkCIJdEPUTS3zQNNTmGFu2UJK/Oi0DO3fp4d+PhgeJqr
 CU9/4iKX0MA6mstRoxbEm0rCvjPICpKZSbaDBvlMw3UCZo3clVT1oRrxCIJOSFMh2mk6
 ONh6u2OSl/Q+JCFl1OmFuKloQ+WlmOvtYOXdBB68gVs1rfQYNga/6c7SmP2CKgNV8sdB
 UiA48NJQhNYhN5MwnyK/xU+mq9EzjBe/anJ3UIYfLNcnTEVFVrqAL859MG672llSOE9P
 m/rkE7r43mYfkPVWM+UJ5WULPR+WkrNxSgElCCXaVtNehGhyYShvX+KALHsShtx+WQfK
 VqTw==
X-Gm-Message-State: AGi0PuYTNwg6Usw5grw7q5zAHebhPWF0lGjrJ0QdB5JBgGw4bwxnUu7Z
 cEvMWgBVy8Tzaq0fLWII1x8=
X-Google-Smtp-Source: APiQypLqj4hJdUIXnU2Qi09PUSvmxy7yzhGAlVmfzqka/UQ44hzH8KRfvXZRVobtfxnaDs49uA2b7Q==
X-Received: by 2002:a2e:860a:: with SMTP id a10mr5366639lji.20.1587714035601; 
 Fri, 24 Apr 2020 00:40:35 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v18sm4224328lfd.0.2020.04.24.00.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 00:40:35 -0700 (PDT)
Date: Fri, 24 Apr 2020 10:40:24 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rajat Jain <rajatja@google.com>
Subject: Re: RFC: Drm-connector properties managed by another driver /
 privacy screen support
Message-ID: <20200424104024.4cdb0d40@eldfell.localdomain>
In-Reply-To: <CACK8Z6Hwg132K3TwsX6Bjx-2KG0HywrP=PnMMegdp7jqeU__1A@mail.gmail.com>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain>
 <87k12e2uoa.fsf@intel.com>
 <e8da46f8-ebe4-aee4-31c8-229d06fa7430@redhat.com>
 <20200421174613.139991ed@eldfell.localdomain>
 <CACK8Z6Hwg132K3TwsX6Bjx-2KG0HywrP=PnMMegdp7jqeU__1A@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Christian Kellner <ckellner@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Nitin Joshi1 <njoshi1@lenovo.com>, Mark Pearson <mpearson@lenovo.com>,
 Benjamin Berg <bberg@redhat.com>
Content-Type: multipart/mixed; boundary="===============1737740435=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1737740435==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/RDrY+YdlzfjNH6UqCBAXTUz"; protocol="application/pgp-signature"

--Sig_/RDrY+YdlzfjNH6UqCBAXTUz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Apr 2020 11:21:47 -0700
Rajat Jain <rajatja@google.com> wrote:

> On Tue, Apr 21, 2020 at 7:46 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Tue, 21 Apr 2020 14:37:41 +0200
> > Hans de Goede <hdegoede@redhat.com> wrote:
> > =20
> > > TL;DR: Yes there will be races, because of both userspace +
> > > the firmware having; and potentially using r/w access to
> > > the privacy-screen state. But in practice I expect these
> > > to not really be an issue. Important here is that userspace
> > > only commits the property in a transaction to commit if
> > > it actually intends to change the property so as to not
> > > needlessly create a situation where we might hit the race.
> > >
> > > As for 1 vs 2 properties for this I guess that in preparation
> > > for potential devices where the state is locked, having a
> > > r/w sw-state + a ro hw-state property makes sense.
> > >
> > > So I suggest that we replace the current "privacy-screen" property
> > > from Rajat's patch-set with 2 props named:
> > >
> > > "privacy-screen-sw-state" (r/w)
> > > "privacy-screen-hw-state" (ro)
> > >
> > > Where for current gen hardware the privacy-screen-hw-state is
> > > just a mirror of the sw-state. =20
>=20
> Just to make sure I understand the semantics correctly:
>=20
> - The  "privacy-screen-hw-state" shall be read-only, and can be modified =
by:
>       - Hardware (e.g. HW kill switch).
>       - Firmware.
>       - (Potentially) needs a notification/irq to the kernel when this
> changes (or may be kernel can read it only when userspace queries for
> it).
>=20
> - The "privacy-screen-sw-state" shall be read-write, and can only be
> modified by user space.
>         - If user space toggles it, the kernel will attempt to
> "request" the change to hardware.
>         - Whether the request to hardware was successful or not, the
> "privacy-screen-sw-state" will always reflect the latest value
> userspace wrote.
>         - If the request to hardware was successful, the
> "privacy-screen-hw-state" will also change (probably via a separate
> notification/irq from HW).
>         - We expect the user space to write to
> "privacy-screen-sw-state" only if it really wants to toggle the value.

Hi,

yes, to my understanding, that seems to be the correct idea from this
thread. The hw-state property must reflect the actual hardware state at
all times.

However, when userspace sets "privacy-screen-sw-state", the driver
should attempt to change hardware state regardless of whether the
"privacy-screen-sw-state" value changes compared to its old value or
not. Otherwise userspace cannot intentionally override a hardware
hotkey setting if possible (or would need two atomic commits to do it).

Mind, the above paragraph is only what I interpreted from this email
thread here. Previously I did not think that with atomic KMS, setting a
property to a value it already has could trigger anything. But I guess
it can?

This design is based on that it can.

> What is not clear to me is if any change to"privacy-screen-hw-state"
> shall be propagated to "privacy-screen-sw-state"?
>  - If yes, then I think we are not solving any problems of single propert=
y.
>  - If no, then why do we require userspace to write to sw state only
> if something has changed?

No. As already written, the kernel must not change the value of
"privacy-screen-sw-state", only userspace can.

Let's assume that you have a firmware-implemented hardware hotkey for
toggling the shield. The driver also successfully implements
"privacy-screen-sw-state" meaning that writing to it will set the
hardware shield state. If userspace was writing
"privacy-screen-sw-state" even when it does not intend to change
hardware state, it would almost immediately override any state set by
the hardware hotkey, making the hardware hotkey (randomly) not work.

This assumes that the hardware hotkey is a momentary switch that does
not stop software from controlling the shield too.

If the hardware hotkey can stop software from changing the shield
state, then it might not be necessary for userspace to avoid unneeded
setting of the property. But that depends on which way the hotkey works
and which way users want to use it, so it's still best for userspace to
not set the property unless it really intends to apply a change.

If possible, it would be good to make this case the prime example of
how to correctly implement KMS properties for a hardware feature that
can be controlled (and fought over) by both userspace and
hardware/firmware. It seems like the same design can also work with
hardware switches that force the hardware state to be one or the other,
stopping userspace from changing it. Therefore I'd avoid incorporating
any specific shield use cases in the design, e.g. "if hw switch is set
to shield-on, userspace cannot turn shield off".


Thanks,
pq


>=20
> Also, it seems to me that in my current patchset, the property I have
> already behaves like "privacy-screen-sw-state". Do I just need to
> rename it?
>=20
> Thanks,
>=20
> Rajat

--Sig_/RDrY+YdlzfjNH6UqCBAXTUz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6il+gACgkQI1/ltBGq
qqewRxAAoXLZNShN6oBqHNY8Wdjw+D4QTKQwS6x+a4MMD3nz1TSNiSkkCl6OkW92
3koQgf17m4bbG6FfyOTID07x9t8O5SOufS1MVpg9bzurSEmQDFGr4vQd01UvabMs
JKU0WxOI7Yov4XjsmTdF50FXtKE7yMxH6CsKwq+c9sBLNHAiTaJ4Iu9S5yLkhNvS
r1lxA4wBv7klZIy1TKYlzlMlSrPFeNarKeB4CKomaKFytvYyPf6JYbubE3sGPeti
Bp18eCSSK+TfLcbRg2QY09FnLfyNwn+eCxSi368tSh44vZ8ni9a/GS2VUSrZJVN6
HEyy3bM2WhdcEkb5OAiI7KCG2EXkzrGkccQOTwxZhJN26F0D0sqxNaIFQFeZqLdS
Wezsr99zJLX0E8S/s6EE7Pafotf6bR3KOElOY3bGTVa0ivgpGNt0qWYaKLi/1KU9
tCd7JIiPNlZkr/jkyEXnIHQaLECVsZ81cV9I4dTG+ZWJpQ5P1qMhrBOpmDl20HBZ
tpnwqttxMjeEpuY1GmhrsjXF+6ZQjhR/FG5zfjg8l4wyDb9Aw6ptWqFP8TCDT6x9
+qS9UmwnjHpvnzSnifGb5hPi068yTX5LWPUiDr0R8dxhAmN7ZjDMXokt/33GY5Rj
Bm3N+u783bLbUbkcPw+4LNe69gJo2TvZKCJycRfIIKGHcN5LZTs=
=fmri
-----END PGP SIGNATURE-----

--Sig_/RDrY+YdlzfjNH6UqCBAXTUz--

--===============1737740435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1737740435==--
