Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MrgJV+UeGncrAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:33:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD33592D87
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:33:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D1E10E0CD;
	Tue, 27 Jan 2026 10:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RaCVGb1w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E6210E0CD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 10:33:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 66F61600AA;
 Tue, 27 Jan 2026 10:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA170C116C6;
 Tue, 27 Jan 2026 10:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769509979;
 bh=upyzIdX6sc+F9yKHqn/z6MJzFeFxUfq9aLCsXCMxv4E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RaCVGb1wMOEGpU58u34kxHjibgOqFQeYFGZ1kRvowtT37vPWybnwGOBd+CuNUbUAV
 DhMnTMS66u/V7/1MBu1xh0VkBEOYYbR2QADskSJy7/iweNyPzsQmV2JHf2/tVEdq/f
 6uFRWkpNVa5DKPzIjGlqNf/ZgOcvNXLERc+fcdYuQNUjxAJPyjxi63BbtNHuVlrZBx
 M3q2S4iNbdXVsZgFjux+wRpftz8A1fK5Vg2l2T63jnnyaiw3/zGMPQ4GcIkshAIbLa
 IvsogM3geHENQH8l35EP72wIIgnB/XF/8DWAOu1WfhCMPbnqF7IIT0qU0BADTUp70C
 PPAC/Ip/rppFA==
Date: Tue, 27 Jan 2026 11:32:56 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Aaron Kling <webgeek1234@gmail.com>, Kurt Kiefer <kekiefer@gmail.com>, 
 Jasper Korten <jja2000@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
Message-ID: <aXiSMlP-UKmrFKL7@orome>
References: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
 <CALHNRZ9b98Su9qAqXRSTCStoUPtC_u3+MG0cr4SQ-g3aVJD7LQ@mail.gmail.com>
 <8615742F-EE35-4B37-BA0A-D62FFD5424B4@gmail.com>
 <4318175.BddDVKsqQX@senjougahara>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fue3hpucru44eqpn"
