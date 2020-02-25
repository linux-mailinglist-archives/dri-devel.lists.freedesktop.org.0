Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BED16C349
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 15:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E974F6EAE1;
	Tue, 25 Feb 2020 14:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34076EAE1;
 Tue, 25 Feb 2020 14:06:57 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id m10so2304840wmc.0;
 Tue, 25 Feb 2020 06:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9znBi97Eml8UNeRzD3zdc9UYbjxEdpIg549jDA2IrLQ=;
 b=B40D7M6NP/5WLh7VkNSNxJwjoy0Uzw+B3j1HWaZxREBPcNgQxSxbNxLnCtOib96JQy
 tc/zLLH2HywYf0hX/kZ7f+Sxx20vI0hffnAH6ggV99QrKy+ln89+6l/05Lv0gee+CsY8
 Xwat6Ug3knNN0Y1Eao4EM3Yl88mR+KOtH6fz+1/2Hjgr5X3pFzQzpSiw3DfbZqtEEktD
 pt9432cSe6uCZRLeIR98QG2LeGPEFl3zrYAu/kgWLgdj9wXqOoLf4tqntKI/yEmUD7Tg
 rhSj6XO4vIyZBo+2WO3/RtSQUo/j0o4dJZukdMnmdCwuCMvZIZn04ERlQf69ImG/Obvu
 7uEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9znBi97Eml8UNeRzD3zdc9UYbjxEdpIg549jDA2IrLQ=;
 b=fQeWvB2KvCIzwE34Dec7CNxBO9zKQC2zifsBrnJf6YNIoy0jED9ly4Drh8vLoreT8x
 PjcwWmgf2n0Qg72pTtl6fwxs4s6nz21njAmSMrFt3g53ciHbnB+xfTH/nGs6thcGpPHi
 NprlY833pDabjJ/GMs3FmLRzJj6Iv6Bo6rzukm7FhrF3bnnd1xWLfAECuFxRVIJZaR54
 L8lGUdtcysLY28WcQH4mZhSpYM3be+Dk1ogDI7qupS9WC4amN2uQlniD+PD5CzC5hjVw
 wRPTfR4piXWYPXigIbssFEEFKqRBqDvV+Ce6HicqwT/sNcr71r/cGiIaQ3Cnn/9x3jBN
 k71A==
X-Gm-Message-State: APjAAAUiiQfzVY2FCpkflvsusgXlVGgkggh5rV4Mm38as6fUyhPFTy2l
 /eBzfl+AfgmOiJh7EG3v/b7A52XiV0vHQXqiGF6/IA==
X-Google-Smtp-Source: APXvYqwd8+p97ZtVefLIX2RnqbqlKBh/RbpyeUUZMVgWk3HlYwzCnbB+apaKghz7ppCXoYPGH8ZX27QSiax2nFVHxc0=
X-Received: by 2002:a1c:f009:: with SMTP id a9mr5482338wmb.73.1582639616378;
 Tue, 25 Feb 2020 06:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20200207211713.3870-1-alexander.deucher@amd.com>
 <22cf2c92-52a0-5e1a-e569-4fe421e38022@amd.com>
In-Reply-To: <22cf2c92-52a0-5e1a-e569-4fe421e38022@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Feb 2020 09:06:43 -0500
Message-ID: <CADnq5_M9yngJYmhOKiUvpR0H-e5yoVOrqwoim+_Ps63wY3QsRg@mail.gmail.com>
Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector registration
 (v3)
