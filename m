Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1D2596E40
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 14:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B42A8F7FF;
	Wed, 17 Aug 2022 12:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967FD8F844
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 12:16:13 +0000 (UTC)
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EFE0F3F46B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 12:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1660738571;
 bh=DSb7iQYDJqXj92ygGsNtJZCJ5hZY67yzyY/MzoJmNKE=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=EuYyjt+Mu49AlfPBX+sfQ45Pm1kvq0BegRDhHoskq8KaLbcgIea/pTQOvgTR8/LFY
 fLJVyPrT+4SoOF2FsVRjsNfSi+c27I+7ekCjQADd1BBOppPk9Jtt7e0XhbxP/uR1PX
 t3jIQptK1V8qQC95xXc1/S4v6r2xkfhHfoE07dQ9ROB+qWOz+eGtnRUwpkAYfRln2F
 YRauyoEIlgHlsVa83wPzPXNT2mLz1BLt5ZBdoOmzEmZc2xDGOjuuhxSA48cyPKvuWa
 wowhFE4J3kqQ24Se9FbRITAQXG5EFzkyaPlgS/dBbmvfYTUFNy09qgQK9AEYPaZVif
 F38RrzZr3safg==
Received: by mail-oo1-f71.google.com with SMTP id
 j29-20020a4a92dd000000b0044aa3238852so4328894ooh.14
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 05:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=DSb7iQYDJqXj92ygGsNtJZCJ5hZY67yzyY/MzoJmNKE=;
 b=DtukNwitrMhPKQGfriLbR1J8QWKmLdF5vWrISOnzLEMwQmgR1dtqV4tXF4ThSFGIet
 W4Olx5y45ApbgUwMBHBWgvuJan9lhobAvB4lfxd7k8M5n/EUhj/T2f5kVeUrgAkStvYH
 QbveGa/Hmwqlb2QiB2dY8Dh8V+rb0e1nK/ykyqZ+qBWDbfnMFRbUYS7v1wtv3Iz7kfu0
 /Do/89GKufYBCnbCZkD03025XRu8yC9l4ej5dH3EJjjmOFdTb6SeM7/fkwn7Erv3EJrK
 6rmutIns/tB6ZpNNV/bgLcaler1WfzU1rhC2/RI3eSud2p8n5TQMLpo/9yj3IOORUtzd
 KG3A==
X-Gm-Message-State: ACgBeo3iDhx9bVgg6pzzGlU5y8SgFXYo16spq7MHpKDkDXvtYv1Hb3Kh
 gO0fmUDJSWfL8Rb8lIJ40f4a6u/Ke/5wfQAOzaCxhWs2lgUnpzZvumRfg/bQa+vM5qbFbz5gITY
 YYSzBvDcxkWcMSVqEKAUwVeD+ak23ULHfpp5OfqCQm2eAQnexa1gt3rbjWj1BrA==
X-Received: by 2002:a9d:f05:0:b0:637:1068:1081 with SMTP id
 5-20020a9d0f05000000b0063710681081mr8767019ott.224.1660738570901; 
 Wed, 17 Aug 2022 05:16:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Z5e/K5f+romlAexEX5pnAcJ6x32GsOIarjF+40/jrQPnGq70CyhTWg+eQG6ziTT55YrNeb9nZ9rmgCxcOdlo=
X-Received: by 2002:a9d:f05:0:b0:637:1068:1081 with SMTP id
 5-20020a9d0f05000000b0063710681081mr8767013ott.224.1660738570591; Wed, 17 Aug
 2022 05:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220816025217.618181-1-kai.heng.feng@canonical.com>
 <CACO55tt=Op=0E94kK+1M8cDXNCk5Tkc=FMR8=OQFc5ohehjwaw@mail.gmail.com>
 <CAAd53p49X95MKrTDUq92LuHw3y2i09fUA2HEPzM1EcO8xO97Eg@mail.gmail.com>
 <CACO55tvgmb4Vog701idDYGuh125S9mjWPXhftxDMZ7hg-nQXBw@mail.gmail.com>
 <CAAd53p4W9rjmVJcUasy9hb1Yam+846+Oomvc2r9RMNmWeh_=0w@mail.gmail.com>
 <YvzYGGXils/Gf44d@intel.com>
In-Reply-To: <YvzYGGXils/Gf44d@intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 17 Aug 2022 20:15:58 +0800
Message-ID: <CAAd53p49zc2G1KutPMUcUBM3_rbCh9_40e0mdtcZKb+C69QL_Q@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Switch TGL-H DP-IN to dGFX when
 it's supported
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Zenghui Yu <yuzenghui@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 17, 2022 at 7:59 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:

[snipped]

> I had a quick trawl through some Windows stuff for this and
> it does seem to do a few extra checks:
> - platform must be TGL-H (nothing else has the DPin stuff I guess)
> - OpRegion header must indicate dGPU presence

Is the dGPU presence denoted by the return bitmask of
INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED?

IIUC the mask 20 won't be set when dGPU is not present.

>
> Otherwise it does call this DSM uncoditionally on boot/S4 resume
> so seems like that is the only really validated configuration.
> Although it does seem to explicitly turn off displays prior to
> the DSM so that does perhaps indicate that those ports might have
> also been enabled via the iGPU by the BIOS. Not sure if disabling
> the ports would work correctly after the DSM or not. If not then
> the DSM call would need to happen after state readout/sanitization
> so that we can shut things down gracefully.
>
> Additionally after the DSM call it scans the FIA TC live state
> bits to check for DPin usage. Looks like its trying to make sure
> the driver stops poking at the relevant power wells once in DPin
> mode. i915 doesn't check that stuff atm so we might end up
> mangling something while the dGPU is driving the port.

Thanks for investigating this. I am not really familiar with other
stuffs you mentioned, but I am happy to test any follow-up patch.

Kai-Heng

>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