Content-Disposition: inline
In-Reply-To: <4318175.BddDVKsqQX@senjougahara>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[thierry.reding@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mperttunen@nvidia.com,m:webgeek1234@gmail.com,m:kekiefer@gmail.com,m:jja2000@gmail.com,m:thierry.reding@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DD33592D87
X-Rspamd-Action: no action


--fue3hpucru44eqpn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
MIME-Version: 1.0

On Tue, Jan 27, 2026 at 01:12:54PM +0900, Mikko Perttunen wrote:
> On Thursday, January 22, 2026 2:08=E2=80=AFAM Kurt Kiefer wrote:
> >=20
> > > On Dec 8, 2025, at 8:23=E2=80=AFPM, Aaron Kling <webgeek1234@gmail.co=
m> wrote:
> > >=20
> > > On Wed, Nov 5, 2025 at 3:28=E2=80=AFPM Jasper Korten <jja2000@gmail.c=
om> wrote:
> > >>=20
> > >> Hi all,
> > >>=20
> > >> On 11/4/25 19:12, Aaron Kling wrote:
> > >>> On Tue, Nov 4, 2025 at 3:14=E2=80=AFAM Thierry Reding <thierry.redi=
ng@gmail.com> wrote:
> > >>>> On Mon, Nov 03, 2025 at 12:39:57PM -0600, Aaron Kling wrote:
> > >>>>> On Mon, Nov 3, 2025 at 5:54=E2=80=AFAM Thierry Reding <thierry.re=
ding@gmail.com> wrote:
> > >>>>>> On Sat, Nov 01, 2025 at 06:15:17PM -0500, Aaron Kling via B4 Rel=
ay wrote:
> > >>>>>>> From: Aaron Kling <webgeek1234@gmail.com>
> > >>>>>>>=20
> > >>>>>>> Without the cmu, nvdisplay will display colors that are notably=
 darker
> > >>>>>>> than intended. The vendor bootloader and the downstream display=
 driver
> > >>>>>>> enable the cmu and sets a sRGB table. Loading that table here r=
esults in
> > >>>>>>> the intended colors.
> > >>>>>>>=20
> > >>>>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > >>>>>>> ---
> > >>>>>>>  drivers/gpu/drm/tegra/dc.h  |  13 +++
> > >>>>>>>  drivers/gpu/drm/tegra/sor.c | 206 ++++++++++++++++++++++++++++=
++++++++++++++++
> > >>>>>>>  2 files changed, 219 insertions(+)
> > >>>>>> What does "darker than intended" mean? Who defines the intention=
? How do
> > >>>>>> we know what the intention is? What this patch ultimately seems =
to be
> > >>>>>> doing is define sRGB to be the default colorspace. Is that alway=
s the
> > >>>>>> right default choice? What if people want to specify a different
> > >>>>>> colorspace?
> > >>>>> I reported this issue almost a month ago. See kernel lore [0] and
> > >>>>> freedesktop issue [1]. The pictures in the latter show what nvdis=
play
> > >>>>> looks like right now. It's nigh unusably dark. When booted into
> > >>>>> Android with a tv launcher that has a black background, as is def=
ault
> > >>>>> for LineageOS, it is really hard to read anything. Is it correct =
as a
> > >>>>> default? Well, cboot hardcodes this, so... presumably? It would be
> > >>>>> more ideal to expose this and csc to userspace, but I'm not sure =
if
> > >>>>> drm has a standardized interface for that or if tegra would have =
to
> > >>>>> make something vendor specific. I think that would be a separate
> > >>>>> change concept compared to setting this default, though.
> > >>>> The reason I'm asking is because I don't recall ever seeing "broke=
n"
> > >>>> colors like you do. So I suspect that this may also be related to =
what
> > >>>> display is connected, or the mode that we're setting.
> > >> I have tried it on both a MacroSilicon HDMI capture card and an Arzo=
pa
> > >> Z1FC 1080p portable monitor and run into the same darker colors. Both
> > >> have in common that they use HDMI which seems to line up with what A=
aron
> > >> is reporting. I do not have an eDP display to test or another carrier
> > >> board with a different display out to test.
> > >>>> It could perhaps
> > >>>> also be related to what infoframes we're sending and how these are
> > >>>> supported/interpreted by the attached display.
> > >>>>=20
> > >>>> All of that is to say that maybe this looks broken on the particul=
ar
> > >>>> setup that you have but may works fine on other setups. Changing t=
he
> > >>>> default may fix your setup and break others.
> > >>> Do you have a device set up so you can check? Or does the regression
> > >>> test bench have a display that can be forwarded?
> > >>>=20
> > >>> My current setup is a rack of units plugged via hdmi to a kvm which=
 is
> > >>> then plugged to a pikvm. I also observed this issue before I had th=
is
> > >>> setup, plugged directly to a 1080p monitor. I have not checked
> > >>> displayport. I can cycle through a couple other displays without th=
is
> > >>> patch to see if I get any other result. I am fairly certain I have
> > >>> consistently seen this issue since I started trying to work with
> > >>> tegra-drm on kernel 6.1 or maybe even 5.15. I've never seen it work=
 to
> > >>> allow for a bisect.
> > >>>=20
> > >>> I am in contact with one other person with a tx2 devkit, who
> > >>> replicated the issue when I asked. Who plans to reply to this thread
> > >>> with setup info later.
> > >>=20
> > >> For reference, I am said person. I have a Jetson TX2 Devkit that uses
> > >> the P2771 Device Tree. I'm running a Fedora distrokernel with no
> > >> additional patches applied by myself. I have personally noticed the
> > >> issue to at least be present on 6.14.5 and 6.17.4.
> > >>=20
> > >>=20
> > >> I'm currently not at home to take screenshots with and without the
> > >> submitted patch, but will be able to do it tomorrownight or friday.
> > >=20
> > > Any further thoughts from the maintainers on this patch? As far as I
> > > know, this is an issue for all users, at the very least on hdmi.
> > >=20
> > > Aaron
> > >=20
> >=20
> > I can confirm that I have the same issue on a DisplayPort output of t19=
4.
> > IMO, this patch will need to be reworked a bit to enable the CMU for th=
is
> > output as well. I hacked this change in for DisplayPort, and then it
> > functioned as intended there as well.
> >=20
> > I've traced back to the reason this is necessary. The DC hub driver is
> > applying an sRGB degamma for every RGB plane (presumably for blending),
> > and then nothing reapplies the EOTF later on. Without gamma correction
> > in places where it is expected, images are going to look "too dark".
> >=20
> > Which does raise the point that there is an alternative implementation
> > where we do not degamma RGB planes in the first place. But this may have
> > unintended consequences when it comes to composition.
> >=20
> > The SOR does not appear to handle YCbCr outputs at this time, so enabli=
ng
> > the CMU assuming an sRGB EOTF seems like a reasonable path here, to me.
> >=20
> > Kurt
>=20
> I tested this patch locally and did some investigation. Can confirm
> that on my Jetson AGX Xavier, this patch (or disabling degamma) fixes
> the color output.
>=20
> The colorspace the display expects from the incoming data is specified
> in the AVI infoframe. This is generated in
> tegra_sor_hdmi_setup_avi_infoframe, which calls into
> drm_hdmi_avi_infoframe_from_display_mode, which leaves a lot of fields
> set at the default.
>=20
> Currently we're advertising:
> * colorimetry =3D no data -> for HD resolutions, use Rec. 709 primaries.
> These are the same as sRGB.
> * itc =3D false -> NOT IT content.
>=20
> My understanding (based on some LLM research and otherwise) is that
> this is likely to result in the display expecting Rec. 709 colors with
> Rec. 709 gamma. sRGB gamma is slightly different, and setting itc =3D
> true would hint the display towards using sRGB gamma.
>=20
> However, what seems clear to me is that the display would be expecting
> nonlinear data, so enabling gamma conversion at the output LUT seems
> correct to me. So this patch would be a clear improvement (with the
> fixes already discussed).

I think ideally we want to hook this up to the DRM color management
facilities, so that it can both be properly reported and configured
at runtime.

Obviously we also want to make sure that the output pixels match what
is advertised via the AVI infoframe. Looks like there's concensus that
enabling the output LUT is the correct way to do that.

Thierry

--fue3hpucru44eqpn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAml4lFUACgkQ3SOs138+
s6GqRQ/9Gty05JE6EKz66N98sGLJL+SU2hd4EiSyJ69JkUn682UhsMBkZj4GnaRj
FrxDBDnjjjDhdzinX5I/7Z/dEYeH2f+j8d7lT/oUhO/7YUpXylLoWByLBmIb52yp
/YaeipNrSfXRdN81+d8lw7Un1OST8N+vVq4WmZUWj5kI5TvzfmRcT8m6JmNpv58b
cOFZMuplp0V7UUs+2UzCKW9B5QskhkQCVd2X5Itut87DaNOkIkTwhYR6Y4oYnL1o
e+CyE0i7FxsdZ1pACzW3yWIOl4Ym+kJ9o9Lm0GsPcWboZv2N6qWI35DbQQNe6FUO
8CHQGuFYqmJxTiiXls6vCM8wxNocNcf0fpd78eNdSgTdjy1cis9P4z+aSI0C0K/q
sdxsIZv4azcfztg+AhZyZGpHdSaZ4YbHcH8Bez9tr50ar/FP0/XJap35csiLYjfZ
rg9OQS+BVOxxeXAyq6SOjnNqZz4Cr6eIQtYSjDVh479I9VuEl5lMplgxyBThwdQu
JJvPkbxzX4NdVFNPIm/N4YewIyDxt3lIOIfYmpFbYrZap8SechQ6iK30pzhizDcp
nGhY8fWz7y8khwOLldOzpHOtlpB0i5pvDGQhYiAEIEw9qpYdPkzGON3PIrvgKUNv
hH3/+A2/mJe9Kv/TmIvCzYDGInP3jyCWCYseVKCprHz1agpQjus=
=o1Nu
-----END PGP SIGNATURE-----

--fue3hpucru44eqpn--
