Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13773DC868
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 17:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E3C6E126;
	Fri, 18 Oct 2019 15:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC896E126;
 Fri, 18 Oct 2019 15:26:11 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f5so6635949ljg.8;
 Fri, 18 Oct 2019 08:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=3z94akePlKnFzVcC7dZpTI6wNNWGnwHKNPG04WedmiI=;
 b=C9RGgo6cE3TK7UGUwwbkulyDmh2ruxvnnQ5rs7ajOOgY0UNf0UjpZN+ni1I3qwv8Xd
 rv8lMGPXVl+We/Sv+g/xmEqggbhWNB0uqot5NZKAaEgmGHpbTY9DlcEb5ljj4roIu6Br
 jnshX8Hf3gyQ4jnK9puXqiPb6zob2WMxMDl2HbUkIZSCoqLdWLRjz5XCz52Wug8Ef4Wk
 3rMPg2adVodbDGsMcRUgkxZKxBEnHGTVEg452dxd+tryGZCJndjHO6qPVgYxSl98l3F4
 5KY18+kl1ZyM9nN43RB/Obk434WxyZAPWRPHSNkEGOdGqsLK5+VJvqofTopb4rSlgQ7n
 CyEA==
X-Gm-Message-State: APjAAAViHTkEg15Xei4WHPHxdTYH/BtlMhckEWIr3FSlqzenBynJE7aN
 3Pd9DPnHfNx2Qgp2gCH7qGI=
X-Google-Smtp-Source: APXvYqwcZ6qsh4Izjy72tFHTZozN916U5OSSnJvB4bXWf7hL8uFL8FpfgzcpE1FFpx3PfepdKD1sDw==
X-Received: by 2002:a2e:5d5b:: with SMTP id r88mr6647615ljb.170.1571412369639; 
 Fri, 18 Oct 2019 08:26:09 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id o9sm698665lfb.1.2019.10.18.08.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 08:26:09 -0700 (PDT)
Date: Fri, 18 Oct 2019 18:26:05 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Drew DeVault" <sir@cmpwn.com>
Subject: Re: [PATCH v7] unstable/drm-lease: DRM lease protocol support
Message-ID: <20191018182605.04e6fb86@eldfell.localdomain>
In-Reply-To: <BXSQA6JW25GT.1OK4I53XFO1M5@homura>
References: <20191018173437.0c07c2db@eldfell.localdomain>
 <BXSQA6JW25GT.1OK4I53XFO1M5@homura>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=3z94akePlKnFzVcC7dZpTI6wNNWGnwHKNPG04WedmiI=;
 b=SHKDIRMHdHY1VSKU5xH2KdAaVvD2AjWDPKDAZlExf+I8n9YHPkqOZ2T/Mn+JP/xMPa
 X10kOFqgunYFgkORuEYR6m6nhMrK0slDI327VGqW7aqcNueVnF2Wy9wdjwOYh7W3F0Hv
 3Pj0q/+bzwQ9DFslarfuOwGi+yjAJ44cHPOnwck7YcHdI6DH0+LsyUF2/IEjsm5tpki/
 BJDivIK7Z9vgje2rYSyGvFI3TyP100gpoVTwpG2CHrDzJsNtEjj44ZEc6PQiOZ+nChR4
 dPXz1d0V77LmzIOTQsJiY1jmpEyPMVpCr66R0zf7GvXL6/QAdQ+9XqPUOKmInIeqMT8w
 Bc0A==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Marius Vlad <marius.vlad@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0854926191=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0854926191==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/W5cKZ7u6MN0gD1M3u0AAl8X"; protocol="application/pgp-signature"

--Sig_/W5cKZ7u6MN0gD1M3u0AAl8X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Oct 2019 10:43:16 -0400
"Drew DeVault" <sir@cmpwn.com> wrote:

> Regarding hotplugging, the Wayland compositor is probably keeping track
> of hotplugs itself and withdrawing/offering connectors as appropriate.
> Also, when the lease is issued, the compositor withdraws that connector.
> For the client, upon hotplug I imagine the DRM asks start to fail, and
> it handles that accordingly (presumably it'll close the lease, if the
> compositor hasn't already, and wait for it to come back, or just exit).

DRM KMS operations do not fail merely because a connector becomes
disconnected. You can even force on a connector that is initially
disconnected.

If you mean on revoking the lease or losing DRM master, yes, then I'd
expect KMS ioctls start to fail.

But is disconnection reason enough to revoke the lease? I guess we
shall see.

> When a hotplug of a leased connector happens on the compositor side, it
> can notice this and exercise its descretion in the implementation. I
> think the current text of the protocol supports this view.

Ok, so the expectation is that a compositor does not offer disconnected
connectors, and withdraws offered but then disconnected connectors, and
that it sends offers for connectors that become connected while
leasable. I suppose that is reasonable, I still think a sentence
suggesting towards such behaviour would be in place.

Btw. there is more to hotplug events than just connected/disconnected:
link status changes, and HDCP status changes. I suspect more is coming,
too. At some point we might need to add a hotplug event in the
protocol, but I think that is easy to do even after stabilization.


Thanks,
pq

--Sig_/W5cKZ7u6MN0gD1M3u0AAl8X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2p2Y0ACgkQI1/ltBGq
qqfGOA/7BpUzGHIiykDdtEUdK0lqOmgS/J5qB0ZoHkj3Pee/7nJgoaPR9pIJnVcq
IdT1MXf04GV+6huwsDbV4yIr2cWilKwBxxMyXGYeuPZ2ds7K9Db003wPjWKXq5E2
DuVVbcYXR0l4+Cu6nlvR+aiWWc9O4XoZVrjLxY6v2CqGjQDqSlyE23gwfPWdRe4z
xE6gcJl2I3eEGpJf79buFb+UpX0mEP9AuGrOKJMTgU+RcUsiAQV9zCNwDYrHAHig
N4Wo7pJKPc12WkFCEK8W+mgYrDzGGpQt9FHCRYStMlwkGe300c4amsU+RegNeFoz
jgfpP/70q6UIhomJf9jAJKT7zY0VR5InCltXqJJq8ZUWZy06p0K34tSRUIpuODo7
2S11WaYkvFk5TcPtm1ufJmdony05ud856/AVXFHuvQkgroHGQ1XnKSnpx6YZlmqs
Wydjwfhg5yVHDz0nhMYxWyvyRikIBaCk5yY4v9pBpBicFjO7GTGtmHj9MZTYEPkE
y/DJUFm9p1clbWg9sCvgOxvoU0BNcV/AFkK9WxIQyGishOgJHxb1ex7KoNPknuKn
dG7sf/PuJiiuuc+HexxKDNwVfgIiivl95i66yoKYrPum0ZbnfXupHSXfCaBTgTub
qbJ3OMZOCyBtDrlwcbWHjHxTOHoKfpmWCh9LnWcJ5vQFeXCUbcg=
=4vSe
-----END PGP SIGNATURE-----

--Sig_/W5cKZ7u6MN0gD1M3u0AAl8X--

--===============0854926191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0854926191==--
