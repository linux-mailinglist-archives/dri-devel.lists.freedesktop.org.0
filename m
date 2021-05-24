Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB3A38F688
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 01:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520A36E993;
	Mon, 24 May 2021 23:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9D26E993
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 23:52:48 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id c10so22073140lfm.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 16:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hardline-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:content-transfer-encoding:cc:in-reply-to:references
 :from:to:subject:date:message-id:user-agent;
 bh=Bv+iT1d6XXjk5XsKYADcBOul8rjTXVc2//hAleRHN/o=;
 b=vinyRR9LKFgriLi/CDIov3G1nu8qHQnv6kQAhNhqtfy4S/YHVF0nDJ46hdsq/LzyK2
 io9h/0+9y6vfFLi9d28wBCiYNOgspHxaiolkgVsQ8pTBTcpsh3aGVVQBmsDaReF9EKS9
 LQB+iz48yphz1AXarDGT9iG2QL7ayuzsZBTyyigl1oi1sOI8xbRh+gv/g2n9gsUcR/o7
 1g3SWH2DBRQIbkzrOj9aRYZaB4F18xM9dXBEbKDwBvI5fkYw0s4UGeFatHh+XnmrobbU
 u2WzE83pTvEf+7zMHWS7ALiZ9eLg7AQUQsslzKIqrLtoOmsr+FGkU4JzU0dA9gCoDzat
 XzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding:cc
 :in-reply-to:references:from:to:subject:date:message-id:user-agent;
 bh=Bv+iT1d6XXjk5XsKYADcBOul8rjTXVc2//hAleRHN/o=;
 b=Hx2rvq4TSOmZwfCQeTFhOWfAFZnIP6MXDbwvlq0opcpm4ksLFfPuzL1YIeUHSUcD1j
 68fyj8rPt9VbmgnkAkOlu3dgqCZ7LOPOSKAoo96bl/cnNwDQJO2pB1S/wwYZ8wEyl1aR
 5DVMH1EC5rj1+PA3gvn4GnH3r3xBNzfkcNp7hPGbxl2ancNiRPTYTe6SxgPu/xQWT/RC
 FjIQ+l/Kl7XgP8gNX28KGrXk4i3xnjrnzRLbhApDIeT4d571K5rJxzKmuO9j3OVyWvc1
 VxDnSuc7Nnr1vzaA6zIbBUiUWb3AG8G0RhO7+YDD4gdcBRBC9F5QNH7CF3O+91nsi+kA
 j+ng==
X-Gm-Message-State: AOAM532Lldnhsiq2k7O3o7N3m3y6hzKSjwTUzkJer6T50X78owRK8JWK
 QEPsSH4mnCKy7fLIwbbxv7W1IQ==
X-Google-Smtp-Source: ABdhPJzfvTGdNAkkR71WH7mcKKLVtiGCi3h2CwpYWC5p2Qtf3B1mC9f45PYqJX/xA7ZZp8a2mxPWYw==
X-Received: by 2002:a19:c747:: with SMTP id x68mr12087861lff.516.1621900367120; 
 Mon, 24 May 2021 16:52:47 -0700 (PDT)
Received: from localhost (host-109-233-88-83.jmdi.pl. [109.233.88.83])
 by smtp.gmail.com with ESMTPSA id p2sm1546084lfh.31.2021.05.24.16.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 16:52:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210506191451.77768-9-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-9-matthew.brost@intel.com>
From: =?utf-8?q?Micha=C5=82?= Winiarski <michal@hardline.pl>
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [RFC PATCH 08/97] drm/i915/guc: Keep strict GuC ABI definitions
Date: Tue, 25 May 2021 01:52:44 +0200
Message-ID: <162190036494.39241.3181852486794252116@macragge.ultramar.hardline.pl>
User-Agent: alot/0.9.1
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com, jason.ekstrand@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Matthew Brost (2021-05-06 21:13:22)
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>=20
> Our fwif.h file is now mix of strict firmware ABI definitions and
> set of our helpers. In anticipation of upcoming changes to the GuC
> interface try to keep them separate in smaller maintainable files.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Micha=C5=82 Winiarski <michal.winiarski@intel.com>

Reviewed-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>

-Micha=C5=82

> ---
>  .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  51 +++++
>  .../gt/uc/abi/guc_communication_ctb_abi.h     | 106 +++++++++
>  .../gt/uc/abi/guc_communication_mmio_abi.h    |  52 +++++
>  .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |  14 ++
>  .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h |  21 ++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   | 203 +-----------------
>  6 files changed, 250 insertions(+), 197 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_=
abi.h
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio=
_abi.h
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
