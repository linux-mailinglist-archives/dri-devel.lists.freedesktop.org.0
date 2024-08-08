Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACE794B85B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 09:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD65810E686;
	Thu,  8 Aug 2024 07:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xr2QwR/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AE110E686
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 07:58:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A3C63614FA;
 Thu,  8 Aug 2024 07:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E30C32782;
 Thu,  8 Aug 2024 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723103935;
 bh=lBgKsSZMNn5ItIypje4300VtOpFDmA6vuT10xWV/5tg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xr2QwR/4R0+Yb+9pUu6BgnmvD4j3cPKIXj9murfquFun6YQ/CtU3vzU8MbgPfxoVB
 xkYuiK/L381eurFZAGr+8yLDvjaR3DzrA+JEA1NP4Vt+8DfpQV63+glF1dNVLIQsq9
 6RBkYf4cl5QgGfcCJ1oif1ZReVXjPbf9VLx/sL5k79gAC60zyJMW6wlzXP12dzF2Rc
 p4bKCzhJtNliCTOKjwmeTyFJU0Gexb1/mRb2uw8ieff4BFHRFqqAiCcznbtnOjYbgL
 JV6WcSTcuur9WiLhmc6LF8JIVUwLAzh7TtU9G4P0oFwufwGX278D7l8mKJw9TUCRKf
 UXtdzQYOEKN6g==
Date: Thu, 8 Aug 2024 09:58:49 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, 
 alexei.starovoitov@gmail.com, audit@vger.kernel.org, bpf@vger.kernel.org, 
 catalin.marinas@arm.com, dri-devel@lists.freedesktop.org, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
 penguin-kernel@i-love.sakura.ne.jp, 
 rostedt@goodmis.org, selinux@vger.kernel.org, serge@hallyn.com
Subject: Re: [PATCH v5 0/9] Improve the copy of task comm
Message-ID: <mywl5fk4ob4c4xekplom3ysiyo57h2iqirbiza6wdka3kdoa7q@exrkx5uwn2yc>
References: <2jxak5v6dfxlpbxhpm3ey7oup4g2lnr3ueurfbosf5wdo65dk4@srb3hsk72zwq>
 <CALOAHbBKzrvibUbj-1W7Z79AZsvOpMeG--EZ0pf2k0iyuPa1_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qwav3xltx7orscp7"
Content-Disposition: inline
In-Reply-To: <CALOAHbBKzrvibUbj-1W7Z79AZsvOpMeG--EZ0pf2k0iyuPa1_w@mail.gmail.com>
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


--qwav3xltx7orscp7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, 
	alexei.starovoitov@gmail.com, audit@vger.kernel.org, bpf@vger.kernel.org, 
	catalin.marinas@arm.com, dri-devel@lists.freedesktop.org, ebiederm@xmission.com, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp, 
	rostedt@goodmis.org, selinux@vger.kernel.org, serge@hallyn.com
Subject: Re: [PATCH v5 0/9] Improve the copy of task comm
References: <2jxak5v6dfxlpbxhpm3ey7oup4g2lnr3ueurfbosf5wdo65dk4@srb3hsk72zwq>
 <CALOAHbBKzrvibUbj-1W7Z79AZsvOpMeG--EZ0pf2k0iyuPa1_w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALOAHbBKzrvibUbj-1W7Z79AZsvOpMeG--EZ0pf2k0iyuPa1_w@mail.gmail.com>

Hi Yafang,

On Thu, Aug 08, 2024 at 10:49:17AM GMT, Yafang Shao wrote:
> > > Now, it might be a good idea to also verify that 'buf' is an actual
> > > array, and that this code doesn't do some silly "sizeof(ptr)" thing.
> >
> > I decided to use NITEMS() instead of sizeof() for that reason.
> > (NITEMS() is just our name for ARRAY_SIZE().)
> >
> >         $ grepc -h NITEMS .
> >         #define NITEMS(a)            (SIZEOF_ARRAY((a)) / sizeof((a)[0]=
))
> >
> > > We do have a helper for that, so we could do something like
> > >
> > >    #define get_task_comm(buf, tsk) \
> > >         strscpy_pad(buf, __must_be_array(buf)+sizeof(buf), (tsk)->com=
m)
> >
> > We have SIZEOF_ARRAY() for when you want the size of an array:
> >
> >         $ grepc -h SIZEOF_ARRAY .
> >         #define SIZEOF_ARRAY(a)      (sizeof(a) + must_be_array(a))
>=20
> There is already a similar macro in Linux:
>=20
>   /**
>    * ARRAY_SIZE - get the number of elements in array @arr
>    * @arr: array to be sized
>    */
>   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) +
> __must_be_array(arr))

This is actually the same as our NITEMS(), not SIZEOF_ARRAY().

> will use it instead of the sizeof().

But yeah, indeed I think you should use ARRAY_SIZE() in
get_task_comm().  :)

>=20
> Good point.
> I will avoid using the _pad().

Nice.  :)

Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es/>

--qwav3xltx7orscp7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAma0erkACgkQnowa+77/
2zI/JRAAoVxukBH7uw9FKXnQL5urmTajhZ9amPoHARet43Vg/lzzBNf6fKGg+8Sw
Ia/9Wj4w2X8FhIeCkj6N9ZS8SaIRgXExdZQxfOdfNWRXk8i+UVm0HzH3maGvLLi7
uSkYvr0HKnB/bk8tjJWDfvEEwNFS0f6rTlz3gcK2AggiDr9N1ZZBKS1/6qXDTgps
Z+83Dzqy6UmjYa43Rg9MLoS5hux8uJyepFVgJQ3YzNoLlT4RCnXz99pTQffEGf/u
Z1pH8dsthc5ObspRQoWHzKVRv2LmatVaitOfoxEnqw7nqcKkwV6hfKYwArb1PR5x
46De/I8Q2SFzcCT+MjcCHQrlYo4ae7YVGpk2dpIYxkFnH7WCR3UeMamLrsPAkydf
bAisGt0aUSSnXv6Nx+AyJzqJVYwfXY87aUMBxU6M6tiD1WaBCxMkgEyCqGRI4T4M
SxLDjWDUNMP3dzrilzfy+7Q5mBSoDP0fyVZD9PvQyj2I3OQuaSco8SiKocb6YPyv
NlIPR7vs2K7n+Cmbv1FtrW2XTDnYsHpUYs1iI81FGoqQmK0I3JM+M1PSFs1m/VLB
UMkeE70pWxJlewI3USP3BVhAVMn9LGP3k0r6eRLlea0y8Y8VRx77S8+D7Im1RNqs
ybegRL10BeXA+FLXX9xvCPi4ClFH2e/r0dFUpNTzg9bDXJG5sr8=
=hUNj
-----END PGP SIGNATURE-----

--qwav3xltx7orscp7--
