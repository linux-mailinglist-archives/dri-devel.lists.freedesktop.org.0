Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B07244B15
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 16:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0C96EB6A;
	Fri, 14 Aug 2020 14:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BA46EB67
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 14:10:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f1so8495349wro.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 07:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EbHTLuy/B3AkonRdkJBkUt4uUpUuJffuqahqnpSrwNQ=;
 b=UFzdhA6/7MQlpGaigBh4soSnGnVQDgey/SpWbGVhkWeOifA0YkoKm8QfaLqRdg3RwX
 rWqbQtJDJAZRcp/QzgnpgK1Jvn9VNiwzu/0oASDU5k5BpFqWpZMONhiJqyCgytw58MjF
 6o022qiMxdMOrtC5CI+H24hEXnNda0oThrUKcPEwtFX2V731FxrPK0KVO+wjHhGxQf4v
 mgaPXV7S/jG2AL7I8VhuTq6sR5nwt2st/6IqLaai6BAZO10swET9H+P7yHGGU595hCdS
 3aJI0GNX0xsv1vw5CwQtiKdRDneox7MrhFAUOkTT9xQsl9TeFceNq0r1EktKdYN//juS
 P/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EbHTLuy/B3AkonRdkJBkUt4uUpUuJffuqahqnpSrwNQ=;
 b=fnOktojlwr4Y9lDH5T0dMab/J8SAA2MCaZD0uSIIprKf1YAICl/HEgzWRkcO5fkY3h
 lilndOLF6CE0FVM9eNvHi8igb//i/9LapLhIcJ2sBHg4hEkopM6503L9zpygsrTeKW9j
 7+EsZfozn2YG5uQa0ZFSJzP2OJeTGXGENmYsgunIhiZx8XhC38YlSGSgVbcAnY2Flmt1
 +GWsY7PxMj1m1JbnNquA4ZldlvrG/+p4bHox8V01NYmgA5KBcwXwBMJWE/+WTjSSj6zR
 GYE3sWPxwsDRjO7Ssd1QD2rQHhFNkUn8fKTExjBWSkrt3dwmhU1k1Z6hZEoSZCwlozmp
 U+JQ==
X-Gm-Message-State: AOAM531EOo1vZPXimRx7eDhFjq0xg0aSvLn6BtCBBk9tUD83963eUXXu
 9RYi5lOCfHPLXay5GQLWaN7WirGdKWg=
X-Google-Smtp-Source: ABdhPJybug/hDdr9BubNVIlVbJ3THYGRkXJoljAcJWsVgAUAiQ5wysds6+XP7W2Y5uzdVhMufB/RHg==
X-Received: by 2002:a5d:60c5:: with SMTP id x5mr2966811wrt.67.1597414258224;
 Fri, 14 Aug 2020 07:10:58 -0700 (PDT)
Received: from localhost
 (p200300e41f10ca00f451c56750ebc625.dip0.t-ipconnect.de.
 [2003:e4:1f10:ca00:f451:c567:50eb:c625])
 by smtp.gmail.com with ESMTPSA id l81sm15379329wmf.4.2020.08.14.07.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 07:10:56 -0700 (PDT)
Date: Fri, 14 Aug 2020 16:10:55 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [git pull] drm for 5.8-rc1
Message-ID: <20200814141055.GF556087@ulmo>
References: <20200812174005.GA1705@kevin>
 <2c5cf2e8-afd2-446d-1f27-2c225c65d447@nvidia.com>
 <CACO55tto89kT-_QKGjQ50Ht8U-4Dop6sTjNsbr1qHXhgNuDHEA@mail.gmail.com>
 <CACO55tu1RWZ0ZGcMcrU-snT3CkJtwxawwJ9990-5a+hpByh-Hw@mail.gmail.com>
 <CACO55tsfV9pGijOF5F=dLqFhpXgPSArGHXa44Mt3eRBk7z-X=g@mail.gmail.com>
 <CACO55tsEjGUhfrBdbcpT9xLa8N-T0JR-t7xFBA5pxDZ5+NiQhg@mail.gmail.com>
 <efb830fe-9ded-f5d3-6944-45adbb2a1f80@nvidia.com>
 <CACO55tsZAh4aThBSqiQJ5o6jCi+6vcfXDEfCueyBmOK62ZsW5Q@mail.gmail.com>
 <20200814135725.GC556087@ulmo>
 <CACO55ts=LdniSVTEy6opRhAj_vsH0czjJrwy4ExpiWMnRRp3uA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACO55ts=LdniSVTEy6opRhAj_vsH0czjJrwy4ExpiWMnRRp3uA@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
