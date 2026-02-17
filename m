Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGjBMoArlGmdAQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 09:49:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FE114A169
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 09:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4BD10E495;
	Tue, 17 Feb 2026 08:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WkBSbDDT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74A310E493
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:49:00 +0000 (UTC)
Received: by mail-dl1-f45.google.com with SMTP id
 a92af1059eb24-124899ee9d3so2603279c88.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 00:49:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771318140; cv=none;
 d=google.com; s=arc-20240605;
 b=irxDM8sjflhe5EgvSC5ZtX5H5AaZ1j7D/Aw+MWrMtQ16RrACY395dayONj1rlyBLrT
 lHEiqbW8jsClmAWi6X1mITaqWm9xAM5BDTuMWwljgZGUNNRyYRP/OmtvyEagNBvAqBYX
 /uMOmzxzTCdPlZI7Ct52M0TXnzFN8GNGnKrULHgafvCAp94txiYoHxq3RYL0aP5UKnhx
 XyFh5HitmoSgvkO//LQDwVtfMWteczqrT8wc8Si4o0hjEo0zdMzPkFX0ZzgXSiIz/53+
 4APY6e++beUQBjmaXpiWAkKALGZ33/Q+cBBkKjXUJ6kljvPoBdov/ryn1V+X1hDeRS5I
 FtTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=AZOxraXWK9qndjlZ4UcFxM3A0B4KMybn0m0WLPpvgkg=;
 fh=Sw+OFUB1bP27zc6+KVYXK+e6VCZoKCRJf+RHHIW5V3M=;
 b=iaqE8JiaQjzmgFab2bWVb96t4Z3OiqgH8MHEJ+P3ByeRQFOj+4w06ZNz5tBd3Du04W
 UcMqnD9UBuOb/IFOZaHdCdeqW13CJ/ytMzevFnlm8cW6bLb7XqDQN1yBujlzjuOJcSfW
 MRaa8i3pCYZvEadHnBvXGpd1OOnOFshbXUZ5EewoJG/FnXAjaRv758b8JKfcdLX+0BxH
 GcV6SP78lnpSFdvv9EyHqd7kHACfhDsc/7OuZc7U9C7mfNMk8vUdM0ozV/dCVeHN+pR3
 6OpRWBfEOMp1iW0Ukf/xqbE57RLwL8HBB1bMEQr6xEYwLWftL+pbl/ZdJJlECrzY/3vF
 jxlA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771318140; x=1771922940; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AZOxraXWK9qndjlZ4UcFxM3A0B4KMybn0m0WLPpvgkg=;
 b=WkBSbDDTdsWVf4FO+mb4KchU10jbvKevtHEJX8B4Ebg+iWlPCORKu7OHgpM8KpEyWQ
 9N81tz9RoZ8Nizg5XURsB9ESsrIgfOvwOyFUrFrXAw6M37DdM4u7QAwXpW5NqLVz/XlA
 fh+cWMbHkxPUBttW99LkE4gLAa8AbKcXmndxsYqdxx0ssxee2IEajVhuRKhQ6FKKFUgI
 M1BNZ5mvHN3/c9mUFgpcuedDuN2pEQrviLmfie6kU5bkAhj1OeLUyI4zQK1yfeoroa9m
 MJphx3PfA7k7tzvv1pvNITKNffD0R1PYHlYrsEt9QDziY0pIWjRp8EiWy2NjTIfjHoEq
 t36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771318140; x=1771922940;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AZOxraXWK9qndjlZ4UcFxM3A0B4KMybn0m0WLPpvgkg=;
 b=KZ5TY6Y+CCKhkHOqcryCAiChietn9CfqrJy/2fm7sqEL8kin0ZcFA9Pux+O7VTBDSa
 +KcPj5yZ5brZI5tPutQ1Ni//nNsU5NRjcMtieVEAQ6Y/ckLSdT5WNcSuDf7sbD/BH+En
 e0BjEMcXa/bhTZekbEjE70eEHMlscaltvfRAZiJ1utLOqJ6Bgn6cvUw3ZL2XyvTNNHCf
 XBOOXNeOau/28BTLbXEr+9M70rOMoMkVN0zyijBHviiKPW7v8V5IoQWzcngA+BVMihKn
 p5eR9cpaTO8txLRPJgvDF2AsdXPLswELXR8hv5E0Y9myH2E8vujoIlDooK9UVYS/3VCo
 FmvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi+XgdikdFMgPg3OiUe+0GvFtI/WscFLqUuNs62T2BMknUMEel/rCnABdi8Orv1BUsmI71qbSa7bQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycW0WgAaqgY4XG8HBPwiGrVyXfVuqRT9COf1Co/bpEPI0aaIQy
 8hbs8JywIcZGhHWlQ6+l8jsPnAgR2DQU055qI1lA5o2K4u6Ygm+pQw6SI/sU9K44fiAAal3STIz
 qZJLBYWyMLiS7/KefLLfzz7V+mt31Bws=
