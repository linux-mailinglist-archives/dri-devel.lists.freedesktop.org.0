Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KkRC/6tqWn+CAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 17:23:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BE0215627
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 17:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B91F10EC40;
	Thu,  5 Mar 2026 16:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y36ipOrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F6C10E2CA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 16:23:21 +0000 (UTC)
Received: by mail-dl1-f52.google.com with SMTP id
 a92af1059eb24-127148c2112so494783c88.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 08:23:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772727801; cv=none;
 d=google.com; s=arc-20240605;
 b=YrNVBGhZ9jQZpp+mvX1qvaQqRrccDmJKx8qEeRlMTsl+H8oGJ4og3b+H+hwmnm1JL/
 dA4HmHq4YrOQUCtD8/nAhjw5KKZrBmksM6a8JcX8xMyL1fckgozlLzTkHEMmLMiUQ+ej
 Tuk3Q6R91sv/QzacsQwibYUv0jKKhbLBfvJARW6vDlt/U1crDujOqp+nK/PIoeTmejti
 Om1ypLSeyjUmEPIqSYjt0WQKF7TD0QBf4rUKCm/omhUfV6UF1pp/57MMB0IOFpAdFNX7
 N2lyg2wSo1KM5GL0rMVTF4dgk5tHWKYXkn+FbtBid7Sy/bQ6y/xEtEsb0vIRiiAUWR4A
 bwyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=W6F+nfMUPxF4a7E27ABQJs8vgRwzPBeDB+h+6m9Jqk4=;
 fh=Aey0hfLO0Q+4BGC1xARYKUXBr/5PI1+AN2C766uFWI8=;
 b=WHQ29ZKMr4GdfqYoIxMzkKQ0X/IWJNibDNqfFzohNPgv+FbgTZnL94A+6vmWsdZ3nQ
 WdFgoj6o9V40KNRze7PzXdLEI724h+PV1IPL1LWHlx8Ldrea4IWahhWt9Uitj7Gxc1Mn
 zSYigJ1k7J2w3IJbgG96yOdqx8SW9Iyaj/6+vIORb7O2IaMPP8QZdHndAqtfXQi6b7MH
 6IJFNJHxBQPN4M/MVckxFAiZpeQv0kvoXt/rPRSzWz1dmuWxkpWf3CD0vi0goCq7iVX8
 SVM/7bXsKM3j/50t4Amx0x/Gk3edYBncE/ruYmURJBZNeNePzvuDJXpjlG08l1KNM85O
 zQIA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772727801; x=1773332601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6F+nfMUPxF4a7E27ABQJs8vgRwzPBeDB+h+6m9Jqk4=;
 b=Y36ipOrS0vbe0nVkZQFB5D1wlIzGS2MUqh3ZAJCnhBVmX6ub78Y5t9kNfiDq2FvoBH
 ANfgEZ1QhHfVRzvU0argFQGYLftdcrZyrEhbDdrHhnO+XphkYwFQFs9KqqfI1G8Llp73
 qfeSNNe0o4S+E8pphlgPL3mIE0zqB2UOmTMiiHGBOPyQJDdR7cizzbgeRXVSGIlq7jFO
 iHKeAyKaEKrjnmOIpcCtKDuSGJyM1uxhr+mtodkSRKATxE6Fzo6wgerDwrO2u+l0rDV4
 PjG5GBB7iJlchyb6N1lP8CAq+OIlPJr0A4cb1xlho7Hu8wgnwyG9wGePs92UPrco1qe2
 5JUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772727801; x=1773332601;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W6F+nfMUPxF4a7E27ABQJs8vgRwzPBeDB+h+6m9Jqk4=;
 b=KbL6xAh9t35sbpZYVO3gTAaDY9SPOwOwcBd+RkE/2/reoqm0bdXkNzrOrJDFYLgLBS
 8PCleishjSl3+jTITzElf2o/6DInHv7nUugadj48PljXQdCQMrcxvtYgqREkaQOGdtaZ
 sFo0ZKFoz3nE4XaIZE5hYJSu27jf1YxBRXRV3/JkS2V7tO/PvE7m4nOmobKfsEsKSM+0
 p5BJIxwlK7CoPG0LTDnn2Uhq+zBppEUAmJtOZOeqaKNGa2CyFVsBpjMqkIBOKfykLmR4
 M74Vbvo5WzeYitFOKThr7ZjkCnsVXRkZKlO/3q7ks1go9NfYO8Kf/CLHI9t4phn6992n
 iORg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0GMF4lf3a155BZzB/sHcPjc8gjrBqbBa26/YzRjL5PkUl1fIIqp/ILqrd/piH+HqgGUpperIY9y8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPg/X4eSiYNGJZ++MktMvUHYliDYND0LVNnBLcs2KyINkvGCvX
 qrAGN/AIqi1/I2z9Nc2IvMAdZxHfj72zHGt0nOVmgdrrwvPX2QbkIhRYEpHXZN8PSgxxvNz1Hl3
 RlMbsfOjk9cJZQXU6u/9dgt1gTuUJR1w=
