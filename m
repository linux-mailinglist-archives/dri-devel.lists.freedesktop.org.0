Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0173843C4F3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 10:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCEA6E4BB;
	Wed, 27 Oct 2021 08:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48CC6E4AD;
 Wed, 27 Oct 2021 08:18:51 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id l2so3318334lji.6;
 Wed, 27 Oct 2021 01:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=hi8jLqtpe/ReivTysj4Z8nhnZy37mzWVyFH1IP2DT/g=;
 b=B3Zu1k9KF5b0IuReVWJc8nAK2ik7Gldp83Mc3vSb/rDPtQYlKeNH7gUzU6+qJIbF5X
 JwPfprTpUlxP8U22GlYNN9mC6p9fYIh8699BLeKt4emxYdcnkFrn5Zp5wV9F06N/XEka
 UvBNHZAGufqZ8Kqsc6QhLEZEouUrMpJb6sqhjy33eJAT8f9qzu8brGPowSnAmsNX+aEw
 mKH6tUpGSdW0QHyDNirjQv9p7RWy7Nf+2roUsYNqkgDBMsEpBZ3hzsos7ORGn+AedShR
 1LV2Ba5jqt8qjD65TGzOLWqbQTCGli1vcKjqn3JwbFbGAyRAuZmXsg4WuuL2ePpy52jg
 3ZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=hi8jLqtpe/ReivTysj4Z8nhnZy37mzWVyFH1IP2DT/g=;
 b=qkwXiAKbc2BGKYmSYaZ+yMTeqTeIqgYJbgBwTHWhFC9fYGtLDDdoisaablC0DjP2JW
 DDcwSZAoDuCSKs77MCikJm5WZXv6ueF6gyq+OeulnETY9keO4kxEyAXhFPq4+yum+OWp
 bor63kuNAS0XkbzRBzSw7m1GI2AoRNASffDD2mtZGF5/9dHXAUbbpRZLyUBvqOtEgw6y
 MYK4YVROLrAwZojApwpJe1KKjOglHkzRl22mnChYz2GoV3XnMCV0Uy4rbudTXdR9EOJD
 iVSwpvufN0wTVeiCY26yv6zCP9pNC0QWmbLbH9ncUeiW3E4bcXWwWugINIWKaCp0oDWa
 TKWw==
X-Gm-Message-State: AOAM531KpiBejpvaWPCFt9KyYyewcDl1OTd+AUw4k0+I1wdrujhFjWtI
 ajQcmW4Oq7H9Ygr7RM5y4og=
X-Google-Smtp-Source: ABdhPJyJ6deoWt2lomFtMDTcXYm6kL8N4Xw8SGl/VrkOX1Y5JAcfT7LZ6TDciIUzcPCIIRVwlwY1iw==
X-Received: by 2002:a2e:b004:: with SMTP id y4mr31884096ljk.298.1635322729717; 
 Wed, 27 Oct 2021 01:18:49 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id bp31sm52809lfb.124.2021.10.27.01.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 01:18:49 -0700 (PDT)
Date: Wed, 27 Oct 2021 11:18:46 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: "Shankar, Uma" <uma.shankar@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>,
 "Shashank.Sharma@amd.com" <Shashank.Sharma@amd.com>, "Cyr, Aric"
 <Aric.Cyr@amd.com>, Vitaly Prosyak <Vitaly.Prosyak@amd.com>
Subject: Re: [RFC v2 00/22] Add Support for Plane Color Lut and CSC features
Message-ID: <20211027111846.600efd79@eldfell>
In-Reply-To: <24c8bf32-2eea-8f32-33b1-0628701c22bd@amd.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20211012145529.687dfdee@eldfell>
 <1260585655bd41ebb734056dd1f42740@intel.com>
 <24c8bf32-2eea-8f32-33b1-0628701c22bd@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fNURPmVzbF4n.recML=z/.B";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/fNURPmVzbF4n.recML=z/.B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Oct 2021 11:02:31 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2021-10-12 17:01, Shankar, Uma wrote:
