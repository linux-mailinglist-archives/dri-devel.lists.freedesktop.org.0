Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIsDCPg0k2mg2gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 16:17:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EFA14554C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 16:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E54C10E39B;
	Mon, 16 Feb 2026 15:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FnwKEDcL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FFB10E39B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 15:17:08 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-2baacadad3eso126824eec.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 07:17:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771255028; cv=none;
 d=google.com; s=arc-20240605;
 b=bfB6FEsGvIxYMEAUoPidTsV4D7M4sgWFba1xifTTfMJ51xaRCd1w7VNijtgSCGYHOE
 acDYP43KdefcXcvshSRfvcWjB7Ox6bviRE0ceXpkDpsEkhvYeEwBq3EA9/kTlLKuU15i
 kd/pKBdkAG8dcHSNPqhNiDtsUyAMZ9dw0KTPGZ63noVX9RNq/LBOwzncV201dCzMyOGh
 x+hdfe3kzOPFR7iIIp+UfTmwH9HSrBhQZ83/r6U+slNTH09FYtMFMKrQuIa5tlZQL/P2
 uF4AjEyGCQRzS28/O5pbcWpuMGYVTaLxbEpIAVFvHbonYNibVm/vSyYsNrmkGDpsK5wT
 Pfhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=YKPC9P2MdUr1p8+ptPTrIBFkfHYN1KOmv4Jan9hFXOc=;
 fh=2YMWxKUzi9EyRmmyxb9L78IeiADzTWjBRF5C11UpIho=;
 b=KmsDF06QdtoN6mXMnx6S72zZtNEBZEB22ImFTnb4X5wAcKqwJEuvFbOe8/M0jh4Xxt
 RnvksW4FcJO3ldQU5YCTYxMB0gxnWbcA3lCI7DOoWOj0Y48arjsVd91kT25MBmJbR1jD
 Fmva0ZX7sJmozLlmW6wqXxAKK3IGPCkoKsZoybuAv3aOh7FN3jwOBdPx1Tlys9WLeE7q
 M2sXPiWszuuXEQu01TYSmoaZwnNdyF5pKVdJP/uuLgCxfvPOwIeJiCso/RjbJKi7QdyN
 dO8K70DEgv3EJQe5HugBJPJWFdIada4XM6KLpyYwvOrjr5r8MfgmDLUaoPQaZAibSXZ5
 5RPA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771255028; x=1771859828; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YKPC9P2MdUr1p8+ptPTrIBFkfHYN1KOmv4Jan9hFXOc=;
 b=FnwKEDcLRYUZ6Z2kU6hqYtOjR1fBQOgw/6nYoQLmhVv0xmBPQaUWIDCR7O8qwL3bQY
 akmeLN6o7fOOZn9r9jR60eooFAz+ljAnVzPBg1ShyxZbrltb9aWh7AJMDwJB9GkkeZEj
 Cvv8PKNX4mHxMEDstYVP1WJUMfck81LcafZmf717GUtl2KWbTv3FZ3/b3lyNz5pkA8a7
 E1ZgH9eBmLTqedWrgUFMdL0s03ijgYvrUknD91qsRH9fTlp/heDfIbDEqTU04j5Y3NUM
 7IGA3D4bR6X7wvnQnUGACywYuNyka5Fe6KNeNW1yHtmmO1t3P76m/0pjQ2p4MDwJFa8J
 Wuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771255028; x=1771859828;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YKPC9P2MdUr1p8+ptPTrIBFkfHYN1KOmv4Jan9hFXOc=;
 b=eicRrbPg0yDLAdvchfG6rxK2Sjc6Io7mBFktDOU1zYwlYAw0MK7KegxB1/iFDwrH2Z
 vEFjn0WHnFT/HIr9qivzeUMc3YYM1Hh6C8IGAspW+9fZcMdqCsSviTmc/V0FuiUM5s80
 xm083zii1t/7WECwIusb6Ca4Vqs8c9QGHIwwKwBFCNhjYFdgFi3DLcb7fqFtA4bL+YHI
 Ged6MdJ01EH7VpfbrOVNQ7oefUJFm3Y6xf9Hv7LEGvSDtEFlPUQNn3njn2PSmMbkYO/k
 XFtBvYb0Jhrfotoil1euD1FcHDhc8tNL07OAQt2qgEj4ZG7hcpawbt7NishxYOAWjJR2
 rCFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQNogeUNEqY2Xvaw6T48WDbJlqR/Dp8XFP11B/kIPahDsUbqMZjQ/p8eZsKmRSt3nNoXrrjFnfZMg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpQeIp26LJTKCs7hUw1mL8vVblotUUqwZ6G9rKGcTEPYQzjVjd
 qpiNRQ7ms2anpk1qCJk0gXRONXu+2lRSyzbjJ1RxLHWPu24B4KaCW/6I5hMnDu7BOSBaWJkD2bA
 L7SBNkQfdcb+9nhNaICyn+KkLYh7xjws=
