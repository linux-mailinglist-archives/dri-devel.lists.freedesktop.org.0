Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71C1A07C3F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 16:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F45F10EEC3;
	Thu,  9 Jan 2025 15:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="pCuNPDyn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF07210EEC3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 15:46:04 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-6dd43aa1558so9212386d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 07:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1736437564; x=1737042364;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PKZDZgwQw5DwdA0he+QO6w1IPSFJe7Dh+LI2SsNrZ0I=;
 b=pCuNPDynyrnBqSbFaTBjMoyViWNQHUtji67w+O5nYlvqRB9jxcpVyZ4OHZ93S9Tygt
 xeZ3gohLjvEFPKB3jrsSNr4tA1S0fAEFp7BKsq4R4oTkzL1xaZvyDeiYWmf3DTqLjIcV
 cwGk+kpZ/WYqKrvYEnjXVW1JFVuBug9HrWwgCRJPzcUztftDruZgg7eBSuVBkAIVBHbt
 xuKzc5FbiYjirslQ81IW1kKdrwT1DLioQMZUT1Oo+9kOtAJ4vlFW2Hbg31sTmv6umYss
 JMcHKwUO0Z7cFF4qWAL4nfzS+tVpLfOoeW2p/MqFrKdN3HphSSlrdn07NS9eg9SPzQOr
 Ze3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736437564; x=1737042364;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PKZDZgwQw5DwdA0he+QO6w1IPSFJe7Dh+LI2SsNrZ0I=;
 b=j7CXlcYvMkjElQnmkTtd7Hdx7s/pZlX1k8CAihDDeorW+CUmoPeetSDPGmotjZUQQW
 DSz2zIpDxKqA5JncYSUn7oue6ak3f3dyXDdkIkzbkzLI7qFU5qnczMvFku2/k7ggvezC
 sztQBvrz4nCQMROpAFx31CKuwLgotju0F/1+5eCYbV5x0D/25aQfCHTxsxS8BLFz/fbH
 JUd2BvU9ONWbyvMDfa2SZ7rIjsaCedVqcCXjcHcHN7fgShjBGWX9dg7h7iwW+EZjxTOB
 jB/y25Tw+VS8uHYN3KXA/OSjusBHqYw61wIyCORYaeIZXeV43dHL1zllOaseZxaA2L/I
 27Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK402C5b2vYFnIFc9BAy+pcSiYLh5CBLqpIvbhSZR+STfjsJW/1mjgNkApKFk9Gd8Rojc4B5aialo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcbZ+s1x4arGQ+8QzUVqDV7BRacv36T+Wi36e1hsVlnSUBDQfo
 JTqbew30n/Io5DHJ1ALrbm1akbDhZPJgfCj511YAQ/ojk+R2KwP9WnpE8hG8MLfFcH1LRNhEtws
 cOJdrx7STMfF6WfknH22+n0ED+aI0IJF6c0mI6w==
X-Gm-Gg: ASbGncsrEtpYpua3T5nHEw6CmftrJe7mE117by7Hkfp3AKZnYLsXjxHeuc8ELLnuQjI
 mpKcQXUAJOCnPYiNdtCkYCcKJqFr71IaCesg=
X-Google-Smtp-Source: AGHT+IHnibi+F7gIUmfaOZwxYN2DJuHzXNQ918KBNgHdD1U2r3nyKomQIgCyi9mJfPc9VS9YdA+1fD01HIUqhpF+sp8=
X-Received: by 2002:a05:6214:f6b:b0:6d8:7ed4:336a with SMTP id
 6a1803df08f44-6df9b2ad580mr127348616d6.31.1736437564144; Thu, 09 Jan 2025
 07:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20231010170746.617366-1-daniel.vetter@ffwll.ch>
 <20231011092051.640422-1-daniel.vetter@ffwll.ch>
 <edea5e48-2723-49ea-ad03-8cd3d9aa53b3@suse.de>
 <Z360aeAkou2OXMCg@phenom.ffwll.local>
 <f82df11f-97c4-4b6c-a139-90e20e0f2eb0@mailbox.org>
In-Reply-To: <f82df11f-97c4-4b6c-a139-90e20e0f2eb0@mailbox.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 9 Jan 2025 15:45:53 +0000
X-Gm-Features: AbW1kvaLgHuoRaSUsg1goVa-U9qYmN209ryD6UjPy-DWpkWJaScUbRRONeJacYE
Message-ID: <CAPj87rPQZk3uDu_Grmzyy_eK1ksoQSbtZorHM0unZE6vU0BVBw@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: clarify the rules around
 drm_atomic_state->allow_modeset
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Manasi Navare <navaremanasi@google.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>
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

Hi,

On Thu, 9 Jan 2025 at 15:30, Michel D=C3=A4nzer <michel.daenzer@mailbox.org=
> wrote:
> On 2025-01-08 18:22, Simona Vetter wrote:
> > Maybe I'm wrong, but my understanding is that English generally doesn't=
 do
> > compound words connected with dashes, you just line them up with spaces=
.
>
> I hope you don't mind me jumping in, three native German speakers discuss=
ing English grammar is merrier than just two. :)
>
> FWIW, LWN writes compound words with spaces when used as nouns ("code in =
user space"), with dashes when used as adjectives ("user-space code"). I do=
n't know if this is an official / general rule, I'm using it as a guideline=
 though.

To the extent that Australian counts as native English: yes, that's
exactly the rule.

Cheers,
Daniel
