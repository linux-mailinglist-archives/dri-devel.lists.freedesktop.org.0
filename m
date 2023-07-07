Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B820B74B17C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 15:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7857B10E5AE;
	Fri,  7 Jul 2023 13:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDA910E5C3;
 Fri,  7 Jul 2023 13:09:11 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6b71ee710edso1703053a34.2; 
 Fri, 07 Jul 2023 06:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688735350; x=1691327350;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z0E8y4fGYzz8yC2ib/jS3nwnW8qCRpxDzJh1d9RvFtk=;
 b=bpki2qcB+eLIwKnXEUSSAaEJDJ+snThABPQQqXxBPk54/nWPD+eFJNOIKY0Eu1l4Zv
 5eiBL2uAkyORf0Ah1uVUcK1gnzQ6M9u2zKJR5acbFswGDb+z7LEISpKmvPKboCqgpmUI
 adnw/HP7agE0y5LkPZsvS5CzIf23ONqpjqVuCn1mu2pdccL6bBVjGDzPgxLjVEJ19ZWI
 p8Xg7Gr/gVKDCqUgmaMnxRaE83f1k0UXfNTXpkqErsAgP12qJh9KiiLqEpKp12KsYOcp
 JBngbd2hFo6/rzFuG/3NDQUMdIRMDmrrrbcwHcpL33X0pfwUVBidoFps3OWTd5VzneKV
 sKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688735350; x=1691327350;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z0E8y4fGYzz8yC2ib/jS3nwnW8qCRpxDzJh1d9RvFtk=;
 b=h51ZtbzZaspp/jGZOxakcA0L7pIycFhAChEtW1P6Yw/1DnePEAkposv5Osi/+JsmBW
 /DV3pCs/vWMvVD69EnxIwHcadZbXI8YVISx7EEMuUelj0WTCeCS2fVwVHZwPfUsckGJx
 Du2DLLRpKXPngsylIhK/lfwNGEqEH/nsiLZDSycgCJPopOU16Boi92itqfNXs2PzUXpa
 ef2y2j5iuTMlL1uGfJtI6W448LteBTik3fux/9fLX6ryNv+ZC5lS+3hhMnsJzALdqM4h
 SM250FIONPKo3HtalHI4RBPlatY6Uq+zb81AaYw8Re6Gy+Cis/ufpUIpbykUhpCxXetA
 z/8g==
X-Gm-Message-State: ABy/qLYwX0qdYPGlcYN89BDaxyoBh5sdZ7aLR2BlpykUeGfFUmDD0Jbq
 0vfBcuZU381Q9lBA5umOrFvgUVwgE7OiVEH3yfo=
X-Google-Smtp-Source: APBJJlFhB3RwSiUYDs/RkJRayf+qGvXgwPyZgkYCBe721q2QnR1H8+yGO6Q2JKqLHwcJBKrUp3iz8c/Q0GropB3/Hfs=
X-Received: by 2002:a05:6808:178b:b0:39e:ffc5:c450 with SMTP id
 bg11-20020a056808178b00b0039effc5c450mr5609673oib.47.1688735350309; Fri, 07
 Jul 2023 06:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-12-robdclark@gmail.com>
 <3bbcabc4-69d2-93e0-a3e6-60d575b40126@kernel.org>
In-Reply-To: <3bbcabc4-69d2-93e0-a3e6-60d575b40126@kernel.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 7 Jul 2023 06:09:27 -0700
Message-ID: <CAF6AEGt5b_8eO6oXEt0mK+Rf0UfaEtB8JC+9fz+Wk=H9nWPuwQ@mail.gmail.com>
Subject: Re: [PATCH 11/12] dt-bindings: drm/msm/gpu: Extend bindings for
 chip-id
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 7, 2023 at 12:26=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 06/07/2023 23:10, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Upcoming GPUs use an opaque chip-id for identifying the GPU.
>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.

Oh, whoops, I'd overlooked that I hadn't configured sendemail.cccmd on
the laptop I was sending this from.  I'll fix that before resending.

BR,
-R

> You missed at least DT list (maybe more), so this won't be tested by
> automated tooling. Performing review on untested code might be a waste
> of time, thus I will skip this patch entirely till you follow the
> process allowing the patch to be tested.
>
> Please kindly resend and include all necessary To/Cc entries.
>
> Best regards,
> Krzysztof
>