X-Gm-Gg: AZuq6aKRpn/HYRIWr7+PhrGl43aQX7KmITufCkxwTNvmaEQ+T7Y9dde+JmoWc7UVOkP
 WtGqoLKGebqQu2bbhRRk4STNMYIgE6X5q1QAaEnjrcdOIamzoVfHHiO6o2gM57ww5vKofrABf3C
 sKKDT8IGhl7Qc83wgC3n9vySibUJIeo5+DDKuhV0Uhu9IhzGorb7zQqAUX4olh2I+2FsiyX/F71
 s7h9w6hIar+3h1V9wpjgEgssM4o4oMz9ADU9FL5yaTV0nq8Y1H9sZhwKqZODgVLp0rWVAACur+9
 Ijzi1LbZpTTsAtEeecK+IbvJK7Svvfwe6M1uDSvYz39tVnn4nQt1asWyffQOYe66Sh1MdO1N7wz
 9PfO1
X-Received: by 2002:a05:693c:3747:b0:2ba:7321:cf91 with SMTP id
 5a478bee46e88-2baba0158e1mr2351361eec.3.1771255027376; Mon, 16 Feb 2026
 07:17:07 -0800 (PST)
MIME-Version: 1.0
References: <20260216044735.6814-1-mario.kleiner.de@gmail.com>
In-Reply-To: <20260216044735.6814-1-mario.kleiner.de@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Feb 2026 10:16:55 -0500
X-Gm-Features: AaiRm51WrxeDGXyaEQrCB3OfmfTE87V2C5BJQUcl4yyEMYoSRmsnvc_EPo28dIM
Message-ID: <CADnq5_PfxV9r+LEAhvR_MRGOC_Xgp8vRWgMk8o9qKzur3bw2ag@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Prevent cursor bo's from being pinned to
 VRAM address zero
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 stable@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Content-Type: multipart/mixed; boundary="000000000000b73185064af27275"
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
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mario.kleiner.de@gmail.com,m:amd-gfx@lists.freedesktop.org,m:stable@vger.kernel.org,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:alexander.deucher@amd.com,m:mariokleinerde@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,amd.com:email]
X-Rspamd-Queue-Id: C3EFA14554C
X-Rspamd-Action: no action

--000000000000b73185064af27275
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 12:02=E2=80=AFAM Mario Kleiner
<mario.kleiner.de@gmail.com> wrote:
>
> Why?
>
> On some AMD gpu's in some configurations, the start of the VRAM domain, a=
s
> reported by amdgpu_ttm_domain_start(adev, AMDGPU_GEM_DOMAIN_VRAM), is
> placed at address 0 during GMC init. This is a problem if, during a curso=
r
> plane update, the cursor image bo, which gets always pinned into VRAM,
> is placed at offset zero of the VRAM domain, and thereby at the
> absolute address afb->address 0.
>
> The display hw apparently doesn't like such a zero start address for at
> least native cursor mode, as various checks inside DC are in place, e.g.,
> high level dc_stream_check_cursor_attributes(), and lower level DCN
> version specific cursor hw programming checks, which do reject cursor
> attribute updates with attributes->address.quad_part =3D=3D 0.
>
> User visible symptoms of this are seriously broken mouse cursors under
> both X11 and Wayland (tested with KDE/KWin, GNOME/Mutter, GDM login
> manager): Mouse cursor flickers, is invisible, randomly becomes invisible=
,
> or fails to adapt the cursor shape to the context, e.g., when moving from
> a text input field to other windows, or window decorations etc. This make=
s
> the cursor irritating and impossible to use.
>
> The drm.debug=3D4 log shows DRM KMS debug messages of the form
> "DC: Cursor address is 0!", and the general syslog prints errors like
> "[drm:amdgpu_dm_plane_handle_cursor_update [amdgpu]] *ERROR* DC failed to
> set cursor attributes"
>
> I observe this bug on my dual-gpu Apple 2017 MacBookPro since Linux 4.11,
> where the kernels early EFI setup force-enables both the Intel iGPU and
> AMD dGPU. This leads to the AMD VRAM start being placed at 0x0 and then
> causes massive cursor problems. On earlier kernels, only the AMD dGPU was
> exposed, the Intel iGPU was disabled / hidden from Linux by EFI firmware.
> This caused the AMD gpu to place VRAM start at the non-zero
> address 0x000000F400000000, and the mouse cursor worked fine. I confirmed
> with umr that the mmMC_VM_FB_LOCATION register of my Polaris 11 gpu indee=
d
> read back 0x0000 in the lower 16 bits in the dual-gpu case, causing
> gmc_v8_0_vram_gtt_location() to setup start of VRAM domain at zero.
> I don't know what causes the change, but most likely the UEFI firmware
> somehow triggers this change before main kernel boot - calling into the
> VBIOS, I guess.
>
> There is at least one 8 months old bug report in AMD's issue tracker,
> reporting the same symptoms on other AMD setups, cfe.:
> https://gitlab.freedesktop.org/drm/amd/-/issues/4302
>
> So unless there is another more clean and reliable way to prevent the
> cursor bo from being placed at address zero, or unless the display hw
> is actually fine with address zero and those checks in DC are overly
> cautious, this needs to be fixed.
>
> Note that simply removing the "zero address -> reject cursor update"
> checks worked on my Polaris11 with DCE 11.2 display engine, fixing the
> cursor without causing any other obvious trouble. So maybe this is only
> a limitation of recent DCN engine versions, or a pointless check.
>
> How?
>
> Add a new AMD bo placement flag which requests bo pinning / placement at
> non-zero VRAM address only during amdgpu_bo_pin(). Use this flag for bo's
> on the cursor plane during amdgpu_dm_plane_helper_prepare_fb().
>
> I don't know if this is the best approach. It feels hacky, but it is the
> only approach I was able to do and it seems to work fine enough.
>
> If this is a good enough fix, it should be backported, but backporting
> to earlier than Linux 6.12 might be cumbersome due to changes to the
> amdgpu_bo_pin() implementation.

