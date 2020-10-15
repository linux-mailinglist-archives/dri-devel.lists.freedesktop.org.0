Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FE3291404
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F34E6E283;
	Sat, 17 Oct 2020 19:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366A16ED20
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 14:37:48 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s9so3773476wro.8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 07:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atcomputing.nl; s=atcomputing-nl;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version;
 bh=BlxdYyMIUCSA+6cNAex4SwzO8S5YCgvJxaaXIsMT2yk=;
 b=hxblWQXDdL6Pknk5gfzyWCNGujyGqTDYiCpudBE/EPSclIPZ41n+wF9Jo8c0XITvIC
 OL8ZRykRU2q4HRVLGDNTk2mZtfzkL89OqZZKT5ZFox8fToxxfF99kWo/CPMVIUsNSyXt
 yXD5DC3RBkzNVOUQIHRgWDi7YimrYMcUdA9zY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version;
 bh=BlxdYyMIUCSA+6cNAex4SwzO8S5YCgvJxaaXIsMT2yk=;
 b=dcrlsUEl/Mt6n53wWqzz5JIhbNQAyM5CUAOkxfe55MDjltKoOKdYKp2sMjuTqoEu7q
 ENg9em9O2DJbmG0ATaSpQBNpfwR5WaAkz8EFTqFFWl7KjXXaykRIL6JVsxQ1Hao/1Zq3
 16FKidYPZo4yo2fkedoFXJbmjSCQDt2J56lSFAia0NmCD8o6lnusvavpNX2pFf0JbmoW
 YmWL/i8yeu8I5l8zvWY786NYKSddwqYtLVp6A3F+tgICQrFGFYirbag3WV2KtlqxcFTI
 JNZtKRy+UDyez1xyyfkXUipLZW1FZJ1VXtiS+tVUsGmL9zvzBueQ/yt7FqrafRfYa/Vx
 i/dg==
X-Gm-Message-State: AOAM533V3DQoMuWY1eqd3DoJnTmbOwE+kuWXrGrjYd3L3eeh91IIvKBR
 Ac/y6Rw3bK2saPBVU5BnAJZhlw==
X-Google-Smtp-Source: ABdhPJwgqUnP8Mldpa0nrzDfaKpDs4xYqt1UEegfzQhzuJOOdHBy/bbgWWe996jWN8Hz/K5oGBUX+g==
X-Received: by 2002:adf:e3cb:: with SMTP id k11mr4756640wrm.341.1602772666618; 
 Thu, 15 Oct 2020 07:37:46 -0700 (PDT)
Received: from nyx ([2001:980:74ee:1:1ec4:4a28:e4c9:705c])
 by smtp.gmail.com with ESMTPSA id j7sm5253004wrn.81.2020.10.15.07.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 07:37:45 -0700 (PDT)
Message-ID: <b58d854afe42d45f499b978da96f0cf29c5e574c.camel@atcomputing.nl>
Subject: Re: [Intel-gfx] [PATCH] Revert "drm/i915: Force state->modeset=true
 when distrust_bios_wm==true"
From: Stefan Joosten <stefan@atcomputing.nl>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Thu, 15 Oct 2020 16:37:39 +0200
In-Reply-To: <20201001152346.GR6112@intel.com>
References: <60a804aa6357eb17daa1729f4bce25e762344e9f.camel@atcomputing.nl>
 <20201001152346.GR6112@intel.com>
Organization: AT Computing
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 17 Oct 2020 19:04:47 +0000
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: multipart/mixed; boundary="===============0704423278=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0704423278==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-1ehRlM2nvfRUqr5GDzRW"


--=-1ehRlM2nvfRUqr5GDzRW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Ville Syrj=C3=A4l=C3=A4,

Thank you for responding so quickly.
I was occupied with work and life for the past two weeks, sorry about
the wait, but have now managed to find some time to continue pursuing
this issue again.

On Thu, 2020-10-01 at 18:23 +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
> Argh. If only I had managed to land the full dbuf rework and nuke
> this mess before it came back to bite us...

Yeah... I know the feeling.

> This is definitely going to break something else, so not great.

I did expect that. The automated tests failing was a pretty good
indicator.
You put that code in to take care of something. All I did was just tear
it down because it happens to work better for me... blunt but
functional for my purposes.

Seems to need some finesse or a condition to not cause my problem? Yet
still function for the reason you put it in there for.

I am more than willing to play guinea pig and test patches on my end to
improve it with you.

> Can you file an upstream bug at
> https://gitlab.freedesktop.org/drm/intel/issues/new
> and attach dmesgs from booting both good and bad kernels with
> drm.debug=3D0x1e passed to the kernel cmdline? Bump log_buf_len=3D
> if necessary to capture the full log.

I have done so today.
It's at: https://gitlab.freedesktop.org/drm/intel/-/issues/2579

--=20
Stefan Joosten

AT Computing BV              =20
Sharing and growing together  Tel +31 24 352 72 82
Arnhemsestraatweg 33          info@atcomputing.nl
6881 ND Velp                  www.atcomputing.nl

--=-1ehRlM2nvfRUqr5GDzRW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQFKBAABCgA0FiEETjlf9HQ9GW2hDHJJSfQ+3gEWJQkFAl+IXrMWHHN0ZWZhbkBh
dGNvbXB1dGluZy5ubAAKCRBJ9D7eARYlCdRQB/0UKaMEMiO/73Q8nqqd7wMxYfhB
v5UqBk4fiG0bL1WnkW2nLq1AZ3OZWfrL+FuHp9uUC7qf6YXcAQYRlcxScMnCkdC6
SiK1NdIf5B4DULfbxaeiIfkGf94/zUdX2WTtb5ch6MufmgYfGgIovnT1TE2EKnk8
wNkZYiWMnZpffMJUU6qMHt+FR5YUdomuMGIwCDHHo7+YnLag0v+EpXBh8CNarUHa
EZKa3pOLrNAUaLr5mhDpdtEmDlDQ8of89KQod339gmI+bE1G7h0jHk6TDaMdFipU
uw8sp2MQiUWI6QJFulsIW6uwcPqCgNMKPJKWIDIlpqAxuhE5amOaJoQ0+2w5
=c3uK
-----END PGP SIGNATURE-----

--=-1ehRlM2nvfRUqr5GDzRW--


--===============0704423278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0704423278==--