X-Gm-Gg: AZuq6aLcM0SHkSuZ9HeWk67StRSiX9BWGQnI1gGqxHO3k/nRRHzebo5HdkFFV+MAnEQ
 ReG3J888dzs2XQjZX2rB+mf5I00GKnaquXuda8e3O7zMf9LxV+S53PL946UoFiDfi9FRufYs7WM
 aCCTQ6a0zRkQb99+LJAdlRL88SOkAPEz5CUlqPhZc5Po4rU2KagSjxB55fMtAcGe7mnK9lGUosv
 7YmCyf7DekMfALIw6RbQXZMzLNok78QK7BLR4eFlGNPYlAZLQtNKyW9oAnD36c6es6jxxPUwk9Z
 sOLUrs0jgTiICM9ZSLJoClb3d0/+bSIYwwLXgYyg
X-Received: by 2002:a05:7022:426:b0:123:3301:a718 with SMTP id
 a92af1059eb24-12740fbdb06mr4105828c88.1.1771318139907; Tue, 17 Feb 2026
 00:48:59 -0800 (PST)
MIME-Version: 1.0
References: <20260216044735.6814-1-mario.kleiner.de@gmail.com>
 <CADnq5_PfxV9r+LEAhvR_MRGOC_Xgp8vRWgMk8o9qKzur3bw2ag@mail.gmail.com>
In-Reply-To: <CADnq5_PfxV9r+LEAhvR_MRGOC_Xgp8vRWgMk8o9qKzur3bw2ag@mail.gmail.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Tue, 17 Feb 2026 09:48:23 +0100
X-Gm-Features: AaiRm52Af7nHGotxHTRxBVe8wub57_NgkN-_dGjk2-JI0nl6ur_OJ3JM12lZlQk
Message-ID: <CAEsyxyjTYHPFKYxs=+rPNs-R4i2XJnoDUPoX==otph0NigxTUw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Prevent cursor bo's from being pinned to
 VRAM address zero
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 stable@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Content-Type: multipart/alternative; boundary="00000000000083723c064b0124fa"
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:amd-gfx@lists.freedesktop.org,m:stable@vger.kernel.org,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:alexander.deucher@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mariokleinerde@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mariokleinerde@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gitlab.freedesktop.org:url,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 78FE114A169
X-Rspamd-Action: no action

--00000000000083723c064b0124fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Yes, your patch is way more elegant and more easy to backport. I've spent
some time to understand how exactly it works and tested it thoroughly on my
machine, so it is

Reviewed-and-tested-by: Mario Kleiner <mario.kleiner.de at gmail.com>

Some small changes suggested to the commit message:

Your commit message has some typo "sends" -> "ends", and then "We already
reserve have the framework to reserve memory at 0 in the address space ..."
- That's one "reserve" too many.

For the Cc: <stable...> you can remove the "# v6.12+" restriction. That was
due to my more clumsy approach, which would have been more difficult to
backport to 6.11 and earlier due to some refactoring happening in
amdgpu_bo_pin() on Linux 6.12. Your patch should be backportable to
earlier kernels, and the problem exists since probably forever, it only
starts to really happen generally starting with Linux 6.11, which forces
dual-gpu mode on these machines, before 6.11 it was an opt-in via some grub
configuration. A quick dig suggests the patch may apply back to Linux 5.10.