Thanks for tracking this down.  I think this patch would be cleaner
and easier to apply to older kernels.

Alex

>
> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> Tested-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> Cc: <stable@vger.kernel.org> # v6.12+
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c            | 11 +++++++++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  6 ++++--
>  include/uapi/drm/amdgpu_drm.h                         |  7 +++++++
>  3 files changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index 1fb956400696..97131fc8fbdf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -975,6 +975,17 @@ int amdgpu_bo_pin(struct amdgpu_bo *bo, u32 domain)
>                 if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
>                     bo->placements[i].mem_type =3D=3D TTM_PL_VRAM)
>                         bo->placements[i].flags |=3D TTM_PL_FLAG_CONTIGUO=
US;
> +
> +               /* Ensure bo is never pinned at amdgpu_bo_gpu_offset() =
=3D=3D 0
> +                * for VRAM allocations, as some of the DC code does not
> +                * like that, e.g., mouse cursor display image bo's.
> +                */
> +               if (bo->flags & AMDGPU_GEM_CREATE_VRAM_NON_ZERO_ADDRESS &=
&
> +                   bo->placements[i].mem_type =3D=3D TTM_PL_VRAM &&
> +                   !bo->placements[i].fpfn &&
> +                   !amdgpu_ttm_domain_start(adev, TTM_PL_VRAM)) {
> +                       bo->placements[i].fpfn =3D 1;
> +               }
>         }
>
>         r =3D ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 394880ec1078..cd7f53d3036c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -959,10 +959,12 @@ static int amdgpu_dm_plane_helper_prepare_fb(struct=
 drm_plane *plane,
>                 goto error_unlock;
>         }
>
> -       if (plane->type !=3D DRM_PLANE_TYPE_CURSOR)
> +       if (plane->type !=3D DRM_PLANE_TYPE_CURSOR) {
>                 domain =3D amdgpu_display_supported_domains(adev, rbo->fl=
ags);
> -       else
> +       } else {
>                 domain =3D AMDGPU_GEM_DOMAIN_VRAM;
> +               rbo->flags |=3D AMDGPU_GEM_CREATE_VRAM_NON_ZERO_ADDRESS;
> +       }
>
>         rbo->flags |=3D AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
>         r =3D amdgpu_bo_pin(rbo, domain);
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.=
h
> index 1d34daa0ebcd..6dee7653c54e 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -181,6 +181,13 @@ extern "C" {
>  #define AMDGPU_GEM_CREATE_EXT_COHERENT         (1 << 15)
>  /* Set PTE.D and recompress during GTT->VRAM moves according to TILING f=
lags. */
>  #define AMDGPU_GEM_CREATE_GFX12_DCC            (1 << 16)
> +/* Flag that BO must not be placed in VRAM domain at offset zero if the
> + * VRAM domain itself starts at address zero.
> + *
> + * Used internally to prevent placement of cursor image BO at that locat=
ion,
> + * as the display hardware doesn't like that for hardware cursors.
> + */
> +#define AMDGPU_GEM_CREATE_VRAM_NON_ZERO_ADDRESS (1 << 17)
>
>  struct drm_amdgpu_gem_create_in  {
>         /** the requested memory size */
> --
> 2.43.0
>

--000000000000b73185064af27275
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-keep-vga-memory-on-MacBooks-with-switchab.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-keep-vga-memory-on-MacBooks-with-switchab.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mlpbhyi90>
X-Attachment-Id: f_mlpbhyi90

RnJvbSBlMDU1YjRmNjg3OWMzNjIyMTdhMjRjMmQ2YWJhOTI1YWVmM2MxNzg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IE1vbiwgMTYgRmViIDIwMjYgMTA6MDI6MzIgLTA1MDAKU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kZ3B1OiBrZWVwIHZnYSBtZW1vcnkgb24gTWFjQm9va3Mgd2l0aCBzd2l0Y2hhYmxl
CiBncmFwaGljcwoKT24gSW50ZWwgTWFjQm9va1Byb3Mgd2l0aCBzd2l0Y2hhYmxlIGdyYXBoaWNz
LCB3aGVuIHRoZSBpR1BVCmlzIGVuYWJsZWQsIHRoZSBhZGRyZXNzIG9mIFZSQU0gZ2V0cyBwdXQg
YXQgMCBpbiB0aGUgR1BVJ3MKdmlydHVhbCBhZGRyZXNzIHNwYWNlLiAgVGhpcyBpcyBub24tc3Rh
bmRhcmQgYW5kIHNlZW1zIHRvIGNhdXNlCmlzc3VlcyB3aXRoIHRoZSBjdXJzb3IgaWYgaXQgc2Vu
ZHMgdXAgYXQgMC4gIFdlIGFscmVhZHkgcmVzZXJ2ZQpoYXZlIHRoZSBmcmFtZXdvcmsgdG8gcmVz
ZXJ2ZSBtZW1vcnkgYXQgMCBpbiB0aGUgYWRkcmVzcyBzcGFjZSwKc28gZW5hYmxlIGl0IGhlcmUg
aWYgdGhlIHZyYW0gc3RhcnQgYWRkcmVzcyBpcyAwLgoKQ2xvc2VzOiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvZHJtL2FtZC8tL2lzc3Vlcy80MzAyCkNjOiA8c3RhYmxlQHZnZXIua2Vy
bmVsLm9yZz4gIyB2Ni4xMisKQ2M6IE1hcmlvIEtsZWluZXIgPG1hcmlvLmtsZWluZXIuZGVAZ21h
aWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5jIHwgMTAg
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMKaW5kZXggNTZlNDYyMzhlNjcyMy4uNDRmZjgwMGE1
NzE1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYwpAQCAtMTA2Nyw2
ICsxMDY3LDE2IEBAIHZvaWQgYW1kZ3B1X2dtY19nZXRfdmJpb3NfYWxsb2NhdGlvbnMoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJY2FzZSBDSElQX1JFTk9JUjoKIAkJYWRldi0+bW1hbi5r
ZWVwX3N0b2xlbl92Z2FfbWVtb3J5ID0gdHJ1ZTsKIAkJYnJlYWs7CisJY2FzZSBDSElQX1BPTEFS
SVMxMDoKKwljYXNlIENISVBfUE9MQVJJUzExOgorCWNhc2UgQ0hJUF9QT0xBUklTMTI6CisJCS8q
IE1hY0Jvb2tQcm9zIHdpdGggc3dpdGNoYWJsZSBncmFwaGljcyBwdXQgVlJBTSBhdCAwIHdoZW4K
KwkJICogdGhlIGlHUFUgaXMgZW5hYmxlZCB3aGljaCByZXN1bHRzIGluIGN1cnNvciBpc3N1ZXMg
aWYKKwkJICogdGhlIGN1cnNvciBlbmRzIHVwIGF0IDAuICBSZXNlcnZlIHZyYW0gYXQgMCBpbiB0
aGF0IGNhc2UuCisJCSAqLworCQlpZiAoYWRldi0+Z21jLnZyYW1fc3RhcnQgPT0gMCkKKwkJCWFk
ZXYtPm1tYW4ua2VlcF9zdG9sZW5fdmdhX21lbW9yeSA9IHRydWU7CisJCWJyZWFrOwogCWRlZmF1
bHQ6CiAJCWFkZXYtPm1tYW4ua2VlcF9zdG9sZW5fdmdhX21lbW9yeSA9IGZhbHNlOwogCQlicmVh
azsKLS0gCjIuNTMuMAoK
--000000000000b73185064af27275--
