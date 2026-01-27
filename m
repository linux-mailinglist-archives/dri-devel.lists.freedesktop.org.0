Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDGNO6H8eGmOuQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 18:57:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3200D98AF1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 18:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1775C10E5A4;
	Tue, 27 Jan 2026 17:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TTQCXeqw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3E410E5A4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 17:57:49 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-59de66fdb53so4152374e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 09:57:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769536667; cv=none;
 d=google.com; s=arc-20240605;
 b=W9iRu19mNPnKc+dGSXP8s7KTt0iPzDFDdI2kFsiXexg9CHPjy+8S59B4ORfDPh1cV1
 ySWtRCMqzbXSlajbJ9ZBY6wci3aV3iP9l1VFYTk1UYhbn29a7LD/UZ/st6d5wxppOwWf
 zXGNRm1MWtZODmS8MTMYsKcCJA9PX5i1E2W2SP6WSR0uXr6u5DMYHD5xaDYVaUfmLXTC
 17+v2+zqB9capNsd0Xsxl/R6w8me3Spl/u6rJxCRvHX1e/OGQ93HwepfKTkZ5VgPwrxQ
 8trQH81jjMloaeNA7WpdXB89l38/5uphk+4ESm8F3iB+rmXYOjRZCmuvitJ5EXFqCtMC
 HvZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=luUIdgYgqij5sTyQIbDJzuI4VY3u9KXYKcnNYtE3tiw=;
 fh=3Abc4Ds0g1e/GQNlJzW6bF8Lgb8uXuKT5Y1aSMnRPMw=;
 b=McdBCfyd0A/SPasSdKDtSevjuBnojZELzwNSv8fLeri+yaUA4oQWFMaH61EVHUIrXd
 G1CGJIfYkDD7GiJWbbislVqzT4b+hisWrBBAFlKVQr1rQdIIMR5YpIw0Tyz7kmlI3wBT
 qczD/4Hc5ApKkLUJAnvJgeqANFV6RTtfBQi/EAk8Yi1JABdiscpA117s8fR2cfjkwM1u
 g5IVttupyM5wvq1xwj3cM41BwduyYuc0pA85lsCmI4q8GB8De1v8Z2e6hPmYIdhb8U/P
 clUK6Enso1f2QntgPREJqh6RBBICHdLykvS4Tl/R1Ts3P0yV0XDvS+6s9sb8EfDuhhVy
 CLQA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769536667; x=1770141467; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=luUIdgYgqij5sTyQIbDJzuI4VY3u9KXYKcnNYtE3tiw=;
 b=TTQCXeqw0mm5UW6HZF0ATZsd4bZKpP7h9GfM7TA+beaYIvLLTvR0hm/3hqQ0SAuBOf
 lTRmva0jNw0y3PDdYHlq5Qe5wm/rR07Eqma+xnvRaYhD96TOOQ7mAAd+PIUIbhwebBMd
 oZ04afUHd+SUSBCUai4wGiaef1kO+zO4aK0/Oe+Ld3p1iuAfh4RCaivUakX73T/NtgXg
 u+lTLkZrY0XZhsl6SBQS0XpEt03KlpW44LRaMOsVG7Jo8P/dQ5FJBMUv1VMzLTtRC0rA
 7HBqQypuLGSJY3ijITUzfI9XzIqKa/l5KfMha+z8FULu/hPQkJhhkqMKQ4qQ4shXsjr0
 d/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769536667; x=1770141467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=luUIdgYgqij5sTyQIbDJzuI4VY3u9KXYKcnNYtE3tiw=;
 b=Shl0Ao7z3TnuobhQt1qvuRMFkM+IPZ3s1cAw7QTCPCjMwr1TXO6IP/b86JeyOPAr4N
 cbSPQ1g+XLAUxL3aVJpUcZlQOwzSQ/9NcQ03RQFq0zW5in/loOkR9lWBqLx1a9Hz5UAK
 1xKR7FOtFjCYKVMEuR60pUxznevJ+NcbNEqOpbxiGBkO6e33wJsOnqxtz6y+vzEU9sM+
 iXe7pZ+XbSoLWw5XB+bqj0rDF0kAT+d9INnfcFPkxy2fWNxObs3zNa7zQdofieIXsN9V
 718t/cx+aglGm2r6xdhJ8WHeT0nRbF26VWUdyTCEooI/UgyFjdlibdIOb4z/NbFHm0YV
 3m4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8CXp7kfMAXXkU7FnU/jQMoqJdRrIV50j0ScW1tFBdZZ/2lFsPLGMDcGqA8CjY3xuvjDFOwWUHWn4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzscl3O/ansMZt0/DxeFgBlgfTcWl+os4tY+6VHGXCYrXbCijZJ
 5skHfXrdHHoBrZikmP9OOPju6U8lYIC/D2VU53RSqFJt/4ht1kNX9WyiVLozSM7IgmLVfVLKbPe
 KLJj5JI0c7M8RV0LYLOrop4fnXp4stOo=