X-Gm-Gg: ATEYQzxqsb3sk+82A/Ffh7Fvv8/RnU9Ll/Yq6uuZjDBMpLYo7kEldbosJH67NZq+wzn
 jrHu7MCDlwFV9hMsYdgpPxdxmOuSWAuB+Qt/La0Liq2agUxTjSSJ1T7nQv4sbOdu4MSxQZzKXNU
 wQLlr/f5O8/2hVii5D8e/aEC/kgGinttX+p6oVCsAF/E8aFNfNETb3EivuQpsfUs5Jf2YVTUISx
 o9T1nQnYa0c3L2ifdD+ZuxENWNdRPpIJPAtpeH+kEKNOx/mSoLwQvrP8Osui+tmNPdz0OtX20jt
 Fpdqd0b9tbSHd2h3+IAWLHFkNk3S1hASB0A64a7iwVZwU0gxj5ld6alOKVhuiYjyFXYHXa1ISYr
 7yJiT
X-Received: by 2002:a05:7022:6b82:b0:11b:65e:f33 with SMTP id
 a92af1059eb24-128b70664bbmr1490910c88.1.1772727800809; Thu, 05 Mar 2026
 08:23:20 -0800 (PST)
MIME-Version: 1.0
References: <20260303211823.76631-1-jpeisach@ubuntu.com>
 <20260303211823.76631-3-jpeisach@ubuntu.com>
In-Reply-To: <20260303211823.76631-3-jpeisach@ubuntu.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 5 Mar 2026 11:23:09 -0500
X-Gm-Features: AaiRm53O0Gz_IyWjrfwtBJvNGedJNJLK6tD16jvmpNK_3Hj0veX7H5OdrmEZeHM
Message-ID: <CADnq5_MioRPUgwWeRWBQLMVvjPjFLL8Ub+w6dQCkj84xUqu1Tw@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/2] drm/amdgpu/amdgpu_connectors: remove
 amdgpu_connector_free_edid
To: Joshua Peisach <jpeisach@ubuntu.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
X-Rspamd-Queue-Id: C1BE0215627
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:jpeisach@ubuntu.com,m:amd-gfx@lists.freedesktop.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,ubuntu.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Applied the series.  Thanks!

Alex

On Tue, Mar 3, 2026 at 4:19=E2=80=AFPM Joshua Peisach <jpeisach@ubuntu.com>=
 wrote:
>
> Now that we are using struct drm_edid, we can just call drm_edid_free
> directly. Remove the function and update calls to drm_edid_free.
>
> Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 22 ++++++-------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_connectors.c
> index 6336cadad..aabe9d58c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -297,14 +297,6 @@ static void amdgpu_connector_get_edid(struct drm_con=
nector *connector)
>         }
>  }
>
> -static void amdgpu_connector_free_edid(struct drm_connector *connector)
> -{
> -       struct amdgpu_connector *amdgpu_connector =3D to_amdgpu_connector=
(connector);
> -
> -       kfree(amdgpu_connector->edid);
> -       amdgpu_connector->edid =3D NULL;
> -}
> -
>  static int amdgpu_connector_ddc_get_modes(struct drm_connector *connecto=
r)
>  {
>         struct amdgpu_connector *amdgpu_connector =3D to_amdgpu_connector=
(connector);
> @@ -754,7 +746,7 @@ static void amdgpu_connector_destroy(struct drm_conne=
ctor *connector)
>  {
>         struct amdgpu_connector *amdgpu_connector =3D to_amdgpu_connector=
(connector);
>
> -       amdgpu_connector_free_edid(connector);
> +       drm_edid_free(amdgpu_connector->edid);
>         kfree(amdgpu_connector->con_priv);
>         drm_connector_unregister(connector);
>         drm_connector_cleanup(connector);
> @@ -873,7 +865,7 @@ amdgpu_connector_vga_detect(struct drm_connector *con=
nector, bool force)
>                 dret =3D amdgpu_display_ddc_probe(amdgpu_connector, false=
);
>         if (dret) {
>                 amdgpu_connector->detected_by_load =3D false;
> -               amdgpu_connector_free_edid(connector);
> +               drm_edid_free(amdgpu_connector->edid);
>                 amdgpu_connector_get_edid(connector);
>
>                 if (!amdgpu_connector->edid) {
> @@ -889,7 +881,7 @@ amdgpu_connector_vga_detect(struct drm_connector *con=
nector, bool force)
>                          * with a shared ddc line (often vga + hdmi)
>                          */
>                         if (amdgpu_connector->use_digital && amdgpu_conne=
ctor->shared_ddc) {
> -                               amdgpu_connector_free_edid(connector);
> +                               drm_edid_free(amdgpu_connector->edid);
>                                 ret =3D connector_status_disconnected;
>                         } else {
>                                 ret =3D connector_status_connected;
> @@ -984,7 +976,7 @@ static void amdgpu_connector_shared_ddc(enum drm_conn=
ector_status *status,
>                                         /* hpd is our only option in this=
 case */
>                                         if (!amdgpu_display_hpd_sense(ade=
v,
>                                                                       amd=
gpu_connector->hpd.hpd)) {
> -                                               amdgpu_connector_free_edi=
d(connector);
> +                                               drm_edid_free(amdgpu_conn=
ector->edid);
>                                                 *status =3D connector_sta=
tus_disconnected;
>                                         }
>                                 }
> @@ -1053,7 +1045,7 @@ amdgpu_connector_dvi_detect(struct drm_connector *c=
onnector, bool force)
>         }
>         if (dret) {
>                 amdgpu_connector->detected_by_load =3D false;
> -               amdgpu_connector_free_edid(connector);
> +               drm_edid_free(amdgpu_connector->edid);
>                 amdgpu_connector_get_edid(connector);
>
>                 if (!amdgpu_connector->edid) {
> @@ -1069,7 +1061,7 @@ amdgpu_connector_dvi_detect(struct drm_connector *c=
onnector, bool force)
>                          * with a shared ddc line (often vga + hdmi)
>                          */
>                         if ((!amdgpu_connector->use_digital) && amdgpu_co=
nnector->shared_ddc) {
> -                               amdgpu_connector_free_edid(connector);
> +                               drm_edid_free(amdgpu_connector->edid);
>                                 ret =3D connector_status_disconnected;
>                         } else {
>                                 ret =3D connector_status_connected;
> @@ -1417,7 +1409,7 @@ amdgpu_connector_dp_detect(struct drm_connector *co=
nnector, bool force)
>                 goto out;
>         }
>
> -       amdgpu_connector_free_edid(connector);
> +       drm_edid_free(amdgpu_connector->edid);
>
>         if ((connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP) ||
>             (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_LVDS)) {
> --
> 2.51.0
>
