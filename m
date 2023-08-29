Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEF278C8D6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 17:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761B610E3BF;
	Tue, 29 Aug 2023 15:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBEC10E3BF;
 Tue, 29 Aug 2023 15:44:28 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1bbb4bde76dso3022863fac.2; 
 Tue, 29 Aug 2023 08:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693323868; x=1693928668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KEEk9Aij8bG0TRPegsnRlMFSPOR2v5c1PMFY9SOugiA=;
 b=K4Kn73rnZxUojCHkdUxDoigrEV102J7GaNM0sv2Il2gAR4IagT+cHUuYSRgiI+DLGb
 lJIAIS8I0Gz1zvvBYXUb08eMxEbZOZ5zy8aFMkjfdqlj36I/oIrJqHd+r+LTILYZHqmd
 x5DZFGiDChb4puDFIF9KILAz3CQnh0nqPyaBKb+aQD00rfZNXPteq+a4FXYG1hswgRX1
 Ed4Z12TbNBgchAytqGZJFVDns0L8DnXsxh/WQhiIJEOBtjZJhmqDlC+LmgIugzUO+yOQ
 rzv1eZsWLOM3MsQBwtw/IasnrYWvsRdYHxxqtgY9ynOiK/LI40kh1dIUMp1gprnRFA7G
 qRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693323868; x=1693928668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KEEk9Aij8bG0TRPegsnRlMFSPOR2v5c1PMFY9SOugiA=;
 b=IcDWkYlhqQYnYYJ0hddVBM+D0gY0lBGZ52pBpj6y+E4kRSpj02uHM9iFgkVsQ4j2xF
 hkg2LlDEsfPGpfBYQ3dNxmLNPiOAArjNILvNZ/z1ZoRCbgxMrpRPqw38x/nSkz6FinW/
 LqyJmGT7nQOa1FGA5M486zQbsdnYCPhnECyR4F5TXbWzPKVCe9AMHy10Op5ug4iAdZ5A
 EWzxOLIiMqzE/xPO8KmpXcwRRI7u0YIDxQQuZxz7A9pAGRtbqawTN6VgCeSsrlQZj2fz
 3HsRzvGyi0UvdeFdFmtb+h3sKwT3rKRkdJwNPYSDp3P0Z7+Lg28SJUBZL8pY30FD6rid
 gpAQ==
X-Gm-Message-State: AOJu0YzCXltovHqYPJ7xrjgWfBGFtwg8Qy6+k8np+SMemDlfqJSACETo
 DCltfT685Bf+l8kBFsX3NIrP1kR0zR5WryDxygs=
X-Google-Smtp-Source: AGHT+IHM5N6YLxvr9ipESFpmTbZOhxxpm33Tq1SxWPmgtUyrMNeoSoXUPslo+R3eRdp7EuQNh/gHtSQaFyC8EYDBEbI=
X-Received: by 2002:a05:6870:65ac:b0:1bf:4f42:de91 with SMTP id
 fp44-20020a05687065ac00b001bf4f42de91mr15692126oab.33.1693323868005; Tue, 29
 Aug 2023 08:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692705543.git.jani.nikula@intel.com>
 <788721f6-afff-e0b2-db7c-32ab2dd075a9@amd.com>
 <87il965gob.fsf@intel.com> <871qfm2kg1.fsf@intel.com>
In-Reply-To: <871qfm2kg1.fsf@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Aug 2023 11:44:16 -0400
Message-ID: <CADnq5_P49U3dcqiZhB-CjS8UbOtB7K2jNObS0ZQqMhOr3UhLQg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/4] drm/amd/display: stop using
 drm_edid_override_connector_update()
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: Alex Hung <alex.hung@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 Wenchieh Chien <wenchieh.chien@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 6:48=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Wed, 23 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> > On Tue, 22 Aug 2023, Alex Hung <alex.hung@amd.com> wrote:
> >> On 2023-08-22 06:01, Jani Nikula wrote:
> >>> Over the past years I've been trying to unify the override and firmwa=
re
> >>> EDID handling as well as EDID property updates. It won't work if driv=
ers
> >>> do their own random things.
> >> Let's check how to replace these references by appropriate ones or for=
k
> >> the function as reverting these patches causes regressions.
> >
> > I think the fundamental problem you have is conflating connector forcin=
g
> > with EDID override. They're orthogonal. The .force callback has no
> > business basing the decisions on connector->edid_override. Force is
> > force, override is override.
> >
> > The driver isn't even supposed to know or care if the EDID originates
> > from the firmware loader or override EDID debugfs. drm_get_edid() will
> > handle that for you transparently. It'll return the EDID, and you
> > shouldn't look at connector->edid_blob_ptr either. Using that will make
> > future work in drm_edid.c harder.
> >
> > You can't fix that with minor tweaks. I think you'll be better off
> > starting from scratch.
> >
> > Also, connector->edid_override is debugfs. You actually can change the
> > behaviour. If your userspace, whatever it is, has been written to assum=
e
> > connector forcing if EDID override is set, you *do* have to fix that,
> > and set both.
>
> Any updates on fixing this, or shall we proceed with the reverts?

What is the goal of the reverts?  I don't disagree that we may be
using the interfaces wrong, but reverting them will regess
functionality in the driver.

Alex
