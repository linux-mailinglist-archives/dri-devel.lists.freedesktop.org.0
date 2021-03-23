Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F379B346773
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 19:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BB06E941;
	Tue, 23 Mar 2021 18:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FFC6E941
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 18:21:46 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id r12so28691068ejr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 11:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8rKTrvPrWUe8LXJ4SCmd9G3+IJGFtRH5zECn5Wek8XU=;
 b=EDFj9LyflOSOkBeci+mhSkxFF21IG5JpUq73PlC/dNGeBn5eJbC5PAfqJ7UvCbeQ2a
 keGbb/IWBddeJjOaPsFaw4LHAV8c6G5C69a08THjPqkCslQpNH/v1KbDCz/Cg1Sx24bL
 SYbZDVC3PVwcps8Da7bgm8eFYq2/h+2th4MO/7rvdywQKsRSsCe5zAc3QXCxmcN0gmWm
 ufhvGDj+CNYOo2OSe2COz6QknRdF4lT9UKI2dDtQ1kEW/yO9N6N4mORR7J9TZaZG105g
 4K3jAhN9fX2QNazWotUiEa+/A5IP08GbPBs0N7T+09IlsSZ7gLaGDStAimJUSOH56znd
 tt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8rKTrvPrWUe8LXJ4SCmd9G3+IJGFtRH5zECn5Wek8XU=;
 b=BoVu4RQiquKKbhO5ym2JRmu8R22BR6loNnqkO+JN15gFyElvp3r4QcLob3vbrKiXmo
 N/GgUhrwsmg1J6dp8uSPnw6SXw8taPFboNfDYOPB0jtrzcZpHXKQJAcoG6Vd6kCBTFdo
 S1mq7MSQpSc8hWAhUQuX45xSXiBTzPRsghN8Si/4knefmocYEpiqvo8sSz5H5/GOCceq
 yb0fmMuVGcO7k23SdattVvJQPCDvyMu5MvI6FK8prQvqviWMmxs8QOPUXtwUTe4MwZYL
 egMy8vcxtvLMlYTAF4orRsW3mF5YnE++l6luk5JKiH6bC+8S8jt+Qv9BrKuR7uYq8IxZ
 /Zkw==
X-Gm-Message-State: AOAM530H5QgbU06RehbRdDgrL63801646mOHq+3kgMyJDk6Iz5deFdW7
 QPHdH0MDvelzhnOMfenbKA8=
X-Google-Smtp-Source: ABdhPJz2pxx36cOVGzdCWwH9REXN1Bd/3nPg8BCtqP9MKaIaUOXMesyAcb2CiZdtuRNipSWqjZuuXg==
X-Received: by 2002:a17:906:814b:: with SMTP id
 z11mr6150484ejw.290.1616523705556; 
 Tue, 23 Mar 2021 11:21:45 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id gj26sm11431324ejb.67.2021.03.23.11.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:21:37 -0700 (PDT)
Date: Tue, 23 Mar 2021 19:21:58 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 00/21] Host1x sync point UAPI should not be used for
 tracking DRM jobs
Message-ID: <YFoxxiMGFcSg3kk+@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <2ee12338-bd5a-4b99-f86d-13da0d2a899b@gmail.com>
 <8504c239-d5df-3033-934c-7b3fab52e387@kapsi.fi>
 <YBLtPv/1mGXwtibX@ulmo>
 <1ff922b2-161d-c8b9-7b08-4454ff7329f8@gmail.com>
 <25248139-5487-a15b-8965-1a29a71eacd7@kapsi.fi>
 <6211ee04-ebd6-74d3-cb5b-955b17acff5b@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6211ee04-ebd6-74d3-cb5b-955b17acff5b@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, talho@nvidia.com,
 bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: multipart/mixed; boundary="===============0237451012=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0237451012==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bT23De0RLxIkDAxt"
Content-Disposition: inline


