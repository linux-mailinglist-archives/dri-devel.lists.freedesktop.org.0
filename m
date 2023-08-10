Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD337774D7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 11:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C321010E177;
	Thu, 10 Aug 2023 09:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9132610E177
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 09:44:26 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-63d2b7d77bfso4386716d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 02:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vt-edu.20221208.gappssmtp.com; s=20221208; t=1691660665; x=1692265465;
 h=message-id:date:content-transfer-encoding:mime-version:references
 :in-reply-to:subject:cc:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u8N5qvppFagZ3/tTB5uDHm2P4arYErRxqlmJ6dmhhhE=;
 b=xN6cFEhFHyEsngG5emJdOap4+V+nE6gFuMUzdro7EScDcVOWsmda4a5Yw6aRYSrt8n
 jm6Qhipnw5nThRxhfFbcBO1m2y5tY2Ujx3HgkIjezxPQVeIv1v9hHy1pHLyfoDsAnXGj
 /Ylx9F9FHNKWVrZBMKqTl26kNfACgEs9xzcd5TJ4orblhIamQjkHYgTfnXWo1XhtIBmj
 y1VFqUqNVnZLVgbDuZbbxpiacez7Vyr+rjFYdLFRKFbS0UnsgVHbOGIHGLNOgQnVTd/Q
 UL3HE11PZFFHeTizd0aJPaX5X2DsdjBvoj1OOfHioowZCvCVBUbZ5sR5HHbzdGe+8wFu
 o7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691660665; x=1692265465;
 h=message-id:date:content-transfer-encoding:mime-version:references
 :in-reply-to:subject:cc:from:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u8N5qvppFagZ3/tTB5uDHm2P4arYErRxqlmJ6dmhhhE=;
 b=FugRj7ugw+Xg4QlOGaPAY+m+DW+hFoocQ7AgVVK/fIuWp0Ace+6Jf4BpYC4DkPEVf6
 68hRQLkoP6cRLrvG6dSGn58RTjeRnp+rLSdw12HZ2eYcjdb7cw+1t5s2QJ1KaiMqKYOZ
 3f6geFctI2JswMd1dFmLiYoswnugR3J8Mzq7V7mb9G82Oh/Gr0O43ElYy9wO4csozsA1
 MGVz/9H3E6QmrgAwYnXNeBOCD2b6U1eLx8TX7mW0Lz+G8pFoRaWxHigeRw79JGOk8ir6
 +EZNBD1yUUZIhYToJiZZV1WCVOwo3ErSdUWYuGJuhhFWJ/Rz7o2aIZDAHxr2t8iN0dwt
 un7w==
X-Gm-Message-State: AOJu0YxNrfXFi7v9U3CfCM3dIINMH+1SQGye099jYkW8lVUrvqt5yFVq
 g1LoH+VUkXfH7D4KVp5p5riG1Q==
X-Google-Smtp-Source: AGHT+IEESh4xDID3zF+wAoEy9DnzJiY8LmKtY7N2rL3KylyDhQ2C7CAYIv8R76yPbkgFvDGO0D11aA==
X-Received: by 2002:a0c:edc7:0:b0:636:60c6:2034 with SMTP id
 i7-20020a0cedc7000000b0063660c62034mr1813651qvr.38.1691660665704; 
 Thu, 10 Aug 2023 02:44:25 -0700 (PDT)
Received: from turing-police (c-174-179-75-62.hsd1.va.comcast.net.
 [174.179.75.62]) by smtp.gmail.com with ESMTPSA id
 x6-20020a0cda06000000b00631f02c2279sm352804qvj.90.2023.08.10.02.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 02:44:25 -0700 (PDT)
From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks"
 <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.10.0-pre 07/05/2021 with nmh-1.8+dev
Subject: Re: next-20230726 and later - crash in radeon module during init
In-Reply-To: <129403.1691660102@turing-police>
References: <129403.1691660102@turing-police>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1691660664_2972P";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Thu, 10 Aug 2023 05:44:24 -0400
Message-ID: <130185.1691660664@turing-police>
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
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--==_Exmh_1691660664_2972P
Content-Type: text/plain; charset=us-ascii

On Thu, 10 Aug 2023 05:35:02 -0400, "Valdis Klētnieks" said:

> I am seeing the following consistent crash at boot:

> Some quick digging indicates the most likely culprit is:
>
> commit cbd0606e6a776bf2ba10d4a6957bb7628c0da947
> Author: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> Date:   Thu Jul 20 15:39:24 2023 +0530
>
>     drm/radeon: Prefer dev_* variant over printk

Nevermind - I see it was already reverted...

--==_Exmh_1691660664_2972P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQEcBAEBCAAGBQJk1LF4AAoJEI0DS38y7CIcCQMH/0Z74jwPSDcxxmLstOYKJ7lY
ApFXhH94MxeGEa7o0qtmysWn54I7/MmPHQMOZ3ZZWHHOF0QqpgahtO9Dm7XpFG9j
jwlFr+vODziew8p4dBjJ4BEZk9TpVoE8BOA2yUMpSylOGmw5t8uz3fUjEVGhtG8a
x/i+mZ/adPxymbtZ0h0NnhLabGXMYF5VZ2R2ZAbBwKOYR82UcNMEzm/IIWUOtapw
sa0+tgnGXe4PasXSXvx/TOaGJVIsPLLy2DwMu8EKwLT/KelLDS+cTPYlwZ06A1pg
CmYDOTTaB7cl0UxTmSfOduHo9o+Twx5ziyAuBfJ2540A2LXa2zDlgU//mb28jA4=
=kY7M
-----END PGP SIGNATURE-----

--==_Exmh_1691660664_2972P--