X-Gm-Gg: AZuq6aJer427km7ife8oVzCIs+KTuVUwdPFWDn3EEudOInWHjOwENv4w4gFSyyfRWwK
 v8FoIuHIQFoQ3WRxGzdVl5SJ5SEHjKoHTFZseSU95wUaAsMbRCfeh5OuAQY7cCpwbWxMqtqwCq+
 5N34IHTPf86AEH/oNeqpAJY+Lt5cSpriH/fxf+lv0G/L8Ld8LFUTyT3Mo9TLJESArj7qS1Lfy6+
 Yqsfm0Usj09t0DbT8Ln1ZX8jKxSzKaYrwFvsgOrWfPZzvsQSB4xBCw9VlXkgT8c0KOJiYMved8L
 RragEYvYvPMk2AGgyucO3kxPsXjcXL+gwBsMuRmmQhgcxbQDAz4qdksg
X-Received: by 2002:a05:6512:1394:b0:59e:15a:d704 with SMTP id
 2adb3069b0e04-59e04015669mr1310663e87.13.1769536666875; Tue, 27 Jan 2026
 09:57:46 -0800 (PST)
MIME-Version: 1.0
References: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
 <CALHNRZ9b98Su9qAqXRSTCStoUPtC_u3+MG0cr4SQ-g3aVJD7LQ@mail.gmail.com>
 <8615742F-EE35-4B37-BA0A-D62FFD5424B4@gmail.com>
 <4318175.BddDVKsqQX@senjougahara> <aXiSMlP-UKmrFKL7@orome>
