Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8C37DD0F7
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 16:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784BC10E543;
	Tue, 31 Oct 2023 15:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A574D10E543;
 Tue, 31 Oct 2023 15:53:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1204B60E83;
 Tue, 31 Oct 2023 15:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B9AC433C7;
 Tue, 31 Oct 2023 15:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698767596;
 bh=inNWTeajQev2sva3crWsVMRpUQ/0uVaCTCG15C3QI4I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lA7PGVYVYOd+qsmcyk6Kqb+bD/4pAFwry9/xesMiAq8HmmqUzYiOQ2exkKOr7BgB8
 tV2UwnpWBjpdQuCypUuK6sFDyA6Sa6Y4c/Q5lecuCMZLHqYJajwGFB7tgj4GPEBg/p
 tN4Kv0pkuuQZojpQdEUg1YvoSnP52BP3rYD5r+qqVMQJyFO5yaM4LwdrtoBxIjJeL5
 U1Wp69QlxvB5zgeFBfDI+yXg7tqdp2Ix6CRR49o7uJdGhur/3hrOk+RKLI8e2DjyHZ
 FBcHJLkY3+gtM+3Z60Ndm9BotSX4/ZrWlOhq+m++x7wy+vMsmylqp6ZPUYa6gOtPJC
 LUheVi4WwolAA==
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-52bd9ddb741so10118149a12.0; 
 Tue, 31 Oct 2023 08:53:16 -0700 (PDT)
X-Gm-Message-State: AOJu0YyLhrc6FYuoEGEfrizeSpat9o5VUamrvr1ezR7Wp587CpcHkTGO
 nVK+taTeAgsUH+s0xH3iAHGq5sIq4eDOTIB4/n8=
X-Google-Smtp-Source: AGHT+IE9xw+CrU12zK4jYSZBWCtc4QOU7yNNJMK+LIlQTss7fd0xnSubfwsFtmYVZi4wONJx0ck3rzLU5APqgSya85k=
X-Received: by 2002:a17:906:dc8b:b0:9ae:52fb:2202 with SMTP id
 cs11-20020a170906dc8b00b009ae52fb2202mr12649187ejc.40.1698767595201; Tue, 31
 Oct 2023 08:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20231031051943.1957328-1-airlied@gmail.com>
 <20231031051943.1957328-4-airlied@gmail.com>
In-Reply-To: <20231031051943.1957328-4-airlied@gmail.com>
From: Timur Tabi <timur@kernel.org>
Date: Tue, 31 Oct 2023 10:52:38 -0500
X-Gmail-Original-Message-ID: <CAOZdJXXXf3RUc3d1STyZtAENHe_DqC7sXoWZZhk7p2wo=t7SVA@mail.gmail.com>
Message-ID: <CAOZdJXXXf3RUc3d1STyZtAENHe_DqC7sXoWZZhk7p2wo=t7SVA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 3/3] nouveau/gsp: add some basic registry
 entries.
To: Dave Airlie <airlied@gmail.com>
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

On Tue, Oct 31, 2023 at 12:20=E2=80=AFAM Dave Airlie <airlied@gmail.com> wr=
ote:
> +#define NV_GSP_REG_NUM_ENTRIES 2
> +
> +static const struct nv_gsp_registry_entries r535_registry_entries[NV_GSP=
_REG_NUM_ENTRIES] =3D {
> +       { "RMSecBusResetEnable", 1 },
> +       { "RMForcePcieConfigSave", 1 },
> +};

How about :

static const struct nv_gsp_registry_entries r535_registry_entries[] =3D {
       { "RMSecBusResetEnable", 1 },
       { "RMForcePcieConfigSave", 1 },
};

#define NV_GSP_REG_NUM_ENTRIES ARRAY_SIZE(r535_registry_entries)