To: Harry Wentland <hwentlan@amd.com>
Content-Type: multipart/mixed; boundary="000000000000247b3f059f670057"
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
Cc: Alex Deucher <alexander.deucher@amd.com>, "Broadworth,
 Mark" <Mark.Broadworth@amd.com>, "Liu, Zhan" <Zhan.Liu@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000247b3f059f670057
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 24, 2020 at 4:09 PM Harry Wentland <hwentlan@amd.com> wrote:
>
> On 2020-02-07 4:17 p.m., Alex Deucher wrote:
> > Split into init and register functions to avoid a segfault
> > in some configs when the load/unload callbacks are removed.
> >
>
> Looks like MST is completely broken with this change with a NULL pointer
> dereference in drm_dp_aux_register.
>
> > v2:
> > - add back accidently dropped has_aux setting
> > - set dev in late_register
> >
> > v3:
> > - fix dp cec ordering
> >
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c   | 16 ++++++++++++++++
> >  drivers/gpu/drm/amd/amdgpu/atombios_dp.c         | 10 ++--------
> >  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  |  7 ++++++-
> >  3 files changed, 24 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > index ec1501e3a63a..f355d9a752d2 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > @@ -1461,6 +1461,20 @@ static enum drm_mode_status amdgpu_connector_dp_mode_valid(struct drm_connector
> >       return MODE_OK;
> >  }
> >
> > +static int
> > +amdgpu_connector_late_register(struct drm_connector *connector)
> > +{
> > +     struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
> > +     int r = 0;
> > +
> > +     if (amdgpu_connector->ddc_bus->has_aux) {
> > +             amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector->base.kdev;
> > +             r = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> > +     }
> > +
> > +     return r;
> > +}
> > +
> >  static const struct drm_connector_helper_funcs amdgpu_connector_dp_helper_funcs = {
> >       .get_modes = amdgpu_connector_dp_get_modes,
> >       .mode_valid = amdgpu_connector_dp_mode_valid,
> > @@ -1475,6 +1489,7 @@ static const struct drm_connector_funcs amdgpu_connector_dp_funcs = {
> >       .early_unregister = amdgpu_connector_unregister,
> >       .destroy = amdgpu_connector_destroy,
> >       .force = amdgpu_connector_dvi_force,
> > +     .late_register = amdgpu_connector_late_register,
> >  };
> >
> >  static const struct drm_connector_funcs amdgpu_connector_edp_funcs = {
> > @@ -1485,6 +1500,7 @@ static const struct drm_connector_funcs amdgpu_connector_edp_funcs = {
> >       .early_unregister = amdgpu_connector_unregister,
> >       .destroy = amdgpu_connector_destroy,
> >       .force = amdgpu_connector_dvi_force,
> > +     .late_register = amdgpu_connector_late_register,
> >  };
> >
> >  void
> > diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > index ea702a64f807..9b74cfdba7b8 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > @@ -186,16 +186,10 @@ amdgpu_atombios_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *m
> >
> >  void amdgpu_atombios_dp_aux_init(struct amdgpu_connector *amdgpu_connector)
> >  {
> > -     int ret;
> > -
> >       amdgpu_connector->ddc_bus->rec.hpd = amdgpu_connector->hpd.hpd;
> > -     amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector->base.kdev;
> >       amdgpu_connector->ddc_bus->aux.transfer = amdgpu_atombios_dp_aux_transfer;
> > -     ret = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> > -     if (!ret)
> > -             amdgpu_connector->ddc_bus->has_aux = true;
> > -
> > -     WARN(ret, "drm_dp_aux_register_i2c_bus() failed with error %d\n", ret);
> > +     drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
> > +     amdgpu_connector->ddc_bus->has_aux = true;
> >  }
> >
> >  /***** general DP utility functions *****/
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > index 3959c942c88b..d5b9e72f2649 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > @@ -155,6 +155,11 @@ amdgpu_dm_mst_connector_late_register(struct drm_connector *connector)
> >       struct amdgpu_dm_connector *amdgpu_dm_connector =
> >               to_amdgpu_dm_connector(connector);
> >       struct drm_dp_mst_port *port = amdgpu_dm_connector->port;
> > +     int r;
> > +
> > +     r = drm_dp_aux_register(&amdgpu_dm_connector->dm_dp_aux.aux);
>
> This calls drm_dp_aux_register_devnode which is also called later in
> drm_dp_mst_connector_late_register. Wonder if that's a problem.

Does this patch help?  I'm not too familiar with the MST code and I
don't have an MST monitor.

Alex


>
> Harry
>
> > +     if (r)
> > +             return r;
> >
> >  #if defined(CONFIG_DEBUG_FS)
> >       connector_debugfs_init(amdgpu_dm_connector);
> > @@ -484,7 +489,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
> >       aconnector->dm_dp_aux.aux.transfer = dm_dp_aux_transfer;
> >       aconnector->dm_dp_aux.ddc_service = aconnector->dc_link->ddc;
> >
> > -     drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
> > +     drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
> >       drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> >                                     &aconnector->base);
> >
> >

--000000000000247b3f059f670057
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-display-don-t-call-drm_dp_mst_connector_l.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-display-don-t-call-drm_dp_mst_connector_l.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k71yr6b40>
X-Attachment-Id: f_k71yr6b40

RnJvbSBhMTkyYjU0ZGYyNTBmMWFkNTA1N2IyZGQyNGUzMDQ2ZWM0NzZlZGQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFR1ZSwgMjUgRmViIDIwMjAgMDk6MDQ6NTIgLTA1MDAKU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kZ3B1L2Rpc3BsYXk6IGRvbid0IGNhbGwKIGRybV9kcF9tc3RfY29ubmVjdG9yX2xh
dGVfcmVnaXN0ZXIKCk5vdGhpbmcgZWxzZSBjYWxscyBpdC4gIE1heSBmaXggYSBjcmFzaCB3aXRo
IE1TVCBkaXNwbGF5cy4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbV9tc3RfdHlwZXMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMKaW5kZXggZDViOWU3MmYy
NjQ5Li4yZmFlZTMyMGY4NTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCkBAIC0xNjUsNyArMTY1
LDcgQEAgYW1kZ3B1X2RtX21zdF9jb25uZWN0b3JfbGF0ZV9yZWdpc3RlcihzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yKQogCWNvbm5lY3Rvcl9kZWJ1Z2ZzX2luaXQoYW1kZ3B1X2RtX2Nv
bm5lY3Rvcik7CiAjZW5kaWYKIAotCXJldHVybiBkcm1fZHBfbXN0X2Nvbm5lY3Rvcl9sYXRlX3Jl
Z2lzdGVyKGNvbm5lY3RvciwgcG9ydCk7CisJcmV0dXJuIHI7CiB9CiAKIHN0YXRpYyB2b2lkCi0t
IAoyLjI0LjEKCg==
--000000000000247b3f059f670057
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--000000000000247b3f059f670057--