--bT23De0RLxIkDAxt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 27, 2021 at 02:19:39PM +0300, Dmitry Osipenko wrote:
> 03.02.2021 14:18, Mikko Perttunen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >> I'll need more time to think about it.
> >>
> >=20
> > How about something like this:
> >=20
> > Turn the syncpt_incr field back into an array of structs like
> >=20
> > #define DRM_TEGRA_SUBMIT_SYNCPT_INCR_REPLACE_SYNCOBJ=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (1<<0)
> > #define DRM_TEGRA_SUBMIT_SYNCPT_INCR_PATCH_DYNAMIC_SYNCPT=C2=A0=C2=A0=
=C2=A0 (1<<1)
> >=20
> > struct drm_tegra_submit_syncpt_incr {
> > =C2=A0=C2=A0=C2=A0=C2=A0/* can be left as zero if using dynamic syncpt =
*/
> > =C2=A0=C2=A0=C2=A0=C2=A0__u32 syncpt_id;
> > =C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0struct {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 syncobj;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 value;
> > =C2=A0=C2=A0=C2=A0=C2=A0} fence;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0/* patch word as such:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * *word =3D *word | (s=
yncpt_id << shift)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0struct {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 gather_offset_words;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 shift;
> > =C2=A0=C2=A0=C2=A0=C2=A0} patch;
> > };
> >=20
> > So this will work similarly to the buffer reloc system; the kernel
> > driver will allocate a job syncpoint and patch in the syncpoint ID if
> > requested, and allows outputting syncobjs for each increment.
>=20
> I haven't got any great ideas so far, but it feels that will be easier
> and cleaner if we could have separate job paths (and job IOCTLS) based
> on hardware generation since the workloads a too different. The needs of
> a newer h/w are too obscure for me and absence of userspace code,
> firmware sources and full h/w documentation do not help.
>=20
> There still should be quite a lot to share, but things like
> mapping-to-channel and VM sync points are too far away from older h/w,
> IMO. This means that code path before drm-sched and path for job-timeout
> handling should be separate.
>=20
> Maybe later on it will become cleaner that we actually could unify it
> all nicely, but for now it doesn't look like a good idea to me.

Sorry for jumping in rather randomly here and elsewhere, but it's been a
long time since the discussion and I just want to share my thoughts on a
couple of topics in order to hopefully help move this forward somehow.

For UAPI, "unifying it later" doesn't really work. So I think the only
realistic option is to make a best attempt at getting the UABI right so
that it works for all existing use-cases and ideally perhaps even as of
yet unknown use-cases in the future. As with all APIs this means that
there's going to be a need to abstract away some of the hardware details
so that we don't have to deal with too many low-level details in
userspace, because otherwise the UAPI is just going to be a useless
mess.

I think a proposal such as the above to allow both implicit and explicit
syncpoints makes sense. For what it's worth, it's fairly similar to what
we had come up with last time we tried destaging the ABI, although back
at the time I'm not sure we had even considered explicit syncpoint usage
yet. I think where reasonably possible this kind of optional behaviour
is acceptable, but I don't think having two completely separate paths is
going to help in any way. If anything it's just going to make it more
difficult to maintain the code and get it to a usable state in the first
place.

Like I said elsewhere, the programming model for host1x hasn't changed
since Tegra20. It's rather evolved and gained a couple more features,
but that doesn't change anything about how userspace uses it.

Thierry

--bT23De0RLxIkDAxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBaMcQACgkQ3SOs138+
s6FXMg/+OoxiDkzLNCWvfj4075ct69q562Xn3EfEzFu+x7RvJm0G0c+A0nPLk9xc
nQAxU8k8lxVTffvTtdHcdSROD2hX3gzB/o/IQay0bxH1CF2XaPqTWVzabCEO7xV8
5FLFhVz1Xlntk0WVHJmgX0zsdSxvZt8oxlpOiXTYCQzE8MWGnB5Nmt9lOAZn93WU
immLob8p5ku3121pMBufZ5oGcrTDYsR+zzjqntzug9jI0Jw0SAPZbnvQko2ZcH3f
Yfzo/5+RnI84lqy8zfrxRbLt92WJ1kAvkI4OT35GES421P3gp/B/0zSEaxMNNVUM
Ilx1JIRYn8rNaCX+Gg/DWGzHTq3Sj5AeoSPdmDb8HCWUcDlRIOKrWHtj/zK8Sh5X
eQZXBa7QrliiQA8SvjNkmuPjB72vLuevEbkLvlYiE6DzBmza6a5iqFoQdoDhKmjJ
U24CJlQF4ANDA9elkUuFZrUqw2crHSdAsL67jXDXiXGmICNaywzwd3xmEFQiFFsI
9N2UxY88J0uMWxFCq1tUkorcBKGb20X58sY9WPcV5vTUQxnT1ek1QvQHMlbkzaZw
X8bzwk6EA7Bxp9e8tGXnI3pzZjVo6IoB9MWrI6RSrQGv7noODRGkxC33LT6xVXOb
ye0aypnBMjflChz30IFpj7Z4DnA30f4YSwF9aOii4seP3xo2Ww0=
=5OHQ
-----END PGP SIGNATURE-----

--bT23De0RLxIkDAxt--

--===============0237451012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0237451012==--
