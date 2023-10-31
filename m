Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5187DD6AB
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 20:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB02510E09C;
	Tue, 31 Oct 2023 19:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DF710E09C;
 Tue, 31 Oct 2023 19:29:24 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-540c54944c4so317916a12.1; 
 Tue, 31 Oct 2023 12:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698780563; x=1699385363; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ylenFw163OeyGdzwB/6YWTRcZscvjRf+QU8lvn2qg+w=;
 b=kK6kxdZr8I/rnOE7mz63FeXjRY7c5xgUgw/lXSefqVNY0Wnx1Jy1m7iC2Sys41eWgz
 DAI4FdZDLxEYGYwhA9Ml4RqpifvqrK0ErcYES8efXI42xR3zA9bT1ftZGc6CWBnTN1np
 TiuXfQT7ez7SX6q6/vAZ2ICuDSKSVJLk0P6/wFwndwcmiltLlQTke7PTNafsHejrS96n
 4iZvH8VNNihl+a1DpBKG+zqjUvw9ImpTloAFBIJqQy054drKaD33GFiBjuzjaejsnQQ6
 NjAZBmjH8SKbzX6efjzcKLwOhy+pax0NVRIMVCs5EYtxhs81Hg4G1N6S4eEcs4u7JnpO
 bFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698780563; x=1699385363;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ylenFw163OeyGdzwB/6YWTRcZscvjRf+QU8lvn2qg+w=;
 b=Egfym6qd2dGN+2HMonysDhQ1GcGlRq6hS84epJmglXR6W56rlIX9pFeJsaz/gY22F8
 iKjtZWGDVlm4hIzeKL1/OibOnLFRMnH6U3u3OD3zQwth96mi1LZHYn7IxQXm78XZ6ivc
 9CONZbaiKqTXbes+04ufKWsgfJEe7RwB3dqWpS+cSecfy4Qd36zOaz7wEPBbZI/q0/fZ
 4qOfF1HCgHAP73hFMzaEyB3w0cFbNxTzdcptKzTQq0bmQ2iehcYNmwW+MrtrGfhNu//a
 P/IKm+Aeu8RozI9qo/NtAz3xu8GPfwksxMNGwXV/SxZkra6s1Uol9Ao9OO+VPV0TZkPV
 1sCQ==
X-Gm-Message-State: AOJu0YzC4iJSlE0LgCeAidDjohS1FsFnchOFoyYiRwbOGjNTWiqndaPF
 5itaKikPMKENZ4cVXufz9n/lZN3Vb3fx0iUdHN+ciw4j
X-Google-Smtp-Source: AGHT+IHdACieZKjfavs0pTABOt44oIFQAvPyqiMP6AAc7tD/qbtsPO9ugWCzQRzHNnkyYsnYNpRBs6QZuQdq5RxdKL8=
X-Received: by 2002:aa7:c042:0:b0:529:d147:e9f3 with SMTP id
 k2-20020aa7c042000000b00529d147e9f3mr603249edo.5.1698780562981; Tue, 31 Oct
 2023 12:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231031051943.1957328-1-airlied@gmail.com>
 <20231031051943.1957328-4-airlied@gmail.com>
 <CAOZdJXXXf3RUc3d1STyZtAENHe_DqC7sXoWZZhk7p2wo=t7SVA@mail.gmail.com>
In-Reply-To: <CAOZdJXXXf3RUc3d1STyZtAENHe_DqC7sXoWZZhk7p2wo=t7SVA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 1 Nov 2023 05:29:11 +1000
Message-ID: <CAPM=9twkLVo4aF5exWLXVfRxewcDvb17k9O3L1uB3-KG4g4FMw@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 3/3] nouveau/gsp: add some basic registry
 entries.
To: Timur Tabi <timur@kernel.org>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 1 Nov 2023 at 01:53, Timur Tabi <timur@kernel.org> wrote:
>
> On Tue, Oct 31, 2023 at 12:20=E2=80=AFAM Dave Airlie <airlied@gmail.com> =
wrote:
> > +#define NV_GSP_REG_NUM_ENTRIES 2
> > +
> > +static const struct nv_gsp_registry_entries r535_registry_entries[NV_G=
SP_REG_NUM_ENTRIES] =3D {
> > +       { "RMSecBusResetEnable", 1 },
> > +       { "RMForcePcieConfigSave", 1 },
> > +};
>
> How about :
>
> static const struct nv_gsp_registry_entries r535_registry_entries[] =3D {
>        { "RMSecBusResetEnable", 1 },
>        { "RMForcePcieConfigSave", 1 },
> };
>
> #define NV_GSP_REG_NUM_ENTRIES ARRAY_SIZE(r535_registry_entries)

Good plan. I'll change that now.

Dave.
