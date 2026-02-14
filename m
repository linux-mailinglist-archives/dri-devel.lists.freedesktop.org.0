Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCzrFnk8kmn2sAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 22:36:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2ED13FCBD
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 22:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC1210E0B5;
	Sun, 15 Feb 2026 21:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i/YepRGu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D30810E2A4
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 10:56:16 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-797a75e47afso9958727b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 02:56:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771066575; cv=none;
 d=google.com; s=arc-20240605;
 b=De8KtBu6pUCc2rnCsV+NqUXhmnQ6liNmFeveS+hDtJ+F22231VWdYXh3T3rgVmMNHZ
 jaWIP1Mg5d7rqsbOaYE/qLdDXVuAaoZHbX0+icIUvWEPEC5YT0sXKda5iRGsz69Dvn1E
 1aaAsqN3DXo+bMKyqnPJDiOKQ75I2jAcQCW1pOWvMTdl8C2p6fSFH6Ve/vAZTeBCsPgn
 K14X1WLMYZjEb2sgLYLtCkJkigtstBKwU99fL5FAdRam1pklyBAehsgtTSPcEb7aaxwu
 +cNqviqSCv4gWf+aWl0gbRBRGpFV3I/Hn8Wy8fLTVQcVzIs+aboeJBtwBiwqW6fNR8GH
 f3Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:dkim-signature;
 bh=8L4oWNjn98+MIKnP6WovLCu+A7/I1KYKwjVzhrIOunE=;
 fh=fpqrDP9AdDPOq3vrTNbr1AjTw5jhFxhFV+YNILpSAmg=;
 b=VAzwpCBLthus6npjiFRXE+aNuI/riZ0MkLblbseFN3sqtTRZeNLQiRD4HcZjnRp0hO
 YDbGjqrYd//S3834utDXN9zfD224SV3ltJKQhNuedRgkdAKnPpU7a1d4M6ugzJPgVhF7
 vB+Zcdlrm1VvflnbjlgJc1wMA9HBNyGuY2y/cR2ZWOpFx1FDhTr0rOg7ZzQ8BmMqg5Dd
 fe3cmkm1giSshlzBV5Vao4xfzY/OMQWRxuqmva1WZpxDTT4XIxvyFzCNmVjWfj+l9Izw
 CghEzN4jurwLNFrSdl8AmrpUViMYBU0BdjdGFh62/2+KOUGO+puMdMiwF8QN1pj1KnB5
 Xv4Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771066575; x=1771671375; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8L4oWNjn98+MIKnP6WovLCu+A7/I1KYKwjVzhrIOunE=;
 b=i/YepRGuZddrPRqVGEGpSTqXCrs0wYBksOEpu354X1oxzfunItiH77UTz6g18HO8br
 zHUdeVhWLaa93QX4NI115z2tsegJuHiCaTaObu9zzdFA0o6RJ+ZW3/adKxRJGt1lwVOe
 LMiWE3udhwpAIlYt6N4LkNIGkQ+B1G58zyMipQIi5mzk94o1lF40u2eY67sFcMce/P1N
 9aBNDq0zVGm4L99Vr+fdegDGmjXtdQP7CMJLn94IJE5nXfSRUT0LvTaXVPZSL22qETSY
 VLhO3IrfPXRQi8VQolBQeRdFz6u75EFCMfOiOWt9EzBZ5n2JE9sO3lIy8aJ5RKIN5dkx
 sF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771066575; x=1771671375;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8L4oWNjn98+MIKnP6WovLCu+A7/I1KYKwjVzhrIOunE=;
 b=V+5ICVx2B7hA7uCfpDDbQy+LrGD9ttdY5mVkkkPm3D0R/a2vqVQKL6yLm3EutsbvkN
 SItH67Ek6ROf/RHu51r/4ukfYTnijJqwOOqI+jeTnNC0xG52gEdRc84cgi94tk2yWUJB
 YGrUQO2AXjwfbJ0c0jLMA6+NjkTwMCRDeBCycWySmLkAOo8Fbwm6xBoVvqb7FDRPW0I+
 1eaY+Xe5n1AEHda2VN+ZFYNuPJPa0CKDJWhQWOi4b6TYfce49N8oBuo2/+bxGFRUc7bo
 cVhnE+sl77hn4VCSbMefCIYTlMH1bLHlVH+A6lr5Yfv5/or3G5px9D1S1CceiIFqoL3I
 CQCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaQOyj8Y8uTgCS9eyxD4jGQ+O3l7e9qJAWGGReY3kd3r35i/ogSQbt0lPDqXikF+pvFLO1/SfzdKY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBW8esPYzEA5OVFWKB7Zjn5pxLHaImr6kN8PX2IPvroAgCWAyK
 qYpCKsUdiLfj5852CgCjIBybSu3PNDR7OrtcHr7HEoQixamWoPyoauCS1V3rOLFnLvt92CqZTBo
 /Q+tX1WrQiXErNjue8DlSLhD3ofDmi7o=
