Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26B6A68D2D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 13:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F58010E35A;
	Wed, 19 Mar 2025 12:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=verizon.net header.i=@verizon.net header.b="J/1+REMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic315-13.consmr.mail.bf2.yahoo.com
 (sonic315-13.consmr.mail.bf2.yahoo.com [74.6.134.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151C810E35A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.net; s=a2048;
 t=1742388610; bh=LazP9LWEwwBPm2aXkkhH2J1uSZDN5hJd/5cZgajdVsY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=J/1+REMHPBw/woQY8SQ3EK+OXLabDW5yRVvdiyfEsKXdo35612h4XuU7G4QW62BzEV5BLHQzA/lYlXos40Iqr5GrFvhaArXCeA97yiHpn5qXTQ4ZGYWN9qAVkV5NfzbEdQr67gSYmsTRl2q73T86YAFHxr6dnp0WX65egS8iRGhZmTmQPgWNa/FpITORO7xLYI84YyuO09oWExH6tenKvxzqA5vtGwhqrLbwwS0J41J1yl5uEzXgge798MDz0aUIOCE2VhYxIEz3R0skW+EX2XCS0c+0eFeNQBGL2UDbikL5+YYaLoNr1Ad8gL+DApCHkOEHz4hVytwGzZ9vJvSV/w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1742388610; bh=n97ks2I9PwJiRNFlvaJjEpIO7wRYEoR4Gc/bxt3fQ9A=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=gMEXjpjZUb5O7AzvvAmmEjVJ0SvGNznhA2fVvqCYOQ3lfpZH7vmnWiEuaPVpnJ3zW8vSnS2Y6YKtv1fCLZCZTOE6+ye5g17MdpY88ycTtF5FyRsYYl59kthZGNi4F0LcCbXvZBV66agwWpSaKkLXe9fweSQ+je9cfMxWwBfEhguDseDshi45W2PqXF13NKcLBbAUG6Irqt+3mWXX2metkw8yvekqRdl2oVauw2z0xOvHrQmJmbJhymN9Ie9cR7ao8SAPAFTu0kYdkWrItdWUM1D+MxpTXlR+6Nt3seCkus9dpmhsSwDfs52WNp9XpecUxylCZxgDOqiUecPXCh2ejw==
X-YMail-OSG: ezCJy1MVM1mqCVtiI7WduURWft_Y_aEqOsdHHSeBH1YNSpAPzSto.DiIu8sL_ca
 k4JyhuSxNh0OeOHUfirls8n7zIFb8dQSkpGpZupUtVrY7Nz1tJiJ2JhBxbH1o92AJ6WQyAEGTtzY
 xwpzJ4L3FlL97bgXCy8lOZkm2z5jfINtIa7CvUi.17a1Ve9FLt_R5nPbNHTF0OlICKnScNHItRej
 huGYXpTEDUQEFeKPoPU4TS6xNDDxU2mUlE62JZtTUl1C7KhOe8TiDbDyscUQPiEEleHYKuqJ3Vte
 buimCGttZcNCplNr4OLZpyZZWGC2QzlEnNJf1c0Sx8eR3Ndrmv9h0NK60orsMmCgUSlC_kpKOxzN
 3Z9liW2FVzvLCAIev28yMW7ZrKNDPdX52SU44tKgQZ4F_sc74QZ.JHfDVtWDEk25iOuhtY.how14
 NCaOZ_XcjI7Q_Mo4wxBCEcex.0B9mHAaS8iGA4aWyg3G3XvFP2xvhaGipFZFGH3nCiFCbqYFc5k_
 GIh.lOumgGaqep4.X8JtnyJxGYSuCWpNhP7d4_PzDwzhBX8GuxcRdhDyr8N.jaDZRoDl7A33oc3S
 ooH.29YBx5JDdDGI_sya6RtfoAqBg2GPvmdNRFBzpSUCMPUJSryxkm2bWZpsdt5bsPFXcqIKbNT.
 u1O6O2h09vojrbtCIkyCBqMLcVN_nLXYaiwfwHMD.KJdMmNObYkRwMqS4JbJZZRvtBRECl3k0XJi
 MUcEaiHLCv8OhpPwOnQRax5WxLb6PfZQJQ9ak8JmZaqBfrqbTl_KT18VF.sWx39DUyMNqaWHxcSC
 bpfgKZyNj60sMBMkr2F57IOjCigVegr1r64xyQJvi8utYjfmOODT0T9P89SoaddzqzJSSrMlYRRi
 4A1q48f1iexzvm5hIxxI9kLA3mypXfmtegfWNl2OqO0.LHn9UXiplDzlCxRlyhcEUY4XV9xSsYGz
 7vdqVQnWLopzQI.oQeaCaOeyg4NvVg8bYdtqp9LEtcBDsXvuSfDZGwVFd2uw0WQwyoxXNgDfSVC3
 xrf2F_z0oryh7tcUdTM8iw5siB9jynn8BdBRYYqUzkRKiTe.IUplraHfuH6kOjyBOgkAWOlqDB5V
 aPonVZKdtReqF0PekbWYlRs4ZMucBghK_zm0YlTXCFDREJs7Uirran2PZzS_QC9bUF326lgXWeiz
 cItHYKGHTAXvOnsCvVozN1jO563_vCLJO4FZAd0uJ3uS.oNfmg2ZrwZ0wLc8tTHsFdh9mcx8cH3n
 p75IwE43CqjArN6vmwHi.t4pkanrYNpwXLYBXs.TrmjhHaI5QaZI0A10HaWR67jIuVmFLgQjolCh
 .E3QqNgiYf8PgYKnpLeE920A0kEU0J1PXmLBnhM7ZFw6vTvSlaSnvpnyTZ3kWLi2Gbd7W_VcTbgp
 dIKVvmEO2n2K1BtLGs5P_E5np8kqo0xHPJugV9tIJoe.Yw.fbhXYL3qBcOuiMWtFfy9VI3RZpHfF
 FnMFz76PsCpIsQ0sW6GadsMaNtc80OL4MAxI0gIpG1CBgnIPx4ZIKry5TEp8MDaXmk6NzHMd9sfn
 ewweciYMdfxIFmxkqLHlif0GOtB4OR4ryo35mx.T8MvIwdll8tCa.oGgjVGfnNFUrgy_cGchXC17
 kXb.079JPNGB1FComTmX1XhR1YS9yeJMYwhXhFkht3m6ChC0RjJYpHmixvzy50bIFsX8GLrXDeE6
 ywIVjPIsYICIJjEvnrR6M73aoHuj8795I8ZjMsJ_AKZjN2nPg3odw1OiVOWjix4Fi95hHh32A2lJ
 3a_lG_dEbNUH8CObZz6QKK0b78wwdqUdhlZ886XNF4PL0LCyMSYfAfibnP.LrX5fvrbZQj8WVgJQ
 da64l4fcF2EzkqxINAWPKbYG1PpABzqqaNhidwNsarzX2kqQvpSYZ9gURgwn666Sqz523qZkL_KG
 RgmveeR5wMYI_TU2N36FYnMTY6PDNM0FOEDfuLs2qxd1xHZk06XbrF0l.qg6q2flqf0q_Lj0GcZN
 wspJbpx0bkc4vi9Kd.aaFJztchLCRHnsarnDX_wAEyM4dsUcZ8h16p4HjDh5BQhNKkobzqaDXScW
 zeE7m_896O8ZY02MoVmzBgcun3w_bvhPm3JmHM_Ox3xMw38jq.AXCls2y6XAaNo4uMZoaHRsMl8W
 pGcNO9DCgYWEYPte_rzhDLzUPu3g57dCNp2o0eVmzCSH2q5C6IavDdkApiuVo_wQcArajCppyPjx
 kdQWcef4mwbqPhAZUMnXD1o42CSbDFfaCoNiGO5cTwSjMFnfPrbXk_ZT1jvp.J030R.qEhw--
X-Sonic-MF: <bluescreen_avenger@verizon.net>
X-Sonic-ID: 45473f8b-f4c9-40ef-a8da-cd1bdde68e7d
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.bf2.yahoo.com with HTTP; Wed, 19 Mar 2025 12:50:10 +0000
Received: by hermes--production-bf1-778fbd5fb4-2x4m4 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 16a8a773365638e8570b04e58280904c; 
 Wed, 19 Mar 2025 12:50:06 +0000 (UTC)
From: nerdopolis <bluescreen_avenger@verizon.net>
To: javierm@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/18] drm: Provide helpers for system framebuffers and add
 efidrm/vesadrm
Date: Wed, 19 Mar 2025 08:50:04 -0400
Message-ID: <7990728.29KlJPOoH8@nerdopolis2>
In-Reply-To: <20250319083021.6472-1-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailer: WebService/1.1.23435
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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

On Wednesday, March 19, 2025 3:44:59 AM EDT Thomas Zimmermann wrote:
> This series simplifies the existing ofdrm and simepldrm drivers,
> and adds new drivers for EFI- and VESA-based framebuffers. Existing
> drivers for system framebuffers, ofdrm and simpledrm, share much of
> their mode-setting pipeline. The major difference between the two
> drivers is in how they retrieve the framebuffer from the systems.
> Hence, it makes sense to share some of the pipeline implementation.
> With the shared helpers in place, we can then add dedicated drivers
> for EFI and VESA easily.
> 
> Patches 1 to 3 clean up obsolete artifacts from ofdrm and simpledrm.
> 
> Patch 4 moves both drivers from tiny/ into their own subdirectory
> sysfb/. The name aligns with the naming in drivers/firmware/sysfb.c
> to signal the connection. It's the firmware code that creates most
> of the system-framebuffer devices that these drivers operate on. The
> patch also adds a separate menu in Kconfig.
> 
> Patches 5 to 11 unify the mode-setting pipeline between ofdrm and
> simpledrm. Either both drivers already use the same implementation
> or they can easily do so. There've been previous attempts to unify
> some of the drivers' code, but with little success. This time the
> helpers will be shared among 4 drivers, so it's already much more
> successful than before.
> 
> Patch 12 adds EDID support to ofdrm. The EDID data can be found in
> some Macintosh's DeviceTree next to the framebuffer configuration.
> EDID support will be useful for EFI and VESA as well.
> 
> Patch 13 adds another helper for screen_info that will be required
> by EFI and VESA drivers.
> 
> Patch 14 and 15 add efidrm, a DRM driver that operates on EFI-provided
> framebuffers. It uses the shared sysfb helpers. The immediate benefit
> over simpledrm is the support for EFI's various types of memory caching
> on the framebuffer. Simpledrm only supported WriteCombine caching.
> There's also EDID support if the kernel's edid_info has been initialized.
> This feature needs to be implemented in the kernel's efistub library.
> 
> Patches 16 to 18 add vesadrm, a DRM driver that operates in VESA-
> provided framebuffers. It is very much like efidrm, but tailored
> towards VESA features. It has EDID support and there's a patch at [1]
> for grub to provide the data as part of the kernel's boot parameters.
> Vesadrm also supports gamma ramps. Together with EDID, this allows
> for gamma correction and night mode. Gnome already does that.
> 
> Future directions: Efidrm requires EDID data that has to be provided
> by the efistub library. There is an EFI call to do so. Vesadrm currently
> requires a discrete color mode. Support for palette modes can be added
> later. There's still a bit of code duplication among palette handling.
> We have more drivers that use similar code for palette LUTs, such as
> ast and mgag200. We should try to provide generic palette helpers for
> all these drivers.
> 
> This series has been tested on various devices that require the provided
> drivers.
> 
> [1] https://build.opensuse.org/projects/home:tdz:branches:Base:System/packages/grub2/files/grub2-provide-edid.patch?expand=1
> 
> Thomas Zimmermann (18):
>   drm/ofdrm: Remove struct ofdrm_device.pdev
>   drm/ofdrm: Open-code drm_simple_encoder_init()
>   drm/simpledrm: Remove struct simpledrm_device.nformats
>   drm: Move sysfb drivers into separate subdirectory
>   drm/sysfb: Add struct drm_sysfb_device
>   drm/sysfb: Provide single mode-init helper
>   drm/sysfb: Merge mode-config functions
>   drm/sysfb: Merge connector functions
>   drm/sysfb: Maintain CRTC state in struct drm_sysfb_crtc_state
>   drm/sysfb: Merge CRTC functions
>   drm/sysfb: Merge primary-plane functions
>   drm/sysfb: ofdrm: Add EDID support
>   firmware: sysfb: Move bpp-depth calculation into screen_info helper
>   drm/sysfb: Add efidrm for EFI displays
>   drm/sysfb: efidrm: Add EDID support
>   drm/sysfb: Add vesadrm for VESA displays
>   drm/sysfb: vesadrm: Add EDID support
>   drm/sysfb: vesadrm: Add gamma correction
> 
>  MAINTAINERS                                 |   3 +-
>  drivers/firmware/sysfb_simplefb.c           |  31 +-
>  drivers/gpu/drm/Kconfig                     |   2 +
>  drivers/gpu/drm/Makefile                    |   1 +
>  drivers/gpu/drm/sysfb/Kconfig               |  76 +++
>  drivers/gpu/drm/sysfb/Makefile              |   8 +
>  drivers/gpu/drm/sysfb/drm_sysfb_helper.c    | 319 ++++++++++
>  drivers/gpu/drm/sysfb/drm_sysfb_helper.h    | 136 ++++
>  drivers/gpu/drm/sysfb/efidrm.c              | 495 +++++++++++++++
>  drivers/gpu/drm/{tiny => sysfb}/ofdrm.c     | 364 ++---------
>  drivers/gpu/drm/{tiny => sysfb}/simpledrm.c | 237 +------
>  drivers/gpu/drm/sysfb/vesadrm.c             | 660 ++++++++++++++++++++
>  drivers/gpu/drm/tiny/Kconfig                |  32 -
>  drivers/gpu/drm/tiny/Makefile               |   2 -
>  drivers/video/screen_info_generic.c         |  36 ++
>  include/linux/screen_info.h                 |   9 +
>  include/video/pixel_format.h                |  41 ++
>  17 files changed, 1885 insertions(+), 567 deletions(-)
>  create mode 100644 drivers/gpu/drm/sysfb/Kconfig
>  create mode 100644 drivers/gpu/drm/sysfb/Makefile
>  create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb_helper.c
>  create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb_helper.h
>  create mode 100644 drivers/gpu/drm/sysfb/efidrm.c
>  rename drivers/gpu/drm/{tiny => sysfb}/ofdrm.c (75%)
>  rename drivers/gpu/drm/{tiny => sysfb}/simpledrm.c (76%)
>  create mode 100644 drivers/gpu/drm/sysfb/vesadrm.c
>  create mode 100644 include/video/pixel_format.h
> 
> 
FYI When this gets merged, 
https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/hw/xfree86/common/xf86platformBus.c?ref_type=heads#L589
might need to be updated to add exceptions for vesadrm and efidrm like there
is for simpledrm.
I am willing to open a merge request, but freedesktop is readonly for now
during their migration.



