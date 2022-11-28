Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDF363B5BB
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 00:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9B910E246;
	Mon, 28 Nov 2022 23:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB1E10E246;
 Mon, 28 Nov 2022 23:16:55 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id k2so8542394qkk.7;
 Mon, 28 Nov 2022 15:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Upw7lQqiVx/fr3nWphxIGp9C7tYgYrqcf0scuftCi8=;
 b=USh1anbVPA/RntHaxXkxsHBxj+Iqjt1j1HlESMZAgJjMYg9OfK1aXy9c0W6si3rt3c
 dSxAfBHFa/58DgzhbWA4uuE0KdVLzwF1BPiB9bRMhSwKEMQIaWbeZMOoDNK8K7UXiKEG
 49VQyfG8SzZDMpRDtTd1BYh5pj1f7J5m3IB5OIdZx05xikUoLetvPh3ugfYPmf0AD2cH
 QSLrY/4JQRgZ3enJzsHP9/WU6wiv6QQgCWWYEvi/sXBpyS1ZUflhWq/4B/G36NHRA0mm
 /ZW8jonYCEDzvOUPt2XkrTp4zb61daw/gWRSwql8M5tqaUZBt141596uEJC9NaQFYWAa
 rEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Upw7lQqiVx/fr3nWphxIGp9C7tYgYrqcf0scuftCi8=;
 b=qdBO9asPXjjl3Job3eXDVSMIH+i+uTsaGyfdJrRvUNWYc1RHrr/AOut2ohf9zmw2Gn
 8nnzPvgoiRlk0LNI688aZSP2xUVuoaQpr072s9IRPjk3a9lxRvwNq4ozBUajUY20IlqD
 488HJE2Q1C6G7bbneSXMthKgf3V9N0COS5Yg+5dIdg4ga93WPdkpX4DmdfuCYahRs2vS
 0t/UfnYlYmazdA4o752nMnGh52Jl5X1O9ayJeD7aES6s8PXYRXfYcHRJhpdPRam7JRSI
 MmOD7oi//l2IP6DxlahCyGtiyC5Zmwlv+3ElBcI8X20+HxsH8Us7Xb7zV07M1ykZJNAe
 2dmQ==
X-Gm-Message-State: ANoB5pkJuCQ0KtkrJTPwfQc+nKUF3vuUtju6Usp8IqOq8gJWazgC6bD3
 Rb31fjTRgCzoOWN8hsHePdrk4nE9KpRQMDa9YX0=
X-Google-Smtp-Source: AA0mqf7NB+x6ZWhWFLJtJLbEqe1OnV1EtsLih5NOSKOZcitPIEAvM6OcdXVpRA//4/NarOa8gxCnHCJopzzq+FbCqJM=
X-Received: by 2002:a05:620a:1313:b0:6fa:35d5:eb25 with SMTP id
 o19-20020a05620a131300b006fa35d5eb25mr47035704qkj.400.1669677414281; Mon, 28
 Nov 2022 15:16:54 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsOeQ7VYm98jRVaYp6KaNsFVsAnSb33ZT8JvZxcTcEGW0w@mail.gmail.com>
 <a67598e8-c826-2740-03bb-33d37c8c8e4b@amd.com>
 <CABXGCsNvFvJz4=N=JKYSGVcd=dKfQ3Nv_zOssMb0Z6oK79xZ7g@mail.gmail.com>
 <a537212d-4b42-4ba4-7707-1e397234c8b7@amd.com>
 <CABXGCsMCfACsJRDPqZDYQGMpaA_6LKhQ0XqAmDN04GSMeetXnA@mail.gmail.com>
 <ca6c98eb-fdb0-5fee-3925-5b697e3e6b50@gmail.com>
 <CABXGCsPJFvNXfbdR=_sb4gLdd2E30aRN9usSiZc2XYmZNSKBcQ@mail.gmail.com>
 <dc802bd0-ed77-d268-25e2-1cf162202912@gmail.com>
 <c5c4f572-4720-04ff-3c70-30bba9c37202@amd.com>
 <CABXGCsMW7+dWU0S8ePUygWkkvmLBiHU8gSBKZcSMsBCE_gv4Ew@mail.gmail.com>
 <dcf71c8d-aab1-e1ab-72ad-6822a7450257@amd.com>
In-Reply-To: <dcf71c8d-aab1-e1ab-72ad-6822a7450257@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 29 Nov 2022 04:16:43 +0500
Message-ID: <CABXGCsNsY+iK8F9oecO5xTDcRPaBUZJ2S0C=8qiRCcaVjdriAA@mail.gmail.com>
Subject: Re: [6.1][regression] after commit
 dd80d9c8eecac8c516da5b240d01a35660ba6cb6
 some games (Cyberpunk 2077, Forza Horizon 4/5) hang at start
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 22, 2022 at 12:16 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Ah, thanks a lot for this. I've already pushed the patches into our
> internal branch, but getting this confirmation is still great!
>
> This was quite some fundamental bug in the handling and I hope to get
> this completely reworked at some point since it is currently only mitigat=
ed.

Looks like the final version of this patch successfully merged in 6.1-rc7.
Big thanks, all games work again!

> No idea what that could be. Modesetting is not something I work on.
>
> The best advice I can give you is to maybe ping Harry and our other
> display people, they should know that stuff better than I do.

Unfortunately Harry didn't answer. I hope my email wasn't marked as spam.

--=20
Best Regards,
Mike Gavrilov.