> >=20
> >  =20
> >> -----Original Message-----
> >> From: Pekka Paalanen <ppaalanen@gmail.com>
> >> Sent: Tuesday, October 12, 2021 5:25 PM
> >> To: Shankar, Uma <uma.shankar@intel.com>
> >> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> >> harry.wentland@amd.com; ville.syrjala@linux.intel.com; brian.starkey@a=
rm.com;
> >> sebastian@sebastianwick.net; Shashank.Sharma@amd.com
> >> Subject: Re: [RFC v2 00/22] Add Support for Plane Color Lut and CSC fe=
atures
> >>
> >> On Tue,  7 Sep 2021 03:08:42 +0530
> >> Uma Shankar <uma.shankar@intel.com> wrote:
> >> =20
> >>> This is how a typical display color hardware pipeline looks like:
> >>>  +-------------------------------------------+
> >>>  |                RAM                        |
> >>>  |  +------+    +---------+    +---------+   |
> >>>  |  | FB 1 |    |  FB 2   |    | FB N    |   |
> >>>  |  +------+    +---------+    +---------+   |
> >>>  +-------------------------------------------+
> >>>        |  Plane Color Hardware Block |
> >>> +--------------------------------------------+
> >>>  | +---v-----+   +---v-------+   +---v------+ |
> >>>  | | Plane A |   | Plane B   |   | Plane N  | |
> >>>  | | DeGamma |   | Degamma   |   | Degamma  | |
> >>>  | +---+-----+   +---+-------+   +---+------+ |
> >>>  |     |             |               |        |
> >>>  | +---v-----+   +---v-------+   +---v------+ |
> >>>  | |Plane A  |   | Plane B   |   | Plane N  | |
> >>>  | |CSC/CTM  |   | CSC/CTM   |   | CSC/CTM  | |
> >>>  | +---+-----+   +----+------+   +----+-----+ |
> >>>  |     |              |               |       |
> >>>  | +---v-----+   +----v------+   +----v-----+ |
> >>>  | | Plane A |   | Plane B   |   | Plane N  | |
> >>>  | | Gamma   |   | Gamma     |   | Gamma    | |
> >>>  | +---+-----+   +----+------+   +----+-----+ |
> >>>  |     |              |               |       |
> >>>  +--------------------------------------------+
> >>> +------v--------------v---------------v-------|
> >>> ||                                           ||
> >>> ||           Pipe Blender                    ||
> >>> +--------------------+------------------------+
> >>> |                    |                        |
> >>> |        +-----------v----------+             |
> >>> |        |  Pipe DeGamma        |             |
> >>> |        |                      |             |
> >>> |        +-----------+----------+             |
> >>> |                    |            Pipe Color  |
> >>> |        +-----------v----------+ Hardware    |
> >>> |        |  Pipe CSC/CTM        |             |
> >>> |        |                      |             |
> >>> |        +-----------+----------+             |
> >>> |                    |                        |
> >>> |        +-----------v----------+             |
> >>> |        |  Pipe Gamma          |             |
> >>> |        |                      |             |
> >>> |        +-----------+----------+             |
> >>> |                    |                        |
> >>> +---------------------------------------------+
> >>>                      |
> >>>                      v
> >>>                Pipe Output
> >>>
> >>> This patch series adds properties for plane color features. It adds
> >>> properties for degamma used to linearize data and CSC used for gamut
> >>> conversion. It also includes Gamma support used to again non-linearize
> >>> data as per panel supported color space. These can be utilize by user
> >>> space to convert planes from one format to another, one color space to
> >>> another etc.
> >>>
> >>> Userspace can take smart blending decisions and utilize these hardware
> >>> supported plane color features to get accurate color profile. The same
> >>> can help in consistent color quality from source to panel taking
> >>> advantage of advanced color features in hardware.
> >>>
> >>> These patches add the property interfaces and enable helper functions.
> >>> This series adds Intel's XE_LPD hw specific plane gamma feature. We
> >>> can build up and add other platform/hardware specific implementation
> >>> on top of this series.
> >>>
> >>> Credits: Special mention and credits to Ville Syrjala for coming up
> >>> with a design for this feature and inputs. This series is based on his
> >>> original design and idea.
> >>>
> >>> Note: Userspace support for this new UAPI will be done on Chrome in
> >>> alignment with weston and general opensource community.
> >>> Discussion ongoing with Harry Wentland, Pekka and community on color
> >>> pipeline and UAPI design. Harry's RFC below: =20
> >>> https://patchwork.freedesktop.org/series/89506/>>>> We need to conver=
ge on a common UAPI interface which caters to all the =20
> >>> modern color hardware pipelines.
> >>>
> >>> ToDo: State readout for this feature will be added next.
> >>>
> >>> v2: Added UAPI description and added change in the rfc section of
> >>> kernel Documentation folder =20
> >>
> >> Hi,
> >>
> >> thank you for this. I do believe the KMS UAPI should expose what hardw=
are can do
> >> (prescribed operations) rather than how they would be often used (to r=
ealize a
> >> conversion from one space description to another). This proposal fits =
quite nicely
> >> with what I have envisioned for Weston. =20
> >  =20
>=20
> It's taken me a while but I am starting to agree with the prescriptive ap=
proach to
> expose HW functionality. One thing we'll want to be careful of is to make=
 sure
> this isn't tied to specific HW more than it needs to be. I'll comment in =
other
> places of this patchset to elaborate.
>=20
> What's making me come around, i.e. change from a prescriptive (these are =
the
> input/output/blending spaces/formats) to a descriptive (these are the LUT=
s and
> CTMs) approach?
>=20
> 1) The prescriptive way has no good way of dealing with gamut and tone ma=
pping.
>    To do so we would need explicit OOTFs and CTMs or 3D LUTs anyways.
>=20
> 2) The prescriptive way provides no semblance of guarantee that transforms
>    are equivalent when the compositor uses shaders transforms and composi=
tion
>    vs when the compositor uses KMS transforms and composition.
>=20
> 3) Policy about treatment of surfaces/planes and blending is best left wi=
th
>    the compositor (for the above reasons).