X-Gm-Gg: AZuq6aIGJK5cYrQM5TEis4p2wq2VAEkVUzsD90vn9NtrDiq8dWkNeHaswUndUtPHVrS
 ndbe9538IyIuJJ+25qwZQjn42MVjgoMDSVSDNnWNjLr4ECK5tUorAkrb/1P0CiasEZ3fyCSwP/P
 tf5YNHzfrlnIgsaqAZsSssYur5XK7m0jonsovvLbeWAmpQFy0W87Ju2eQny+xZD4tw0LhaP+U9j
 hHwff7hnNkGYusHEVfKn1vgRSINE4ivvFyqpv4zGHo/53ebl0Bq7XsNxN6KbFbvSqhyTLKyaRaD
 22GUmwfhmE1h2t4NHHv8snyM021PjH1lb+T1sKEt/4r7bssayg==
X-Received: by 2002:a05:690c:60c2:b0:787:f755:5ae5 with SMTP id
 00721157ae682-797a0ce7ab6mr38711657b3.40.1771066575179; Sat, 14 Feb 2026
 02:56:15 -0800 (PST)
MIME-Version: 1.0
From: Mykhailo Kalashnikov <mihal.kalashnikov@gmail.com>
Date: Sat, 14 Feb 2026 11:56:04 +0100
X-Gm-Features: AZwV_QhIq3MeSwFtZwMis-nNk6ik_7bileeN_GoTxTk4AFFQGI-Q_u8U-3ouN7M
Message-ID: <CA+PMN8Hwsb=kNruwNcctX8LgcVqbUkPi52wQJu7ppu9VKamAyA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/amdgpu: Add "pixel_encoding" DRM connector
 property support for amdgpu
To: wiagn233@outlook.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 15 Feb 2026 21:36:42 +0000
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DATE_IN_PAST(1.00)[34];
	FAKE_REPLY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:wiagn233@outlook.com,m:amd-gfx@lists.freedesktop.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mihalkalashnikov@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mihalkalashnikov@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0C2ED13FCBD
X-Rspamd-Action: no action

Hi Shengyu,

I've been testing your pixel_encoding patch series (v2) on kernel 6.18.5
with an AMD RX 9070 XT (gfx1201/Navi 48) and found two bugs where
PIXEL_ENCODING_YCBCR422 handling is missing.

Both get_connector_state_pixel_encoding() and dc_pixel_encoding_to_drm_prop=
()
handle RGB, YCBCR444, and YCBCR420 but are missing the YCBCR422 case.
This causes YCbCr 4:2:2 to never be applied =E2=80=94 the switch falls thro=
ugh to
default, get_connector_state_pixel_encoding() returns false, and auto-selec=
t
picks RGB instead.

Fix 1: get_connector_state_pixel_encoding() missing YCBCR422
-------------------------------------------------------------

  case PIXEL_ENCODING_YCBCR444:
  ret =3D (info->color_formats & DRM_COLOR_FORMAT_YCBCR444);
  break;
+ case PIXEL_ENCODING_YCBCR422:
+ ret =3D (info->color_formats & DRM_COLOR_FORMAT_YCBCR422);
+ break;
  case PIXEL_ENCODING_YCBCR420:
  ret =3D drm_mode_is_420(info, mode_in);
  break;

Fix 2: dc_pixel_encoding_to_drm_prop() missing YCBCR422
--------------------------------------------------------

  case PIXEL_ENCODING_YCBCR444:
  propval =3D DRM_COLOR_FORMAT_YCBCR444;
  break;
+ case PIXEL_ENCODING_YCBCR422:
+ propval =3D DRM_COLOR_FORMAT_YCBCR422;
+ break;
  case PIXEL_ENCODING_YCBCR420:
  propval =3D DRM_COLOR_FORMAT_YCBCR420;
  break;

Both are in drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c.

Tested with amdgpu.pixel_encoding=3DDP-2:ycbcr422 on the following setup:

  GPU:     AMD RX 9070 XT (gfx1201 / Navi 48)
  Kernel:  6.18.5
  KVM:     TESmart HKD402-M24 (DP 1.4 in, HDMI 2.1 out)
  Monitor: Dell AW3225QF (HDMI 2.1)
  Link:    GPU DP 1.4 -> KVM -> HDMI 2.1 -> Monitor

Without these fixes, the module parameter is accepted but ignored =E2=80=94=
 display
stays in RGB. With both fixes, YCbCr 4:2:2 is correctly applied and
confirmed via modetest (pixel encoding property value: 4).

Thanks for the patch series =E2=80=94 it fills an important gap for users w=
ith
DP-to-HDMI KVM setups who need non-RGB pixel encoding.

Regards,
Mykhailo Kalashnikov
