Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6440B731EC1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 19:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1E010E527;
	Thu, 15 Jun 2023 17:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D85E10E525;
 Thu, 15 Jun 2023 17:12:42 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6b2dbca2daeso4780726a34.3; 
 Thu, 15 Jun 2023 10:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686849161; x=1689441161;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f7t8tAjtALMCxF4db4hi1Na7h70msD6c1rOODixaixs=;
 b=jNqIYIKjaHjZGxMm6sINXlkUWOIHlJv67UcaVrw15ZUbyxe0n2u5Y4JHeH3FviTlR/
 pCh+K0a0f4XdDI2cqcOJ6lNIsg7OjMKICFPnIZrHuPwfcGHwywIiEHeGMFuCog6E6VVz
 K6AyyNUE5jlhz5/QZco3+c/NKidFQfZuZLFOAt+RWhouuFhndh9Hg1e9krU3RvKgRMkz
 mWee2eKcY/DTIVRhURZWmTAWs8cHAlgeComVUetYhxZCBHytBECwVOvwL/84LQrXwHLw
 PPWOu6qSRyXYjJIV9QujArTRi0eTu030+MZB4DlrOCuWLf5JOD6nhH0shqaMMHiciJ0F
 5czQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686849161; x=1689441161;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f7t8tAjtALMCxF4db4hi1Na7h70msD6c1rOODixaixs=;
 b=DiwCoVnAneMjaw5qRArmo6MHuf8DvQockbWOL1eInnA6armVax8TaKwzFRgc32L/Tb
 Vy1hmNPDnyCfE3jeV17kJy1vvkmrDSqHjBDrg1NA74klQyKXYVD5vp7ZMHgZ/q48i6SL
 MQgasz9Zk16CjvI37KYlL1QsQD6x/1SYQ+xYnRYjIQyVXSDgQajyVYWlNbxGs2rNWdHg
 OmSx5JYlPttfN8OzCLGKwH3h1O3FrzvDMOYaAfYXEq+saqXJCmGnUx1lc+wTsrVt391/
 G+QuyKpwGetzScYBHcbYCmD2YZWPyopGk9XfEjpQdo89FBJTlmKPM+esMwLpa0KUZJma
 P60Q==
X-Gm-Message-State: AC+VfDzEcqxpvW+PhkZjBu4Pf6zNe3UX4aAd/U+3Af7t5ckER9B1P8KF
 U78Vsz7dAhoDLVAiKIqjpL/4k9Mjt5mTQokzr1ZBr2FR
X-Google-Smtp-Source: ACHHUZ6CXnT0WPxl4FYp/k4qqBNQvCCWTxuAf5kTrU+0rjax35sGjlU7IXpnGAs+b68DIsoVnpxYAHJfYkEVz1vWONM=
X-Received: by 2002:a05:6870:e506:b0:1a2:7a03:4fe2 with SMTP id
 y6-20020a056870e50600b001a27a034fe2mr12726386oag.35.1686849161335; Thu, 15
 Jun 2023 10:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230614034936.876-1-machel@vivo.com>
 <5844e20e-843d-f65e-107a-8fd4cff48e32@gnuweeb.org>
In-Reply-To: <5844e20e-843d-f65e-107a-8fd4cff48e32@gnuweeb.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Jun 2023 13:12:29 -0400
Message-ID: <CADnq5_O-HmDpTbNnEAvtrFzFRHiBoDD+wfJM2kJ0rzT2PPb7+w@mail.gmail.com>
Subject: Re: [PATCH] amd/display/dc:remove repeating expression
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, opensource.kernel@vivo.com,
 Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, Wang Ming <machel@vivo.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Jun 14, 2023 at 1:36=E2=80=AFAM Ammar Faizi <ammarfaizi2@gnuweeb.or=
g> wrote:
>
> On 6/14/23 10:49 AM, Wang Ming wrote:
> > Identify issues that arise by using the tests/doubletest.cocci
> > semantic patch.Need to remove duplicate expression in if statement.
> >
> > Signed-off-by: Wang Ming <machel@vivo.com>
>
> Reviewed-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
>
> --
> Ammar Faizi