Hi Harry,

I think we might have confusion there about prescriptive vs.
descriptive, but I understand what you mean, and yes, those are my
points too.

> >> I mainly went over the big picture by commenting in detail on the prop=
osal
> >> document, and not looking too carefully at the other documentation or =
UAPI details
> >> at this time. =20
> >=20
> > Thanks Pekka for the feedback.
> >  =20
> >> Unfortunately I was unable to decipher how userspace is supposed to us=
e the
> >> XE_LPD special gamma features. =20
> >=20
> > I will include the details on how userspace should actually get this th=
rough a sample
> > IGT reference, that should help make this clear.
> >  =20
>=20
> It looks like with your current definitions each userspace compositor (We=
ston, kwin,
> mutter, wlroots, Chrome's compositor, Android's compositor, etc.) would n=
eed to learn
> how to program the XE_LPD LUTs as well as AMD LUTs. Would these definitio=
ns change
> in future Intel HW generations? Would this mean all compositors would nee=
d to learn
> again how to program the future LUT format?
>=20
> Other options would be to give userspace a generic LUT with 4k FP16 entri=
es and then
> re-map that to the HW LUT in the kernel driver.

Do you want to run the optimisation algorithm to map the generic LUT to
hardware specific optimised representation in the kernel driver?
Wouldn't that be too much?

To me this seems like the perfect starting point for a libcamera
equivalent to KMS. Feed the generic LUT to the lib, and get whatever
the hardware-driver-specific KMS UAPI needs. Perhaps even with an error
measure, so that a compositor can evaluate whether the mapping is
accurate enough or if it needs to fall back.

> I might be missing some of the nuances of the XE_LPD LUT but it seems to =
me that the
> main difference between different PWL implementations is the distribution=
 of the
> points used to define the LUT. Maybe a more generic PWL implementation co=
uld have
> a kernel driver report one (or more) PWL point distributions. We could en=
code these
> as enums and pre-defined arrays in a UAPI header. That way the compositor=
 could have
> a single, generic implementation of programming PWL in FP16 and the kerne=
l driver
> would only need to remap the FP16 to the HW-internal format, which is a t=
rivial
> conversion. Using this approach compositors would implement PWL support o=
nce and won't
> have to touch it again in the future. Is there anything that would make t=
his approach
> a bad idea for Intel HW (or other HW)? (Credit for this idea goes to Vita=
ly)

I think that is also a workable solution. If that happens, it seems
likely that a library for that optimisation will appear.

It has just one shortcoming: the compositor has no idea of the
precision as there is no way to get an error measure for how much the
FP16->internal conversion loses precision.

But maybe that is never significant? Or could we have some precision
guarantees otherwise?

I'm thinking of hard-core professional color users who wouldn't
normally trust off-loading to KMS at all, at least not on-demand
off-loading where you are never sure if you are looking at SW or KMS
composition.


Thanks,
pq

--Sig_/fNURPmVzbF4n.recML=z/.B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmF5C2YACgkQI1/ltBGq
qqcLzw/9Eox4qLzSAFfFKRhnDNNjKjgQReLqXLNyypY4t4veg0Is1PorwjeYoqyq
Tz7Pb1ZhOzFiv44/qlQ/Auc57OrvX9MWEhIv9xa++gid1Am2yN7XQfGN+AOgX4OH
9B9W8XaHhJJ8F6DhOREUi7zr67Rp42P9xbK5TIsqDt7ZE8xmbxHmyyxjx4ZCgxL9
fhGxiR5NNFOHNihoIjbJ84QKiHgGwxtZ0C6QOsw/SxgqldZCrxk6UX8CrR9BDIUS
FOectpPIWKc36u1H/2OEHvbCq+wIlOraX2AyVsLWkfVuc5h0Jn2f8v8KiEgzGPTd
RjkhuTZVu/14fqQoRwmavNg312uVj7hqawsv4WJH3dbMHk0FdMMa593gOH/qfosI
tlprk4cjmzGUGcrsbdMjP+qtr/+KNASFYWgwppoYOQ4uH1o8fGHYS1PT/gCOa9jH
WNXzMwLZw5hAcMm1DAmEvE/FQrufcUMB584WjsSOKQOx6nLGsW5DcTJy13J1lxi1
6JHuIQ/1cDUfxOAboRgGP/p7m3GlhNjiBHupbEFfVKnn4cYPATJ6X2C8NgeCqtqG
RoL7Kps1aEdSjmUCEvznRhRWHin9gNCQjWQuybMmHzFRUy4AidhRqp5heHx2HpsD
si49fVBsjjiI7OtrkeVpzYpOFTKXMA44Kg7llJIpxtDNLlCe7/4=
=V2Ch
-----END PGP SIGNATURE-----

--Sig_/fNURPmVzbF4n.recML=z/.B--
