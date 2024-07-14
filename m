Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 524E2930ABA
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jul 2024 18:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297AD10E044;
	Sun, 14 Jul 2024 16:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gtdxP7Hu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA14510E033;
 Sun, 14 Jul 2024 16:14:13 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id
 a1e0cc1a2514c-81021667125so1178032241.1; 
 Sun, 14 Jul 2024 09:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720973653; x=1721578453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Yyn4bM42Ap4ZrCijPtVJNkueH9wiTy2GjVXWUySv8Q=;
 b=gtdxP7Hu3+YwXs8OcxeWKvwhCwkY2HVMtP/QtiLl6x1Q01BLaxR+TXX/WZIEx/5cVE
 SeQSTx8IcNd62S8DQyC4sfkwhiIRhkX016qHHTcjmXmMe/gXVMJWoAH2GIzrMLR4fz8s
 s7hmhCqIsda0fXnktL+/uc5NEAnrk95STP3uWzGgT77dvjXYxrts0LVOsk5JfeGob5Nl
 SeWJ8UXb1sFOb4UKNui5/cXmulRo9y92HmWSybbY7FJcYjVVQ780zuCPk2ij90dDcin3
 8XPD8WIO8Z2V0xG6psEtBQv1fimrPZZd5/WSIywJfuAm3RIBZqWdxS56hUxGj3BjaJWp
 mMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720973653; x=1721578453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Yyn4bM42Ap4ZrCijPtVJNkueH9wiTy2GjVXWUySv8Q=;
 b=hvA4WbMt98jSNSSyuQi+td2cVK5jG0W4NQWYO48VI9z5Uu8L2DzkgXxT0thHkKNj6p
 4f+DSwZUlJc8fsKoGCIExNyAUCdBQXOehcfVr+IJFsj4AzOb3531VmDvwAqn+qCyTQk5
 +vlMYyCzI1O9YaES50xOd8gdl8iIpu+YBSUWkK33aZ3vfdBd4DqF4Jc38imx1pwnEKOZ
 Pq/JgIoUkUnHE4Z2lgKkiRtR2huBX6XnVR3P8aD7Hwg4WWOuX/T79MHhWGqcZtMsoHjr
 xOPyC12OXFDOrU8UEjAIu0LuoceMkSbXHnYNKBRIGTXV6zhVRdl0ZjIzT5oa+/JSSxOy
 o/0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaxB/8gKZb1Kyaok8wZNiqhfxGPVwiVkO8Zjzz2bymnvRpsvW0CU2Xsc/Bt96r1aTE5oPuLOCMiT5Mm9zhd85tzDj7jvqaWymsMRWgSFqLAWmxqN6UuhVHENd+vRRZsJZJWKnNme1trs4YW2fNEPtVHgS5f7dbEjQXCfevFB0682VCKGJT6ZQmxCyyU8Q9jnP7sjazNGTKHqL7rInRguTdg9Tmca8sOBwPGgSSdd+liimEqeM=
X-Gm-Message-State: AOJu0Yxp5UAuLFBlv7JWHsG1D0x0NBgCJ6wufAN8PK5dr9HWcE7VIr+0
 L/ovaaFayfwOO4hWJ58CduGzsrgPrnalEDe4R3PloFUb1LlN/CkF3q62cdMQNLNXIINx3FIpMKQ
 HohZFM0IBQpUn6+bj+dIHrDhzbGs=
X-Google-Smtp-Source: AGHT+IGJpHdSKRAkgcgSszPtuJsHHRbse+wAzDBjWHdhQlSC6mBAg6s9Wu/C6A9Crh6oLSWE6phJW+y6tuTOyGtTC6U=
X-Received: by 2002:a05:6102:32c1:b0:48f:1bea:3c70 with SMTP id
 ada2fe7eead31-49032147ae1mr19644741137.17.1720973652595; Sun, 14 Jul 2024
 09:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
 <20240702215804.2201271-28-jim.cromie@gmail.com>
 <22bc825c-d726-4a4d-bd3a-508773c04071@collabora.com>
In-Reply-To: <22bc825c-d726-4a4d-bd3a-508773c04071@collabora.com>
From: jim.cromie@gmail.com
Date: Sun, 14 Jul 2024 10:13:46 -0600
Message-ID: <CAJfuBxzLiWn_t6VDxzYzfjm6GaZcjeASwBX7Nbma6yGBKEtB9A@mail.gmail.com>
Subject: Re: [PATCH v9 27/52] selftests-dyndbg: check KCONFIG_CONFIG to avoid
 silly fails
To: Helen Koike <helen.koike@collabora.com>
Cc: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, 
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com, 
 gregkh@linuxfoundation.org, ukaszb@chromium.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 linux@rasmusvillemoes.dk, joe@perches.com, mcgrof@kernel.org
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

On Wed, Jul 10, 2024 at 2:23=E2=80=AFPM Helen Koike <helen.koike@collabora.=
com> wrote:
>
>
>
> On 02/07/2024 18:57, Jim Cromie wrote:
> > Several tests are dependent upon config choices. Lets avoid failing
> > where that is noise.
> >
...
> >
> > test_mod_submod() recaps the bug found in DRM-CI where drivers werent
>
> If this fixes any but listed in drm/ci/xfails folder, please update it to=
o.
>
> Regards,
> Helen

This looks like a good avenue to follow, thanks for the hint
