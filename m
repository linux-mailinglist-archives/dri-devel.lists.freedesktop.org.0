Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 251064CC41E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 18:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565BC10E319;
	Thu,  3 Mar 2022 17:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689A410E319;
 Thu,  3 Mar 2022 17:39:05 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id bt3so5277194qtb.0;
 Thu, 03 Mar 2022 09:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PdHkhmgFrN18jtLLrdBiFbT8wL4tSQG37dtWwlBWtT0=;
 b=AQxJ7abEXO4r6/q3xXg/DERUZl1b4TYybcoUUTJC8Js8/5fhmdQ5uXCLPL8eXZ8N5E
 MKF88FwPSbRVjNucW0Lx6hrCwXoJEku5X+kiUQnGR0L3cRsH6oRbVE2Hsc3Ey8ISvK42
 l76kW9Q22MNaKG3nb3GXCQE83U9IBFtYTgkxDSoxCz4yU15aAFDz5n1ujdz9FN7GBoMl
 zlkcEtSOhHLfFMmJmcLwfc7LvCMlEIDt9uCkvj4+/LAsRhZneFyM7Juo01urVgjfit9c
 LfZ79xPIFhAOee3oz2eYObdFkeIFnbECawt0jruzWpRXrPvSj+UpvfjiDfxysgCZ1ogQ
 BJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PdHkhmgFrN18jtLLrdBiFbT8wL4tSQG37dtWwlBWtT0=;
 b=5y4fJ1GdMQ8TAaHD/MCEOt4xrB8mzpOFwY4Xy1qXly/8jOxC2NDUrtWZMRxIwWgGpV
 2SrmizekfbRR1ByRnUOFRmzHqZ454ze3MaW35fXMGp/5XOqGo8tILvWmJVWS6dYOxpKm
 tTzfipEdIgAz5Dt/SEJ6vP9jOTxacObCtu5uE1noZ9zprPqMZa5x5Y4fcYvqKR2SveO0
 CUzK5LXSu73vGMHQOieKRgFHxwpL1oOpaSCkchwourIMsey2wlKFM0NUbaYsuH7zbS9i
 fjGCZcpwzRTwA7069HKmu35Wa4eVPgSWIi4F2e6EjIqnJA4KOON71S9SyljJ5YyxAiUg
 465A==
X-Gm-Message-State: AOAM533tLhCjTNejl2NllsYBrBDXNtenUsEDUJPAoqODtasMEEkXsfdM
 Kss6Xsw6oeKTiYfLZR1FGhS7BwZwzzbOWGuf85o=
X-Google-Smtp-Source: ABdhPJxK6Q9LckANdymDGEhFpexGAWD8VrH4za7cu4VqNXVNFKYNXpMKTVswD2LIZ2eN+/4oH1eGM1UlwXkpw3xeKYQ=
X-Received: by 2002:ac8:7dc8:0:b0:2de:619:a73f with SMTP id
 c8-20020ac87dc8000000b002de0619a73fmr27765318qte.614.1646329144516; Thu, 03
 Mar 2022 09:39:04 -0800 (PST)
MIME-Version: 1.0
References: <20220302102200.158637-1-thomas.hellstrom@linux.intel.com>
 <20220302102200.158637-2-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220302102200.158637-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 3 Mar 2022 17:38:38 +0000
Message-ID: <CAM0jSHOqyma-ds=uxwSh8iE+fhS7e-8AWEc1-QoazekR=PY4SQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 1/3] drm/i915: Remove the vm open count
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Mar 2022 at 10:22, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> vms are not getting properly closed. Rather than fixing that,
> Remove the vm open count and instead rely on the vm refcount.
>
> The vm open count existed solely to break the strong references the
> vmas had on the vms. Now instead make those references weak and
> ensure vmas are destroyed when the vm is destroyed.
>
> Unfortunately if the vm destructor and the object destructor both
> wants to destroy a vma, that may lead to a race in that the vm
> destructor just unbinds the vma and leaves the actual vma destruction
> to the object destructor. However in order for the object destructor
> to ensure the vma is unbound it needs to grab the vm mutex. In order
> to keep the vm mutex alive until the object destructor is done with
> it, somewhat hackishly grab a vm_resv refcount that is released late
> in the vma destruction process, when the vm mutex is no longer needed.
>
> v2: Address review-comments from Niranjana
> - Clarify that the struct i915_address_space::skip_pte_rewrite is a hack =
and
>   should ideally be replaced in an upcoming patch.
> - Remove an unneeded continue in clear_vm_list and update comment.
>
> Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@int=
el.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel=
.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
