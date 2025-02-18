Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69EFA3A26B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 17:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3AC10E3EC;
	Tue, 18 Feb 2025 16:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="fd5jM5Sh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C445410E3EC;
 Tue, 18 Feb 2025 16:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0NFwsnjBpnxZC9cgEKTiEAOFN/2R241QWbtfjtgSwjs=; b=fd5jM5ShFKOK+ueKyKeRZYFNfR
 Jpg2GN16EQR/RHnjv66RODohEnFmpeQSot0G/e89ON/vJ+O/P7segoX9uTz2vRXLm5XzZlKQbcS0m
 gnARb0l5wURQxdXSaW7AMS2vk3wevDN2rCAwcVM0LqDPOZ9gu7gYbusIyOcg2iRb9e1qUFPRW9JHC
 yxgA71IrYLLmuA9r41gEZOsoe5ZQVyEIYdGFk4fgZYpFKI++JlcplAvf7U1ySchHeS8VqwP8PT/5+
 7czeKFOUyBipqn6ELn9ITEl4aomGvnTmRI+3jusYBeIqmRk75FQgaNfoNehxpRG970obfcW+kVQaK
 hCoGwS4A==;
Received: from [194.136.85.206] (port=37110 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1tkQIk-0002Dt-2X;
 Tue, 18 Feb 2025 18:18:26 +0200
Date: Tue, 18 Feb 2025 18:18:19 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <suraj.kandpal@intel.com>,
 <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Message-ID: <20250218181819.11ca41ab@eldfell>
In-Reply-To: <c423efcb-5ab8-41c2-af0a-621007c6175d@intel.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com>
 <20250217120808.708b9b4d@eldfell>
 <c423efcb-5ab8-41c2-af0a-621007c6175d@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bNl32AbcGK_kp7.E=gVGb23";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

--Sig_/bNl32AbcGK_kp7.E=gVGb23
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Feb 2025 11:13:39 +0530
"Murthy, Arun R" <arun.r.murthy@intel.com> wrote:

> On 17-02-2025 15:38, Pekka Paalanen wrote:
> > Hi Arun,
> >
> > this whole series seems to be missing all the UAPI docs for the DRM
> > ReST files, e.g. drm-kms.rst. The UAPI header doc comments are not a
> > replacement for them, I would assume both are a requirement.
> >
> > Without the ReST docs it is really difficult to see how this new UAPI
> > should be used. =20
> Hi Pekka,
> I also realized later on this. Will add this in my next patchset.
> >
> > On Tue, 28 Jan 2025 21:21:07 +0530
> > Arun R Murthy <arun.r.murthy@intel.com> wrote:
> > =20
> >> Display Histogram is an array of bins and can be generated in many ways
> >> referred to as modes.
> >> Ex: HSV max(RGB), Wighted RGB etc.
> >>
> >> Understanding the histogram data format(Ex: HSV max(RGB))
> >> Histogram is just the pixel count.
> >> For a maximum resolution of 10k (10240 x 4320 =3D 44236800)
> >> 25 bits should be sufficient to represent this along with a buffer of 7
> >> bits(future use) u32 is being considered.
> >> max(RGB) can be 255 i.e 0xFF 8 bit, considering the most significant 5
> >> bits, hence 32 bins.
> >> Below mentioned algorithm illustrates the histogram generation in
> >> hardware.
> >>
> >> hist[32] =3D {0};
> >> for (i =3D 0; i < resolution; i++) {
> >> 	bin =3D max(RGB[i]);
> >> 	bin =3D bin >> 3;	/* consider the most significant bits */
> >> 	hist[bin]++;
> >> }
> >> If the entire image is Red color then max(255,0,0) is 255 so the pixel
> >> count of each pixels will be placed in the last bin. Hence except
> >> hist[31] all other bins will have a value zero.
> >> Generated histogram in this case would be hist[32] =3D {0,0,....442368=
00}
> >>
> >> Description of the structures, properties defined are documented in the
> >> header file include/uapi/drm/drm_mode.h
> >>
> >> v8: Added doc for HDR planes, removed reserved variables (Dmitry)
> >>
> >> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> >> ---
> >>   include/uapi/drm/drm_mode.h | 65 +++++++++++++++++++++++++++++++++++=
++++++++++
> >>   1 file changed, 65 insertions(+)
> >>
> >> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> >> index c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..b8b7b18843ae7224263a9c=
61b20ac6cbf5df69e9 100644
> >> --- a/include/uapi/drm/drm_mode.h
> >> +++ b/include/uapi/drm/drm_mode.h
> >> @@ -1355,6 +1355,71 @@ struct drm_mode_closefb {
> >>   	__u32 pad;
> >>   };
> >>  =20
> >> +/**
> >> + * enum drm_mode_histogram
> >> + *
> >> + * @DRM_MODE_HISTOGRAM_HSV_MAX_RGB:
> >> + * Maximum resolution at present 10k, 10240x4320 =3D 44236800
> >> + * can be denoted in 25bits. With an additional 7 bits in buffer each=
 bin
> >> + * can be a u32 value.
> >> + * For SDL, Maximum value of max(RGB) is 255, so max 255 bins. =20
> > I assume s/SDL/SDR/. =20
> Yes, sorry TYPO
> >
> > This assumption seems false. SDR can be also 10-bit and probably even
> > more. =20
> Yes but in practice majority of them being 8-bit. So have considered=20
> 8-bit for illustration purpose only.
> The design itself should accommodate 10-bit as well.

Hi Arun,

if these are just examples, then there is no need to mention SDR or
HDR. You can say that if "thing" is 8-bit, then there are 256 possible
values, and we could have 256 bins or we could have just 32 bins.

But what is "thing"? Let's see below.

> >> + * If the most significant 5 bits are considered, then bins =3D 2^5
> >> + * will be 32 bins.
> >> + * For HDR, maximum value of max(RGB) is 65535, so max 65535 bins. =20
> > Does this mean that the histogram is computed on the pixel values
> > emitted to the cable? What if the cable format is YUV? =20
> Yes, again the illustration over here is max(RGB) used for histogram=20
> generation.
> If YUV is used or weighted RGB is used for histogram generation then the=
=20
> mode will have to change and accordingly the data for that mode.

Do you mean that the HDMI or DisplayPort signalling mode (YUV vs. RGB?
sub-sampling? bit-depth?) affects which histogram modes can be used?

Currently userspace cannot know or control the signalling mode. How
would userspace know which histogram modes are possible?

You should also define at which point of the pixel pipeline the
histogram is recorded. Is it before, say, CRTC DEGAMMA processing? Is
it after signal encoding to the 6/8/10/12/14/16-bit RGB or YUV format?
Before or after YUV sub-sampling? Limited or full range?

> >> + * For illustration consider a full RED image of 10k resolution consi=
dering all
> >> + * 8 bits histogram would look like hist[255] =3D {0,0,....44236800} =
with SDR
> >> + * plane similarly with HDR the same would look like hist[65535] =3D
> >> + * {0,0,0,....44236800} =20
> > This SDR vs. HDR is a false dichotomy. I presume the meaningful
> > difference is bits-per-channel, not the dynamic range.
> >
> > It would be good to have the pseudocode snippet here instead of the
> > commit message. The commit message should not contain any UAPI notes
> > that are not in the UAPI docs. OTOH, repeating UAPI docs in the commit
> > message is probably not very useful, as the more interesting questions
> > are why this exists and what it can be used for. =20
> I have the pseudocode in the cover letter of this patchset.

The cover letter won't end up in kernel documentation. It should be in
the documentation since it is a very explicit and good way to document
what the histogram recorder does.

> >> + */
> >> +enum drm_mode_histogram {
> >> +	DRM_MODE_HISTOGRAM_HSV_MAX_RGB =3D 0x01, =20
> > What does the HSV stand for?
> >
> > When talking about pixel values, my first impression is
> > hue-saturation-value. But there are no hue-saturation-value
> > computations at all? =20
> The computation will have to be done by the user in the library.

Why does the UAPI token have "HSV" in its name?

There is nothing related to hue, saturation or value here. It's just
max(R, G, B).

> >> +};
> >> +
> >> +/**
> >> + * struct drm_histogram_caps
> >> + *
> >> + * @histogram_mode: histogram generation modes, defined in the
> >> + *		    enum drm_mode_histogram
> >> + * @bins_count: number of bins for a chosen histogram mode. For illus=
tration
> >> + *		refer the above defined histogram mode.
> >> + */
> >> +struct drm_histogram_caps {
> >> +	__u32 histogram_mode;
> >> +	__u32 bins_count;
> >> +}; =20
> > Patch 3 says:
> >
> > + * Property HISTOGRAM_CAPS is a blob pointing to the struct drm_histog=
ram_caps
> > + * Description of the structure is in include/uapi/drm/drm_mode.h
> >
> > This is a read-only property, right?
> >
> > The blob contains one struct drm_histogram_caps. What if more than one
> > mode is supported? =20
> Multiple modes can be ORed. User will have to choose one of them=20
> depending on the algorithm that he is developing/using.

Oh! That did not occur to me. This needs documentation.

Do all modes use the same bin count?

> > If the bin count depends on the bits-per-channel of something which
> > depends on set video mode or other things, how does updating work?
> > What if userspace uses a stale count? How does userspace ensure it uses
> > the current count? =20
> The bin count depends on the hardware design. Hence this bin count will=20
> be share to the user via the histogram capability.

If the bin counts depend on hardware only, then the SDR/HDR examples
are misleading. They seem to imply a connection between bit depth and
bin count. Instead, you can just say that the bin count is dictated by
the hardware design.

I wonder if that is a future-proof assumption. I could easily expect
that different histogram modes would use different bin counts, or
produce multiple histograms (one per channel), or even 3D histograms.
One also wouldn't want to use more bins than the signal has possible
values.

Just pondering. It's perilous to try to make UAPI generic if there is
only one vendor or piece of hardware.

> >> +
> >> +/**
> >> + * struct drm_histogram_config
> >> + *
> >> + * @hist_mode_data: address to the histogram mode specific data if an=
y =20
> > Do I understand correctly that the KMS blob will contain a userspace
> > virtual memory address (a user pointer)? How does that work? What are
> > the lifetime requirements for that memory?
> >
> > I do not remember any precedent of this, and I suspect it's not a good
> > design. I believe all the data should be contained in the blobs, e.g.
> > how IN_FORMATS does it. I'm not sure what would be the best UAPI here
> > for returning histogram data to userspace, but at least all the data
> > sent to the kernel should be contained in the blob itself since it
> > seems to be quite small. Variable length is ok for blobs. =20
> This point has actually opened up discussion on the design. Sima has=20
> infact commented the same with multiple options and which among them=20
> buits best. Lets take this discussion on that thread.

Indeed, I don't know much about that topic.

> >> + * @nr_hist_mode_data: number of elements pointed by the address in
> >> + *		       hist_mode_data
> >> + * @hist_mode: histogram mode(HSV max(RGB), RGB, LUMA etc)
> >> + * @enable: flag to enable/disable histogram
> >> + */
> >> +struct drm_histogram_config {
> >> +	__u64 hist_mode_data;
> >> +	__u32 nr_hist_mode_data;
> >> +	enum drm_mode_histogram hist_mode;
> >> +	bool enable; =20
> > Don't enum and bool have non-fixed sizes? Hence inappropriate as UABI,
> > if architecture, build options, or the contents of the enum change the
> > ABI.
> > =20
> >> +};
> >> +
> >> +/**
> >> + * struct drm_histogram
> >> + *
> >> + * @config: histogram configuration data pointed by struct drm_histog=
ram_config =20
> > s/pointed by/defined by/ I presume? That much is obvious from the field
> > type. What does it mean? Why is struct drm_histogram_config a separate
> > struct? =20
> This is totally a separate property for enabling histogram. When=20
> enabling histogram if there are multiple modes of histogram generation=20
> supported by the hardware which among them will be used here and the=20
> data for that mode if required(For Ex: weights for the RGB in case of=20
> weighted RGB) would have to be sent from user and this struct=20
> drm_histogram_config holds those elements.

Ah, I missed that there is a KMS property holding only a config.

> >> + * @data_ptr: pointer to the array of histogram.
> >> + *	      Histogram is an array of bins. Data format for each bin depe=
nds
> >> + *	      on the histogram mode. Refer to the above histogram modes for
> >> + *	      more information. =20
> > Another userspace virtual address stored in a KMS blob?
> > =20
> >> + * @nr_elements: number of bins in the histogram.
> >> + */
> >> +struct drm_histogram {
> >> +	struct drm_histogram_config config;
> >> +	__u64 data_ptr;
> >> +	__u32 nr_elements;
> >> +};
> >> +
> >>   #if defined(__cplusplus)
> >>   }
> >>   #endif
> >> =20

