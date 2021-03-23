Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E051D345D2F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 12:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAAE6E897;
	Tue, 23 Mar 2021 11:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A29F6E897
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 11:43:02 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id u21so8582082ejo.13
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 04:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VaxC2sCz35SELYarA1nVbhlcYnmw1I0wgdU0rKr1+Bo=;
 b=SZFCvTjocNToYKrMlzves30KQn/4ugHEhypte9Wgnpc6Mz4M5KGTAgqXZQ5IopHSu5
 1X53U4E1w5+v579M4QVD6+pjhRINaY7y4CZ0kABEUFMIpXd+P/HP0WL6I3wFtQVRldXB
 X8zrp1cFaivGxRMP97zDorEi6B79B+ezgmH15bTn8XqgsUIVE9hEW3UWxcHEpFC9caVH
 AnWbst59tYUVWgxzyUGDT+tUYSYiZOWOWPgD9+h0AAKBDTml3qi2kzZhRKonM7A3iKFe
 +vdlDqPUYxGOmlixkidL8aNWixVeyecJsUynf9ALcp4WJzw2fPJpoEn4LJG9uGr7cPor
 0FgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VaxC2sCz35SELYarA1nVbhlcYnmw1I0wgdU0rKr1+Bo=;
 b=XyKl2C+Qph1XIXs6NyRD1nKSQTwyCvcwcXygiApOq33ulOekDhcp8qvqSN+X4sBlp2
 fDKpM2mXY4TZbSUV18EhzYPxqGU075CvlfO3ShZpBNZIEUGkrCH/w6NVQsRu/M+sdhAw
 ILebetDdU36sJ8qK9FrW/9p6OB+sdiXXzvYuJv2W+jjg2ToSdfR9Gn5v20X8i1vT8JR3
 dGccwnPgTFAAlwe0Uy+TR78CSCYyEpma1R5JafNJTkZVLivnXZ2ruVDmSZUbxRm8uH0x
 wD99Lq1XK9R1MTYxl/dKFc8cmg8VJCDY/WEjdANNCxGH9JsMtLDFwG0j8W0NKB8PporD
 tYTQ==
X-Gm-Message-State: AOAM532nj8MQ2mHQjFm9m31UKFhDwSjWK4a/53t0W3aOqWbWr4zJlnVh
 lsPUj9GIu3GVzLXyuhjIftc=
X-Google-Smtp-Source: ABdhPJxYie+1JqR5XcEK9u9R0ru43ikw86kGloCOE3hKdl6HvWD/1yB2QptgTwB1DLNpxZcVtKWelw==
X-Received: by 2002:a17:906:151a:: with SMTP id
 b26mr4526305ejd.492.1616499780582; 
 Tue, 23 Mar 2021 04:43:00 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id u15sm12959386eds.6.2021.03.23.04.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 04:42:55 -0700 (PDT)
Date: Tue, 23 Mar 2021 12:43:15 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v5 07/21] gpu: host1x: Introduce UAPI header
Message-ID: <YFnUU0gZE0zVMevp@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-8-mperttunen@nvidia.com>
 <YFnIef+dDuqLv5Ek@orome.fritz.box>
 <47840607-8e7c-cc02-bf9b-e001c91f7354@kapsi.fi>
MIME-Version: 1.0
In-Reply-To: <47840607-8e7c-cc02-bf9b-e001c91f7354@kapsi.fi>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: multipart/mixed; boundary="===============1119001023=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1119001023==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mQZPLCGLWiRYvdYR"
Content-Disposition: inline


--mQZPLCGLWiRYvdYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 01:12:36PM +0200, Mikko Perttunen wrote:
> On 3/23/21 12:52 PM, Thierry Reding wrote:
> > On Mon, Jan 11, 2021 at 03:00:05PM +0200, Mikko Perttunen wrote:
[...]
> > > +struct host1x_fence_extract_fence {
> > > +	__u32 id;
> > > +	__u32 threshold;
> > > +};
> > > +
> > > +struct host1x_fence_extract {
> > > +	/**
> > > +	 * @fence_fd: [in]
> > > +	 *
> > > +	 * sync_file file descriptor
> > > +	 */
> > > +	__s32 fence_fd;
> > > +
> > > +	/**
> > > +	 * @num_fences: [in,out]
> > > +	 *
> > > +	 * In: size of the `fences_ptr` array counted in elements.
> > > +	 * Out: required size of the `fences_ptr` array counted in elements.
> > > +	 */
> > > +	__u32 num_fences;
> > > +
> > > +	/**
> > > +	 * @fences_ptr: [in]
> > > +	 *
> > > +	 * Pointer to array of `struct host1x_fence_extract_fence`.
> > > +	 */
> > > +	__u64 fences_ptr;
> > > +
> > > +	__u32 reserved[2];
> > > +};
> >=20
> > For the others it's pretty clear to me what the purpose is, but I'm at a
> > complete loss with this one. What's the use-case for this?
>=20
> This is needed to process incoming prefences for userspace-programmed
> engines -- mainly, the GPU with usermode submit enabled.

I'm not sure what GPU usermode submit is. The name would imply that it's
somehow a mechanism to submit work to the GPU without getting the kernel
involved at all. That's something we'd have to clarify with the Nouveau
team to see if it's something they'd consider implementing, or implement
it ourselves.

Currently there's no interoperation at the syncpoint level between
Nouveau and Tegra DRM, so Nouveau on Tegra doesn't use any syncpoints at
all and hence there's currently no use at all for this kind of API.

> To align with other upstream code, I've been thinking of removing this wh=
ole
> UAPI; moving the syncpoint allocation part to the DRM UAPI, and dropping =
the
> sync_file stuff altogether (if we have support for job submission outputt=
ing
> syncobjs, those could still be converted into sync_files). This doesn't
> support usecases like GPU usermode submit, so for downstream we'll have to
> add it back in, though. Would like to hear your opinion on it as well.

That certainly sounds like a much easier sell because we have use-cases
for all of that. Along with your patches for NVDEC, the existing
userspace for VIC and your work-in-progress NVDEC userspace, this should
cover all the requirements.

Long story short, I think we have some ground to cover before we can
start thinking about how to do GPU usermode submits in an upstream
stack. As such we have no clear idea of what this is going to look like
in the end, or if it's going to be supported at all, so I think it'd be
best to move forward with your alternate proposal and move the syncpoint
functionality into Tegra DRM so that it can be used for VIC, NVDEC and
potentially other engines. If we ever get to the point of having to
support GPU usermode submit, we can take another look at how best to
support it.

Thierry

--mQZPLCGLWiRYvdYR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZ1FEACgkQ3SOs138+
s6FF9w/7BCBU2eODWHNrSVuxMU5iRLCDhOz+GSdLuhUD/oBZyRQksOk9+RFNEdJw
mHcPLcIjgcJfsgOTwYNneLCLCCoeuMd7S4U16lzNFojXYjmPw6kPTG2oRX/TzDrJ
3mrA2F1hmjlgCLbeq+hEffaCgo731OM/hzBE+EAPjTv9ch77zjUehw0BV6iQ8tGy
fbnDVmQsQeBPVdnZkx0s+wSM839+B2qPNAtjb8kV5DF2+tbb1DXhtNKzanABlX6f
AFlasqj8EdcNjPvC2j/W0g7BMh8haIUCzeSShdXCOGiEHg2V36eKfkuc+UOv7JgQ
zknqZOkGKcxYzaGQA7w60DYlSjke8HPKDid2XGU2+O+Yh7rKR2sb6fFpWi/qh7VC
eRZK4p8iToVAweGrZj2xSuOjQZ7kFAsYDROEHhaOygafQRl8z7nJ2H8c9fGKLRHH
m7+gvPngNCn4hl0dFz5/AQW+tMPAB8wfHsb1fbTeFmf8VpluoEK+lTuW9WIvXeN2
NAn0EZFrW8ZizedktTlT/EbshsiwACjic/m+6XQgVsH/f+C5EvLjuXgDwegCZucH
t7rQSYnXt9jyhA2JdE3kjskJAoriDJ3EcByfnmQiez30/Q/U7DJ3IgxKKrgmulE/
MiYe482KjgT5aX5V+2ueV/qhPk04DPWfCKogfit8/Tt80xx5uh0=
=+6T0
-----END PGP SIGNATURE-----

--mQZPLCGLWiRYvdYR--

--===============1119001023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1119001023==--