Thanks!
-mario


On Mon, Feb 16, 2026 at 4:17=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:

> On Mon, Feb 16, 2026 at 12:02=E2=80=AFAM Mario Kleiner
> <mario.kleiner.de@gmail.com> wrote:
> >
> > Why?
> >
> > On some AMD gpu's in some configurations, the start of the VRAM domain,
> as
> > reported by amdgpu_ttm_domain_start(adev, AMDGPU_GEM_DOMAIN_VRAM), is
> > placed at address 0 during GMC init. This is a problem if, during a
> cursor
> > plane update, the cursor image bo, which gets always pinned into VRAM,
> > is placed at offset zero of the VRAM domain, and thereby at the
> > absolute address afb->address 0.
> >
> > The display hw apparently doesn't like such a zero start address for at
> > least native cursor mode, as various checks inside DC are in place, e.g=
.,
> > high level dc_stream_check_cursor_attributes(), and lower level DCN
> > version specific cursor hw programming checks, which do reject cursor
> > attribute updates with attributes->address.quad_part =3D=3D 0.
> >
> > User visible symptoms of this are seriously broken mouse cursors under
> > both X11 and Wayland (tested with KDE/KWin, GNOME/Mutter, GDM login
> > manager): Mouse cursor flickers, is invisible, randomly becomes
> invisible,
> > or fails to adapt the cursor shape to the context, e.g., when moving fr=
om
> > a text input field to other windows, or window decorations etc. This
> makes
> > the cursor irritating and impossible to use.
> >
> > The drm.debug=3D4 log shows DRM KMS debug messages of the form
> > "DC: Cursor address is 0!", and the general syslog prints errors like
> > "[drm:amdgpu_dm_plane_handle_cursor_update [amdgpu]] *ERROR* DC failed =
to
> > set cursor attributes"
> >
> > I observe this bug on my dual-gpu Apple 2017 MacBookPro since Linux 4.1=
1,
> > where the kernels early EFI setup force-enables both the Intel iGPU and
> > AMD dGPU. This leads to the AMD VRAM start being placed at 0x0 and then
> > causes massive cursor problems. On earlier kernels, only the AMD dGPU w=
as
> > exposed, the Intel iGPU was disabled / hidden from Linux by EFI firmwar=
e.
> > This caused the AMD gpu to place VRAM start at the non-zero
> > address 0x000000F400000000, and the mouse cursor worked fine. I confirm=
ed
> > with umr that the mmMC_VM_FB_LOCATION register of my Polaris 11 gpu
> indeed
> > read back 0x0000 in the lower 16 bits in the dual-gpu case, causing
> > gmc_v8_0_vram_gtt_location() to setup start of VRAM domain at zero.
> > I don't know what causes the change, but most likely the UEFI firmware
> > somehow triggers this change before main kernel boot - calling into the
> > VBIOS, I guess.
> >
> > There is at least one 8 months old bug report in AMD's issue tracker,
> > reporting the same symptoms on other AMD setups, cfe.:
> > https://gitlab.freedesktop.org/drm/amd/-/issues/4302
> >
> > So unless there is another more clean and reliable way to prevent the
> > cursor bo from being placed at address zero, or unless the display hw
> > is actually fine with address zero and those checks in DC are overly
> > cautious, this needs to be fixed.
> >
> > Note that simply removing the "zero address -> reject cursor update"
> > checks worked on my Polaris11 with DCE 11.2 display engine, fixing the
> > cursor without causing any other obvious trouble. So maybe this is only
> > a limitation of recent DCN engine versions, or a pointless check.
> >
> > How?
> >
> > Add a new AMD bo placement flag which requests bo pinning / placement a=
t
> > non-zero VRAM address only during amdgpu_bo_pin(). Use this flag for bo=
's
> > on the cursor plane during amdgpu_dm_plane_helper_prepare_fb().
> >
> > I don't know if this is the best approach. It feels hacky, but it is th=
e
> > only approach I was able to do and it seems to work fine enough.
> >
> > If this is a good enough fix, it should be backported, but backporting
> > to earlier than Linux 6.12 might be cumbersome due to changes to the
> > amdgpu_bo_pin() implementation.
>
> Thanks for tracking this down.  I think this patch would be cleaner
> and easier to apply to older kernels.
>
> Alex
>
> >
> > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> > Tested-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> > Cc: <stable@vger.kernel.org> # v6.12+
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Leo Li <sunpeng.li@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c            | 11 +++++++++++
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  6 ++++--
> >  include/uapi/drm/amdgpu_drm.h                         |  7 +++++++
> >  3 files changed, 22 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > index 1fb956400696..97131fc8fbdf 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > @@ -975,6 +975,17 @@ int amdgpu_bo_pin(struct amdgpu_bo *bo, u32 domain=
)
> >                 if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
> >                     bo->placements[i].mem_type =3D=3D TTM_PL_VRAM)
> >                         bo->placements[i].flags |=3D
> TTM_PL_FLAG_CONTIGUOUS;
> > +
> > +               /* Ensure bo is never pinned at amdgpu_bo_gpu_offset()
> =3D=3D 0
> > +                * for VRAM allocations, as some of the DC code does no=
t
> > +                * like that, e.g., mouse cursor display image bo's.
> > +                */
> > +               if (bo->flags & AMDGPU_GEM_CREATE_VRAM_NON_ZERO_ADDRESS
> &&
> > +                   bo->placements[i].mem_type =3D=3D TTM_PL_VRAM &&
> > +                   !bo->placements[i].fpfn &&
> > +                   !amdgpu_ttm_domain_start(adev, TTM_PL_VRAM)) {
> > +                       bo->placements[i].fpfn =3D 1;
> > +               }
> >         }
> >
> >         r =3D ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > index 394880ec1078..cd7f53d3036c 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > @@ -959,10 +959,12 @@ static int
> amdgpu_dm_plane_helper_prepare_fb(struct drm_plane *plane,
> >                 goto error_unlock;
> >         }
> >
> > -       if (plane->type !=3D DRM_PLANE_TYPE_CURSOR)
> > +       if (plane->type !=3D DRM_PLANE_TYPE_CURSOR) {
> >                 domain =3D amdgpu_display_supported_domains(adev,
> rbo->flags);
> > -       else
> > +       } else {
> >                 domain =3D AMDGPU_GEM_DOMAIN_VRAM;
> > +               rbo->flags |=3D AMDGPU_GEM_CREATE_VRAM_NON_ZERO_ADDRESS=
;
> > +       }
> >
> >         rbo->flags |=3D AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
> >         r =3D amdgpu_bo_pin(rbo, domain);
> > diff --git a/include/uapi/drm/amdgpu_drm.h
> b/include/uapi/drm/amdgpu_drm.h
> > index 1d34daa0ebcd..6dee7653c54e 100644
> > --- a/include/uapi/drm/amdgpu_drm.h
> > +++ b/include/uapi/drm/amdgpu_drm.h
> > @@ -181,6 +181,13 @@ extern "C" {
> >  #define AMDGPU_GEM_CREATE_EXT_COHERENT         (1 << 15)
> >  /* Set PTE.D and recompress during GTT->VRAM moves according to TILING
> flags. */
> >  #define AMDGPU_GEM_CREATE_GFX12_DCC            (1 << 16)
> > +/* Flag that BO must not be placed in VRAM domain at offset zero if th=
e
> > + * VRAM domain itself starts at address zero.
> > + *
> > + * Used internally to prevent placement of cursor image BO at that
> location,
> > + * as the display hardware doesn't like that for hardware cursors.
> > + */
> > +#define AMDGPU_GEM_CREATE_VRAM_NON_ZERO_ADDRESS (1 << 17)
> >
> >  struct drm_amdgpu_gem_create_in  {
> >         /** the requested memory size */
> > --
> > 2.43.0
> >
>

--00000000000083723c064b0124fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alex,</div><div><br></div><div>Yes, your patch is =
way more elegant and more easy to backport. I&#39;ve spent some time to und=
erstand how exactly it works and tested it thoroughly on my machine, so it =
is</div><div><br></div><div>Reviewed-and-tested-by: Mario Kleiner &lt;<a hr=
ef=3D"http://mario.kleiner.de" target=3D"_blank">mario.kleiner.de</a> at <a=
 href=3D"http://gmail.com" target=3D"_blank">gmail.com</a>&gt;</div><div><b=
r></div><div>Some small changes suggested to the commit message:</div><div>=
<br></div><div>Your commit message has some typo &quot;sends&quot; -&gt; &q=
uot;ends&quot;, and then &quot;We already reserve have the framework to res=
erve memory at 0 in the address space ...&quot; - That&#39;s one &quot;rese=
rve&quot; too many.</div><div><br></div><div>For the Cc: &lt;stable...&gt; =
you can remove the &quot;# v6.12+&quot; restriction. That was due to my mor=
e clumsy approach, which would have been more difficult=C2=A0to backport to=
 6.11 and earlier due to some refactoring happening in amdgpu_bo_pin() on L=
inux 6.12. Your patch should be backportable to earlier=C2=A0kernels, and t=
he problem exists since probably forever, it only starts to really happen g=
enerally starting with Linux 6.11, which=C2=A0forces dual-gpu mode on these=
 machines, before 6.11 it was an opt-in via some grub configuration. A quic=
k dig suggests the patch may apply back to Linux 5.10.</div><div><br></div>=
<div>Thanks!</div><div>-mario</div><div><br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 16, 2026 at 4=
:17=E2=80=AFPM Alex Deucher &lt;<a href=3D"mailto:alexdeucher@gmail.com" ta=
rget=3D"_blank">alexdeucher@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Mon, Feb 16, 2026 at 12:02=E2=80=AF=
AM Mario Kleiner<br>
&lt;<a href=3D"mailto:mario.kleiner.de@gmail.com" target=3D"_blank">mario.k=
leiner.de@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Why?<br>
&gt;<br>
&gt; On some AMD gpu&#39;s in some configurations, the start of the VRAM do=
main, as<br>
&gt; reported by amdgpu_ttm_domain_start(adev, AMDGPU_GEM_DOMAIN_VRAM), is<=
br>
&gt; placed at address 0 during GMC init. This is a problem if, during a cu=
rsor<br>
&gt; plane update, the cursor image bo, which gets always pinned into VRAM,=
<br>
&gt; is placed at offset zero of the VRAM domain, and thereby at the<br>
&gt; absolute address afb-&gt;address 0.<br>
&gt;<br>
&gt; The display hw apparently doesn&#39;t like such a zero start address f=
or at<br>
&gt; least native cursor mode, as various checks inside DC are in place, e.=
g.,<br>
&gt; high level dc_stream_check_cursor_attributes(), and lower level DCN<br=
>
&gt; version specific cursor hw programming checks, which do reject cursor<=
br>
&gt; attribute updates with attributes-&gt;address.quad_part =3D=3D 0.<br>
&gt;<br>
&gt; User visible symptoms of this are seriously broken mouse cursors under=
<br>
&gt; both X11 and Wayland (tested with KDE/KWin, GNOME/Mutter, GDM login<br=
>
&gt; manager): Mouse cursor flickers, is invisible, randomly becomes invisi=
ble,<br>
&gt; or fails to adapt the cursor shape to the context, e.g., when moving f=
rom<br>
&gt; a text input field to other windows, or window decorations etc. This m=
akes<br>
&gt; the cursor irritating and impossible to use.<br>
&gt;<br>
&gt; The drm.debug=3D4 log shows DRM KMS debug messages of the form<br>
&gt; &quot;DC: Cursor address is 0!&quot;, and the general syslog prints er=
rors like<br>
&gt; &quot;[drm:amdgpu_dm_plane_handle_cursor_update [amdgpu]] *ERROR* DC f=
ailed to<br>
&gt; set cursor attributes&quot;<br>
&gt;<br>
&gt; I observe this bug on my dual-gpu Apple 2017 MacBookPro since Linux 4.=
11,<br>
&gt; where the kernels early EFI setup force-enables both the Intel iGPU an=
d<br>
&gt; AMD dGPU. This leads to the AMD VRAM start being placed at 0x0 and the=
n<br>
&gt; causes massive cursor problems. On earlier kernels, only the AMD dGPU =
was<br>
&gt; exposed, the Intel iGPU was disabled / hidden from Linux by EFI firmwa=
re.<br>
&gt; This caused the AMD gpu to place VRAM start at the non-zero<br>
&gt; address 0x000000F400000000, and the mouse cursor worked fine. I confir=
med<br>
&gt; with umr that the mmMC_VM_FB_LOCATION register of my Polaris 11 gpu in=
deed<br>
&gt; read back 0x0000 in the lower 16 bits in the dual-gpu case, causing<br=
>
&gt; gmc_v8_0_vram_gtt_location() to setup start of VRAM domain at zero.<br=
>
&gt; I don&#39;t know what causes the change, but most likely the UEFI firm=
ware<br>
&gt; somehow triggers this change before main kernel boot - calling into th=
e<br>
&gt; VBIOS, I guess.<br>
&gt;<br>
&gt; There is at least one 8 months old bug report in AMD&#39;s issue track=
er,<br>
&gt; reporting the same symptoms on other AMD setups, cfe.:<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/drm/amd/-/issues/4302" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/drm/amd/-/=
issues/4302</a><br>
&gt;<br>
&gt; So unless there is another more clean and reliable way to prevent the<=
br>
&gt; cursor bo from being placed at address zero, or unless the display hw<=
br>
&gt; is actually fine with address zero and those checks in DC are overly<b=
r>
&gt; cautious, this needs to be fixed.<br>
&gt;<br>
&gt; Note that simply removing the &quot;zero address -&gt; reject cursor u=
pdate&quot;<br>
&gt; checks worked on my Polaris11 with DCE 11.2 display engine, fixing the=
<br>
&gt; cursor without causing any other obvious trouble. So maybe this is onl=
y<br>
&gt; a limitation of recent DCN engine versions, or a pointless check.<br>
&gt;<br>
&gt; How?<br>
&gt;<br>
&gt; Add a new AMD bo placement flag which requests bo pinning / placement =
at<br>
&gt; non-zero VRAM address only during amdgpu_bo_pin(). Use this flag for b=
o&#39;s<br>
&gt; on the cursor plane during amdgpu_dm_plane_helper_prepare_fb().<br>
&gt;<br>
&gt; I don&#39;t know if this is the best approach. It feels hacky, but it =
is the<br>
&gt; only approach I was able to do and it seems to work fine enough.<br>
&gt;<br>
&gt; If this is a good enough fix, it should be backported, but backporting=
<br>
&gt; to earlier than Linux 6.12 might be cumbersome due to changes to the<b=
r>
&gt; amdgpu_bo_pin() implementation.<br>
<br>
Thanks for tracking this down.=C2=A0 I think this patch would be cleaner<br=
>
and easier to apply to older kernels.<br>
<br>
Alex<br>
<br>
&gt;<br>
&gt; Signed-off-by: Mario Kleiner &lt;<a href=3D"mailto:mario.kleiner.de@gm=
ail.com" target=3D"_blank">mario.kleiner.de@gmail.com</a>&gt;<br>
&gt; Tested-by: Mario Kleiner &lt;<a href=3D"mailto:mario.kleiner.de@gmail.=
com" target=3D"_blank">mario.kleiner.de@gmail.com</a>&gt;<br>
&gt; Cc: &lt;<a href=3D"mailto:stable@vger.kernel.org" target=3D"_blank">st=
able@vger.kernel.org</a>&gt; # v6.12+<br>
&gt; Cc: Harry Wentland &lt;<a href=3D"mailto:harry.wentland@amd.com" targe=
t=3D"_blank">harry.wentland@amd.com</a>&gt;<br>
&gt; Cc: Leo Li &lt;<a href=3D"mailto:sunpeng.li@amd.com" target=3D"_blank"=
>sunpeng.li@amd.com</a>&gt;<br>
&gt; Cc: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com" targ=
et=3D"_blank">alexander.deucher@amd.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 11 +++++++++++<br>
&gt;=C2=A0 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c=C2=A0 =C2=A0=
|=C2=A0 6 ++++--<br>
&gt;=C2=A0 include/uapi/drm/amdgpu_drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++++++<br=
>
&gt;=C2=A0 3 files changed, 22 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_object.c<br>
&gt; index 1fb956400696..97131fc8fbdf 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c<br>
&gt; @@ -975,6 +975,17 @@ int amdgpu_bo_pin(struct amdgpu_bo *bo, u32 domai=
n)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-&g=
t;flags &amp; AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bo-&gt;placements[i].mem_type =3D=3D TTM_PL_VRAM)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0bo-&gt;placements[i].flags |=3D TTM_PL_FLAG_CONTIGUOUS;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Ensure bo i=
s never pinned at amdgpu_bo_gpu_offset() =3D=3D 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * for VRAM al=
locations, as some of the DC code does not<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * like that, =
e.g., mouse cursor display image bo&#39;s.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-&gt;fla=
gs &amp; AMDGPU_GEM_CREATE_VRAM_NON_ZERO_ADDRESS &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
bo-&gt;placements[i].mem_type =3D=3D TTM_PL_VRAM &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
!bo-&gt;placements[i].fpfn &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
!amdgpu_ttm_domain_start(adev, TTM_PL_VRAM)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0bo-&gt;placements[i].fpfn =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D ttm_bo_validate(&amp;bo-&gt;tbo=
, &amp;bo-&gt;placement, &amp;ctx);<br>
&gt; diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b=
/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c<br>
&gt; index 394880ec1078..cd7f53d3036c 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c<br>
&gt; +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c<br>
&gt; @@ -959,10 +959,12 @@ static int amdgpu_dm_plane_helper_prepare_fb(str=
uct drm_plane *plane,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto erro=
r_unlock;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (plane-&gt;type !=3D DRM_PLANE_TYPE_CUR=
SOR)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (plane-&gt;type !=3D DRM_PLANE_TYPE_CUR=
SOR) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0domain =
=3D amdgpu_display_supported_domains(adev, rbo-&gt;flags);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0domain =
=3D AMDGPU_GEM_DOMAIN_VRAM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rbo-&gt;flags =
|=3D AMDGPU_GEM_CREATE_VRAM_NON_ZERO_ADDRESS;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rbo-&gt;flags |=3D AMDGPU_GEM_CREATE_=
VRAM_CONTIGUOUS;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D amdgpu_bo_pin(rbo, domain);<br>
&gt; diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_d=
rm.h<br>
&gt; index 1d34daa0ebcd..6dee7653c54e 100644<br>
&gt; --- a/include/uapi/drm/amdgpu_drm.h<br>
&gt; +++ b/include/uapi/drm/amdgpu_drm.h<br>
&gt; @@ -181,6 +181,13 @@ extern &quot;C&quot; {<br>
&gt;=C2=A0 #define AMDGPU_GEM_CREATE_EXT_COHERENT=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(1 &lt;&lt; 15)<br>
&gt;=C2=A0 /* Set PTE.D and recompress during GTT-&gt;VRAM moves according =
to TILING flags. */<br>
&gt;=C2=A0 #define AMDGPU_GEM_CREATE_GFX12_DCC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (1 &lt;&lt; 16)<br>
&gt; +/* Flag that BO must not be placed in VRAM domain at offset zero if t=
he<br>
&gt; + * VRAM domain itself starts at address zero.<br>
&gt; + *<br>
&gt; + * Used internally to prevent placement of cursor image BO at that lo=
cation,<br>
&gt; + * as the display hardware doesn&#39;t like that for hardware cursors=
.<br>
&gt; + */<br>
&gt; +#define AMDGPU_GEM_CREATE_VRAM_NON_ZERO_ADDRESS (1 &lt;&lt; 17)<br>
&gt;<br>
&gt;=C2=A0 struct drm_amdgpu_gem_create_in=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/** the requested memory size */<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
</blockquote></div>

--00000000000083723c064b0124fa--