Thanks,
pq

--Sig_/bNl32AbcGK_kp7.E=gVGb23
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAme0sssACgkQI1/ltBGq
qqd4Pg/8CeLxgsIl31QDhgX6IrKLiQE31fxc0DgE0Pvw5Nx0VvikX/tYoHKrlq/O
DL3VSkqcxj8QqDM0h8M61KrYrZ3pb3BN4haZ9MS5k845lNjnFF+ntFg8zkxzCZ9G
HILuqc3wiZiWsdLfzztJi5lEKQy/i7RtcY2WDIIgeb/Z0y1E7B+FILvcYdCrXvN8
faLrLpu2DH5ZXlpGwFpaWHwv+SxylJH588FDUDKLTnMd1qJjSqoDiuCNYw+7Scun
cDiEiOoxz0i7TViI+8+G+Xt8ZD+iPJNB/a5Xx0ULDN/s5IkrOwzM94X0PSdyNe8m
ohkGcY1EdP6UCDsE7j7KGFdbxKh3k52QVyd2SKNAVtzQHSQ2OMxFoJ3yEyV15t2n
W8PqCmpe+7sfwvJwIpi7V/Gr6wJOfeoplbgTXpeEdCtBIGTC6LfQt3gT66+YwVWq
3kuRN8+kMbQAEeBYIoE0QGyHAr7a8WW/JPEUo0wpXi4FNR+tuC34+A+VFAX6LXbQ
LH/429btKQ1XhJaCdpFcnwtW5CLKNaMuk4i3ENab/rm0ACqV6V1nie9Br+DWCXas
YlWLbsMWizjy+To5v9BUv6b93VmVimeg8PHO20+I/bkhQcSpSae1cJKpRG0P3xk7
monXSmJ4ZtONwkO8HbLWIvNa5cewWBl1TkjScJZDAAAz5/fR7t0=
=MRNm
-----END PGP SIGNATURE-----

--Sig_/bNl32AbcGK_kp7.E=gVGb23--