Cc: James Jones <jajones@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0545382961=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0545382961==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3yNHWXBV/QO9xKNm"
Content-Disposition: inline


--3yNHWXBV/QO9xKNm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2020 at 03:59:16PM +0200, Karol Herbst wrote:
> On Fri, Aug 14, 2020 at 3:57 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > On Thu, Aug 13, 2020 at 07:48:39PM +0200, Karol Herbst wrote:
> > > On Thu, Aug 13, 2020 at 7:45 PM James Jones <jajones@nvidia.com> wrot=
e:
> > > >
> > > > I'll defer to Thierry, but I think that may be by design.  Tegra fo=
rmat
> > > > modifiers were added to get things like this working in the first p=
lace,
> > > > right?  It's not a regression, is it?
> > > >
> > >
> > > That would be slightly annoying as this would mean by design it's
> > > broken by default :/ Also, we have no Xorg release supporting
> > > modifiers anyway and it does seem to work with X 1.20.8 (which doesn't
> > > enable modifier support). And I talked with Jonas (working on mutter)
> > > about it and there were no plans to turn on modifier support by
> > > default at this point.
> >
> > I thought you said earlier that 1.20.8 didn't work and was hitting the
> > assertion?
> >
>=20
> uhm, I forgot to mention that it works with the patch I wrote:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6300

Okay, good to know. Like I said in another subthread, I think we need to
make sure that this doesn't break other use-cases. I vaguely recall that
there was one specific configuration that broke without that and I think
it was when glamor was disabled because that caused X to allocate
buffers without modifiers set. Let me try if I can reproduce such a
build somehow and check if that fails again with the revert.

Thierry

--3yNHWXBV/QO9xKNm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl82m28ACgkQ3SOs138+
s6GfEw/+J+9M4EQd1SyJezaYvfZrx9TD/SdjN9icykJKLtqTAadPKW8UlZkJNlfL
YUKJKSY7GQn6JDwgq3kZkvCw/Vo6PWGhhflePo+RZKkCLsr28WyaJOrCdtIvvgL8
ECHaBNFbwAuj96d9J7rjzT5G77jbucBIhkC+iRkvmAOWr3EOvPlWPpsPe+8gWXw6
AqqS/mpyB/uqE4ggTZBp3pbFgW3Ozx7mVljMkDBmo9BTEpRe8fRdeiaXaFr/cW4i
8+ss0wlcxL1hjvsJAo+gYdQ5TAVqyQK2HwDtbqyBreja9wlACpLtU7w3O+KaqJXa
4iDIF92rQMNwebZxVWrETPReXLzQv5cK0262Q2X/yMdFPTd3WrRmQwZqJEMM5S4H
7m8GhpLFRLex9PDt7zb/OSvpyG2Zg1ZvJP2y3469lGYyyUJ988011lg7+5Y3zsNl
A3mRqpirc4IZRqdDKzHl3/QmMdc8Qz/xIO3yJqebjqiRHHe1C+P8p6qy0NkS62iD
/aDRhpc7b3UHcheFi0uSdPY3JInajSIDtJPN3NSOnQwc32pcqtdlHPf5RvQS5IUM
6Dl2nYfXlmJNqc9DMDEgz68OUwyb9FgdrIMY7YEINaNXnwyufxayUNVpnJOeBkNK
KV7W9DhKM5M0jRcIulaRqQ5D5itdKbaaqGRmKxRNOabpwBdBuEw=
=kPXs
-----END PGP SIGNATURE-----

--3yNHWXBV/QO9xKNm--

--===============0545382961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0545382961==--
