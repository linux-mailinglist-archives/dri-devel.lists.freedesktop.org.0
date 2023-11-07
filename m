Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7DE7E4D04
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 00:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8DF10E17F;
	Tue,  7 Nov 2023 23:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF7810E15F;
 Tue,  7 Nov 2023 23:24:43 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-66d00415a92so6876616d6.1; 
 Tue, 07 Nov 2023 15:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699399482; x=1700004282; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XlH3yDHH8VWiFHnu4y1ED06RXF9ED0I+ELE6Udjp544=;
 b=GYiWIzQNrhpfyCsryCNUFUq2WPeTAYhuRUVRZoCnLlH8oc71stskz0OHDcSRh+elVe
 /v6yiH5E10T2+d8XqIs6ONvGT/3HYhFlzkL+LoO0iUiQSM7m/vVYIiyutBZUR/hUiD9c
 a+CxYuHetoU++sZ61bGzFHa3KTvpbCMOpwYtlwalcfZ9sHJQlmbK/juQzGilER7zgWxU
 tkXeY2Y+HTUTv3/yxeidhrTZr0lyBRpY1QoviKNW2TySmr1JZOlpJeaTnnNxg97pzOmj
 VDy+S2Ziq9P+jwZRuXnlgAOw5uRbUB/oe6WZfmuWUdgIiA/2Tw7DX8S6ORGCE0FSkEao
 vETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699399482; x=1700004282;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XlH3yDHH8VWiFHnu4y1ED06RXF9ED0I+ELE6Udjp544=;
 b=Mr+rksRdNfdEWokQo7/OEWRfDcYmqXQUYP2V1yEq+PBoGPPBm0SBS8OOTM4BExgVfz
 /EzMcJMW85F5vEjOAce3I/qxF/PM/stLsbInKWCfga08d/Qb9KP1Yy8TbZzs7VuRMTW8
 FfUAE0xrX2uHKCF0g3m4O3xvdJNCFcfctO4pahDYql0Rcko3nQ50XQkl6RzURp6MwFQg
 Z6Ps3lraqHBT/HHRlylNTobCL5xx4OGjMeVsTBlJ8xV8M6kDVPFDUjoXBvo1ueu1k50r
 Yg5kEx1P7OVCohsh78JUZj8uQeEGrY/Baq58XRcH9fKBDZVugtquvha9oSbkI1h4PlNv
 vQEw==
X-Gm-Message-State: AOJu0YztnQ3MWTHaLRBsiCLYT0x07w9NwdU0aWwRn9Y0FdQLSsoTyiRg
 Z69hNnNx0FcLp5SpSceNSMRH6ja2uUJiyzvkI6U=
X-Google-Smtp-Source: AGHT+IFzKOfsxUAOyTg4/B2c2+FRm2EghLOHHC6yIj5u4gceOSiG2NGcXwnnyvJ1a+etNcEqJQcS0E/2GW5KCMNNzcE=
X-Received: by 2002:a0c:ee6c:0:b0:671:1408:d46e with SMTP id
 n12-20020a0cee6c000000b006711408d46emr293062qvs.0.1699399482480; Tue, 07 Nov
 2023 15:24:42 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsNsDLvZR8RGf9ji5938QreSix89FCpGHju+9in2x6OfDw@mail.gmail.com>
 <CADnq5_ObMvxN4pFAsWU7OM3SAtYCNHKE_fHsLqizGm0p1ubp=w@mail.gmail.com>
 <CABXGCsPXp_pWZcyVQajYSTZKeViRqjfXK2=jmuRXh0yug_OoWQ@mail.gmail.com>
 <CADnq5_ND_aBmsD3X=tx2==EM7VOz4EBwid4hRVZ79mbi6bWq1w@mail.gmail.com>
In-Reply-To: <CADnq5_ND_aBmsD3X=tx2==EM7VOz4EBwid4hRVZ79mbi6bWq1w@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 8 Nov 2023 04:24:31 +0500
Message-ID: <CABXGCsOn2a9vZj_1yET96mum=wjGmer6tHG=XgToS76L9ihdUg@mail.gmail.com>
Subject: Re: 6.7/regression/KASAN: null-ptr-deref in
 amdgpu_ras_reset_error_count+0x2d6
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 8, 2023 at 12:12=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> The attached patch should fix it.  Not sure why your GPU shows up as
> busy.  The AGP aperture was just disabled.

Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Thanks, after applying the patch GPU loading meets expectations.
Games are working so overall all looking good for now.

--=20
Best Regards,
Mike Gavrilov.