In-Reply-To: <aXiSMlP-UKmrFKL7@orome>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 27 Jan 2026 11:57:35 -0600
X-Gm-Features: AZwV_QiONhUrH9mW8fgK-XzM6A67xrmteS-4dD_epS4cP1D-YSc2IOYPoDWt8y0
Message-ID: <CALHNRZ-ZxBmbCNGyq77TWcNQwo9qhrB0znfRnsj7zy9GVE=jtA@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, Kurt Kiefer <kekiefer@gmail.com>, 
 Jasper Korten <jja2000@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:kekiefer@gmail.com,m:jja2000@gmail.com,m:thierry.reding@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[webgeek1234@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3200D98AF1
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 4:32=E2=80=AFAM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> On Tue, Jan 27, 2026 at 01:12:54PM +0900, Mikko Perttunen wrote:
> > On Thursday, January 22, 2026 2:08=E2=80=AFAM Kurt Kiefer wrote:
> > >
> > > > On Dec 8, 2025, at 8:23=E2=80=AFPM, Aaron Kling <webgeek1234@gmail.=
com> wrote:
> > > >
> > > > On Wed, Nov 5, 2025 at 3:28=E2=80=AFPM Jasper Korten <jja2000@gmail=
.com> wrote:
> > > >>
> > > >> Hi all,
> > > >>
> > > >> On 11/4/25 19:12, Aaron Kling wrote:
> > > >>> On Tue, Nov 4, 2025 at 3:14=E2=80=AFAM Thierry Reding <thierry.re=
ding@gmail.com> wrote:
> > > >>>> On Mon, Nov 03, 2025 at 12:39:57PM -0600, Aaron Kling wrote:
> > > >>>>> On Mon, Nov 3, 2025 at 5:54=E2=80=AFAM Thierry Reding <thierry.=
reding@gmail.com> wrote:
> > > >>>>>> On Sat, Nov 01, 2025 at 06:15:17PM -0500, Aaron Kling via B4 R=
elay wrote:
> > > >>>>>>> From: Aaron Kling <webgeek1234@gmail.com>
> > > >>>>>>>
> > > >>>>>>> Without the cmu, nvdisplay will display colors that are notab=
ly darker
> > > >>>>>>> than intended. The vendor bootloader and the downstream displ=
ay driver
> > > >>>>>>> enable the cmu and sets a sRGB table. Loading that table here=
 results in
> > > >>>>>>> the intended colors.
> > > >>>>>>>
> > > >>>>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > >>>>>>> ---
> > > >>>>>>>  drivers/gpu/drm/tegra/dc.h  |  13 +++
> > > >>>>>>>  drivers/gpu/drm/tegra/sor.c | 206 ++++++++++++++++++++++++++=
++++++++++++++++++
> > > >>>>>>>  2 files changed, 219 insertions(+)
> > > >>>>>> What does "darker than intended" mean? Who defines the intenti=
on? How do
> > > >>>>>> we know what the intention is? What this patch ultimately seem=
s to be
> > > >>>>>> doing is define sRGB to be the default colorspace. Is that alw=
ays the
> > > >>>>>> right default choice? What if people want to specify a differe=
nt
> > > >>>>>> colorspace?
> > > >>>>> I reported this issue almost a month ago. See kernel lore [0] a=
nd
> > > >>>>> freedesktop issue [1]. The pictures in the latter show what nvd=
isplay
> > > >>>>> looks like right now. It's nigh unusably dark. When booted into
> > > >>>>> Android with a tv launcher that has a black background, as is d=
efault
> > > >>>>> for LineageOS, it is really hard to read anything. Is it correc=
t as a
> > > >>>>> default? Well, cboot hardcodes this, so... presumably? It would=
 be
> > > >>>>> more ideal to expose this and csc to userspace, but I'm not sur=
e if
> > > >>>>> drm has a standardized interface for that or if tegra would hav=
e to
> > > >>>>> make something vendor specific. I think that would be a separat=
e
> > > >>>>> change concept compared to setting this default, though.
> > > >>>> The reason I'm asking is because I don't recall ever seeing "bro=
ken"
> > > >>>> colors like you do. So I suspect that this may also be related t=
o what
> > > >>>> display is connected, or the mode that we're setting.
> > > >> I have tried it on both a MacroSilicon HDMI capture card and an Ar=
zopa
> > > >> Z1FC 1080p portable monitor and run into the same darker colors. B=
oth
> > > >> have in common that they use HDMI which seems to line up with what=
 Aaron
> > > >> is reporting. I do not have an eDP display to test or another carr=
ier
> > > >> board with a different display out to test.
> > > >>>> It could perhaps
> > > >>>> also be related to what infoframes we're sending and how these a=
re
> > > >>>> supported/interpreted by the attached display.
> > > >>>>
> > > >>>> All of that is to say that maybe this looks broken on the partic=
ular
> > > >>>> setup that you have but may works fine on other setups. Changing=
 the
> > > >>>> default may fix your setup and break others.
> > > >>> Do you have a device set up so you can check? Or does the regress=
ion
> > > >>> test bench have a display that can be forwarded?
> > > >>>
> > > >>> My current setup is a rack of units plugged via hdmi to a kvm whi=
ch is
> > > >>> then plugged to a pikvm. I also observed this issue before I had =
this
> > > >>> setup, plugged directly to a 1080p monitor. I have not checked
> > > >>> displayport. I can cycle through a couple other displays without =
this
> > > >>> patch to see if I get any other result. I am fairly certain I hav=
e
> > > >>> consistently seen this issue since I started trying to work with
> > > >>> tegra-drm on kernel 6.1 or maybe even 5.15. I've never seen it wo=
rk to
> > > >>> allow for a bisect.
> > > >>>
> > > >>> I am in contact with one other person with a tx2 devkit, who
> > > >>> replicated the issue when I asked. Who plans to reply to this thr=
ead
> > > >>> with setup info later.
> > > >>
> > > >> For reference, I am said person. I have a Jetson TX2 Devkit that u=
ses
> > > >> the P2771 Device Tree. I'm running a Fedora distrokernel with no
> > > >> additional patches applied by myself. I have personally noticed th=
e
> > > >> issue to at least be present on 6.14.5 and 6.17.4.
> > > >>
> > > >>
> > > >> I'm currently not at home to take screenshots with and without the
> > > >> submitted patch, but will be able to do it tomorrownight or friday=
.
> > > >
> > > > Any further thoughts from the maintainers on this patch? As far as =
I
> > > > know, this is an issue for all users, at the very least on hdmi.
> > > >
> > > > Aaron
> > > >
> > >
> > > I can confirm that I have the same issue on a DisplayPort output of t=
194.
> > > IMO, this patch will need to be reworked a bit to enable the CMU for =
this
> > > output as well. I hacked this change in for DisplayPort, and then it
> > > functioned as intended there as well.
> > >
> > > I've traced back to the reason this is necessary. The DC hub driver i=
s
> > > applying an sRGB degamma for every RGB plane (presumably for blending=
),
> > > and then nothing reapplies the EOTF later on. Without gamma correctio=
n
> > > in places where it is expected, images are going to look "too dark".
> > >
> > > Which does raise the point that there is an alternative implementatio=
n
> > > where we do not degamma RGB planes in the first place. But this may h=
ave
> > > unintended consequences when it comes to composition.
> > >
> > > The SOR does not appear to handle YCbCr outputs at this time, so enab=
ling
> > > the CMU assuming an sRGB EOTF seems like a reasonable path here, to m=
e.
> > >
> > > Kurt
> >
> > I tested this patch locally and did some investigation. Can confirm
> > that on my Jetson AGX Xavier, this patch (or disabling degamma) fixes
> > the color output.
> >
> > The colorspace the display expects from the incoming data is specified
> > in the AVI infoframe. This is generated in
> > tegra_sor_hdmi_setup_avi_infoframe, which calls into
> > drm_hdmi_avi_infoframe_from_display_mode, which leaves a lot of fields
> > set at the default.
> >
> > Currently we're advertising:
> > * colorimetry =3D no data -> for HD resolutions, use Rec. 709 primaries=
.
> > These are the same as sRGB.
> > * itc =3D false -> NOT IT content.
> >
> > My understanding (based on some LLM research and otherwise) is that
> > this is likely to result in the display expecting Rec. 709 colors with
> > Rec. 709 gamma. sRGB gamma is slightly different, and setting itc =3D
> > true would hint the display towards using sRGB gamma.
> >
> > However, what seems clear to me is that the display would be expecting
> > nonlinear data, so enabling gamma conversion at the output LUT seems
> > correct to me. So this patch would be a clear improvement (with the
> > fixes already discussed).
>
> I think ideally we want to hook this up to the DRM color management
> facilities, so that it can both be properly reported and configured
> at runtime.

That would be ideal yes. But I don't have nearly the knowledge of DRM
or nvdisplay to wire this up. Is there someone at Nvidia that can make
time to do so?

> Obviously we also want to make sure that the output pixels match what
> is advertised via the AVI infoframe. Looks like there's concensus that
> enabling the output LUT is the correct way to do that.

If more fully featured CMU support can't be done in a reasonable
timeframe, I can address the earlier review comments and coordinate
with Kurt to replicate this for DP, then send a v2.

Aaron
